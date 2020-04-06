public RefreshTeams()
{
	new systime = get_systime();
	
	if(systime >= last_teamcheck)
	{
		new ctalive, talive, ctall, tall, alive;
		
		for(new i = 1; i <= maxplayers; i++)
		{
			if(!is_user_connected(i))
				continue;
				
			alive = is_user_alive(i);
			
			switch(cs_get_user_team(i))
			{
				case CS_TEAM_CT:
				{
					if(alive)
						ctalive++;
						
					ctall++;
				}
				case CS_TEAM_T:
				{
					if(alive)
						talive++;
						
					tall++;
				}
			}
		}
		
		if(ctalive * 2 <= ctall)
			ct_showdead = 1;
			
		if(talive * 2 <= tall)
			t_showdead = 1;
			
		last_teamcheck = systime + 1;
	}
}

public TaskSpec(id)
{
	id -= TASK_SPEC;
	
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
