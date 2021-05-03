Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2368519lfg;
        Sun, 2 May 2021 22:34:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxokX3gmJLPLtvl64jNzubTm2XD5HmP2fe7C9+WUx4sRKQYJoRIY9DwCpXOSqhKwTdjQihw
X-Received: by 2002:a25:b089:: with SMTP id f9mr25160922ybj.84.1620020048345;
        Sun, 02 May 2021 22:34:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620020048; cv=none;
        d=google.com; s=arc-20160816;
        b=UwcD/C7CFI6YfkBcdIcXG/ig9w5irPL977/4tj/TV5PHcrYMvZlfz/YqwM30RLdF94
         znq56tT0nH+Up9UhYa1use8aRfP6R+Sa20YiwncgjQ1k8G1TSt2FD4kdxYr73afsCOZz
         /VFN1wy64VDN+k0D8DNOnMRiPJIxLw1hVFEnfJ3pZI9FGSR2qhgZ33h+IjHwHPgKQbSA
         z3oJMhxTwG1xGNonV3oVt0d6BMHHLFCI0udeJVIRLuJjGDwb3Xw63JwnUMDMCE+rPXYJ
         PSdCFQTelgNYMLq5IAwPVCkyPGoWItMXXNW+8hMxLfFCPSo02U/BmoQWEdKY4uZfXr6b
         +1bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=CJYR+7lKlJusjWK0o8QUlcKiehoMCzw1P6lU+CRtexM=;
        b=rdyIusOmdyI72W1bw5qQsdNwlRcUeIV9VrSYpt7E/5qrnUVDg0BESgffBEl1mqw99F
         f4GFli+MYVkE9gsHA2wCDPUUbZ7lGmHZWGviwX3VRwqAHUTVz6pCxlCaXOn9Tdj249Kq
         SMqbcsbdEEDWT6tIpt6nQgWYOFuz5tLc0DpRE5epqBiR6ljqaY0Bkr/bHzKIgFQsYrzD
         mwaATeub8Gzz02hQpaxsLFVhJX8Yoa5Uwqj5OQ8nQB3oI9vabQRR4L7eaMrxet+eh3tx
         eIEqolc8CMfj3Kj6hdEiPyffx2HQyY0xxtcn/jttMkQuvTRvM2KPOMTtPg0LSl2CgXnX
         O5Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i72si9632576yba.491.2021.05.02.22.34.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 May 2021 22:34:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldRDb-00066a-JV
	for alex.bennee@linaro.org; Mon, 03 May 2021 01:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6K-0004qP-Rq; Mon, 03 May 2021 01:26:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6F-0006A0-PV; Mon, 03 May 2021 01:26:35 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14353HsE133036; Mon, 3 May 2021 01:26:21 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38a938hyvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 01:26:21 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1435JSlS029034;
 Mon, 3 May 2021 05:26:19 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 388xm889nq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 05:26:19 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1435QHLi36307278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 May 2021 05:26:17 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1635AE04D;
 Mon,  3 May 2021 05:26:16 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCD34AE051;
 Mon,  3 May 2021 05:26:16 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  3 May 2021 05:26:16 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 0A42A22004E;
 Mon,  3 May 2021 07:26:15 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 14/18] tests/qtest: Rename m25p80 test in aspeed_smc test
Date: Mon,  3 May 2021 07:25:56 +0200
Message-Id: <20210503052600.290483-15-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503052600.290483-1-clg@kaod.org>
References: <20210503052600.290483-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ym6DHTtBvHby1tZXCPTm2-UMHOKCbKBD
X-Proofpoint-GUID: Ym6DHTtBvHby1tZXCPTm2-UMHOKCbKBD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_02:2021-04-30,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxlogscore=782 spamscore=0 impostorscore=0 clxscore=1034
 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DcAgb9gG5szX

The m25p80 test depends on the Aspeed SMC controller to test our
SPI-NOR flash support. Reflect this dependency by changing the name.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20210407171637.777743-17-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 tests/qtest/{m25p80-test.c =3D> aspeed_smc-test.c} | 12 ++++++------
 tests/qtest/meson.build                          |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename tests/qtest/{m25p80-test.c =3D> aspeed_smc-test.c} (96%)

diff --git a/tests/qtest/m25p80-test.c b/tests/qtest/aspeed_smc-test.c
similarity index 96%
rename from tests/qtest/m25p80-test.c
rename to tests/qtest/aspeed_smc-test.c
index f860cef5f08f..87b40a0ef186 100644
--- a/tests/qtest/m25p80-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -367,12 +367,12 @@ int main(int argc, char **argv)
                                "-drive file=3D%s,format=3Draw,if=3Dmtd",
                                tmp_path);
=20
-    qtest_add_func("/m25p80/read_jedec", test_read_jedec);
-    qtest_add_func("/m25p80/erase_sector", test_erase_sector);
-    qtest_add_func("/m25p80/erase_all",  test_erase_all);
-    qtest_add_func("/m25p80/write_page", test_write_page);
-    qtest_add_func("/m25p80/read_page_mem", test_read_page_mem);
-    qtest_add_func("/m25p80/write_page_mem", test_write_page_mem);
+    qtest_add_func("/ast2400/smc/read_jedec", test_read_jedec);
+    qtest_add_func("/ast2400/smc/erase_sector", test_erase_sector);
+    qtest_add_func("/ast2400/smc/erase_all",  test_erase_all);
+    qtest_add_func("/ast2400/smc/write_page", test_write_page);
+    qtest_add_func("/ast2400/smc/read_page_mem", test_read_page_mem);
+    qtest_add_func("/ast2400/smc/write_page_mem", test_write_page_mem);
=20
     ret =3D g_test_run();
=20
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index f241ba0636a3..966bc93efa43 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -162,7 +162,8 @@ qtests_npcm7xx =3D \
    'npcm7xx_watchdog_timer-test'] + \
    (slirp.found() ? ['npcm7xx_emc-test'] : [])
 qtests_aspeed =3D \
-  ['aspeed_hace-test']
+  ['aspeed_hace-test',
+   'aspeed_smc-test']
 qtests_arm =3D \
   (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) =
+ \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-ap=
b-dualtimer-test'] : []) + \
@@ -173,7 +174,6 @@ qtests_arm =3D \
   (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) +=
 \
   ['arm-cpu-features',
    'microbit-test',
-   'm25p80-test',
    'test-arm-mptimer',
    'boot-serial-test',
    'hexloader-test']
--=20
2.26.3

