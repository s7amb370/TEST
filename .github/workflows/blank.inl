public TaskSpec(id)
{
	id -= TASK_SPEC;
	if(!is_user_connected(id_iuser2))
{
    return
}
	new id_iuser2 = id_spectator[id];
	new CsTeams:team = id_iuser2 == 0 ? old_team[id] : cs_get_user_team(id_iuser2);
	
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
