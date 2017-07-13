Received: by 10.25.44.15 with SMTP id s15csp1772957lfs;
        Wed, 12 Jul 2017 23:41:38 -0700 (PDT)
X-Received: by 10.55.18.87 with SMTP id c84mr3097727qkh.12.1499928098339;
        Wed, 12 Jul 2017 23:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499928098; cv=none;
        d=google.com; s=arc-20160816;
        b=SzGQ+U77/JcziGkZeI8ziPuzqlzOPAJj5avKhWc4X8qlBEGPH1gQyvWbzimAa7B/4j
         4zOaLd2dAHIRZI0R6hXVz+bB0WdH2Q7ouzYhnz5niKK2rtBr6AEpncjipMLdZHqAwSHI
         9K4LFFUQAIL0szONduvZSoNvLxy4eqBUc3SwgG2aY1GSSBEasDy69dWtdV7yXrbARc+n
         cTNr/hW41txngSrlRVfCWCj71XOVoKBBgBxoJ18FV6YUBJge8RcnP+q1Y5Ewgt1dXKvy
         cDce4aBUO+SY+AfkEDqZ6ZjiSpvqADatRojO/ZoNCIhF2hZs9dMSaRH0WyYG5/WdiZK6
         1a6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:arc-authentication-results;
        bh=DyPJNrE+g4+6j0jjmlLKxlQ0mSlvkniceKvtQkPWJEk=;
        b=Q/JQe9yfNtPindWdcKgXCdYeeLraOzjeHTKvpJE+TU3zKHBAApqD/eOUBj2ULiYG3q
         fJFvXAhd1tyUed3vKJNFPLT0yEgDpI4rOrxs9WI4lhiYChWdeG4a0uWN8uydicJzy7AM
         TvojdX3rkQZWMdbfQFjhctPIgRVuIdBgJWjfTCkPFh3pFAPkFyOr8i3IifuVT94J9BQS
         /o/SoZey6yYocA0/zWJqJKcHQsEfI21S20q/PIRzDuDJOo9j+uh1S2Q/IeFsI6/QWiS3
         cN03qHdcM7whO4QI9fvtlPlfulv0XiwRbGvpRYhQttxUtWLjR63pMo03yDLpDThUyN2O
         ThfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id k8si4395597qkk.191.2017.07.12.23.41.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Jul 2017 23:41:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:57465 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVXod-0001O5-C8
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 02:41:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dVXoT-0001N1-F4
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 02:41:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dVXoS-0004td-BA
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 02:41:25 -0400
Received: from mail-bn3nam01on0082.outbound.protection.outlook.com
	([104.47.33.82]:47712
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Bharat.Bhushan@nxp.com>)
	id 1dVXoM-0004qj-Fc; Thu, 13 Jul 2017 02:41:18 -0400
Received: from DM5PR03CA0056.namprd03.prod.outlook.com (2603:10b6:4:3b::45) by
	DM2PR03MB480.namprd03.prod.outlook.com (2a01:111:e400:2420::26) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1240.13;
	Thu, 13 Jul 2017 06:41:16 +0000
Received: from BL2FFO11OLC004.protection.gbl (2a01:111:f400:7c09::127) by
	DM5PR03CA0056.outlook.office365.com (2603:10b6:4:3b::45) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1261.13 via Frontend Transport; Thu, 13 Jul 2017 06:41:16 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11OLC004.mail.protection.outlook.com (10.173.161.188) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1240.9 via Frontend Transport; Thu, 13 Jul 2017 06:41:15 +0000
Received: from localhost.localdomain.ap.freescale.net ([10.232.14.21])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id v6D6f2F5013081;
	Wed, 12 Jul 2017 23:41:09 -0700
From: Bharat Bhushan <Bharat.Bhushan@nxp.com>
To: <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<peter.maydell@linaro.org>, <alex.williamson@redhat.com>,
	<mst@redhat.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Thu, 13 Jul 2017 12:08:41 +0530
Message-ID: <1499927922-32303-2-git-send-email-Bharat.Bhushan@nxp.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1499927922-32303-1-git-send-email-Bharat.Bhushan@nxp.com>
References: <1499927922-32303-1-git-send-email-Bharat.Bhushan@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131444016762001665;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39850400002)(39410400002)(39380400002)(39840400002)(39450400003)(39400400002)(39860400002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(9170700003)(4326008)(6666003)(77096006)(50986999)(356003)(85426001)(36756003)(50226002)(189998001)(86362001)(2950100002)(76176999)(8656002)(47776003)(626005)(81166006)(8676002)(305945005)(39060400002)(6306002)(105606002)(50466002)(48376002)(53936002)(68736007)(7416002)(8936002)(5003940100001)(38730400002)(2201001)(966005)(5660300001)(104016004)(72206003)(54906002)(498600001)(106466001)(2906002)(2101003)(217873001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR03MB480;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2FFO11OLC004;
	1:+7puufaNpUjrxbg8svLccxIh4kUUis8MDjdqmvEQS?=
	=?us-ascii?Q?TQu9sMYb9cEmEsoj4hdmRNXXR2qYlS4wxcqgRbAGdTNR2/1ypee+ZJS5KCBB?=
	=?us-ascii?Q?PJClh4f4fM6TA10bF5hQCDbXuy7fSvAMNgbzSGcPavxJe2iJwVrwNYkwSh3l?=
	=?us-ascii?Q?9DDaHyoTVAUHTKYE+TGo8N2I9Fpgdgp/Dwqxw2+v6O1JsdUSCEOg/K7LqwCN?=
	=?us-ascii?Q?UT8NtuzUZXm/YRO25vc7ITq4EihFod9KkCKB2+VUXfQw4lvENal2fmOMUrxy?=
	=?us-ascii?Q?Nq7F6QxEN6LCeBMzTdPGWWWAKQpagsM8QcN53b0XhMsCcHaA0qi4K+aiH1Lo?=
	=?us-ascii?Q?E0xTGt/hLJaQ6yciFk/jeMTlpCTOcjysZESLCUCcbi0vuhSca2wRQeugeUov?=
	=?us-ascii?Q?i2O/EJs30jQ17WLkax6HHHtIYH+pfJsBwTh3096qycyWKi7MGk4zbGzfy2pY?=
	=?us-ascii?Q?X2gBN8EDAVvjvCmJX5IIbDgzZwJqtqjhEACuhr+JUqpmKqbqfm0oBEHFUnlz?=
	=?us-ascii?Q?QBpbegfZDNNbRQUZ5J8djIemdBeOZJHWWqDPXpPxUcYKKIOWrYG9O58CCdT+?=
	=?us-ascii?Q?RvxpCnlWrx0n9fuAJFUyWpN3Bp1A+2O3R7JhAdhMQ9O9mqG1wDYvoCubICml?=
	=?us-ascii?Q?tzVjNYe8dNXn658KPRjtp7xm53a3prPRIa/onb7Fn2Ylig3uG456DAioJZ8q?=
	=?us-ascii?Q?gmnTxDEYbAqQyu9ktNTbVNNGj2UqEFEcmZc1CV5uHfRHsMN3YhdX+SDaUyTR?=
	=?us-ascii?Q?wsAKSah/hRRg/sIThXcCco2sYafBsL7gmV3GdKOg2bfUjK72Aw6LrbiRQ4Eb?=
	=?us-ascii?Q?4MRFzm96N7r7oLV6NxWwMFYo9ZophDvM4E1cRoNYoAwe6n8B86PMG4gtSgSq?=
	=?us-ascii?Q?kb7x09hKwy7ELiIjEwD+gr5fs/Y6XicKrMLqv/EJwI7K6YH/0D65OXwWbGYY?=
	=?us-ascii?Q?sqXFymiY2y14vpNLWNTZX0LAI5E+gvPxEPWMCaJDiwfa7mEwoZvws+iNU2Cm?=
	=?us-ascii?Q?PQNkhF5L71Y2J8sYAT0ComcwNNMQc1xO5AwFklX6LqeDJWkhhL5rDJBwlUs9?=
	=?us-ascii?Q?N4wsXqcZj3VZ+wgR41TW4Q2YDOA?=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24e27e74-90bc-46e4-b7a4-08d4c9ba2967
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(2017052603031)(201703131430075)(201703131517081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DM2PR03MB480; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR03MB480;
	3:AirqMUYi0VKUvGLrXy6UGsZILNGg9kacPbm8SOvGHIXtp1Cd8XtPBKLb+JAtSwSmeMADiOl+prak8Y1BIIvRq0w4J02VktNjp8jXMznk1nISpr/qHR2hZbdpZ4Qy8gEeZMdKWd3WifEFS9ldosBwRWEjuJo4FUzgfwdZFDVytTyqaYAWvYo7SSVYDi7QzhdYD7mGd8Q0jmK2XCdhaltV/w+S3wZzYSGaW+X/rI/Qq2NeD4Rq+l61AfDotNsifQrNG76HftUxOjSt91alslLMW4zJ/Vnb0avc3WT0Xm32hvSd/nDyo1OwCCEtr9ZKzfAHHW9g5UsVyXC9ysMTAeVS1w8Ec2r52jSOctGhkHHHrtI/FfpdXm3oPuMoEQ5yjV2Q/BiyKx87PiYXPu64mIz1T8tXm6yYxfeLrIEZGh4N1DENlJvlKCdwE1xP7IcwGTgk1iyD4qKcJ73nx1OcpQ28zzUTO03gL0HjyYWwfv9pLmH4KvjpMVZ7vU+SrFqidZVL1OLyhQIStvuifzatRiw/nkTjg9bRs1edDDjo3fOY3PPPHvwy/+SDO6tm06IJ3WW+RUtgNF6XdVXzOnuDl8mVW8QYqpKNpe975e+XSnMNk09zWuIaY6cuwfl/zFuSnMD6IqEdQkl9/Dx9MMv3K0mtoAm36bCluFITPU/uNZKboZbTuLDzoyRNGpCnFgYlbePsKf656PPYEzRd+mSI5Ro+AIToFvc32Kc2q7NU/XcDiHQFplZ88/co/mnNAWA7qj7iFyTc2xPR5rsOpQogzIQi/ZmllX8oASYv1PB96RB1mDVMyj6KfmGjgsYFnQXIoWK+L7LBIVVTRCmGcf5rCEkyGBMe4u2H+7YZmA7pNsfShxI=
X-MS-TrafficTypeDiagnostic: DM2PR03MB480:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR03MB480;
	25:mSl79luu9x0QMhHzSjFHxbU/npAnmIK6v+WtEbf24CcdWD0nPaerq42kzV3h9CAIljivRRCJCA/uiG4N8RKzrKT6xrhD68bqf7AjyCVvOmn8HnDeEqk3R/pAN6PcqYSeZESwrFDA67TkqxZPdyE5Vm5Tn9aW3jvmmiV64WIgzq2QUE2Wy9qlbgaXgQESsrXi1y/LAyKVyn71ZtKdfTkJ7nQmM5gwushlyFT2wN0jVi9Q7Z0eSJVufCnGp7ggjIXw5rniUTNrCRbhW4k1sce7g5kmsr8EXvtP1dfvD+VUi3930XpC3Mw7qAhsWgcUcWi8UN9dZFc6ltKE2C3/mU2DLkv1VPmrO8GY6CTMSBQ8LwnNXkFyZIURdGhIyDNDo/TTOAapw94Umfpt92Koe9DbdPIEvJBwl9M8G+b2vHq61KxdWGyve/1XIH+7UZCEJe40Ihp8brK+O1+ZK+YwpSgZl4LqqB4ruAXJvm9W/TN2d5siaYWSm9wiHLlVOAG1kmn5xsWlaoh4l9tF/R4Gp6jNzgRfqX+KhEu1LXIsOjlsF+65PW+d1C/0K9+Qku7UV7T9O1VKT3+4SYKaQGlb6HViDSqwsYi4eHi/eAJGygWRRaISOJGH85Qb2ueyZ07UaGQwzrUJ4IjfYk0k+hcuTrXaQO0jsIPe9VotODRWAm4peDepDugOAebquUxxjjuLkQl2E/Tt7e/4CbZNk97Xo/ka2h69YTNRsb6AcWqsatVcvIGDWfvPy8P8hs6T+qSUMmTJpXXUBMx3liv2sEn8eJPS+HqRzILLM5K94WXPArL/hcVs85e5LAfmDIqOuZWW0PfwXR4xBhG+Zc/b00enLe3B9O2WDTPS7EpMh1iIaDrVnrzsoVme+Yg00Q61f7+CGf06amTnKZHUIrDvhD+Bag6EgmZPr3YyBvyNV1/gxAFSdBY=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR03MB480;
	31:8uhmg2Wo7uSYNSoZQdP98xR6sKkv0IJirMZNPfjlG79kAz/+CCs/R/LHaoxn38DVtSc0f0X6N8bXP5X2KIYS2iev7IbD7DBSNLK7edv/IUtcg0qULM+77soFqpRLPbPM8Y3Douf0qUW3M0s+bLlT3zZ4u2dG+WRU0UQNaTXWnuj85OYiC8qTavSK/mHBHOaHxAVdteGY7NEPyI1Vt39rpQmxlFI5fvjxn1yINjqwqFmThBogjwuFkfQLogl2AiBfogk4L7TaPTRkwQ2dJ/1LF4zTqpWn7adeMCd/+Co39fcPvH179glkLDUMyLnccXuxtKdo7HWwcGcWK7kM9NLJeLt2IdIX3a5iC+DZpoufieajTdRVJiP7+Kr9bUE3H8SbL8PS5k9uRco+LBxaN6SWUiOFaiQAM3MkmosXg2zkwbcs/nMKBhyJX5/rTXjsjVR053xQbVwo0XPgk11r0xyxtwl/WYq4AfMLktGK4yNbzZIgmeK+/M5J+OxDU+oVreWp5aP73fkvc42PyvtPP0oSfR5DOY/z2PWsALhG/mdDzmURHcXETwj5xCbFcCR2zJdawya229EE38rIcXjG9rCpAYyIAgvoDR6CnS+VHQCVEXhjuRjMFVfgUgpXpOeYnZ4bjpwZ/GnSFu+Ngfm66ZyvkKfV57P5WGDU/0IBgmsqGgQ3mFf/KNu9l14Gjzz/CQOhg9syVqQxDCgJGwXeTC4yKQ==
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228)(185117386973197);
X-Microsoft-Antispam-PRVS: <DM2PR03MB480AC137F078B42F30A63EE9AAC0@DM2PR03MB480.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6095135)(601004)(2401047)(5005006)(8121501046)(13016025)(13018025)(93006095)(93001095)(100000703101)(100105400095)(10201501046)(3002001)(6055026)(6096035)(20161123559100)(20161123556025)(20161123563025)(201703131430075)(201703131433075)(201703131441075)(201703131448075)(201703161259150)(20161123561025)(20161123565025)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM2PR03MB480; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(400006)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM2PR03MB480; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR03MB480;
	4:Lp+p/wPT1Upp5S9dBfr5etdW2Qe66Et8W0yMzXKh4ye?=
	=?us-ascii?Q?5TauJKYF6gQLhWA6rF/FlSjWgmpsu4/GJad66cPklgcJqMYvtrVDFlZORElD?=
	=?us-ascii?Q?92BIQYoCG7IFV/tl1uoKiCK8MO/w2SSadCrW+jg5h1U/Tq5MPzUCCuRRXTEq?=
	=?us-ascii?Q?QSndwEVvcQBvU3OSW+MaIkVivG4buKIhD0VmrfvgMMdNILv2v3Yw4kOOmkcT?=
	=?us-ascii?Q?rS3b9PFZcan0pdEf/hfM1EXe0zrO0/gehYUdZKEGt/Ttw6xEC4O72OoUrdEt?=
	=?us-ascii?Q?I0G1tD2UzFik9IbB8cPLQEMrgm2DPztnMlfyBGRcwZwF8+Z3lae2rA1E9Nmi?=
	=?us-ascii?Q?REIveNMFVwxDkX9WcBaWxLU+z6crpJJLIsiQjC7iLOyaYJPgfKwb7U3j2EM5?=
	=?us-ascii?Q?tPnPAPRG2RKwBAXSX+WBezN33+lWjvjnxjwLITz4BQZCkkv57IXHIYd5y8pZ?=
	=?us-ascii?Q?QDS9TFQcX/OlkuCsiE0d8DwGdbXk+KwoLjR3O0GA8iutdrHbND5/GdiUHZtZ?=
	=?us-ascii?Q?QrR7BfvDNdImAMOkHKf1SeBD7AU6J14dQnJ0sQOqlVXH0rPEfz84M01XJIyi?=
	=?us-ascii?Q?w4juOmZja2LxgGjXF8dQ8qeCUk93Oq7fceZ4ckWrTAluaOlyvyYxomqT6J9b?=
	=?us-ascii?Q?Mj9PBjgQH7xDIpOpMlL3kX71PalvSFQSA3nIRRCXRnCA7O2xkqKTi8KE7P6x?=
	=?us-ascii?Q?vXojPztoeWbuamxGT9szKcgk5YVPCR6pumVKFuCipbQjGq7Vo1ozUVPRvNmA?=
	=?us-ascii?Q?iJ2CJXYMu0EKUpg5j6KQVI6MtDzZyquo9DaPlVy+xW6rKI80AdWSdJOyP2jo?=
	=?us-ascii?Q?rDRpBiWhS9bp6Dz2LZNlPAHWRRpm8df/JeMBLmhwl1LuOwpOTL8802oYPCX4?=
	=?us-ascii?Q?0B1db0CI2bYW8PiMVh6Xh/J97sNkduCFENdkwUyNht9wekNLOLj9HkkfcSTT?=
	=?us-ascii?Q?Cw20yZEW9Q5dkBf/9WUaksWeJA2JbjFxSKOOiHWWv95BF2zUndo5p/0IfEjR?=
	=?us-ascii?Q?ZfEzfdRJr6ZqcueJKo4vyNeZHgh/Cr0ocSQBvVee7g0Srfck2Mht4+b8Yqpl?=
	=?us-ascii?Q?ePr6M9EMshI9g/5Mm2cRjM0r3qB715Q4+sU9bYF2BV202QOGaZPFikui0lH9?=
	=?us-ascii?Q?N3EKPsgwN1bGRuAPxqIFDTqaQP0kp1yP1zqURBOMJ3EDyJLyrf2WjnWtDABw?=
	=?us-ascii?Q?gglCudjDq4hR0jMaEC+mWIaA1w3docKHDFYaS0aZLJTJJDFAzMrQao6Reztf?=
	=?us-ascii?Q?OxQEktBMjEaEEyB0bTuvHImzytLwDs2xRzJ67dlTtratsZP2f5mhRK43rFg?=
	=?us-ascii?Q?=3D=3D?=
X-Forefront-PRVS: 0367A50BB1
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR03MB480;
	23:fW9DvLWNzTJRbfsR95bPYhJBG4Q3kyCwqINDzuWxKe?=
	=?us-ascii?Q?kgIqfQ3JChnpRGuWoaWch1l4DAfPADETu+bOStZoETvztjW4DOfQWYsn5Eil?=
	=?us-ascii?Q?GjFBU1P2iFf4i5htKr/0uwpsfeVyKP9WhiKi1RhoKM6J5BIT7gFi8tI7Ccs3?=
	=?us-ascii?Q?bBnTlykVgGmxQnf/lijUxp4x4LewSuN6iREqFejzCKZGkHeW2yhftjflj3mS?=
	=?us-ascii?Q?wVdaFQCexKBf4NnGxb+AIeCkDJyJIcz4CCdQSZSXYj2rL+iLKLxvuW2zeK6d?=
	=?us-ascii?Q?ihx/XucpywjyS4jX0RQZ1bXkqvqq9fFNFlFczPpOoUAAsWTD1xTtrku04VUx?=
	=?us-ascii?Q?E9qihu5DPU+1HaRTDLgu22L7xjU4fwa4tV92n3bQwA6UZHbdy6oLLoNrV1q3?=
	=?us-ascii?Q?CPXQ7z4Wm94Co0Q6sscV0r4/RxCGpRUNp75EqIoADhStIq862HuSeRLDj+2s?=
	=?us-ascii?Q?XSv56sDBRG1/YNhkfgxllxPQz12LFg9M84Q8yUdyTqEhfUJl3e/tKhfi0+kS?=
	=?us-ascii?Q?Sk+2ETUA5rqnpHS89PVFeT1G3MVEShOFWAT40G/I8z92kEWROQ3YNdd9K2YM?=
	=?us-ascii?Q?vAUMFUDwAMCebakB+lunCNNP7Zzn+TDXxZodwkFMCZb2M9o1Rema/qXSBaT0?=
	=?us-ascii?Q?Hc9QPapk37KVHvSIpprrPNwA7BlORsIJPRv2jhXsKkXmqXIqkLzkU0yukNOh?=
	=?us-ascii?Q?M0GGd1Ec39jlN19yQJ7mdUxIdze2HZYQ0r4DiJaOF/+sGMTnKeqtQjQiiMR7?=
	=?us-ascii?Q?78nsoOPgEtzXrrayvIGYYx6jhQySOUIqroMIQ2Uh1FCbJBajljXYCFSdVbSp?=
	=?us-ascii?Q?grzhf26/YMZCDw9+51ezCnFsb2JQQPnmDGdY1P9mq9cAWPG0NngoRFPRaToD?=
	=?us-ascii?Q?yt/l4op6UgOomQeyzSNTf26dDRBA9/+2+Aphnw1eTbSReo7mnArjtDELPw1i?=
	=?us-ascii?Q?UOkM401s8NRbGp3zStY6dqb/g56CTKXakXvN8gyqzR10N7y2NOvf1TLEh80v?=
	=?us-ascii?Q?q64cyI0fJEFhwwt6W0hOICU8fnV2IRFXiC+CARHcZujUfdfpG9xrYwrlfIje?=
	=?us-ascii?Q?KoUG1YXi2jSCrAkRlP7unfxWRkpdHPDz35T7fSAOP6dlJCbM8GXT+Hq7XeyA?=
	=?us-ascii?Q?dLHRh8Ij43PI/GhZt6PqQPHeBNq1ouJasOTuJGLQJW1bIr9DMcBbG8mqiTHu?=
	=?us-ascii?Q?7/FCJAMSpvAeqaZOMMow8D06525JLWDw8QUgRU2GzYooOOMxDKQrhPfed8uR?=
	=?us-ascii?Q?6ItisPWNn4nxsyAcd8IlKE5PZhg5dCz6aQR2SeLUzNFPzGA1onUH8lptAwWN?=
	=?us-ascii?Q?uRA53e/9BJXu0+TstPvSVzEgNaFjLY9jaN8t106boaM/R9ltCemF2ltb2nIL?=
	=?us-ascii?Q?YmDw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR03MB480;
	6:W/+T2owJXCHKHxWekgnMqJ475uK2V4UgFaSNw2KQ8zi?=
	=?us-ascii?Q?wDI/O8y2YOHBHIYmHp15VY4RR2fF8/9Gj4qygkVUqXKwF1Nm+5omAePhroll?=
	=?us-ascii?Q?eIK0Ra032Knon+ICZoldaIFJvLPTP/oRhe1TcHEbLx684xrv1qTgxhN1XLJE?=
	=?us-ascii?Q?lqQhMb6FbHV7TU3/uAF+xtT04N9l0HsUq4v1YhAdT2/k8Xt/LDquqOZIjxSa?=
	=?us-ascii?Q?KIHxaNsY/SvVQ3PPIs2hlpDlh5s78b5S6D5vNmw+lhzcrNc3kTUAU6+9vgw0?=
	=?us-ascii?Q?Z4DG/DV8OevcVHzVV9+t2apF9crLEytp+LMlLOOtEhVCBmUj3vYaYa00bRY0?=
	=?us-ascii?Q?nfmEVkgj8xtlMWc4ORK22GciJhMOvumKxLbcDC4z86YvR4Rjzp2djrLCiNsn?=
	=?us-ascii?Q?Wg+VojB1cL4duyAvBk+7i3II9O797zsk6FMk3acdNq2fkLtHel3z+bS7FKSU?=
	=?us-ascii?Q?np7QxT5cJ82cBxK4imhKowCkUAbveEHZrOMTClVmpXEC7Ke3i3WRs67fKJ4x?=
	=?us-ascii?Q?Z0x0PI7nqNK+ldQVX7enbQgyuJm/nO+BnnnNDeKkR2YBtF4Kabrx8WZCPPDb?=
	=?us-ascii?Q?TjWme8BDd1FDjzIP+oK1MD1oIxbcEb5BSSmp4rTI6Zy/FHbbOeTEeSPzY588?=
	=?us-ascii?Q?lE/aO74O4DQY7Xna5o/9/D/oOQIvRB8OdP9ZNq0WU57w3QccspRYvH+Cya/U?=
	=?us-ascii?Q?5AAm1PjVw/C5c67kvJKXIENxCWVJO7L8WIWvjXJvjEtfjFuyLRNuc3ypuxkh?=
	=?us-ascii?Q?y/PiQz3AFpTkHyA8zny5XnbEfY4XmJaPrYtib5FN96NRArHaX2cVB0SgdRll?=
	=?us-ascii?Q?W3C34rxN4CYXfXZ4i33QCiPGbj5WLLbw3OLji6bJse2q9Q5WwUF3TA0+arvQ?=
	=?us-ascii?Q?WWYCT85bsXUYabLdJXM/vzGi4NL7HKuRTzZLcL2hSjEQdd/gsG7/aBOrN05F?=
	=?us-ascii?Q?jtObLewroxQtQC9NxZdWmbXLwgBYly1877njarw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR03MB480;
	5:rzEVhFGJCbsixMEWcU6u5y0O2SdcFQqrRZiDM+rFo6eewQQvrrH1aQJjAJq00ORItTcNkng0CjWrig8ldNX3p1iGNlH2zULhujjoyS9mNkq8HcT7VovZwG2FrdPBDbpbTpgg/iv9J29EJ4NXHLWFjEGJEc9ocxVLhtTBHwc4wJrMJXwb4ByztQ8mPvDoaAyqwXvJxuc9I9aZA3DCX9ItkeNgABCRkumYTSvsWLBnScJHjr4IoN6WTi2XkMKkKOPNwakPPU7hUbPQv3tJsJGqzcjr5hmDHX6BAqF23qsOk/4FDYmr7PxHGxGRWhITB4FB0us/mZUOBz87pcnexCIkQw1sH3TWSgWqk8HJ8hj3zmrTo+ER2nmLHoJi8267lFjwTgcznbDGra8HWZ9RuXQz1eEDwQUGdM72kQxBAKCNdr1XFFi8/9M+WEeJCYDE59Hk54KPQ6XfcTVloWF6ddgYU3TV2T+Hq2YjcOqYDXFTCg8KzuwB10zt3m0DWuM6dVnGSPtJCBHodHPW6S6Lr0n28Q==;
	24:CYHKucXhZ1oOHxy89MqM0d2GCjvvF93DCV4NSakF5UDNqOMxSSfb5h1V3MmKwWItjo8g+IAr3qEu0k6FwApohJQsWgsg0EVpqDiuyzqbXhU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM2PR03MB480;
	7:hWVIl6Nj4baSDFGKiycpB5yf9zbk/uSGg1ANKCKzKFosMBYfX3rPqlo2K9+7OM60xPzeu0BE/hq19M6gsliLKO5foF4X9hvp8w2Bo+aTlRWZgpyDEbL6ze8pHrBb4C1cXfbN3CREwEdCCvReWOQ8lQ3+6kU6ZPLoqimADjGPzhLUoOqi2PRcG7wD+iSfZgqeXAzn7TP2MULXda0F0cLu8k85ct0yMQ6C+M8Q7TBGLR5uYvVP/Wcjs4Swf/alwuAQ2EPVEK2W/7WKTJRR3mTShRdWXBtIfTFytauHu9lrJsNr7Oe7S11L4G+BJ74UbXbamV8ijXOmbMFUtOKmvPpNiK8O57cOlhmINeG6054ip2WGCjpusr5DE+jC0UTGv0Dtzp8lCrNA4f+ZaovcOuC4UIbOJKRRhz4My+pxlwb6HAUCa8hSrzLV3pYvpOt7+JrcjJXx0HMQXsVXLSoR9mxb9VPKzta/S4mUi3NRl71cZo0gbzag8syp48NTNeMIJkg/sLv8UlIAonmU7jPuuLvstykgBqQUvpbCLJW10wn4igyzhMLFxnplwiKxFMip+ywsxsmK3O97Nt20qms/+S3zQl60Hyj1Qhn1KhKzZ2k2o/Tu6yU2KHMGOH+SkWQ0P/7SNZazvQWk47VZ1ullt3ivqxYGgvWKEMhhvRxsmJxnfLD/jrfsjnDWi8ISZV+T4eGV//VHVAgOR6Lo9dCqcOh66YW4lve4Mlgmkhledl6IFkZCbsmzxWN5ZGmZeA7DkUkbdx0hdcriyaMrt5hEAd9WA+Lm4W31eYG0YDQHTApKOQc=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2017 06:41:15.8881 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR03MB480
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.33.82
Subject: [Qemu-arm] [RFC PATCH 1/2] target/arm/kvm: Translate the MSI
 doorbell in kvm_arch_fixup_msi_route
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
Cc: kevin.tian@intel.com, Bharat Bhushan <Bharat.Bhushan@nxp.com>,
	marc.zyngier@arm.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, robin.murphy@arm.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iF7FdjzFqc4F

Fix-up MSI address if it translate via virtual iommu.
This code is based on http://patchwork.ozlabs.org/patch/785951/

Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
---
 target/arm/kvm.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 4555468..eff7e8f 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -22,6 +22,9 @@
 #include "cpu.h"
 #include "internals.h"
 #include "hw/arm/arm.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/msi.h"
+#include "hw/virtio/virtio-iommu.h"
 #include "exec/memattrs.h"
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
@@ -611,6 +614,24 @@ int kvm_arm_vgic_probe(void)
 int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
                              uint64_t address, uint32_t data, PCIDevice *dev)
 {
+    AddressSpace *as = pci_device_iommu_address_space(dev);
+    IOMMUTLBEntry entry;
+    IOMMUDevice *sdev;
+    VirtIOIOMMU *s;
+
+    if (as == &address_space_memory) {
+        return 0;
+    }
+
+    /* MSI doorbell address is translated by an IOMMU */
+    sdev = container_of(as, IOMMUDevice, as);
+    s = sdev->viommu;
+
+    entry = s->iommu_ops.translate(&sdev->iommu_mr, address, IOMMU_WO);
+
+    route->u.msi.address_lo = entry.translated_addr;
+    route->u.msi.address_hi = entry.translated_addr >> 32;
+
     return 0;
 }
 
-- 
1.9.3

