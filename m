Received: by 10.25.205.13 with SMTP id d13csp693541lfg;
        Fri, 16 Dec 2016 05:42:19 -0800 (PST)
X-Received: by 10.200.45.129 with SMTP id p1mr2541695qta.96.1481895739206;
        Fri, 16 Dec 2016 05:42:19 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z127si3167224qka.302.2016.12.16.05.42.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 05:42:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:60592 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHsm8-0002DZ-BZ
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 08:42:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1cHsic-0004lp-D4
	for qemu-devel@nongnu.org; Fri, 16 Dec 2016 08:38:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1cHsib-00063F-FW
	for qemu-devel@nongnu.org; Fri, 16 Dec 2016 08:38:38 -0500
Received: from mail-db5eur01on0138.outbound.protection.outlook.com
	([104.47.2.138]:22989
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcin.krzeminski@nokia.com>)
	id 1cHsib-000635-53; Fri, 16 Dec 2016 08:38:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rDwqaAfLQALyfaKGrUdCW8FgKdXJgttTHOBgyAn0zxw=;
	b=cD98L/QvnPPFgZw9VJ+7EG/aGKck3xGVLWJZr49ssNZ4N2oLfCGyPbLBr1iPiRUaI9rrZ3slMI58/Uz0Kt4KBvYYa1Hw2yB5N8P+6hypBnRR8dL985HwSeDsL06Jf8gJM6laBm1VyG4L94kWeNXzbcMe5PDCtN5TYwQhwOEt+uI=
Received: from VI1PR07CA0023.eurprd07.prod.outlook.com (10.163.160.161) by
	DB5PR07MB0806.eurprd07.prod.outlook.com (10.161.196.12) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.803.5; Fri, 16 Dec 2016 13:22:51 +0000
Received: from AM1FFO11FD023.protection.gbl (2a01:111:f400:7e00::159) by
	VI1PR07CA0023.outlook.office365.com (2a01:111:e400:533d::33) with
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
	AM1FFO11FD023.mail.protection.outlook.com (10.174.64.212) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.771.7 via Frontend Transport; Fri, 16 Dec 2016 13:22:50 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1301; Count:15
Received: from fihe3nok1348.nsn-intra.net (10.158.36.136) by
	fihe3nok1346.nsn-intra.net (10.158.36.134) with Microsoft SMTP Server
	(TLS) id 15.1.466.34; Fri, 16 Dec 2016 15:22:50 +0200
Received: from mailrelay.int.nokia.com (10.130.128.30) by
	fihe3nok1348.nsn-intra.net (10.158.36.136) with Microsoft SMTP Server
	(TLS)
	id 15.1.466.34 via Frontend Transport; Fri, 16 Dec 2016 15:22:50 +0200
Received: from fihe3nok0735.emea.nsn-net.net (localhost [127.0.0.1])
	by fihe3nok0735.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	uBGDMeNW030201
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 16 Dec 2016 15:22:40 +0200
Received: from CNU418C7XK.nsn-intra.net ([10.154.154.85])
	by fihe3nok0735.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	uBGDMeV9030178; Fri, 16 Dec 2016 15:22:40 +0200
X-HPESVCS-Source-Ip: 10.154.154.85
From: <marcin.krzeminski@nokia.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 16 Dec 2016 14:22:36 +0100
Message-ID: <1481894559-13974-1-git-send-email-marcin.krzeminski@nokia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-IncomingHeaderCount: 15
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:131.228.2.35; IPV:NLI; CTRY:FI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39450400003)(39840400002)(39410400002)(39850400002)(39860400002)(2980300002)(438002)(189002)(199003)(92566002)(97736004)(2876002)(86152002)(38730400001)(86362001)(2906002)(107886002)(4001430100002)(22756006)(189998001)(4326007)(36756003)(47776003)(110136003)(305945005)(77096006)(356003)(50226002)(8936002)(106466001)(5003940100001)(8676002)(81166006)(6916009)(33646002)(68736007)(81156014)(6666003)(50466002)(53416004)(5660300001)(48376002)(50986999)(626004)(2351001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR07MB0806;
	H:hybrid2.ext.net.nokia.com; FPR:; SPF:Pass;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; AM1FFO11FD023;
	1:lTQbynkDYYdEQMPLLpR/ltec2r8iUiWyuiQ5mmrOE91WSmWTSx7Wdg9bDJW805h4Sf+bgudR2bMII6JkNggpEdQxJf2JGTZIwPN5NpxNxBGioNpYkfqiANKaMNKZy3LK5xHc68MWPZmboYC69ESCraFNhlHmpWmnxvVPOiSGwSa8rNVd0oa3hWo3AGZn6mfR6YxyrFBniRXfCVhoN4rFR6F+wGDc0YQqbPu4urhaOxz3LHPWCeYJxNqBXNFgCVOnRR+VDw9M0emX3wXVYWq0zP2M9FmKc7X3oHE3jWLHS/9pJwWZ3jX8v0TlO6+YfTxBHbqe2g3+GpyNtk78OtmWskrB6HywsQ4+h4nu/aFafuRbXI9d0RhYrLhZcS5ZWVi2OHy+sUlQbtqbTWoVDJiuLf9FYJXl3Fs4WVj7Hr7CCoVUE5VDedvgJfjied1hjkzKMJMQIHcrGaK7ilNDX/Ym2m86228suI98E/Vj4c471gSVV0MLKsXOfLGnYyZTcZKLmt+gRWvoBlYEIAai8N2M/g==
X-MS-Office365-Filtering-Correlation-Id: 1183e696-231b-4d4d-6607-08d425b6a2aa
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:DB5PR07MB0806; 
X-Microsoft-Exchange-Diagnostics: 1; DB5PR07MB0806;
	3:9ys0L3kmEi164MDmj74bGLNyyQqiMPGKiHpivHnNO54hSDllTa/3tYx9fCCfSTuxMVm+QCknXCzL6H3+kWnc+oh0fAGAtglP/WzssRDUHtbjX1cSEm9sp4yFdlQr0iIPvYRlqy4xf/rA1B8JFNVrN1OoBl6uE7Nw3yOcOGMsisMbPJhA+2o9RuujW07pXtEu0Zson8HovCFnvGBEvLMswnqF2/17ENTIDMlSRK2Mz5cWt83ybYiq1z2Pm+519tkeK6I1ghC/oi+CBkQ3JQiWcxmQV80SDNifQAdIGGONrKbo6DExir6/zRdtCwVLi2JuelxiFN437Ld66fmswp8WD92yAMgh9XrhkX3XPdR1bFRxjpeTtARbG5i/krvcZaGWC9ue/LSnpyk9Qm6CqqHDiQ==
X-Microsoft-Exchange-Diagnostics: 1; DB5PR07MB0806;
	25:OqNXx4KlwSbrwtnPks7oIK7Bd6gGeQImvYV/uw+UyjwBatcVENgxQIe242YsBvW7+nMLQScAOaJoT5PaF901szbN02brJK4L1+fad4xaZMEwC7e15KZNlakTWJF9U0vWCszFeY/9evL2ek6d/SSrTWTwM4TH4HjJtSBTY9eX6rViedLTH45J/gqq6qLwQR4pUcZ0Zo3arRyHeZEBe0kHud7SbHOvSAweKXQ0aNER+Yttjme9zoHsVO4KSWquHGeKVepYk/WtAOBP9MFYUsS1ffPJFRf6XG5y1xfPaVJ4z7f/5xrsbPlxDhElJQXM4Fz4hjv9oszwfqFZh8M2Y14g7gwg2pFwamQKhlaZmAdWuoWMV8N8t9VGHY98ZPsHcqe3/4uXxrWzZKj5ceddRRh2u/AfzIy4y1I+Kl5hTRDKYQ5ngO6Zcy7YXxyKE/BgS5CRPdQkEj4hx9FYvIq0SKJnXdfGassl8DerLhWqeGZlxZkyTJGaNXmsdj97G1ISf5CbKmj6PmZ87OkxVv69MfdtyrwW528uIi3WfIwb+h5ssunxVyyFXExTMFYbZkkhWkYOvQr4UXwusTnsLZaUnA3Ae7k9YbcAHB74bat25ynxNKyaJ/zOBmvck2+xKqfO4DdvNO1ZzJgJza0nnp9xgU3bPnnP0vRUOjML/3vgI4Ow/bWqbLNFefjYpCBgQWUeX5pl3mFiVky+42PSRE+x/EyDt5+VvcF48rmWOQef37KMvMY0tNZES6XE1rGvOxm4mMMs6Qx9EXx/5Nd4gZd8ohIvcQ==
X-Microsoft-Exchange-Diagnostics: 1; DB5PR07MB0806;
	31:p3S5Wbu0STbllvZUOWDcI7PZFPzeVrCD62r60V6S5xh/rId3XlIJRJ8jEs5aBT6G95Ji8MHFyfvrvLGZN7Bu9fQu2rVyU5KWKFYMU06C+F1D12RyAMDj3WkoOLEgSNiZtO5712A1MXSPSJY4U4Rii/PO0qutMCvbK8WarLeLtojbW7x4hdugmXK8Wx/kThqrbB6PVqfdlTHr8WaR7nZDVXRdUHqQLgy9754upgcXhvwRIFVTrMEyFZDMz4JqjFaazj/KPupj7ZZjqCUEbBJUVQ==;
	20:/ubVzVa0fZIZ0MNaUWJbmgLRtd7IgEWN1wskmMqBZa46m7J9JbcWVt5cIIcWm6BpjQmJfqfTszlV7stMhd3xQLF0AhSWXKp+R/WbbMdBA83RJR4qB9SuiqBpp9q5X876s20TJTbuzBvPY5vQvlO394ecBJR8uS6PQ6+dcYacbaDR4vRKN1rEa2bcCAfj2+f3WHiOUtF+7wl3ssSfeBV/6KF3u0HknVCdx8XVxt6lRhIybg6TTq42aCQrvYZDWZlYInf/aNMKdq+Jbi+YUo5WD/dRzDsr1y6B1DBLQHNV1XAV8Go47iOZ34a2ON6aJ1ic6N/dirDTunmRrwEdK1fvDUPvqhPRmnK043PixlBZvVV50UdhZ7lIh25JfYTnc0Q2rR+pc/g/zjmvgjYN2UMpK8sV2VajW+RdUz/KS9P7wInbc3nW52vjE8ilZg+08sEQlIrZ41YvmG+R/jdmApghyO/sA7uW9Ty2CIYPQHVdUJX6rXzH9fdtDYym4THRQTBU5mX4YbrN5TNRoX0MSWvwzPs66juEL6XFjp5s5MRC575nbOAdmHOL32HIeLoABobCoOZtBrI4JLPyHxIAjdaUI2j0xtV1wbcvhmoJqkHZoXQ=
X-Microsoft-Antispam-PRVS: <DB5PR07MB0806FBA72AF9F1162654A344FE9C0@DB5PR07MB0806.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(82608151540597);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(13018025)(5005006)(13016025)(3002001)(10201501046)(6055026)(6041248)(20161123555025)(20161123562025)(20161123564025)(20161123560025)(6072148);
	SRVR:DB5PR07MB0806; BCL:0; PCL:0; RULEID:; SRVR:DB5PR07MB0806; 
X-Microsoft-Exchange-Diagnostics: 1; DB5PR07MB0806;
	4:a3A+GXnrycWT83g7Qh22uI1vtPE4pXA3baQFMltrbIZ4YkOshZsyLMhZcHGLBEDuMlneS2bL/AE3HEjPEQoHb+rXQUfCuyDGZdkhbB0J6+FV7M+EveNzTi2lfrIadt6gCKBHpMGD+84kqKHWbNE7iJuRbTvQb17aY8fN0PJ04m7bLDgB6a7UUq2mV9OeupYhzdsE99juUav7E5j09DKBjGPDqOmC9xj9C1mkVjPtATknWK+ky32GWtYw2WPIvfYpHymmHbo5xZoOeRyt/FMnkMOJYTnHgQBZ5a4yreZSwATMRU90hBjHMg6wccVcQn8+5fROO4boIDLhoxBuJds6AZSody3TJpsEdb1/8+L66zQ0Tkoo7pL/6eFcpNypr6VZ8s8DL3a4xF1ytcFang7ghzpW30WZ7MNt6JCZ9MyB00rjn27k7rAs+2CecfwP4D5p23wzneik//LZ+kE+BJnbtY4YhvIevPc60ZtFe7ycY0K8q2MNwpaICFFZ2zbid9L5BwRWIGFxA64TmEJrsYnuSDnPMAQdWxv9Fsu55/Yj9uFT0io4nsn5/FfRIxiyoQwgKYUTL46giRg7Zezqbz41zcFf0FrjhzbBbsjo1tJS9efDAr6FAygrppBlOhxAb2JMbTXgkQhxpuk6MLhkouutUCNQFRza5mdLVfoaOZkkSHM=
X-Forefront-PRVS: 01583E185C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR07MB0806;
	23:UudCyEoVAMtBu5py8hOWhoQy4RMOr0wuu4SIiIRet?=
	=?us-ascii?Q?1/c7bclHtKIZJKDxVXThVWTY59wzk+bJbKrUTIxNHE4PzC/8j+ihF6R/M3G8?=
	=?us-ascii?Q?RzpEisDLF5UaXDtOwbWijpKOv/v4roz+E6qPK4cKWF9OdJeI67uZZsE8JQ6Y?=
	=?us-ascii?Q?dtSc/jAnSwAyvScs2majjn+GgWF7+vBdZ8PzOnX4o9RLiMAsoQxueRYtrpXI?=
	=?us-ascii?Q?AJ5Nu/i3ad4rk9KWmK2DIZRYMJmUrWyENv1wwZILs7HVQrm6jWTfDpkf6nq3?=
	=?us-ascii?Q?76fXZVaFHRhwE1yCMnm21fsu0Zih+4Ttd0TMn+gZvwBgcSLPc5zCgEg03quZ?=
	=?us-ascii?Q?Dww+ma6XlzjzHeOS30K8XUjMPU1WRDDJiZlXFQZjctrEV/e9a2hBLxj9/Pjd?=
	=?us-ascii?Q?g81oAkwtjNfM7VfFlH2rEXE5/X+k0/4lkqDm1HTSU9ar7LaF7pQUkrajlygT?=
	=?us-ascii?Q?iK7sd0mK/25+TVNV57NXDvDNGdQYcfUi9r24Kqn2cJ41GmaaGWbSCLu0Dm3l?=
	=?us-ascii?Q?a8TfUBU5T4LzIqLIHYGSKTvx1PLJsG7CfGtZqnaf1kt6zjm/UV3qHSbVW3Dw?=
	=?us-ascii?Q?+V2nDQGwKSVlsxwn28eCC6gUDhEcRzIehO7UNhcXZ8/dxri3VLtDcZJM37So?=
	=?us-ascii?Q?252xHPYRYmYlyq1U4xOD6GB9RwTd8sukmKSDbfXeakLQxD/wuStjJivgJ4Wk?=
	=?us-ascii?Q?T4cAW2xisFvdQCycEo9kvmM9S2hqWOAIpN6ILovK9FqJIgdKC8y7TFneg9ay?=
	=?us-ascii?Q?99opS4RRXAyPEbjGcfnkXvnpJ01j/MANx+lIW+/LPxwzht5nezScpITa2y46?=
	=?us-ascii?Q?QhG6cVqkPoHKEFfWpcPMZLz4Dct9spE2/0Gylh8rIs65cvtnzZUKoMrpeouw?=
	=?us-ascii?Q?eUtOG3boYCq5ByhewLA+rADHmDL2m4vIJ3SGaDBSjIvl8SxD6dvPO2kTdHGb?=
	=?us-ascii?Q?yX0fH+d4/OqmrQy2GCdOHcVZouDu0huKf71s1iNnQw007FrYHFP/C4x1YGq1?=
	=?us-ascii?Q?q5tBlSDQtAlG6XLmVWK1j68SC75V1ZSG9F8YH17s+V8lAZzazfXAhv3sd7hf?=
	=?us-ascii?Q?Bvr2YdXBwjdrtFoETQbO5wOce8Hm5TBYnBSqvhPPVihPWyaOHqZLkkSRxBoP?=
	=?us-ascii?Q?AcXd5BzHaivr3gmLHUXGzfPVyhu3no7JVVN+Su5yE9vAxcxWyQDbg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR07MB0806;
	6:St/Pv43yifo+vDSXigOz/dGD1xUH4FyScKfBkxP7QF8merDmi8bL39amwxfkIwA0vCDAFfQovmkKi6X4B7UA5rDlVIMOjpIpRi2qB68yUtBxrrTqM3aIzLM+rEORxKjoUgTbYHiOgTBZU3UkCP4AGuf0I1LfRk2G8WWb+e/gT7xO8s0BZF3VqE7MdLmYOoTZLXSCnL1Uxn0sT6akip6UmOUNQQUfgAlf9YshlYuxoh6CyUEpQwLL8w/y/vspYPzdVJwnoVUOFFuEiTRC6u7FU1rUOOaZckMgmH6tFp9wy7TsMv6RapkhxXF4XL1xXHpZ+1FTdULG80JdI/flaVXRBxCPmCqKAVHzfdikwzFYXRLO5k4XWu0gLAs66OGSsBoi+BMAsUDbK0SCoc9Z+AGRek17taftU/7xcc8vYjEqqvrCR1O+yCXiy2oYE2HyKBo98VwXdFCpC119p08fR+bhYA==;
	5:cwXnNc4nvSmAPdXYY0drx0tUix/fa4Ibnq4X1Ei6Jb6nmA4GO09GNjNAmGmp5kZP1QjsEz4Au9hbKqDTQDTXaUV2L8zlTNOLXWrib0omFWg7yOVtfHbiq6MZocQc/psyoP7vr8JHxEHUCCqT+skVEw==;
	24:Kp88uDr9tNMMJy0HzP9cEAd7KuEwGG6s9j6stXAAVZZ9UbjVkNWKON51TVGZFuZXAI3f9KxAXFinSHEWj3/xaATZK/m1n4L6qjC1/t5ZP9Q=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DB5PR07MB0806;
	7:od3+6s6gB6tOSvYFG6cNXC5pBVwpYgoyuzbwyMWUx2Gbq3h8hOKcNxPfuxqwENTpE9xJtOLZX+oixtegC45lJ6zg49eTb5yV5hjUrIVaBFrq3ApRgPS3RkFakyYx6oce/oYQAt6JTUkj93vU6TnOx4QqZCxeGqKq2JHrTa/ibqdh/vLt//hUHOKfVDcFuTmjPqzXXuTvhOfyEr5y93Kbn6xGJK1BXDl6g+ctTUppQPMCgTevgRb7SXMxydQ7oYPB+wocYReATftj6mzrS3YMgcrZksSR1V7+EcXcNld/DT3Jlb4oeVbvMnhGSCZcpO3Dv9LwFAOX6h2M+0430lk2rcyE3m+tmVFHDsDEl4sr83wy3u9neEE0i4PKp01eKvgZvvqOvHDETFE4xRZKTEuBEu2+2LPw1dcZWxuVAC+56nSR2mQwjCdsC+zVGPlZSpr0J+0TYvHETMyyCXfAVkfwlQ==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2016 13:22:50.8498 (UTC)
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0; Ip=[131.228.2.35];
	Helo=[hybrid2.ext.net.nokia.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR07MB0806
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.138
Subject: [Qemu-devel] [RFC 0/3] MultiCPU changes
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
Cc: peter.maydell@linaro.org, rfsw-patches@mlist.nokia.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cui8wYv8Cg8S

From: Marcin Krzeminski <marcin.krzeminski@nokia.com>

Those are changes that I made to create SoC model with 2xCortexA9
and Cortex-M3. Generally all are done to allow move work further,
not to upstreaming (especially patch 3). I would like to start
discossion if those modification could be upstreamed.

Marcin Krzeminski (3):
  nvic: Add CPU numebr property
  ARM: boot: Add option to skip FDT memory node update
  exec: Allow to change Address Space from board level

 exec.c                |  8 ++++++++
 hw/arm/boot.c         | 29 ++++++++++++++++-------------
 hw/intc/armv7m_nvic.c | 24 ++++++++++++++++++------
 include/hw/arm/arm.h  |  5 +++++
 include/qom/cpu.h     |  1 +
 5 files changed, 48 insertions(+), 19 deletions(-)

-- 
2.7.4

