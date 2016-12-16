Received: by 10.103.86.15 with SMTP id k15csp1350671vsb;
        Fri, 16 Dec 2016 05:55:41 -0800 (PST)
X-Received: by 10.55.21.25 with SMTP id f25mr3141946qkh.132.1481896541891;
        Fri, 16 Dec 2016 05:55:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m19si3226458qkl.82.2016.12.16.05.55.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 05:55:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:60654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHsz5-0000Il-EM
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 08:55:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1cHsz0-0000Gz-H4
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 08:55:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1cHsyz-0005cR-PD
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 08:55:34 -0500
Received: from mail-db5eur01on0090.outbound.protection.outlook.com
	([104.47.2.90]:39616
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcin.krzeminski@nokia.com>)
	id 1cHsyt-0005Y8-Jm; Fri, 16 Dec 2016 08:55:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2wvFkj12k8MdqvOH78++j3pJsrAnpXQRVlxYTMVtVXg=;
	b=dvRF1UpdclanW+EcAHm46UgIu0eNN0PBLPtyricezYqtTN/Ed6INGVIPhQP8R8CFPZDarl51RBHyXkPh6x9FB15t2hyTAC7Esrq9w8xkhxBQFkY8lK7yLoUdeJX2J7oJqXbQ1cfOLU62U8IAIuTlycvgAu/5boD4AFfJ7snDkWo=
Received: from AM4PR0701CA0011.eurprd07.prod.outlook.com (10.165.102.21) by
	AM2PR07MB0804.eurprd07.prod.outlook.com (10.161.71.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.789.13; Fri, 16 Dec 2016 13:22:51 +0000
Received: from AM1FFO11FD042.protection.gbl (2a01:111:f400:7e00::196) by
	AM4PR0701CA0011.outlook.office365.com (2603:10a6:200:42::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.803.5 via
	Frontend Transport; Fri, 16 Dec 2016 13:22:51 +0000
Authentication-Results: spf=pass (sender IP is 131.228.2.35)
	smtp.mailfrom=nokia.com; nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
	131.228.2.35 as permitted sender) receiver=protection.outlook.com;
	client-ip=131.228.2.35; helo=hybrid2.ext.net.nokia.com;
Received: from hybrid2.ext.net.nokia.com (131.228.2.35) by
	AM1FFO11FD042.mail.protection.outlook.com (10.174.64.231) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.771.7 via Frontend Transport; Fri, 16 Dec 2016 13:22:51 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1492; Count:17
Received: from fihe3nok1348.nsn-intra.net (10.158.36.136) by
	fihe3nok1346.nsn-intra.net (10.158.36.134) with Microsoft SMTP Server
	(TLS) id 15.1.466.34; Fri, 16 Dec 2016 15:22:50 +0200
Received: from mailrelay.int.nokia.com (10.130.128.30) by
	fihe3nok1348.nsn-intra.net (10.158.36.136) with Microsoft SMTP Server
	(TLS)
	id 15.1.466.34 via Frontend Transport; Fri, 16 Dec 2016 15:22:50 +0200
Received: from fihe3nok0735.emea.nsn-net.net (localhost [127.0.0.1])
	by fihe3nok0735.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	uBGDMfIL030207
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 16 Dec 2016 15:22:41 +0200
Received: from CNU418C7XK.nsn-intra.net ([10.154.154.85])
	by fihe3nok0735.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	uBGDMeVB030178; Fri, 16 Dec 2016 15:22:41 +0200
X-HPESVCS-Source-Ip: 10.154.154.85
From: <marcin.krzeminski@nokia.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 16 Dec 2016 14:22:38 +0100
Message-ID: <1481894559-13974-3-git-send-email-marcin.krzeminski@nokia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481894559-13974-1-git-send-email-marcin.krzeminski@nokia.com>
References: <1481894559-13974-1-git-send-email-marcin.krzeminski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-IncomingHeaderCount: 17
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:131.228.2.35; IPV:NLI; CTRY:FI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39860400002)(39450400003)(39410400002)(39850400002)(39840400002)(2980300002)(438002)(189002)(199003)(356003)(626004)(5003940100001)(47776003)(77096006)(5660300001)(2906002)(2876002)(2950100002)(107886002)(4326007)(6916009)(110136003)(86362001)(86152002)(36756003)(6666003)(189998001)(53416004)(81166006)(22756006)(38730400001)(97736004)(15650500001)(4001430100002)(106466001)(50226002)(81156014)(305945005)(8676002)(68736007)(8936002)(50986999)(50466002)(48376002)(33646002)(92566002)(2351001)(76176999);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM2PR07MB0804;
	H:hybrid2.ext.net.nokia.com; FPR:; SPF:Pass;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; AM1FFO11FD042;
	1:JpARWosDj2Srb3vzWeuMB/NdFw4dMaoR5mZdR1QkkOgeG9HRE08Xt4hPc8jw/opD+8T303c/MrD7TGu08gtWX+i55PwY2Squgzd51x+rhjKTxfI7ix0zkwMeqv8bg6qRAicUDLUX58tQuWdXLE8tMnE6msneMdX83E3cSTp7BWBx+GqrMGmufUE5JTzh1o0pLTa+qd6zECwKv8XjL4LGnNwNglNSbBhd4aTnv/KcEkKzt6vXZclRw4jikIsfHltVWAqxSM+Fbc+gHhF1il8231c3qcJlnVdlCmYFHsEtgw8NJnxIBZ7JdKud9dYILXpwfst4ILlp7B6MUWsgLqI4ETMqnb5dLleJLsDwzv4BWjna6/1NvvI++Gtmr/KAKkVUV83MCKwKJ2yExv6lwfqCuNu+LZoL57xmlbsgKHxTJA+84x004bd5awGmNf55OCP1++7bw/mF68OflIO/ieFQx24d65g7Ka4MRga3AO0n0ynpUvTWa7xAVF0vbHuvQaaRag13t1ePv6gwT7F90GxOOg==
X-MS-Office365-Filtering-Correlation-Id: 37a20c9c-6262-4a42-437f-08d425b6a334
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:AM2PR07MB0804; 
X-Microsoft-Exchange-Diagnostics: 1; AM2PR07MB0804;
	3:WpYzJzJgQVh803UOyJWW4kT7jEfHFlVLtea5YBlsWW1+Bk/UQAD7EoyFWMGFPPsI+BIlWsEFBvtdIJSjoRxHuh/FecwN4kSdwOllggkiY4Idd3p1kvXNgOmfMtxRwFufKkQ0z35BrnIdJW1MlTpR9qPr6BwlGrsPRtZsQW/1rWIrvZACV8lL4U4/a73Nhjo9Cz2s7t4bd4UwKAfFBZcTW2208Io6AGF0UNhSCjMVEf4CQgm1/qIZCWcsbpoagvsqnkzYnJv8UWvsln0hzgZ3Fsy7oqm4VXoqTvj7EEbelhkKIUjVmwsqGJFfVd9d2w3hQiAfxQCIo//abNMN7n67/DZ3MnJgnzdxrYDpI9aast4bmdTewMq1E3mbbKIj78mQhF7b0RUkYVGYkl9yl9JXsg==;
	25:G1c+d/kX+UmNHPMILVPBElY1iFZqB3h/OEA4kKvpTF2mcf6ylEetH+Y7oRITwrynVRBHnhFvQ7vazcz5oMWw3WMYDqPpHSQKUxKNUUbPcgplYROV2QWnsz7QzcTyCTPLg34NJYXurj0YoR8dt1qbRe+aXq5BfgvjldH4yV/4bnDqwLS8i9LQRm1j3T2fzIKXRaohLpWkR7HOb+iuE5psvgoHGf0zql4ErYNtpqdAdnZMtxdaXEavD1YzZvuqBzqUQPfBfumeEwkm8xXOM2Pz1K2ciTj6EJZUVEmxq9wIv8uO3Rg2j5FU9YsP3X69y013IJDKh/ryStFAuy7EY8OJsFabRpWg2KxJKuCLBhDqZip09mrkOUrR6h8YlQMO4foeT8hdvslYwiIzk6xmAMpDo6bhP+01OpgqJx03dvZACoi+EsS459iZBsJaD9LwsPp8EDeRtBN7Z7V9gldJSluBSw==
X-Microsoft-Exchange-Diagnostics: 1; AM2PR07MB0804;
	31:0XEIQ0iN4UhH1FaeZhq/zVXgg2nIOL1NoC3sA6mStoEbK2ADeAkQ+l9OAHhvwHPZyoVjbc6nKgUBs0QOdauWTtsHBPerh8ygyIzusfeQuWtRDyffDUdjtwWJUR+BaHSLlkxK7y9Tuon1l4ojY4Q/ce6JtuKiYVKPITmVB/W0T4GACM0mALyH+ZxAQdyXDjD/MyBwt507OqqlVcKqx/ZReH1CtnI8iKlK4LslLYwYaZFJ2kHLO7yVHI0JSAq8WkjUVADhOjN90AiAzYFJJCf8uQ==;
	20:pD/930jaD0CNIsOcg3n6yjBXu2gFvthlv7Xd27KMi4TD+a+Bu6xlgGPflfpx866b8JvONLXyFlgT9UFmV78ircFosQFTv02y7y2Uu8J+/P7atQMZONKgVuzCbNIrLrDBEhgn4rf4t+peD+UBzgyqJlzYUkgyEpM7iLjKYPPAPi/tnZv7B0CHiXdstdtk+tKZ7NYfzjMmfM3cmr4Xk8rAPeEmOmXtLNktMK1IiG36yrKNUFKcIZduK8Jqryra7rNH52ngEiIZB5DBXmJkEn5d3aosf2r7pAw10L38tSrHWiQwurJ5tiZLytl2YH1b/dMGlO7GX0JAEXRhDW5InhIZ9ITyC4Gc1z3NERL9eLy1lUJI1IkV9B0C+cLhRMjiTCR6VPhG+qhESto8fk6TGcJJiZ80tEi4iaVjMlRkcud+yaPVccspGC6vpYNWJVkFpLiGpp1KbR8sfx9xk/6lvw9+Ou1j3GwAhr1BkNG9R5PeXCn6DAt87SwLgl3JS0YClWnN0cFf1NX4sRr+5LjCjwwT85NK98vREm71qVrZRv1PmG/sPxctUNDMgxm8hBOLGU8s8kXFBrRn7ZzTlT/ue91Q96Z73iB2EzyWozE4jVWOw7A=
X-Microsoft-Antispam-PRVS: <AM2PR07MB0804A0CB87BBC9CB05BC5BA6FE9C0@AM2PR07MB0804.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(82608151540597);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(13018025)(5005006)(13016025)(10201501046)(3002001)(6055026)(6041248)(20161123564025)(20161123558021)(20161123562025)(20161123560025)(20161123555025)(6072148);
	SRVR:AM2PR07MB0804; BCL:0; PCL:0; RULEID:; SRVR:AM2PR07MB0804; 
X-Microsoft-Exchange-Diagnostics: 1; AM2PR07MB0804;
	4:T9chJg5a4T4L0joTjbnx1zt5ym2A8Ak30pRLCneUTm0Y+JXLZVgQLnuDj06Eu4k/2DXime9Tp7T8SPUnehI29eKrH3IWnTyGUP5jDA6Z5+MMcpkyDlOQrp5FVNF8kE1IDwy4tgaCSKQ01zinhXMAXzBrh8Yb4gQ058y9t/Onp6/b/+Uh0y+5BAVlMakstVYo3sN+mv+Rj/FmHf10yW1ktL4ZSzr0BzhCqTCaV3fXgNFnr4j7d2+LF8jeyRIhpkwkftovyHfx/bOIk8N8dC8G41G4CsbZF5x3qBkStCYNXmGZAOdaprbFFW+ucVibAoJtdtzlIYpDVPukLGUvEKLfdsjx5HBWqsCMYz6u7KSMBeeLo7zSE/MhUO4h6FyS0xNaruP7n92oL5caLFDXV01z+9i69mKFtx4REs1KF5tktVDnn+MwkNuKdxISz2Sm76uF0pNgbnvWxdG7ZwTenJk4L+OzJ808VWHUM0bUNbP9Z34rCl5jjZ+f3MLOxgdBjM5lvHPOtK8KteTRtozcTWg4g/VSmIOlfXg/m6MidbpOb97MGETI1rZFWTlzXtguaRwi2e4LFTjI0MoC/22hm1nnrkroOCd6DZu1YYfVbaHOkYNGU1nN9xpJXEsNlmMI2hf40po/CyZXFafx546pCkLeALMrU6FFAuVKFhUL5xoNkl83+1JAeJrPWLdtYENM+SIS7qHsf80AbElOaIKySle5DA==
X-Forefront-PRVS: 01583E185C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM2PR07MB0804;
	23:ZiDZ8STSrr1Vl1mCX6Rbt8AmuXok/5vBUzAn26V49?=
	=?us-ascii?Q?UPCnss9mbKNexuLM9ZeI3VSWbemHewIra2/6U6rcFJceTvhQ55+Mq+98L5Ca?=
	=?us-ascii?Q?8SLQ9am6wES5KuVD8eqjzeQO3JhzM8Mw0xytsaFmbkRLmA3+4LdOHmEhkdig?=
	=?us-ascii?Q?bRdnUX0eRVUhmFkK7AKIt5j9b7aiSYg7fePGY3/9gXW3ocFcA9nGAgplNL/O?=
	=?us-ascii?Q?eXiG/jVhZTjv7YPSE56vPAmTWXl+s8/isbXt6TwXmQabiPGXfTOAAsLn8elc?=
	=?us-ascii?Q?MD/x0VLSw7C2VEPgMD/MNJhHoVmNfS5VFs/TBP3JFsguGzoFbqujuU8HHCiz?=
	=?us-ascii?Q?llFNfHGJNfH4oQYx64JaF9VmP8R0JQ1f0hbtandvuKn6YkrsMR7YPqRiknny?=
	=?us-ascii?Q?JJOmP1bdGnvyG0k964AuyIL7TgMb6vHi6xbVWLsgQZvXtpNhpuYNvp9YGpJj?=
	=?us-ascii?Q?TqmIePIltsp5shssU9ltiMaWphlgs1h9xVxJYTapd+YToc/utub4wkFCyEZx?=
	=?us-ascii?Q?nBwqaVss2Fbdj4NyaU1a351JMJ2PD4tahcJyskJxmaaEgb6O80sIjUGX2Eoo?=
	=?us-ascii?Q?RqH7SUP0BIhRMxnbhdxpHQ/mcDlGMASSSG949I5vGx3JUMTXBYfZjPsLoSb1?=
	=?us-ascii?Q?BeQYrRJrJ15Ic5aOCbDGUFpzl5h+O9b9bRBXMKYEod3iThDmBYM6zwKktqkd?=
	=?us-ascii?Q?coRTBCMI/LNYwm9ai+26FZQQluCOLRUe4fJQzSLo0pCen1ua/fXJilEpfSI9?=
	=?us-ascii?Q?V64S3CxK3v7sVPuCwA9kfF0i+7KSGcUlMpeyWWFQ+/7scv3nfxL726mV4NSQ?=
	=?us-ascii?Q?9w1nxZg56iZeNZRSzQVXfJWGrYs8FQKP/gCN7+skiIFEU5GONm8lQebroGF1?=
	=?us-ascii?Q?FcmMn+HZenm+YWan3U5JfDTi1Hqlhrh0yD3t+gH7vLL9bi6r3APceo4KkU5I?=
	=?us-ascii?Q?WiibQlIkNpJh06P8MYsEQLIX1HRUIsBXvxwrEzakjKFfUaWPpCCjRtfSeuE+?=
	=?us-ascii?Q?9d3zA6Me6doBc77DnoFM1XZxp30PkmHauHJI9VNDKYRctvhKmWscJEcBJZdU?=
	=?us-ascii?Q?W1YEme/vjZ44qcAiOoY7KdQTolhHZ/vKaI5iRmdFJz5FzwP8VbLkaZFVyHYt?=
	=?us-ascii?Q?8mgU3JLwxrWKacu8PWElNKeipizzU9HhoO4qi4rJrEHLmtU2oW3HhkSVtZkM?=
	=?us-ascii?Q?9tmKY4oxtkJe7UzfXKgf92eKUER3VsBAqOtsOxuRrodijWQB1CJpLW28Q=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM2PR07MB0804;
	6:1aQ3kCOswFMzk+009vZcVou8eJV4QUFHF0Uquc20mi5Lc8KrzZW8ppcyZnM33306tvaKl43yFr+xKN04Brc3EM4BWhA5Jy4+goNgOMP74R+ikOduC6i1WIuAfxeAisQpU22ZU9btt9vYlEJmcOl0shmVDEIWL22dqB8/+RqBCgkJ9D49cCVJxINlQ6+xCaFFt+s+sHLCp0AeEjmxFkvR3Wh73RuAEQNS5eamQac9Tv8yprfLBj11N3dwB/OdEoy/taCmi99GX7ZvbZdSPHXxvqUF9C+ty3NkHQZvXo/JIhNeYdATxq3QgCv4+DGKNwkuyZoZY5v5u3EB4fYuc0z0dt7U0aR7HvHV9M2MVfu5d+eluBlG6+2F1rgx6Ar/ypB5LRiP4Djb2RvG0hNh+GaJJDOIrAxUJsey09UwbFmcTJwDfvNxadRHNpjLTrpqX8Xsbb/RxIUeLVGgYgjBZebj8w==;
	5:gexj/uNltLJf9UVWhcMHH92KPAZPx11kwMiR6iuAFxKtSuTDvB0rvuJARTYySdl4qZuxuUeosk5JOz+BIt1OQB7TAYW7kTJJF+RIcMSlXTjPjC3V7pZqoQCrBF6LcnsmRuhSE0VFRGjEOWTHiXHCzQ==;
	24:th/HI8JgSJN+T0p7iB7vdIjSYTtUAVQLOZ4jrBPpvMfwRNvxLOofhTPYB0VBIRFdyhE0XCaOY1lytuU+ZXjl8xX5pMLhR8wxakofsJndE+g=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM2PR07MB0804;
	7:EhzY3DRR17hjBuePoUdSTAEji/GSYELdDKNfoRt7OPeAGsXwMZWTx7cwvUcf3AohSXszgQlSe8iXT4PMM/24oOGTI4oQ1ueaBTri5abTB6su1ZtvSUDezU3wtnHSQq+uQh4XwaxT+zqWcWD8kDccwxoSPplH9m2DOSxtzRApleZRVO7KdFcIQnEpmLbf3BROHLisxQTWoD7b3OdNyMSEOUxF1Ol2wtfR5psqxsQt8D/ptfmR1A7pGsCXiBIE8W0J5WXiExLYhdbr1TWsM/c0sd8oG3cA+uvcEEKvB7v1rh0m5hFTWlNiYLo75WbRdteMBGknuCSO7ATprXGTQw+HncvaZqZvcNHpuwmBxziG4vLSDm62zpH/ADEd9JuGWTUUZnhfhl5UoLJs1+v6ApxsbB/EvK4DWm1XrIZv/mwikJEcf2tsfJ/vLQEIMMNJe+BOUPZznZxsJ4u71+fsf4f+kg==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2016 13:22:51.7689 (UTC)
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0; Ip=[131.228.2.35];
	Helo=[hybrid2.ext.net.nokia.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM2PR07MB0804
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.90
Subject: [Qemu-arm] [RFC 2/3] ARM: boot: Add option to skip FDT memory node
 update
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, rfsw-patches@mlist.nokia.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LAtyxV4iuQFZ

From: Marcin Krzeminski <marcin.krzeminski@nokia.com>

When Qemu boots directly ARM kernel the memory node in device
tree is automatically updated to mach guest RAM size assigned
to Qemu. This commit allow use case when user do not
want to pass all guest RAM to linux kernel by skipping
device tree mmory node update.

Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
---
 hw/arm/boot.c        | 29 ++++++++++++++++-------------
 include/hw/arm/arm.h |  5 +++++
 2 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ff621e4..0af72bd 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -489,21 +489,24 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     } else {
         Error *err = NULL;
 
-        rc = fdt_path_offset(fdt, "/memory");
-        if (rc < 0) {
-            qemu_fdt_add_subnode(fdt, "/memory");
-        }
+        if (!binfo->skip_fdt_mem_node) {
 
-        if (!qemu_fdt_getprop(fdt, "/memory", "device_type", NULL, &err)) {
-            qemu_fdt_setprop_string(fdt, "/memory", "device_type", "memory");
-        }
+            rc = fdt_path_offset(fdt, "/memory");
+            if (rc < 0) {
+                qemu_fdt_add_subnode(fdt, "/memory");
+            }
 
-        rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
-                                          acells, binfo->loader_start,
-                                          scells, binfo->ram_size);
-        if (rc < 0) {
-            fprintf(stderr, "couldn't set /memory/reg\n");
-            goto fail;
+            if (!qemu_fdt_getprop(fdt, "/memory", "device_type", NULL, &err)) {
+                qemu_fdt_setprop_string(fdt, "/memory", "device_type", "memory");
+            }
+
+            rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
+                                              acells, binfo->loader_start,
+                                              scells, binfo->ram_size);
+            if (rc < 0) {
+                fprintf(stderr, "couldn't set /memory/reg\n");
+                goto fail;
+            }
         }
     }
 
diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
index aeeebfe..e237930 100644
--- a/include/hw/arm/arm.h
+++ b/include/hw/arm/arm.h
@@ -112,6 +112,11 @@ struct arm_boot_info {
     bool secure_board_setup;
 
     arm_endianness endianness;
+
+    /* Do not override memory node in device tree - useful when
+     * not whole guest memory is under Linux control.
+     */
+    bool skip_fdt_mem_node;
 };
 
 /**
-- 
2.7.4

