Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093A1CA1013
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:20:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu58I-0001nw-RT; Thu, 04 Sep 2025 04:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54x-0006VY-Gh
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:25 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54S-00047b-QU
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:19 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-61c26f3cf0dso1201790a12.1
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973510; x=1757578310; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iadk247wa0jmFN7Lhbe5pHyYM/9Bx/fgTyvCZLz4RjI=;
 b=SeqMCnmTiLk6454+6vwk5vLADnGSUQsr/SNVkLJfv499lyTaQ/E0oCXIitV497Cm0w
 /COonz4AsMg/aeptE8K71JeiJw+kUbjPv6qvqQAvnXoE6e8mHKTFrcpdZEkG7F40pXPR
 OZlbtGmdmeZp4WuTlU0C57TN/Cjdp/ucfkiokYfn21BhI75rasENH7QUirqy2gVq66cI
 FPh07LDHx+LAqv03NdNsh3qaiU8INedF+Av1bkgbme5kZZN2ppzlthKrVpXy20guqOTO
 rLXKEK6EUIL8NbCa/c0HLwM/l8R9LPk2dbis16tZX7fOBuGPcng+h+B/p6Oc24pF2ZLQ
 KrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973510; x=1757578310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iadk247wa0jmFN7Lhbe5pHyYM/9Bx/fgTyvCZLz4RjI=;
 b=bkHi2noSLHyRZx1Jw2v0j2vN14qoO55j+AnCOzuzz0U4B8jCzjnNJYvBLA7craDAQa
 yX1TpbZ84iFcAmNqTx5Y1rs3clgWtEJ2XrzLZKg35YGfWLmB61byD7aBXl7EFt2Zs72N
 /pTWNUJ5zvmk3XRFt71zKOR8/xwBNufpg3a8oIk0uSaFJ6qeg3dg82rFjIsRZpleBhYq
 RryBTJ6I+L9i/UMwnmaP/9HTQg/MsfUWVVsSw9pmQtuMZET2YXp3C6BoBQaaVqCZBsyb
 Xi1C3IYoWFmC6xlxBk/Bho7ZjuO76EyHKf3rWrzTcIx/08SJjx69R+M/IGpaP/idKCOK
 M2QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0Ho9yP3GcSoAMbg/oEI4Xt+8i1bsSWUy+e/w5CpMaGa/gjPGVk8kc+ckg2GceQxiZfcXHApG/Iw==@nongnu.org
X-Gm-Message-State: AOJu0YwpWS/YEfULfcFs7d96Ad0T1hjjhjsYPTYQSjsFeaBGCIguIB+b
 qCmjeW90Z9QvpZHtpNqgt5bosPkvEVbnQMdJDnW27GsZhx5JcXksWvHzp/t5JIMsGhU=
X-Gm-Gg: ASbGncvTit0xuXD3PIN4kKwb9/fogFmpUcswqoTIV78HDsJbnZxyG8AdM8PAYFgj/gy
 eRmNVSrMCcYsvEEQXgNnPUBBwyX0phDHbBP9D2f4k0nyc8WUN6yEVJ9nDxf72RdSmviJw0wpYy2
 BB1Qr7fL8euMz0WjVchT2uZoaLCSff7BqvSyrQ6f53HE/OJDImK4cSuWaWn8Bsd0lfFhKuZCptd
 bvmrQz/sPSZQaKp0V05qOnEHlP6z0PDyB3SedZbShQUjnECtGTYlh15TKAydpab/jpVXjONplSH
 3gJFv25zCAYAEeJv22G0furbbMz47lrTbBnUy/dtCsiSmQHtGHTZW+EWyZIdkGNPjr9LkyVGj6J
 LWj/UIWHNMmZcBvuS9XE2l+FxWzdtU4rEYg==
X-Google-Smtp-Source: AGHT+IHAHTEjir+BwL4SeKgB+PnmLO4Ci/chovokQ0iZiuKeBhU50jT8UQ8cRQu6FT+TxTvx6pvlPw==
X-Received: by 2002:a05:6402:2115:b0:61e:ca25:3502 with SMTP id
 4fb4d7f45d1cf-61eca25373emr6417672a12.17.1756973509716; 
 Thu, 04 Sep 2025 01:11:49 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c7848sm14413068a12.2.2025.09.04.01.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:43 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D5A395FAAE;
 Thu, 04 Sep 2025 09:11:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Helge Deller <deller@gmx.de>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-rust@nongnu.org, Bibo Mao <maobibo@loongson.cn>,
 qemu-riscv@nongnu.org, Thanos Makatos <thanos.makatos@nutanix.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Riku Voipio <riku.voipio@iki.fi>, Cameron Esfahani <dirty@apple.com>,
 Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, devel@lists.libvirt.org,
 Mads Ynddal <mads@ynddal.dk>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Peter Xu <peterx@redhat.com>, Jason Herne <jjherne@linux.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Warner Losh <imp@bsdimp.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Chinmay Rath <rathc@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Michael Roth <michael.roth@amd.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, John Levon <john.levon@nutanix.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 022/281] tests/functional: Move i386 tests into
 architecture specific folder
Date: Thu,  4 Sep 2025 09:06:56 +0100
Message-ID: <20250904081128.1942269-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Thomas Huth <thuth@redhat.com>

The tests/functional folder has become quite crowded, thus move the
i386 tests into a target-specific subfolder.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20250819112403.432587-11-thuth@redhat.com>
---
 MAINTAINERS                                            |  3 ++-
 tests/functional/i386/meson.build                      | 10 ++++++++++
 .../{test_i386_migration.py => i386/test_migration.py} |  0
 .../{test_i386_replay.py => i386/test_replay.py}       |  0
 .../{test_i386_tuxrun.py => i386/test_tuxrun.py}       |  0
 tests/functional/meson.build                           | 10 +---------
 6 files changed, 13 insertions(+), 10 deletions(-)
 create mode 100644 tests/functional/i386/meson.build
 rename tests/functional/{test_i386_migration.py => i386/test_migration.py} (100%)
 rename tests/functional/{test_i386_replay.py => i386/test_replay.py} (100%)
 rename tests/functional/{test_i386_tuxrun.py => i386/test_tuxrun.py} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2e1754912f6..2b109ecc18c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -146,6 +146,7 @@ F: target/i386/*.[ch]
 F: target/i386/Kconfig
 F: target/i386/meson.build
 F: tools/i386/
+F: tests/functional/i386/
 
 Guest CPU cores (TCG)
 ---------------------
@@ -1891,7 +1892,7 @@ F: hw/isa/apm.c
 F: include/hw/isa/apm.h
 F: tests/unit/test-x86-topo.c
 F: tests/qtest/test-x86-cpuid-compat.c
-F: tests/functional/test_i386_tuxrun.py
+F: tests/functional/i386/test_tuxrun.py
 F: tests/functional/test_linux_initrd.py
 F: tests/functional/test_mem_addr_space.py
 F: tests/functional/test_pc_cpu_hotplug_props.py
diff --git a/tests/functional/i386/meson.build b/tests/functional/i386/meson.build
new file mode 100644
index 00000000000..23d8c216be7
--- /dev/null
+++ b/tests/functional/i386/meson.build
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+tests_i386_system_quick = [
+  'migration',
+]
+
+tests_i386_system_thorough = [
+  'replay',
+  'tuxrun',
+]
diff --git a/tests/functional/test_i386_migration.py b/tests/functional/i386/test_migration.py
similarity index 100%
rename from tests/functional/test_i386_migration.py
rename to tests/functional/i386/test_migration.py
diff --git a/tests/functional/test_i386_replay.py b/tests/functional/i386/test_replay.py
similarity index 100%
rename from tests/functional/test_i386_replay.py
rename to tests/functional/i386/test_replay.py
diff --git a/tests/functional/test_i386_tuxrun.py b/tests/functional/i386/test_tuxrun.py
similarity index 100%
rename from tests/functional/test_i386_tuxrun.py
rename to tests/functional/i386/test_tuxrun.py
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 8f85c13d3d1..f1fc01717c3 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -14,6 +14,7 @@ subdir('alpha')
 subdir('arm')
 subdir('avr')
 subdir('hppa')
+subdir('i386')
 
 test_mips_timeouts = {
   'mips_malta' : 480,
@@ -79,15 +80,6 @@ tests_generic_linuxuser = [
 tests_generic_bsduser = [
 ]
 
-tests_i386_system_quick = [
-  'i386_migration',
-]
-
-tests_i386_system_thorough = [
-  'i386_replay',
-  'i386_tuxrun',
-]
-
 tests_loongarch64_system_thorough = [
   'loongarch64_virt',
 ]
-- 
2.47.2


