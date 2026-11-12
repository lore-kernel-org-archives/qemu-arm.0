Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2470606A323
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 18:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kVgi0CsD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NqaMWuiX
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRZGW-0003We-02; Thu, 12 Nov 2026 13:11:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRZFv-0001XW-NV
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 13:10:47 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRZFt-0000t0-UU
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 13:10:39 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACFZTUu3841209
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 18:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0lrvEWcZ2AvMr2EqzUiL5SpJkPzac2qhAJSLu8J1TIc=; b=kVgi0CsDkT+DwdRl
 hKYxDCXHjE5o6gSgYk6Comv5FolxcQyvfZpILQ52g8E5StWzxpH7L17JTLA1WkyX
 N8hRvSlANA1EcNqJuVS6pbnGZMi8/aGtjLMKENw8M/JY/sdaB2bb+utlFFRcnlss
 Iav6UrD69Xdok1Jkrwe5xyMm/d5GdVx6BcVjaz6Jc2ctxcMyl07ZSrGjkNgOd29q
 sjFdeeWCWlBNUw6f8LojSwK2QLOvlOFHsPxVrwS29E5HO5oc6JtHcfUaq4dbRTqv
 rXKnXa+PaCx9+dhfiZZak1LTDQ92j2LJvtKAF6s5ZDSOdNwnLyjThk9cz1DlYgL6
 ON/xog==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e1abcv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 18:10:35 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-9907539aff7so94487241.2
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 10:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794507035; x=1795111835; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=0lrvEWcZ2AvMr2EqzUiL5SpJkPzac2qhAJSLu8J1TIc=;
 b=NqaMWuiXB8Neo3WLaXzSSEKYST1ddXx+sxNYxBE6s/QpU8DU6tqefS4rFgq01uQ7kL
 Jl3NcYSXOVPeicyiY+3EDPJiTqCsJpJ1MaRrmAXgxNOYMqgJkXx9IAuubhm638NNIJ1K
 fFKK7MyWyRQ7CYUdD7ZKrMS5UoszAZOuMSsCFMij+zNSw+JbPeeqcrBpUf+k5eGk/0oD
 B5kJA0Tgxqqp7/QDL36s5fyB3dzuwLWeZVRLDzor8nla7iejaIm449P76r60mu+znp89
 7PkBlaBsHD/FBmtHzjcxpMcsFPgE+aOG9/tTWr3qN6ToI3xdpbEBvkj3mptenB8WVwie
 cNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794507035; x=1795111835;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0lrvEWcZ2AvMr2EqzUiL5SpJkPzac2qhAJSLu8J1TIc=;
 b=w/9J6hj6pfkBIMEfftwJbtliMr2Qmh+RzgRwKUgHnnUVL4Ed0ZG767MwVsWbpMDylN
 6Ghq0K57+eb40XmajsUhGkw2PHlHxUZlj8vQifOZrSn7urJihh0HLzlULz1gZnbnl0Un
 8PZSWBGuqA8OFxZ2c6MngTc6ewXY25UyryC0d6d+9xxbhL4yLx9RmDqYP1vYcUzbrbja
 0+niNsLcaCGlgI0UMYa8KzsQ8hvTFT2Jez5eBbBhze33rj+CyLIQjzuxMYxRxl0WjhKI
 Zj+1AE1d1AeUdMTYwdc93ig02Iqsva/a1E6c5CypNveqY/bk8G6T9Vk1Jbose2/87WF4
 rgJQ==
X-Forwarded-Encrypted: i=1;
 AL+hErGwGX40JRTIjAmJED5ycrwxe8PFuuTTWJ6uiJzzu/oOUVknFzlgs59PquYlmEJBDOBPh1jYP4I+tQ==@nongnu.org
X-Gm-Message-State: APuU4Z+EfI8xdmxQ9cxa34GR8dqp/aXkdz58Bp5e5x7E2vvUCe4HfgB4
 WxzPdedBSUPxF2QiXZUQWq4+sNjJ+rhHzbLuZPINk7HbZpH/EpENPYJtUqa1Eq5GMB4qAE1a9xo
 5vtKDvtYMoXlmsdqkzLvxpgZsOv0KvTfouCrqEPu8ozjPE2ZPrc4524M=
X-Gm-Gg: AYBFou3PNqPtWcQDxRHu3pHKlWUyz8SnZQfoM81zXZuEETuposdkvVEJW/x1o78zvJ0
 PvDr9IoUQ4jDLcSLGofh2ta8c6VuZkhgLjHAD7iC0BCmzOgTSQsI7/pq8Nc05VhiXquR+UwJbCv
 jnR9SZYM8f89kHUpbQjLhwfASBrNZiG+OOLFS1RTtWNdldHY6HZCgjwhftmllR21PMfa4c7dgCX
 rAa3JZE3SHZOiPjPesRSAfJHL30PxjF0KDBQSaSLXk0za6deI6D3QNl8bvdHFOaV9reuiJvgD8T
 X24osb8F2Fk3C/+vP6GlFwGeD7SF5zFbbtrBaHTdebtQqdCLDFF+9eSuYzzNO/nP/yisXrJCAo9
 yjuv4TbVw5uMPxO102jRrcLwSJFGQUJO0VwMs+n64C0IolFcA7Atdtkf/aB0lErHtz6dr8dbtUH
 gHvfzPEVbngNvMzQ==
X-Received: by 2002:a05:6102:605c:b0:7c3:c0b9:8d50 with SMTP id
 ada2fe7eead31-7d64d80d28bmr92137.21.1794507034799; 
 Thu, 12 Nov 2026 10:10:34 -0800 (PST)
X-Received: by 2002:a05:6102:605c:b0:7c3:c0b9:8d50 with SMTP id
 ada2fe7eead31-7d64d80d28bmr84137.21.1794507034203; 
 Thu, 12 Nov 2026 10:10:34 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e25eb86sm76511025e9.8.2026.11.12.10.10.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Nov 2026 10:10:33 -0800 (PST)
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
Subject: [PATCH-for-12.0 v2 12/12] linux-user/arm: Unify both endianness under
 qemu-arm
Date: Thu, 12 Nov 2026 19:08:58 +0100
Message-ID: <20261112180859.85380-13-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261112180859.85380-1-philmd@oss.qualcomm.com>
References: <20261112180859.85380-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfX8kQpQOg018A+
 CUxFpHIgRJiNi2fdkkpcGrY+MDlkaX0VgC36eVO6XUrkY3XQP7KZuEv7CfR6/YobLsM+HrmawKy
 foIcR5hfMKGN5bRLDVf+Qi6Qx7PPqgBnT/7M2ZPCEcHUAut6iZSQXDoiAADplFBIm8KhgiegQDk
 T96GukU9fX8TBDKa/hOhmWgLDHTvPptlD5jIoQciBLLWKDYPxIR0jtDR+INsyz3qFdo3ycM/Vwu
 ypQ28qEzDkSLDkgkpswgX4xg8BCNSvi8Q9phhoqXnI5YR/iBlOc3oAfeHJ5oGSjP91CL57pDVsQ
 I7Bel69vR7li7ODacB6iHWDyPVbMe9XEyFZDXmzLwUDLsUvqzP4eAcFhzH475L+NVV2NYEcfE8p
 2QvfVqNULv87+uFVtaE6amQf4xKOoKW9gkGZn32hfpCh72NuPnE5PHLD4e84G/HeEbi2KIlk0QG
 +y4gPqbD0R/7ebIv2sA==
X-Proofpoint-GUID: 2P2LwJqDjyA6nOCZV2YCCio80-dIb_gQ
X-Proofpoint-ORIG-GUID: 2P2LwJqDjyA6nOCZV2YCCio80-dIb_gQ
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af6011b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ras7m7bTOK-54pG4Za8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfX+XbNC904n2fu
 tZSeMTeSb+N2TIAGQ4Y7bAGhQA3zURyXaZpzxZjjcq/4Dr+7w8KejW2BaWH7ZSxRyLNpnYq/ITn
 ASrNwouK07aM2fNKJ2glhLBwXSeF5cA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120072
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

Enable runtime byte-order selection for arm-linux-user
and retain qemu-armeb as a compatibility symlink.
Deprecate the symlink since 12.0 and recommend qemu-arm
for both ELF byte orders.
Remove the separate armeb-linux-user build target and
obsolete CI exclusions.

Run the existing big-endian hello test through qemu-arm
while retaining its big-endian fixture toolchain. Document
that executable name compatibility does not preserve the
removed target-list spelling.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 docs/about/deprecated.rst            | 10 ++++++++++
 docs/user/main.rst                   | 10 ++++++++--
 configure                            |  3 +++
 configs/targets/arm-linux-user.mak   |  2 ++
 configs/targets/armeb-linux-user.mak |  9 ---------
 5 files changed, 23 insertions(+), 11 deletions(-)
 delete mode 100644 configs/targets/armeb-linux-user.mak

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 715a72d8b117..e85c9efdb4b5 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -451,6 +451,16 @@ Use ``qemu-aarch64`` instead for both little- and big-endian
 Linux ELF executables. The emulator selects the endianness from
 the ELF header, regardless of the executable name used to invoke it.
 
+.. _deprecated-qemu-armeb:
+
+``qemu-armeb`` executable name (since 12.0)
+'''''''''''''''''''''''''''''''''''''''''''
+
+The ``qemu-armeb`` compatibility symlink is deprecated.
+Use ``qemu-arm`` instead for both little- and big-endian Linux
+ELF executables. The emulator selects the endianness from the
+ELF header, regardless of the executable name used to invoke it.
+
 linux-user mode CPUs
 --------------------
 
diff --git a/docs/user/main.rst b/docs/user/main.rst
index c9b4204dcf9d..2e01233a9cd0 100644
--- a/docs/user/main.rst
+++ b/docs/user/main.rst
@@ -152,11 +152,17 @@ Other binaries
 
 -  user mode (Arm)
 
-   * ``qemu-armeb`` TODO.
+   ``qemu-arm`` runs both little- and big-endian Linux ELF executables,
+   selecting the byte order from the ELF header. ``qemu-armeb`` is a
+   :ref:`deprecated compatibility symlink <deprecated-qemu-armeb>` to the
+   same emulator; its name does not override the ELF byte order. Build both
+   names with ``--target-list=arm-linux-user``; the separate
+   ``armeb-linux-user`` build target is no longer supported.
 
    * ``qemu-arm`` is also capable of running Arm \"Angel\" semihosted ELF
      binaries (as implemented by the arm-elf and arm-eabi Newlib/GDB
-     configurations), and arm-uclinux bFLT format binaries.
+     configurations), and arm-uclinux bFLT format binaries. bFLT has no
+     byte-order marker and uses the little-endian default.
 
 -  user mode (ColdFire)
 
diff --git a/configure b/configure
index 821a887a31c1..14b484908919 100755
--- a/configure
+++ b/configure
@@ -1111,6 +1111,9 @@ else
                     aarch64_be-linux-user)
                         error_exit "Target '$target' is no longer supported; use 'aarch64-linux-user' instead"
                         ;;
+                    armeb-linux-user)
+                        error_exit "Target '$target' is no longer supported; use 'arm-linux-user' instead"
+                        ;;
                     *)
                         error_exit "Unknown target name '$target'"
                         ;;
diff --git a/configs/targets/arm-linux-user.mak b/configs/targets/arm-linux-user.mak
index 3793782d067b..e3203c848182 100644
--- a/configs/targets/arm-linux-user.mak
+++ b/configs/targets/arm-linux-user.mak
@@ -1,6 +1,8 @@
 TARGET_ARCH=arm
 TARGET_SYSTBL_ABI=common,oabi
 TARGET_SYSTBL=syscall.tbl
+TARGET_RUNTIME_ENDIAN=y
+TARGET_USER_ALIASES=armeb
 TARGET_XML_FILES= arm-core.xml arm-vfp.xml arm-vfp3.xml arm-vfp-sysregs.xml arm-neon.xml arm-m-profile.xml arm-m-profile-mve.xml
 TARGET_HAS_BFLT=y
 CONFIG_SEMIHOSTING=y
diff --git a/configs/targets/armeb-linux-user.mak b/configs/targets/armeb-linux-user.mak
deleted file mode 100644
index 536bc95af71c..000000000000
--- a/configs/targets/armeb-linux-user.mak
+++ /dev/null
@@ -1,9 +0,0 @@
-TARGET_ARCH=arm
-TARGET_SYSTBL_ABI=common,oabi
-TARGET_SYSTBL=syscall.tbl
-TARGET_BIG_ENDIAN=y
-TARGET_XML_FILES= arm-core.xml arm-vfp.xml arm-vfp3.xml arm-vfp-sysregs.xml arm-neon.xml arm-m-profile.xml arm-m-profile-mve.xml
-TARGET_HAS_BFLT=y
-CONFIG_SEMIHOSTING=y
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
-TARGET_LONG_BITS=32
-- 
2.55.0


