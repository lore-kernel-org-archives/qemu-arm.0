Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2365608lfg;
        Sun, 2 May 2021 22:29:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVd0panfmIlCSJedY7cceGM4rSrU50e2NCRmFKnm++iYd2cGVnCaPoCNwO5WjaDO9L+FKR
X-Received: by 2002:a05:6638:2a1:: with SMTP id d1mr16971685jaq.52.1620019740918;
        Sun, 02 May 2021 22:29:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620019740; cv=none;
        d=google.com; s=arc-20160816;
        b=P/JfVbwJ+DxPsn2JJpcLOtsExEmdunGpHmP3CjrdN4qfYEO+yjtSuJmZc0nQzIC6KX
         yQWRaUC8tkpeBLjWaSmpJb5blTcZ28iaq01yM31wL0a5trFPtFlhSQ4eDhTgM5/M5FHB
         Nt8/gWd7B3s3vIAOLPPRe9luBshemGgKIbSRO1K1iOeIGo7KXR6LJW74yWXM1h5dubqp
         BdOCWgereQpGpIsuoA6eltNvAGhFFeF3s1usHLy/PUypcsQh5C7WqiusQJ8KnXvVbO8m
         eh7vg8nE6pcAtmq1wlZONMb2ihuIAzOHj6ZxJMZ5Et8dvDiZKbrtbkA6Ba6JC5VWz/pb
         AGMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=lhpb1MYPA5dScQOkNhcHMXJXOM9vKehg3QVZxXSqalk=;
        b=VS/U0mlzrQdTjvzxRV6NcHCsIjGt1aC1C7ZdF8dDxuT8l0bWufUpg0J6De+1S6IFt5
         WZmMHNOUNnibDO91Kj6YxdHiyDeT2f47pOScDviChQ4d0wtQ9WCBws+r9AXY6ORlmMAR
         1hoMFYYnpcMFwaEnaTnHO8faCHLg2y0am6JW7D2uGLMq0KDGJ0Z46fPoquc0HRbm8pYf
         9p+p3mua6rY4Mpne1XtppkxWoYqgLOdRNSWqIwl9ykLKF4jXgNRK40emyno8+NH9Pk9D
         KrCJro69vpOZTCZ3puZZYFznrMz81Ua0+On/a3nJbfikxlaUlhMfkiYPnp9ZGs//GDti
         gcOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g19si14032082jat.91.2021.05.02.22.29.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 May 2021 22:29:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldR8e-0008RH-7W
	for alex.bennee@linaro.org; Mon, 03 May 2021 01:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6J-0004q6-4j; Mon, 03 May 2021 01:26:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6F-000697-Cq; Mon, 03 May 2021 01:26:34 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14352jMD156917; Mon, 3 May 2021 01:26:20 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38a9h29m85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 01:26:19 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 143540Dm163027;
 Mon, 3 May 2021 01:26:19 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38a9h29m7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 01:26:19 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1435HO13022073;
 Mon, 3 May 2021 05:26:17 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 388xm8rh6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 05:26:17 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1435QEZh25100632
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 May 2021 05:26:14 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A05B811C052;
 Mon,  3 May 2021 05:26:14 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55B2311C04C;
 Mon,  3 May 2021 05:26:14 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  3 May 2021 05:26:14 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8B7F522004E;
 Mon,  3 May 2021 07:26:13 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/18] tests/acceptance: Test ast2600 machine
Date: Mon,  3 May 2021 07:25:52 +0200
Message-Id: <20210503052600.290483-11-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503052600.290483-1-clg@kaod.org>
References: <20210503052600.290483-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6ZAazRLahS41cwJGRWjisoKEeaIjscCn
X-Proofpoint-ORIG-GUID: GS2OaK7wSnSzzBcPwVnSPXYJ76hHU48Q
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_02:2021-04-30,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1034
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105030033
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pr0rDANa+ZE1

From: Joel Stanley <joel@jms.id.au>

This tests a Debian multi-soc arm32 Linux kernel on the AST2600 based
Tacoma BMC machine.

There is no root file system so the test terminates when boot reaches
the stage where it attempts and fails to mount something.

Cc: Cleber Rosa <crosa@redhat.com>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>
[ clg : - removed comment
        - removed ending self.vm.shutdown() ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210304123951.163411-3-joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210407171637.777743-13-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 tests/acceptance/boot_linux_console.py | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot=
_linux_console.py
index 37bca7358583..276a53f14647 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -1053,6 +1053,31 @@ def do_test_arm_aspeed(self, image):
         self.wait_for_console_pattern("ftgmac100 1e660000.ethernet eth0: i=
rq ")
         self.wait_for_console_pattern("systemd[1]: Set hostname to")
=20
+    def test_arm_ast2600_debian(self):
+        """
+        :avocado: tags=3Darch:arm
+        :avocado: tags=3Dmachine:tacoma-bmc
+        """
+        deb_url =3D ('http://snapshot.debian.org/archive/debian/'
+                   '20210302T203551Z/'
+                   'pool/main/l/linux/'
+                   'linux-image-5.10.0-3-armmp_5.10.13-1_armhf.deb')
+        deb_hash =3D 'db40d32fe39255d05482bea48d72467b67d6225bb2a2a4d6f618=
cb8976f1e09e'
+        deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash,
+                                    algorithm=3D'sha256')
+        kernel_path =3D self.extract_from_deb(deb_path, '/boot/vmlinuz-5.1=
0.0-3-armmp')
+        dtb_path =3D self.extract_from_deb(deb_path,
+                '/usr/lib/linux-image-5.10.0-3-armmp/aspeed-bmc-opp-tacoma=
.dtb')
+
+        self.vm.set_console()
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-net', 'nic')
+        self.vm.launch()
+        self.wait_for_console_pattern("Booting Linux on physical CPU 0xf00=
")
+        self.wait_for_console_pattern("SMP: Total of 2 processors activate=
d")
+        self.wait_for_console_pattern("No filesystem could mount root")
+
     def test_m68k_mcf5208evb(self):
         """
         :avocado: tags=3Darch:m68k
--=20
2.26.3

