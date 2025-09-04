Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF76DCA1013
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:18:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu58M-00029n-AW; Thu, 04 Sep 2025 04:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54y-0006Vh-7n
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:25 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54U-00049K-EP
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:23 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-61cd3748c6dso1329308a12.3
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973513; x=1757578313; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eSaSrwUYSOayX0ze9g9+lMGmnZ0XX0Src5mJ41Ycn+k=;
 b=Cij7syhVINC0cdmTmh6RymjKcAFltCOXaLZO4pZYDK/AWUVxAy9MJ/3KkvuTnfkVEr
 CONzhvdaQJbk9o5XiveqXS1nnrr1ZfdUx/1XE0PISBmC0g0REigZCzccdWZBD6AsqXGr
 gU6JffLtcF8UsWRG1WVvu0xbPsCEiUJHhc1GnuMQAGyFaZ6jXxt8FqtXkzgiK1a71ZZD
 rO1DsjnkKRwqAM/yj3T+FmMBiV7W2t4rZprQLTmMjhdLAVRlk9wHo7+EoLec9m8ayqb0
 2myYLNGoWhs69r3ZZRkxZ8flnX0X+DN6LkbGQBpDdmzSZCTrOTmWJu3JkPo5RF3ZU23r
 NaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973513; x=1757578313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eSaSrwUYSOayX0ze9g9+lMGmnZ0XX0Src5mJ41Ycn+k=;
 b=D1zBCbK/r7iUPKQttFena3BjBDXuy6waV2N4NFmJVMYoO5NdK5cntLxo8GkVbRApoY
 753425vJKqysHalfhdClpoAzZX53NneTygFah/XEKH7FgxiLuSCEELRozGjAEIXVOrSH
 va5wz4DU+Lv8ytTASw09xF3kUGhLIqAa4JzMdJaIX5dFqiPWLAeelP5dNiHCTfV6uMRo
 mY3tNx656/r9JT7W7bwjbRknC1QFoVZzhHdLVtkz8YFy0lvA/yIzNHmudiBMwI4F4mxa
 JSQgAZ8Rt/DJG9DYDbmBg2cKGtHsX7D2SFGVjoGqICwGNJWvBKBY+Ve6QQ4ws1PQW46n
 a7vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAgcYI7yN/JLf7n2+YpmsbroepDsppak8pqn5J2tdWKpCuP2KtjoA0OvHfB9r0nzjPgnz7q5tLQA==@nongnu.org
X-Gm-Message-State: AOJu0YwoYzv2yRdNscQBGcgqfKY6hjyfvcYw7c+OtadhK7uIIh8cAMMp
 JfE3BHQTg/WTNDy4n1NGSw1gjo3vkoXDbf0T8hz59RS2Ui5dEwxkJaoQ33InvYm+6Zs=
X-Gm-Gg: ASbGncvxhvZzezmrs+X1SH6/mnY7a8KihtVCTNGACu0bZlSwQ6D2FipgcNQg4HsCXTM
 Hsh2s9iNc4d+3I045arX+vNGQgoY2b2WtDaaxt4C6WgVt9z2EbLtPZByTlL/nQ/fNZu92ASptrm
 UJVROuhzoRs0Syt6iGBYtHEITPsrihKtP+maTb5e2i6XPymRUc3Xsbpijb0rvHAP0acTCXWo7sj
 ONG7Es75WSbr2rTfbFA5bDRO3F5jyybWrwDOvVCu6P/vbCzS2OLr4mp0EfCB+Odg2Ogz+RMo7mi
 tdYkYC0Xsb515TTCKVLRCLuFDF8HyqgKbIZ0sAhPxSi+vsNHYTcDOZizUaWDnvNGVtsAVNSj10x
 Y9pK1yjQ4xF+no40aiGPQ2ok=
X-Google-Smtp-Source: AGHT+IGLuLEHDMdceQbPHHpmcGy/yiy//i65J2KOm3EjqZSFkYkVq5LlhG4GDCyntij5BRe41onYZw==
X-Received: by 2002:a05:6402:278d:b0:61c:8c63:a91e with SMTP id
 4fb4d7f45d1cf-61d26d80542mr15376751a12.25.1756973512260; 
 Thu, 04 Sep 2025 01:11:52 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4e5229sm13693433a12.39.2025.09.04.01.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:49 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9F5C660151;
 Thu, 04 Sep 2025 09:11:32 +0100 (BST)
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
Subject: [PATCH v2 036/281] tests/functional: Move the generic tests to a
 subfolder
Date: Thu,  4 Sep 2025 09:07:10 +0100
Message-ID: <20250904081128.1942269-37-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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

This also removes the line for using tests from the main folder
since we do not have any tests left here. And while we're at it,
also mark the vnc test as generic now since it is not specific to x86.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20250819112403.432587-25-thuth@redhat.com>
---
 MAINTAINERS                                     |  8 ++++----
 tests/functional/generic/meson.build            | 14 ++++++++++++++
 .../{ => generic}/test_empty_cpu_model.py       |  0
 .../{ => generic}/test_info_usernet.py          |  0
 tests/functional/{ => generic}/test_version.py  |  0
 tests/functional/{ => generic}/test_vnc.py      |  0
 tests/functional/meson.build                    | 17 ++---------------
 tests/functional/x86_64/meson.build             |  1 -
 8 files changed, 20 insertions(+), 20 deletions(-)
 create mode 100644 tests/functional/generic/meson.build
 rename tests/functional/{ => generic}/test_empty_cpu_model.py (100%)
 rename tests/functional/{ => generic}/test_info_usernet.py (100%)
 rename tests/functional/{ => generic}/test_version.py (100%)
 rename tests/functional/{ => generic}/test_vnc.py (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 792d2d6f2de..625fe67b41d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1976,7 +1976,7 @@ F: include/hw/core/cpu.h
 F: include/hw/cpu/cluster.h
 F: include/system/numa.h
 F: tests/functional/x86_64/test_cpu_queries.py
-F: tests/functional/test_empty_cpu_model.py
+F: tests/functional/generic/test_empty_cpu_model.py
 F: tests/unit/test-smp-parse.c
 T: git https://gitlab.com/ehabkost/qemu.git machine-next
 
@@ -2197,7 +2197,7 @@ S: Odd Fixes
 F: hw/net/
 F: include/hw/net/
 F: tests/qtest/virtio-net-test.c
-F: tests/functional/test_info_usernet.py
+F: tests/functional/generic/test_info_usernet.py
 F: docs/system/virtio-net-failover.rst
 T: git https://github.com/jasowang/qemu.git net
 
@@ -3134,7 +3134,7 @@ S: Supported
 F: include/qemu/option.h
 F: tests/unit/test-keyval.c
 F: tests/unit/test-qemu-opts.c
-F: tests/functional/test_version.py
+F: tests/functional/generic/test_version.py
 F: util/keyval.c
 F: util/qemu-option.c
 
@@ -3252,7 +3252,7 @@ F: include/ui/
 F: qapi/ui.json
 F: util/drm.c
 F: docs/devel/ui.rst
-F: tests/functional/test_vnc.py
+F: tests/functional/generic/test_vnc.py
 
 Cocoa graphics
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/tests/functional/generic/meson.build b/tests/functional/generic/meson.build
new file mode 100644
index 00000000000..013cc96fbf8
--- /dev/null
+++ b/tests/functional/generic/meson.build
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+tests_generic_system = [
+  'empty_cpu_model',
+  'info_usernet',
+  'version',
+  'vnc',
+]
+
+tests_generic_linuxuser = [
+]
+
+tests_generic_bsduser = [
+]
diff --git a/tests/functional/test_empty_cpu_model.py b/tests/functional/generic/test_empty_cpu_model.py
similarity index 100%
rename from tests/functional/test_empty_cpu_model.py
rename to tests/functional/generic/test_empty_cpu_model.py
diff --git a/tests/functional/test_info_usernet.py b/tests/functional/generic/test_info_usernet.py
similarity index 100%
rename from tests/functional/test_info_usernet.py
rename to tests/functional/generic/test_info_usernet.py
diff --git a/tests/functional/test_version.py b/tests/functional/generic/test_version.py
similarity index 100%
rename from tests/functional/test_version.py
rename to tests/functional/generic/test_version.py
diff --git a/tests/functional/test_vnc.py b/tests/functional/generic/test_vnc.py
similarity index 100%
rename from tests/functional/test_vnc.py
rename to tests/functional/generic/test_vnc.py
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index b1eec16add8..2a0c5aa1418 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -36,18 +36,7 @@ subdir('sparc')
 subdir('sparc64')
 subdir('x86_64')
 subdir('xtensa')
-
-tests_generic_system = [
-  'empty_cpu_model',
-  'info_usernet',
-  'version',
-]
-
-tests_generic_linuxuser = [
-]
-
-tests_generic_bsduser = [
-]
+subdir('generic')
 
 precache_all = []
 foreach speed : ['quick', 'thorough']
@@ -90,9 +79,7 @@ foreach speed : ['quick', 'thorough']
 
     foreach test : target_tests
       testname = '@0@-@1@'.format(target_base, test)
-      if fs.exists('test_' + test + '.py')
-        testfile = 'test_' + test + '.py'
-      elif fs.exists('generic' / 'test_' + test + '.py')
+      if fs.exists('generic' / 'test_' + test + '.py')
         testfile = 'generic' / 'test_' + test + '.py'
       else
         testfile = target_base / 'test_' + test + '.py'
diff --git a/tests/functional/x86_64/meson.build b/tests/functional/x86_64/meson.build
index 696a9ecab42..d0b4667bb8a 100644
--- a/tests/functional/x86_64/meson.build
+++ b/tests/functional/x86_64/meson.build
@@ -16,7 +16,6 @@ tests_x86_64_system_quick = [
   'migration',
   'pc_cpu_hotplug_props',
   'virtio_version',
-  'vnc',
   'memlock',
 ]
 
-- 
2.47.2


