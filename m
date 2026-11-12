Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662C6606A321
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 14:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1BhGW3p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I1dKmjUr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRVPy-0006mA-CI; Thu, 12 Nov 2026 09:04:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRVPb-0006Ud-Sr
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 09:04:28 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRVPZ-0007TB-VW
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 09:04:23 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACAfO071954166
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 14:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 T+BUoXt5tn4PGluBlPDbHpmyBXj6a91GEDmrMsa5S2Q=; b=d1BhGW3pLnzHBsb/
 I1gqXd/YJZ9t0Wh3BE9E4fgzOJ3mfOZVaWlFNM2WISOjUfr9EIm0cuhHrkQN28MY
 VdsRu02wE0FrpvgC7Lyuk7CAZBRk59IsspMeGlkqQef078DhOX03KKJm9SOGd1PV
 t7JyL+KBrTja40tnrsbwGBs+Bx7dXElpjSWtChgITJ73InzOikLLDaCteGiWE3r6
 7Er0GqkIxpiFRtfJ9McX7InDvsOZ66hfl9M8iBVHdqDj4+jiNYFDQWvUzaSxygb1
 FclaBXl1aa4gH9p+wIIkJvlq7xU0643fQHAD5TFtIaUodP6hWFej9ihAVC4anBB1
 bfDIBw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx30nyr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 14:04:20 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-5ece5510b79so3735479e0c.1
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 06:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794492259; x=1795097059; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=T+BUoXt5tn4PGluBlPDbHpmyBXj6a91GEDmrMsa5S2Q=;
 b=I1dKmjUrLwi47FzAlZpdWJDXkxxzJWNTWw9AUpep3jBjKMl/aS8iSRMsf1dpM5XcP1
 p1bvXNZOKgV3E0qv45Ic72t59TOFoYqt43N15BUnMomeqyyZElqr5MXcgEIoGKuiJEKQ
 nutlcCHdIR6h4AhvBx0U4F1Z/uEU66At2MrWjrJiIXk96Tz1IdB88S/65PfJPgLoWE5f
 d+PV+b1FHtR8R1JOVI0Ex1TJBK2r8PB6KU3cORfnEmUgHifDSrMoClbkr8HfuAbL7SGp
 /3cTZX0Dm5Uec00+q4ttNoA9/aAmPSl2khWC1IKc/Ty4J9wMaoT2eETxX8/4lyb0GQ2+
 56ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794492259; x=1795097059;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=T+BUoXt5tn4PGluBlPDbHpmyBXj6a91GEDmrMsa5S2Q=;
 b=dBk6IvtAW2XubRaO5sO1KLwfZIAB0VSLDocZ3ILh0JqPERugUYPv7k2V/sUVx4HlBB
 NKpPlFy/SS5fRF0Do8VaItK/bti+3wf8QpBh1PEO1o0VUmrE4PF6DWkXW1KIbXxWhQwV
 zEHMq7NOqz2+5sYn9D9tyJW6o/zyV8OkRz9EGXdGwuvTczGEJs+cPUghXfFby8hlRYVV
 4+i5NAobjIB4hNat7zmc4vvNaZkeSXJ8rqfyI8EWL5Z0N5u8hrO0UeKPVcbhAgwWL2Db
 pIiCXbnn168+3ui23N/6EH/Unqs7SGMMLr6XLyM78yCS+Xjc7Yxc4qkvkjtK8lGhIsZ6
 nr3A==
X-Forwarded-Encrypted: i=1;
 AL+hErEPhSsxixkiC+IpJtCIZdgEZ/hRarfqDBiywfSjBE8/A3UN4PASQPezNVUyO1UQTTOBx3nvxDUUjQ==@nongnu.org
X-Gm-Message-State: APuU4Z+hISoXZDMXGYWbtloBR/f0MPTm+EmDXRfmi4xJly3R6mo1VNIZ
 kHuOY0Vg28oPD23oZXe0KYqpjWf5b/P5vRsaP+c7BDIf7KJOzaufZurHwgXtNB49KnVbkUv6Ehe
 Y/9F99drG+eho/ygVfhGKsaYA5VpapWyd8pnB8jpuYxSpjyWhaWv5r3o=
X-Gm-Gg: AYBFou31LXj11kmkLEytxJ7+5wAkL2ErOV5z5x1xEmEpciLLaiyu+yrnIzAg5skY5fX
 qam32slOGt3yJXmY/q1hDxuDEbkXjdJzGhiLNCriqQa2YviL8UQuOSwV4dnxRrGPIOdgBujC8OL
 UE2L1pmwMeWmPDt1EEg9BrgCqofUhJt2yKxDcuqNbvw+590jQPB96/eV6FTXEFLCbCPFis9fuf2
 oYW1ypzWyCTbDIRB0Uq2yDSOje3+IJkleYvvvEItR6fMLMiblHNVzQcYNDrkIls9XUpsQ6UU0Tg
 uC/djenXmmYseyBbrO/HKH6G/jdN5fBCe6RlJ/GV27cO7GQKEDC+ReXfq3EShhUxtVJEPeEXRo/
 iR41g+KV7gZN95DNeUSAYEjnfZ+Wa/FRgXf6XjjUjDzMIQI3YNrzOX+JcOe4PXWR8wAT0E2dl9P
 +fQwv+qO+idoL+7g==
X-Received: by 2002:a05:6122:512:b0:5ea:e052:2ef0 with SMTP id
 71dfb90a1353d-5ee1c3ff521mr2403387e0c.9.1794492258754; 
 Thu, 12 Nov 2026 06:04:18 -0800 (PST)
X-Received: by 2002:a05:6122:512:b0:5ea:e052:2ef0 with SMTP id
 71dfb90a1353d-5ee1c3ff521mr2403318e0c.9.1794492258066; 
 Thu, 12 Nov 2026 06:04:18 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e271378sm81450395e9.13.2026.11.12.06.04.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Nov 2026 06:04:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, devel@lists.libvirt.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH-for-12.0 4/8] target-info: Support runtime-endian Linux-user
 targets
Date: Thu, 12 Nov 2026 15:03:39 +0100
Message-ID: <20261112140343.61634-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261112140343.61634-1-philmd@oss.qualcomm.com>
References: <20261112140343.61634-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af5c764 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=oRXqm_aVrHWTxU2XlOwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NSBTYWx0ZWRfX/mHGHFyX8pZx
 y/Xt/VwquL1fYNwDt8Rw4qOAxJuuitYSR4tLmZs29tlNdwhz6Eb5DgfLyhQ2txGVzr4Zg5LiBV8
 6dJO+3qW8kKDgvwDNXd52oBJZEV4lXsdw+VcbPKyiRUaqVQweoqISV4LJCkYXNS2WIeMte1jjf0
 qcPiZ2LPztCaU5YrTF6DqsKTECqGdFNRT3VjZbUXvFZ/z+DHJTDgQpCKzxNTZ8YXk1f2aEaM+JR
 7pAtI8qYdHvQ1iCUhwjmvzqbOx6tDzR7kyeuyIvvB2N9/8ytdwkj2JJ+I8Vdq4UcKejofz46vsh
 Wo1lgYizipab05+mSzKFk28loTxU1+iy35MTLlwW7KMHesPnnsxch+aGC3G2U7cjDINksO5BUtg
 pa8u3DJfQq6QVqyesLN7vt8L0xDEQXe8V93/qMCEohNKMY1HMVNztjo+RfT5FydmKMVjiAsndcD
 ZwgysuqqXKNd++AXSDQ==
X-Proofpoint-ORIG-GUID: d0n2WE8IW7_5Q7MTcYY1CBxUSOdQTZcK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NSBTYWx0ZWRfX3UZwc72yEVOh
 f72ZLpwaB2kVQtC8Mf1LuS+AN3bmx1gabsWRzDzeejc4jLyQ0OkqM3eoNNZp5hwI0qm+vrGwvfr
 pOUVphDOH9GcmMHMCl/OKriFHlU8MLU=
X-Proofpoint-GUID: d0n2WE8IW7_5Q7MTcYY1CBxUSOdQTZcK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120055
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

Add a write-once ABI byte-order setter for runtime-endian Linux-user
targets.

Expose const data to readers and inline runtime endian checks, keeping
its writable initializer outside LTO.

Retain immutable data and compile-time byte swapping for fixed-endian
targets. Restrict TARGET_RUNTIME_ENDIAN to Linux-user configurations.

Inspired-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 meson.build                    | 26 ++++++++++++++++++++++++--
 include/exec/tswap.h           | 11 +++++++----
 include/qemu/target-info-def.h | 14 ++++++++++++++
 include/qemu/target-info.h     | 20 ++++++++++++++++++++
 target-info-def.c              | 19 +++++++++++++++++++
 5 files changed, 84 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index d7bcb581c181..04cf5d77f188 100644
--- a/meson.build
+++ b/meson.build
@@ -3342,6 +3342,11 @@ foreach target : target_dirs
 
   config_target += keyval.load('configs/targets' / target + '.mak')
 
+  if 'TARGET_RUNTIME_ENDIAN' in config_target
+    assert(target.endswith('linux-user'),
+           'Runtime target endianness is only supported for Linux-user')
+  endif
+
   target_kconfig = []
   foreach sym: accelerators
     if sym == 'CONFIG_TCG' or target in accelerator_targets.get(sym, [])
@@ -4400,8 +4405,6 @@ foreach target : target_dirs
     endif
   endif
 
-  arch_srcs += files('target-info-def.c')
-
   if target_base_arch in target_arch
     t = target_arch[target_base_arch].apply(config_target, strict: false)
     arch_srcs += t.sources()
@@ -4470,6 +4473,25 @@ foreach target : target_dirs
     lib_deps += dep.partial_dependency(compile_args: true, includes: true)
   endforeach
 
+  # Keep the writable runtime-endian definition opaque to const readers,
+  # as for page-vary-common.c above.
+  target_info = files('target-info-def.c')
+  if get_option('b_lto') and 'TARGET_RUNTIME_ENDIAN' in config_target
+    target_info_flags = ['-fno-lto']
+    if get_option('cfi')
+      target_info_flags += '-fno-sanitize=cfi-icall'
+    endif
+    target_info = static_library('target-info-' + target,
+                                sources: target_info + genh + config_target_h[target],
+                                dependencies: lib_deps,
+                                include_directories: target_inc,
+                                c_args: c_args + target_info_flags,
+                                build_by_default: false)
+    objects += target_info.extract_all_objects(recursive: false)
+  else
+    arch_srcs += target_info
+  endif
+
   lib = static_library('qemu-' + target,
                  sources: arch_srcs + genh,
                  dependencies: lib_deps,
diff --git a/include/exec/tswap.h b/include/exec/tswap.h
index 17ac5444544d..869619bac314 100644
--- a/include/exec/tswap.h
+++ b/include/exec/tswap.h
@@ -13,14 +13,17 @@
 #include "hw/core/cpu.h"
 
 /*
- * If we're in target-specific code, we can hard-code the swapping
- * condition, otherwise we have to do (slower) run-time checks.
+ * For fixed-endian target-specific code, hard-code the swapping condition.
+ * Otherwise use run-time checks.
  */
 #ifdef COMPILING_PER_TARGET
+#ifndef TARGET_RUNTIME_ENDIAN
 #define target_needs_bswap()  (HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN)
-#else
+#endif
+#endif
+#ifndef target_needs_bswap
 #define target_needs_bswap()  (HOST_BIG_ENDIAN != target_big_endian())
-#endif /* COMPILING_PER_TARGET */
+#endif
 
 #if defined(CONFIG_USER_ONLY) \
     || !defined(TARGET_NOT_USING_LEGACY_NATIVE_ENDIAN_API)
diff --git a/include/qemu/target-info-def.h b/include/qemu/target-info-def.h
index 8019d2c7196e..34058955edec 100644
--- a/include/qemu/target-info-def.h
+++ b/include/qemu/target-info-def.h
@@ -32,6 +32,20 @@ typedef struct TargetInfo {
     bool page_bits_vary;
 } TargetInfo;
 
+#ifdef COMPILING_PER_TARGET
+#ifdef TARGET_RUNTIME_ENDIAN
+/*
+ * Linux-user selects the ELF byte order before creating CPUs or guest threads.
+ * The data is then immutable; its writable definition must stay outside LTO.
+ */
+#ifdef IN_TARGET_INFO_DEF
+extern TargetInfo target_info_stub;
+#else
+extern const TargetInfo target_info_stub;
+#endif
+#endif
+#endif
+
 /**
  * target_info:
  *
diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index 2cd4cc5671b5..6ed4cfda8d7b 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -9,6 +9,12 @@
 #ifndef QEMU_TARGET_INFO_H
 #define QEMU_TARGET_INFO_H
 
+#ifdef COMPILING_PER_TARGET
+#ifdef TARGET_RUNTIME_ENDIAN
+#include "qemu/target-info-def.h"
+#endif
+#endif
+
 /**
  * target_name:
  *
@@ -40,7 +46,21 @@ const char *target_cpu_type(void);
  * the target, so please do *not* use this function unless you  know very
  * well what you are doing!
  */
+#ifdef COMPILING_PER_TARGET
+#ifdef TARGET_RUNTIME_ENDIAN
+static inline bool target_big_endian(void)
+{
+    return target_info_stub.endianness == ENDIAN_MODE_BIG;
+}
+
+/* Select the Linux-user ABI byte order once, before CPUs or guest threads. */
+void target_set_big_endian(bool big_endian);
+#else
 bool target_big_endian(void);
+#endif
+#else
+bool target_big_endian(void);
+#endif
 
 /**
  * target_heterogeneous:
diff --git a/target-info-def.c b/target-info-def.c
index bcf9cfe1e437..7580993e0bb3 100644
--- a/target-info-def.c
+++ b/target-info-def.c
@@ -6,6 +6,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
+#define IN_TARGET_INFO_DEF 1
+
 #include "qemu/osdep.h"
 #include "qemu/target-info.h"
 #include "qemu/target-info-def.h"
@@ -24,7 +26,12 @@ QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) != sizeof(CPUState));
 QEMU_BUILD_BUG_ON(TARGET_PAGE_BITS < TARGET_PAGE_BITS_MIN);
 #endif
 
+#ifdef TARGET_RUNTIME_ENDIAN
+/* This writable definition must not be compiled with -flto. */
+TargetInfo target_info_stub = {
+#else
 static const TargetInfo target_info_stub = {
+#endif
     .target_name = TARGET_NAME,
     .target_arch = glue(SYS_EMU_TARGET_, TARGET_ARCH_VARIANT),
     .long_bits = TARGET_LONG_BITS,
@@ -42,3 +49,15 @@ static const TargetInfo target_info_stub = {
 };
 
 target_info_init(target_info_stub)
+
+#ifdef TARGET_RUNTIME_ENDIAN
+void target_set_big_endian(bool big_endian)
+{
+    static bool endian_decided;
+
+    assert(!endian_decided);
+    endian_decided = true;
+    target_info_stub.endianness = big_endian ? ENDIAN_MODE_BIG
+                                             : ENDIAN_MODE_LITTLE;
+}
+#endif
-- 
2.55.0


