Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A4D606A335
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 18:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DwfR40Vu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CeP3xE7n
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRZGR-00036H-VB; Thu, 12 Nov 2026 13:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRZFo-0001V1-1t
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 13:10:40 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRZFl-0000Vi-Sn
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 13:10:31 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACFZpUa011679
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 18:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 r2LHAnz735b9grJzoDqdjvy4mzlANJ9D9A7HWcMx+po=; b=DwfR40VuGjkTQE/5
 2VUYYN0WeRxJmL+C5RrcAZsUjAap8KAWRdU/qBIE5wljDI4XhcdXWJJpjL5Mh9OM
 ORvbrm0oRPyLWiQJ3eE02nRZnoGU8DwCUmoKYbzVmSmQWKNCtXhD9+FNLPvqru/X
 H7b9LwAUeBolUvuTNUJ8JorCfu2D3iiAGR+oFF4sCssfghNHOXlP61jcn/ZhW8GN
 lJYoHbTZ/buvSYZ8xwzBEXbdE2WTd2GMrbmjuKe5lu0UH3YXrvnrgbo0TKrPi4F5
 Ca5bWvJKRWT5myg+nFS8+ONcWmy7OcvhvyalOpDf/WjJtWPdkZkmpx1ggtqTX89w
 qenFQA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1b8qam-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 18:10:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-54b437451f7so90065701cf.1
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 10:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794507027; x=1795111827; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=r2LHAnz735b9grJzoDqdjvy4mzlANJ9D9A7HWcMx+po=;
 b=CeP3xE7nlm28j3DZDu/0sCjvZnLm1D1ZgOv76Jv6BhgGQiZ/rOzhox14jpSwRk5PWd
 eu+VqLPLNqBW3b6l//GZrtsG4AbIJsIcWnLlVdxplULDwcvgdYSjRKwwbf6DIsXJE+uP
 eHAk3tStUJ1ck7hLxWcTHjZMQN5Wu7M1BZ3gZOpa7AUl7xGyaCqM0igbyAXJbrPp0NSK
 mL3srOyXldBVUSU8dSWZh98IUzUQ+cRWC5gqgtQeqv39zU6ir8RzN3yUqPY2RQHuEPOn
 alRwuMxzjkr7Knmp1g3k2s6wqfE1dRmusUh+xzq1lSC78TzWJbnCygcVxXLrby+P7pIv
 GjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794507027; x=1795111827;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=r2LHAnz735b9grJzoDqdjvy4mzlANJ9D9A7HWcMx+po=;
 b=Vwmn+mnPwaYalkjhBvph3ZVmgT3JBsUVMSf+LKxFUXwqic/N3bTb46wJ3YK+UP/nMu
 TCK4bzW8a9AnOBq8KRGpsg5cUbyyRW3fq/Ozhev0pdwIaoEAsiL3LZl9BoJ9i5ue5Xi8
 +VLAWTJyZTJAtIzcpPkSMVPodNpGPCk+jq4uCqQXicGbn8r6NdJAbglxdDkPCmudAFpt
 qkRK0ftE3R6GDBgMTzhJVYijDYYrWvVbMUlBHy9ZVY48f0Yl8iXgHKKJNBi8cdgPiek8
 ctvaJPLigL8Ywt2qP9GB4/ck8qJFA5Z/0npcdb5niBHvaMGgMCJhszKVLATjl26onrzg
 zlNw==
X-Forwarded-Encrypted: i=1;
 AL+hErG/So4le3FwGP127v/ZWelxA8aEaQYNuIbzePYi2AlkxE0qjNNSOHTij/y4mQeMPeNolWQqyHwTRQ==@nongnu.org
X-Gm-Message-State: APuU4Z+XYK+gIKqG4/NFSNLLCVS8uwkbzV2bkIZ8uSKL7hYMXbDIPZ2l
 /6KW3e+VqqNedgYrfWeckd5t6IRDp+hXr6HOhXiw+KnO74h6MCihpY465teACYJJZahBazYWpqP
 +ascghu2ksD4tAlOMxh9OuL3q/xUsPef8itQ8/Ynk6dxS7RK95WqI9kY=
X-Gm-Gg: AYBFou2jNRlNNHFOvap0Vc2dEa2YZ9T1gxzdvPe2DhbqNxHx4OZGrIx2LOatFYW/jQc
 aJx0LKS4YGjr+IWAwMmakzBuBs/YuXq4CVKxUZyaG05c3aBfbR6m39bN5vz6MqzC7DSbj3AyKfS
 FAEjUbR1PKvSEAbvOgSG4qflmZgwbEZkZ+qYyotdpMfvxmtxkhKLmSWdyOkWFKgoIZZVZzC62JK
 UGW/jNNHFkdpWO4qhfr1imlzy5pzEPZoGe/u+V3rwEpKbMggHy98TH5e/ynz0J9pBzJXc7C8Jcp
 4oZys1kAVIjmTFvWSYe7cKi0nFdnf3yn8yasV4f272XxXbzdfaB0Qnatjz8MsXbGyIO406azD5t
 AFQmGRvPRhjrX6ygaWEfbnL/6C3RuaXr+cVo1mtTqXP5dp967WnpcduKm52kxeGlV4ApOH+pW5t
 Wm2kqP4Iw8vW31JQ==
X-Received: by 2002:a05:622a:4d43:b0:535:13c1:ce94 with SMTP id
 d75a77b69052e-55ac7b5cd28mr2935281cf.38.1794507027234; 
 Thu, 12 Nov 2026 10:10:27 -0800 (PST)
X-Received: by 2002:a05:622a:4d43:b0:535:13c1:ce94 with SMTP id
 d75a77b69052e-55ac7b5cd28mr2934571cf.38.1794507026455; 
 Thu, 12 Nov 2026 10:10:26 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e29d24dsm89296145e9.11.2026.11.12.10.10.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Nov 2026 10:10:25 -0800 (PST)
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
Subject: [PATCH-for-12.0 v2 11/12] linux-user/aarch64: Unify both endianness
 under qemu-aarch64
Date: Thu, 12 Nov 2026 19:08:57 +0100
Message-ID: <20261112180859.85380-12-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261112180859.85380-1-philmd@oss.qualcomm.com>
References: <20261112180859.85380-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af60114 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JmjU81yCxh27biOgx0QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: mJdkn5ZkTWq5o8FlIyscbguN380HvIDZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfX6mYxMHARV3GZ
 a5+faVRRFQJ6LtkSvVCUUjrNpVpBsbZD0K38UQpBvD8L3090DpW6rDzpbz1gwQaFmiEFuNX+PHB
 ZmYtlDmQBH+jIY7UsIRqrrSOz8wWM7xGcPmWslt9U6vm/GbPbjFTSBdoAGVQs8jKdg24mBwUkud
 TrlbA6plEwLT+DKPhyKmcfA+6U303dZRFE59pGHkuBvIrCcGIHXzzVZxdWpE5/quk5APfL3RIvv
 G1C38g9Bc5lOM7F+OqMA2ulRQr6SYE7+yxRA3aNcmU1W9iPC9B7iu3HG+TBAvKdsdG2yXzfGY7v
 vT1rdHUW5rLvf6ez6S0Qs7ua2K+Vk/rSUVTyzxfltkTCzcCXLE7uM/GyJ2iufACCOCAzl7tw93t
 A76uOHDRQEb3Zqf7vnX8PkhXAXTY/qVONAlfqW8lNpHJ86hmBJZLq7seN0HR8prYH9JRuZqyE+W
 kQNP/ONCIxfhMtJeTOg==
X-Proofpoint-ORIG-GUID: mJdkn5ZkTWq5o8FlIyscbguN380HvIDZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfX3uKOMmyDVn7k
 6b3sTWkBi/UDxwulALdoznyP6Twyxtx/QT9h+4HQ87BWoBBmKQ17fcgJCrJ4AVhKkAEcCt5Nyvo
 Omj72PU5xCr4ENHGuNKnody08BASklk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
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
 docs/user/main.rst                        |  8 ++++++++
 configure                                 |  9 ++++++++-
 configs/targets/aarch64-linux-user.mak    |  2 ++
 configs/targets/aarch64_be-linux-user.mak | 10 ----------
 .gitlab-ci.d/buildtest.yml                |  2 +-
 .gitlab-ci.d/crossbuild-template.yml      |  4 ++--
 tests/tcg/aarch64_be/meson.build          |  4 ++--
 8 files changed, 36 insertions(+), 16 deletions(-)
 delete mode 100644 configs/targets/aarch64_be-linux-user.mak

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 0891bbc44ded..715a72d8b117 100644
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
+Linux ELF executables. The emulator selects the endianness from
+the ELF header, regardless of the executable name used to invoke it.
+
 linux-user mode CPUs
 --------------------
 
diff --git a/docs/user/main.rst b/docs/user/main.rst
index a8ddf9142495..c9b4204dcf9d 100644
--- a/docs/user/main.rst
+++ b/docs/user/main.rst
@@ -65,6 +65,14 @@ emulator.
 Linux User space emulator
 -------------------------
 
+For AArch64, ``qemu-aarch64`` runs both little- and big-endian Linux ELF
+executables, selecting the byte order from the ELF header. ``qemu-aarch64_be``
+is a :ref:`deprecated compatibility symlink <deprecated-qemu-aarch64-be>`
+to the same emulator; its name does not override the ELF byte order.
+Build both names with ``--target-list=aarch64-linux-user``; the separate
+``aarch64_be-linux-user`` build target is no longer supported.
+For bFLT, which has no byte-order marker, QEMU uses the little-endian default.
+
 Command line options
 ~~~~~~~~~~~~~~~~~~~~
 
diff --git a/configure b/configure
index af14a9c23efd..821a887a31c1 100755
--- a/configure
+++ b/configure
@@ -1107,7 +1107,14 @@ else
             *" $target "*)
                 ;;
             *)
-                error_exit "Unknown target name '$target'"
+                case "$target" in
+                    aarch64_be-linux-user)
+                        error_exit "Target '$target' is no longer supported; use 'aarch64-linux-user' instead"
+                        ;;
+                    *)
+                        error_exit "Unknown target name '$target'"
+                        ;;
+                esac
                 ;;
         esac
     done
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


