Received: by 10.223.172.38 with SMTP id v35csp4371041wrc;
        Tue, 26 Sep 2017 23:39:13 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QC2oxp9q9CTXfnKgkVlgal44EV6rISl/z3iz+ynozCZTDWu4OhamckdH9ox7n+iPq8X18sW
X-Received: by 10.55.157.195 with SMTP id g186mr895372qke.347.1506494352999;
        Tue, 26 Sep 2017 23:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506494352; cv=none;
        d=google.com; s=arc-20160816;
        b=d8WmsPIzihzrzlIqWdwpui8tubvjt+pGC6lkE32KXQdBb6RofgYsOrf7NcHqfHmlB5
         W4al50Ket1ZF0A4ynJBkdQ55AyzlEO37SJ+nK/r6cu8betctnCQBkcZVvLNLqZgOriSO
         xi2HHwUZzIVVIKiPIzmxo4I5+x9yAixCKLxgaMsytkmF8EM0FSbjt3YZnkN2twTdUZ6U
         5udmbjMcCh3viA3Gf+j4KpOhZrfyyARhFDGnaC0lWh+LO+C+YTEMJyhGPfx99BLkmDM3
         Q2cTqYgXmkPHB4vbJh+3eU6D2Z5yZb8gcFHBxwbp6xDZmhT3gNGJtkObpaM1mXtTbBeB
         Ljdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:arc-authentication-results;
        bh=gumSg2hnRjNav03k+rqdwzI7AMOUWukITDVrb+mjWs8=;
        b=IONOjeVs8JZs48aw+U6qK7i6q3U5Ll0Mzw63iR9Qp7diPLLOP2iLJQcwlAQsKlTqNN
         cw4RosxLlTblL7D77sYJx4LTtD5ld59Kc9jmFJKET+29vl+3+vGfwl4XOiyzXkwNDy38
         QilHIj50wlASsu7WX7C+BQ7hHZ1FE48wvpxmPC+LdA3xbrgBN0k7n9fSLO69crXRDs9u
         5BZA3TUUHmwZA1XH9ukwpZ7FrNNhKYGJG7jmc8Bxn428E0tNU/55GrufVmCY04fWzrmk
         pGLgTNon3QmpkjDBVOU/W3J6URun+qPENPGd/pAqGq6TQ3rE5nFBzf33n5B4FE+H254X
         lkMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z47si2722561qta.96.2017.09.26.23.39.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Sep 2017 23:39:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:52422 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dx5zy-0003Lg-FZ
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 02:39:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dx5xf-0001Ma-DL
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 02:36:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dx5xa-0008Kg-OQ
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 02:36:47 -0400
Received: from mail-by2nam03on0044.outbound.protection.outlook.com
	([104.47.42.44]:51376
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Bharat.Bhushan@nxp.com>)
	id 1dx5xa-0008Jy-Ep; Wed, 27 Sep 2017 02:36:42 -0400
Received: from BN6PR03CA0070.namprd03.prod.outlook.com (10.173.137.32) by
	CY1PR03MB2362.namprd03.prod.outlook.com (10.166.207.149) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Wed, 27 Sep 2017 06:36:40 +0000
Received: from BL2FFO11FD010.protection.gbl (2a01:111:f400:7c09::125) by
	BN6PR03CA0070.outlook.office365.com (2603:10b6:404:4c::32) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.11 via
	Frontend Transport; Wed, 27 Sep 2017 06:36:40 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD010.mail.protection.outlook.com (10.173.161.16) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.56.11
	via Frontend Transport; Wed, 27 Sep 2017 06:36:39 +0000
Received: from localhost.localdomain.ap.freescale.net ([10.232.14.21])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v8R6a2ND027330; Tue, 26 Sep 2017 23:36:33 -0700
From: Bharat Bhushan <Bharat.Bhushan@nxp.com>
To: <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<peter.maydell@linaro.org>, <alex.williamson@redhat.com>,
	<mst@redhat.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Wed, 27 Sep 2017 12:03:20 +0530
Message-ID: <1506494000-31982-6-git-send-email-Bharat.Bhushan@nxp.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
References: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131509677999839920;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7966004)(336005)(39380400002)(346002)(376002)(39860400002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(105606002)(2201001)(50986999)(76176999)(86362001)(575784001)(72206003)(498600001)(2950100002)(47776003)(50226002)(2906002)(106466001)(305945005)(356003)(97736004)(6666003)(110136005)(8656003)(16586007)(316002)(104016004)(7416002)(77096006)(68736007)(5660300001)(189998001)(4326008)(39060400002)(8936002)(81166006)(54906003)(81156014)(8676002)(53936002)(50466002)(48376002)(5003940100001)(85426001)(36756003)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR03MB2362;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD010;
	1:iAfABr82hTryie36oaES9KSvX272QGmbEBrmRs0q3F+pdvx2bS6ua663zlMAt9SrT9bSJ0S6+LIFpjbKyxVolySm4gtZ2ya1mHpwUMZ3r23OPvmdGY75L6gyd41CjZ+A
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df9555e1-0495-4373-6e59-08d505721c16
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017052603199)(201703131430075)(201703131517081);
	SRVR:CY1PR03MB2362; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB2362;
	3:Xf1fEwgmUhHo7K9gQehFhk7/WWFUpkvv0TfHIOQmIsBNITWmokf858sQrgTKhKfthzFNy11ooVsd49kCShPlW9Ww6BqacNNIHkmxUCAXSFtaWY19FFe1BQ1kYBDRth8jDm0AuYdE4S1ihxSOLkAB5qGTpmtnqukyGQUl+as4Jrt1mvXNsQ+w4uj7biPFZEcJ+uPVe/EvxCYoW7e8+ZafIPID3nJrn/lp1THjd5gvZpztgQLeyxVq6tu9oQPeHXt86gETGd9acRIsZho04YnoeiRI7k/SGGWTiOyeP7LYuWuDTsr21Fm/VzdDEStNMjShve52ed46h1VUBtFCExJ71s3/Fy0oG+CxfkZ6qisFbzM=;
	25:Yrc1ngPwMAJY5cYdFumcQ21/vK+UbVaejHsHiKkgAu4t2CoQNbeojm9sqGnqr0aMALVVH1AeZZeY7vWytFQrZD3zglGPiLHvsn4lkZshzQA4cOTxVFVwhh/bKcoj52aEi1OTQc5zgHlXq0slwv5RbQ8YaWHOtpSuTKbdRpxOPXjJVztEdh6pjxiLESOPltG4i53MYj2SuCP/6bDQzoJxD9qOC1ywIG3uu5Ns5nB4XNljet+E0ixbyZkohvixAxwsAFAt83U3zdSJ3LUzxuQlHZKeM/f+qC7AGa/yP0MdHyBOlSermWqI8+ugXmTTHAwbq51h9awbP3gnEtWPAcEYJQ==
X-MS-TrafficTypeDiagnostic: CY1PR03MB2362:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB2362;
	31:bQ+jx4jeneBEFwmQJDExI209TD2xHe4qOupDwjEQF3HjsdmOgwXtmuPRMvCzUcKzJPoem2COWq05iurVc5q5RIGFf44HP9Y6dei1CgUOgnv1vxDTxQeUmwQbMtRZpHrjWR49Z+2GQEvVwoPWd/v31yj9cWsGKftOW1JkVht9PSXUQW7++paA0oIqOmQHTC/ffGdKD/srbAsxGmqojKTqDq6X5s6KwCg/PzbkCF87xlQ=;
	4:Y6KbMwVPUqg1yk4jZyaWXTducYqjXtp8qpqKqBLfjvcONCeE7UCXlVGgwKSLKD0mC9Jv6/txOX/Fvfvsje+pDoBs9qwX2atzvdB3wXoHK9+Vkzr95fBslHpHxsBaWoKaFY7yoJmYhebWK7UfKHA42sdgB7X4JDAqNEkPHu9InB4tpWp0Jk6JeGOtayUNhAQLp2XPdPrdr7i5fz/40vxKL/Kx3cedRnlTtfff9iVQJJtDktfr1yex7dWnYK8LrYq3xgiOczVYQEdOFX/3SAedPUi8xH4kTI2+9Xph01EKxIg=
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Microsoft-Antispam-PRVS: <CY1PR03MB2362FCCDC034AC33807145449A780@CY1PR03MB2362.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6095135)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(93006095)(93001095)(3002001)(10201501046)(6055026)(6096035)(20161123565025)(20161123556025)(201703131430075)(201703131441075)(201703131448075)(201703131433075)(201703161259150)(20161123559100)(20161123563025)(20161123561025)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR03MB2362; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(400006)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR03MB2362; 
X-Forefront-PRVS: 04433051BF
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR03MB2362;
	23:c8k1+vie97eXUGHGiqhq5bv10wGbrvIuWlXLWw7oO?=
	=?us-ascii?Q?4JNGpTwSvb5fdEL4PDhh1ho9wcZFopLBS/ngJgXphcyN4xz/wDpy8JbJfOYS?=
	=?us-ascii?Q?fxKHXAFUKXSKXtH3q/XmqXNo5omYDFrI180y5pnxdKoCeH/4V2omnnpCkalm?=
	=?us-ascii?Q?xrMRRfKuSsqdSi/4K4p0QIC/aS0bxVgnKW4iLz58EoZmEtxgKyJWAtKUUzC1?=
	=?us-ascii?Q?IVkb85J40F7C1erWSPQhohf48NIsoCkKc3tBTqUBXakUJ46yLVCHofWsj94J?=
	=?us-ascii?Q?TB4pY2vZ446mq2030ZqGaL2Gcmj/GlQ6AqCZcQMwmMOREOfuY9nE08bpt8uR?=
	=?us-ascii?Q?YXg8Eic+HfFMnMEdw8C6QnizEqlb33VgmLJqHvQaOW1vC+zNWvqx6FTM9g3U?=
	=?us-ascii?Q?KbwExzT75t2mCmBNvXu6+gkZMsj55twMidNImS+DLETE8XDcrWa1XkXDaN4W?=
	=?us-ascii?Q?FOpIzFuOXNyoLUugaWug9wCde96Y6Z6xP0z50vzJHxkNnbz4LKARMizwAYiL?=
	=?us-ascii?Q?FN1M7rwErd1E5XLXO6ppy8UTcHkniKp7gh78XKKBNyVuzAM481LZlle3WC6Q?=
	=?us-ascii?Q?79kCtgJ6eLBgNqKBSMVIUTyDQ5zNl9ij3GYtTKgv8VUIrlWCwGi31tYEHG8u?=
	=?us-ascii?Q?EeUiAshAiXC1mSYJ3Anx2GTmNG1+pqIAg+hyGqGExK8xp2aLU6fwu65KNZdl?=
	=?us-ascii?Q?moxt1dcDXr8pW1J7v9hnAV60tUM8Sids+vGa0uL8Jr38Qor/ZDj6V32Q7XmT?=
	=?us-ascii?Q?a/vy5ndgSsH2WoWXTXyVU3DGAlEjTE/CwnmrD6Pvah4kb/O/VWRy/73Q4YX3?=
	=?us-ascii?Q?vsYucEZgqk5PfKLehPogjI1sOaHfefthKAvM6TBaU5X2wQnMGnJQW1qzNzl3?=
	=?us-ascii?Q?Z6vB03EmcJK3QfvKQlJRVSUtZaK348mDr0sAXaFVc4gP7m0LvataOHE/OSFv?=
	=?us-ascii?Q?wEyN+zd5lGtoDeHvxDtiV3u3DBj9YSfy/pkAh1zAxTX4xOQ5rJl9n7mq/Mwy?=
	=?us-ascii?Q?jYD9R+12GpkHHL6mTH6SQj9kixUrordRpzkSsb32z5nX6ULCnEpRWeazXHHf?=
	=?us-ascii?Q?ONuTgRhkt/ToVJ6qwGQTkqs5KH5S76pSMboA31KVrSkrQZKJYt1IH6fAEc1p?=
	=?us-ascii?Q?0Fm041QhlYHDxc+vHjeb/fcKvM4hmCc2ksGcWupfnipZxPGly4K7YWKhRu4I?=
	=?us-ascii?Q?aT/NW/54rBweSQVVewKZMSBjrXft4+9xlQJf65ZqTklN6Ee3M77y8nZwf9X9?=
	=?us-ascii?Q?ZSXbrXEL9kf3SGI0RWFDF26q73S7M747ZXd9dSw?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB2362;
	6:QT8aLDfODLXZTjF7aSdBz8w4yf9a44gDxN+zPSOjFM5D77gjYBejTpUYI8fQz21fYcemePx7mq4y6wTfAtXLN1pW72H7+uxmiHjUTW+Bekw4EniswZzr8wYuBrpT7ZmHOxa3SmALAUYg3oIKDcrVJFrnrR/9vmxYJL7tjm7u75RAvO7P1NsOMtU852W4DrSTONwhBFhS+USSVmGOgtXRLJXZksjGhRFMYpPmWb0B66ZozABNyEzmx1aaEXs0dINMuUqLTbNggibGLi6Ia/SA+Gl2BPhGoUr+F8JYPfeet1bPVW7TZ8OCiIdnhV1tfwRT1ABsiV+K8Sib4WEIR/8tTw==;
	5:ThGUrKh1RJKBwr6CLxyFkmHe40N4PyOlf1YrlqfZNv3UNmROOs2QEIDAX0991jne4Hp1DXhsiyOLDPA1crhzxq+mHnRCVDP3B0Zo0X6P0D4+c6x4WSNQMxpEmUDJqeq2isjMlnbFNIkyYWBoFneSlg==;
	24:AWAEOF2o27I4wbJSj3Is7L22BICbkqHJ5ITEZs60ZvP6S+dgm7182PI+1y1EjOiW4E48S/qhZiT95scu5zUB/5abSU/mL33kS6YCYHw2mpw=;
	7:e8ldqSvbBFCsS7pQdtrR+3ThuYcm3lZOqgQG1jiz4+PR7B5IcVaD2GelTzo2MinEdSpAUAvJr5VuUHPHNlrOu3bsJhNVVOblAcw8gCvbLoR3Ho5Wpj3Jq86Zj6eSxiG6OmfOAkvFu5d54zbo6Q0eT4zjCFYl95vLOm1wkI9iJhiMrYPLO4t8qlpACLldzeIeiAPtkNAsw+z4qSM6h5UVStPw2QKWaHTPEfPoynKd3/w=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2017 06:36:39.6407 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB2362
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.44
Subject: [Qemu-arm] [PATCH v4 5/5] virtio-iommu: add iommu notifier
 memory-region
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
	drjones@redhat.com, robin.murphy@arm.com,
	christoffer.dall@linaro.org, bharatb.yadav@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z3ZoUG45iM7Y

Finally add notify_flag_changed() to for memory-region
access flag iommu flag change notifier

Finally add the memory notifier

Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
---
v3->v4:
 - notify_flag_changed functionality moved in separate patch
 - No other changes

 hw/virtio/trace-events   |  2 ++
 hw/virtio/virtio-iommu.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 840d54f..a9de0d4 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -52,3 +52,5 @@ virtio_iommu_set_page_size_mask(const char *iommu_mr, uint64_t mask) "mr=%s page
 virtio_iommu_notify_map(const char *name, hwaddr iova, hwaddr paddr, hwaddr map_size) "mr=%s iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
 virtio_iommu_notify_unmap(const char *name, hwaddr iova, hwaddr map_size) "mr=%s iova=0x%"PRIx64" size=0x%"PRIx64""
 virtio_iommu_remap(hwaddr iova, hwaddr pa, hwaddr size) "iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
+virtio_iommu_notify_flag_add(const char *iommu) "Add virtio-iommu notifier node for memory region %s"
+virtio_iommu_notify_flag_del(const char *iommu) "Del virtio-iommu notifier node for memory region %s"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index d4d34cf..a9b0d72 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -764,6 +764,36 @@ push:
     }
 }
 
+static void virtio_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu_mr,
+                                             IOMMUNotifierFlag old,
+                                             IOMMUNotifierFlag new)
+{
+    IOMMUDevice *sdev = container_of(iommu_mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s = sdev->viommu;
+    VirtioIOMMUNotifierNode *node = NULL;
+    VirtioIOMMUNotifierNode *next_node = NULL;
+
+    if (old == IOMMU_NOTIFIER_NONE) {
+        trace_virtio_iommu_notify_flag_add(iommu_mr->parent_obj.name);
+        node = g_malloc0(sizeof(*node));
+        node->iommu_dev = sdev;
+        QLIST_INSERT_HEAD(&s->notifiers_list, node, next);
+        return;
+    }
+
+    /* update notifier node with new flags */
+    QLIST_FOREACH_SAFE(node, &s->notifiers_list, next, next_node) {
+        if (node->iommu_dev == sdev) {
+            if (new == IOMMU_NOTIFIER_NONE) {
+                trace_virtio_iommu_notify_flag_del(iommu_mr->parent_obj.name);
+                QLIST_REMOVE(node, next);
+                g_free(node);
+            }
+            return;
+        }
+    }
+}
+
 static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
                                             IOMMUAccessFlags flag)
 {
@@ -1041,6 +1071,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
     imrc->translate = virtio_iommu_translate;
     imrc->set_page_size_mask = virtio_iommu_set_page_size_mask;
     imrc->replay = virtio_iommu_replay;
+    imrc->notify_flag_changed = virtio_iommu_notify_flag_changed;
 }
 
 static const TypeInfo virtio_iommu_info = {
-- 
1.9.3

