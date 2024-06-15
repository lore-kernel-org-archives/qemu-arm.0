Received: by 2002:a17:906:18aa:b0:a6f:6ed6:9beb with SMTP id c10csp674300ejf;
        Sat, 15 Jun 2024 11:56:42 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCX797PA4vn4YPuVhFF47EjsBN8qwwpFbtr6XGUlXE0KE7ix6U+xOUsZEVoVNYgcdBkcjY3T7szkAWe/M0FNg3emwnUqn5Wx
X-Google-Smtp-Source: AGHT+IHYJoVlOXI7zQ5H1DIEBAw2exVArM4qj7dTK3hNnvOT77b/S8UZ4t0K2l1ziRTx/SSc2Eip
X-Received: by 2002:a05:620a:2993:b0:798:1020:dd5b with SMTP id af79cd13be357-798d242f625mr680121985a.46.1718477802068;
        Sat, 15 Jun 2024 11:56:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1718477802; cv=pass;
        d=google.com; s=arc-20160816;
        b=NZ4Lk8wAm8zLjTMdNg9hVZ7QWZV3dR6QbE+KTVLjVpB2YtwYDseBWi8h/uYBHRjYVK
         urtpOoOMMOiB7Q4A1LF2wyfQy7gr+J3vJnKmWeBJ1xDFRs1C6fPCCSNvLreY/LsVpD5V
         cIrAeHrhu2jDDikPembAmEwYvw1T9bEpQahJa3DuUBBAsoWx5HHdSt5dC4CBKWtzl5Dz
         cIwEkgkeMbJkoutHTwqw83qPp0tzdn2BbKkUMtcSgD+znQgUQLQoYMK3T47D7VHqOvXh
         o3fr1lEUygYi+qEb5DM/kFRYY2nJFPt7UfLLETPKM0cxRAHjAPVE+L2I4gWhvG0Dsi4G
         9vFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=dlJSt41gKHiEWb27Af6G6WBrPYOCMEPeGXr67enevB4=;
        fh=D2ZM5oZynQf8IGWUrgxM+r+6qvTzm7e6XbJg4tGmwJE=;
        b=NKFT0xemiEC47v237pnF6rBpUR7JCi49ccH4vmADjBU6gfUkx7fhheMJ/rTSn7NVH1
         vgSo3mhsj6K+xih/X2dSafVa71KhD5OQfBUoSqfqFK/tMMYTsDSSlwNlPMvItwQUFxuP
         5gnfxcEq6oum9r5Izq+3IYqfC+kiUDsrrT/OANfc7oMOxCzzS7ydivxPnhP7eQZKD7Xn
         x7OlcwHvR7BqH81ojABRtWXGcdcx4lH2ERz/Of95kD0+dgNZL/M6Wtx9YRWxr/Xm3XVM
         +4R2nDpWNRo72CntJBkcAineFbfXFvrif0xWxQpKo/XPcoFd7SzitoKxYjyX9IxNgqAn
         8A/w==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@provenrun.com header.s=selector1 header.b=eqBSdkPT;
       arc=pass (i=1 spf=pass spfdomain=provenrun.com dkim=pass dkdomain=provenrun.com dmarc=pass fromdomain=provenrun.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=provenrun.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798abe539adsi510634585a.540.2024.06.15.11.56.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Jun 2024 11:56:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@provenrun.com header.s=selector1 header.b=eqBSdkPT;
       arc=pass (i=1 spf=pass spfdomain=provenrun.com dkim=pass dkdomain=provenrun.com dmarc=pass fromdomain=provenrun.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=provenrun.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sIYZV-00019u-1E; Sat, 15 Jun 2024 14:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <florian.lugou@provenrun.com>)
 id 1sIYZR-00014s-Th; Sat, 15 Jun 2024 14:56:14 -0400
Received: from mail-mr2fra01on20715.outbound.protection.outlook.com
 ([2a01:111:f403:261c::715]
 helo=FRA01-MR2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <florian.lugou@provenrun.com>)
 id 1sIYZQ-00076c-Ac; Sat, 15 Jun 2024 14:56:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9bDZVZsukwDycHc0WTXcrcUWkOpo4xau2KgBAeibwPhvunOYZ+NDTljRLECIO1mByQT74J1oGfPJQMLmVfr3A3AF1DyzK6fpHoeaBEbqe9+YnqFJOEZkamOt3oOEtXEj0eXJdhCk3htEzTruNYMJOELONCUZkCy1QvKKvuYLRVkJtuozXC5IqjIE1hZmyBkyL/LKcDZOhB9YEbZ8jsUeXaWFi1vkfvF9RU/IuO5I7cslpmji0Rkb5P9BuvDTo9CtUziv3y6+1Z3Ogy4XdGlx7oLGZS7f9NTMTvF8mLF12PPO/L4LT30zjGPLsv7CIC1/BGtGzoiKz86NCGZxu7Fvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlJSt41gKHiEWb27Af6G6WBrPYOCMEPeGXr67enevB4=;
 b=alJDlejTxtTbm0MKQ+6vx+LFUHpt4/kw3x6VJenZycVzWiRWIKzIfriyDHo+Esqs+n3Kr2u6DrapRUphqGxOE9IQi08FqS1SIow6jfEZAJ6sTihZa0wKnArksfofrHqNMPaUQwe3TKAheT6taK+brpNcOeGuCnuDROpT8kpaO0fk+uJwRAnfNIhyuocLNXhWQhBLznONzoriVfY6RSuxLISU/KQ0+Sd2IQMlEre5fEyx0aPnf8aLN163ytAYQc14OYzKRhj53ulD4+TYxGecwm8zL70o2BW+ZYkxtVvBYS6ROpv3kouvE0ogcjVtJgKMNhwfQigqzkL3UfhTc9G3XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=provenrun.com; dmarc=pass action=none
 header.from=provenrun.com; dkim=pass header.d=provenrun.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=provenrun.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlJSt41gKHiEWb27Af6G6WBrPYOCMEPeGXr67enevB4=;
 b=eqBSdkPTlAU6MwFyC2GQRACERg1VPvC8JBBksMjXXtjcFszoNifrD1IdTmukjwhq986fyPOrmmp1EXtuhOGTvAaRby1r8pURfUvcirThTrsoPzZ9zaE/OewMUvvpMYq/x6GGjSlEbUvKwTLkNrLyy21mQvSbDRrZtZrxcb5dxsATa7LE3yEJLpshFHZg2Nn84rjmPkq5iZv/Zs/ScrC5qXswfXetqaHCn1b0YPDD8c3ylhW7CuQk/PAhXinmYyyBy8zRnsZbRyrGM4VZSFMT7FDoJLvcvxcjTCFLRCZPyRs73sfif7eiVXQl9A1Rg6woQH9DQ1Y+VGRycb7SFFJwAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=provenrun.com;
Received: from PAZP264MB2990.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f2::18)
 by MR1P264MB2210.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:15::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.29; Sat, 15 Jun
 2024 18:56:06 +0000
Received: from PAZP264MB2990.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ef1:e8a1:244f:3ca7]) by PAZP264MB2990.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ef1:e8a1:244f:3ca7%3]) with mapi id 15.20.7677.029; Sat, 15 Jun 2024
 18:56:06 +0000
From: Florian Lugou <florian.lugou@provenrun.com>
To: qemu-devel@nongnu.org
Cc: Florian Lugou <florian.lugou@provenrun.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH] target/arm/helper: Fix timer interrupt masking when
 HCR_EL2.E2H == 0
Date: Sat, 15 Jun 2024 20:54:23 +0200
Message-Id: <20240615185423.49474-1-florian.lugou@provenrun.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0599.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::11) To PAZP264MB2990.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f2::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAZP264MB2990:EE_|MR1P264MB2210:EE_
X-MS-Office365-Filtering-Correlation-Id: 4203f982-1c07-44bd-3a47-08dc8d6ccfe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|52116011|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R43vBvovqQppDXiUGnsWH8ebQgqf68CYyUZW0dGuhV6+3zqF+G5HMHaWVnzi?=
 =?us-ascii?Q?2Rd3QoeF/W5IXWTR0k3JiAQrgVmz7lM7ru6t/lG6DnJnEe4MDG7IRvX2zd5n?=
 =?us-ascii?Q?RhUhRauE558ou9+jNnSyvMdHDqwD3ESikC4VDtzW2XmBcS+y7OSAPHaKi5sj?=
 =?us-ascii?Q?Ha98uI2yJ0TmOAKj+Hnb+1GHVeq4kAmjBfEDqmyGcNmsOY1vxb7FA0OzFvC9?=
 =?us-ascii?Q?pTdPHkKkzUJ6bBXGvViXQ4apWsi4oD7D2ZesGJAatkmKICmptBQhZ8hFn33F?=
 =?us-ascii?Q?pFXT6OnPRPefYRqZ0yKbjHIbulJpiYWdUDYcE5L9YBUruzxSEUTypvTkl6IV?=
 =?us-ascii?Q?Ek+nhkCIBZNzmYjHHVwY7dc5viz+3p8jM9c0T49ouyTbfXtpf0oA9/90/Fl8?=
 =?us-ascii?Q?Dk5OaBqSfz6f8hi8uvTOQ4E61LwWzK+46FgtwVfnTG5pRDlYv02Oj+1eaQ8G?=
 =?us-ascii?Q?FzpnA8+7rhb6zm0ABuAEyetldD61UahAspQWvITbZ4A24ovS1pM7Z1qXMKgi?=
 =?us-ascii?Q?czB3bCQhcQDEo/HxlRLwPO2ThtRyGLYHJue1mVTG8qHnXbekbg7Rxg8GsbhC?=
 =?us-ascii?Q?Z4i7evRt2UvK+5DyEP90wQYul36tzB1yq7NwZR4IvHL/s2WJ8WA11zZtHuGp?=
 =?us-ascii?Q?+NcEsjSZOnGsmjstud1WyoOWyic1002vxlGL1NH/xfqBMBClrG8JhrYBU/hr?=
 =?us-ascii?Q?fyulCTYEnMxN11pJOmbKyl8xFcfB3AEHGM1UVhsPMiWt6AwC+4AROzh4ysMW?=
 =?us-ascii?Q?orCKo/PuAXFFsRLGVkDCGmeUu0wsCqxf5FCy+wyhdNUcE3ZeIomklYAOvVt/?=
 =?us-ascii?Q?c2RZeZybrQsvJhlz9QyRBCote+ZuV63mA+dhr1b4VRSYo0D88AvN0GPqS2iG?=
 =?us-ascii?Q?D7nivOHPMTSUSkIeZaVgty+xiJXvMYY0qIfhna3yhPWC8DPjsH8706wbs8pO?=
 =?us-ascii?Q?5c5wIhke+f7WgHvqDWt1rRh8F25KWKXxgeyb9RJWKaGPghtflzBakwOJL7IU?=
 =?us-ascii?Q?Llwiu5MhxseM5oxlGyB1KRhrO2DtiRR+wajZ8a+EBkI9d9GPC0TegvJLgqBm?=
 =?us-ascii?Q?4ybeQan88KgxWL3qQdYi1i4nOTkCGxHQ5j/mHf1L0hPmA6yy7Sj3M+oe/p7k?=
 =?us-ascii?Q?k0zcayQVAxoUM7hPPoDGFjuhKhGzWkXGBrG83gtHSSvRZyqlGfRCttNZm+lR?=
 =?us-ascii?Q?nn7D4fNmBbwxIp49os38mY7KbxDa8cIDzHD9yqC6ydKd2Q4ENgFeYYinGe/t?=
 =?us-ascii?Q?fny/6sQXm09Y2oBer184yLkFjNdcdIPkAgtuPeKoZ/Gy/vIFtYeMHkIa6e7y?=
 =?us-ascii?Q?ub8NxREcfpw5jkpLsYtNe1wB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB2990.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(52116011)(376011)(1800799021); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oCP6CVuiDkZ6sjCvF2Sa//DtjBEY2voWHwNdywi8w2iI7NZBMPX49uumtgVZ?=
 =?us-ascii?Q?VGDJOudzj2pHiuiH+sIitQJt4jH9XFY+sibFwUT7MSjopY1WGDHB1aaJOzgh?=
 =?us-ascii?Q?LeuL6KvAxtN/vE3QmRmhITVdDbOhY7ij1WNM93/HNN8B8vF5m+4CjhKOvo86?=
 =?us-ascii?Q?LrszQ3C/PBdzemfU0EDqucvbSuYfMNRPgMbcssbVfR0fdhLUBvA68r1GTB9e?=
 =?us-ascii?Q?dhlWFFwYTdkVJ79KsRU61/1RnHvqzwHA3M3BFGUKGjB2O3Ln/ADv2zEQ4UQx?=
 =?us-ascii?Q?LuvyL+qTlfxUeOwdAV5wavygaNnKIbTzP+GKukHupCzWStXkMIxjvtSd4i64?=
 =?us-ascii?Q?muLioSCncm1YW7+bZZqh8gGUZqvpCJMsB8bHT3Fz0HXPLD/MsOSgu0oqM7MH?=
 =?us-ascii?Q?3CjxBFk0NYBHSeEYIkjmfvc3IoLt1BsYSOy/iaEw8IrB14iHVQ8iFAwKlZAH?=
 =?us-ascii?Q?WLsM29Ha95YoEdQwUPCXYN0uuj3z1vSL9e6o2BZXYvh5FbqLl/m7XjsSbIEk?=
 =?us-ascii?Q?CFuyVm7VsyG278mXGz3ieCUx3faeUT+AJKGGqJXKEv0YmehWsLggaaV87HK1?=
 =?us-ascii?Q?hK3GZ6vXSkqbWqjVxPsMo3YpnWY1TWefHeBmbxYjQsyLwFAkSiCJb7DfD2LQ?=
 =?us-ascii?Q?GPj2PrGS2vZ1L9GJdWyYrWgjVem2S3hltZPRFlLooqDeYy8YGFAX9Co9MC5w?=
 =?us-ascii?Q?PJs9CWCW7WwKIaDs6ydj+zJeJ7WSJOCA8xVk5sARvl7I21kerMFfCpI5V98V?=
 =?us-ascii?Q?FlJligpXnxWzR8EH3VckeyxeGKoTKX8zVSUodeff1fbaAbjQYYQpHTTZNqF3?=
 =?us-ascii?Q?lZCwzvqwFQn5bDWKNDUS1XXXbEcq1ZO3fEHjnoG1X7f1Qw7hhGubS+IjegrM?=
 =?us-ascii?Q?18EJ5iy+gpsZpqvktzk9H40RJDLPW5juDISSveQdgGsSAKEX9rLv8YRBH0xH?=
 =?us-ascii?Q?z1qPGdR5L5i4XhTh1OVtBLLsmq1UGIRVa+25+k4cbBmNTqHhmOohfTbxnIS+?=
 =?us-ascii?Q?8XACM9h4Veu7BXE+w+uAs/+ej7ezUwmvt43FIPWg+hpb5SMDoE069sbxptbc?=
 =?us-ascii?Q?R1ZEy3JB8fDI03mqmkEoKlfLsRDgp0GABf8yrqdtt8W0O8klHZccLLD65Iuc?=
 =?us-ascii?Q?eXWgPLrMvKKi+DwPxmVCa8ayPeSTOyLqO2TxcKGYR2rknHQ3WoI9sFThrFHF?=
 =?us-ascii?Q?DmCq1BiNLItA36uzWN+88jYeGYZQ1fSOKOJa0LpPazUam1V9LI9l9TWojvkJ?=
 =?us-ascii?Q?c0n1CAAYaIAapSNzS9UWSGW/po3wp619HECfO14StBGuaVXfTVtb6g6x4KnR?=
 =?us-ascii?Q?0qpI6JIncsEI32fIJ+lxFfU37V0fxrlge1Ppv4f1QS07J0Nvze0/xT6b1Oga?=
 =?us-ascii?Q?x7byoeWRNK/8Ah1ela1kkfkc2sef17zLByoIxOTTiQmHcDjFzkmuGCOj8NZL?=
 =?us-ascii?Q?iGMblpC+cIrtB9gvdwxLNg7GICCjEA/vlfQiayBFRUhyiGKCWdv6gx3uEehN?=
 =?us-ascii?Q?tzePSkdi+QicXHe8PuMcmeu4GRPnFey9jI4aAi4sNDbfH63sbZtUaGhEE7Rb?=
 =?us-ascii?Q?9rfvHdna0GgVKtuE57/fb+BuGt+YP/naDIB5Eagtf5XcC+k6iQZvHMt12x1e?=
 =?us-ascii?Q?OZCELr047Jb3WCpPbuTMTwt6iCBtO50yOUX6C7oHKqCASG79rE3XaVY1th16?=
 =?us-ascii?Q?wyJ1QA=3D=3D?=
X-OriginatorOrg: provenrun.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4203f982-1c07-44bd-3a47-08dc8d6ccfe5
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB2990.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2024 18:56:06.4979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff654c30-3eb4-4445-b89f-a54a92b1f03d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6xWJ3fnLKEPmSyHMkki5rJazIhRi7ay2rwMWJv4kitQMRBycuQxgIc39JWwxQeQ08ErLidmNbb/hxgJhK0JF5XJFlYZrpKD2NNHeqdq47c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2210
Received-SPF: pass client-ip=2a01:111:f403:261c::715;
 envelope-from=florian.lugou@provenrun.com;
 helo=FRA01-MR2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9Vlo1tmwCD9K

CNTHCTL_EL2 based masking of timer interrupts was introduced in
f6fc36deef6abcee406211f3e2f11ff894b87fa4. This masking was however
effective no matter whether EL2 was enabled in the current security
state or not, contrary to arm specification.

Signed-off-by: Florian Lugou <florian.lugou@provenrun.com>
---
 target/arm/helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ce31957235..60e2344c68 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2684,7 +2684,8 @@ static void gt_update_irq(ARMCPU *cpu, int timeridx)
      * If bit CNTHCTL_EL2.CNT[VP]MASK is set, it overrides IMASK.
      * It is RES0 in Secure and NonSecure state.
      */
-    if ((ss == ARMSS_Root || ss == ARMSS_Realm) &&
+    if ((arm_hcr_el2_eff(env) & HCR_E2H) &&
+        (ss == ARMSS_Root || ss == ARMSS_Realm) &&
         ((timeridx == GTIMER_VIRT && (cnthctl & R_CNTHCTL_CNTVMASK_MASK)) ||
          (timeridx == GTIMER_PHYS && (cnthctl & R_CNTHCTL_CNTPMASK_MASK)))) {
         irqstate = 0;
-- 
2.34.1

