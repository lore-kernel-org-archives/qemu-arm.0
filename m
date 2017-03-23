Received: by 10.25.15.230 with SMTP id 99csp802843lfp;
        Thu, 23 Mar 2017 08:10:51 -0700 (PDT)
X-Received: by 10.55.8.5 with SMTP id 5mr2968371qki.70.1490281851026;
        Thu, 23 Mar 2017 08:10:51 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d203si3898311qkc.148.2017.03.23.08.10.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Mar 2017 08:10:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:56938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cr4O2-0005pK-EE
	for alex.bennee@linaro.org; Thu, 23 Mar 2017 11:10:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1cr4N3-0005Lo-SI
	for qemu-devel@nongnu.org; Thu, 23 Mar 2017 11:09:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1cr4N2-0002Vh-6o
	for qemu-devel@nongnu.org; Thu, 23 Mar 2017 11:09:49 -0400
Received: from mail-co1nam03on0084.outbound.protection.outlook.com
	([104.47.40.84]:30932
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <diana.craciun@nxp.com>)
	id 1cr4Mt-0002Se-LO; Thu, 23 Mar 2017 11:09:40 -0400
Received: from DM5PR03CA0049.namprd03.prod.outlook.com (10.174.189.166) by
	CY1PR03MB2268.namprd03.prod.outlook.com (10.166.207.20) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.991.14; Thu, 23 Mar 2017 13:37:30 +0000
Received: from BN1AFFO11FD037.protection.gbl (2a01:111:f400:7c10::181) by
	DM5PR03CA0049.outlook.office365.com (2603:10b6:4:3b::38) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.991.14 via Frontend Transport; Thu, 23 Mar 2017 13:37:30 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD037.mail.protection.outlook.com (10.58.52.241) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.977.7
	via Frontend Transport; Thu, 23 Mar 2017 13:37:30 +0000
Received: from fsr-fed2364-102.ea.freescale.net
	(fsr-fed2364-102.ea.freescale.net [10.171.72.66])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id v2NDbEsx029966;
	Thu, 23 Mar 2017 06:37:27 -0700
From: Diana Craciun <diana.craciun@nxp.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Thu, 23 Mar 2017 15:36:52 +0200
Message-ID: <1490276212-32008-3-git-send-email-diana.craciun@nxp.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1490276212-32008-1-git-send-email-diana.craciun@nxp.com>
References: <1490276212-32008-1-git-send-email-diana.craciun@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131347498502891380;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39850400002)(39380400002)(39840400002)(39450400003)(39410400002)(39400400002)(39860400002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(9170700003)(8936002)(50226002)(36756003)(53936002)(2906002)(48376002)(104016004)(47776003)(77096006)(81166006)(54906002)(189998001)(8676002)(85426001)(8656002)(33646002)(5660300001)(38730400002)(76176999)(575784001)(50466002)(356003)(86362001)(2950100002)(50986999)(305945005)(4326008)(6666003)(105606002)(106466001)(5003940100001)(217873001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR03MB2268;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD037;
	1:khmrZkRZNzB40TYRXVtlfgabqo3W696OcQMAjepC+ESnPZ+TL3ncpHFfzM9TOutrQT7uWMV8fUlJntIXwZ2HpnwXBzPq69kPXgTj5tkFBjDAX7gspFM2SV8XOD5NmhE13Wr505p/ZGElpKIl8luAFHfD0t6QH+VTAx403M3ZctHKRy0uXD7tNShjG4B7NVU0JnM7OLl1kx7UwWQ7bEwld6AgVQ/VURbhwhsynzB292w1u3Lzm+ERY8cKjdzsae8j06sfkeAQBIAeYzkS3XReM8BcgwWAsYfi1pWleZzw4/GxCIl/vwj9EQmiZRGRdYR1VLQBZAEHBH5qbas104q8kSprlC0r8aB5GAVJxSU+zt1fKLDCGPfmXpCLhHJtR492b3HRH1oAq9C2hj7bw0QqdHPb5aInFX3GPlS/XEsMGlvI0p1o1oQgn5w2nQUJbzd9H2l/Q+bUZX9n21sZ3meWxwWEq6IeykbII2dN8Cgxeas+4OWq9F4falb+Z4quw/8mWZNRRj+JCcZgT8v+amIXj3nqQZlVJxECndnzvZaDcDgJckf+NgypxeEhzyyxBkEFn2GR5dqEV6lXPqQvhwOpS2VOs7aNgdGSaOUDf8vj+ayTG/FJEvRnwCg6drzBa+QSiB5bazQmhReundLIMEutiHw/eLS0Vum4ZStVhAfFKvKERUWDrL2RFndY8GE9PWmlaNQyBivmkEWIXhNBxjMK9w==
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d91d6d52-7e67-48db-4613-08d471f1c0db
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:CY1PR03MB2268;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB2268;
	3:5h8VkGuXuxHouZgRaIInM1ahkoGq7G/L8wnjRWvAx6un744im3Z3+iEzJHT/6qqOPj2Ma4b81fQ7ADlw1jwyDQFw0134XuZig7klnmgZhke0uqEktIpjSm0SREbRxadkYmhyw11RRxBxpTzO+LhrDX6mjt4C6nySOGeiK9G3REoRk1+aW/Oc0SQ5Rkud7lISkSLJvCFXvBdIA70GuXuy9bMUzVG2swUe7jt49p15UnGO+xbmEDNgs9s50WEAKO0Ll3sA6CR9PeaaNyjj6wUicOQVjcMrfIeYzsE+x4YqElinCvqYPObZYO1534ZDrF+s3d8Iw+pH3J/TLA3At4dShPrwlg4ZE0+l8MbxJlP8mITPUbU1RlpBv78E5FAWIvGh;
	25:v7ZRfahWnZyObMmbK+Hsjxo9lLl8STQvfmijq48vzn2MdCFmFxq7w+8jhAwO857xuX7cQ8zG/y+ZUJdpF7IxLUUxE4bQc5Cf8EBUOtQIlqCRSP0F2MGypfA00by6uTZci842gtUKf+pobtO/pCBSe1qfFsYv6uxlhWmRtFESKgrk7nQKnffyf+vIyHzsYr8xabaXe/t6kSVCw7Q/YX77XAqWy/f6eV8y6TxZ9KCOQsfuzRoc9JN4dmJwQTJF9TurEocIWHNKwrCtmHvkD6Ez6+6yKDL4yJ9AGCmvfD8WWJaSFSfw/8/RF5dPbNoylC+jCQSIXWCzHcmdgE5JpZES69UG3z66YqnySoWWqJCNL8PKYgcAL2NYRTzTsVbTgg7Zf3HtFGOfQ3QyMRv0TBJQBlxWc8ItdCpgDelWdP9byugTPGSyEIdPnMaCpAIl6uclk0+COaGIuv6ehs6Enn2TZQ==
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB2268;
	31:FMt/xoKlCrbbKUk199+0JDYMabeBgyK82H2xxSBjRZWnvIeaNHw1rLSdlwMtGvFWmCiK4e7QDWCSYyCpPd+KawbPUBgKdZHMGToj8bXJxYJx1vKcn/h9U9T0F/guBbJRY4JP/X4odveaWNx4JMwWQ+CpQwUMtE/k2GoFpE1ZwDwzcvjbFCeKpVYhHUUTRU1dJpDqqXN5HlH4p563xGuuuI9+6mipY1ZVQutPQbnk+CzAT6JrlKoMIxLGVYz+56zj2lai9F9jpB/PlcXzwWphbQ==
X-Microsoft-Antispam-PRVS: <CY1PR03MB226806D4AEC6C07EB9182608FF3F0@CY1PR03MB2268.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095060)(601004)(2401047)(13015025)(8121501046)(5005006)(13024025)(13023025)(13018025)(13017025)(3002001)(10201501046)(6055026)(6096035)(20161123565025)(20161123559025)(20161123563025)(20161123561025)(20161123556025);
	SRVR:CY1PR03MB2268; BCL:0; PCL:0; RULEID:(400006);
	SRVR:CY1PR03MB2268; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB2268;
	4:qvUuEq9wXXkEzo6pGASZQNn7PJkHGh3gAHYoSDMwnKvr5ZfMu1d4URMZUE300DzBUzQujK2o72Ca4xUTs1ztgBucunSIIUeI/XZBY1DGg3ElfVox3MmgB2m6Cc3dCMLhFVuZ2pmIyuo2fEp/etqDG7nkX31G+wymBH25gtKKwtspsLq3aAFVyhYgDs2W1qy0hmVriLBibu2Dj5YG6ImssHWF5wQS2AwLpnr6+MKEX8K5Hy/sKMb//XrhOayYdVYEVpsyt56/fvf6Hvr3eFeD17WKLKpT3CX9P1ToB1VL7wUD8mP1PuoGyseHBE5VVjF+rz2Mod+d8gVjGobg9BJUFobC+C2iUD52KyzvhNz5V1gXcCR7hyxxbpVt4Ny+8aHQBLcJzLFwKHkboPrrZOyQY3kVL33iUfQbkOzNpnk/53IWK4HZ6lQpGamT33LcBJGf1amEqiUC+zG0xUOgaAGRYw4GV+3dDd9KYp5rq70NXjzY1pyi/IXMFbb1SgwW21phOBV+jwZBTdNA5a86S/kx1JulKRAPbCVoLIliZts0UR4Qn7tPGHdIEin2OPY6KNw+EeNmf2ClVeH0oXwOb/BKMG+vmOz8b/5BSTMiyZru1XobjU5s+iXVn3HbA0IpHXY0GpDkP9J+yYsCy3yD93akrGtBqJgbv4MoJVlZYn/q+W6INn9Qqf7UcmriOwoRCksnMp5V4djTDIaMBJlfRBL0eIfqo+3pjv0kd6pj0aDPCKA9by8eIPxvhHAJaitW8q3z
X-Forefront-PRVS: 0255DF69B9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR03MB2268;
	23:N+8DBRmAkXrYEc/lWOOwB3yRSet7eIDEvYL3SlA5l?=
	=?us-ascii?Q?roAkMr1zFbh5wJbzakuT3Zzi/kYt2kUkfOSZDnF9HSo4BxrZq0b/t3NrXvgg?=
	=?us-ascii?Q?6WqfbnS8Y6hafjuW352DohrG/exbKKdLLnBq86VlykUS5+Z++e9OPHetNqWc?=
	=?us-ascii?Q?SR3iQ2jdk3wM37tTt/XOz2HhPz2etZ5tswhck+fCjxvTR6kwy/rJhgrUU1lT?=
	=?us-ascii?Q?BrwVNVbuNXsSbWXULCsi6XK/T6nlSacdgehAvwmse2kzBpdrfg6kxXoCdMfT?=
	=?us-ascii?Q?0x1TLhjP34KpsVN0sKvch1GyZdzPp7v1ensyB/4Gz2LDxJeEBakJGKsKfXkV?=
	=?us-ascii?Q?yuyGoeGYwD3C8m1D4n3xfzG/yG9PpSFvY93slF/qNFCGMZE8WIe3AKKayx4y?=
	=?us-ascii?Q?nVD11O3KmV/7hGOkkNs2ZTbRrMpWYpy3fYkyAHElk6zTb1yWr3e4CVH+FKej?=
	=?us-ascii?Q?NwU72jt0Fd9XFn54/NDsKHJiMEZP/1Kw/JJzUNLF8je4nBgBi4AGemq7lUxx?=
	=?us-ascii?Q?S6fjEfGQ5xYxaEnZa1w2RsL46uRvaQrQSA9+bwR+siYfAheHlckNUVXIJKDo?=
	=?us-ascii?Q?Nl+0yq747RfXBrO4WHOBkKmH1m0LzvHYPukrLshR5NIi7TvXIgu4x+0SCS7l?=
	=?us-ascii?Q?ZKy4XkuN0U83iVq2PRpdUfClmOEg9yXUEpJPguBM2gmSUtaJdmlUTaBkW2yx?=
	=?us-ascii?Q?39UKy1c3cfgVKrtCx0KoywKn+Xcgs/OHwqoPu8jg2rONpk1dX35srmMF8MXV?=
	=?us-ascii?Q?ucRXIhP/ZOISuJ8XeuokpXO2F5yvke16gZAJwnJ6M2Ll22qTc0Nci+vtjQZN?=
	=?us-ascii?Q?P22YkdeX5/RGysDyTTHa8RWHq/VEzrO7JhE/TSPU/qQDcYViQO87/twQE6X9?=
	=?us-ascii?Q?klBD1eXDs6UVtG/4/7+iKOAdm+DzmdmeTxgXvehrqqLrxfgjcVc6bmGziJFt?=
	=?us-ascii?Q?JYe6wOATt5FhvUqKrwJK4BqxjxNAO2prrfnvH6fty9ODcTxHP++XrfnVZYyN?=
	=?us-ascii?Q?i4hfmPci/sLgPjPKGhgRX/4X0VidjLghS/hed/WT1cirnXVNffnz/WTxX9t4?=
	=?us-ascii?Q?+U1jW32QNCSfA6EDF+qde9x7+aBsDKuurN2yqF9v8+gUfJ5WJWMuROjHf9fS?=
	=?us-ascii?Q?leMKz5LPEgVKM7dc1SZsakn7/dM1LLEYO5b2DOsw3ldXYSQs6tewQJIPADj7?=
	=?us-ascii?Q?cOHpZqi8hZQVF9eLXaIqnAj16IkTPNcLBW0?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB2268;
	6:gDZm9rNDx2yAlA0NEQTs/OyAlRDQ6Gb4HKvYTkSicN71zt1EqrQ0S61VAZe3rzZFgXBbAaSy5zcH9aaD+I96aTorCOXzMVa5IkCPxBM7ImJROu1s5UNsdaKZPVx7QFmI9IUQY0hYhCXAGFLtc18/qQOXSVHUMT5uttVG9Pvd5WqebJ9pGfIliMq4rVVil5mNTxkfloSNdKw+CBkex3w8jGxyoi7JtnUJ0L81U3TQlkmq/0aRUgYTYImURF9Evr6sfGSyNcr0S4GYVtCNoBU2tqEHx7w/1lkhM3STdbm5amd235ZqPLkMzsBHdanaLMc+w+CuyCQK0lIpK4chhpMyPx+Rpisr3XLDqdajvydKJT6GXLCb4YH6XTqfzMia327wS4xq/K9y2poNbf8cZ93mjabsvRwabmd2Wxy9LJ0ISoM=;
	5:ZrksAPvXFconEkJxlTZjGLEiB2IW1iQi2DJYqT6nLKBaWAnfUDETBARH1QDppNG6UtHnsK7ceFQZEb9r15wdWnqoYw7qCpuf0TI9VugxnlA8cjcH/bTD8t0hZKgfRKvvyWA3KT0et1GhKRbd8TJSYe08rWXYp+ohURX9Iwkpm8W3jlMIyu7LJLYMN/1OWgaG;
	24:t8YdABzaps5AmR+IxgTeMpV1fUJK+N7oLMJj+lcZ2cEag6vTuniYWFPSW2xz/s/1EtS+AWdb7Z6r1kF10UU7nbDKI+8i2lLi5HYefN9XJV4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB2268;
	7:uZFNy8WtQ2oReg0oYYw3nCVKl40pwM7pqXIUIwp4NCQYHkBWLJv1fygaDvl950m/qTjwpyweUHHKUFBUt6NHuRG6aeqeuzQpDl1R1mFrye7XEpXCJ3HLRfgkd8CuAlYiMtw8Tsdhu4G0fs0nnzJdMIZX3VFaPgfdiTKsxIVCfOaoJMreI5n0dLsERFm/suMqh3vgKgF5Zm10wa+kbODbxloc/sEzBs7w3vMfithpIGt9MQ65ALlpMm4gO8YXRZsmgU0fJK2pCtF/bSwoXX6692YaQy5rkrEVrZeq7riBjf+lvJfm4QWYRjwT0r/BHmmm6s5gbRYbQDtFMANHnIojLg==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2017 13:37:30.0395 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB2268
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.84
Subject: [Qemu-devel] [PATCH RFC 2/2] Add a unique ID in the virt machine to
 be used as device ID
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
Cc: Diana Craciun <diana.craciun@nxp.com>, eric.auger@redhat.com,
	mike.caraman@nxp.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org, laurentiu.tudor@nxp.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gVQEcwJE87bi

Device IDs are required by the ARM GICv3 ITS for IRQ remapping.
Currently, for PCI devices, the requester ID was used as device
ID in the virt machine. If the system has multiple masters that
use MSIs a unique ID accross the platform is needed.
A static scheme is used and each master is allocated a range of IDs
with the formula:
DeviceID = zero_extend( RequesterID[15:0] ) + 0x10000*Constant (as
recommended by SBSA).

Signed-off-by: Diana Craciun <diana.craciun@nxp.com>
---
 hw/arm/virt.c              | 26 ++++++++++++++++++++++++++
 hw/pci-host/gpex.c         |  6 ++++++
 hw/pci/msi.c               |  2 +-
 hw/pci/pci.c               | 19 +++++++++++++++++++
 include/hw/arm/virt.h      |  1 +
 include/hw/pci-host/gpex.h |  2 ++
 include/hw/pci/pci.h       |  2 ++
 kvm-all.c                  |  4 ++--
 8 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5f62a03..a969694 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -110,6 +110,8 @@ static ARMPlatformBusSystemParams platform_bus_params;
 #define RAMLIMIT_GB 255
 #define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
 
+#define STREAM_ID_RANGE_SIZE 0x10000
+
 /* Addresses and sizes of our components.
  * 0..128MB is space for a flash device so we can run bootrom code such as UEFI.
  * 128MB..256MB is used for miscellaneous device I/O.
@@ -162,6 +164,22 @@ static const int a15irqmap[] = {
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
 };
 
+/* Device IDs are required by the ARM GICV3 ITS for IRQ remapping. Currently
+ * for PCI devices the requester ID was used as device ID. But if the system has
+ * multiple masters that use MSIs, the requester ID may cause deviceID clashes.
+ * So a unique number is  needed accross the system.
+ * We are using the following formula:
+ * DeviceID = zero_extend( RequesterID[15:0] ) + 0x10000*Constant
+ * (as recommanded by SBSA). Currently we do not have an SMMU emulation, but the
+ * same formula can be used for the generation of the streamID as well.
+ * For each master the device ID will be derrived from the requester ID using
+ * the abovemntione formula.
+ */
+
+static const uint32_t streamidmap[] = {
+    [VIRT_PCIE] = 0,         /* currently only one PCI controller */
+};
+
 static const char *valid_cpus[] = {
     "cortex-a15",
     "cortex-a53",
@@ -980,6 +998,7 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
     hwaddr base_ecam = vms->memmap[VIRT_PCIE_ECAM].base;
     hwaddr size_ecam = vms->memmap[VIRT_PCIE_ECAM].size;
     hwaddr base = base_mmio;
+    uint32_t stream_id = vms->streamidmap[VIRT_PCIE] * STREAM_ID_RANGE_SIZE;
     int nr_pcie_buses = size_ecam / PCIE_MMCFG_SIZE_MIN;
     int irq = vms->irqmap[VIRT_PCIE];
     MemoryRegion *mmio_alias;
@@ -992,6 +1011,7 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
     PCIHostState *pci;
 
     dev = qdev_create(NULL, TYPE_GPEX_HOST);
+    qdev_prop_set_uint32(dev, "stream-id-base", stream_id);
     qdev_init_nofail(dev);
 
     /* Map only the first size_ecam bytes of ECAM space */
@@ -1056,6 +1076,11 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
     if (vms->msi_phandle) {
         qemu_fdt_setprop_cells(vms->fdt, nodename, "msi-parent",
                                vms->msi_phandle);
+        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "msi-map",
+                                     1, 0,
+                                     1, vms->msi_phandle,
+                                     1, stream_id,
+                                     1, STREAM_ID_RANGE_SIZE);
     }
 
     qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
@@ -1609,6 +1634,7 @@ static void virt_2_9_instance_init(Object *obj)
 
     vms->memmap = a15memmap;
     vms->irqmap = a15irqmap;
+    vms->streamidmap = streamidmap;
 }
 
 static void virt_machine_2_9_options(MachineClass *mc)
diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index 66055ee..de72408 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -43,6 +43,11 @@ static void gpex_set_irq(void *opaque, int irq_num, int level)
     qemu_set_irq(s->irq[irq_num], level);
 }
 
+static Property gpex_props[] = {
+    DEFINE_PROP_UINT32("stream-id-base", GPEXHost, stream_id_base, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void gpex_host_realize(DeviceState *dev, Error **errp)
 {
     PCIHostState *pci = PCI_HOST_BRIDGE(dev);
@@ -83,6 +88,7 @@ static void gpex_host_class_init(ObjectClass *klass, void *data)
 
     hc->root_bus_path = gpex_host_root_bus_path;
     dc->realize = gpex_host_realize;
+    dc->props = gpex_props;
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->fw_name = "pci";
 }
diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 7925851..b60a410 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -336,7 +336,7 @@ void msi_send_message(PCIDevice *dev, MSIMessage msg)
 {
     MemTxAttrs attrs = {};
 
-    attrs.stream_id = pci_requester_id(dev);
+    attrs.stream_id = pci_stream_id(dev);
     address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
                          attrs, NULL);
 }
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 273f1e4..0ef622c 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -945,6 +945,25 @@ uint16_t pci_requester_id(PCIDevice *dev)
     return pci_req_id_cache_extract(&dev->requester_id_cache);
 }
 
+uint32_t pci_stream_id(PCIDevice *dev)
+{
+    PCIBus *rootbus = pci_device_root_bus(dev);
+    PCIHostState *host_bridge = PCI_HOST_BRIDGE(rootbus->qbus.parent);
+    Error *err = NULL;
+    int64_t stream_id;
+
+    stream_id = object_property_get_int(OBJECT(host_bridge), "stream-id-base",
+                                        &err);
+    if (stream_id < 0) {
+        stream_id =  0;
+    }
+    /* DeviceID = RequesterID[15:0] + stream_id_base. If the stream-id-base
+     * property is not found (e.g. for platforms that are not needing a
+     * global ID) the requester ID will be used instead. */
+    stream_id += (uint16_t)pci_requester_id(dev);
+
+    return stream_id;
+}
 /* -1 for devfn means auto assign */
 static PCIDevice *do_pci_register_device(PCIDevice *pci_dev, PCIBus *bus,
                                          const char *name, int devfn,
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 33b0ff3..94c007a 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -99,6 +99,7 @@ typedef struct {
     struct arm_boot_info bootinfo;
     const MemMapEntry *memmap;
     const int *irqmap;
+    const uint32_t *streamidmap;
     int smp_cpus;
     void *fdt;
     int fdt_size;
diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index 68c9348..47df01a 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -48,6 +48,8 @@ typedef struct GPEXHost {
 
     GPEXRootState gpex_root;
 
+    uint32_t stream_id_base;
+
     MemoryRegion io_ioport;
     MemoryRegion io_mmio;
     qemu_irq irq[GPEX_NUM_IRQS];
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 9349acb..2dfabb1 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -734,6 +734,8 @@ static inline uint16_t pci_get_bdf(PCIDevice *dev)
 
 uint16_t pci_requester_id(PCIDevice *dev);
 
+uint32_t pci_stream_id(PCIDevice *dev);
+
 /* DMA access functions */
 static inline AddressSpace *pci_get_address_space(PCIDevice *dev)
 {
diff --git a/kvm-all.c b/kvm-all.c
index 9040bd5..9b988c4 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -1279,7 +1279,7 @@ int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
     kroute.u.msi.data = le32_to_cpu(msg.data);
     if (kvm_msi_devid_required()) {
         kroute.flags = KVM_MSI_VALID_DEVID;
-        kroute.u.msi.devid = pci_requester_id(dev);
+        kroute.u.msi.devid = pci_stream_id(dev);
     }
     if (kvm_arch_fixup_msi_route(&kroute, msg.address, msg.data, dev)) {
         kvm_irqchip_release_virq(s, virq);
@@ -1316,7 +1316,7 @@ int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg,
     kroute.u.msi.data = le32_to_cpu(msg.data);
     if (kvm_msi_devid_required()) {
         kroute.flags = KVM_MSI_VALID_DEVID;
-        kroute.u.msi.devid = pci_requester_id(dev);
+        kroute.u.msi.devid = pci_stream_id(dev);
     }
     if (kvm_arch_fixup_msi_route(&kroute, msg.address, msg.data, dev)) {
         return -EINVAL;
-- 
2.5.5

