Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE62606D83B
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 12:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOxnq/tT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e95vWWIC
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOwy2-00037r-4c; Thu, 05 Nov 2026 07:53:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwxe-0002tY-E9
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:53:00 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwxb-0005jZ-49
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:52:57 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A59tDa3444466
 for <qemu-arm@nongnu.org>; Thu, 5 Nov 2026 12:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UxnGUp3Sb7zspGgMhNmgjxWhNcJf7hTyv56nQqqr+zk=; b=XOxnq/tTfRRgfhRR
 CrNhTgRqtL5T7pzmzZ6vSxoRXcmO29o3SJXBjoycQq0GBLHcSJnNw9s1G9ymR0i5
 v6JjfgBH5ZS0U6c3dk53tcXjIo6i5wUZYbBIsZ/LdvJ5N9ytCAG5a5SEVQ8dJVXj
 osfLS/VlGAN3afGLX2uW/h6lEGZyqMda42rMi7z2QNTSoo2eoTILhrJsa/2KTS55
 aPdFABrJDCgPYx5k9XPWkdjJyXzISO9Qoe0vebyUeW6YF9u+cIWUaZtqbBmtonTM
 GXrdqEI8XBIFu0HOMdx/vs9B08JrjuhSmufkNrG9D6SWxKNVEBdoPqiduDu+5+bH
 rW2VXQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaah2mb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 12:52:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-945c60b470dso285187185a.1
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 04:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883173; x=1794487973; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=UxnGUp3Sb7zspGgMhNmgjxWhNcJf7hTyv56nQqqr+zk=;
 b=e95vWWICpV2KiCDTXislEQZGcSvVGhPOu8CtSiZbnYdNZYp0sgM3akbBabC/ZgeI07
 z1QqmYtjMWMbnjB+Zsyt94Xa8f+IJ3H9XKgWzClWAFmqAKWLssmUTpKRYXgb0vCbkHCF
 jPOiuy4I78Fe+imOFJfN3Kvo9SMdwdK5RBr/iXi6ydgi7IuC25x86hAnnGqIcnN6LsFJ
 CH0eP7wrXm0WB0Spg+ua5Q7zQr+aV5pmi5dBKHCa1mGDzgNJWsWb/0+qV6hcmp+GEpqc
 zLeThsxEI8EkFC8H384Qv7sX7soByRt2s5SPGgUAw6W6lr72NzmTusJKWQkPfm95makJ
 BBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883173; x=1794487973;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UxnGUp3Sb7zspGgMhNmgjxWhNcJf7hTyv56nQqqr+zk=;
 b=DozV6EqMV4RMyd2BoAQfS04HKJ8KoqBufJzfvpMmaRwm9IBuVi/sKKqDWU2Fow/vNK
 GhtPdrCYEjmwNT9Tfo24UkoHXSDaTfseSgudz3Jqcd3m6zAB/hSeSHqAb4/jkR7dvcqT
 xcy5rdHoC+oTkjOIFM7QvPlUinlH/G+l1esxnUa73DOc/978Dtd1Zf7OTKr8W31HgPKy
 24eSV9uZLUkgh3iEbfXXOsNupiTicpdfi/H5++LaM5S7F3MCABmd2QJqYZa4+aYIx/1D
 RuC1pfqAM9p0A5NBFN+/z/fz+eHh9VInHBeOaSrjp3R9th+Perqt2t2x2txxHBdSAwNz
 UK8w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzQdf7WvSXgDp6is+6MEp7yTRPzRamsW9IFzsNyArna1dA+BV/5/onSF5TT50c0slapUBxEryGEGQ==@nongnu.org
X-Gm-Message-State: APuU4Z8ujRHDSyF3sJMmr/tiLxOXU5LFdDvIMU+znxHYIdxpOp+6cVcJ
 q293qL8lcAzUpN6P0GoZXlicFuqVmiXLrCjIUsKidGiwr56f3gJm7adM1bKVAquTLNje4m4Sgk4
 VBX+BStZ/f4+pBZFNuKY6rExuusSfHMgUfaDVW1RTMNSc7l/T7Hc+z4Q=
X-Gm-Gg: AYBFou1onHA37qtGzpood4s7xECh388AaXiX6h4pUYWoKtHLgRJ+TVtfGwWAJMOwR9Z
 RCohjv+72UpYAa6rpOoVBtnsaxSqQz/XeELTOU+BTjXCTcsx6m+nI40PAcwDrmSRNrDwsIdYoV1
 WrMDsAJAsNGyspND+ylXnuUanPQrrMuW5sVSUMP67P+S79J+N3oRZv7a1euqZBwoH8KmRNNz3LC
 Nq7/zFFNcyeMbjOWdqyqht/xyNFX20Mmne6u2UfPECmPuILtjuNPcchUcUeSgHPjBog6tEcB3Vw
 boIxMgS7EUM45loX2HL1kkVLaodHn0ihbuMhAtXRTSyXPvhYDRjUsgShQ8ezOXx/7Yw8yh2ZSzK
 pRdmMFXBeRHUwZbs3dtaW2vt/GQYA7TuD4JNi49ATs23rp3MHUzCSxX0X6vNUlep8ulxLmsk31A
 dRTQ4ZQbHpD5Ealay23hC2Q0fEBlqBcw==
X-Received: by 2002:a05:620a:461e:b0:93f:2940:1ff0 with SMTP id
 af79cd13be357-9442160faf7mr3295180785a.24.1793883173356; 
 Thu, 05 Nov 2026 04:52:53 -0800 (PST)
X-Received: by 2002:a05:620a:461e:b0:93f:2940:1ff0 with SMTP id
 af79cd13be357-9442160faf7mr3295177585a.24.1793883172862; 
 Thu, 05 Nov 2026 04:52:52 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e41e0fasm173269166b.19.2026.11.05.04.52.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:52:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: [PATCH v2 04/17] tests/unit/visitor: Replace deprecated sprintf()
 with snprintf()
Date: Thu,  5 Nov 2026 13:51:49 +0100
Message-ID: <20261105125203.40320-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX5je1Tj+sWuNN
 PfZpBL1/kLWOg3RJ+scYaRReLs+67y0i4kNfM0nnxDLi7ZoUohCjdb3v6KXZTlkhNGWpX1Ovxzk
 nmu0vZDWM/1YZpZz/3LmiHlBjYwIB1R/1IuXQmngI9QcSafGmKPuqngDzvs7m7JZ4K+MvRze2bu
 MfharDMIUI3RJP4auAXo+RPE4VZpJ9xy6b8Fb9XwmiJU4he3IyY+6EXiF6lUfa2k41rzR6F+Tvd
 9qO8WcxwM6KM9kqOdpvQ/D1P5tN2lv7fSWW67WPUDvIBh5zmW0B2I8PYBhws5n1KioNdGlV8HjR
 mxXa4M/6iHpQLsrtVM+nT/oneOfwsUSJbmQWAjAm2+G1v0Wr87+TZ525qe7Lv2O7o0WTXjFUCOU
 g+YgbEkFJez8FPOzH5hdakRfrZKrOgqkv876VVp+p/0y2o77/cD4Bd78Pqwk0cE5LDQtISspv+j
 54nM3o2jZAvRmJmzb5Q==
X-Proofpoint-GUID: kb0dU0WrkbDleM83XhwOlnsj9lixAcNx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX0Bx62Qt1u94t
 VTmXJuiVYFjvsQo8Fh1qKUpPNEBE68MXjzLpe9nRjNvtFpxRqaUBF7zaJPuSHi7t3Xx58ZH80wZ
 rKFanepfUXJAxp+sEMYLZKbaZKwdXYs=
X-Proofpoint-ORIG-GUID: kb0dU0WrkbDleM83XhwOlnsj9lixAcNx
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aec7c26 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tI5WgH4TlSC9l14kVoEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050051
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Replace sprintf() by safer snprintf() to avoid when using
Apple clang 17.0.0 on macOS ARM64:

  ../tests/unit/test-visitor-serialization.c:1031:5: warning: 'sprintf' is deprecated [-Wdeprecated-declarations]
  ../tests/unit/test-visitor-serialization.c:1035:13: warning: 'sprintf' is deprecated [-Wdeprecated-declarations]
  ...

Use pstrcpy() when no formatting is needed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 tests/unit/test-visitor-serialization.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/tests/unit/test-visitor-serialization.c b/tests/unit/test-visitor-serialization.c
index 2d365999fc82..254c24d5cda4 100644
--- a/tests/unit/test-visitor-serialization.c
+++ b/tests/unit/test-visitor-serialization.c
@@ -14,6 +14,7 @@
 #include "qemu/osdep.h"
 #include <float.h>
 
+#include "qemu/cutils.h"
 #include "test-qapi-visit.h"
 #include "qapi/error.h"
 #include "qobject/qjson.h"
@@ -1028,12 +1029,13 @@ static void add_visitor_type(const SerializeOps *ops)
     TestArgs *args;
     int i = 0;
 
-    sprintf(testname_prefix, "/visitor/serialization/%s", ops->type);
+    snprintf(testname_prefix, sizeof(testname_prefix),
+             "/visitor/serialization/%s", ops->type);
 
     if (ops->caps & VCAP_PRIMITIVES) {
         while (pt_values[i].type != PTYPE_EOL) {
-            sprintf(testname, "%s/primitives/%s", testname_prefix,
-                    pt_values[i].description);
+            snprintf(testname, sizeof(testname), "%s/primitives/%s",
+                     testname_prefix, pt_values[i].description);
             args = g_malloc0(sizeof(*args));
             args->ops = ops;
             args->test_data = &pt_values[i];
@@ -1043,13 +1045,15 @@ static void add_visitor_type(const SerializeOps *ops)
     }
 
     if (ops->caps & VCAP_STRUCTURES) {
-        sprintf(testname, "%s/struct", testname_prefix);
+        pstrcpy(testname, sizeof(testname), testname_prefix);
+        pstrcat(testname, sizeof(testname), "/struct");
         args = g_malloc0(sizeof(*args));
         args->ops = ops;
         args->test_data = NULL;
         g_test_add_data_func(testname, args, test_struct);
 
-        sprintf(testname, "%s/nested_struct", testname_prefix);
+        pstrcpy(testname, sizeof(testname), testname_prefix);
+        pstrcat(testname, sizeof(testname), "/nested_struct");
         args = g_malloc0(sizeof(*args));
         args->ops = ops;
         args->test_data = NULL;
@@ -1057,7 +1061,8 @@ static void add_visitor_type(const SerializeOps *ops)
     }
 
     if (ops->caps & VCAP_LISTS) {
-        sprintf(testname, "%s/nested_struct_list", testname_prefix);
+        pstrcpy(testname, sizeof(testname), testname_prefix);
+        pstrcat(testname, sizeof(testname), "/nested_struct_list");
         args = g_malloc0(sizeof(*args));
         args->ops = ops;
         args->test_data = NULL;
@@ -1067,8 +1072,8 @@ static void add_visitor_type(const SerializeOps *ops)
     if (ops->caps & VCAP_PRIMITIVE_LISTS) {
         i = 0;
         while (pt_values[i].type != PTYPE_EOL) {
-            sprintf(testname, "%s/primitive_list/%s", testname_prefix,
-                    pt_values[i].description);
+            snprintf(testname, sizeof(testname), "%s/primitive_list/%s",
+                     testname_prefix, pt_values[i].description);
             args = g_malloc0(sizeof(*args));
             args->ops = ops;
             args->test_data = &pt_values[i];
-- 
2.55.0


