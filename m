Received: by 10.25.21.156 with SMTP id 28csp312297lfv;
        Fri, 19 Aug 2016 05:48:38 -0700 (PDT)
X-Received: by 10.200.45.181 with SMTP id p50mr8011820qta.31.1471610918435;
        Fri, 19 Aug 2016 05:48:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m22si2584455qta.60.2016.08.19.05.48.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Aug 2016 05:48:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:57159 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bajDx-0005ug-Rz
	for alex.bennee@linaro.org; Fri, 19 Aug 2016 08:48:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1bajDt-0005tG-OB
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 08:48:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1bajDs-0005LG-Lh
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 08:48:33 -0400
Received: from mail-db5eur01on0133.outbound.protection.outlook.com
	([104.47.2.133]:64045
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>)
	id 1bajDl-0005Hu-MY; Fri, 19 Aug 2016 08:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=s6KmW3L5N609inHzvQkPpq6kWG0BxhRCrqiw1G6FtIo=;
	b=cCYPOYHE7YTVZLR/BGbHLxlxHe20BlwwoXJUiQAjjth2rUT5fCukx6NH6irmKJGj8tJ8zqGGhctbb/wJvhBXHqKS6suR7xyDeuBhBn9VI0HHP9fBWhyhqwHdfmoXLN4Klc8UoM6h5C07t6yl7JPe232Wbud+KM/BXlX3bhCRdik=
Received: from AM5PR0701CA0010.eurprd07.prod.outlook.com (10.168.161.20) by
	AM4PR0701MB2114.eurprd07.prod.outlook.com (10.167.132.135) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384)
	id 15.1.557.21; Fri, 19 Aug 2016 12:32:29 +0000
Received: from DB3FFO11FD048.protection.gbl (2a01:111:f400:7e04::143) by
	AM5PR0701CA0010.outlook.office365.com (2603:10a6:203:51::20) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384)
	id 15.1.587.9 via Frontend Transport; Fri, 19 Aug 2016 12:32:29 +0000
Authentication-Results: spf=pass (sender IP is 131.228.2.240)
	smtp.mailfrom=nokia.com; nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
	131.228.2.240 as permitted sender) receiver=protection.outlook.com;
	client-ip=131.228.2.240; helo=fihe3nok0734.emea.nsn-net.net;
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.240) by
	DB3FFO11FD048.mail.protection.outlook.com (10.47.217.79) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.577.8 via Frontend Transport; Fri, 19 Aug 2016 12:32:29 +0000
Received: from fihe3nok0734.emea.nsn-net.net (localhost [127.0.0.1])
	by fihe3nok0734.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	u7JCVTcU014523
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 19 Aug 2016 15:31:29 +0300
Received: from CNU418C7XK.nsn-intra.net ([10.154.154.124])
	by fihe3nok0734.emea.nsn-net.net (8.14.9/8.14.5) with ESMTP id
	u7JCVSFu014502; Fri, 19 Aug 2016 15:31:28 +0300
X-HPESVCS-Source-Ip: 10.154.154.124
From: <marcin.krzeminski@nokia.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 19 Aug 2016 14:30:52 +0200
Message-ID: <1471609852-23250-1-git-send-email-marcin.krzeminski@nokia.com>
X-Mailer: git-send-email 2.7.4
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:131.228.2.240; IPV:NLI; CTRY:FI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(2980300002)(438002)(189002)(199003)(48376002)(7846002)(11100500001)(305945005)(19580405001)(2876002)(19580395003)(356003)(586003)(36756003)(50466002)(33646002)(77096005)(8666005)(626004)(47776003)(92566002)(50226002)(110136002)(81166006)(5003940100001)(87936001)(189998001)(8676002)(68736007)(53416004)(2906002)(50986999)(97736004)(81156014)(16796002)(8936002)(2351001)(106466001)(4326007)(86362001)(86152002)(229853001)(7059030);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM4PR0701MB2114;
	H:fihe3nok0734.emea.nsn-net.net; FPR:; SPF:Pass;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; DB3FFO11FD048;
	1:eqQ1xUcsgZuOIcPg/Ds1FSj3p46FqMFZFucknZu9USbiLARE+rmedBEyNQJyH3uNojB13lNmYhrnkp0XyzubqYToNHQWgrl+VeMhzPBFPzDU+Zv0gGz5f7XXaHJEu9Ux7MZurQytmWLY3OZrsnDQiJtOfFxVJBcPAYpVZTTII249fJ37S0qQq0irZ0rDXMKGkrc9PFZQl1C9rcZ6YpENuGV2EgtqTZwKO04diwRRrpDTBBDpvH0HuRpvGtSFt3QQFUEla5SbbJIqT6AOtPJiEVRAMwQVy2+agCTTA/Cj896D5dL7ee6+c8zHUbN7+muEYuqB4iFipCQhdCxX18eCdDyX/mfCPWfi7FZeTkhWQpm5GvreBWzXnavwu+MU6nYaaScE4RSF3nOfPhPniIVDr4ngIOLcQ1hdJVCo3mb1WCAvjHXyqJlPks9dQSDGOGsxDgGK2F4inefkWa6dlzPzjnQlhdUVVxsyOj6f6BY8ozPS4bjHJk6WnEmxAvGTOuQo
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e2a798a7-fdb7-42dd-c72a-08d3c82ce2da
X-Microsoft-Exchange-Diagnostics: 1; AM4PR0701MB2114;
	2:F2i/M287MD8dLpfCbzVlbRTVLIf8FuII/JQ12GjhDzUE0p2fOBgZsgL/8QeMn3k/kma80fE6XDEPZzBCM/S95/pYFDhCezWqdN5yZJPyNtxtixAkds6b7tbGX47DtSx5au9RwEnDCvL47ztPyCcLs8svu+s8kxg91P/yQaHC7LsVujRO+IdCC1jr184Ll6fz;
	3:45NddCk2IcchFEg0GYx2ACxfctAuQ77qDy+Qx3/JGGNdlFargatu2OPRtm5k2kOAapuMhK8MF44QRuSPEZQGdfAN6rGpWWiOFDdk+zDAReuCWk2zyzdt75WSfV+SKC5s3Y0FV4BQ5QQ7M32wP0MEVsKgmcDrnI2VBOD8p6VTEfoUguLOohjLRF11E2T+ldQIQQj9rAEd7+xisFtpwUQHRlOrqJxFA+ZmhpnA4IjkT0C+gBhyH/Iq4/lrfrg6unSswEh9fL5NIvaWGRgjQqb+oQ==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:AM4PR0701MB2114; 
X-Microsoft-Exchange-Diagnostics: 1; AM4PR0701MB2114;
	25:lVWHH+Oi8mOWOmDL7QdqJNoQGMkaR2Zm5jI29u1sAcg1SoIpT+hDFyZul0kHcfayq9ZHQmebPVnHyBW+qV+HSiCMgK+Wod/BQ2QV1xDGNd6qeTiGMMKcLiboKIvJTagnuCFIHe5mGxVLNclXMvuyofqD+vg9YQ7tLetwNniu0ArPs2HTwBvhAQ4G9oEmaOb2qhW3rnWHse4whUkwh2yLmWIYTRJBcGxJNJF4nmUMjVMCepiPMXQnTGuKtmzuElHRACyOW4Eit+O1Lcr3RFAsxbtC/awe0UXmCJSn+HFiHB0Yx4AXsSoc3LDTKC7eLeCWNg/MF9M8O/dzEsd0ebpREo3qWBbRckg4IaiSgELM6ljlqH/nGxDiW0oBVbsr0FTr+ygDWmc5uD+cudY3aY8vWTeSPKFJIQp752tHw1O+3E1F9KiJeroyAph8ps56t2vgQ8CJG4H6OppPm8qQUkW/rqnxSkyom6TGUgSHpuH8XvTTwiRzkM0Cu5WrMGkNYdrg0n9bae6XLQd8mXGzOpNQmIiZ20n9YhEM7k3gC1+VM1b/LmzKt3uJEbxt8Rv+ixfBL7uxGt/ht2y5NwyXCTVS9nfrGkC4LgR5/kDI71r3PAVOBA7sld7GZQaPDfEx/o4c3S9vHlECLp26T+uT+5pGAOl5G8qxwFynOws/+qmPo2oYEsmqn8ReiHOb8jiADaord9mbXi4TlIJCVv6T1IrreGGdBvOuyygF9NBDPgom/vO990oE32/Cmuoi/pYEpL+C
X-Microsoft-Exchange-Diagnostics: 1; AM4PR0701MB2114;
	31:Dr6ZbTd9WQ59ODSwy/ThL5kWV3PuXI10p42fXLkjNwTbPbEEFHSVkkALbTw/4FyNWTDK41d+faLFHW95Xv/ttdl8KIMQIyd/xeR4NabK01ZRuWST/6mMsq1mG77R3FZBCDZgZkrolxFrntUKEOvFHHGVubk8Wq0A7XkO9JcrseOIo1NY+OVXp+mkw7wBtPL9hnjFOomHFBEsRxYlyIO31YW6fHLf2aOqjZgLWVhjn4M=;
	20:krRgGfplI+FgRbSduJCNAGCkwMH23jXgSLINh+6ic+9LTnwUVbsAtZkQof7KD/iLgNjSFnx6TicstB4R+pQdtc6XIQHXkJaCsB9Rb/oQ7Ojbz/7oaSY9SpKgtGAAFtGxTsi6s+IW03sInkJ3dYKTbr6REDiiHjZUepnQheKjUBpjVc4TCSeGr3Q4cUi06bgJwUeAMtbOxlC7gkoa0Yjdo9nshy42W+lXU4BYHtoLFQdTs7HTvlsbE9ZOA8csxbHVIjJTl14slo3lRYRhW1IfQe2tJD/4ob1egEQoVK9lisl2FHJIw6G3uCqUDQ/XHzNSjUMWRJwRSu7Y3W84D3a8YihXaIcLzFztoxTYtL2hEzT7AcTZABTNbdUAPgB6wrMZYg1YWnpvxTAMStL/I+7j8S/WCLOZl/z0TPkl4y5kmPPc2nt9AmQiXVRTwALGwHyLV3zui+aFbDkFv9IZECoBhGbsszIpYDTaxGS6JzdIW5VQGoZJ3nDtEiNJlruJzS+WycJHQ3Mt2kgZA2GyoZmiSVrWpqPLs1nHH2reMsw7iFyOhf8hvgw+flitec8O/+9r4mXQcN2CcOnotUbq4QrmEMHs3WoS4CDovbBB2ahIrss=
X-Microsoft-Antispam-PRVS: <AM4PR0701MB21144A5D08A571FD6A93439CFE160@AM4PR0701MB2114.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(82608151540597);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13018025)(8121501046)(13016025)(5005006)(10201501046)(3002001)(6055026);
	SRVR:AM4PR0701MB2114; BCL:0; PCL:0; RULEID:;
	SRVR:AM4PR0701MB2114; 
X-Microsoft-Exchange-Diagnostics: 1; AM4PR0701MB2114;
	4:vO2wgPzPC5HPJSnZm3rxdZKxDz85np9Okjh73q6lvNhbedvcW+7b80/MLDRXajyRoMcAVqmS6+28oaMkN8BtekCYYOA+IIaMMjRf2BCPu8M+BqzWZSXE9RBtXpWbe9RpTjrGlk8t5qCIYsvIV9yzjKqumrlk0Dx+4eDwRNETW9rQzdqF9JKKmrrHocBQnAPAVnE8a5bcuOG/G2yBdhN8wClgaVd+fJgLsgJzIjanYjrzWAZMzK3fZ5dmfVbj8N0kXa30ihVZ+xxXEKSExGCIylc+Kb5587PmAG1WPQoC+2/oj6rI/vs/Sz2PocB/DqvG9bZVZ5o+obQo93GI9NJJ1aVf7iLlFDZVrTT4NtY/mgalbWzK9Xcbz9RhRnJLzWo1oZB4PozPmpB/N9568NtJd+y9g5Ks2Ki/ixF+ZEcyMquI5VDT6MlOBJYjGLU7/mvs+fqoWwlwtbHAg4P2RmpxV94WVFmNVs+qgFLNz6RuyaQ=
X-Forefront-PRVS: 0039C6E5C5
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM4PR0701MB2114;
	23:bhuM9dDExTTTkImpky2J/OnuCk+EqhZYWHcWcPP?=
	=?us-ascii?Q?fpVqS7XKql8mzeOVJf1I8z/6Htj5/V2bULyx1bonih/JbkxsQTqzQtHm3aT/?=
	=?us-ascii?Q?na6N4w3nG+tOo9Qyh6cmry3CNuaED576Fbm1v0W6obTIHBBofnwqcZ0xPhYP?=
	=?us-ascii?Q?68TgPiVhE3bDmo5xggAdKPF8rLjxAEFrI115IDJA0ABRFSlwhBu3r6WRTDWg?=
	=?us-ascii?Q?+z6ri4X+NmE9z7/bG4XYm/NK58h1024jsLmspj1qw4AWVxQaFbRBpEOLqhy8?=
	=?us-ascii?Q?76PDC3tzLYD8ZFJywwh1GwnEOJJxe+mCJZ9WueTIcVWKIC85QPKAC/2xWWX2?=
	=?us-ascii?Q?mjeFDV30gm3R5WV84a2/cr08XNEBQPYw6gp7bhga24c1bHR4Hc9SmY+kknYm?=
	=?us-ascii?Q?vVllw/tZQJpAaUGNGBqfxDc0DzYSVPIFoPa31OdWbnThzcvOVpaCK3ma4hIT?=
	=?us-ascii?Q?pAtGPt2PwEPl6Zgh7lcP2RvGcg4HvjtsGFdAGe0j1GtySIl8MWOCqibvVM2C?=
	=?us-ascii?Q?KcVQG2BsKQen/3WuY4WDc9SF1IKcyvesOEp7MafLs+YA+0QzJJdW2EgQvVQM?=
	=?us-ascii?Q?3e0GOjmMIHHb3+bPiiDpCxIElta2qPD0PCkxrQOK+QSegN1TQpzLijZrjla6?=
	=?us-ascii?Q?jJTVRE4Tyj++v2UGv2xgsS4fflxgjLWseTh2PUAjF4HD47QinQSgV2scwWOW?=
	=?us-ascii?Q?F74W8dUMgkCQcGYHx/5ZT959InPK0bZ96GJIGN10ZEgbbDM65PVZMxV4WQKN?=
	=?us-ascii?Q?6V/Y8SUi0AeLjaXiNYQsviZyTMEIRuhmdfdh70zKDqCB7AnSZpcvupn0dfRt?=
	=?us-ascii?Q?Eu6GoNGBJ8wnbDmBo63kgBsXNvEhrGzjv9GKi66U7kwfJ+zttL2g+NXyjcdP?=
	=?us-ascii?Q?Mt3oVDiqJytr6ymsIZ6D4i66KigNkUjRZZ9Y3wAua12ZuF+SqV7QzWah18Ma?=
	=?us-ascii?Q?eYRCqhmCVi2+GQBpNL4UP9lFISD6N4WuVlRiVyapOKwA5P80C59unMXOpazL?=
	=?us-ascii?Q?Di8Xx6gV4GGvkFblUFKvPj/kPycbv+A1EPvxbuBmq8cOg1AOcwg6dMXs+lSP?=
	=?us-ascii?Q?8QaIqXxQM3Itmq+y0VkC9mEZUB7IWMtWqw3/73QHC8vsl4V3+F2wFNc+A7Eq?=
	=?us-ascii?Q?HdiWtWXNbm0Y=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM4PR0701MB2114;
	6:ucvLfN1bPZ3CEh/VBzgDsEZ9y9JX7PvqpVSuCGKe1yPoUVfec4krV/Y43xfZ2rhN+Gxx18EoWvEe0HEu5VycmoVe3/WhnZRYVRwTRRf7nNlmwcEtb6q6cgepRo1pESb30y5r9KnoV1IhL85uH8xAG3mktw7B6FPmHINmiOrkWoWErEV+/L4c8bqOnQC1G14KHLaVYsAJhCy+eABGkXloYgh7CQEhUtDehgio4DBnmlGq/PX8NHJTtBhr4HeVP3Ntw6Xi5HJzVV+lpnGdM7+aTJ+a/RXjQ0+xNB5ynnRgaWRk4B4hS+pEUIt2tcCmlhhZmpmKnAGzrgU4f7OjFJM1xw==;
	5:M2xMppk3uwjkrhiBtKfx4F+e/njdPHSHDYHoiO+PjUY99k8HDQhRhAVseYAb/zV+RpRlczas5kQFf915dqA67aAH20YJzH4UiorK4obK06RcwHGgTt+m2h0zp1KX2iErjwHWoh2A6liVGCcbe3YxLQ==;
	24:OpKcqu1xv3BeSsZfHENZkMqyfcIWDDEfDyk1FxhlfIzhdRJPgpKhHMPbojG1tQUKJzYJLPcNloySRqY3rJzUw8NgYnbqMtPwkMQruYXM7Aw=;
	7:LIaMtuduZbTfFlWE0XspVM10T4DIiv9dXg2vnXqBUGpkGJKhR0oNg5m2//6jgp8bvFbZ6IlEG/k0Cm3xMs1qXCvCVNXe4E+tVBHwStqECd22V5FBD4GqCUfzoaJMSMb7yejh46O0pgt72NI42ywpll5sT/ThWIzKucx0py7bqkmzf5Ue19jVlOq0K7Qy41CNRLSrs/LcbiIdqiTfbfzETE5W0iOUqwQmnTPd1WnOnggPCA/A54+Wx+NKXDIEiweL
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2016 12:32:29.2768 (UTC)
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;
	Ip=[131.228.2.240]; Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0701MB2114
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.133
Subject: [Qemu-arm] [PATCH] block: m25p80c Fix vmstate structure name
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
Cc: drjones@redhat.com, dgilbert@redhat.com, alistair.francis@xilinx.com,
	qemu-arm@nongnu.org, amit.shah@redhat.com, rfsw-patches@mlist.nokia.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hUFM7WIIaQax

From: Marcin Krzeminski <marcin.krzeminski@nokia.com>

Change wrong name of the vmstate structure. Since this breaks
compatibility update version and fields to 0.

Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
---

This patch assumes that none migrates m25p80 flash devices.

 hw/block/m25p80.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 9828ee6..d29ff4c 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -1189,9 +1189,9 @@ static Property m25p80_properties[] = {
 };
 
 static const VMStateDescription vmstate_m25p80 = {
-    .name = "xilinx_spi",
-    .version_id = 3,
-    .minimum_version_id = 1,
+    .name = "m25p80",
+    .version_id = 0,
+    .minimum_version_id = 0,
     .pre_save = m25p80_pre_save,
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(state, Flash),
@@ -1200,20 +1200,19 @@ static const VMStateDescription vmstate_m25p80 = {
         VMSTATE_UINT32(pos, Flash),
         VMSTATE_UINT8(needed_bytes, Flash),
         VMSTATE_UINT8(cmd_in_progress, Flash),
-        VMSTATE_UNUSED(4),
         VMSTATE_UINT32(cur_addr, Flash),
         VMSTATE_BOOL(write_enable, Flash),
-        VMSTATE_BOOL_V(reset_enable, Flash, 2),
-        VMSTATE_UINT8_V(ear, Flash, 2),
-        VMSTATE_BOOL_V(four_bytes_address_mode, Flash, 2),
-        VMSTATE_UINT32_V(nonvolatile_cfg, Flash, 2),
-        VMSTATE_UINT32_V(volatile_cfg, Flash, 2),
-        VMSTATE_UINT32_V(enh_volatile_cfg, Flash, 2),
-        VMSTATE_BOOL_V(quad_enable, Flash, 3),
-        VMSTATE_UINT8_V(spansion_cr1nv, Flash, 3),
-        VMSTATE_UINT8_V(spansion_cr2nv, Flash, 3),
-        VMSTATE_UINT8_V(spansion_cr3nv, Flash, 3),
-        VMSTATE_UINT8_V(spansion_cr4nv, Flash, 3),
+        VMSTATE_BOOL(reset_enable, Flash),
+        VMSTATE_UINT8(ear, Flash),
+        VMSTATE_BOOL(four_bytes_address_mode, Flash),
+        VMSTATE_UINT32(nonvolatile_cfg, Flash),
+        VMSTATE_UINT32(volatile_cfg, Flash),
+        VMSTATE_UINT32(enh_volatile_cfg, Flash),
+        VMSTATE_BOOL(quad_enable, Flash),
+        VMSTATE_UINT8(spansion_cr1nv, Flash),
+        VMSTATE_UINT8(spansion_cr2nv, Flash),
+        VMSTATE_UINT8(spansion_cr3nv, Flash),
+        VMSTATE_UINT8(spansion_cr4nv, Flash),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.7.4

