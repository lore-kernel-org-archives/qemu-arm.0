Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54930606A323
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 18:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mf+rVLgb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0W2hsQP
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRZEp-0000fh-RN; Thu, 12 Nov 2026 13:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRZEo-0000ex-0R
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 13:09:30 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRZEm-0004G9-8r
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 13:09:29 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACFZCFa2593497
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 18:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F+yrVZEjze+e/2Of60uDFwn+N5jFGPC6Av8hbHxv1mg=; b=mf+rVLgbbTVExRuN
 UlA46+vCeplykbsJwBDLcLH94Bylng7Ka7mo1neUPLn2bd9oqyuLEQDh3XPo6woA
 mFuW0TiGfYYp7zouPlj3O+UuuwLBaNR3zNOfOaF7TC1pudyvrPIvnodgMBjNWUEP
 riSAGd7/n3M1UF6WTnYfMEJ+RAE8L9NRSHqTA2JJX5QeVp5lM7VKWY5urxErcah2
 UboZlnZHOFFeOVDHIRrryR5CuV0iM9MFS0zntznPpKSeQT451KHNSTp25OxgIneY
 97qOls6i1gWRgJcVjGJpja4QCLlcqnL5ZB0k1MrqHU3opbqkJ6T1ye0AwqRlAvAs
 zS4EuA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx31pjs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 18:09:26 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-7d2d5cc693fso1756137.3
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 10:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794506966; x=1795111766; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=F+yrVZEjze+e/2Of60uDFwn+N5jFGPC6Av8hbHxv1mg=;
 b=M0W2hsQP79VESc2hbOT+LzWbn6nygTGsLxk1GdNYRwXFnlNLzV4erfsMgRHfEFCzB8
 3dqCN+iXAtQX13fVU02YfQJK21b90N9Wzt5ZOE+DEEbBZ2zL1j8TENp6pimV6CmgSevz
 nk+nZcjxroBnzINiWbw3v2YVSbvlxcn4F6807PR4aoUBrFBMlfMpBlEs2VrgXRML7nO/
 z2NGRHiMvkmVeXySbEmRiqyEhw100WCkcUu+pT6KvrwcDVG9Amk4MtndfkSXKrAPkRJb
 yxBvZLUFFq6lSTG9HqqrvESKrnmA8vCB4cSQPF4iyTTars8b/AbHXx/7JfrqxGGvXKM/
 mDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794506966; x=1795111766;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=F+yrVZEjze+e/2Of60uDFwn+N5jFGPC6Av8hbHxv1mg=;
 b=fm8eRP8QwY2w0HLvYLR3r4/ThJZR6VK5lQ+kXTr6kKKFa9cPRT5WhVfeC1RdWxhHS3
 2nuemHXxVV5I1Sk8GR5fqEKpcSE1G1YQlnBz67C1omR+wOsEU49sg0rbNS6abkNdWTE6
 A98Rx+KHbvxRGQ5J/0Nm0pWDRCt6A1UhlrG+gYbmoKcRcUkNTUW3b+TfASYaStYtbB6B
 5r73VeZuX3Q6rTl+X7T7LN6jKK2w4GJfNH0PET2+BX5rqhg40/2T60h9JSkV8rfoKml1
 dUIglPukPG7RIJkreqh+wKOWvY5yuFwJFWvE/vM9At5YTuV7SE6inEw9chwF/XPWMtJ8
 +k9A==
X-Forwarded-Encrypted: i=1;
 AL+hErGW3g9xETN9V4iFiho8+UwPkpbC2iU90RKEJDEVC5NnJULGQdWZqyyINVMEynuFj7poxTj6TDTCzw==@nongnu.org
X-Gm-Message-State: APuU4Z8BqZHc65jMGDHBh2wfklLitDlt0l4MAI0bot21y9/ZKo0gU1OS
 9CqgAoivGO8EqXT2bQp/lG3g8Tbth08pLA0kH42XzFH10D/KE7qSfrYt+Go1Fr4Ck3p+OsZLVCW
 vhb/aUqJ9VCfipcoAuTUusa468NiLbed08sogNfTiteEgE40XUMpRMDc=
X-Gm-Gg: AYBFou14NS3alxoYqt7yG2eo+dzAT4Ih4ZkcW96FjXSfV1zHipjPYDyJtY8aIAoWu0O
 1iC3HM36omOtZaerB6B1B8En0C3WZZoKwqMpV9SwCSGa1Oaie9vMWa7tysG2XlxkqbDY2XAf+85
 1K0oUIEuROipkwum71jphAbqT4Pg4K1n/phVYMEzvRwDToj+mnS5ez5gs1QgmWtm0iJjPTrFxyN
 RvoRwfP42h6zMRtnrqVHPaOZTmSVLDuCMGVVhu3W/F04vyVJC3a45tRftoZlD57tPZCAEt3xDQV
 7PFp/oDvvWJ3p1riMU9LaP9k1SGyGWqlPvWoENSAd/BcOIbjJuBFEzJegDJfbloWv5Qf2FE6EWX
 zgszfD8IDgJdpgbZ9vvlbnlYKtm4U15EL3dntZI9rZJfo7uvfYrPGuIk4DwNxX7/e0dOdJW4Rj/
 pskCPf4dkng8haMw==
X-Received: by 2002:a05:6102:418e:b0:7c1:6de4:9f67 with SMTP id
 ada2fe7eead31-7d64d4292f3mr30942137.2.1794506965786; 
 Thu, 12 Nov 2026 10:09:25 -0800 (PST)
X-Received: by 2002:a05:6102:418e:b0:7c1:6de4:9f67 with SMTP id
 ada2fe7eead31-7d64d4292f3mr30911137.2.1794506965024; 
 Thu, 12 Nov 2026 10:09:25 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba08e57504sm121226465e9.2.2026.11.12.10.09.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Nov 2026 10:09:24 -0800 (PST)
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
Subject: [PATCH-for-12.0 v2 03/12] linux-user/aarch64: Move ELF/vDSO endian
 checks to runtime
Date: Thu, 12 Nov 2026 19:08:49 +0100
Message-ID: <20261112180859.85380-4-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261112180859.85380-1-philmd@oss.qualcomm.com>
References: <20261112180859.85380-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af600d6 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gRHuWOP3dPFJNPu9TmoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfX7QJAfUNuWIjA
 zLusHqTDiQa2yI8Vgm2aMuxwQEoGdibh3G+PEsL1Mz/2Zq2/7eX4SgoS5ZrS8k4TF96jbiqYuZB
 tfjJnjRgI8AkH+yyJEYa9UBRvZVA3z0nxm9dksXDWzLmemPkH7WoRR4bj6f0nemyFK5vp5zu+s8
 Qsk+UF+i6AYdIrMkftkNOldGv0KAvuN4Hx1ZPvgyrh7K2YylqH7VSgpIMA7DjHPDGhlQeUtLEEg
 q0CtROiowz5Z9K7fYWKuZ1jIQnGkB7dY0uqYya9r2AmKoqhw13A5uTRNReHQGObp59+cR6rJOZQ
 k5/p24KLg3GrnhNCle0qDxyaMiWD/ExR4Pzkg8Qe+a/HMfh01pTIX9E91pffutM3NgMumYjyrZt
 xtk4vl33HGTtxSxAkf3H83WcROSw6y5mu05c/q8RZqwOeCdd/FbHdC2sGvaPuMPag9tGjzxpxcO
 QvjsrH+Ur4m//P1ZP/w==
X-Proofpoint-ORIG-GUID: mU6ZLR6j-fzReUP06gJ6RdZSXRFq3LL3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfX/y3ddl1nlGB6
 zGTtLyX9tqAGS8dKup4YAvMleOw4F1J7wTkGeCR0LuE46YB2uT+onExtcGr0wvtqD8FdK8Xif84
 ICx/9m9s9spejsn0M04tTiXFy0PFfD0=
X-Proofpoint-GUID: mU6ZLR6j-fzReUP06gJ6RdZSXRFq3LL3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120072
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


