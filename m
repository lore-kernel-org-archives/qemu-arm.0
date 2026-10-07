Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844DDCA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 11:55:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEQDc-0000PI-GV; Wed, 07 Oct 2026 07:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xEQDV-0000Ek-Hp
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 07:53:52 -0400
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xEQDU-0007zt-00
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 07:53:49 -0400
Received: by mail-dl1-x1230.google.com with SMTP id
 a92af1059eb24-15756f82e8aso1130835c88.1
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 04:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791374026; x=1791978826; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3776CLp541OEwyOHu/UC1V9cuWUL7746DEpJsnTYqMk=;
 b=XfjUw1ENz/bqATs7+ggLntpdHtaCEUQ5hO0MU8D0Oxxao8acCB+ki8CftMx2B8qtPb
 r69sYA2T19vuwxcvqSSBXW7P6JN6U5e6tmCUo4gTEnQaUtq4Qz405odus2J64gILkZft
 meCc5jpdmLjDeV7uf849wKYUsufV7d4JvU0GYy0ifzBwjOdmUDIHit2r0XBjitPkNaF+
 4ac1AFFXL5NxCmBkc5VK4m+ya4fhXgrIm8vyJMNputodeTmKZdr6+rBSE1TPpTD5D43q
 kcZuH0kTY0q61m8YNZZ2RT7s0yEHrpPkrhHmhgKcr48Jd1sFQaTsFfDa1KLuUCX/n8zP
 TEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791374026; x=1791978826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3776CLp541OEwyOHu/UC1V9cuWUL7746DEpJsnTYqMk=;
 b=cDDzWapNY/vyMagFznS5DkO2DKaWgB5jLVRG01DAOH0AQrSESAtKqL6a9il+438OXA
 C41d+siAWZuKn7woc9KtGxK9d4thHWmdDXOPJks2bGoLukwi5iLTtCaJ+oLN+SbFnuCF
 PNdPLyRtsIsi8lIjcdAkxOkeci874O3ewKHpN229dCWR67wtlCMaQ34vnxXaJBi4osqV
 Udgk4iLD7K2OblmMM0lPFA5PBd56vcfoDgMo06BZbK1kxRLXsqkk6vlQVa1rQMWa3xpA
 xKOOZ8J6QyyJtHgcHKQuxl3Rtb6VLdb+Ok3LkRp+/Q4xFAgZzXGjbU2/piRnTVUzabXw
 IIsg==
X-Forwarded-Encrypted: i=1;
 AKwUvByqTzF5ROyxcI5bRKMjDtS6AINx/Yjxn6cRY+Gx/pBXtAyg4g6D1wAmuVo0/LgI6CZmp74vZI4mog==@nongnu.org
X-Gm-Message-State: AFuF++kCQTYHnfOcaibcMORxx6o6df7SIGwWbkiVSV/BflmaAkXbC2Y1
 ZPV4wk044MFNMMPEPgio2/KrtygIOSIirPDSSiC4tLr2sIFWhUdOpx5o
X-Gm-Gg: AYBFou12kz3KZg8uTMnmDioDGbkGMdoGpJLTxkWA6nEcyvdFBFx47SgdffsBOXTCSFl
 2wXAx/EkWQeMIjDE8AuUYCCqvHnsexSxk/wFGEa9T6uaMTyzH37U2/KrhrFex67QHgUNSZtLcjx
 ExMUHi55u7bJmJZjmZ0zt0Cx0KVk7+dODbYTtUAl/IBvf9X4qJaaIqffWELFzJSFhMEaJ6WaKkX
 vByxUZGzcwecQWflM7BAjGazzZVvTgbY5N7PMy/kT2F9ucczrAYH0OD2w5pvQig/CDJjht+m0AT
 dGFGW0r7P03mOplAPx4kh+Opo8TGNetdOzI5e39ZJggIcuEw1tOs/D6KyWnp6kPZNMYoo59zfxT
 Mncl2bnXdYVrxygp8qt9hNIptNnf4UlmUfGmLyxuKhBKX10YNxAjt2NApVmC+6M5qhdj2aHZwv5
 EsmESi1+xodwhOPItf0t6tvL+BKSKpkGEAP+N37OKtpnFSyb+AE4P4j28vB+CmfIV1zBoSeYbsM
 hpo5mgUtAdQtswMW9E=
X-Received: by 2002:a05:7022:439b:b0:14a:a6dc:9cbf with SMTP id
 a92af1059eb24-16205044165mr2803386c88.4.1791374026296; 
 Wed, 07 Oct 2026 04:53:46 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1616980c3b7sm6429520c88.16.2026.10.07.04.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 04:53:45 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Stafford Horne <shorne@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>
Subject: [PATCH 6/8] meson: load all target .mak files into target_mak_all
Date: Wed,  7 Oct 2026 19:48:03 +0800
Message-ID: <20261007115253.328-7-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261007115253.328-1-luoyonggang@gmail.com>
References: <20261007115253.328-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1230;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Load every configs/targets/*.mak once into target_mak_all, keyed by
target_dirs_all, with TARGET_BASE_ARCH defaulted to TARGET_ARCH. The
per-target loop now takes its config from target_mak_all instead of
loading the file again.

target_dirs is still the --target-list filtered subset and is the only
list built. target_mak_all is for later use by code that needs target
properties independent of --target-list, such as generating
TargetInfo helpers for every target.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 meson.build | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index fd7a4f68389..d070dafe2a9 100644
--- a/meson.build
+++ b/meson.build
@@ -3239,6 +3239,21 @@ config_target_mak = {}
 config_base_arch_mak = {}
 config_target_info = {}
 
+# Load every configs/targets/*.mak unconditionally; target_dirs is the
+# --target-list filtered subset of target_dirs_all.
+target_dirs_all = run_command(python, '-c',
+  'import os, sys; print(" ".join(sorted(f[:-4] for f in os.listdir(sys.argv[1]) if f.endswith(".mak"))))',
+  meson.current_source_dir() / 'configs/targets',
+  check: true).stdout().split()
+target_mak_all = {}
+foreach target : target_dirs_all
+  mak = keyval.load('configs/targets' / target + '.mak')
+  if 'TARGET_BASE_ARCH' not in mak
+    mak += {'TARGET_BASE_ARCH': mak['TARGET_ARCH']}
+  endif
+  target_mak_all += {target: mak}
+endforeach
+
 disassemblers = {
   'alpha' : ['CONFIG_ALPHA_DIS'],
   'avr' : ['CONFIG_AVR_DIS'],
@@ -3318,7 +3333,7 @@ foreach target : target_dirs
     }
   endif
 
-  config_target += keyval.load('configs/targets' / target + '.mak')
+  config_target += target_mak_all[target]
 
   target_kconfig = []
   foreach sym: accelerators
@@ -3348,9 +3363,6 @@ foreach target : target_dirs
 
   # Add default keys
   config_target += { 'TARGET_' + config_target['TARGET_ARCH'].to_upper(): 'y' }
-  if 'TARGET_BASE_ARCH' not in config_target
-    config_target += {'TARGET_BASE_ARCH': config_target['TARGET_ARCH']}
-  endif
   if 'TARGET_ABI_DIR' not in config_target
     config_target += {'TARGET_ABI_DIR': config_target['TARGET_ARCH']}
   endif
-- 
2.55.0.windows.3


