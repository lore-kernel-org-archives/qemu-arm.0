Received: by 10.223.172.38 with SMTP id v35csp1888478wrc;
        Tue, 5 Sep 2017 14:15:58 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBV8y5P2tleGh6b4vj/CMRIi5vPQ7czKso3Pq6TmvGHYQahYz0FjV7XNVXam7MzrNYQrhgL
X-Received: by 10.200.36.215 with SMTP id t23mr624004qtt.185.1504646158439;
        Tue, 05 Sep 2017 14:15:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504646158; cv=none;
        d=google.com; s=arc-20160816;
        b=v8TNsFritd0D2pBOlV4c6qBFn11mJ4ITQ88JMKuBZLKdE59Xg+wbrIxWyd1ZYUmb30
         QQMxQqCpNndViYCq6Sm1TlgHLSvqu8CL0jH35x4Vz7JxndCF7mfV1/sZTw/1kY3D6ylW
         bEm8vAy8huQwJaMjZZJrPAopGO417gMsXRm4oGURo1SzATqcv6n8Uw8bMcSo/4nSAw/x
         bvbczTzvgwRbWvYykCD2BEBUDjt4FTWCDWgUkQpx5Jd7qlGD5EIiDLBccWzXfRwJnCWA
         JFUnPMi4THED2gXIXo95Q73h3ryZzc3Vckdcfou/fms/V9Ng0uzDc+irqGksSmuiXQ5Q
         BY4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=TAFULBpOl2/m4D600Y8AszSu1/BeuuFvJtvrfXuhPZ8=;
        b=AflMEyfxt0Oe5bBgSsG7c8+3A+Z40hw80kdiU7NEyMgwbKGyiklx7MX1lJld50CjGe
         Ojprl+Ab2Gd+Q/mgQQafJb2QObNVPmMdkdFVRJpkQBbFqv34bam2lVP+otxud/XsPVqM
         fN/4afLwo3JZw3hUQdEV8w1bi70Z6zwEi6vxpxgeAhscbwUEYyNBm/aE09g5H0/IIuR9
         a9S5U3O8iBkG+fOCCQJRKKdZaUxwPZHhIqKEIZmBpxYDyIaslrhwntqF5rFtfHMmJmb0
         YgP69Su6VEppCAOGc6nOWBQf7oZInjArOjXpEai+vnPdCpemBcNv8tb1BeoOO1VCnxbx
         hrgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=lMBSnWsF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y196si1504949qky.425.2017.09.05.14.15.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 14:15:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=lMBSnWsF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33233 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpLCO-0007ic-72
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 17:15:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <portias@xilinx.com>) id 1dpLBI-0006yv-GY
	for qemu-devel@nongnu.org; Tue, 05 Sep 2017 17:14:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <portias@xilinx.com>) id 1dpLBD-0003XM-JX
	for qemu-devel@nongnu.org; Tue, 05 Sep 2017 17:14:48 -0400
Received: from mail-co1nam03on0088.outbound.protection.outlook.com
	([104.47.40.88]:34875
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <portias@xilinx.com>)
	id 1dpLBD-0003Wi-6x; Tue, 05 Sep 2017 17:14:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=TAFULBpOl2/m4D600Y8AszSu1/BeuuFvJtvrfXuhPZ8=;
	b=lMBSnWsFBTfys7M3Hd5Z/kEQb7mIhAcIE5IS4qQ5pX5VvrVm4WMd1eVGz1MIfitiYgS4uBzBbCY/zz3Nc2w+jBp6IXG0Qz0OSan48OSkEhHq3U76nR+7XfwuxJHN1YQzomZpaDrP/yLQNXCHWAJjPQPMMWuOObgSfjR//Lstkx4=
Received: from BN6PR02CA0081.namprd02.prod.outlook.com (10.161.158.22) by
	SN1PR0201MB1935.namprd02.prod.outlook.com (10.163.87.157) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.13.10; Tue, 5 Sep 2017 21:14:39 +0000
Received: from BL2NAM02FT049.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by BN6PR02CA0081.outlook.office365.com
	(2603:10b6:405:60::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.13.10 via
	Frontend Transport; Tue, 5 Sep 2017 21:14:38 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT049.mail.protection.outlook.com (10.152.77.118) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1385.11
	via Frontend Transport; Tue, 5 Sep 2017 21:14:37 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <portia.stephens@xilinx.com>)
	id 1dpLB3-0007xY-0a; Tue, 05 Sep 2017 14:14:33 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <portia.stephens@xilinx.com>)
	id 1dpLB2-00040v-Tn; Tue, 05 Sep 2017 14:14:32 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v85LELJB005171; Tue, 5 Sep 2017 14:14:22 -0700
Received: from [172.19.2.217] (helo=xsjportias50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <portia.stephens@xilinx.com>)
	id 1dpLAr-0003zr-Rw; Tue, 05 Sep 2017 14:14:21 -0700
From: Portia Stephens <portia.stephens@xilinx.com>
To: <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>
Date: Tue, 5 Sep 2017 14:12:32 -0700
Message-ID: <20170905211232.11092-1-portia.stephens@xilinx.com>
X-Mailer: git-send-email 2.14.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23304.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(189002)(199003)(106466001)(1076002)(47776003)(478600001)(305945005)(9786002)(50466002)(5003940100001)(626005)(33646002)(8676002)(63266004)(2906002)(8936002)(81156014)(356003)(54906002)(81166006)(48376002)(36756003)(5660300001)(39060400002)(50226002)(6666003)(4326008)(189998001)(77096006)(36386004)(50986999)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR0201MB1935;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT049;
	1:RuT2neo5rZBoZAn6GRTep6cKNpR7oMqI0cOGgKUX8Ynb41yudVtxkiAU1dvRCbSSDZgvEdfLlr5c+MJbkPN3NkZTrTZRsSwK/fsucnOte+e0NDd3TePT3XGiQejz+gdr
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1fc07ab-098e-4a6d-9da7-08d4f4a31e11
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:SN1PR0201MB1935; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0201MB1935;
	3:otwNE7j+arwpXnesmgVL2Qr9kWg+b2g+jChnn8N65zmRjd1iuU/Sw3d7P8LOwomwTEPzDP4EKTDk3G10JnwUvM8+56vgmt3Rbi8xpQ+ia1mRLBdnGp1M20zQPVn77hosInYRPWrAyBe6n7It4oT+lJlz+nA3csYKibf1EU/YP/L81f+sflQvxkE5Pb3ooZ9MrXzASXQCFtyWKz3u/cfpyOPMWDxCX+h/Zjf7b/4cKyyT+N4m4T1ELBDWBpsCSkPnIzu7vPrBZFobsISy5N9+/lEx2puSt1DBYkdWbIlpenyqx2mrTzmw6xD381BoMtGQFzMdqDvz560NgJQDlSE7xj4LlY1IyNPBh/FsKcG1Blg=;
	25:u71QzliKQqkHd7Id4udsoOyEM1AufUtLg6CoWUJVzcoVP3k03fgVdSTGL7Hxc2LONNIjQlfloXfMAB045bgkGyp1a9qXl18wBX1n04Zl4F7M7IsZoeBa3LI3rlxUsZMRMFsxs5jOkTcJn9p6JlY6Ip/dgkE00IvDBS6T0elB86Bk7hCGIqDR/4Nb88qFUCOI5/ojVKJ5TGtyFJvngjYtiLRGQk91oAPvm2OLjnoWppS+K2b0LEOo813bAOapsxp3sCRI7zSnyrYT1bSy9L5hHC75jxJu91Ucbban0r041a5aBrU6PVC13zQqwjqg97JIAjzVBpGD+dkvFtt6cqda3w==
X-MS-TrafficTypeDiagnostic: SN1PR0201MB1935:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0201MB1935;
	31:yJb0Hl8fwL5m8sP6WBXk3Z0e3Hk8lHxRJNl1Iw2ror/HsBXfqqV7ew5HlnbS4lJ5aw6Cib/LHSYgJOmIVRSYyy6Ln7wXDpmhFsuM5mA2GyXc7wYzuv9vtaIyj2DH9pooCqy+P6F9VnSLIGunb7XGmIvvY0DbFe5I25e6mqZuHA2oTYHNWkQ48aAgHc7iLZ/42+YVNflMDkkMOr2pF6U9aJmEs1J6Bnr1ExAJUE4lhVA=;
	20:aoSQL75EGRRcTXNL3cYeRlzAkZmLTEVEmwgtaHmFbwZIIOgCpQB5/O8jH3T/KjITqjazUfRCcgDc7fOg/uLMd1/cu2ec9IMPhyIWH2kyGBII1UfFAvp7MdYdUrloMVRrfE2MhINDKCkyilzJJZHIowC+9bGBUe6CgtecT2FPDK8pkzAhFzvtw3zg3M/ulMZ8oLry61yAn5DomdBiLraAPFMq+96Yxf1zqIe9GKQeTs8MgwoUZVGkt899htinifQe2n/Mtuh4KVg+2qV+oDiJxPp2TBvlcWBzW4BwujV6n4Wlx6jnB4Osjwy9riZXdVVIcYcRrvpTux8y91h4Q8bjguiz/ce4fKhIHGHNJt+watmzOmNCci3iuJ6ahmSKKKl+IFrSOJcqqVZ7FfJ3GjhCzkbQwdYEa8zGxxgk/5xAyQ890RzlTr6SQ8mStV5A6vlUoI8AQgvlF6Ax9xReA6/gswjo24cqWn2brN5gqGdvrtKgvxp+fiN+7iMdU0iReU//
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <SN1PR0201MB19356C0828D4B35D30739EE9D5960@SN1PR0201MB1935.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93004095)(100000703101)(100105400095)(3002001)(10201501046)(6055026)(6041248)(20161123555025)(20161123560025)(20161123562025)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:SN1PR0201MB1935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:SN1PR0201MB1935; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0201MB1935;
	4:3UHP6KOFO9bQWz1vY2vIkm+zQfbrg0gZnfUR3VMWai8I+CUvwVNxKvxLi2hYvNa7n/09hrwhMUtqRnThQCv9iBgxD0ZD4HIwbPG4X2KoqswP135jCV6wLehQDf5li3TcW+w4mKQzI3tmWXzMGJNATfUBLMxpikuQfBKyU3gzmvLHVrLFoGyr0Mqs9qf9YIr811LVUr6JLL1VdOseeselLjheJOUPTiup+2HegxWcdB6V0AChg8TFAINMQ/WWhLzoYVXzn8w6CDy8IxOl5QTJSD5c6ZRJdO5qdfnYWgD7RVk=
X-Forefront-PRVS: 0421BF7135
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0201MB1935;
	23:3t3HR+1FvN2La0K45WgrIcKMFJLdtlhkaBQ881u3V0+Ifrqcq3X+Z5Chb0+p2/0J2yYOY/n2fjF6+rSwGW/SbiNCqh2IF6+9XsxsZ3Mzpmjf/0jOAttFnHVoiCfa2A2FHmDWZuoJvy5PzMXfMyPIorCqBIkyweZmVDyC0ZYNvWkOClXJqCVZQIpevJbd9hjGQPvE1qr6tN1qnEyoPJllPq2TvUrqqFyw8wa+Ayuab7oDbDkhktN5aALe5DoZd04rDuO97r5a9o9Vnct7hT8/5sNsvSdE4buq6cRyQCRd0RM8+3zT14naITotk7AWnV+1kCjaoJFRzEysl27xSWFUDc0do6epYur2VAi6su9MsFRpA0kLHXd3ye025snopebRgqV1XKsDyRDMEYXWKbY464wWNsqrXbYmymrV2GqmLM91qBPfE81Fx/w1yhxsSZy3dsK6AEW2uIbyZakHCtRTnUHf81AuTFaA40Ma0S8k1CX/bhKpSn1HmDKSWD/Ns7aF5NbawhLvZQKFufrEWPbXWhuvZ8pFnXf9DK52YHjue5WDjt+zZ6dPuDiDoDsfyLI9pGWqsdjZIBp9bUxNxVBIX+LoEn8p4RtS3Q3FpBemY2dO1wK5DInUAIA1llycSKX+TRe+DXueZA59RhObOWucGRe/3bjlVP0EpGwk3ZnsZ+Rlv6lXVo8lUkFNL1QSATttTza8uAwCp8J4FKLBXTUk5NzoFCTyuQw+0TxSqePLl93o8/b5aY8LIoRdz58Bm3QDVFV5R9xLfSLdQiDFPndeW3sze3AOuZ3JF7jOnepO5HniO6LBzV6XJXkxGIg5PmPKvkVJ49z+xsb80+MkddjBNSlrVJua/6BPJGk1eweoTXIU4QeFRaDb7CgLxKfNuQmCWTXPS1AB4+lFqOEd8eUk+A==
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0201MB1935;
	6:b3ctPPMfCOTNfHEYI1Q5WRiSM8lHf5rr1F5YXfJf0QYOOFEj0vJMi0KOyHiLQ1/VtK29H4Q8kPcSudGaZMhOh0s1QEVz5AbqnYQYVaNfm0FQ7zqWaAu+P25AhGJ2VE62HNcFl6aezcyy81xuhdi6MpFUZDayIxqvOJ4PMwlqK8jMZk2/2u/5zs7xf40oTIgLoZ4zKXwsLd6fUm6Lt6aBi7C5LgRDo5ol881BZtuYErGrgHvaZG0Ua/UGDyxGda4Baf1v6kDuShYDtRMh/Pc9/WUwLMpqIXcwCzoygKLymuJwapjYoaRHP7RxycipSND16FyrOLAiJLpWaPnUdoI85Q==;
	5:Iv3HXIXGR3sU/rYJSI/PkT4B9rhDbG5pny4qaZOx3Wjy0Vwhq/3LkbG2enzY2L8rxjtVGOWC9PJtpmcRM2cX+/g8unfJZpYt2Lrw6L+62bqOWjZDfga6JdKWuEMjhLt8lJ10t+Vlcm2EFFT2r0Dgzw==;
	24:I1mcizstgS2v1XqaoJyuwv1fo66JSZWgCyTeHH+ip8M4Y46SnuP8kuPzJyO/ey5OGPhLI+f3hp0Xw4kkPpXvFPSOaeXmuYnpenJZvXUBb6U=;
	7:XUJFJzWqz0cWSX6t5NMPLx294SCvwfqBZSE9+5NPLIATdTZ0k7gEzKKRL+vq2Vn1DM1Bx2qjDmYo8aB4uqUP47V04m/lrg7VdtDcoE9qapJylKb3e9u4Mx4dh+AZ+Q3jkZ80hycXudrRG4bT4tbYWmhle33EpddzRDNNBGytoqxMECHE9B5M4YfW0HXllOAKdr6qCB5k86GkhfdUQX7eQ7kxCB7YdRvABS3HWGtfHYA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2017 21:14:37.7243 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR0201MB1935
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.88
Subject: [Qemu-devel] [PATCH] target/arm: Add Jazelle feature
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
Cc: portia.stephens@xilinx.com, qemu-devel@nongnu.org, stephensportia@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xwlXRiRki4sr

This adds the Jazelle execution state as a feature if ARM_FEATURE_V6 is
set or if the processor is arm926 or arm1026. This fixes the issue that any
BXJ instruction will result in an illegal_op. BXJ instructions will now
check if the architecture supports ARM_FEATURE_JAZELLE.

Signed-off-by: Portia Stephens <portia.stephens@xilinx.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---

This is a rewrite from my previous patch, "target/arm: Remove 5J
architecture"
-Instead of removing 5J architecture, added a Jazelle feature.

 target/arm/cpu.c       | 3 +++
 target/arm/cpu.h       | 1 +
 target/arm/translate.c | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 41ae6ba3c2..0fb2fddae3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -681,6 +681,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
     if (arm_feature(env, ARM_FEATURE_V6)) {
         set_feature(env, ARM_FEATURE_V5);
+        set_feature(env, ARM_FEATURE_JAZELLE);
         if (!arm_feature(env, ARM_FEATURE_M)) {
             set_feature(env, ARM_FEATURE_AUXCR);
         }
@@ -887,6 +888,7 @@ static void arm926_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_VFP);
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
     set_feature(&cpu->env, ARM_FEATURE_CACHE_TEST_CLEAN);
+    set_feature(&cpu->env, ARM_FEATURE_JAZELLE);
     cpu->midr = 0x41069265;
     cpu->reset_fpsid = 0x41011090;
     cpu->ctr = 0x1dd20d2;
@@ -916,6 +918,7 @@ static void arm1026_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_AUXCR);
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
     set_feature(&cpu->env, ARM_FEATURE_CACHE_TEST_CLEAN);
+    set_feature(&cpu->env, ARM_FEATURE_JAZELLE);
     cpu->midr = 0x4106a262;
     cpu->reset_fpsid = 0x410110a0;
     cpu->ctr = 0x1dd20d2;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 92771d3790..daa99169fd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1250,6 +1250,7 @@ enum arm_features {
     ARM_FEATURE_THUMB_DSP, /* DSP insns supported in the Thumb encodings */
     ARM_FEATURE_PMU, /* has PMU support */
     ARM_FEATURE_VBAR, /* has cp15 VBAR */
+    ARM_FEATURE_JAZELLE, /* has Jazelle execution state */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index e52a6d7622..3a9142cd7d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -41,7 +41,7 @@
 #define ENABLE_ARCH_5     arm_dc_feature(s, ARM_FEATURE_V5)
 /* currently all emulated v5 cores are also v5TE, so don't bother */
 #define ENABLE_ARCH_5TE   arm_dc_feature(s, ARM_FEATURE_V5)
-#define ENABLE_ARCH_5J    0
+#define ENABLE_ARCH_5J    arm_dc_feature(s, ARM_FEATURE_JAZELLE)
 #define ENABLE_ARCH_6     arm_dc_feature(s, ARM_FEATURE_V6)
 #define ENABLE_ARCH_6K    arm_dc_feature(s, ARM_FEATURE_V6K)
 #define ENABLE_ARCH_6T2   arm_dc_feature(s, ARM_FEATURE_THUMB2)
-- 
2.14.1

