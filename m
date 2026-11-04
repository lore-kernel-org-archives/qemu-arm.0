Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD9E606A31B
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Nov 2026 14:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gfNLKuUp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BPIweerY
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOcMz-0006O7-Sl; Wed, 04 Nov 2026 09:53:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOcMy-0006NV-Ik
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 09:53:44 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOcMw-0003gy-S7
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 09:53:44 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A4Ba0B02284207
 for <qemu-arm@nongnu.org>; Wed, 4 Nov 2026 14:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H+2QCOFcKKLITDhHXmYsE/Z4g/ilHrukGMSmQgdwX1k=; b=gfNLKuUpRHFnjf3C
 20u0CDubYPDIF0ONSQs6M3+USjeCcrkx9H6ryzRCIGTATC2TiPAYfbknkWvgXuLT
 ESG1Mug1DkysZojRtPBsnKzMpa/ARoxZoMQuM2QQv9tYBHonuQvK9VzCA1CMW0jv
 nQJTrO5FKMD2Q3xrX9ZK9mGpYj6gMDj6OLfDesNvjLypFEo6/Ne3ei5y+9tHKLBG
 nrSIAfyo7IPp4cz2DAgUrUz3rZ9vsatHIoHlTk97LXjlYck7GWncF7mIncFo7Asy
 K6sD13UjscdIWy5vVEokUBv/Ogm/a5zGBAFvxO3y+bOixSrR79T5OsdLVXKAzr54
 A/tMEQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284s6c4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 14:53:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-7cc01d48a1bso1689728137.1
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 06:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793804021; x=1794408821; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=H+2QCOFcKKLITDhHXmYsE/Z4g/ilHrukGMSmQgdwX1k=;
 b=BPIweerYetCoannPna6hCMJjhRZqV9MvlJuDJr3x4dS6gvmEkMqqo08sPPEJn4LQ25
 a6kZPEujleohLbzfkYCqL3NlgXiVD22fJKkktZvFAEWHSOjiJhbGOalahVQ4nrYOpa+6
 F9OYSc6Rqg3o6Sr3cdRjR1jZkiUXiB4MeixSjoycVk1MRRIIfE1G97oi/DBReSzbvtlD
 6/dxt1vxNWgXwZmIdmcGYm1mH63lllNBlYtRZyzjKSNRifOhxGMZmlzocFzCZ2yVP2CC
 q3mA8cvByQP2wKXGi1+Al9t+M7VqFG4qe36WHuhquBaGqEQ/RuY3Bu3Wu5qvcZa9UoTH
 6cAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793804021; x=1794408821;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=H+2QCOFcKKLITDhHXmYsE/Z4g/ilHrukGMSmQgdwX1k=;
 b=YAYXMUuoS21bBG2opGm/kmDeh7hMAAEUfp+mBf0k992AB6AJd7NwFdQSFvD2qx+2Cs
 IClwSyJRb6ZsderJ44WNJ1TIE1m20a+fxRXXOffqLOXe0Taz6E+iHbUK9sNDR2DdaTaQ
 cddtsmakRMeIcU/8hPueUPWf+uBynkaaOaykC6dErJMFhF7gwVLblf5uUm+BrT34tWq4
 vDlsb7jwtxId8k4NfrD6MEbdrnk3NmpmVA8GRtr2v1Y/1icTKiUuFfgtR9uWwUidCl5o
 OFVC1KDzxMwmu1rXuOlg+dUK/J2m7aHfrYLZ3z5auijZ99qvDF0tXmd4g7Whms0ffSCv
 4hxQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxkQYLStyiavdFa4uUkPwRnkvKj8hvXkKAL8C00afQyjhq/VXpIJXMuR53pZHGpMvb0lKKwMg15NA==@nongnu.org
X-Gm-Message-State: APuU4Z+lwvj/i/4kVFsCeULL2VLc0Wyr1f0z8AP0Dfp7wI6LfTQxkmi/
 T2caS85OtfX93I8Vs7ZdnwKOAsRBPsXyJcBGuumyrdTbeCzD6JTo4DsGhL2CJFC1oqNLywBm/ME
 26tek9YP2BGEF5pw2pXimONNaIxzAFcdXFiErGqJvwOe65/ei+VTdPmM=
X-Gm-Gg: AYBFou19klSOqKGhrtzezcVhOpytre8q59hXWNcfc2IDIoTb74009g3VoTLTKYU15We
 ZPHy4p/8X519Ccx/CGXwH0V482m9xH0DKQulDgLP6aj8HuYdGVLdiKptE7dH13Zn0B0kz5bNjXm
 XT1sDeQ+dz5doQJ1L4HmVc9Ne1udwqlxL0paqJvD+TFiimmsB5s26rv1YGAYTfrzPNHCFSUrZnh
 ASUmDVk1fPrCFhMsrOyrXUTA2Xqe+VcP5fFris5tc8ScA1H+omzx4bPrMy+YEZBmrLI2YAkbOvA
 F7zxLs8ddHpye8QPExk3detTGAAv4Fo8vNELUaoeLbmgaC7vVR4p1lXEMXygcvhFdAL1VcEesER
 13u+m6EK+XDL/C/nVFIeEY0uKanpdNlzfhZo2U1l4QfJ/3te6sF6wuXROpWa6AHbTvB1wxbdiHj
 D/1v4r4QoUAG4ndw==
X-Received: by 2002:a05:6102:3ec9:b0:7cb:91a5:7cb1 with SMTP id
 ada2fe7eead31-7d05439aacamr5671641137.39.1793804020577; 
 Wed, 04 Nov 2026 06:53:40 -0800 (PST)
X-Received: by 2002:a05:6102:3ec9:b0:7cb:91a5:7cb1 with SMTP id
 ada2fe7eead31-7d05439aacamr5671636137.39.1793804020056; 
 Wed, 04 Nov 2026 06:53:40 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fed552afcsm4324763f8f.41.2026.11.04.06.53.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Nov 2026 06:53:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: [PATCH 3/5] tests/unit: Replace deprecated sprintf() with snprintf()
Date: Wed,  4 Nov 2026 15:53:14 +0100
Message-ID: <20261104145316.18841-4-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104145316.18841-1-philmd@oss.qualcomm.com>
References: <20261104145316.18841-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb46f5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=K5v2QzCvipGKQWMlk_wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: R60RVvgJOKkKK2BFzNs-UUyP3qEw6USD
X-Proofpoint-GUID: R60RVvgJOKkKK2BFzNs-UUyP3qEw6USD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1OSBTYWx0ZWRfX/C5soE0fV8bL
 OeCpZS2dei82vWP/0nunSiCiQ4OA/7ZTabSauihoSjLnrjsSRu0YaPRDXRA4uO+0nxBFfM8yAu9
 4vcZRCfavnidV8x+xcahi9drwHitXEewDVM39ZoRg0US7BosUFXHZeLyP4uJIDwNEMgV7HDqSYh
 Lut1gY8qFTxkv/wxubtrBNw8P3upjTL2TCNH2f/MAz6qf7qaGi7chqnA18SebRisItZ74NxvOsH
 Orh7mLXZz6n3/3HxvNjo8GfCLvTjV0uA42ODQ/dBoNA48WECtKK6GM184Ygd+2gEUCoXqz+n2TJ
 8uHI3FuoZYjYe4dvOvlFIuswJvs9HkB2BTAWmrSxoZStv9xobXjiH+5LFMObgQwmclvbYoAq/t1
 trWGOPD/JKNupBeFpmdNFXQL7gT3Pcv+bVkOthqQ2YH09pmpwwm3HgrJ1QlIu7GmUpHT4Xl2ecu
 vaePCvFwu1mRMtqOWzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1OSBTYWx0ZWRfX6vazoJgPkIV6
 jg8QF2JyrBJc3CbJ3UvOf07MRyECYCRNwSYes0cY6fBj9wS0Vbn5oe7y9Xe469fURof1d/1Dgew
 /WpjBkj9gVjj0ZcRvPmuF1ztKKZ5nCE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040059
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

  ../tests/unit/test-qobject-output-visitor.c:598:9: warning: 'sprintf' is deprecated [-Wdeprecated-declarations]
  ../tests/unit/test-qobject-input-visitor.c:600:9: warning: 'sprintf' is deprecated [-Wdeprecated-declarations]
  ../tests/unit/test-visitor-serialization.c:1031:5: warning: 'sprintf' is deprecated [-Wdeprecated-declarations]
  ../tests/unit/test-visitor-serialization.c:1035:13: warning: 'sprintf' is deprecated [-Wdeprecated-declarations]
  ...

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 tests/unit/test-qobject-input-visitor.c  |  2 +-
 tests/unit/test-qobject-output-visitor.c |  2 +-
 tests/unit/test-visitor-serialization.c  | 19 +++++++++++--------
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/tests/unit/test-qobject-input-visitor.c b/tests/unit/test-qobject-input-visitor.c
index beee11db4e47..41d3dd983b3c 100644
--- a/tests/unit/test-qobject-input-visitor.c
+++ b/tests/unit/test-qobject-input-visitor.c
@@ -597,7 +597,7 @@ static void test_visitor_in_list_struct(TestInputVisitorData *data,
     for (str_list = arrs->string; str_list; str_list = str_list->next) {
         char expected[32];
 
-        sprintf(expected, "%d", i);
+        snprintf(expected, sizeof(expected), "%d", i);
         g_assert_cmpstr(str_list->value, ==, expected);
         i++;
     }
diff --git a/tests/unit/test-qobject-output-visitor.c b/tests/unit/test-qobject-output-visitor.c
index 3c47b28f6638..ff571cd91ed6 100644
--- a/tests/unit/test-qobject-output-visitor.c
+++ b/tests/unit/test-qobject-output-visitor.c
@@ -595,7 +595,7 @@ static void test_visitor_out_list_struct(TestOutputVisitorData *data,
         char expected[32];
 
         g_assert(qvalue);
-        sprintf(expected, "%d", i);
+        snprintf(expected, sizeof(expected), "%d", i);
         g_assert_cmpstr(qstring_get_str(qvalue), ==, expected);
         i++;
     }
diff --git a/tests/unit/test-visitor-serialization.c b/tests/unit/test-visitor-serialization.c
index 2d365999fc82..21755d27036b 100644
--- a/tests/unit/test-visitor-serialization.c
+++ b/tests/unit/test-visitor-serialization.c
@@ -1028,12 +1028,13 @@ static void add_visitor_type(const SerializeOps *ops)
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
@@ -1043,13 +1044,14 @@ static void add_visitor_type(const SerializeOps *ops)
     }
 
     if (ops->caps & VCAP_STRUCTURES) {
-        sprintf(testname, "%s/struct", testname_prefix);
+        snprintf(testname, sizeof(testname), "%s/struct", testname_prefix);
         args = g_malloc0(sizeof(*args));
         args->ops = ops;
         args->test_data = NULL;
         g_test_add_data_func(testname, args, test_struct);
 
-        sprintf(testname, "%s/nested_struct", testname_prefix);
+        snprintf(testname, sizeof(testname),
+                 "%s/nested_struct", testname_prefix);
         args = g_malloc0(sizeof(*args));
         args->ops = ops;
         args->test_data = NULL;
@@ -1057,7 +1059,8 @@ static void add_visitor_type(const SerializeOps *ops)
     }
 
     if (ops->caps & VCAP_LISTS) {
-        sprintf(testname, "%s/nested_struct_list", testname_prefix);
+        snprintf(testname, sizeof(testname),
+                 "%s/nested_struct_list", testname_prefix);
         args = g_malloc0(sizeof(*args));
         args->ops = ops;
         args->test_data = NULL;
@@ -1067,8 +1070,8 @@ static void add_visitor_type(const SerializeOps *ops)
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


