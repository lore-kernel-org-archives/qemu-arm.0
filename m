Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C26660A2610
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 14:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ezJd4Hq7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b8oktyha
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRVPP-0006N1-SX; Thu, 12 Nov 2026 09:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRVPL-0006J7-TK
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 09:04:08 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRVPK-0007Qs-3g
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 09:04:07 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACAUUDD1629167
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 14:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F+yrVZEjze+e/2Of60uDFwn+N5jFGPC6Av8hbHxv1mg=; b=ezJd4Hq7RZJ0kB1Q
 eulr404Yzo1n6m31Ism+k8tBsy9zrPJ7jQ1VOx2DAUkoJj4EBkYdoPl6yEwEPjJA
 u1cG01axESRgok8g1kWcQgDcdYajFb653EfPmv9TkEIrN7EyiguxbJhAZuo6y42H
 nmo0ArGnoYEIXnygM3eURqBRBvKvAlQ4msZfKLddh+qv0YwEPh8B2jjwgs6RKS4j
 ZJu1z0AG091q52MM1UQEfkxyCU2eW52YdSFUlDxUfQVCeOzcV2fGZ3bMuZameeiH
 KP1MwInOb4pF+b8p7pFnyaLnOwvVg+vnyBL3Urypdiye6k9895iY4Sk4OuCz/b0y
 2E9Pog==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs00q55-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 14:04:05 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-5ee0977403bso3556994e0c.0
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 06:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794492244; x=1795097044; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=F+yrVZEjze+e/2Of60uDFwn+N5jFGPC6Av8hbHxv1mg=;
 b=b8oktyhavJdj+gG1o3Jl++joCdyhFtLE79MsqZ9us38p7mBlKC0pMd4cELC+KEplk2
 p2ztg/lDmLtmzPnsdbe/GMo7c9oZ3bpaOo+8zFoTq8V3YyVN0tMDZRLEUpITYY7aGSMK
 kGScGQ8VoTyUfDRcHp00kYVRk5cJPUsPQEjq4zJD5JbMzFdc/rTUunyA6fKqQQ4E9DlB
 i8nZYFSc511Ypq6eBsaGwXpvvuE78YwIDwxD3sNbqT0Tk+3oKSZ3q9PxcKGe1VUjreds
 42dw+1Qva5rRfaIMzvWrflE0yLcCq0OW4MJwOZgtFCXh1om3y+GMoTNxNiJ6UFJojQvJ
 fDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794492244; x=1795097044;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=F+yrVZEjze+e/2Of60uDFwn+N5jFGPC6Av8hbHxv1mg=;
 b=Gz+dMU8hrlSNmUTsRSaJZMjkuvu5ddK7sCZx8gK2aBK7XsR85izFokEuph3Q9N85Fe
 VCXtJiUhQ81MxxDHprJci9wACvtg0WFAMyRuwtv/akGFmyybCExhcj/xYalHFUWMGnY3
 HipMjO9xpD3x9ZjY8WTHBQ9ROOMjo4ETFpg2DUqE4+e34RyX9UOhMsLEAmDrjt9DPJp5
 /OmhBn24ce9Kzd8qDoxn1W48il+nso/OPyro7Lyuz59jZSYozFY+A427/iTSBY37LwrN
 UYASa8xGhvboq2ZLhvUmDuRdOxyAhlx+cczQTMLwY1dZf8J52zueMd3Hgm2ZP/lSNkFl
 dGBA==
X-Forwarded-Encrypted: i=1;
 AL+hErEf5IDs3fc0DCU8Ght1VREW/e+nQs0l2yc6swnStOP9KYZuAHyQhP5HfFriGaBZxynErs/Dc51pmQ==@nongnu.org
X-Gm-Message-State: APuU4Z95ufbkD66W4nJjEqlvn5SoT+T4IivUPKcO3mv7ozzm3vtzPBfu
 bHtOZRboXclbhRwSgAYHaMdn8SF27/+JPVQBLe56ncMsiJ7m5Jy0VmvrvBz8IX8L5M0Yhz8QDlw
 G2JFcCBooEJZux3y3NXxKxgcdVNGeauC0Q2PMDHrZMvN4e6qsaVH5yFo=
X-Gm-Gg: AYBFou0bJBkmMHgJg1nHyoYbZ8Aucyb/uwr+HJytsT7O7N7SFc9997Yj6QqiUqVyZm6
 kgwkaOEOw4JtfV6oJ5HzPVF6EXJaz/P7CmBLW0WDulxrb9NkNY6ie7YYwBAFeLugX/4qhWObbyR
 WKbfTj1trHnycBh5jzs6QFHKz6eTk6CBmMpilzAroch2dMNA2CUKDYVNoMNQVPMEvx8mQNKCIyb
 h1SzDOjSbPCCwNMMX8MFAliaGCf4RF6MEmu4cRR7ZKizKsm6JJaFhEuf1clXitlQruyCOaduvhd
 agtCwPmTcHpcfQqLem4dvs8QDoUMQ3sBCF+GCvHnCSW01xrPSHXSVnxE9YA16SRUOamR6fNvGE7
 s0TXW+iRicsPosq0sbMvgnY72j6iCtyQTYqgEteAhSClKh2hrtKZraqLa/WXONN8+JmTKPUHaVr
 /XntniqzJ51Rh3cQ==
X-Received: by 2002:a05:6122:4d0b:b0:5e9:721c:72a8 with SMTP id
 71dfb90a1353d-5ee1bf6259amr2502067e0c.0.1794492244262; 
 Thu, 12 Nov 2026 06:04:04 -0800 (PST)
X-Received: by 2002:a05:6122:4d0b:b0:5e9:721c:72a8 with SMTP id
 71dfb90a1353d-5ee1bf6259amr2501981e0c.0.1794492243309; 
 Thu, 12 Nov 2026 06:04:03 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e28c882sm75481145e9.6.2026.11.12.06.04.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Nov 2026 06:04:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, devel@lists.libvirt.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH-for-12.0 2/8] linux-user/aarch64: Move ELF/vDSO endian checks
 to runtime
Date: Thu, 12 Nov 2026 15:03:37 +0100
Message-ID: <20261112140343.61634-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261112140343.61634-1-philmd@oss.qualcomm.com>
References: <20261112140343.61634-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NSBTYWx0ZWRfXx7PlWcofcCZV
 UvL/l8aQqbGH6JVsxmJ7Es4cOzh8E/qJ1d0xgowdYwAcz4v26H/YCcfme43aWP5KSnI3RGF5opJ
 03SZ+CAiv3bPp7bb+TrGsWwAHFjviCM3PtgYWJq2POOYvx2jDcU13zgo4Zz3BUEwA2V6rJZjwc9
 NyW5RqYw8mUYoK0ibDJGTnbMJbLOsjBSZVdlSTMRtxve9fZw4FWpE5t0oRK4N7s3hqRHv0qcpWb
 9eedher1O7GmgQeFnzGXSOXyfDduzhj5UO4cUUc0HNhOA4ZD0IjRypvi+swFgNOxkxF+Y3P2ET7
 XrPebVLLLxzbIaJuHK45fhOkeJBVApGVLAEr4Q9Wh/xp213M2O2SExdkIvsicn2phxyjsBOdTCg
 O3FvwxrRlq+vUzIDy6FPz0+0P9KSiM+nn5B3ZkE12gL77N5o69mWWJo3x5dpaRETbBF3qNp5TLY
 dcu70RE3JDjY6Tn6DMg==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af5c755 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gRHuWOP3dPFJNPu9TmoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NSBTYWx0ZWRfXxbh/M4o32nhH
 FBfREwzo8aiNHmjnzMXoz3h6vTA1tySJ2L82hGgSyOYAystiRTSriYnxKuWUm//jMTPZps2Udlh
 enHJNZGTRJiqeaiaMMm5h22fcF2OGRc=
X-Proofpoint-GUID: 20xOUOTMPUZRzcRLU2nu7C5ryUwvUrSL
X-Proofpoint-ORIG-GUID: 20xOUOTMPUZRzcRLU2nu7C5ryUwvUrSL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120055
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use target_big_endian() for the platform name, uname machine,
/proc/cpuinfo suffix and vDSO selection. Give the generated
vDSOs distinct symbols so both can be included.

Preserve the behavior of the existing fixed-endian targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 linux-user/aarch64/target_elf.h     |  6 +-----
 linux-user/aarch64/target_syscall.h |  6 +-----
 linux-user/arm/target_proc.h        |  2 +-
 linux-user/aarch64/elfload.c        | 10 +++++++++-
 linux-user/aarch64/meson.build      | 10 ++++------
 5 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/linux-user/aarch64/target_elf.h b/linux-user/aarch64/target_elf.h
index 4cdeb64b0d4e..ebd23cfbceda 100644
--- a/linux-user/aarch64/target_elf.h
+++ b/linux-user/aarch64/target_elf.h
@@ -27,10 +27,6 @@ typedef struct target_elf_gregset_t {
     struct target_user_pt_regs pt;
 } target_elf_gregset_t;
 
-#if TARGET_BIG_ENDIAN
-# define VDSO_HEADER            "vdso-be.c.inc"
-#else
-# define VDSO_HEADER            "vdso-le.c.inc"
-#endif
+#define HAVE_VDSO_IMAGE_INFO    1
 
 #endif
diff --git a/linux-user/aarch64/target_syscall.h b/linux-user/aarch64/target_syscall.h
index bd05f6c7fe5d..f3c570a5b2eb 100644
--- a/linux-user/aarch64/target_syscall.h
+++ b/linux-user/aarch64/target_syscall.h
@@ -1,11 +1,7 @@
 #ifndef AARCH64_TARGET_SYSCALL_H
 #define AARCH64_TARGET_SYSCALL_H
 
-#if TARGET_BIG_ENDIAN
-#define UNAME_MACHINE "aarch64_be"
-#else
-#define UNAME_MACHINE "aarch64"
-#endif
+#define UNAME_MACHINE (target_big_endian() ? "aarch64_be" : "aarch64")
 #define UNAME_MINIMUM_RELEASE "3.8.0"
 #define TARGET_CLONE_BACKWARDS
 #define TARGET_MCL_CURRENT 1
diff --git a/linux-user/arm/target_proc.h b/linux-user/arm/target_proc.h
index 13c33d44d5ed..d3186ca655cf 100644
--- a/linux-user/arm/target_proc.h
+++ b/linux-user/arm/target_proc.h
@@ -25,7 +25,7 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
 #endif
 
     arch = 8;
-    elf_name = "v8" END_SUFFIX;
+    elf_name = target_big_endian() ? "v8b" : "v8l";
     midr_rev = FIELD_EX32(midr, MIDR_EL1, REVISION);
     midr_part = FIELD_EX32(midr, MIDR_EL1, PARTNUM);
     midr_var = FIELD_EX32(midr, MIDR_EL1, VARIANT);
diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index f87f22f6903a..8e75da826e62 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -379,7 +379,15 @@ const char *elf_hwcap2_str(uint32_t bit)
 
 const char *get_elf_platform(CPUState *cs)
 {
-    return TARGET_BIG_ENDIAN ? "aarch64_be" : "aarch64";
+    return target_big_endian() ? "aarch64_be" : "aarch64";
+}
+
+#include "vdso-be.c.inc"
+#include "vdso-le.c.inc"
+
+const VdsoImageInfo *get_vdso_image_info(uint32_t elf_flags)
+{
+    return target_big_endian() ? &vdso_be_image_info : &vdso_le_image_info;
 }
 
 bool arch_parse_elf_property(uint32_t pr_type, uint32_t pr_datasz,
diff --git a/linux-user/aarch64/meson.build b/linux-user/aarch64/meson.build
index f25a67a21ef6..a5f9a47a9a27 100644
--- a/linux-user/aarch64/meson.build
+++ b/linux-user/aarch64/meson.build
@@ -1,12 +1,10 @@
-# TARGET_BIG_ENDIAN is defined to 'n' for little-endian; which means it
-# is always true as far as source_set.apply() is concerned.  Always build
-# both header files and include the right one via #if.
-
 vdso_be_inc = gen_vdso.process('vdso-be.so',
-                               extra_args: ['-r', '__kernel_rt_sigreturn'])
+                               extra_args: ['-r', '__kernel_rt_sigreturn',
+                                            '-p', 'vdso_be'])
 
 vdso_le_inc = gen_vdso.process('vdso-le.so',
-                               extra_args: ['-r', '__kernel_rt_sigreturn'])
+                               extra_args: ['-r', '__kernel_rt_sigreturn',
+                                            '-p', 'vdso_le'])
 
 linux_user_ss.add(when: 'TARGET_AARCH64', if_true: [vdso_be_inc, vdso_le_inc])
 
-- 
2.55.0


