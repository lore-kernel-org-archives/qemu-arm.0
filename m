Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF7ECA0EED
	for <qemu-arm@archiver.kernel.org>; Sat, 23 Aug 2025 13:01:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1upnqu-0004Uj-UJ; Sat, 23 Aug 2025 09:00:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9330fceaa0=rayxu@ciena.com>)
 id 1upnqs-0004Sp-6K
 for qemu-arm@nongnu.org; Sat, 23 Aug 2025 09:00:10 -0400
Received: from mx0a-00103a01.pphosted.com ([67.231.144.234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9330fceaa0=rayxu@ciena.com>)
 id 1upnqq-00042v-52
 for qemu-arm@nongnu.org; Sat, 23 Aug 2025 09:00:09 -0400
Received: from pps.filterd (m0174892.ppops.net [127.0.0.1])
 by mx0a-00103a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57N8llqU024040
 for <qemu-arm@nongnu.org>; Sat, 23 Aug 2025 09:00:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ciena.com; h=
 content-type:date:from:message-id:mime-version:subject:to; s=
 06252019; bh=hlfZVapEPZt/X2ukIUeiD8FOS/6qtj795n//zQX5PlU=; b=jJc
 q8bVZfvfI1PxTOmWSKqY4QwPlCBkimrC+vxDO/wqAxH12tM1/xyTVKtCLbo1MJEb
 N3HlIf7PPE7lQY1tCbwzRdmHJXqJWElsCfDrD4GIKSTZxKNPzqyJtxacfp0lO9gU
 1LLg4R7Y5fP5tE71vv4/GdTa1NxDPQrVL538G0rDiCxGvMewtQJDX8qjJq1WxO2+
 Bc/XH7pYDCd7m4UifJlDmyVP+ssPDhibGtRYO1cZPTRaVF9xoSPg0PPrmgQmIaY7
 mJHBs/ptzKiHIgfK8cWiFkIm0P9ZwPOagOiwdu218P7uayDEaWv7sMmpIODcNE7J
 KgaJAQTibZghZFIzuAg==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by mx0a-00103a01.pphosted.com (PPS) with ESMTPS id 48qacyr9k7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-arm@nongnu.org>; Sat, 23 Aug 2025 09:00:02 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrX7xgm1h7S0TZshbjziG43pwH1OdvGzltT7lyntb6xUlE58liBGZrivCLYxcq9zNMXQyOkN/c4QlUVuQ/zXPsu56X2NDWd8uC+T9ROgZnUyPFINcZoK/mnWhdec8tPElDYHsS8k8svQYGve0vDMhaMhw+OmTr5VuGzfFu//cNwUDlvof64CTWS7gZV6PJlA3cCf1Ih+u1lFcZNeJqXEIjsO5FE5JUvyObyymA2qdKEfRlxgUt1g76rGmUiSllXnBays1gC/oYHw6oJSmGj6SpaFShTzxY0itIui2uy/1Ml2LOoxOK7CnplslG/7UdKw8/11pgTaP9dn7Fhgt9+xyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlfZVapEPZt/X2ukIUeiD8FOS/6qtj795n//zQX5PlU=;
 b=yWSFoMB2pYVQjiL7MpoHqIiR/E1xZxaMx/3+JPEKatFkIepHuPBIxhagEG3Vk1iJEEfUHHRDDqVJW1TgqRPCLq9ImQ227cl8/429lPqO07TO8ZM6XYF29zl9sjuCkxDEYMg+TOBQPRWyaVSEAFlqN3VKwSpawbSbLncuY9xEDvvauQ3LeErDBxHGqO3by6jTwKXAPIBqP7mEE4JRsPv0+vwrqxQZu5wTEyQGAiO09tNr8lqqyA+7/q228vacQBbMZeBzZMhoXp+HQoLfhQT8FyIIHtlxuRdbAFAiWEShrtCVRH9RELSVW9FMAGOU2blczoKZmThoye8QzlEJo7McQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ciena.com; dmarc=pass action=none header.from=ciena.com;
 dkim=pass header.d=ciena.com; arc=none
Received: from DS0PR04MB8763.namprd04.prod.outlook.com (2603:10b6:8:129::7) by
 CO1PR04MB9604.namprd04.prod.outlook.com (2603:10b6:303:271::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Sat, 23 Aug
 2025 13:00:00 +0000
Received: from DS0PR04MB8763.namprd04.prod.outlook.com
 ([fe80::e749:f521:b73f:3491]) by DS0PR04MB8763.namprd04.prod.outlook.com
 ([fe80::e749:f521:b73f:3491%3]) with mapi id 15.20.9052.017; Sat, 23 Aug 2025
 12:59:59 +0000
From: "Xu, Ray" <rayxu@ciena.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: QEMU support for ADuCM410
Thread-Topic: QEMU support for ADuCM410
Thread-Index: AdwULZYLLai9d//fQLqN3OFuAiaLcg==
Date: Sat, 23 Aug 2025 12:59:59 +0000
Message-ID: <DS0PR04MB87634601F096F576941738DFB23CA@DS0PR04MB8763.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: 64e4ffcc-1d07-4e0b-89b2-357f58e2ae65
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR04MB8763:EE_|CO1PR04MB9604:EE_
x-ms-office365-filtering-correlation-id: bcfead6c-2e8c-4ecb-696f-08dde244f7ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|8096899003; 
x-microsoft-antispam-message-info: =?us-ascii?Q?UqdBgxc1rjFxMQ683lwUQ7WRHWXQo6DsFdDx79DWFcTQ5hpVMHYa6qux0Fym?=
 =?us-ascii?Q?1mdt7A1ZvT81uezOo4XqOuAgAohSmiiKmbE+u3cvaxnfaSVjvVmhr3Gi/07B?=
 =?us-ascii?Q?Yu4ZrsbnsvJdQwylXP3BmNf1edwtPPZ+5ZLNtKafcRvArXSDUK3lBzTZhmsE?=
 =?us-ascii?Q?Yey0HXMsPRPadVHp0lhbyMA7y5gf0xaJC6thlzSu0NGxt2PRi8RgB6vfshkf?=
 =?us-ascii?Q?Ru1WWEkayV672BRt+ntAaTn20dY5bOXX/lof1rFL77AcpBVCdnhurjBhnxML?=
 =?us-ascii?Q?FM4xEeW8dTmz8el3AoOi/jAFwc8rzlyQ0ZiM8ULbfFOjJgFLZ9rzHs0va6Y7?=
 =?us-ascii?Q?t2I0rgqtWnNADkdowL7BH0KvDA+O5vBtRj/tcC3g5ZbQoA31uI8pI2PcT/XR?=
 =?us-ascii?Q?TGrL7ffAFoVKHRXsXAp7e91lC/IaqEwEVMpBm/epkW9xSIT0swr2XpGrW0I0?=
 =?us-ascii?Q?8KehelKgSuYkQLncL3Z6xjPd6eRCNQAYNrLhdzH3hSeIJgBvB+WNMAyUMXtm?=
 =?us-ascii?Q?IKFYXUdi6AuT4Qgl3LTFCR/hjTMGz9lgVSm03ywk3CBkK93iBhO06Qck15wi?=
 =?us-ascii?Q?xV+cJ+ReRp0r/p6e5Cps6Dqr5NJehIw60spP/3uVfrzlPuWYyPLzdyeDUGqI?=
 =?us-ascii?Q?E9reNOuV0ZCn2ZxChzJISdKdxHGUpt6cLbSct54DwjUkf/VL8UU/1P+tHL+Q?=
 =?us-ascii?Q?J7s2+28a4cAh2/S4clOuwSqaRyvoqfBCDuLOX2g7foAQQZjqLQ6OEAnV5XZ3?=
 =?us-ascii?Q?S++Xc44MBk24hGHwtdZEhc0UhlQs3kCSZBSp53g6KJNaoeo5STcselK6Y6se?=
 =?us-ascii?Q?pBEKlaxvNMB2vOUYa0Nfd0QxPN+/EvuieTKJtfKsdh+LNiqC2zorCP3YrzkH?=
 =?us-ascii?Q?KLFXZJdxVWYklW/YQ/dPrckhFb00HGT9I8k4SY42cLVjROeahnsMHukSc3FU?=
 =?us-ascii?Q?edsCLaclFdAeB7eQIHV0ILo6LKnXsNZ723Fes1hTrF7xwXRfcYFy58Qd0nyW?=
 =?us-ascii?Q?7kveOZedFUiLCiP7+CYPEhL46ZSGT60J7Au0xaJt35q1UFf/7qY7HD32Vk0R?=
 =?us-ascii?Q?ADe4hv6f/0qPZyoo9NwWfGmd1AEQZxvgZLwfWFUh4aqNfFEjPyjBj6efrn+R?=
 =?us-ascii?Q?PtqhKeYOB+N9tFFiLiFJJWocmOPyDpVMNib2sLNI63ypQNY8xxs1gMueVRjJ?=
 =?us-ascii?Q?bJduMoTATDhzOXK/vjcXcKaOLAK/eOf+ydYFrPXobENpyAdc20f8g8oXTB6i?=
 =?us-ascii?Q?lfLZS6/10KjeBxzMmz1DTYb214TXewBvJeuvqE2Js00fBgZV7SeCMomqhnv5?=
 =?us-ascii?Q?+18I4DLyCGZaltiqpErq8iUWz5XxCyuqOSLAfIOPPVbXfo60wWuB2WvYvAjH?=
 =?us-ascii?Q?2h8IT0k/8cyLcpEEhNaUjdbBNJ5ADiYakUaCScKeVgCJjFqSASGRP1tQKhp2?=
 =?us-ascii?Q?iYT+AytobX/lZi4Zklys5vhc+b+OoOGvlOed3d5+pw6+OnK4t7jc/g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR04MB8763.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(8096899003); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tKTn+BCbR6nwZXxnF89kyvg8brmLA47sWJyVLxkuLTRvbzaUOtEW6zr2gVpW?=
 =?us-ascii?Q?v2r47TF6BwimPF3t6cOnDyADg4mH8GMs7CrHMwjUTrpG2/fmjcV/1eZnDx0d?=
 =?us-ascii?Q?tofuIrXeZ/uTU6puTz1Nmu7hUpxar6XMnxUv723VB02UA6+4CJLvs5Nr/Byl?=
 =?us-ascii?Q?qvKKWiLuS28Hguz4o+MSII/EFsmrmhd06Iu7SeeQ4NEZdovAMnas/0IDYZ9F?=
 =?us-ascii?Q?e8OtypFRvtOy4F2jxwaz8hyFf+ko+YgtUppLRLsVta57I9tkY+czVPwJmr7b?=
 =?us-ascii?Q?oCEzfnwplu31w6ar+/MzWFhUd4Op9eY4k4KungaL+7wQp11Vj9sUcTVhjJhe?=
 =?us-ascii?Q?z5Z2pj2XLWarJjp/AOK4Y0ohlI/4XKIf82dOB/H4j28qiygx3L20s3Vm85ns?=
 =?us-ascii?Q?hSzlYt1pwN9HSOKNQLJLLO9NZJgFqtV1P0oPbb5QBk/dRZDCXX4WvvURPSeF?=
 =?us-ascii?Q?h1MEftswlIT2TPVq8NVd0yTpWiVBOpkU1xAZOIRT0e6xx7U8ustHVPd9XXn2?=
 =?us-ascii?Q?slIKHn7cZuJSa7/xUwG892sZya5UiZ1K2vD4CFT73V050HVIUJKshT4zMTZI?=
 =?us-ascii?Q?WoqFKhKb1BwZuoC4WPvIJe6EF03GYZkKBhJAgG7f3BUMPhp/pQ/zsV2yi/Wd?=
 =?us-ascii?Q?ZcqXteBnWdLfP0vvO/5d/rpg39mqJcidCDhBz8QjwpNnfW/fkuM5e6a6Gw+G?=
 =?us-ascii?Q?M3Xe2IfoZB2uhzmJ3vyShuBJGUW/y/Dbs3LGphUcaPnOiwnVwIXIeIP2LQJ6?=
 =?us-ascii?Q?D7aj2ofXXqEfYXV4ZxG9wXGK91OZ4cCebx/wHtGphtpMq4CGJqHPdOKFPu7J?=
 =?us-ascii?Q?Hk/MptXIGDfPg7nysLFAWtGmsoercRx6zjyTocC9ArHbLSOe8YQsPxTMNiNS?=
 =?us-ascii?Q?PBmRYSKPyfIg86L0zlGlRxK3k6uE4TcUyV9OTDk+XrSYrap5u5H1ppZDI89d?=
 =?us-ascii?Q?OTUCrWhOKJJt5anPW9IkI17EoTq1xR0B0tR7wY4HwSm6yUxJgAjdQiDLTUD8?=
 =?us-ascii?Q?IT0cUfNrDoT0K+q3xVBQaXuNjYlkx415HlPGyoJv2Untru5mJq5cZoC6dsRm?=
 =?us-ascii?Q?kkcu1m6qNdgYNDh5G6kkgmw72H52oYoCfBNKMsvv54JSlM2d6YWFfuZP0D6G?=
 =?us-ascii?Q?0ATYeMX3R4Z4Olc02c9TyTF6iJLsgoz0s/CSdRoWTH4nqLRJp6sT32W2eY05?=
 =?us-ascii?Q?6AWHVIFLWoIlnMeyUe8E8/XAcD8oW4JVcVwe5VSma7S+Y/FD73eT2XqWQGUq?=
 =?us-ascii?Q?S24IQyyvVB2Oug6VTrg0g5KHy4TEEy6ExKkSbFumNwq4JhDMyLnplC/sAWLn?=
 =?us-ascii?Q?lLMi/k2haTzhfwj8G7BBeHV5DHx9zoDSLDtE0zM+Fu/Tt7duMOo6Ko6Ug+HI?=
 =?us-ascii?Q?mk/mOhA2LwSvmjWOOuTZQJwVk2i9V2f0kfAPgc9/Cas3fV7Dj4SHorF9ChEM?=
 =?us-ascii?Q?MqpKvYSt7+dEUkIX+57l6uyCMnQSFpG3U2P5j+cZAFWvwk0Fg45SyD8+LId3?=
 =?us-ascii?Q?tQogjzuo9qUn9EX2uTd+xh5GW5ZOXG1vwjpbIqLicYhejgrhOoEte+KSCf4j?=
 =?us-ascii?Q?ft31g6B8olszQLmBG4M=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DS0PR04MB87634601F096F576941738DFB23CADS0PR04MB8763namp_"
MIME-Version: 1.0
X-OriginatorOrg: ciena.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR04MB8763.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcfead6c-2e8c-4ecb-696f-08dde244f7ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2025 12:59:59.7014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 457a2b01-0019-42ba-a449-45f99e96b60a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g8zK8h/AA49ikjKUZveLhYqzu3WoxaEiKGNEz9CMgDxfPNDR29782I4ZOhIIQnOX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB9604
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDEyOSBTYWx0ZWRfX1zuaR/0DElRx
 1TBmI9TRqtBNdduiSd9E+clPHhCPzQs8UccuHzeK21Vgn08WKo29DztT6ehHr2RQDsR31mAPG5t
 qUc0+0txYpDdFWj7G+7T3dYPS9E93nD30gdvfCoskHHc286x/oiJ235OuuPJBUofmPlf0DwsBqQ
 fl4ZU5g55KcCZjOjXEtXKsXddICVWbNLXQ84mOCZi2HpKdWUYwt3wXoCNUkDeb0HhMNAktyyv5Q
 5UEuseQPl/RSpSPyQDs+4R7U5dltKraAIw48+9uqxqpg9DSHf5hVMmfxzlsoDHgexelJ1uzxoFR
 5vGR8fIYy/NB3kSp4F/S9VixmTjBiXU7D/NZxaqxE7oiXksjam1BLi2dGc9sU0LrlWOxYVa+MBi
 SYk0BVW220hK3KKM3Lh8nlyJ9eplQShxkQ7DYe+1e3K6ApMidHpA7V9xUGxSR/ygJ9iy5uif
X-Proofpoint-ORIG-GUID: ufgYE0BVBHJCBFKXr7XgqbvE764XrE5W
X-Authority-Analysis: v=2.4 cv=BK+zrEQG c=1 sm=1 tr=0 ts=68a9bb52 cx=c_pps
 a=TYblChEjXdO7wzn6qzPPXQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=1V2vW6l1mClkiJxnx6AA:9 a=CjuIK1q_8ugA:10
 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=WpYc915QTyhflROngfYA:9 a=gKO2Hq4RSVkA:10
 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
X-Proofpoint-GUID: ufgYE0BVBHJCBFKXr7XgqbvE764XrE5W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_05,2025-08-20_03,2025-03-28_01
Received-SPF: pass client-ip=67.231.144.234;
 envelope-from=prvs=9330fceaa0=rayxu@ciena.com; helo=mx0a-00103a01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--_000_DS0PR04MB87634601F096F576941738DFB23CADS0PR04MB8763namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I'd like to know if anyone has worked on the QEMU emulation support for Ana=
log Devices ADuCM410 system which is Cortex-M33 based?

Cheers.
Ray

--_000_DS0PR04MB87634601F096F576941738DFB23CADS0PR04MB8763namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;d like to know if anyone has worked on the Q=
EMU emulation support for Analog Devices ADuCM410 system which is Cortex-M3=
3 based?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Cheers.<o:p></o:p></p>
<p class=3D"MsoNormal">Ray<o:p></o:p></p>
</div>
</body>
</html>

--_000_DS0PR04MB87634601F096F576941738DFB23CADS0PR04MB8763namp_--

