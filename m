Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E02606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 18:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AHxc01W8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HXn1BXwD
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRZGO-0002gA-3O; Thu, 12 Nov 2026 13:11:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRZFQ-00018L-EC
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 13:10:11 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRZFO-0007FX-Ie
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 13:10:08 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACFZZ61656986
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 18:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I6cWT7Mn8x4MAbwTg29BJU9C1XOGBuMHA9mfZuILgfc=; b=AHxc01W8Ok3ySguu
 fIpuLJOkSybnrfs/NEkR1pShLZNPISN1oo/xSZPQjjQBNK52V2qY+iU9nn0NVx1U
 4gFMqAKxTWTn0AX/LPnrEunwMAdBT6sVhFpsP4TLyljFHE3uTw9ytaiSlw4YJo13
 1k/DKiPd805GG0POCTiCs+p+b6SG+/Z5OVsxwv8XfKhXeFV9m7S3IqSYJzXcNSb6
 XdfQPWLuOn3krM7MnGlw2FR2Y4ob33N95pJ3nkVO4KHiUpfMudWp6yAIl4B0ec3v
 09JEzZmkwrYYz7W0OebaaKanIIA1rhLm4pygR4y57BYuU7sxmbuQLaGUSAF8acWF
 445dZA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yujvkq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 18:10:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5383d650f2dso89569771cf.0
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 10:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794507004; x=1795111804; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=I6cWT7Mn8x4MAbwTg29BJU9C1XOGBuMHA9mfZuILgfc=;
 b=HXn1BXwDMoc0qx8VLJYZPAl3WyzBdLTm5LaDhfR/axK3S8dnIWrTsWwhUzJNSBqxtD
 F7f/rKBCsbpNyVX5IUuLV76/UT3IH54jqY88EEzHBGpjVfXWegFSubcwJH+oCPs3YFAe
 hdqMo+AefKVFcg56cT19vZUVahMTLeIjujOezOCOf3rbNgKCFcY1G/dV3EnGVruV0rsp
 XORx6vSgp8STtzIiSPAc8BLjwiqzP9whjt4uBNdyQ1pGrIE5wSaZKyjGURiJ8vYRqF82
 4vEQsHFjbPqiKiGZTfMmd8/eZaqaV+ulMrE26O37unIePe6WSb4IRaK2ToPJCy53ld0U
 cfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794507004; x=1795111804;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=I6cWT7Mn8x4MAbwTg29BJU9C1XOGBuMHA9mfZuILgfc=;
 b=s5RqQcR7pHxaUaWsaN5YB5fnZBgFXMrHAF/HAHhTwxHiPHJs2KCgXrRY8s1XukZFxK
 HBSG1V64ek9lLEjiCB0jHI7Fke6zr80RLUnjqfSy3G4FHk/SOoGoLMPc9/MB7ws/MgHd
 oZee5CV0YPHqZGp3i81hPVcv8TUypD5WOuz/WBASanTqxhC7hPgTw/Lbrf+8gmDaflt7
 zi2Q+rU+uf6BAJMdZRAyYLSbeaelx5ArkSsjFHGxYS1ZSv4N9yTsneHshWqA5moSTOlS
 epqv/OsCBCoiRT4U7jXc1DemcMD+ND3Wyh2pvCcLerxDKasyh5QKitf6WLSVHJZYdBf0
 Qa+A==
X-Forwarded-Encrypted: i=1;
 AL+hErFD/5jXCLhtgJZWzqiDby6MPrZrwWXRtCo1pTM6lT0y3dAYIDf1ZzXpTbbcWdP5SAo9Mu0QEDNT1g==@nongnu.org
X-Gm-Message-State: APuU4Z9u7O3hDziT0/h5Ee2/40YjdFBEcbS8jbm3cbuWSL4adygT1hAX
 4O11ceG0Sytw8G7af6sHcOVkkuNq7bH6mi7aXK2TgWuAhhpubOJx/WMgtLob65xTbZUAwXr06DR
 fKVz0LBXCBfiTtRVcuhiXMKrA5woF9szs8jTf6XqYs8C+zLgkvH/eK7A=
X-Gm-Gg: AYBFou3Sx2GWbL2EoCa6hHhVi4emdPh2BFUuNF17SL7h99l69yJ8AEw25OCg6Aw2635
 ukGu6Y1B5nVpuzE7/euu+SmvECVez9K+pMfUzlrIsinfSn0yR19bjCNkC6P6ovr4Jbuhq2CXpbU
 c4JKMSPX4vmjnEj9i3YeyiyYA6FfCbliD5zPkV7sV23jkS6+mhg+H+h6QQ+CHeuYlXQf90+eDvc
 zlTGyi+EAhTVbb84MukOfz/mmzoRf9QVHI1cdkS/Jyh3LiZwAfP3tJotdcESANRMz5OzuToKn+V
 8ybm+jFUyXpFo2vDBRFOkrlcXOeBXar2pMQ+aPQwMRvsE/eqfFWIFMscA1BEFbzMpW90mZiJh7W
 VMoFlsgRYQvq6v4Ocu9j4UvkZgfgdGybf9MfkicV633Y5XZE9WzN8GFw+ABh8CylzDkJOfTXSqW
 YX3MjzR2BSp7tT0Q==
X-Received: by 2002:a05:622a:58c:b0:535:a5fb:6459 with SMTP id
 d75a77b69052e-55ac8e98474mr3058081cf.68.1794507004061; 
 Thu, 12 Nov 2026 10:10:04 -0800 (PST)
X-Received: by 2002:a05:622a:58c:b0:535:a5fb:6459 with SMTP id
 d75a77b69052e-55ac8e98474mr3057421cf.68.1794507003586; 
 Thu, 12 Nov 2026 10:10:03 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c609c6451sm577991f8f.45.2026.11.12.10.10.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Nov 2026 10:10:02 -0800 (PST)
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
Subject: [PATCH-for-12.0 v2 08/12] linux-user: Honor runtime byte order in ABI
 accesses
Date: Thu, 12 Nov 2026 19:08:54 +0100
Message-ID: <20261112180859.85380-9-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261112180859.85380-1-philmd@oss.qualcomm.com>
References: <20261112180859.85380-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Fh7jHaf561S0ZMQr3TaXdR2WDtP8KDG0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfXxQTyk3WSHy6A
 WpxwNAxQ4wCkLbOMDC3T+yomXR2TeMeh8YYQfYeIY226SUYhpBm5nu3ieiubdaguCF+2zwFyL2c
 OKpoF6E+A5FJ7Mi6CgSnxtvE2TETFhA=
X-Proofpoint-ORIG-GUID: Fh7jHaf561S0ZMQr3TaXdR2WDtP8KDG0
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af600fd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6Dl1BFdLVJxz0x0sNX0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfXy0T4y2+hEbDK
 AlZdZ64VxMCI99HD2fVbSPu99HA+ZXcscSFUdNLeAPcBq9438ACYAfwH9qvOwr/VNXsOge+Znch
 WHa7o2EUrBcixB3W/MfjDdyY4zyQZzMyTNQslO/wQsN6qtDPg1NAmKNRwQMt/jwsvA58Sbt5MDV
 5vHuHOfvT+Dt73nS3UzyLkKCWp1Z+1jR83ucNQI+hUuOCtsCSnLnNo39+W9t4np2k/g6MFwG95+
 gMoNjk2KQP6jxN4t53cPeSRhn8daZhqyUaGAUxaiLIobQyOvEYTCRANFzAq4frD+Vbboo7V14UR
 KtaNNYOiPyNCwovhIfwrdKLKNOjBYD4eTEPZ/REVzqk5Hcm/BO1fk/9Gg0drBSnPrqoUDwfKFq4
 deZNXteLY8mbELRLBUaAdvTfJLSs0m6RUArA2v1dn2RgEi2AAb2z7qkXRjxNUXovgitTpg3U4l0
 KbYc92DpJPgP9ZfMOuQ==
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

Use the selected ABI byte order for ELF validation and core headers,
user-memory accesses, signal masks and /proc/net/route conversion.

Retain the fixed-endian paths for targets without runtime selection.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 linux-user/qemu.h         | 17 ++++++++++++++++-
 linux-user/syscall_defs.h |  7 -------
 linux-user/elfload.c      |  6 +-----
 linux-user/syscall.c      |  6 +++---
 4 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index ef7aed2daec6..53567a6c0363 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -254,7 +254,22 @@ static inline bool access_ok(CPUState *cpu, int type,
     } while (0)
 
 
-#if TARGET_BIG_ENDIAN
+#ifdef TARGET_RUNTIME_ENDIAN
+# define __put_user(x, hptr) do { \
+    if (target_big_endian()) { \
+        __put_user_e(x, hptr, be); \
+    } else { \
+        __put_user_e(x, hptr, le); \
+    } \
+} while (0)
+# define __get_user(x, hptr) do { \
+    if (target_big_endian()) { \
+        __get_user_e(x, hptr, be); \
+    } else { \
+        __get_user_e(x, hptr, le); \
+    } \
+} while (0)
+#elif TARGET_BIG_ENDIAN
 # define __put_user(x, hptr)  __put_user_e(x, hptr, be)
 # define __get_user(x, hptr)  __get_user_e(x, hptr, be)
 #else
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index f5831a6baddc..c9a1853c9e90 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -462,19 +462,12 @@ typedef struct {
     abi_ulong sig[TARGET_NSIG_WORDS];
 } target_sigset_t;
 
-#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
 static inline void tswap_sigset(target_sigset_t *d, const target_sigset_t *s)
 {
     int i;
     for(i = 0;i < TARGET_NSIG_WORDS; i++)
         d->sig[i] = tswapal(s->sig[i]);
 }
-#else
-static inline void tswap_sigset(target_sigset_t *d, const target_sigset_t *s)
-{
-    *d = *s;
-}
-#endif
 
 static inline void target_siginitset(target_sigset_t *d, abi_ulong set)
 {
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index c188fa03c31f..c76afb77bbdc 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -102,11 +102,7 @@ int info_is_fdpic(struct image_info *info)
     return info->personality == PER_LINUX_FDPIC;
 }
 
-#if TARGET_BIG_ENDIAN
-#define ELF_DATA        ELFDATA2MSB
-#else
-#define ELF_DATA        ELFDATA2LSB
-#endif
+#define ELF_DATA (target_big_endian() ? ELFDATA2MSB : ELFDATA2LSB)
 
 #ifdef USE_UID16
 typedef abi_ushort      target_uid_t;
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 2fc61b3eabcc..9dec129e1d4f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8778,7 +8778,7 @@ void target_exception_dump(CPUArchState *env, const char *fmt, int code)
 
 #include "target_proc.h"
 
-#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN || \
+#if defined(TARGET_RUNTIME_ENDIAN) || HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN || \
     defined(HAVE_ARCH_PROC_CPUINFO) || \
     defined(HAVE_ARCH_PROC_HARDWARE)
 static int is_proc(const char *filename, const char *entry)
@@ -8787,7 +8787,7 @@ static int is_proc(const char *filename, const char *entry)
 }
 #endif
 
-#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
+#if defined(TARGET_RUNTIME_ENDIAN) || HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
 static int open_net_route(CPUArchState *cpu_env, int fd)
 {
     FILE *fp;
@@ -8850,7 +8850,7 @@ static int maybe_do_fake_open(CPUArchState *cpu_env, int dirfd,
         { "stat", open_self_stat, is_proc_myself },
         { "auxv", open_self_auxv, is_proc_myself },
         { "cmdline", open_self_cmdline, is_proc_myself },
-#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
+#if defined(TARGET_RUNTIME_ENDIAN) || HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
         { "/proc/net/route", open_net_route, is_proc },
 #endif
 #if defined(HAVE_ARCH_PROC_CPUINFO)
-- 
2.55.0


