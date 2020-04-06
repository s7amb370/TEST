public TaskSpec(id)
	
        new CsTeams:team = id_iuser2 == 0 ? old_team[id] : is_user_connected(id_user2) ? cs_get_user_team(id_iuser2) : old_team[id];
	
	if((id_iuser2 && team == CS_TEAM_CT) || (!id_iuser2 && team == CS_TEAM_T))
	{
		fix_score_team(id, "TERRORIST");
		send_ScoreAttrib(id, t_showdead);
	}
	else if((id_iuser2 && team == CS_TEAM_T) || (!id_iuser2 && team == CS_TEAM_CT))
	{
		fix_score_team(id, "CT");
		send_ScoreAttrib(id, ct_showdead);
	}
	else
	{
		fix_score_team(id, "TERRORIST");
		send_ScoreAttrib(id, t_showdead);
	}
}
