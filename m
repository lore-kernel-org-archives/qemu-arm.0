Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE74C624CF
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 09:56:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1LAp-0007Uc-IT; Tue, 01 Sep 2026 05:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LAo-0007UF-9S
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:52:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LAm-0007Fs-CY
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:52:58 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 681797su1211406
 for <qemu-arm@nongnu.org>; Tue, 1 Sep 2026 09:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aim88kbyx4mLrKFfSdKR/nIKrzOmFcmOxoRL9bSxY1A=; b=NqivMWtn1pH5O6mw
 l57LF6CKzcTONVL3A78xQjkjBYOqBxdFQr1NIa8xEgX7ELrc6BfDuJ/xca0VcgOD
 SxMa6eFymyLpZUE1FBkZYHS0d+1Oi3Vr/f04NVTKOKwGZb1W3dzDBkqLDw1fitl4
 ptyZazhCRnyMO2QUeES3B6monnTavSXvTgmA/jbfob1a93F18B+9o/dGkvoXJrWq
 5i2ycrYT8gBroLEgUArYembhW5NQWwrKeci2y1spicb3F2CCl1Zxzf1/6NPTEODs
 ACglKLx0R2ZdSLwqMy96OfvN64pF4GfO4g4IL+PA464npaT7ZsokVIx+8LaJaUfw
 ThUv0Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8svuk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 09:52:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-9393ac4961fso87668485a.2
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 02:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788256374; x=1788861174; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=aim88kbyx4mLrKFfSdKR/nIKrzOmFcmOxoRL9bSxY1A=;
 b=S6ZxnSknp62KRAgWzC81470jzU5uyiJVdRctwVR/vfgh++vzCtkO2O1p7QGC9SLxSt
 Gfpq1K32K4gY2JyjwI0G51kg11172CI5AP58mW+Ta9UomDGAyvQ9e+T13g0X2KGhrZog
 ktVxvpUYHVK/WgKTcTc4Aq7IlqDEBRaeFxpM/fn1OGNfpmEgM7e7vXhCrt8MuSNtapVu
 Pul92mMSkTaVre3NumUFK4z+lZYMY8j+RKUoMY/5FFMArtMBegs1ISpTCr82K+CfM4Lz
 yE7vB7xU2rePQ4ImVKkAd4Fj4w7VLRxmUDisbzNNw9Jf5O9Wa8chYzIUkJiLyutjxyPa
 Si/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788256374; x=1788861174;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=aim88kbyx4mLrKFfSdKR/nIKrzOmFcmOxoRL9bSxY1A=;
 b=IGL8E8YTKte3eyxD/JdXFUdnKqZ+kaWFiJhBemHiIUE4PAcagCVGBMfma7ofPKcpg6
 Hh6WAednn8xBXa66Ub7oewZ035zrS1P/kCAhPkEWrzRd/6f/J2HIkCZgpYomDzWRN/5D
 ieS4xAO3Rv0IT09GswxZ3segexm09KH69hQj2Xlq/1vrZRhoWm4rCcLQhkk3wcZXyJRh
 DZBGxSIaJ3p6vP5bLYRSuRsyDnzx2t3tSz8xR0vlcFbMcO6RBSSWDudnHWDYb8b4/WvX
 ATsFcmeWuoEWJereTi4AiwtE/L9VzCTVaVViY/ewSFlomXCaEYeKXX57mxs3pWlfh8c7
 wh+w==
X-Forwarded-Encrypted: i=1;
 AHgh+RqG2D0jvT4ShKo+4JG/FFGMYbbyTNVoYZYUS52/FwjYM92dZJqzrBTxLWPC5kLZoVKl3HL3jBy0gQ==@nongnu.org
X-Gm-Message-State: AFuF++kMC6iXqaX32SL3MwU5dhUEZNVwl2qbGpqXt9PzbrenLJ6niaYo
 s63N42CvF1xu1uKeB0EdKyFdSZ0+m2yqAx7+RSmIzLRBpww3e2Dk0ciVMMdsau+rWXo3gKTI3g9
 LIcBVpda5wfOmXMpQ6taVH/8r+WxMTibFOQP1lItwnoRWZysyqrAwy1jgB+ib5ng=
X-Gm-Gg: AR+sD119nLtVIrU/GuE3Th7U7pC75uDYB3pJ/0GkamtuoWGme8fif1G3WoNQfCDzKAt
 nFtQ+i1Dizb53Dfw5KoONOdBhOnjEDUt6iCVInnZI17lpXyL6L9jU/l96MKq/UuNWvvOBrdyixj
 L55zJc/URBeH9PnNmIAGl4ZoYzKpOjdZ5vKHSF06uwJZ6Dynn7cP3OJT/YVGwHiEW6tNZeQ4iSV
 mhj9hsOiZ7BUnym53z2soaARpbfGnpMrHnGYQOd4dVvfvNwS1ZsjHy9rT2tf6cdeexxKMe9HYE9
 xKP5/6hlfbooIFnGQtkbMU9b71mSCdmC4MYz6J6X8iOvZ2vYEeeXdsfKgrIdjJu3FMkR/aW1ijg
 eY618tj1wb0bEYMgC5GovY1c9zi+Z47esmBt0dMxk
X-Received: by 2002:a05:620a:8904:b0:939:10f7:1a41 with SMTP id
 af79cd13be357-9391377aa01mr3722001085a.3.1788256373805; 
 Tue, 01 Sep 2026 02:52:53 -0700 (PDT)
X-Received: by 2002:a05:620a:8904:b0:939:10f7:1a41 with SMTP id
 af79cd13be357-9391377aa01mr3721994385a.3.1788256373143; 
 Tue, 01 Sep 2026 02:52:53 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b9266be71sm735858625e9.2.2026.09.01.02.52.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Sep 2026 02:52:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Subject: [PATCH v5 03/21] cpus: Add const-qualified CPU environment accessors
Date: Tue,  1 Sep 2026 11:52:09 +0200
Message-ID: <20260901095229.72018-4-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901095229.72018-1-philmd@oss.qualcomm.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96a077 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=x16qC-9I3E3lrIGWYX0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX9pzofxE/qrmV
 8eO8tso+qwH6DuS7XkM2JNsz1nmLk+e1LBpTtZbUKcPIm02pg4jJaLcCopwNh00fJrb2eNkLEOi
 Po5dtorhKyQD4pPaPeOoTUdVn7coLcj/LUiY+CcBGW09E5A8r08EoA0vFVEEJj89DVQS0TV5lWb
 XvTOWbnTpzRDGKE59VrFnqsU7NJHxjAS/API7rbZdh5VA/IaQ8qKBhfnoyEeIjnJWeLeZ7J0dgZ
 oKOG5+Xv1u4ggtcLxZAe68C2ueVHxogCiqGXzG/zHqfcmEcYbrNwOyUB7O4bR/pWikIr2/BAE1I
 eS8u1rRAKHq67zlYEJBfFIOW34Q+K58d5HOJqThIJWhtyn/KEHVf+SxJraKz0gi1AfWp3tLG2Tj
 EenKjI+/5x1c7NwQahRjdizkV6I7t/rQwJX/iCK4JgqsQebe1sj4tZ41ji+Zwvp21no+/zIE55R
 ZrdbmxrKc1MXbttc71w==
X-Proofpoint-ORIG-GUID: mvL0Q58194rYo9kXbILL-5Rj9W7h0Inm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfXwhy/a4nzv6vz
 BC03K3840V45cUCoHIs5bTvhpF5Wpl6khYNVTXujcr1+oqFkjdfCQv8pOhE1N9wJiGTV5dB3cF1
 ib1nIqy44SniFp6W86YS5Rw3gCtf9gs=
X-Proofpoint-GUID: mvL0Q58194rYo9kXbILL-5Rj9W7h0Inm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010087
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Use _Generic() controlling-expression to add the const-qualified
variants of cpu_env(), env_cpu() and env_archcpu(). This allows to
safely access CPU architecture state when it should not be modified.

Alias env_cpu_const() which is still used.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
Following checkpatch.pl errors ignored:

  ERROR: spaces required around that ':' (ctx:VxE)
  #46: FILE: include/exec/cpu-common.h:89:
  +            CPUArchState: \
                           ^
  ERROR: spaces required around that ':' (ctx:VxE)
  #62: FILE: include/exec/cpu-common.h:101:
  +            CPUArchState: \
                           ^
  ERROR: spaces required around that ':' (ctx:VxE)
  #90: FILE: include/hw/core/cpu.h:605:
  +        CPUState: \
                   ^
  total: 3 errors, 0 warnings, 64 lines checked
---
 include/exec/cpu-common.h | 30 +++++++++++-------------------
 include/hw/core/cpu.h     | 17 ++++++++++++-----
 2 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6594f7fa1be..60997628cc6 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -85,21 +85,11 @@ static inline bool cpu_loop_exit_requested(const CPUState *cpu)
  *
  * Return the ArchCPU associated with the environment.
  */
-static inline ArchCPU *env_archcpu(CPUArchState *env)
-{
-    return (void *)env - sizeof(CPUState);
-}
-
-/**
- * env_cpu_const(env)
- * @env: The architecture environment
- *
- * Return the CPUState associated with the environment.
- */
-static inline const CPUState *env_cpu_const(const CPUArchState *env)
-{
-    return (void *)env - sizeof(CPUState);
-}
+#define env_archcpu(env) _Generic(env, \
+            CPUArchState *: \
+                (ArchCPU *)((void *)env - sizeof(CPUState)), \
+            const CPUArchState *: \
+                (const ArchCPU *)((const void *)env - sizeof(CPUState)))
 
 /**
  * env_cpu(env)
@@ -107,9 +97,11 @@ static inline const CPUState *env_cpu_const(const CPUArchState *env)
  *
  * Return the CPUState associated with the environment.
  */
-static inline CPUState *env_cpu(CPUArchState *env)
-{
-    return (CPUState *)env_cpu_const(env);
-}
+#define env_cpu(env) _Generic(env, \
+            CPUArchState *: \
+                (CPUState *)((void *)(env) - sizeof(CPUState)), \
+            const CPUArchState *: \
+                (const CPUState *)((const void *)(env) - sizeof(CPUState)))
+#define env_cpu_const(cpu) env_cpu(cpu)
 
 #endif /* CPU_COMMON_H */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 81af7b9ee1a..18970ea39f5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -594,11 +594,18 @@ struct CPUState {
 QEMU_BUILD_BUG_ON(offsetof(CPUState, neg) !=
                   sizeof(CPUState) - sizeof(CPUNegativeOffsetState));
 
-static inline CPUArchState *cpu_env(CPUState *cpu)
-{
-    /* We validate that CPUArchState follows CPUState in cpu-target.c */
-    return (CPUArchState *)(cpu + 1);
-}
+/**
+ * cpu_env(cpu)
+ * @cpu: The vCPU
+ *
+ * Return the CPUArchState associated with the CPU.
+ */
+#define cpu_env(cpu) _Generic(cpu, \
+    /* We validate that CPUArchState follows CPUState in target-info-stub.c */ \
+    CPUState *: \
+        (CPUArchState *)((cpu) + 1), \
+    const CPUState *: \
+        (const CPUArchState *)((cpu) + 1))
 
 #ifdef CONFIG_TCG
 /*
-- 
2.53.0


