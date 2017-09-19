Received: by 10.223.172.38 with SMTP id v35csp4512952wrc;
        Mon, 18 Sep 2017 21:43:53 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAoA39+me+EIgw1jqyFP6KXCQzEfm6T1wKhcX644nrKUZS5dEY60oLM1oqZBop60qGoWWe/
X-Received: by 10.98.18.199 with SMTP id 68mr163336pfs.94.1505796233140;
        Mon, 18 Sep 2017 21:43:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505796233; cv=none;
        d=google.com; s=arc-20160816;
        b=AV/GTBQX1VxuRcgxyIEKgH2fVZAkk2ZeIUAvu0sRFkyPkb4XjoEGP3nl9xw07FgPSa
         7aM4J7No1K2jLs4zDUggO6CpxePhe4yr1ZP64KSZmgrGje9WGUhD/8QGJjz7hmFlKq8Y
         4d8HigbsLYwG6KbDZ9nqD6nyL4lqO3ff1ljpAmEI01UBf99xbSMUCy4asaUeOdQlJu7q
         rcjb0r/QTDMdAg/MaRx4K1jFI9ZPzune7Ay/5WEatZUnyIgnSHzJhisY2Vp+1gnqMkiH
         SL68bqoswbWC5Szqa4/O2vq//+h5pJy84q5hRsChmbT2yc6DtzdDwckJJq7cEgOi0cFz
         4JKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=spamdiagnosticmetadata:spamdiagnosticoutput:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:arc-authentication-results;
        bh=tMRWt7EIzsirfneo6pLp+yJk4eHbDHghVFnIQeTIMw4=;
        b=HDYAzJe+b6iBY44L8BDNTMMMX7KOcPXo6csP6BYrlFDDlpJvCOmdQjhMXBpaw5c9cH
         b1izyrPu2Yr3ulPALUI3jdsYwwkv0sunjR6yQPGAM7KQWlL+Jd4eSKHAnWFdJe2b+OEu
         8de/WarWB8dnvk0lfmtGKZYWWEHWajTYN9f277p/QPD79fy/nHTQwDzzFiejkMaswW7u
         JAwvoBb6ltb28UfdB4m9WJTO/yMhTysi1jMTP/TSCPSHv8KY8E7Ie7M9ELDWTEx7Qu2t
         r6D7XouuYlmUDgiyitebW5NM/qXBwVZIHmLEBE8c2ZcLozAoGh2tHkrDDtVw+23xG3V4
         LTBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=EnYsE765;
       spf=pass (google.com: domain of edgar@xilinx.com designates 104.47.38.85 as permitted sender) smtp.mailfrom=edgar@xilinx.com
Return-Path: <edgar@xilinx.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (mail-bl2nam02on0085.outbound.protection.outlook.com. [104.47.38.85])
        by mx.google.com with ESMTPS id m2si746739pgc.322.2017.09.18.21.43.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 21:43:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar@xilinx.com designates 104.47.38.85 as permitted sender) client-ip=104.47.38.85;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=EnYsE765;
       spf=pass (google.com: domain of edgar@xilinx.com designates 104.47.38.85 as permitted sender) smtp.mailfrom=edgar@xilinx.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=tMRWt7EIzsirfneo6pLp+yJk4eHbDHghVFnIQeTIMw4=;
 b=EnYsE765iddMtBrsQNH5BahgrYGkzX2bEm8vi727e1V6Me/XMzm8t8So2TsV4Cdtf4HalD4dChvaY/VN5DD6uNHjqxuOB5cN/xKfNhmzkVAVNHfwq0wqj3MU6YEYI7QO3gohaE0yQGo4iwQtknvclpLgpTkA3QkgjW7XDKwSUz8=
Received: from SN4PR0201CA0007.namprd02.prod.outlook.com
 (2603:10b6:803:2b::17) by BY1PR02MB1132.namprd02.prod.outlook.com
 (2a01:111:e400:52a7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.11; Tue, 19
 Sep 2017 04:43:49 +0000
Received: from CY1NAM02FT050.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::205) by SN4PR0201CA0007.outlook.office365.com
 (2603:10b6:803:2b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.11 via
 Frontend Transport; Tue, 19 Sep 2017 04:43:49 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
 CY1NAM02FT050.mail.protection.outlook.com (10.152.75.65) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.35.14
 via Frontend Transport; Tue, 19 Sep 2017 04:43:48 +0000
Return-Path: edgar@xilinx.com
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:39477 helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1duANv-0006vh-Nm; Mon, 18 Sep 2017 21:43:47 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1duANv-0002hP-Ky; Mon, 18 Sep 2017 21:43:47 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id v8J4hllO006142;
	Mon, 18 Sep 2017 21:43:47 -0700
Received: from [172.19.116.161] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar@xilinx.com>)
	id 1duANu-0002h4-Os; Mon, 18 Sep 2017 21:43:46 -0700
Date: Tue, 19 Sep 2017 11:43:46 +0700
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, QEMU Developers
	<qemu-devel@nongnu.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH v1 2/2] target-arm: Extend PAR format determination
Message-ID: <20170919044346.GA32572@toto>
References: <1498830302-19274-1-git-send-email-edgar.iglesias@gmail.com>
 <1498830302-19274-3-git-send-email-edgar.iglesias@gmail.com>
 <CAFEAcA-dssYnbZjuWTjBta1aK3iL3pyRKh5Qs4hFh=bPONgnTA@mail.gmail.com>
 <20170711100334.GA25504@toto>
 <CAFEAcA_XTrkAN1ATpp6DLZqGh4aL1gECzQGyubJmoGjtw_pPbA@mail.gmail.com>
 <20170711103859.GC25504@toto>
 <CAFEAcA9wn_ozBCHBZqxqARB5eD4wX1snyGfM0JW1Yk103CTytQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9wn_ozBCHBZqxqARB5eD4wX1snyGfM0JW1Yk103CTytQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23336.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report:
	CIP:149.199.60.100;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(6009001)(7916004)(39860400002)(346002)(376002)(2980300002)(438002)(24454002)(189002)(199003)(9686003)(58126008)(23726003)(1076002)(50466002)(8676002)(229853002)(6246003)(54906002)(316002)(33716001)(356003)(8936002)(2906002)(83506001)(39060400002)(77096006)(53546010)(47776003)(16586007)(81156014)(57986006)(63266004)(5660300001)(106466001)(76506005)(305945005)(50986999)(478600001)(81166006)(6916009)(2950100002)(93886005)(4326008)(33656002)(189998001)(46406003)(54356999)(76176999)(97756001)(9786002)(18370500001)(107986001)(5001870100001);DIR:OUT;SFP:1101;SCL:1;SRVR:BY1PR02MB1132;H:xsj-pvapsmtpgw02;FPR:;SPF:Pass;PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;MX:1;A:1;LANG:en;
X-Microsoft-Exchange-Diagnostics: 1;CY1NAM02FT050;1:Ce7acwGzRhaPmvzfwINs4SW4TH75Qqu+5GT70254Ba7r6PAsKvaxxwfxdN+USpo4kO8KKGO6C0WMSSlWWraBKqVTc5KwhsJxoROtvZ7EASGOubc7z6Gqwf3idggj7Nml
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d8d3e56-7ae7-485b-73c5-08d4ff1904da
X-Microsoft-Antispam:
	UriScan:;BCL:0;PCL:0;RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);SRVR:BY1PR02MB1132;
X-Microsoft-Exchange-Diagnostics:
	1;BY1PR02MB1132;3:lji7+iLKrQ92IfIZ3D3YLhq7KxFieGxdvUvE6JaON8x6ghV+/zOhS4GE7g0QO5oG+DHS5YWieTCs1qr8lrsdPqtJ1V0LpUvgIddR3d66TDtNRpjMk+Flj1MjS+1SCi+lKcXqnE3k6COaH3OdzwbP41qikaIT65HmsRXLvtNIppqprF9lEJO9bTBiV1ciU29fZSymDjXUVDXIMawiObdpPYN9WBGvMD/+cIwGnjtN49cGHfixaSeFELX2/pAbhHLpNZunN0VElroyYWynG4mfI3p6m5g9pXEK6/24JJVCIYXXQ1ATvt9xsro3q1LNBgn+SweOun9yU1FRiWjypE43VVyVEODZF3PcS2DFK+58m/o=;25:VVKCIx7MOSAbTyAVSO3KJMs8Z9nujh2bdBEI6KDf4rLso5esjoP8ies3itc76iKot98mONQdb31mANIPqtXgKoj78l/wfC7CeYeZrYo0URFmYvHW5nlq6JjA70s8JIxrrd7HnzXC3zb4p9BLPylbdh946f5J/4SK6EFupZ8zeMMurac6feEoVMC/6UIIK7c3YHtQbYeRXzVEp5WwXbzv0fkUdWtJ4LcdcyVGNmUXnAgEO/MNWcjoouM/hNWKvP0P2GNovMVV42IE2woyn6USMi+a3vM/Hk7IQYyO++3YBMXrttJaYYkpbATZykfvp4zD0XUQGVWt/p/FPRRQ2EAMLQ==
X-MS-TrafficTypeDiagnostic: BY1PR02MB1132:
X-Microsoft-Exchange-Diagnostics:
	1;BY1PR02MB1132;31:S76f1i5gvKF8FrBNgUd3BrpzDqXH/mj2h6qD4/q5hsMGyUK1OQ6Fskm2DF8o0VIs+sv1ELLGwh8MfRhVVzmauSdeU4PFbiI+0vkz5wz0ySuokYD+8YlYPF0Z0kn/Z8UHAT0ulMKKwE8zcj1/PbASmGGcE9+FIS8Rzcfp60Jlo2OWfQWvGTnYfxrtDya9saa2k3TTHy0F1NrFotNeu7l+DOuDE33d/BWQnkCUtE0RJdg=;20:i10TaGCeg8PaBc9wNKXzZWz/bYu+YN5AfD7jyhnFr/dsFD1hCNG/aI2skef2gGY2k17DUqFAZHIOe1+oFTAmSoqp+V/AvnBIMjg6t2Z6C+Qh7Q7bzZgoX8aA4MmnNDunUs0L9OyflaIvRv1gLtD1CSs4QQ72ruSqbGQEF26g8k27k7nNZ+wJMmIuodyeCvyS1V0vhe5OKCFgR2639tkEdR2stlxw9K8u/39I78farI4w+JK2ifjE3Nfd1pwHIJALPooRZrmv5BfQumvgoGScmS7NUpHneRMp5dEW1XHnUXHUjcYevGhbkKcN85rOF+Xe476k51NUbPBYNtWsZWzOhmGkMkEWuqFACaJ53oEINKCgGdvfIx3vNSAz3XjZVrhQjWRyFkJaQ0yPWGbew0SD47tg0tXds45W36Qo/o/+H8wM9b97o1H+8x5LYxFHk5R1ST3M9JdtXr7R9B8pyv3l8lifjOva0g5z/JNyV5I/GpNWHnlpubC8b9Qjbbb04ERH
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(211171220733660);
X-Microsoft-Antispam-PRVS:
	<BY1PR02MB1132B053FDF90342BB3211FFC2600@BY1PR02MB1132.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test:
	BCL:0;PCL:0;RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(93006095)(93004095)(3002001)(100000703101)(100105400095)(10201501046)(6055026)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123555025)(20161123560025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);SRVR:BY1PR02MB1132;BCL:0;PCL:0;RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);SRVR:BY1PR02MB1132;
X-Microsoft-Exchange-Diagnostics:
	1;BY1PR02MB1132;4:4kSzgTwCymPk3Kg9kYLb3pPvBfO5UA3gjrDtCAfVK9czbcVOWF1rM5waPwDhWuGYx6/XHn8KqciRaKCUvxvRIDzadwTtbFbCalMCme4U1MqHe0byo/Rse2aq+E3eOY9I4c1brMqMllcPvPxjxCHKMe/HDI9kxuyCDexrlDo6IrcWrcGG5qnGfj0rgB8aSwtL1Nq/Wnz1L6O0gtaAJEut9CoOh6wmRnz5xfXIFeiAiUof/0rZf+SAEWFDDUs6bfqhkTbVid7Cz1jVB2LU0zqxp91HMIvMeWfkna8G2Lwm9JNTJiMYjZ+N5WLSF7S7UVa2525r/p/CrtaZgLt+PBND1Q==
X-Forefront-PRVS: 04359FAD81
X-Microsoft-Exchange-Diagnostics:
	=?us-ascii?Q?1;BY1PR02MB1132;23:P7UyEfvkTbZ8VBLmYeC7vkXprcjvc9+vTjRUBBTSZ?=
 =?us-ascii?Q?qg05CWTuMPXickEC8cg8KMIS47qdUbzgyj8nvBHK7bTYD+GZwie2KgI+OJ0X?=
 =?us-ascii?Q?QrDuHZ37KO3oGZ24fQ2sjTeZhyECM2Wst/++zAflFl5JwNmVesrzScO+ae9z?=
 =?us-ascii?Q?BFh+V+0yndlw/rzUPSpJSNxJD2sMtmzgrD6FqK3kMWcBywmiyOtklJdtgtK9?=
 =?us-ascii?Q?DFosbahZcmaPTBVf0FVc0DRRlWduvBCfmmLG1A0o1xDuvlY5K1djAYQswGrl?=
 =?us-ascii?Q?CFZI+bxK6/tHqSyGN4u3VEL+zZFK1g4K8aX01CMjr4CRybr5yrKWrwo5Y++O?=
 =?us-ascii?Q?F6SsyOKqxMtafs5LSSCgZVjbaH/plMHYpMZS+OVrl9shVLIp3BJ2AyLHxxxQ?=
 =?us-ascii?Q?wJ7ciEHjww4Zx5vbhdUc4w/qPQxbd3jpXksXj1KWpb03v3r3IsUS7tHMfnp2?=
 =?us-ascii?Q?6Ieo7cqWZCqOG8l/IPuIBPpF8r5lEei/TlFiQCi1lqTn3dsl8H21Zx4EDAdU?=
 =?us-ascii?Q?qT2x+dcAbSQ74Yh1UYmA8wqQ/fXj1wb6QXDpJz1597x9erEQOLGj9HHa5Xvr?=
 =?us-ascii?Q?0c1ST79IYJ5hvaIUbktrar04fWb3l51TmX6VlTi0vj8Q1clUv/wM1WQhOGmu?=
 =?us-ascii?Q?v7HTubByjA24ahh+jHQKeOspiPyP1OrtuEjy9T9/0rgO3tb+mJAd7cxrd5rN?=
 =?us-ascii?Q?fO5Fzor9ICOs5ttRMwMINQDxXV4MOiPx88ABRvjM9DIxL4uXWma0ljo4tE6s?=
 =?us-ascii?Q?ijqQnUu6rqYUCSvMkYi7lyHfukPlL+1BFbOVrzMloKMnBVNa1zkeTqwPuSMl?=
 =?us-ascii?Q?Ew8hOiDaDeaX95w4Btu+nUjt+Thed+fL3ERjrNQstda5NzHWiFLbQnfoXIY6?=
 =?us-ascii?Q?ee0XGYw015fSlz5viSj1J2OCrEFvYJlncSULzDo71Ef0OZk1A4jd2rQ2pQm3?=
 =?us-ascii?Q?/BwwokbpwfYt/2LWaqGadFSLirKcISoAvAwWnYhXdmRUHmPC/kGZu/jZ0Hbf?=
 =?us-ascii?Q?8HfXxGb89fysvX/6ojoGrBjExd5g6eJ04N7ltnzvJm9ColQpBRMxe+nNHslA?=
 =?us-ascii?Q?9Ep7e6YLL3QFUZUrkdEK9h7CBT/mWwprpMq/WZ1SslrmlT0XL5WiAuPk87Gk?=
 =?us-ascii?Q?KV1pu0uRNLFKIXjKk7ZF6tIijUd7/k4lE0RwG2bPY8jE1jRDQzqJkVJ4zYzJ?=
 =?us-ascii?Q?6gJcZ5mfCA2PZ2nK52mzatEAzqiVBD5Z7h/kLhYRX0AItCER20Su7QZCm63y?=
 =?us-ascii?Q?BE+UaLPN8ERZagzD0R+oTo2UlXOBSy87BBgagbN?=
X-Microsoft-Exchange-Diagnostics:
	1;BY1PR02MB1132;6:VskSU2nYzoMmmKX9ZwB8CLqv5iNavH0YXRp+rq1cPIOyDOIIlB/1FnxnrJzQGamzqonLMj9WbDB1zVkfJHhKP186gTXJ7qwR486qDx5v3FkhO8SzCc6zQTEXKmGCTxngI351ZvzYm3bllytmsMnGKzn2TpnTsPAXPbIXEN6K00szNXcC6ObHOIAR8DyPsL51tFE6GVtJSu8/FTvvMt6ikxCpfWzHGgKCW1aB+6C3C/Std/Z6YjS6Cgu3/+H0s0cJFlZyWBuh66dIFoA+Pu1aj56dFwg8ta9uolEDKwgDx3B0xHxedE+OIvdHoJGV1Iubgw9iBQ2AJWW5CHRCdfjrpw==;5:CFZn0+eRwzRTwTvVJ8wKUH+0vcU8ZGsVY5cugnsNo+Z42hSPtBNibYZ/cXsNhYWdjIl0zBsklBOHePmwOOZROW+LTFNUvGvZzY/bM/ueKHu3iTiRIO4Q+VUSQ8OLBtDD3cumVmYl4f+4B8Va0YD8orbkMJkzK0Q+yHsFaTu6mbg=;24:pjdg1xuSbjo6aO/RACHoRgrGn79Euq8+cZWJTc+ndvtG1WWkaunwcpXjamTzSAJppk6cWba884QvG079ZQQQBCZvMrmymHhS/gxog0kh9iM=;7:99tCTKfZ0WakGjhGXPaVCYUTehAl01Rgkp0vLj9+rJQ+ib6M3Y+JGMHZLq40AwzJkOTskRIpkAL9FSQPOOf/l5cG/xsBCnVaCMs0OMKW9AsFAm2ks1p1fxW3o8ny6uvQnBQRJQi2on/dpcD7PGfOsON5SYvtHSJRMZVTvVAYO10aXNXxVnswywmJ8caAlcYwKchXnkORUr533WR1K0FRFCyCFvqeUYd9s08v6jPG4/o=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2017 04:43:48.3335
 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.100];Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR02MB1132
X-TUID: DEuVm07U8MUa

On Mon, Sep 18, 2017 at 04:50:23PM +0100, Peter Maydell wrote:
> On 11 July 2017 at 11:38, Edgar E. Iglesias <edgar.iglesias@xilinx.com> wrote:
> > Another way could also be to have get_phys_addr() fill in generic
> > fields in the FaultInfo struct and then have a faultinfo_to_fsr
> > mapping function to populate FSR/PAR. Do you see any issues with that?
> 
> Edgar, did you ever have a go at implementing this?

Hi Peter,

No, I haven't looked at it yet.
I'm a bit behind on everything here so I probably won't get a chance
to look at it soonish...



> I'm currently running into a similar issue with M profile,
> where at the moment we stuff the information about what
> kind of fault the MPU generates into a v7PMSA format
> FSR value and reinterpret it into M profile exception
> types and fault status register bits later. This works
> OK, but for v8M we want to start reporting kinds of fault
> (like SecureFault) that don't have equivalents in v7PMSA
> at all, and maybe it would be better to clean this up rather
> than assigning arbitrary bogus fsr values for internal use...

I see, yes that sounds like a similar issue.
If you'd like to take over this, that'd be great :-)

Cheers,
Edgar
