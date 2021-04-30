Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp329883lfg;
        Fri, 30 Apr 2021 10:32:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyK7MwmPVYJnpuIwYYTnAqxiOYUGH8BrFdN7X/nwLzcgOoy6VOsnM3KbIrhEiplQIGwXopx
X-Received: by 2002:a5d:9682:: with SMTP id m2mr4955245ion.20.1619803940961;
        Fri, 30 Apr 2021 10:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619803940; cv=none;
        d=google.com; s=arc-20160816;
        b=kzSa8v74cjDC+p4O02wPFFfPM2rG7adyTZSd/nV2J5d/KAkuUOk+hMBw0i+LhVtXzH
         /QA1t+2n+hKYtC1Km3Q/s2CQ2i4USzGFNy6o/2jdX4nWHe4PBfMgP9ytk6dwnGstAZNO
         WIFJr4KxN5xO7BX+ZIktPllXRPQrKX05VHKZ9b47HvzjLvIjF6Gtlvl97n4DrlxtaOkk
         0my2/omWGvZw9ltaiYeim8+CjL/f7g+ImB6FQQ5qh86ooueh01jBhuXqbe7BpaS+9rkg
         /q4w0yAzoPUoMt1RpI9pVFBxZSSeyikTGye8Y3Tl62Ic0ZIyK1BSARMULXcAj5QNUDHb
         fbCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:message-id:date:subject:to:from;
        bh=lhpb1MYPA5dScQOkNhcHMXJXOM9vKehg3QVZxXSqalk=;
        b=iyT873MOuQyEjfRcLggS2/z2PXYwioIbc3bksBEavg3n2IKU9TYdS5S/iG9HSqBnCc
         3I3hrzWKyHNZVs0MEh0x55dyvi8Pn8dAPHehnoiPgaTc9uf2UPB8OgYXHoa4lf92CMIP
         qvQs9sjRfkk+NqYWu788FpSSC5LxWmTFSr/oj/Lr7jfmBgGiV9+GrdK017T0Cy0+0D6M
         57DfK3GH9z1Uqt4rGtBp7/c7y9vz/uluxowvJ5n9XJ6wf7eH370AgAHjg8RbolCsmYh+
         Wu9IbKW7Di+X510UcADVqHmLZFrA2YGCokNif4KdAblNWpCQnpT6vx7fn/QQuiM4Fr5c
         40Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16si3742085iol.87.2021.04.30.10.32.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 10:32:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcX00-000328-6z
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 13:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcWWE-0000Lk-EW; Fri, 30 Apr 2021 13:01:35 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcWWA-0002YG-4T; Fri, 30 Apr 2021 13:01:34 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UGY73d159892; Fri, 30 Apr 2021 13:01:16 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388n19sta6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 13:01:15 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13UGYRrD161387;
 Fri, 30 Apr 2021 13:01:15 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388n19st97-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 13:01:15 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UGxjge020552;
 Fri, 30 Apr 2021 17:01:13 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 384ay8kay2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 17:01:13 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13UH1ACY31261156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 17:01:10 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8946652051;
 Fri, 30 Apr 2021 17:01:10 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 3DBC852057;
 Fri, 30 Apr 2021 17:01:10 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2DD1822016C;
 Fri, 30 Apr 2021 19:01:09 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/18] tests/acceptance: Test ast2600 machine
Date: Fri, 30 Apr 2021 19:01:00 +0200
Message-Id: <20210430170108.10261-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lV3bLNhC5S9Xa54sgA2hNY27tp7zfbHJ
X-Proofpoint-ORIG-GUID: _tYY7andgs5ULmnZEUbsx_pNHkBhNufL
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_10:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 clxscore=1034 priorityscore=1501 mlxscore=0 phishscore=0 suspectscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104300109
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ayc0USIVyFRy

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

