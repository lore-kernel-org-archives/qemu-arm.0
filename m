Received: by 10.223.161.27 with SMTP id o27csp153619wro;
        Tue, 31 Oct 2017 15:39:24 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+R1k/ctEfr7bzUY5JFY5TrzE4/Hzz4gYOrviFHZXS9DDg3XcHsCBE/RDcw8H5SxbGkjptnX
X-Received: by 10.37.171.133 with SMTP id v5mr2214090ybi.246.1509489564767;
        Tue, 31 Oct 2017 15:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509489564; cv=none;
        d=google.com; s=arc-20160816;
        b=PZseUJgyaProlkeWgd4EAPaGMBUNPGGZKHTFjdS055Wz4S/H1GAn9GUSaexc5XeEua
         d0CQ3ta0Hs3gPF8vsdCuzI80H9+mDbTfEkcWlX3/l8fcgyEbUZt03oiPw6Pds0wWyne6
         ftrefpbN970B6Xmq5B8zp7sdEk+1I77bDhdBHbNauitjJISB1TD8IctRxSORoAh6ECLf
         9ggJye9Kf5m86wN2M1QAPg2jAA94UjGbe41vfWLjsBhkaP2F47YSbtv1A8S/50BpiPaV
         D/mbymsZbBqK6cwGtJlhyPSC5JfHn+a0x0HdQZy/oqYVk6c1sSOZp/u5qeq7xF7Pan9O
         y3xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :spamdiagnosticmetadata:spamdiagnosticoutput:mime-version:message-id
         :date:to:dkim-signature:arc-authentication-results;
        bh=j1pTsWyHFWZHTEaJxyEhXHCpqkx9OVVladHySxMFtK8=;
        b=udER1ZECYOTUHroISq6NqwcBBYtHDEhhrnIFJWyS0lwNcP/GbnB5sGJEsdT+S0IcCV
         iRSvOPR5t4KoRNmXb4IzZdaoVM7+mokqve9xBmzUbsOMtIJbTAROFVMBSk3/IFBmm9SD
         y2X/R8N6sDCapuLxaUZUrgX6br4qgAc05QnKzuJxKCTIksdLbrJhSBAYZx0P6/Yb/u5h
         489dS+Ji7lMhJpMojDfI/YJhGGPzZAjuuzvAEzteb07CSTUczk5N/Oolql1afUyxKRgm
         XI3FKBT5QE8az3cuZU3ZwKBLWNvAiCRqQyIIwghpembXwX7DJbbz37v+0e2rnPFmhp1k
         lzWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=S0aB/4Fh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l11si613764ywc.204.2017.10.31.15.39.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 15:39:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=S0aB/4Fh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47594 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9fBs-0004oM-3c
	for alex.bennee@linaro.org; Tue, 31 Oct 2017 18:39:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1e9fBe-0004kR-Gq
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 18:39:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1e9fBZ-0001tK-8H
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 18:39:09 -0400
Received: from mail-cys01nam02on0115.outbound.protection.outlook.com
	([104.47.37.115]:28247
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1e9fBY-0001sM-Kw; Tue, 31 Oct 2017 18:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=j1pTsWyHFWZHTEaJxyEhXHCpqkx9OVVladHySxMFtK8=;
	b=S0aB/4Fhb4B78nZCVnEywlTFwV1FkTRvyJPYulXyaaWKxRhUi90h0XNg6mJ46oagC8DPy6LvAx1SR7N3ZmExDabqXq0unM8qE358NPMens2uISnSUwVRQBIQ90nT17sQDdVct9HsjXql36v378q/9/wlKyVJGlb8FkxR401lY8U=
Received: from localhost.localdomain (116.246.28.225) by
	CY4PR21MB0151.namprd21.prod.outlook.com (10.173.189.21) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.20.218.4; Tue, 31 Oct 2017 22:38:59 +0000
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Oct 2017 15:38:30 -0700
Message-Id: <20171031223830.4608-1-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.14.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [116.246.28.225]
X-ClientProxiedBy: HK2P15301CA0002.APCP153.PROD.OUTLOOK.COM (10.170.144.140)
	To CY4PR21MB0151.namprd21.prod.outlook.com (10.173.189.21)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef904c4c-28da-49ce-a21d-08d520b02e92
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(48565401081)(4534020)(4602075)(2017052603238);
	SRVR:CY4PR21MB0151; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR21MB0151;
	3:ol2u6BXbt1+RCzkdiZWTuDsqSxLT5+UhQrVuIPBSBudT1RqrzzttBf7Y7uaLF11OlXWVGtdfIlvR0d8riqb5XXkxVzylSTrKA6dJZXITQILQrv4MqWZRZE8CKBLBHGuviOEoypGV54cF5ddeMb80Q7pVufY8SLTBdo+VAlXOrDpxkde61j91ZIaQs4xjnj0FnzEhoo0HbvxvsdOM/4ZZVDFgfdZkwUsAHJmxkIJD7vEOEdGObcyVNJ/uPhtkmCPv;
	25:wf1QYwMq7z96CKO5mPzTN6GC3OulRbDAQgB9R9tst7/dbkIe6XG4362M5SU+vnpWQ1jO+T+HzjxNjhRA4s3Ip07bIMEnvVyrn0WajqLLF7pOqSH4qYhAp13FZfLtk6tz0kWNpumiEBCiHoiWF2P2RRAtlHvnUr0o3UOSGeKT+AKcz+GykIWbFqseymCkGSyz9fRrlE/attzttgl+yQNYgFml9r7JctWcoVHl4tl+HYYrxJQvcgHGL9jDasjOKjH8bgmFit5MBEUsKGhv/2GAiR60aGJcb6alpAYW+IA4/fqJaLvh+H65PPBKj+0C8i/kft/TF2gY5ESK1jmPXRBfrw==;
	31:5de53zQE5ce4g7PBFyPAPn/fqbmaf+siGTfdIHqOhBLSnP4fWSBzBAAAVcpDIsuKW5cKx8WyvRQDuZCv6qNy57poTykNmkpYtcOBASXkXlnQc7q2A3yN6WeqT7pgHalFuP8K4WFvn1zKlyBz5mFxSjrwV99uA/frL/qVBDrfpmii2AVxAn/4NMMNp9axb6Rpga0Lo6koxO4zKVhV7a/wssC14aiQq8KZKRpmQUEcJS4=
X-MS-TrafficTypeDiagnostic: CY4PR21MB0151:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR21MB0151;
	20:IwfOM0sLFIaECSfW23wm75RAa3H6D4vXZss5ZCRJ1UWCqWCZ4Xkc1tIpWGTDxfrWLGXF1eEHCL21Lgty3+80YbUvjBkMAJcEl6Usl0MGzSsgOT0BbPS9mATC20g18HgcVsX3QcygLspeQ01U/OlU+mJLwPZR12ALo4IozfyBo+vhrEnTTcXKoP+DcFnZoOb2IpCFXIDLTkpmi66VqKQ0xqsY9Nw2ErQTpzdfNYKveflHpRMFUd2th3uKQbkjuIHkIz3vX8lv2sSgQPD+t0XnrCAfT0qtYfYSVWJIndd8BNbtnryNClMSwEi4WzQQSoRTgZPHR3xghDjtYaOBrPGgziBDe4qrPhMKqfo0t7/J7Qo0nelUylL6XIwRbXjxtXnTNrDezaZtSaIq5Hi6TDPcpsMP1RyFP8hnrRDpolgXk3wkR35PbpPtjhBCynF6Spv4297wIpTkJEfu6/XkDynHhtSuzCD4H5i0/ZLX0/Iy9cRSetZlXo4wW+0bmRIENPa+;
	4:MWiRZBlHv1Zou6rIDJC+8fmnNrPN9PBLCkcVM30VbPftG+Twim5YqH8in0TXS0EY5n4fHP5j560a6bbct9KEVT7YJjb7wtSDXCHM57HrLMN1sgaSsMElKM+3lbJR+0EnIpS3K8EmFYfsSJSnn0/RyaxPmulb36O2brypVYJWfCsD1hGJYWnHfnUOtTwbiKoxzu/3y7PYlJ9JxyblLVUMHy/kUvGNN0fHS3MuyYIFXYBe+daGIMWzhNtmrZexRUiJOFkWnZUoV5MOnyeQnPKTQeEp1j+GbJZDTQs+WPzhJ2Ycx0sJ0KKCQooFtaQXpGEEkClOmcT5GEgQGr23+DCXdFGgXHLfzbt1YUC1HnYpjlY=
X-Exchange-Antispam-Report-Test: UriScan:(89211679590171)(192374486261705);
X-Microsoft-Antispam-PRVS: <CY4PR21MB015167885C1C8ABFA300AD5D9E5E0@CY4PR21MB0151.namprd21.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(61425038)(6040450)(2401047)(8121501046)(5005006)(3231020)(93006095)(93001095)(100000703101)(100105400095)(3002001)(10201501046)(6055026)(61426038)(61427038)(6041248)(20161123558100)(20161123555025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR21MB0151; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR21MB0151; 
X-Forefront-PRVS: 04772EA191
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6069001)(6009001)(346002)(376002)(39860400002)(47760400005)(199003)(189002)(16526018)(86362001)(107886003)(7736002)(53936002)(6916009)(305945005)(6666003)(50226002)(5003940100001)(36756003)(4326008)(22452003)(316002)(101416001)(50986999)(10090500001)(47776003)(16586007)(97736004)(68736007)(25786009)(6486002)(50466002)(48376002)(6506006)(10290500003)(2906002)(6512007)(5660300001)(8676002)(86612001)(81156014)(81166006)(1076002)(8936002)(6116002)(3846002)(72206003)(106356001)(66066001)(105586002)(478600001)(189998001)(22906009)(473944003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR21MB0151;
	H:localhost.localdomain; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR21MB0151;
	23:ec7CbGZ4mtiYgPOshptHs+/v8hA++/rFH/XO/W+ZE?=
	=?us-ascii?Q?uexMjSNns28YBkrYlb7/XwhQIT3GpQFWxWNfpreD/Wpb14S+87qJ7f6wCAsj?=
	=?us-ascii?Q?a+gxVWSeJdWZyICEHEFXFk3WL8Z8q7Oz6KIcdf+WSJW5HNEtHyusRRoQNGqN?=
	=?us-ascii?Q?riwKd/Pg8pgCo/Fo3M4i0xQw6Zi3d+8sUdglJjzEgQYz86yI5HqGus/ID2M3?=
	=?us-ascii?Q?f3jQj7SHAcxA5B61Gb1880KatauKJ7KCKV8hQKQPKVnxQgkkSDfZo1UPXQLT?=
	=?us-ascii?Q?bRykvbVLYMWA/P9DQBk2SKOxpsKyS7Y7EmJfOR0tD0uY10A2bhxjqOXEAkaT?=
	=?us-ascii?Q?3W7gfdQ7QCi8J9g99OrkBJL8FXKJgYEmmrl4gvHLkdCd53joZOnIC1c2HjP7?=
	=?us-ascii?Q?AEOjnvL+ibf7Y/zTxyTXkiO//33l4YJ4sulMxCC5JgP+bnVP2RnM2z6emBw/?=
	=?us-ascii?Q?uIqjwnDCZf9NQ6UiYIhuUIcwqJm6xfc5uyTzpCzZqKyW9SwZneWawgSJ1miW?=
	=?us-ascii?Q?L+XINnINyTOXZLu72vz9oij56lDiVnGmyWB7F7vstnbdv12SJD9xpxshvXyV?=
	=?us-ascii?Q?rB/5k2oJyYj6dZn3UdyqG+hGj/k6ua/g/ak4eMbTHcJlUGo1jum+HuOao052?=
	=?us-ascii?Q?2UKGpXLgPk8Fan3PN5NvjCwSaIUR/kgn7sZqYwWCPr+Qe+AEOEqFbmvQqe9t?=
	=?us-ascii?Q?gMDcOME5xJQdeu/xahhcXPPmzMvQSFb5HBr2bMChfebSLo7pX04pwquK7Oam?=
	=?us-ascii?Q?KVRJud16t/4T7+pondWrRDHup8rpfJKAr9X1vUehPAhhuKzjtKVl0U+MmkRg?=
	=?us-ascii?Q?R9XgPPaEAbiJEuEtq52G4fj08BacExn9MWHF9+mdrjAbJsOTA6ab8Ujjgjr6?=
	=?us-ascii?Q?T+ZpqKcm9+l8G09aMeYZNUUlAy8NIK23zAjvwa2SUD72NFAqWPfzoJcnUHHN?=
	=?us-ascii?Q?ATvrnIwqs1EXWL0LdeUeaUu0Foo6EGv+6oH15/0nL3RU24ndkjzJIYDoowwV?=
	=?us-ascii?Q?JL9EtPqYLTMslthyuLNINjDh56Qp96HlsBw26PKgwapstYrLHoMpRRBMPhox?=
	=?us-ascii?Q?YPSOA1f0yGVix6ohbAOofVVKApFyg1R/ezwWkA7HA5vgyKFsrAZWoh4nIrQd?=
	=?us-ascii?Q?wY38FU8x+gzsGKW25/1ZXFZ8CAP3qhzEtupBGUvfdxTyaUEPnObCzea9s5Ip?=
	=?us-ascii?Q?vvF1NM2HyP0yul9Qecg7R5CGqpzc/sOXFX+IiFRIBNegN98qVMRGHBO7ffmf?=
	=?us-ascii?Q?6vPECWv/ipohm2/vLnX1BUhLqpM24ExlU9NSPMC?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR21MB0151;
	6:sqtOZFFK4HnsZlvL7R0a+oaM8ANZqqf3bJvWBVZZFTpOIiZCXqIq/W6EDDFQEHsUvO6tb7n3sY08FiJHqfcRJTdot0IWq6vM8axgaesQqCTSJdx6hlC7G6UIPCzEqeTCmRXmkBlbviRAaCHBAeG9XDzIIFjR216qQ6LMlE2Jt0wxY3iyGVfO3I2If4QhbW9mgNFH7KHMMsckewubOBd2j/UmEJG0Hn3jcRt9wpz5OCWOmF751pYnCwIS7iSVQQ1dqW9bwskKiAHtNkwelFTVl6hABBVxmX51Z//fZMbm3iOmlU82UpJxyUKr6jOlAXTeukCc+4Eq3em9Ku7DJcVgELziAFOu6ykwJL/FKnZcqu4=;
	5:7EV+4Ku8ApXgwUq1u6Bk5c9oqW+MnOdf1XYm35NNo2bZ9DSZpa+9xdx+vVOkDqrnBnwjXfvdSNqjWsBiJHyR85bliBt4g8RaCnXrKtE3X01za1VZlDIaytO2j3Nu+N1tVi4ait527OUdEYsiWK1+g1oyeHrqSgq2CDGLnvNJEtk=;
	24:WqEVxKVX3SggB3AT2tl1kBmiaeYa9mfx9P7BBPoTdf42WHg3D8W4vcoN7L71+fj8PR5wRr35EzUF6Vw3PeiOVxH08e0fclu3H9J+QCIu/xo=;
	7:yNA9ypEnzVlSvf1ECGi7sWF2buGVyIPG0FykF++N2SZxYbr1uKaXAuCjiuMtV+eDddqiM2ivmsiRFm0j3ik273xYVyvXGieFh5hzp6YCE894Gyd5qVy407Swu7RNQDfehrRSyllJfeHS5Oz3r1jpf+BPQNiuAzK1J9OkgNMLpVpLVMBu1wUg87jP6tKdtnP6dMIDnTKeawtr7GkkoWMHGkvib64lVa63FJLjlNilqdEChGgcimO3M0baCzvZyBRL
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2017 22:38:59.8456 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef904c4c-28da-49ce-a21d-08d520b02e92
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR21MB0151
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.115
Subject: [Qemu-arm] [PATCH v4] arm: implement cache/shareability attribute
 bits for PAR registers
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
From: Andrew Baumann via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C1QczkBH0bWt

On a successful address translation instruction, PAR is supposed to
contain cacheability and shareability attributes determined by the
translation. We previously returned 0 for these bits (in line with the
general strategy of ignoring caches and memory attributes), but some
guest OSes may depend on them.

This patch collects the attribute bits in the page-table walk, and
updates PAR with the correct attributes for all LPAE translations.
Short descriptor formats still return 0 for these bits, as in the
prior implementation.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
v2:
 * return attrs via out parameter from get_phys_addr, rather than MemTxAttrs
 * move MAIR lookup/index inline, since it turned out to be simple
 * implement attributes for stage 2 translations
 * combine attributes from stages 1 and 2 when required

v3:
 * implement S2 allocation hints and check for cache-disabled
 * fix stage 2 shareability bits
 * fix combined allocation hints (always use stage 1 hints)
 * remove LOG_UNIMP message

v4:
 * fix hihint shift buglet in convert_stage2_attrs
 * remove TODO comment (what was there is complete)
 * mention relevant pseudocode procedures in comments

Thanks,
Andrew

 target/arm/helper.c | 178 +++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 164 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 96113fe989..f61fb3ef68 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -19,17 +19,23 @@
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
 #ifndef CONFIG_USER_ONLY
+/* Cacheability and shareability attributes for a memory access */
+typedef struct ARMCacheAttrs {
+    unsigned int attrs:8; /* as in the MAIR register encoding */
+    unsigned int shareability:2; /* as in the SH field of the VMSAv8-64 PTEs */
+} ARMCacheAttrs;
+
 static bool get_phys_addr(CPUARMState *env, target_ulong address,
                           MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
                           target_ulong *page_size, uint32_t *fsr,
-                          ARMMMUFaultInfo *fi);
+                          ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs);
 
 static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
                                target_ulong *page_size_ptr, uint32_t *fsr,
-                               ARMMMUFaultInfo *fi);
+                               ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs);
 
 /* Security attributes for an address, as returned by v8m_security_lookup. */
 typedef struct V8M_SAttributes {
@@ -2159,9 +2165,10 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
     uint64_t par64;
     MemTxAttrs attrs = {};
     ARMMMUFaultInfo fi = {};
+    ARMCacheAttrs cacheattrs = {};
 
-    ret = get_phys_addr(env, value, access_type, mmu_idx,
-                        &phys_addr, &attrs, &prot, &page_size, &fsr, &fi);
+    ret = get_phys_addr(env, value, access_type, mmu_idx, &phys_addr, &attrs,
+                        &prot, &page_size, &fsr, &fi, &cacheattrs);
     if (extended_addresses_enabled(env)) {
         /* fsr is a DFSR/IFSR value for the long descriptor
          * translation table format, but with WnR always clear.
@@ -2173,7 +2180,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
             if (!attrs.secure) {
                 par64 |= (1 << 9); /* NS */
             }
-            /* We don't set the ATTR or SH fields in the PAR. */
+            par64 |= (uint64_t)cacheattrs.attrs << 56; /* ATTR */
+            par64 |= cacheattrs.shareability << 7; /* SH */
         } else {
             par64 |= 1; /* F */
             par64 |= (fsr & 0x3f) << 1; /* FS */
@@ -6925,7 +6933,7 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
         return false;
     }
     if (get_phys_addr(env, addr, MMU_INST_FETCH, mmu_idx,
-                      &physaddr, &attrs, &prot, &page_size, &fsr, &fi)) {
+                      &physaddr, &attrs, &prot, &page_size, &fsr, &fi, NULL)) {
         /* the MPU lookup failed */
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_IACCVIOL_MASK;
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM, env->v7m.secure);
@@ -8207,7 +8215,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         int ret;
 
         ret = get_phys_addr_lpae(env, addr, 0, ARMMMUIdx_S2NS, &s2pa,
-                                 &txattrs, &s2prot, &s2size, fsr, fi);
+                                 &txattrs, &s2prot, &s2size, fsr, fi, NULL);
         if (ret) {
             fi->s2addr = addr;
             fi->stage2 = true;
@@ -8608,11 +8616,41 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
     return true;
 }
 
+/* Translate from the 4-bit stage 2 representation of
+ * memory attributes (without cache-allocation hints) to
+ * the 8-bit representation of the stage 1 MAIR registers
+ * (which includes allocation hints).
+ *
+ * ref: shared/translation/attrs/S2AttrDecode()
+ *      .../S2ConvertAttrsHints()
+ */
+static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
+{
+    uint8_t hiattr = extract32(s2attrs, 2, 2);
+    uint8_t loattr = extract32(s2attrs, 0, 2);
+    uint8_t hihint = 0, lohint = 0;
+
+    if (hiattr != 0) { /* normal memory */
+        if ((env->cp15.hcr_el2 & HCR_CD) != 0) { /* cache disabled */
+            hiattr = loattr = 1; /* non-cacheable */
+        } else {
+            if (hiattr != 1) { /* Write-through or write-back */
+                hihint = 3; /* RW allocate */
+            }
+            if (loattr != 1) { /* Write-through or write-back */
+                lohint = 3; /* RW allocate */
+            }
+        }
+    }
+
+    return (hiattr << 6) | (hihint << 4) | (loattr << 2) | lohint;
+}
+
 static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
                                target_ulong *page_size_ptr, uint32_t *fsr,
-                               ARMMMUFaultInfo *fi)
+                               ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
     CPUState *cs = CPU(cpu);
@@ -8929,6 +8967,21 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
          */
         txattrs->secure = false;
     }
+
+    if (cacheattrs != NULL) {
+        if (mmu_idx == ARMMMUIdx_S2NS) {
+            cacheattrs->attrs = convert_stage2_attrs(env,
+                                                     extract32(attrs, 0, 4));
+        } else {
+            /* Index into MAIR registers for cache attributes */
+            uint8_t attrindx = extract32(attrs, 0, 3);
+            uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
+            assert(attrindx <= 7);
+            cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
+        }
+        cacheattrs->shareability = extract32(attrs, 6, 2);
+    }
+
     *phys_ptr = descaddr;
     *page_size_ptr = page_size;
     return false;
@@ -9490,6 +9543,93 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
     return false;
 }
 
+/* Combine either inner or outer cacheability attributes for normal
+ * memory, according to table D4-42 and pseudocode procedure
+ * CombineS1S2AttrHints() of ARM DDI 0487B.b (the ARMv8 ARM).
+ *
+ * NB: only stage 1 includes allocation hints (RW bits), leading to
+ * some asymmetry.
+ */
+static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
+{
+    if (s1 == 4 || s2 == 4) {
+        /* non-cacheable has precedence */
+        return 4;
+    } else if (extract32(s1, 2, 2) == 0 || extract32(s1, 2, 2) == 2) {
+        /* stage 1 write-through takes precedence */
+        return s1;
+    } else if (extract32(s2, 2, 2) == 2) {
+        /* stage 2 write-through takes precedence, but the allocation hint
+         * is still taken from stage 1
+         */
+        return (2 << 2) | extract32(s1, 0, 2);
+    } else { /* write-back */
+        return s1;
+    }
+}
+
+/* Combine S1 and S2 cacheability/shareability attributes, per D4.5.4
+ * and CombineS1S2Desc()
+ *
+ * @s1:      Attributes from stage 1 walk
+ * @s2:      Attributes from stage 2 walk
+ */
+static ARMCacheAttrs combine_cacheattrs(ARMCacheAttrs s1, ARMCacheAttrs s2)
+{
+    uint8_t s1lo = extract32(s1.attrs, 0, 4), s2lo = extract32(s2.attrs, 0, 4);
+    uint8_t s1hi = extract32(s1.attrs, 4, 4), s2hi = extract32(s2.attrs, 4, 4);
+    ARMCacheAttrs ret;
+
+    /* Combine shareability attributes (table D4-43) */
+    if (s1.shareability == 2 || s2.shareability == 2) {
+        /* if either are outer-shareable, the result is outer-shareable */
+        ret.shareability = 2;
+    } else if (s1.shareability == 3 || s2.shareability == 3) {
+        /* if either are inner-shareable, the result is inner-shareable */
+        ret.shareability = 3;
+    } else {
+        /* both non-shareable */
+        ret.shareability = 0;
+    }
+
+    /* Combine memory type and cacheability attributes */
+    if (s1hi == 0 || s2hi == 0) {
+        /* Device has precedence over normal */
+        if (s1lo == 0 || s2lo == 0) {
+            /* nGnRnE has precedence over anything */
+            ret.attrs = 0;
+        } else if (s1lo == 4 || s2lo == 4) {
+            /* non-Reordering has precedence over Reordering */
+            ret.attrs = 4;  /* nGnRE */
+        } else if (s1lo == 8 || s2lo == 8) {
+            /* non-Gathering has precedence over Gathering */
+            ret.attrs = 8;  /* nGRE */
+        } else {
+            ret.attrs = 0xc; /* GRE */
+        }
+
+        /* Any location for which the resultant memory type is any
+         * type of Device memory is always treated as Outer Shareable.
+         */
+        ret.shareability = 2;
+    } else { /* Normal memory */
+        /* Outer/inner cacheability combine independently */
+        ret.attrs = combine_cacheattr_nibble(s1hi, s2hi) << 4
+                  | combine_cacheattr_nibble(s1lo, s2lo);
+
+        if (ret.attrs == 0x44) {
+            /* Any location for which the resultant memory type is Normal
+             * Inner Non-cacheable, Outer Non-cacheable is always treated
+             * as Outer Shareable.
+             */
+            ret.shareability = 2;
+        }
+    }
+
+    return ret;
+}
+
+
 /* get_phys_addr - get the physical address for this virtual address
  *
  * Find the physical address corresponding to the given virtual address,
@@ -9514,12 +9654,14 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
  * @prot: set to the permissions for the page containing phys_ptr
  * @page_size: set to the size of the page containing phys_ptr
  * @fsr: set to the DFSR/IFSR value on failure
+ * @fi: set to fault info if the translation fails
+ * @cacheattrs: (if non-NULL) set to the cacheability/shareability attributes
  */
 static bool get_phys_addr(CPUARMState *env, target_ulong address,
                           MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
                           target_ulong *page_size, uint32_t *fsr,
-                          ARMMMUFaultInfo *fi)
+                          ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
 {
     if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
         /* Call ourselves recursively to do the stage 1 and then stage 2
@@ -9529,10 +9671,11 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
             hwaddr ipa;
             int s2_prot;
             int ret;
+            ARMCacheAttrs cacheattrs2 = {};
 
             ret = get_phys_addr(env, address, access_type,
                                 stage_1_mmu_idx(mmu_idx), &ipa, attrs,
-                                prot, page_size, fsr, fi);
+                                prot, page_size, fsr, fi, cacheattrs);
 
             /* If S1 fails or S2 is disabled, return early.  */
             if (ret || regime_translation_disabled(env, ARMMMUIdx_S2NS)) {
@@ -9543,10 +9686,17 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
             /* S1 is done. Now do S2 translation.  */
             ret = get_phys_addr_lpae(env, ipa, access_type, ARMMMUIdx_S2NS,
                                      phys_ptr, attrs, &s2_prot,
-                                     page_size, fsr, fi);
+                                     page_size, fsr, fi,
+                                     cacheattrs != NULL ? &cacheattrs2 : NULL);
             fi->s2addr = ipa;
             /* Combine the S1 and S2 perms.  */
             *prot &= s2_prot;
+
+            /* Combine the S1 and S2 cache attributes, if needed */
+            if (!ret && cacheattrs != NULL) {
+                *cacheattrs = combine_cacheattrs(*cacheattrs, cacheattrs2);
+            }
+
             return ret;
         } else {
             /*
@@ -9617,7 +9767,7 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
 
     if (regime_using_lpae_format(env, mmu_idx)) {
         return get_phys_addr_lpae(env, address, access_type, mmu_idx, phys_ptr,
-                                  attrs, prot, page_size, fsr, fi);
+                                  attrs, prot, page_size, fsr, fi, cacheattrs);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx, phys_ptr,
                                 attrs, prot, page_size, fsr, fi);
@@ -9645,7 +9795,7 @@ bool arm_tlb_fill(CPUState *cs, vaddr address,
 
     ret = get_phys_addr(env, address, access_type,
                         core_to_arm_mmu_idx(env, mmu_idx), &phys_addr,
-                        &attrs, &prot, &page_size, fsr, fi);
+                        &attrs, &prot, &page_size, fsr, fi, NULL);
     if (!ret) {
         /* Map a single [sub]page.  */
         phys_addr &= TARGET_PAGE_MASK;
@@ -9674,7 +9824,7 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     *attrs = (MemTxAttrs) {};
 
     ret = get_phys_addr(env, addr, 0, mmu_idx, &phys_addr,
-                        attrs, &prot, &page_size, &fsr, &fi);
+                        attrs, &prot, &page_size, &fsr, &fi, NULL);
 
     if (ret) {
         return -1;
-- 
2.14.2

