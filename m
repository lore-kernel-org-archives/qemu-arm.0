Received: by 10.25.221.202 with SMTP id w71csp1227297lfi;
        Fri, 11 Aug 2017 11:23:23 -0700 (PDT)
X-Received: by 10.55.160.14 with SMTP id j14mr20680694qke.196.1502475803036;
        Fri, 11 Aug 2017 11:23:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502475803; cv=none;
        d=google.com; s=arc-20160816;
        b=KJbYVIayQy1bJl4sWYYJiPz4LvIxna7zfrhaF3G57DSCFMI+/ABqb3+ATTiBDcisWZ
         nsefww2xYNjf/cJ/84um+LP7eat72Ec5aeT02Z+vCNuvYTVqkbknHNSx+VI9DnyVfJNh
         TjB78lH4Q7t02x3CQWb/FCK3EF3/sWcB0xJz6B+TxogxlGjs+u+H4bGdX5E0y7GH2UYO
         iJpKXQlWuEHXuTEJWoBcMwgMg6rw43VMX6iHXu+/eSKuzmzA3AObSJH1InG0fOoF0Oh3
         DiKPUH4t2hOOPYEBDfAjPmZekpGVqyE+j0p7Dv/gD5wHif9dzHCq4+mf7yMoSEpGPOdh
         3SIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=tldvQFohEuKv7OjhYtXyi560FseoCDzU6p6cAJ2felE=;
        b=wQbOGgkkZcBnd1haepa/wy2QxGM+xaQ0ZIALoJmEEZqvdDrNK2sTP82QaVkHv5MLiH
         Z+EzH85BpD7LF0CcVCLlfln/Vw3QY9k7IkaxfeEYEO8txQflh90wG/Ah+6ugqQ8Gty38
         zLOPPACOdNuHnoRtqgMuOqnOS1608Osb6yyr2285RYRtIyFXGMaTFE/o4e56SJFTNaCd
         z8BJ0Fx76yasHCaN2QAqau3ZYzg0ucqqXgKHHTFKuFdSUzSB9U1fnAMurc+bGLqrJTEo
         Ed9qhW9CkWR4iK/iDv61ugnm/LppA270T4fzeEwrxcX6hhmWAVo1/UHLCH413YwGoseJ
         pvcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=vLIn9DXO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j3si1223127qte.467.2017.08.11.11.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 11:23:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=vLIn9DXO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35329 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgEae-0000No-7n
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 14:23:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dgEaK-0000As-Ie
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 14:23:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dgEaH-0007RP-Ew
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 14:23:00 -0400
Received: from mail-by2nam01on0040.outbound.protection.outlook.com
	([104.47.34.40]:44416
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dgEaG-0007Qo-TP; Fri, 11 Aug 2017 14:22:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=tldvQFohEuKv7OjhYtXyi560FseoCDzU6p6cAJ2felE=;
	b=vLIn9DXOYo3mBWLxBHhm945coyuiv+looIeTY5VyeUq4ySTktS4dt4ayngWWEQWiVEjS5xjOHHtDMgkBDC9JVCzzgpqBHH6KsOw0dEbiyZ+Nd4D9sZ+ZcQnKG+c0r+O0A+JqwMUAtWE6ttjUFLWq3KkvnORIlS7pSN+FCWStQrM=
Received: from CY4PR02CA0031.namprd02.prod.outlook.com (10.175.57.145) by
	DM5PR02MB2251.namprd02.prod.outlook.com (10.168.174.11) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1320.16; Fri, 11 Aug 2017 18:22:53 +0000
Received: from CY1NAM02FT020.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::203) by CY4PR02CA0031.outlook.office365.com
	(2603:10b6:903:117::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1341.17 via
	Frontend Transport; Fri, 11 Aug 2017 18:22:53 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT020.mail.protection.outlook.com (10.152.75.191) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1304.16
	via Frontend Transport; Fri, 11 Aug 2017 18:22:53 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgEaC-0003WM-Aq; Fri, 11 Aug 2017 11:22:52 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgEaC-0006VW-6C; Fri, 11 Aug 2017 11:22:52 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v7BIMjIL013571; Fri, 11 Aug 2017 11:22:45 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dgEa5-0006SY-9O; Fri, 11 Aug 2017 11:22:45 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2017 11:19:22 -0700
Message-ID: <a970dcb0e2778db6af5ecb62bef234d50c20be66.1502474835.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1502474835.git.alistair.francis@xilinx.com>
References: <cover.1502474835.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23250.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(199003)(189002)(8936002)(50226002)(2950100002)(6666003)(189998001)(36756003)(81156014)(81166006)(8676002)(48376002)(106466001)(2906002)(50466002)(118296001)(5660300001)(33646002)(54906002)(63266004)(478600001)(4326008)(39060400002)(626005)(9786002)(77096006)(356003)(47776003)(76176999)(50986999)(5003940100001)(305945005)(36386004)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB2251; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT020;
	1:j5RfC7+JRgty/aYp5EH4Nzp+vV1OYccZihyvuJL6Axrhk59zpFKiQm4WisXAB02QMJeWsyTCNFO6l3DXRbbgNJUEG9PGgAnGtYBQsuVUjMIVBXmpxwEWTqnD7tc/ApAepn1leQs+8qQt+vDyr3O/WqOTfPEjB/ljlOSwrsFGax6rSkkXc8/+0t4RWdcwICIHb0QJ9s86tMm17hp1ml/m907QKzGaj+PLzbndh/+HqcMCzdoAmpwSmPo/XyLNuwQai8Jt2OMxp1jiswr4NS81ZL2YWYl9vMOEjitdoNrMmPyXgl1Wg8FcoVM6ws0xEFJEQFiB6a8LmrVuglE4Fwcq65QVivokM83+BtH1087xqQMdmXfqY4WKYR/Vp2aawTzUU+ee4zx+903J3Y+eMFvwFP0VFZ5tAekE6oxzmyDQH5ehhdm7HFisUR9ikT5IZmtu4wC6fhqv3iZCh2+3oz37PAPN+pzfhRyzNtv76ITXGtuiYwcdR0qFaYQasBsdqekba+CmAQzPYMCHfT+M8edJA25HPzAHBfbIrrFh30DWspvVRtPXJBsnRnaOD2upOZbFTzsCWVscyeSgwZ8FrHapTTBIhFpwGfIibxlAWbSkP4tONtaFccrsVlNYD9rl+rQ/jGPu3IRtZdnMiV0cTGcjnyOw4uCmd8aNbu5iaQZM+FLguFau72h9NAA9Y9FKqQ0kG7L28PUJoWXbaoLue4yc+kctKSBDZOiD0q+i/iu6Sh7rKRR5AxNGdWnm1zqdh8v3NswY2YrLnOpyvtItwzQYseAN0NNF7lVU5RKVv5ivHaHVesjB4mMtdy1ob/KyqTJnOAx2A5YJSXoyhi2g3xsBXA==
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89590639-8a29-4ed1-6266-08d4e0e5fb84
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DM5PR02MB2251; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2251;
	3:fcRVcGLHyTu91mW4qY+Tpx7Sek7UwIGDhVd49Qj8bFFlO4CW72SZWKbTSFIzrAXNk78a2VmEGQnBNRibUFCwhHE942kqeui9gHE7qGKJXc/WReYNKcSxRcZR4mUU3kfqnEasbnlynu/4WguoS/OG9PD6KX4B+ZLQVYw3++tzLlUnINGDBZ2uK7CKrLDZweRnGO5g0Rg6dQsag6ugbmxkgLpJ976kUKabhHSt2XUZI3CEwW3o+dCI78fptaOivA5vcw9NvpHuZd7KkdcWYiaz5o7ALtIvxI7YR6Vp6YnnvDjkDXxWfVKGpqQWmYYUFpiStZdKck4f7n08WjBNGCVBbAO5CqroDbHrziotYkxk2LY=;
	25:hQ1X0vPyFz+y7g1QptSB+RwHoA9NW7/FoG4kgGdxbgsIOOK/3q6vfzZBtxN8D9q2CctNoYrEz4vyCtjO/1ebdKjfpjnL2ZURdN+qfjhsNq04JL8v7imtWheM7VbInaqiMY0RmLZoAR1s1hkpI//Zl34/wlxWzULCJozf7JFCDfLpi0OIo4lTDuuRavf03xpVuF2Bf8fZeP8/5Oo1J0Do1RnzcWnZ0bZN1M361s5Lzim8wp9xUamrqAgrGcwXhWlodqwe+eenK6UylNeFK82sR0mD0lu708CUpaMd8WVemDu6BVbU5MeK296AEZMLJ6JelwfIaqpjNhyObHuw5+79Uw==
X-MS-TrafficTypeDiagnostic: DM5PR02MB2251:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2251;
	31:xSZ7SLxuFQfcjOXXJKawFnn7u6qxn/HzNF5py0xmfSEHb2AV+ltpQOiK2GcPlsA37mfwzrTHvmhURkmbld7uq5d5QMsnyRDDyuM2AFAWbxXm5Z97pMQVjdNN4uHu+R80pMzYN2K9n04C7Lz0FavJWCDPFCwax5TWfRh/Mwys50en4Awd1Qm/b5xvyJpJHoFZN3lXgVVmKMp7XMIO+INfW/fQHXTAczpgVN+SqxmFClc=;
	20:skT8GuaIvGjKdcBlYZdOGFR8/695K4TmvpZv98fFz9mR5IB569v1pgN/QKKsqeWWozY3bDhQbcOK9OMmvAKItL0xfUnGtZFnObuEQ4oFERw/hm1xcfBV7pwkrLUnHEfdofA17wZlRCltvzbMsGZfWTa3Gw4Rg3zfn6K+DP6zOohmwra7HAqhkAF2mb6aa+fsspCW2hsjiYkPg8tbSPG1X0fZySB+CH8crBO2LybYbxsF2Ey+3eEecHW4Adl/PUWzWnPpIfAUaLdiSPb22tO2klIhi8XLtLXujMHGzF9raj8eIkMj3lIDDPPjp2FUs6QrVziHPtl2quYkl9fpLGr0BqJWvbpghICAABN4Zn0219EBHDdXGhP7cVGY7bcL36aTWLzjoRVOUTlmf3LMAu/PIzBiDZelzZLDWuWS0ENTxErM7K3zT9O/YpCheULaGHm422xEwlQTRE7QbRhy0EIUs38VIzpl6IEmAk0+sDZGkQeOfyD3KML8ypTH+++Uuqfd
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <DM5PR02MB225135C5E0B73BA8CD4C78C6DC890@DM5PR02MB2251.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(13016025)(13018025)(8121501046)(10201501046)(3002001)(100000703101)(100105400095)(93006095)(93004095)(6055026)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123555025)(20161123560025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR02MB2251; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR02MB2251; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2251;
	4:LqlqqEBdAxKeUF/StIAaY6O54HxLx6xNTAXd29Vk/t4jCeIMYTw7xJcWTs+nGgFpfL1r7tzOU7VkEjfSbIcv8Jlk96nuplWJdH/IM3qv2fGkL974tnw7LZ/KquAz8ED3QQTUiAakKq3b5Nz5xdYeHoUUtJLrPziM6A4laVXk/ZOMBbTw23+oKyGbBfQ+dVE0a+e1KDLLYxH0selMTgo1DwN5d7fXZcojy1yS4NW9ydqoVyFUCeZIf/joeDN5+bV9WE+AQc80vwTq2AmishjYakH54bgr6n7dxUGv+IT5tCs=
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2251;
	23:N8Uu7BnaOfeOCxhxSrQIB1TN2R94tcQ9wMwbyvW8YAjE/6Hr+REi3Y72v1lO8eaC0Zo85dEdakMTPRrOEfTWUlovqtBd9rlmb+ezoaAXjzneswm828jBzBUkO/kdsBJq/I2+MODa4SdvM/IgJb4saoPvEi/yd9U3efPNSk/9jW5Zn4Pv9SfCxzdax6YzH4KHYVlElMGvy6f/XoD2jgryNYwBNgq6bp2/wUxoscbcsJM62QCfF2z31fupWSBg6RiTj8eAZYUKENyler3YKAJqlW1IrIF+r6ugnnwZHG+3hjkFmcAUbsvSmK6LMU+sHW5GnpZL7XoegSKhJuLJfKLjmuZiZ0lsY4pMxEkKg6jqNGe2Q1X+yGLE0v2zp8j7BKFRbMP8qavcJ2I86GCBBkIBW3eDbb1Le3h7oRtiHIGYX7qnPw+A3QSjko8Xde66+/KJ62wT68JeVSjbciUfKoEGvX0PfvaKNS3sK7newFviBpsChOMn/NEzjKkUrxJjDjYLqqYviPOTup/jqwaSck7J7PDun9p+7KUMGPUnemMFqajbGX8E675AHABEp2Q8pfQlw6NBfX8mew4UHZ+571jw6C+tgBPqlVKsrRJqaBOdiwWlag2rwcKPfVuicRhRC0KM/U/fqfRLG+IjLQGP9b04NKv7cEqchm14nx9uob252HaCUIvqKC/tydQPfz+P+/wlyUmc2qeqACAmCkPy7zTSceTu8GOi7c26le9iNWgf8tFsFBtJFVaQwJFCneTnI9AYcsJw5rPeEYvq66Ak4PVlUv9ItsDalUiAXaGp9umtzOCpj7JFS2SqZHRDK8lU9ERzitkD+dPfyOcRNSvGlyqiY47AMttQZYR8T1uMx2XunyzABIrzWEwBekx8b47dDcwQIgghupn35X4iKNhKLLp9DR17ET+T/XB5euasbqdmTPgT2adDuiWQ0ekpmEJ9MqT0
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB2251;
	6:dryNN/TE7/5xh/ovB/qqG+C8BZHVOxulYFOshnA1Fx1cM4MGz6bA1Skxd6mJ7W1pVc//Nm7bfSsjlwTFbgoRgs4iu93/oNEg9c4Z3nic585pi3EJzVl4QIaMCkMY1nr5342sn4R4mX+7SUnzjvf+VIbx1mKkw6nnA/sgL9UYuCgofFbdGZrIrBOEE3BYTPze8BuBVNOQlFq6H1cvbtfQC2AhYud+CNi2xQJFpxx6H2YsJptjtbTys19Cn5T1+CH+q81fu1jPwtcR7YWmS5evv/4j2x3Y6YI3d9ciRtJ+qvE/HeIiXQ6E+skRw2jQb0srOe/YRkNal4fwJnewCCb2cg==;
	5:ND1l2BXIrWBIFveg5q3N/ifgkt0Mxc0P8qlcP9OTJ5G02wZ7+ma76wYnA/qNqgo2FSO9SnsfAlUB4y6mWTgaTF1IcyKT6CbZxPvrWj6n70PTaOCX37IrfgF70AuxoPpxa2K0zZeDCl7LqB9dxfAcKg==;
	24:5AkBpdWnpsPCqyfUEnPSB43t0AJ1GWpv2dJq7v8Rc7AUsTklH57HQh8jZL3vzLW4GhR7A14b3RM5/2VYhBFYiv5/61Oek8VglW+C2QyKl8g=;
	7:tSCYdctVFsSpTWY3npApAjglFA1jx620XhsthMzxa9PCzafgrNXlc921VFrJ+X0E9w3t8SGWg6KK+udRA+r7GPKdtjMRWxRddt+VwI/CLxcDAIHhfxhOd8r7j7oX554K2lY1W1sMQGXY3OyyNqj77haZ223QEKQkbHijIvBM2BYgzBkbgFHWeszEY2qSLUtXzhB0eC7GTPm5o3k23EtU1ENRMs21cIrnVAbhiLVSKrg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2017 18:22:53.4847 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2251
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.40
Subject: [Qemu-arm] [RFC v1 2/3] tcg/tcg-op: Expose the tcg_gen_ext_i*
 functions
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
Cc: edgar.iglesias@xilinx.com, alistair23@gmail.com, qemu-arm@nongnu.org,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8wuKiCxsrPs4

Expose the tcg_gen_ext_i32() and tcg_gen_ext_i64() functions as we are
going to use them later.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 tcg/tcg-op.c | 4 ++--
 tcg/tcg-op.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 87f673ef49..d25e3003ef 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2709,7 +2709,7 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, TCGMemOp memop)
     gen_ldst_i64(INDEX_op_qemu_st_i64, val, addr, memop, idx);
 }
 
-static void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, TCGMemOp opc)
+void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, TCGMemOp opc)
 {
     switch (opc & MO_SSIZE) {
     case MO_SB:
@@ -2730,7 +2730,7 @@ static void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, TCGMemOp opc)
     }
 }
 
-static void tcg_gen_ext_i64(TCGv_i64 ret, TCGv_i64 val, TCGMemOp opc)
+void tcg_gen_ext_i64(TCGv_i64 ret, TCGv_i64 val, TCGMemOp opc)
 {
     switch (opc & MO_SSIZE) {
     case MO_SB:
diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
index 5d3278f243..8c45b79a92 100644
--- a/tcg/tcg-op.h
+++ b/tcg/tcg-op.h
@@ -835,6 +835,8 @@ void tcg_gen_qemu_ld_i32(TCGv_i32, TCGv, TCGArg, TCGMemOp);
 void tcg_gen_qemu_st_i32(TCGv_i32, TCGv, TCGArg, TCGMemOp);
 void tcg_gen_qemu_ld_i64(TCGv_i64, TCGv, TCGArg, TCGMemOp);
 void tcg_gen_qemu_st_i64(TCGv_i64, TCGv, TCGArg, TCGMemOp);
+void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, TCGMemOp opc);
+void tcg_gen_ext_i64(TCGv_i64 ret, TCGv_i64 val, TCGMemOp opc);
 
 static inline void tcg_gen_qemu_ld8u(TCGv ret, TCGv addr, int mem_index)
 {
-- 
2.11.0

