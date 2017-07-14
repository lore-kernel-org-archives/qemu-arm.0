Received: by 10.25.44.15 with SMTP id s15csp571018lfs;
        Fri, 14 Jul 2017 00:29:15 -0700 (PDT)
X-Received: by 10.200.48.77 with SMTP id g13mr10156806qte.119.1500017355685;
        Fri, 14 Jul 2017 00:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500017355; cv=none;
        d=google.com; s=arc-20160816;
        b=hCUR99lVvUn3AWP+ZDCCFuYTmTsiHClegVBvEvupEwgskjH/6xL7Uh2ElBuKp9wvcJ
         JOr3T583MuvU7Z4l9q6e2hWWEWUwgZ1/b/pxF4wir08XRiOWPcDL2VY27Yp+e2Cu/BxS
         AS4vofeE7R6KpvmBNVFpk6BweqL820VeDt1JZme+S4tzgM0LuyPwpspzz+QFD4gycVV6
         jVyNIRccC9SivruxBZEh0LSdLoKuVVVmVRudf2qJQzmFYJEcuShX98xM1HEsU3RqYUwQ
         RYMqmfbyLi6tHu5Cz5CE4/O/6Bcr/XspFbIgztaW23TLLnt6eGRgWlVIVJCFsW+yxvii
         5+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=jjdNFi/apPLSyZ0OBAm7Em6dsbne2eMQfSih5s0zCj0=;
        b=oNd20OfCXc2C1jQltJS7Au52jLaQXIpZ29TZqNZCFP1MgEmb7ZCYUo8vr/RKqSg77j
         4FmknlUC5oGKGUcFrnUdEZV7BAaFE4u+ykm/D5S8tR1gT8cUR9OEc6mrlmAWe0c08H9K
         Xab4le7JFDTFOQs/QFbjeIvQKvB/XcIOYnslNhL+ygoF6QYjmjgpgjE51jiUMzKUEV9Z
         TkTjJlrqeESaDAOwU3X7hXu16tym8nOMpPEHVruBjohgfeGx8okG8WLP3JeKWLawiqlg
         eYgH/8d0eeuAfyT1lxsNHF4XFc/Qa51+O4OfBS9c+7I+fUItFsq6ECf6eo9ceDVaehWa
         c1zA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y37si7017555qth.35.2017.07.14.00.29.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 00:29:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:35945 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVv2G-0003qr-KG
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 03:29:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dVv0m-0002X5-F7
	for qemu-devel@nongnu.org; Fri, 14 Jul 2017 03:27:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dVv0j-0002fG-CP
	for qemu-devel@nongnu.org; Fri, 14 Jul 2017 03:27:40 -0400
Received: from mail-dm3nam03on0067.outbound.protection.outlook.com
	([104.47.41.67]:14726
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Bharat.Bhushan@nxp.com>)
	id 1dVv0j-0002eY-10; Fri, 14 Jul 2017 03:27:37 -0400
Received: from MWHPR03CA0059.namprd03.prod.outlook.com (10.174.173.176) by
	BY2PR03MB474.namprd03.prod.outlook.com (10.141.141.149) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1240.13; Fri, 14 Jul 2017 07:27:33 +0000
Received: from BL2FFO11FD049.protection.gbl (2a01:111:f400:7c09::163) by
	MWHPR03CA0059.outlook.office365.com (2603:10b6:301:3b::48) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.13 via
	Frontend Transport; Fri, 14 Jul 2017 07:27:32 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD049.mail.protection.outlook.com (10.173.161.211) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1240.9 via Frontend Transport; Fri, 14 Jul 2017 07:27:32 +0000
Received: from localhost.localdomain.ap.freescale.net ([10.232.14.21])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id v6E7RPn2029590;
	Fri, 14 Jul 2017 00:27:26 -0700
From: Bharat Bhushan <Bharat.Bhushan@nxp.com>
To: <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<peter.maydell@linaro.org>, <alex.williamson@redhat.com>,
	<mst@redhat.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Fri, 14 Jul 2017 12:55:02 +0530
Message-ID: <1500017104-3574-1-git-send-email-Bharat.Bhushan@nxp.com>
X-Mailer: git-send-email 1.9.3
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131444908524906063;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39840400002)(39860400002)(39400400002)(39410400002)(39450400003)(39850400002)(39380400002)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(9170700003)(4326008)(8656002)(36756003)(47776003)(77096006)(86362001)(2201001)(104016004)(6666003)(356003)(81166006)(626005)(39060400002)(561944003)(48376002)(8676002)(498600001)(8936002)(72206003)(38730400002)(50466002)(106466001)(105606002)(5660300001)(53936002)(189998001)(305945005)(7416002)(2906002)(6306002)(54906002)(68736007)(5003940100001)(50226002)(50986999)(85426001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR03MB474;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; A:1;
	MX:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2FFO11FD049;
	1:UKNA+0TzsTjnGTXtbrlgpuAGsbFzuiiKlb5RbnpUC4?=
	=?us-ascii?Q?e2wgck9B3j83rVKH0BKMQ1LE+hOa30ZYj4K2oa2p4/lexaPiWbDFm03/a6lw?=
	=?us-ascii?Q?DI9RVWA1b9LVSJCMe73pw+9NfSSPmI0YL5oeGUL6o16TxqXn4jBR4grULucm?=
	=?us-ascii?Q?rCFhNa8TRYNSjQhqm/cpPGLtZQJdvQFKpmOTrnpjRpABXrWAnPVgmCHu3THW?=
	=?us-ascii?Q?PU0goJf0TmbO9tn4q/LRazIOUqBLrAnXsGpvDycCWx82y/nkjSJ9SFRWR7Li?=
	=?us-ascii?Q?6bUNZMXktSHVo0sPXmryw9AdltX5NrUFWYENzCsU65l402Nu1yH7DIYTz/3x?=
	=?us-ascii?Q?0nZ5eahRhPrfId5BW7hVI3G8QiW+2SxL6VjSjDaohSdwVEDLWVFNmQpvmMaD?=
	=?us-ascii?Q?3JTfkwjhpKzEg/St/2bupkxrIA3peNdHiUQZUaj8wl5WXwA7mJdhlgFxJMae?=
	=?us-ascii?Q?S5b831FRiyMYqWhq6219/TZoYcl9H4UXHb7Kyme7yk5WG8N+ViNxUHpzH//r?=
	=?us-ascii?Q?a0fT3sj3M5ndUpzSyIuABpSFtWWvnriomTpth4+wiMDpmdvEuXRQdLWZJdpt?=
	=?us-ascii?Q?nk4yhOiIo6A5YO4wTMjzEBSulrz9EO8OvmRIGWziRH+9IS8t0YXBiw9inn6U?=
	=?us-ascii?Q?cd34NX4cgIPQ83Rnrm0nB+Y3drHGT/mlhG/CJKCmWF1E2/QDrAxz68ajdLtf?=
	=?us-ascii?Q?FnCsYy/13L689O8xEd71hCKxygzGqmyn/PSDSZCTFKyukpTowi+Emgn4YB5m?=
	=?us-ascii?Q?IOrh3hFQc2M5UDT/l+5cHbPPnzdoGBpAFL96Vw/VuiF80oylBkkxyivJ5pA7?=
	=?us-ascii?Q?mW6T0pruvclmE/SNvPXr/nusbwKtc/8MYg3PeMP2p5DFQiuBhDP9uv6OZrKP?=
	=?us-ascii?Q?gbZn+SHKaMMjQw9961eWfs9QoHRRM3ISJ2hI1ef3++AA8gLdgBrU5SgAPFIW?=
	=?us-ascii?Q?GJ9GlaTgMvzoi1zTJWmZu0raKH5i7Lc7H+t3jUS/0xO1f7LlHjCMKEWZ9yy2?=
	=?us-ascii?Q?9UaVAMyZFDNhdQ5DHFiKB31gx8xND7H6Jp+DaJjXXkLj2b7ncLakZEuwTLBI?=
	=?us-ascii?Q?grATBz0ibsl9HN4sugwR8Psz8P?=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07a6a84e-29ab-40bb-c4f0-08d4ca89ca9d
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(2017052603031)(201703131430075)(201703131517081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BY2PR03MB474; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB474;
	3:kIIlVU7QvVjH/0oY+JIZmD/rUIFkfCcli/RDXM7cAzPK+ujjIgv1wAGD/9QdtiKv+SszZKLpYA2hiOlAlvqMTvQH9KK+GGVOl4UeDNFCv70hhMTqK1QBO23Lq0lFt4Fx36UBY7ESnTibFWuCDOGX2ylM/JKpIYYQPmlRsbjYXnxIizn9pcM5vDnGV6zKijYQmm3m0ux8cQn0dZf+XhSZREEPDvnekwdbMY/ld7QAlUJ0ieuM1oSdPrwo4OGqfuSb2eFZSeUyXj1T1zKEIhqo1/NHRf1E5S1kggd1JTju9Pla8Loyc1OneXcfC1TTi3sqfyYNvcPRudXqcKOmwJIi7l9kJZi9jWfCBIumdCV4te2l7NvpuqLDwM3LC34hWRWhEtZGMvSveADlFwhVdy7ThZ8mV64H0d88a+z3It2Ys1WZQlOgOyUGirwipOpsypqay9pDkyw7IYC16x6yoSpvm9SnU4lCucnbPyku6M05qojpidkD8JGJSy1dfdu65Ksp3j83/PvUiNHLHHhzAdQmS74E/Zb2C+pjefCskEwbz0Myb81QbFjt8zbDzJSSpW3NoDEvs//ytYv8LBXUBvxsH2xQq8f1fqGN9GnBESatmcfKDVQwNy6F+Lst8/PHUJZOOiGovX2ZNokp0zR1a+wt8XOA0P14kdCWgSUQ0uuPOGr2eWpCX6IljZXKl/WfKbilf5cebP1buxAZYrfCffWc9HAS5iLEo1+HpbYmTDvCOZOVFh684xZ4+F8IvY1xt4vOL9EemqOIPgXQeBQ5fdoipxTefTmf+ApyQ/3KlWwqp/lniX7VKN4YhenV0G5C6ivs8fe0jYDeeDvz2haAwsWoA2PL1nOx+ogEkzb5b5zbI9A=
X-MS-TrafficTypeDiagnostic: BY2PR03MB474:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB474;
	25:838TvU5Py45m94Q82NVHWeM0wade1dPkDAEiU4nNt0B/PTEG+pusY+/fN4ryozb5f+1cDAY2KAOjKVncz5uQoITJ6SutI+oh5QTbG9GhXZvHDv268yzjJ5XLJj0mmN0cDeUdq3eVqc2ThabhdO1wA3eSJPkpvdeTCceoXbbkntjhGQpG0jVdqCKQnxsEu1Caoqp+Elk4vgxtuMvwOU+qNqP5drw7ovXTa98BnpG9bNE3ay+2n/dJNEX0SNXBOkK6g/fX6CTadmEe+zs/3nSOSz+PD65cNDLzwNKZlJ+9nooItR6Us4+UiGBD8xunEGVyox2eb6CPR7ia/RIkPA3rST3B9tsyuC49qTH6RHPvRdruh2rgrpvybwf1boCd27ZJiZGycHem24ts6kDQEb3ocxge0Xt8SXUUJibvsQ+bi6VsgE6vdFFpoK++OZRCA4h2CSDDMrAiI+CGz6GsrK/BZTea6xSjyuonpLbtuHQsM+8lG/jXtI13gJObetwhv94Re5LeZIT5+NNPy226/cVHxKfejP2sZh7/xsRUm4eAp4kBoP1mJ+oFf0Ib4scKOyCCyIPJGk40SNrI4w5crOmZ3mxV7GJ9hOjD0Vg7+hvs3F65XW5bmo02RhwI7t7GUH4QnVNjMv0nUg2rXlLtYXf65aFoBUmKrC1wsZPsflZGViY/Aq5Wu8N5BNrNrORgh+vLFv3cAY3IE3AWDwQ2fUZn7Cb1T0sgkAdet3P6sZa86S/AoYV0JTwhdIRY3HpGieVznl80I50/bvkuorQ5SQgxiDbGQwZ6gwmHnh/9D2xMmjMVdSwsRk5yCy3WxAQzpgJUcBud5CC3cfRhk6bSOKtpEaXs9fbDFErfBwRtVx8en0kCtlQTfjuanfBJ7Tlvu+wgv5rFGc+oMPsq9yJ/x+oM6nO7eNGsKIevyanPxnqLXl8=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB474;
	31:5/ijkJBFOEy1plTdP2yHuT+utwVPWXDCNYB2A6Xp7o2i3KqTWBW3sTFxMzVonYV5nnabiwOshX1bLo90D6XuimbYSOiokikY3/2wAnAUw9dnsH83nBlLZ6kPlWtF4SlUHMGXdeMX1MHsfrSFDfV5RYkQIVAgb+us285yI5lDYASEiEcizKAjYyah5ptzMzXoXFS8qWNXYVpnuxZ1mq9lNPrbs7yHku2iaITwvtcA3zgXeL1v3r9UDJp6aTV5f8Ce8MVyH/+ijtUOt0YOmyZcLOlEa9d1Rptxa7OgkCm7TQ19VDAPmjazgn6a4c0zMFLA67Fzu6drJzCz+Tyx3SESHxubuV7B+Q+MRGCA9q7BvGlQJzVgs3M/vPFuRs+q34X5oi2Whaf+EiFH7MH+CPAPg/vLzgqkJ5APyh0m6KRio8fW24oMtcd1jLGBB+MXAuS56yeOasWzaaZHQojPvyAVCLvQw5IjyLLbDBf0wZ5TilkZW97FHPZAdrlVxNoYYrKRWF4X1NPAEdKMTkkUAa6gs/sOMkay1cyNOe2ci3IT7RGaxvCX2GIf1xb4j2Jh+do1cxOkKKWvk1gCmkC2uRciKMn1BceKT8Vj5r1PCrfgtrZk1LL5arrVRGAaRAUkYrWuvWgZzLq8Vk9r3HdqL0aleTSmTjcUhuRHbUh9Am/tCqPF8PMdG304hZ+pKf/tlwEoUaLLrhCCz3vnI7pj/iTT/A==
X-Exchange-Antispam-Report-Test: UriScan:(226959686518644)(22074186197030)(236129657087228); 
X-Microsoft-Antispam-PRVS: <BY2PR03MB474F4C80FB732757A2356CD9AAD0@BY2PR03MB474.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6095135)(601004)(2401047)(13018025)(2017060910075)(13016025)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(6055026)(6096035)(201703131430075)(201703131433075)(201703131441075)(201703131448075)(201703161259150)(20161123559100)(20161123565025)(20161123563025)(20161123556025)(20161123561025)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BY2PR03MB474; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(400006)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BY2PR03MB474; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR03MB474;
	4:75Qiz9An3lT61eg7MTSE/YvXuT3U2v+Xubsyn5+HQVi?=
	=?us-ascii?Q?1YJXRp3Jov8mTuSvkIGnp0TgFaaJNXFQnCG9SvDww1Nk8mg3lqZp7tDR3Qh5?=
	=?us-ascii?Q?W6xQuHCOo3S/LEUuDxobWkqsmHipsSRW+NnFMy2Wgd+b5I/Tm8kfJg4hEHpK?=
	=?us-ascii?Q?6cPPQLaHWJnoTNyH1JIqUj1EakofHVNJGNv8mFpZTC6IQ2UWosbZsKnwDJE7?=
	=?us-ascii?Q?e+oiXiG0nf8fk9AucZkM3XX/mL9Fj3u/5L0IzVRoknTfHtWS9R+HXIWZuXzP?=
	=?us-ascii?Q?v4JbFUjyCHPCu3jQI/hEmm0HUmdTRq81KM6cnOHA4Hio35VLETHclWr3m5WX?=
	=?us-ascii?Q?VN7sJRZ1QcFcypH2L4/N6YlkEfoZyTeO3bVvr/6sGR1hfCm7rePUPx8Mp82E?=
	=?us-ascii?Q?bMLNge+66xtBssN3Dm5qMRxlTtQis1jWuu8HQsLXczCAd6cWHDIzclWiPQPz?=
	=?us-ascii?Q?bY84gsnpTCK92C44ke03IXDJHpgeBtu5Oi+bZmDlM+ej2WQlYw3hZztCWSlm?=
	=?us-ascii?Q?4k9jDJM5oEyy3izERUR93m5QKZlHHw1hgSxr8THt5OfPFIzVPYCwq+rYE6WB?=
	=?us-ascii?Q?U40jGwsbTF/GjCLSuDkFttH0LAZ1Y983e5qAsC7xPGmMp9nGlDhuB8REkPx0?=
	=?us-ascii?Q?ya86vqANrcO+YTasj67YKNLa3Eu8MkPpfwMsLOGBWbC1nNcOwcEglThGgCth?=
	=?us-ascii?Q?ZkdKyk2oqaLjG1mKlo0RgYzYA+oLirSn7Y3N95qsvr/knwDsYYTtQwml68Hv?=
	=?us-ascii?Q?RkoV0x3DSQBghBLz2yKg4zb+VLUs2p0CUFJgip74x7w3dv7NiUo8eFJK4P+/?=
	=?us-ascii?Q?ejwhFyTjyHD3xeDMcZ1Iv1gYz7PkGbUkb8V4aZoVye3pJfW2WlOM5Lm2ml0p?=
	=?us-ascii?Q?jwoS1OMEVkjHAWmZ8oPwwxKW8UQMwVEw7brxIUOI9HvhHZcUJcb6aVRhi1ja?=
	=?us-ascii?Q?25dGy8iCov0cvVE7aAiELZ0EblYO/06hoyPyV1bjh8l5jwxDZr9jp+z0yYz7?=
	=?us-ascii?Q?2Bo8S9rJfZ6y16nfiOqHQXkn0UGdP+XiCXAEYkEMSmzYx0kNpo8GqDbbGBW9?=
	=?us-ascii?Q?VGzNnV96w4s73A+CeGJV8RC6QS+MIgyzr4HAiLp0ynT8mXZ2M0m0bTGatYXz?=
	=?us-ascii?Q?/5lZSKmQ1LDFetsA2WVlBv/o28piShZKIoZ5mbufzFjZqrjdt09rjx9BXkuW?=
	=?us-ascii?Q?KVIoBpupbz2ZuwtTHLdBTw1k6FmE4CLcyaikuundfnfrA8NG/jEdm2QFy5Vz?=
	=?us-ascii?Q?G7tVaYkfnI1K2l3La/i246hmzT07lHTbPk9IKafS0A01DxLpFu8srONYtEXU?=
	=?us-ascii?Q?kNmiYJt9+hCEuliFq4BLXR3+8V9nw0qxaNDeNqxq4iuUKAVN/L9s3+QWo6mt?=
	=?us-ascii?Q?NJA=3D=3D?=
X-Forefront-PRVS: 0368E78B5B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR03MB474;
	23:jHplNoDAH5IfdFvuGR4SEhssezSHldJy76yrbk9mYS?=
	=?us-ascii?Q?9DMS7qOOVIY1Xny47Rg79dupIPmql6e3gMfLfjH+T0Cuy+bnr1fCsmV2DIzS?=
	=?us-ascii?Q?TbzYDKRd16ncBYl9i8PgNiNb3RreFqQov8KNrbTPbC5Fyn/ya3Dn5keKBc6g?=
	=?us-ascii?Q?GlBgB4P2J/RPop59Krdu1DEnnIDg10HoCJbBOGruvkAIO1ytli162W8YOJDw?=
	=?us-ascii?Q?uQNf39+LT0k/O+Qz3V5wPuSJi5befyVVpaKrrrlepbwGtiyQzbPnfHbxxjMF?=
	=?us-ascii?Q?X0FajYbIvznKv3rCF/0SAV4Cc3CMWtA9OC6Q2J1poVlxStSpF7mgeK4vwRHZ?=
	=?us-ascii?Q?dkp/k9EVX5TbB805aChyTxr13uTYtywUErfeP5DMx7lF68ur/5ygcc+w1O68?=
	=?us-ascii?Q?WbxlBuGM0d17ifh2QG5QxyAO2P9G+Sq4/Ow4BS2F5AcymYWGAk0Ep6GrMoPW?=
	=?us-ascii?Q?A5Op16K3hTJb0UXvccgBjP0iBqew2bSoQTp7i922uOJK22EeTpQHsyj86zko?=
	=?us-ascii?Q?eHFZb3xQo2t8hGDfoZKzKDk9U64ST4DV2OVGCk1VM21tRJVNKHQLIc5+4/Iq?=
	=?us-ascii?Q?+nP/UVR6i3yK1tJdL/fPtt8HlKtf6fYLen+eUm0YE+rjEfNYS3zDn/xhdy6I?=
	=?us-ascii?Q?ePvYG7Hmo4Ik7yF3X6WjVLOC+8ejeJUKEZJ/er2jeCgWb35nYnzDCsCQka+R?=
	=?us-ascii?Q?ujs1oLhqnBovFZc/s35kEOEs90+eCsOUxQ/Q5Xdd4MJwcc4/N5kkufghw9qi?=
	=?us-ascii?Q?HeEbxMoSNk4pIMKxgVMRmrJY9BULf12gLsC1h50YbUiVGKLMOrJTnbGR5EPQ?=
	=?us-ascii?Q?90SYzNgnyXy6TtrFn0BjONdptG1PP6LV2k+7KFE6mSPloX3xkxZT9UzY+QH6?=
	=?us-ascii?Q?cfHXb0DgaKQMX39gP7mNLuSpHCphZ+eVs6vVShGJKshf4Wp6Nsko1B9IMpD5?=
	=?us-ascii?Q?pe8EMQ3Qlkg54qir1f2l06Wz01fCFQsymVC2vIOlFffIVavFzaRUZQH6kGen?=
	=?us-ascii?Q?/lvwKDAyXfkI7ovAIWyR7LH4VyzU0x+mOu+OtoA1fyq2QkOyXIaAvZEZWgA9?=
	=?us-ascii?Q?iC1Mn1Kf7OjUgmEoJ82QT9BCoCP0UGzBGke7O5uNL3hsSKUm0f0dvofXSmwb?=
	=?us-ascii?Q?/6t5ddTmaoLrw+X80rb65XDUAxa/n4OkdEmwekkhBrfRr1CRhTDPx1f75wfd?=
	=?us-ascii?Q?djt1f94/cG06V3u7LrABXIZJFjv1z3hu+lRCSyLmxmug1qpoqLyyTWEpsyt4?=
	=?us-ascii?Q?/7hGoYCk6bYpnpi7P6vpHeumCHszNS0sKTPY+HxqrkknVXAvWZSnV272bQHg?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR03MB474;
	6:FkcWusng/i4Nj2xw2Ya/9aifgdj4I/oNziBQpGMaAUl?=
	=?us-ascii?Q?KvrTj4JwVum+cPlZmXSfgwDr2avmmiGo9J2xTlgFhmbG18TTeQ6mLvAIYkOH?=
	=?us-ascii?Q?zV3ggVDNFTsXBfBw22hLRRPdu7EuFX+n69AXetYtcj1oViyHV4aZ9PP6jrsi?=
	=?us-ascii?Q?BMxU5B2tUTnJ2HD0411g3AeWv29AZqKIIjwg2i9SSpxbiCREAQutQXDCtR+A?=
	=?us-ascii?Q?eGDEUtK8JvGkGG+MAaJbNU9Ryek64mMmMwdDlRg/udg7jp/itXatIHjFmLR1?=
	=?us-ascii?Q?w1yNCbNK/hlQthDEmJThFtUZeH4PrHXifZNbWC9RY13K7CU7cXuA1QqD2vK2?=
	=?us-ascii?Q?PBnABQ2iBUM7NdGpi4bs55h4jO4BjCv9vFwDl+nm/GKThkQI/KeZIO/0UJ8z?=
	=?us-ascii?Q?cI4mmy3YRbUvMZe3ReWdfUn9+S8o9umub8zytJmUYL2M55P7fc6G5nl5Zz+1?=
	=?us-ascii?Q?sQqep8MDA+ttvN82a61RybT6TdVrn1rqzHKRNYsdKtzwvij1JBjYaetnOFwu?=
	=?us-ascii?Q?3C5t0foB9nEg70Gx88kfcUtB/grqFnNdYkB+FjhHOfX1j0YuyMt0R+7GYOpH?=
	=?us-ascii?Q?NtbLb9QZKMz4jM8zHfwQdjqnXglAXBpwFA6EvD6c+zFzOSl4h+G3wH1PgFuP?=
	=?us-ascii?Q?frc+IA9ROkdSN0Q0XjVtMpOsHDuC93TbGtuw1dl3KK1MsJAsEfqbbyvzBukU?=
	=?us-ascii?Q?TPi3ek21+LYkRgODyizoDrptMO6GlXcHzncGaebYMpVO6ObrA4ZZ6eMo8sRV?=
	=?us-ascii?Q?zj3eE3rwYanCoC/DyHob/9qT5secsQO09s4vtdOTfHTvE8CVn6Ev56lvHyXH?=
	=?us-ascii?Q?rrkvOjWGcDnJRMagRc5WxHbiiKi7LdxMkWqXVkDLmWVP4COwjX4Od4noeXWj?=
	=?us-ascii?Q?mTFefIo/LD5V1sBvD/RG9fc7ULoFW87jZpSXHnteMc4wkPgmFkPm6N3nodzx?=
	=?us-ascii?Q?LbsFJbSmSsQOV1MS7FB5tLH8JZ/4wFFCzM1ZhFA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB474;
	5:3IEkZZfTtdLQfiC/E2ekfMXGFgw6sAVVxt+M1atTIaI7PsIOpD37i1D+0TRCAJFlH361lnS48gssrpcp+E2fm1YzX/9iQpFSL1Fej8LcBMLPgteDNEWinNwY3CTLJ9dgNmM7ftLsrTrx91lxE6WB/uxt8fKHuAScLyRpUImysvSHB3DmYtsSOu+j0zRO/35z62gsYfOy2xPYJCRdwnkHlBJ4hUFtI3yg8SjBXfgQCmhcHNjZEefZgTvB9c3hPFX2ALN0QbjYIcf9TPaKj4ce3xH2SN6yeQN0tSFErz8ZgHvGykOzkoJeVUdFa65FE13ft5PAkF1sRZFWHDr5RW0apMqULIdtNFCeQL2tgKaei9m2iy0hJ8trHUJP04p1m5h1l+MAStsXvG4c92O25k+yQo+a/lnx0W5g+eLfVg8brcwW1h2E91bGEt62gqlvUGtaSh1tlbENspXcISkrfDhmmnIbjuPOfY6KkUbpB7hveENX5QpcauJifNRkq9AoJ5iyMPrpK//nKsOs2awRrBh0oA==;
	24:/Ktm+e74fGjNcfnuGNFhu7UFZUR9KqlKbhLZGl1J3+g9gWSG0IF1cT0+YKhDfWVOnvfiMC79fyi35jCw9fk1FANItFkmwWCrlL1zejHKw7c=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB474;
	7:j2ZljL6fVTwkFhL8LtZFuwckPPRMmGx2CLei/NMwCTKhu+LPZiQsyipIfcLmJnk3LPiaBgub9O4Wt0jQeB75OdhuDrmqJbj6gVlXhjTdXJDN1uSNFY19ShBWBk8IBfSRnLhEgglM9LH8Cp+iZd+dwpmr/k8BQH0Y2L9Bk4LvCJZoRilS5sYc/aFhl2xh8ZILFCz2615BC6gkrpcQfMy+qcQDL2RNgT6xWiUiffs5hWM8Het7eVlfHyZMkKLR+bkQBo64K7Ho7I8eNCs2knqDyE/lGOequCDE7ylbiXgbYCYCRvQoxHzGERyh0hTKiBiD4wmo5ks+vlg/vmdyc4ey+0b5hLoyTJQAquv2VY1sQbQkOzdSI+HBYJn/CdJ30tpMvSdV0fC+5McbQujkx4YYbD3g97+cyusGJwTQSCKjgihrliQNMswc8bTaJifZe/KjikXCtjTTqXJ2xdGwo3XIfuWm5etumtv9wd0AF5WnuSpZXXl0r9xn6XSsljL3sv8ugo5FzMSVFw7ko7OSdwiAezNRFzL4TPVmQUnxen7jM4RrdSiHkIhjBHh+RGh9e0Rx7fVxOjYhHbSQPkDbHLsqNlv2k3pGtATtzm56ilEd4OrbTGkVWLHg4L10mZ3adyl/Y3vJQlIhM5Q7LtpQ5h6g9kuJ2stcOb6DNmzvQ06J/u765D/EXLPu89okwE3R4SW0/LMiGaC+ZmHWkK9KsCoURDa318aCDQ0f132SqlrZ2sFShDf5VK99XFYqmCkEkJqtqY6w+OlTXMshYxeADzE7ACdi5ivET2/zcYbWoDyBbHs=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2017 07:27:32.2566 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB474
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.67
Subject: [Qemu-devel] [RFC v2 PATCH 0/2] VFIO integration
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wei@redhat.com, kevin.tian@intel.com,
	Bharat Bhushan <Bharat.Bhushan@nxp.com>, marc.zyngier@arm.com,
	tn@semihalf.com, will.deacon@arm.com, drjones@redhat.com,
	robin.murphy@arm.com, christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FPAfFKGIoFb5

This patch series allows PCI pass-through using
virtio-iommu.

This series is based on:
 - virtio-iommu specification written by Jean-Philippe Brucker
   [RFC 0/3] virtio-iommu: a paravirtualized IOMMU,
 
 - virtio-iommu driver by Jean-Philippe Brucker
   [RFC PATCH linux] iommu: Add virtio-iommu driver
 
 - virtio-iommu device emulation by Eric Augur.
   [RFC v2 0/8] VIRTIO-IOMMU device

PCI device pass-through and virtio-net-pci is tested
with these chages using dma-ops

This patch series does not implement RESV_MEM changes proposal by
Jean-Philippe "https://lists.gnu.org/archive/html/qemu-devel/2017-07/msg01796.html"

v1-v2:
  - Added trace events
  - removed vSMMU3 link in patch description

Bharat Bhushan (2):
  target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route
  virtio-iommu: vfio integration with virtio-iommu

 hw/virtio/trace-events           |   5 ++
 hw/virtio/virtio-iommu.c         | 133 +++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-iommu.h |   6 ++
 target/arm/kvm.c                 |  25 ++++++++
 target/arm/trace-events          |   3 +
 5 files changed, 172 insertions(+)

-- 
1.9.3

