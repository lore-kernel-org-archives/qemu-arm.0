Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80368CA1012
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:17:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu56A-0007t5-M0; Thu, 04 Sep 2025 04:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54p-0006QK-6d
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:18 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54O-00045H-GS
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:12 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-61cf8280f02so1034027a12.0
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973506; x=1757578306; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ToC1ebEyvx+viBNvPFVlKTy11Wh6Rf+bOVhd1Ayq6zY=;
 b=VWkwN+/jOYHyhXYJwbiUqFtPtZHNPLTj8Vmc4S2XxKiyY+7tox7UNvpqHEfLWpGQ/h
 lvQDKcjpFSQ2wC3eKeO2/zhwJ9N8a/5cLtHHTvIxJSEhqEcMuzkttILvZ92qosrM5WEZ
 MNfqnY9AKY1FpkMjjAYSsMau9kQe+sO+baNuAXue/HWqe0miIi0xUtWiAL+15XuPVpnI
 yfeneYOymGBrlRZjvhzzjbxRf4/aSJ2ePj44ZTcZeRDBVOVqO2q4HpgGbeR5NamyJarw
 XPTNRcbmvCEet7NgKDieukazR8rdM6/Z4X8RzfXo21/ZXUY4UkGfQVJClqRhZvHFenJN
 BW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973506; x=1757578306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ToC1ebEyvx+viBNvPFVlKTy11Wh6Rf+bOVhd1Ayq6zY=;
 b=atfyA3DI4bAnqRdbrMQnk086O6q+UPoHyPgVy0/4eyLUYk6zM0irGHVCpobl+ah86v
 Bj9nqBiX+DFZX8edRq/EoZgb1v4PhzRTfQ2VeMrIAUlhnv8YxqWdy6MKm5FdI2HtftSZ
 A7lREWhDTXfCetXH62kFD15A861PcDF0+krMHBvHixu4Q7/wW+4g3CKR8pHdhYIsjdJ8
 1kQGOGHGFJqMow9dzd7fvfY5WeYDs1TEtbZl/HctjOvNCPsKZi+B7TjbdSLNqYLoXER+
 0z9vb/AM6oQ2c7ydAzYJh6mTwRsmzQcLKnrnyYEq6Dt1lczQDbwpkDEyuUHoPz4o84Ns
 i36g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRKBt/rrRtlNkDMcOvYBRXULcmvYqPPTLlLR3TkJklCXOC4CEWHjbzwMvvUG6+Xk6yeqMIn2+JRQ==@nongnu.org
X-Gm-Message-State: AOJu0YzRb+Z1dyHXi615CREffxzZC7XhdNU7BsSuvbDdu0NcEY8Kr8JF
 VKh2In/u6TwGuFEIC4CD2xy87RpZqr8AL8sdI2NzaVpyrVoeih/IXjTuyIrmIUHnnJo=
X-Gm-Gg: ASbGncu97TB4HNW6Aq0qbPSdSaxydZQM11bWqQ1CVLK6hK3jiW7Qoar7+3kX3EjQCqv
 ZdXVHlCWjDlQ+evVUF0tFQIinH9mIbBefRk1yT67nPnlNYDysqdwdkmJmtnyx/MljIM2zDPXsJX
 ZP1fbZv1kTmkev/oH+SX/YoGy0E9K/d/+GThaEUH2puNyaaCJpf+JbrVhmyLNbmbfq/EchsjWKP
 M5VO+SE1SrSRgemesJuZHxQwAVT4ME07DAS0mZ81mRcqj6WxuY5FrCe5F+d25UMZiz1Fsi0T2e4
 THavcHkTSl4B/BuF6M1hGDUBqp7ugFtPoroiu6YYsY0uFzWQBphmBD+FLelCvouS3M67gEDEWpN
 FkaOLDWUuKQZxKF6j4ghFcSY=
X-Google-Smtp-Source: AGHT+IHeOl+XaapxB+6EIvAn4yhQXCrxxb3dopvbnn9YTOxhvZYiRqk/3VEaWlDGlnIbEeUwNRB0HQ==
X-Received: by 2002:a05:6402:1e8f:b0:618:139d:3128 with SMTP id
 4fb4d7f45d1cf-61d26c52969mr14180923a12.17.1756973504811; 
 Thu, 04 Sep 2025 01:11:44 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61eaf588377sm7032393a12.15.2025.09.04.01.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:43 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 595EA5FA5C;
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
Subject: [PATCH v2 018/281] tests/functional: Move alpha tests into
 architecture specific folder
Date: Thu,  4 Sep 2025 09:06:52 +0100
Message-ID: <20250904081128.1942269-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
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

The tests/functional folder has become quite crowded already, some
restructuring would be helpful here. Thus move the alpha tests into
a target-specific subfolder.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20250819112403.432587-7-thuth@redhat.com>
---
 MAINTAINERS                                            |  3 ++-
 tests/functional/alpha/meson.build                     | 10 ++++++++++
 .../{test_alpha_clipper.py => alpha/test_clipper.py}   |  0
 .../test_migration.py}                                 |  0
 .../{test_alpha_replay.py => alpha/test_replay.py}     |  0
 tests/functional/meson.build                           | 10 +---------
 6 files changed, 13 insertions(+), 10 deletions(-)
 create mode 100644 tests/functional/alpha/meson.build
 rename tests/functional/{test_alpha_clipper.py => alpha/test_clipper.py} (100%)
 rename tests/functional/{test_alpha_migration.py => alpha/test_migration.py} (100%)
 rename tests/functional/{test_alpha_replay.py => alpha/test_replay.py} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index a2a5ccea7b6..8115aae6183 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -189,6 +189,7 @@ M: Richard Henderson <richard.henderson@linaro.org>
 S: Maintained
 F: target/alpha/
 F: tests/tcg/alpha/
+F: tests/functional/alpha/
 F: disas/alpha.c
 
 ARM TCG CPUs
@@ -656,7 +657,7 @@ S: Maintained
 F: hw/alpha/
 F: hw/isa/smc37c669-superio.c
 F: tests/tcg/alpha/system/
-F: tests/functional/test_alpha_clipper.py
+F: tests/functional/alpha/test_clipper.py
 
 ARM Machines
 ------------
diff --git a/tests/functional/alpha/meson.build b/tests/functional/alpha/meson.build
new file mode 100644
index 00000000000..26a5b3f2e4b
--- /dev/null
+++ b/tests/functional/alpha/meson.build
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+tests_alpha_system_quick = [
+  'migration',
+]
+
+tests_alpha_system_thorough = [
+  'clipper',
+  'replay',
+]
diff --git a/tests/functional/test_alpha_clipper.py b/tests/functional/alpha/test_clipper.py
similarity index 100%
rename from tests/functional/test_alpha_clipper.py
rename to tests/functional/alpha/test_clipper.py
diff --git a/tests/functional/test_alpha_migration.py b/tests/functional/alpha/test_migration.py
similarity index 100%
rename from tests/functional/test_alpha_migration.py
rename to tests/functional/alpha/test_migration.py
diff --git a/tests/functional/test_alpha_replay.py b/tests/functional/alpha/test_replay.py
similarity index 100%
rename from tests/functional/test_alpha_replay.py
rename to tests/functional/alpha/test_replay.py
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 9cb6325360f..a7f8c88a078 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -10,6 +10,7 @@ if get_option('tcg_interpreter')
 endif
 
 subdir('aarch64')
+subdir('alpha')
 
 test_arm_timeouts = {
   'arm_aspeed_palmetto' : 120,
@@ -96,15 +97,6 @@ tests_generic_linuxuser = [
 tests_generic_bsduser = [
 ]
 
-tests_alpha_system_quick = [
-  'alpha_migration',
-]
-
-tests_alpha_system_thorough = [
-  'alpha_clipper',
-  'alpha_replay',
-]
-
 tests_arm_system_quick = [
   'arm_migration',
 ]
-- 
2.47.2


