Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839E3606AE81
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pYTeX+X7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IlNjJdAj
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRVS2-0008Rg-2i; Thu, 12 Nov 2026 09:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRVQ8-0006wC-R5
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 09:05:04 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRVQ2-0007Xu-6N
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 09:04:54 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AC8wPAN4149502
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 14:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Nfa58+xfGAH+vpjjA2SMc5ddQUpesl6suSt9COV6tek=; b=pYTeX+X7ffFAJrya
 jmTlGzsZZcF3ug7w0YSgs2R9VI2MwpahXXgHNCvXiop9tGJ8CRs4QtHO76qluN42
 v5yGt8R9fNshOS+Yp1y4yQ7dOo0bH/StfUOrV5RPeJhdrDWtJO5uBjGX++QBelE7
 RvCcGaHHNDElgCU5l3pnkOseZpBmmPd7diXBW8PEkldM9RJR+MKr0Y3d0S2a7Yz7
 kddjdmfUkJtOXri1SHOKyWAbqADfRLoMd4c2ieXIu5ln2dZbVDuQOinGh9wVMsms
 wNLyZu8hoQevrb2dny2lNp2UJtlJehoeFFHObnn4Ke1AhucSWal/vxyL+vRypuRp
 7MHDUA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc63q7y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 14:04:48 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-5c82cf2652dso1479218e0c.1
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 06:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794492288; x=1795097088; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Nfa58+xfGAH+vpjjA2SMc5ddQUpesl6suSt9COV6tek=;
 b=IlNjJdAjM0Vb9mHhrCm1hFCu1Ei2g7x2IRFsTD6yGobAR2q9bdemTvDJnjyMmlhz6B
 R3LZOYrIOMYtlWzY3Vmtk7Yojmj2MDqr7KIjjQZNaLLKOoDxVcpHkrJdfXreTXFBunik
 cBRDRmrYwUIR64iIWgqb3l6YBGOCXMLTr7MiMh0m6ZUxtD7v7UT7B2c1bYlARcBWh42Z
 cnq1MvfeMM9sPOaxAALfubZGB7sCefbAZK+DPyQ+Rk6kguTRI9abec4FtPmhgAYQml4h
 eex5hieTqZMIhZl8jBmAFZJqZVTDBbUM1XdJ8kJGje6X+QPtFQRlmfpiEW3FGl5kx3Wi
 z1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794492288; x=1795097088;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Nfa58+xfGAH+vpjjA2SMc5ddQUpesl6suSt9COV6tek=;
 b=n4ITlJhxLp/gTY5LWdqdPlmICFNzRlIZ2yIwwd1eU5HBKxBjXmAB7/cgoHUueTVNXo
 cgiAgIv9jK8chlP5QMqacKOAx0uDjQhNjtYw0rkZiBlyUh1XTV7EAQBKfxiJ2CRyC8f5
 Z7V2lozYZc1SbUBFT37SbWUZs8LiovGHSD5s95LyIXzHzffCyLpRGWqKvZ0d82pI1MC4
 wAnBdgCFMk49RHMamHeLQ7xJjmglmP1o0m3/8gtlh3bCyeHzDBPiQ908A89ORhsnaBDI
 4XrbCeuewrB966/MotHKjbuDxicBtejlLFb6M/gwB+UvXg5a1zacIeMSWZILtBVc8Y5J
 OQhA==
X-Forwarded-Encrypted: i=1;
 AL+hErH4z9+/hpdGm7sdgX69v0+7iIHe47GbLzU19yi6Tr/BYAAXI1a9FuQ9tbbQJhBUA8wH+br0eYjcFQ==@nongnu.org
X-Gm-Message-State: APuU4Z/ICTkU63L+saTmyMPAxT5ZvRSO3T/DD/FWs7G8X7Uf93gRGdWs
 Ya+O4qZcOJGMuQupDETKho8EA6fyVi2DMrx1Bslv9MEYFnRBBLI2oh6Ntfy2vUyilVuLA+mOYB2
 /N+HDhmE/WGt2jC5a+xi1pRvnoYBv4TiE68dxYMSiTT1dOJnm4cPDId1qJQrL8iqxbQ==
X-Gm-Gg: AYBFou3ujJYxDfYDlQtnrCpveQsrHDUjRWTLTrs0n8O9iBvu4G47iP6CBE2OU5cAZF6
 TbjoUdF2R/QAID+gcbZUsD1sBSKDv3BRsjV2R/+NulFHGoppGt2RgPZwhRDRgo3RW5oIf1T8D+4
 rCw7hZqxx/XvghcrZtEFK0WeSKMD4Bzj/L9qmuqSPMa+3dcj5bAcqIAkb6IhPKtKduXuGGjiDkt
 p4CoYmheu+wwaI8hHWaTLnkpomK/gqn+2TvAUXpoEfC0KFiBcVn8n6KJwmSUBcWplCneSH4ZI5I
 eCF8vvmcafUZmbOP/RUkgswFSanzZEMRIx/cggg4DmgISvyzpOl0bGSsZveM3sutGU2B2VbvqGb
 V7RnrWuNPNnCvGa8HDNl0AjfM921Wc6t9BKmnt2rwskQSuRAWcwy9WS6BQ36YS5WWsd7ZAMbRyf
 8isIsBYF7N10koxQ==
X-Received: by 2002:a05:6122:3116:b0:5e9:7c82:99ee with SMTP id
 71dfb90a1353d-5ee1c3f641cmr2113583e0c.9.1794492287999; 
 Thu, 12 Nov 2026 06:04:47 -0800 (PST)
X-Received: by 2002:a05:6122:3116:b0:5e9:7c82:99ee with SMTP id
 71dfb90a1353d-5ee1c3f641cmr2113516e0c.9.1794492287251; 
 Thu, 12 Nov 2026 06:04:47 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4983585923bsm17477738f8f.11.2026.11.12.06.04.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Nov 2026 06:04:46 -0800 (PST)
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
Subject: [PATCH-for-12.0 8/8] linux-user/aarch64: Unify both byte orders under
 qemu-aarch64
Date: Thu, 12 Nov 2026 15:03:43 +0100
Message-ID: <20261112140343.61634-9-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261112140343.61634-1-philmd@oss.qualcomm.com>
References: <20261112140343.61634-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WgBXimJ4mjXMh9Fdb9jPcIShEF6to_c3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfXxu1KsRaI6hg6
 jPWUdPVXYkbRLq+P9/FYdFggQ/zigZ9CLxDhgadcsGXbzOuYGwgwTzv7RJOibY71LH4FN+pm4i/
 /2p79e7ZHDkfpNs/irQDD20cNU/T+DdURbiV7rJZKXX7x4kPERPRHIPcBpYawDdEFtSEP80jxie
 hPp78XruK8y8CZK0FY8o+9v+teq33+4Z4BF63Z5DIL8XsHMVOGhmDteRkg0sJeYlZ3KUK2ck8RF
 WvfCACAXJ0ULW5eYFVPUsmWESzshQJFetaHcWdS1Q2bbgo05K5tzkRiRFuXqMsTOEhFI9pIxJoj
 yqRJJp8kRAoKhVpsKqRa9eI8bZkNdhaoqQNVw0IuHR5PGpcK0aBB9VJfC2xxfvgdCX/bhVv7LWz
 ZW+WRJg/OTdTQm/VT9Zs+gTDsB6JjEz3VmmzkVumyv9LEGMia7iakWoDLMrXQN7gLkshVn9S8bw
 KpE1/w/Q5QkhsP8EtiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX2sw+DYVze8V9
 7Y0aLr5DpYNHW2qSgwp/2zairBKo73LAGt3o2FPrfNUyCgueIY+g0BiqTnH0yay0mTIeaoS6jlw
 204yjUcwQV/FnDVGndwRxYgKavHzJzc=
X-Proofpoint-GUID: WgBXimJ4mjXMh9Fdb9jPcIShEF6to_c3
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5c781 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Nw0S1nEOTGD2y6cCEogA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120056
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

Enable runtime byte-order selection for aarch64-linux-user
and retain qemu-aarch64_be as a compatibility symlink.
Deprecate the symlink since 12.0 and recommend qemu-aarch64
for both ELF byte orders.
Remove the separate aarch64_be-linux-user build target and
obsolete CI exclusions.

Run the existing big-endian hello test through qemu-aarch64
while retaining its big-endian fixture toolchain. Document
that executable name compatibility does not preserve the
removed target-list spelling.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 docs/about/deprecated.rst                 | 13 +++++++++++++
 docs/user/main.rst                        |  7 +++++++
 configs/targets/aarch64-linux-user.mak    |  2 ++
 configs/targets/aarch64_be-linux-user.mak | 10 ----------
 .gitlab-ci.d/buildtest.yml                |  2 +-
 .gitlab-ci.d/crossbuild-template.yml      |  4 ++--
 tests/tcg/aarch64_be/meson.build          |  4 ++--
 7 files changed, 27 insertions(+), 15 deletions(-)
 delete mode 100644 configs/targets/aarch64_be-linux-user.mak

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 0891bbc44ded..20eb4268f640 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -438,6 +438,19 @@ It was implemented as a no-op instruction in TCG up to QEMU 9.0, but
 only with ``-cpu max`` (which does not guarantee migration compatibility
 across versions).
 
+linux-user mode executables
+---------------------------
+
+.. _deprecated-qemu-aarch64-be:
+
+``qemu-aarch64_be`` executable name (since 12.0)
+''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``qemu-aarch64_be`` compatibility symlink is deprecated.
+Use ``qemu-aarch64`` instead for both little- and big-endian
+Linux ELF executables. The emulator selects the byte order from
+the ELF header, regardless of the executable name used to invoke it.
+
 linux-user mode CPUs
 --------------------
 
diff --git a/docs/user/main.rst b/docs/user/main.rst
index a8ddf9142495..9dcea8dac4d0 100644
--- a/docs/user/main.rst
+++ b/docs/user/main.rst
@@ -65,6 +65,13 @@ emulator.
 Linux User space emulator
 -------------------------
 
+For AArch64, ``qemu-aarch64`` runs both little- and big-endian Linux ELF
+executables, selecting the byte order from the ELF header. ``qemu-aarch64_be``
+is a :ref:`deprecated compatibility symlink <deprecated-qemu-aarch64-be>`
+to the same emulator; its name does not override the ELF byte order.
+Build both names with ``--target-list=aarch64-linux-user``; the separate
+``aarch64_be-linux-user`` build target is no longer supported.
+
 Command line options
 ~~~~~~~~~~~~~~~~~~~~
 
diff --git a/configs/targets/aarch64-linux-user.mak b/configs/targets/aarch64-linux-user.mak
index ddfacc092ddf..efe372021ce8 100644
--- a/configs/targets/aarch64-linux-user.mak
+++ b/configs/targets/aarch64-linux-user.mak
@@ -1,5 +1,7 @@
 TARGET_ARCH=aarch64
 TARGET_BASE_ARCH=arm
+TARGET_RUNTIME_ENDIAN=y
+TARGET_USER_ALIASES=aarch64_be
 TARGET_XML_FILES= aarch64-core.xml aarch64-fpu.xml aarch64-pauth.xml aarch64-mte.xml aarch64-sme2.xml
 TARGET_HAS_BFLT=y
 CONFIG_SEMIHOSTING=y
diff --git a/configs/targets/aarch64_be-linux-user.mak b/configs/targets/aarch64_be-linux-user.mak
deleted file mode 100644
index 83209fa2ae54..000000000000
--- a/configs/targets/aarch64_be-linux-user.mak
+++ /dev/null
@@ -1,10 +0,0 @@
-TARGET_ARCH=aarch64
-TARGET_BASE_ARCH=arm
-TARGET_BIG_ENDIAN=y
-TARGET_XML_FILES= aarch64-core.xml aarch64-fpu.xml aarch64-pauth.xml aarch64-mte.xml aarch64-sme2.xml
-TARGET_HAS_BFLT=y
-CONFIG_SEMIHOSTING=y
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
-TARGET_SYSTBL_ABI=common,64,renameat,rlimit,memfd_secret
-TARGET_SYSTBL=syscall_64.tbl
-TARGET_LONG_BITS=64
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index b1e95395d0c3..a603c93cb799 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -451,7 +451,7 @@ clang-user:
   variables:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --cc=clang --cxx=clang++ --disable-system --enable-ubsan
-      --target-list-exclude=alpha-linux-user,microblazeel-linux-user,aarch64_be-linux-user,i386-linux-user,m68k-linux-user,mipsn32el-linux-user,xtensaeb-linux-user
+      --target-list-exclude=alpha-linux-user,microblazeel-linux-user,i386-linux-user,m68k-linux-user,mipsn32el-linux-user,xtensaeb-linux-user
       --extra-cflags=-fno-sanitize-recover=undefined
     MAKE_CHECK_ARGS: check-unit check-tcg
 
diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 94423814a751..32c11f4895b5 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -70,8 +70,8 @@
     - cd build
     - section_start configure "Running configure"
     - ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
-        --disable-system --target-list-exclude="aarch64_be-linux-user
-          alpha-linux-user m68k-linux-user microblazeel-linux-user
+        --disable-system --target-list-exclude="alpha-linux-user
+          m68k-linux-user microblazeel-linux-user
           or1k-linux-user ppc-linux-user sparc-linux-user
           xtensa-linux-user $CROSS_SKIP_TARGETS"
     - section_end configure
diff --git a/tests/tcg/aarch64_be/meson.build b/tests/tcg/aarch64_be/meson.build
index c1873cd5606c..08d29a94e702 100644
--- a/tests/tcg/aarch64_be/meson.build
+++ b/tests/tcg/aarch64_be/meson.build
@@ -6,7 +6,7 @@ tests += {
   'hello.c': {'cflags': ['-mbig-endian', '-ffreestanding', '-nostdlib']},
 }
 
-if 'qemu-aarch64_be' in emulators
+if 'qemu-aarch64' in emulators
   tcg_tests += {
     'aarch64_be-linux-user': {
       'cc': 'aarch64-linux-gnu-gcc',
@@ -14,7 +14,7 @@ if 'qemu-aarch64_be' in emulators
       'cc_dockerfile': 'debian-all-test-cross',
       'folder': 'aarch64_be',
       'gdb_arch': 'aarch64_be',
-      'qemu': emulators['qemu-aarch64_be'],
+      'qemu': emulators['qemu-aarch64'],
       'tests': tests,
     }
   }
-- 
2.55.0


