Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79964606A31B
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Nov 2026 14:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aI3L0mTg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OpWLm9sA
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOcMu-0006La-FJ; Wed, 04 Nov 2026 09:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOcMs-0006KE-Gb
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 09:53:38 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOcMq-0003gO-1Y
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 09:53:38 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A4BZm80739125
 for <qemu-arm@nongnu.org>; Wed, 4 Nov 2026 14:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mw6RaUGCbl+/ZnFwaHsCCuDpOSYFCgHjsN4XoRXijlQ=; b=aI3L0mTg+gz/YEF3
 zp+sArsgVuoopjtr3qP1GuWrPgTERhmHarPnHXuaLFyhQHuILFw9ueKmkCIhr/re
 WDdv3tzdxabPy+YX/6GYu2a/Aq6/3tbwBdJU5bjSG+CmP6SoCfqhk2b4lbF08h2+
 Q/0wEdm+A0dQmlcaB+1BHG5Uafm8mQlwg19VW3pQS1Lvdt2jlTtHFOP7qO3IZMXP
 LNKBawoiMPtxleiohXZQoQbjLt6CkLz+S40E+l5rzh2cXSBT0row21RPbsVHGRL0
 wuEZ6l+N+pAMYXQN0cB09IQe04UabeOUWgem0wxFqvnKuIXaH/qO6cyRjF5Y8bSJ
 g3ZFgA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163hggk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 14:53:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93cb71b1443so197967385a.2
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 06:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793804013; x=1794408813; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=mw6RaUGCbl+/ZnFwaHsCCuDpOSYFCgHjsN4XoRXijlQ=;
 b=OpWLm9sAv3Ngrn/bEdGaBYTTCfMX03R2voetrXXYrfvNEiJuAZ6lmoQKpGXm8S1ZYk
 9tS/d+hKhP3SgY8K70EKF8P0LD4UqqScjVViWpiXlnDTrSn5/LeVHejrlloJjAN7Wdqw
 yoChseoQviPJq6RXlWVIyh3aV+CC1rEATGw9RwZExTYEPTmKgL2nC0uubIAnOK9wBduB
 GgKIBRRf2C0XN7hjq4i7V7U+TYAsNp2vRGcOIO/vcfZlob2UOnoaxLWJvYWo7FLcRP80
 83Q2L8h/+q9etRhlXxRaGtjrIvtIlxnrPez7yhQWtUUzAJXWGhe7dtXXCP9nfz0EyU3L
 x1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793804013; x=1794408813;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mw6RaUGCbl+/ZnFwaHsCCuDpOSYFCgHjsN4XoRXijlQ=;
 b=NmZBVT7X1fc6Ato5zpNrzCL8rr655PUjnaKEA/XCgL2DYknPZZFec8WcAfaVhrPida
 DTNtmmPQa56vVUrpsOdzQ03KnopJClRD14IaG/8TeIuZse2qKzxAkgsu+E7WW2n8vDdT
 9Yw2AcspjISbqtwwqMC3bLYetH2Oc3pwoufwmjrUGzei/bqfTv4j86sGnYx0DWLJz3ZY
 pMNUE0EDgDRgk85apoAPKL7kiJzlaaiW6JGvq2/JHSTKy/8jLcCA0ge5+N3B93Uwc7og
 JFVi/Ly7MjHYdvLFr2rPFlDFT5+iMRTTHlU+v8anrRrle8wYjC5uP4FXXz9U1Dr13t8W
 BfvQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxhJYYDPHgL5kWhIFwP5nvVnSRd6o9yGLcOH5rAra7gm+lZ7PPBvrgQBnagnNQ7s6lInQqNbFEg+w==@nongnu.org
X-Gm-Message-State: APuU4Z80rgRMbs5la4QHobZdrNHrUxKJlwvCPgVrNt5akZS8QGUhG6Na
 JgDAgO6+QdhWOkrFMewwmvLVjhtpmkZsScrf7h5nouuqm0K7pub129LqQhsvFbEL6627ew0c4Vg
 9cpI4CQ4zmLuF0uGcy1Qo4LSGBK8pWTv1EEr+zdQDRBy04OOoUxWUpI4=
X-Gm-Gg: AYBFou2+vEP4DLiCc9QLaoaMePrB04gOYs88MVJUxHXEz5cKJYBh5K340+LYZaphHkI
 6Dau/CZ+xGSckjROnwhg/y6tx2Ilu743btBPOksyJW9XxCacRPkvmfrb1/x5kWa7GFFTZw/uhpC
 OTMNRwLha+28dvyvAuQ4UolRcmo+iPqiEupITnpjMnD+dK0gdGqpzTp+a5t9fTHN08SNuiDdaub
 AuG5g5HTkvF96/q4KubrtjiAn+lQeohNHfPWx/etSFkA/r8FxjoCiX7540YhAgrt10coAJ19nf5
 ZsQd979wjCA2cH1WyHfmaA2tTwiXDxMKabn1aTuSIqBmCngngrl6MceuGJYJ8SlOTuoPYN3TsZG
 ljpmaZxSNWM7cgxvUcjdCoAFdA257s7zfsw2SRfNjjCSSWr3R3ofggB4T4hZE9iGmHc/F5Vea3F
 3DqQflb1HDkghPlg==
X-Received: by 2002:a05:620a:3183:b0:93e:f4f4:346 with SMTP id
 af79cd13be357-94421796ea3mr2706736185a.39.1793804013588; 
 Wed, 04 Nov 2026 06:53:33 -0800 (PST)
X-Received: by 2002:a05:620a:3183:b0:93e:f4f4:346 with SMTP id
 af79cd13be357-94421796ea3mr2706731185a.39.1793804013091; 
 Wed, 04 Nov 2026 06:53:33 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b414b170d0sm42239525e9.1.2026.11.04.06.53.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Nov 2026 06:53:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/5] tests/qtest/npcm7xx: Replace deprecated sprintf() with
 snprintf()
Date: Wed,  4 Nov 2026 15:53:13 +0100
Message-ID: <20261104145316.18841-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104145316.18841-1-philmd@oss.qualcomm.com>
References: <20261104145316.18841-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lET2X3Jm8R3wdQBBL426q0zuvE3u-IDA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1OSBTYWx0ZWRfXwph42xQWZ8Px
 V/zMCyGfOO4FRkY/g4KwPSix7w54R/ColCcAB0kHo9+Bg8A6CC/XZ18ULWWOOr0hyOTKpa5VvLN
 U9gneQeHGBihl78oLk2YaI6BYD8dC4U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1OSBTYWx0ZWRfX88b0F03XebKy
 qqRksuLPtRL2C13bH1HHtosI12JKAg4Sxezc5mcgVALSvgwEBd2S/qJdYnCN7pm28MiDR9Fwtl2
 QtQOKNnCFwfYMuyZlwg8hILZSG8E1l2pryAlZvxPKEq35YCCqvnu8OxZeXFZBeVVE3xQn2ns8dg
 SPzTw0Of8iNj/E/PE2tG1adNeOjtnpriMQM7VYPT2edVozBpt5Q+hrdpnyhNvs9iXsCU3c99Z4P
 7dnQWS54a/ax47f6iSgUbbxl0zKtNA/bDm/LZwE/NCIz+isFWdGggkwFLerkOvlwstI8Dw2LUSW
 sH70lpyGVGH3NE77Nl0IwmY/njSLVP+8WCaMEtztmNYODx3I65OjPBUFWkERhqyqlhcsF1uXx6a
 wAVVMJWQ2tJF9COSskpSoqoklF/sQC7lWNNghLP3o0lnNRrC9MbycT0Jj0LjNqbr2MuIEZQ6mEO
 BtZNlB4EQt2br/vFikg==
X-Proofpoint-GUID: lET2X3Jm8R3wdQBBL426q0zuvE3u-IDA
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb46ee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=BSerAQQimkaHbVtXvo0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040059
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace sprintf() by safer snprintf() to fill the QOM path and
property names. This silences when using Apple clang 17.0.0:

  ../tests/qtest/npcm7xx_adc-test.c:140:5: warning: 'sprintf' is deprecated [-Wdeprecated-declarations]
  ../tests/qtest/npcm7xx_adc-test.c:322:9: warning: 'sprintf' is deprecated [-Wdeprecated-declarations]
  ../tests/qtest/npcm7xx_pwm-test.c:244:5: warning: 'sprintf' is deprecated [-Wdeprecated-declarations]
  ../tests/qtest/npcm7xx_pwm-test.c:245:5: warning: 'sprintf' is deprecated [-Wdeprecated-declarations]
  ../tests/qtest/npcm7xx_pwm-test.c:255:5: warning: 'sprintf' is deprecated [-Wdeprecated-declarations]
  ../tests/qtest/npcm7xx_pwm-test.c:256:5: warning: 'sprintf' is deprecated [-Wdeprecated-declarations]

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 tests/qtest/npcm7xx_adc-test.c | 5 +++--
 tests/qtest/npcm7xx_pwm-test.c | 8 ++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/npcm7xx_adc-test.c b/tests/qtest/npcm7xx_adc-test.c
index 8bc89b8a8b9a..f2fee1c32c81 100644
--- a/tests/qtest/npcm7xx_adc-test.c
+++ b/tests/qtest/npcm7xx_adc-test.c
@@ -137,7 +137,7 @@ static void adc_write_input(QTestState *qts, const ADC *adc,
 {
     char name[100];
 
-    sprintf(name, "adci[%u]", index);
+    snprintf(name, sizeof(name), "adci[%u]", index);
     adc_qom_set(qts, adc, name, value);
 }
 
@@ -319,7 +319,8 @@ static void test_calibrate(gconstpointer adc_p)
         char buf[100];
         QTestState *qts;
 
-        sprintf(buf, "-machine quanta-gsj -global npcm7xx-adc.iref=%u", iref);
+        snprintf(buf, sizeof(buf),
+                 "-machine quanta-gsj -global npcm7xx-adc.iref=%u", iref);
         qts = qtest_init(buf);
 
         /* Check the converted value is correct using the calibration value. */
diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
index 052ea876621a..cf24ba8de346 100644
--- a/tests/qtest/npcm7xx_pwm-test.c
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -241,8 +241,8 @@ static uint64_t pwm_get_freq(QTestState *qts, int module_index, int pwm_index)
     char path[100];
     char name[100];
 
-    sprintf(path, "/machine/soc/pwm[%d]", module_index);
-    sprintf(name, "freq[%d]", pwm_index);
+    snprintf(path, sizeof(path), "/machine/soc/pwm[%d]", module_index);
+    snprintf(name, sizeof(name), "freq[%d]", pwm_index);
 
     return pwm_qom_get(qts, path, name);
 }
@@ -252,8 +252,8 @@ static uint64_t pwm_get_duty(QTestState *qts, int module_index, int pwm_index)
     char path[100];
     char name[100];
 
-    sprintf(path, "/machine/soc/pwm[%d]", module_index);
-    sprintf(name, "duty[%d]", pwm_index);
+    snprintf(path, sizeof(path), "/machine/soc/pwm[%d]", module_index);
+    snprintf(name, sizeof(name), "duty[%d]", pwm_index);
 
     return pwm_qom_get(qts, path, name);
 }
-- 
2.55.0


