Received: by 10.28.91.67 with SMTP id p64csp3272365wmb;
        Mon, 19 Mar 2018 18:49:16 -0700 (PDT)
X-Google-Smtp-Source: AG47ELs+jieLwEljDkLtLeI5DdggkN0Rm52nzzXctLicFu4iNTk/VsYkPYB7iyyp/26jVrqmDRBn
X-Received: by 10.200.10.3 with SMTP id b3mr21260146qti.236.1521510556150;
        Mon, 19 Mar 2018 18:49:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521510556; cv=none;
        d=google.com; s=arc-20160816;
        b=lf/+vrEUXrK5MTesDCawFCjWm9jgLc4g0K2ULOvlj5SBvkm5vildk1GEs7HqctLKnN
         qoKKSG+KIJB2WgVAjV+s08oiLULXk3Qr72wCOCNXZCGf0gSfZ3iqigMqbF0Y/yByAD6Q
         Jf9u856JnfZacGgMxVLLYYc91UyDRZqybgoAa8C0OOCriJA5R+3D1ARjN0uYQ58nkvxW
         mVCybtgn9xXB4VwRmrdynfXEH/5h1k9Kz2JuLqpwFVlBkXEEdU+a/qDJOX4KDHQFxWmV
         04yFX/abshGNq0UY/clcMWwhhEkhxYgNsndgAIhEZS2Z66OiSp+voGqMPpF4hyh9sXp1
         x+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=vQroTv+T83CmbmTYWvBVxptTDrGINeEQIKyOyR3eXMM=;
        b=ckMQxD/KjcNkJ9fWk6u0Icof5iPVN4Li7HYSUF74rKDnFZe3qbKRseaC8U7d/0ColK
         zS67CCsPrJT5lHE19qf1j2cch0FDbSmwJ43UsytxdZzRLl8ZSw7HrNfhj+Ijikd4yRM2
         7Jrigh7QfX+Q/y9E91ItDGe0iGKFeCP/cPwpjS0ev4IH6PaQzzPvJF+PnyrirHRYlrL8
         m13CQMz97TFJJRV3Md8AUDUxEU7HRW/aLnsM5bYIedu7smLErESWRTxNaclVD8mqMl7h
         oOXLtLLRoX3cnhRk45PU/nc7vHmD7Pn10ne0HjXXBXwjelkA3hYAz1B9F8NyO3iELLQn
         QUAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@impinj.onmicrosoft.com header.s=selector1-impinj-com header.b=jaq5ODjb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=REJECT dis=NONE) header.from=impinj.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m135si1623499qke.291.2018.03.19.18.49.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 18:49:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@impinj.onmicrosoft.com header.s=selector1-impinj-com header.b=jaq5ODjb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=REJECT dis=NONE) header.from=impinj.com
Received: from localhost ([::1]:44918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ey6Op-0004wf-I5
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 21:49:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tpiepho@impinj.com>) id 1ey6Dc-0000Y5-3i
	for qemu-devel@nongnu.org; Mon, 19 Mar 2018 21:37:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tpiepho@impinj.com>) id 1ey6Da-0003fV-WA
	for qemu-devel@nongnu.org; Mon, 19 Mar 2018 21:37:40 -0400
Received: from mail-bl2nam02on0091.outbound.protection.outlook.com
	([104.47.38.91]:58630
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <tpiepho@impinj.com>)
	id 1ey6DV-0003bo-Ll; Mon, 19 Mar 2018 21:37:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=impinj.onmicrosoft.com; s=selector1-impinj-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=vQroTv+T83CmbmTYWvBVxptTDrGINeEQIKyOyR3eXMM=;
	b=jaq5ODjbjH+TbpozrQE1pbL8nepxyhbERNbXXDFc98QBbmR1kd0S1QOC2EBlWeV6DsoUyps12trWUpd77VhVaUTpGFyHW2r2JEXdP8mrKMnrpTQQtDI5YFKt/TllsaqBPvWVTSSp0d/fY/Q+Um0RSNhXgkBFJFdSbmex/l1nkK4=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tpiepho@impinj.com; 
Received: from impinj.com (216.207.205.253) by
	SN4PR0601MB3760.namprd06.prod.outlook.com (2603:10b6:803:4c::22) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.588.14;
	Tue, 20 Mar 2018 01:37:30 +0000
From: Trent Piepho <tpiepho@impinj.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 19 Mar 2018 18:36:57 -0700
Message-Id: <20180320013657.25038-1-tpiepho@impinj.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [216.207.205.253]
X-ClientProxiedBy: DM5PR0101CA0018.prod.exchangelabs.com (2603:10b6:4:28::31)
	To SN4PR0601MB3760.namprd06.prod.outlook.com
	(2603:10b6:803:4c::22)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04ae62b5-0b33-418d-a658-08d58e0325bc
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:SN4PR0601MB3760; 
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0601MB3760;
	3:FZC7++yGw4nSRNTLOtbMbpb9kUCePWCBcJptjgrx22CmVMTeHlWyzeHI/rQWJZiYsI3eApzbESaCbR+390PDTv6Bt75foWZ5OcijGgevbBYGD3c+5yEkRJ+nysIgCnn4ksI8tb2Eide63GGazeRpp6VuuPYMH5beV2Dk4oEig4SWaCKT27JUaQTNZNfLRyjsDS/ShxDkq1a2TB+Qh6EsVZ2aq8NWLKbZ/HAuf4y7GYw+/G/kLiZNlXRtrJyo3RL1;
	25:Fm1zDpHypin5ZUfQh23VPAwsO5bojN7AFwJVzHp1wy8F6+l7th5QZpVMt/VH2cdCYUwPUMP432t8BE5E+BVFXoWjJaWTvEHS/w89+qoa/4qUjeYL2T1kKcciiVCXRNII3JYq0RGiDkTjipnQO8rJMteiL+qeLwmaYkcZrTrtUEFG5sJbqbhAr8UYUQUJTwAogGt8rmpj7NdWdAnP7pTNC4ciR24s6ToHJAImukklq1cmNeNDGibdKrrLS6ZYSLfUO2XBJovtVl50QkznhZczQ/uDX+tYi/g14zpwJi1f8f4XTLYGuAwUWoA2lhvsFphksWAFB1WT6uKUsVgYLmjKTw==;
	31:4CB4HZkbJpwxpNv2X5FuAcJ9p6+KTzVtLlh3ff9yXnVzY8MCyi2p5sq/bwz9FoiBSZ2Kd+MAEcyRaETFAKVpr82DA4KzL9u9YfDKEsr17VjkZOZLVZ/iCvIv5R7MLwA8fPiZ43s5wMbs1YvHaTAadqQtWWkwoEKB+gNjhgpXPKdFpZw+pwKJHZak3ALV5mC1dualgbYazsw6UHuFnwqbP0TwbqscfdfPqixTit3johs=
X-MS-TrafficTypeDiagnostic: SN4PR0601MB3760:
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0601MB3760;
	20:2Bs/8PPBCAP+JuCesXN7jxG/GaR5Ovv+vwathVsPe6UOpF1m6PeVhtBCyxl3bbeCAuBXJruuE/l6uaGLm2b9dNHTTgEGuIVoFIHqNP4+KWP0UHRmlU/1LZUD3KZvzGePBVuKmYcRPzauhIsH9iuAUyqOr6390OuqAKSquA/7MC2mtFiNL4ccNg/D3DE8POO7yStMARuNshdpzccaGrp850gJPaaVe9WIvUul4UItro+x0sEM8PegPCqM9U/fBspNWObjNtVV9ZN52+FgGRyZhkM+JSGxMuk31mfArWj7IkAvZvZYuHU/Q2NTcAo6jQ9/S4a7P03f6fRFTGooPKCG8g+18yBV2qRahRKRa3Ht4FLFnqbKM2miUHT/5Kd6AOp7wOBuaX9nwM6UWQJMoyFbXjx4k9S+ccPn5T1yoh7KiO6EYpWPMkB7bCIXY3GxjbHsJqtqwkwEsFyJ5jCMxBwDBZQjz3qviSqPgyIki+a/Y7bhl5q0Y0gfnZiebnFk2DOF;
	4:H4YFyVoZnq18cJKRtAy5ze/CjoRjQXZxGXg6wDAha92f7pcTeEtYZDQSL47QGdQXl5lOshwxuAXG7TbEmqpWScyaIN6MXjRjW84pFGC5fc8gDfeuwj+SlyRoz2hjYamrx6AoGxSAzTb9gBzNpkzfCLOJWOXKDFffcayKSetl3I2xb9NwYBb9dWavErnQ4vFcicmfCldq2BmQ6GFVDIxS/+vQpAt9SZNz6R7QZQCC5YAQ97VN53Eywl2xSby4R6IUyDhjJw1/DAcsyrKiypQvJZBOkqTF/yhKJUxC2CCYkA7KtwsUFI4F0qfYJ+Ne2LyA
X-Microsoft-Antispam-PRVS: <SN4PR0601MB3760D5D1FDDC10E874C25976D3AB0@SN4PR0601MB3760.namprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(3231221)(944501305)(52105095)(10201501046)(6041310)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(6072148)(201708071742011);
	SRVR:SN4PR0601MB3760; BCL:0; PCL:0; RULEID:;
	SRVR:SN4PR0601MB3760; 
X-Forefront-PRVS: 061725F016
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39380400002)(39850400004)(366004)(396003)(346002)(376002)(189003)(199004)(50226002)(36756003)(81156014)(81166006)(6116002)(86362001)(69596002)(55016002)(6666003)(21086003)(16526019)(50466002)(316002)(1076002)(106356001)(3846002)(68736007)(105586002)(53936002)(186003)(66066001)(386003)(305945005)(4326008)(59450400001)(16586007)(8936002)(25786009)(48376002)(8676002)(1857600001)(26005)(7736002)(97736004)(5660300001)(2906002)(51416003)(7696005)(54906003)(52116002)(39060400002)(478600001)(47776003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN4PR0601MB3760; H:impinj.com;
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: impinj.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN4PR0601MB3760;
	23:BsAdCY8edH2R+Zt42W0g0NjzZgZFEOfAlz2f8Xs?=
	=?us-ascii?Q?gt8CZXh+vZCsJhI5Hr8jFuChiVSh76jKccgjqPp5I7iz6KYULTj0v8gxILYO?=
	=?us-ascii?Q?UndPWBX+ZutH/g2aQMICscpoeRW6dEgoP3Jr018mfvjkUFMjs0IrCYi6gzh4?=
	=?us-ascii?Q?92+v2o1uAGIDSAHUGqs854Lq9z3OyTf+N5FcHivw2b8vP3Jmt092O9+Ll8DI?=
	=?us-ascii?Q?nNBc/CQ2Qb8iJxyWZvyhY4ZyaX00HcOuy1mLlgcw0G5QHFUhZ99j/ye83E2Q?=
	=?us-ascii?Q?ZfqwaWGw3i8WfmuY/lS/McXVW6UAV1vvksw2d2aHqYlzMWKpmXWRgs171bia?=
	=?us-ascii?Q?PTB/3XNr34xYCXUWpr1AL495Fj8AEevYroQDmS+toepJihYCtGvenSnvCamh?=
	=?us-ascii?Q?gv/4RfNHLAWnExzxJAujWIl0c3SUfW2VTgu38OhQap54HfvU1+be5tWHzqcu?=
	=?us-ascii?Q?XegRh+i/FE0eLce5txFtETg8WQEKKNnZwG5qGWKd1+ID9kQjm8dxh3mEH7rB?=
	=?us-ascii?Q?FzXk/c4Gk0t9LyzAmCfxqQp2io0mqmvRWLL2w9agYY3dNtxDj9JSBeKfY7Hn?=
	=?us-ascii?Q?d9hhj1BkH/+g6Fzvce+O51mxoKFKgcFcFeqGvf6K1swljsym3GQSwBGSnfoJ?=
	=?us-ascii?Q?/7jdWlxIGhZVSoHu3HVewJEPFmaUbPBy4RI9SMKCvujFg0sovL2n9VzpIfQq?=
	=?us-ascii?Q?ZkCVdH5hsp9Xo8I7bxCge9Wu3So0SkAoDrRygtvquIYwhip4+uEour+8oRTD?=
	=?us-ascii?Q?14gug3TKmvWAHY97NmDUN8smhQh3ofjGlWCFCfUK5V013a4qn8UPUSGvW9zo?=
	=?us-ascii?Q?9kVa8D+KX1uALAQI02PMx5LygC6mb5D+nnucv4VvgKbX0I24qftIgl5vZtoZ?=
	=?us-ascii?Q?wBWAyFikQANzH0p+s56ziQsbwsWvZlATok/CTgG81poOx1+DS6dPWhbYRFx7?=
	=?us-ascii?Q?ZLU2qJfa42EUOufTbkOj7RPbyxEDM08XqiyYsZZZmIehC6On8mQs9PuIbRC3?=
	=?us-ascii?Q?1Kmzc0HdOmDn13s2BMSXowqNSvMvkVU3KYeJGzEJSGQGhhWKve8kc+D/s3yW?=
	=?us-ascii?Q?dZrcfZu609l4yGaVg0fR7Ak76zNrg6i8eRKONbDfbF2GRwUjSsIQiXDeXon7?=
	=?us-ascii?Q?x5x4C4mxKPEwT8mHv+FAfUeX3fNbW2hovxBm/VKgcFhpizt62YG4o4mFzhmO?=
	=?us-ascii?Q?xA4vb5or3rCs/8tg=3D?=
X-Microsoft-Antispam-Message-Info: HFJ0mVcwBTLj69okMn8NohuhKUyG18UHeNcxjNMOxpMBbixlrLjVikrMTRvgE+Sbv7LP/jHf6xDMJzjW/FcwYag3GmpzVzAIY3FSYoGdQBP2jBn8nxh90C5idd7bgbJqKZUKmWeQmUg0gjVtXLQdbTdFmsPFfZX2N3Wj36l749wXe1DG1WX0rKJ1ysHdY8IY
X-Microsoft-Exchange-Diagnostics: 1; SN4PR0601MB3760;
	6:s2yq+Xwb7L74mBSN5UCI+c+Jyma5eN0N9qa207FfB9Uiun87Ww17wJGJ4uCja9lTLnAFEMzZh01JokgFK4PxE8HReWMegNzfxaQ61MbQrISloJ8JheJqrA9qs1UQ+ntuofcmxJCHKdl+NeNnbpSXvksqSXo2tDpxVO0J+73jngFAkE+QKEHPd7nnzwuYDxyywES4KYDZVhueoTHdNAHWNM0ykBqnH3gGfis9LR4tlbGG1oTEjPwmAH21yjjj6nxFHoFjoBcf3HZCxq+580Zl6NO6GNqLyQmzJ78xr22k55Ho0VGb/j6v0wthxQdWMXX3Nh3h0zOSXoq4SxD50YVpZomeniUWSlMt+LE/pVLaxs0=;
	5:ym68fVq5fwOJblWCfv9m/L4YQhEc1dEDFjxgjdDh2juOQs39ar6iEcVrt2I2I+bMhWU9k9JzrwqjIX2HDVBRuiGe0UjQVbLLX2YG6U0/c9PCg3Rn/zKTe/v1ei7JMvDT9coiWNin94a35VXiKZbib7g3oIAfQvo4JxjUz+emUfE=;
	24:U3sVvkz0CNGo/mAPxX8CSXKemQXCGwmIq6bBTXZIR+SRDOZ6wXATGKKvEPf1M/jRG7fS3agEb9bgaS9/Ji8UAyoICIw01gLwEhxvmdiItGM=;
	7:4nCa5MhlWxqZR0F83y35xKc5R+TzYb86C34CHrSemmD39/j6k+e7RmFcMuIdecKXvd+hEwHlNhIZFFDE1ETUnJVnLNDi9OH3bKx568cG+Jq+DDfR+KSkbMVhrrA3FxoWu/FT4fiun3GsZ4dqJNLyqIH4PnbaLoR9n4otIASK4RJw1/36+Cab4HjGheSe1rjXL2U3+aJmo8o1hwVd6h2JP47DQf+ij0SXbsCulckcpWxjmmbjqpZ7eSQztuxT+LQC
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: impinj.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2018 01:37:30.2428 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ae62b5-0b33-418d-a658-08d58e0325bc
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6de70f0f-7357-4529-a415-d8cbb7e93e5e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0601MB3760
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.91
X-Mailman-Approved-At: Mon, 19 Mar 2018 21:48:07 -0400
Subject: [Qemu-devel] [PATCH] i.MX: Support serial RS-232 break properly
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Chubb <peter.chubb@nicta.com.au>, Trent Piepho <tpiepho@impinj.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oTRsGCYcTKJg

Linux does not detect a break from this IMX serial driver as a magic
sysrq.  Nor does it note a break in the port error counts.

The former is because the Linux driver uses the BRCD bit in the USR2
register to trigger the RS-232 break handler in the kernel, which is
where sysrq hooks in.  The emulated UART was not setting this status
bit.

The latter is because the Linux driver expects, in addition to the BRK
bit, that the ERR bit is set when a break is read in the FIFO.  A break
should also count as a frame error, so add that bit too.

Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Trent Piepho <tpiepho@impinj.com>
---
 hw/char/imx_serial.c         | 5 ++++-
 include/hw/char/imx_serial.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index 70405ccf8b..4ca821d74c 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -286,6 +286,9 @@ static void imx_put_data(void *opaque, uint32_t value)
     s->usr2 |= USR2_RDR;
     s->uts1 &= ~UTS1_RXEMPTY;
     s->readbuff = value;
+    if (value & URXD_BRK) {
+        s->usr2 |= USR2_BRCD;
+    }
     imx_update(s);
 }
 
@@ -297,7 +300,7 @@ static void imx_receive(void *opaque, const uint8_t *buf, int size)
 static void imx_event(void *opaque, int event)
 {
     if (event == CHR_EVENT_BREAK) {
-        imx_put_data(opaque, URXD_BRK);
+        imx_put_data(opaque, URXD_BRK | URXD_FRMERR | URXD_ERR);
     }
 }
 
diff --git a/include/hw/char/imx_serial.h b/include/hw/char/imx_serial.h
index baeec3183f..f8575ae6db 100644
--- a/include/hw/char/imx_serial.h
+++ b/include/hw/char/imx_serial.h
@@ -26,6 +26,7 @@
 
 #define URXD_CHARRDY    (1<<15)   /* character read is valid */
 #define URXD_ERR        (1<<14)   /* Character has error */
+#define URXD_FRMERR     (1<<12)   /* Character has frame error */
 #define URXD_BRK        (1<<11)   /* Break received */
 
 #define USR1_PARTYER    (1<<15)   /* Parity Error */
-- 
2.14.3

