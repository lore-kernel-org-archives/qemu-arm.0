Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E35606A8AA
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 18:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TrvGaz+o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B5q6D8e5
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRZGI-0002Am-Hk; Thu, 12 Nov 2026 13:11:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRZFJ-0000sM-G7
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 13:10:02 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRZFH-0006Va-2Q
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 13:10:00 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACFZqta657629
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 18:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 T+BUoXt5tn4PGluBlPDbHpmyBXj6a91GEDmrMsa5S2Q=; b=TrvGaz+o9IFsmgFj
 ALfWU0btoVj1UXdgypacTtM2ZkBSu8X8UgEEuRwdWTcuCf/Byc2/E+UnUfW4sD5N
 i2sbaFt89PZDnQpeW1dQW7EpGWotPbK59UuVUwGoJzVeFgtlqQRlglqnlGeurS4C
 Q0ohHdI68DaD4HohYTQ7PZkc05Pu9pPVA8gCFdXNOmHKftj/dSabYp6cOinx2syH
 xR0Dq7rJ5IVTyn6xOESO9zbIPekhrTwjiI3BT6GOVhE2H8UkIcST4LFZxsO8iYDw
 2eEPRjkpLkxWzFsOQ7P4iaLpQUoYH0nN84Br1Wcfbe7WC6W1CJv15sUJoxDJyq87
 tvPAYA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yujvjs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 18:09:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93caf7856ffso1469585a.3
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 10:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794506997; x=1795111797; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=T+BUoXt5tn4PGluBlPDbHpmyBXj6a91GEDmrMsa5S2Q=;
 b=B5q6D8e5WBNNq1sTwqNWmC7HEBjLgoDc2OhgjbwgG4R+FQQEbty0GuJZIADdKKVL/2
 vT7FLnPLptSPin4iXM/BFRL9Wioun0t06DF/hFhb0onIqxUj17FUmh3eyGhdeUMeELux
 A9aYdGEN/CyGNqb5MmosvKmDS/jjrE+hzAe5wVAekv+VuTxYnganol9uaH3utdPxXTKm
 fzqj3Mhbjr/sVzGX8zk5fGwWuZGI7TE6hV518TVeCfzJjfE8NQ0O1j0Yfa/Rx9n4Qrju
 g9jnfi/3sZzy9EulytK/2x+bVWgIWYal39s5FXh0qyzCwxpcpsWuowlyDO79AeMyl7lr
 DmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794506997; x=1795111797;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=T+BUoXt5tn4PGluBlPDbHpmyBXj6a91GEDmrMsa5S2Q=;
 b=s9/fvpsO24WCVDkFpTLMug8Clba5Txq8iOKOX5EIh3u0Txm9uDfjAc8sMEGRExmSZo
 2mvbFJSdTZOwwsh7QglGp6EsEUAz0ffVXxeRD3XeQRaS+xZ9s4Qc6jP4S2++VXkUPzbw
 sPhZAxfUh/pyGLYUkt96ZTDukZIdmBHuFej1tvGwzhX6uTgGhtjcxxkjodDTQo3RLCLr
 2Y+Z64CdseUdsIFe7k3pinZw/ZuTyjPBea5waJqnD+DpACFPOvcWmPQDUDRR8wUMRDM3
 ono3x2acJzLI2rB5l4U6gr9PpBlp1b5UzYEMIYaRTD2ZMqp1yaUgCgPuSu/Czgq+RgI6
 pqAA==
X-Forwarded-Encrypted: i=1;
 AL+hErEaDkhLLpArh9NN2SJ79GxMkTJVrATDF3awI1W+zqbJg9RCh3P29TBJVuWWhv4yzHE3onFdzlYfsA==@nongnu.org
X-Gm-Message-State: APuU4Z80s8nZO20iJzfubwjwnodvOkisVkJqB4ccTRHyFTR00tkviPBx
 78IYpnVXfLH/m+KBW5ua+xkxvSJtN81qxCMHdURqFCnxHgOvq+6ovxK8sJx0isbIRcBPXrFBdE/
 /cB/XEJhZ66gmSPkCETL97mB0mknryMH522N8Fm+A78KCDWrgl01Z26I=
X-Gm-Gg: AYBFou0QTwWBoJgXZrFYRBshoog/Q23RNwVDZKZueGD9CvcGbGS7WcfPRsjcrM0vXjP
 7lGgmrm08M4TyxZ/AWhFv+pzNdb5bSx7zrIEsMF7McwgmEv6Oqb0QePCegSbkuXxNb/a9irHaZw
 RIMplqIl/fPFGd0F6nNpDorW8WjyfMW/0hx1+MO32s2x5FRyhnYRlvMw2h1bN/JsAzqC/NqaE72
 3rTPpKDoS1WUZd5QnplU7PARO5lFc9iSTXhTAB4ikU0z9BpiGdg3/egPaclANoccMlb99ZOQNWS
 K/Abu+NO26qwLAmxFz6orW46hbnm5VZkVAFvLZ4X+joMbJhBCK5U55Z5VTJk723Nb4GsWcqQrro
 RIz6z/crcuBgTb8GUg084TETtiO5ccfOn0qGU/e+TfHAea8r09eBnS3qGCIWsKGlE5SzsTxYLrd
 5dcPTt4YbxVw+sGg==
X-Received: by 2002:a05:620a:600e:b0:93c:8544:6ad8 with SMTP id
 af79cd13be357-9494bbb3d9fmr33848785a.28.1794506996562; 
 Thu, 12 Nov 2026 10:09:56 -0800 (PST)
X-Received: by 2002:a05:620a:600e:b0:93c:8544:6ad8 with SMTP id
 af79cd13be357-9494bbb3d9fmr33842185a.28.1794506996044; 
 Thu, 12 Nov 2026 10:09:56 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c60f8d615sm545588f8f.56.2026.11.12.10.09.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Nov 2026 10:09:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 devel@lists.libvirt.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org
Subject: [PATCH-for-12.0 v2 07/12] target-info: Support runtime-endian
 Linux-user targets
Date: Thu, 12 Nov 2026 19:08:53 +0100
Message-ID: <20261112180859.85380-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261112180859.85380-1-philmd@oss.qualcomm.com>
References: <20261112180859.85380-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: A8afLvcctuVrciLMSzFtuWIEY3shp04P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfX84IzUXwWO1DI
 U96496KMrm9dxOUiAszyVozVgFLQun03ygfuZpzzLcgxcVg7fTcrYlWitg5moshWWwQCQ37hoF/
 ziptJ+uazzhlcDsaqYQuJHq6qodjNFA=
X-Proofpoint-ORIG-GUID: A8afLvcctuVrciLMSzFtuWIEY3shp04P
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af600f5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=oRXqm_aVrHWTxU2XlOwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfXxkMtinQ8F5ms
 WFY8LQrOumcmW4Xc1W/O9DSgfJeyQUKW4n9FvuV0f4V6B5RGmFV27yPjS3ntqAMRR7PcI2eM5x9
 irVXPOzwlgNRjcCSz+6tk9gtfLElk8WaJ4AeKk4e2J6ierxRNEScfaXSBXqGBTdi0CbtZvN3hrs
 YzW1gza8pdbCJohfVfwmSM9V2lNoIdr0YvaPbbh2w5LjxEDFSaFj31z6B7ufdXE35lc90kCa0/S
 BGShzICLn4laqncss93/rf8bhB2MuCB/DfS9yGGdbaryA/g1X3t4ZcBO2Ie1EN82QtKek0xjSf4
 xl+qFwZXVevKIUBJkl0D9jZGNcUYPaXMd5DSemWiermIIqIJCQp3pSzuHXU6ccADWyhWVrVJ8WA
 js9PFCwTi4Y7I1TpGbLavRHmYIc+HaApXZ11crk0e0mkiqNV4v6rSJ5evdvF33yLFORe2890Bb5
 AvpmsTPY8tJHkmOGHrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120072
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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


