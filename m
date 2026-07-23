Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89A1C531D0
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Jul 2026 20:09:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmzjI-00063j-Ur; Thu, 23 Jul 2026 16:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wmzjG-00061n-Ux
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 16:09:15 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wmzjD-0006eV-AP
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 16:09:13 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-47f84023916so990251f8f.3
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 13:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784837348; x=1785442148; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=nv8G7uF/vXKYkD7VAxJ3puA+WTb9xEykj6EMLdleuWo=;
 b=TQxGmei4Qa6uWwXLnBDjqzsgDTG1PAsqJf5SLEdfRmDnr2gNvcBB6M/etGqk5MW3LO
 P1LsUXRXma2oPNQQiKYcdLjYQ/6XKDMMSJdon54avmGggmukuvCZNiDrMD+c/YreNPpi
 fT93UGfoLtYwj/PjL/1rSdSz76MNYYN0Rj0wsrA5J/m7LwamqmmMxl5Dp4EhlaF43RNf
 b+6FHWqL567E2Fyo9iu26Rog+HcFUhPYZdVC+vKee47P2syAgjUMT+sVj0htWRjz1K9x
 H2Qn5A8V3td8RAPY+tHc1iRLjTnD1Z4O2vlG7z69MNHzerB0ckUlM1HlaHcTMiK8dqIw
 HNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784837348; x=1785442148;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=nv8G7uF/vXKYkD7VAxJ3puA+WTb9xEykj6EMLdleuWo=;
 b=THVJaYer/vhoRjmrk4SUUt6S9Ju8/61Eo5YSu9lxksBgtanEI+h9KtvxfstHOF7AXj
 Hd00soyH5VuHz8km6eYmr4PZQCTHcx4LMmqMnrZAhJp2KvdkWLPEPw/29MK46wmeo+4j
 yo0bE03TWBxxJ+3escuy6couXiYTkNgvFoDhp6CriBzv2NRvUTUqh3fISLoCN0cb7IDX
 P9+HG2PBey2wX26/fGXDJ5StCNuVlP6d/dFlRHnG3T7BpyQFLgk3ZPf992ty1TJU9aUS
 v9MFKxx//Wq1FKJfndrLpLVPznZZCLouwMIYQVbffbsj3WDpEJ7ItPr8ad1089ByBL3F
 Jt8A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq+w9401WXU7feXf02JXAzqxXBaacm8A1H2CK0KsaX2NhDfJdxpTZtN55Tp4neSOLitHDj+7ZT6kA==@nongnu.org
X-Gm-Message-State: AOJu0YzckU6lhZQsNAk7AG7oJno2WMWXtnfVVEW82YMFHB6wW9O2LKj0
 zVgyTVgs6+ZvLuFwz88A4DFcPKXq59gDgWl3nS+XDeuDY0Y6JI/7p6lIzxvos+aKXwM=
X-Gm-Gg: AR+sD1001L1mZeUUEElKReU93ZqaEjXF+gKGUqblEIIsBFt+YBbecLSERqxkFnlEf+3
 V/O2HPy7WYhHxqFMrK5epky8+rCn4WEmLsqJaTGLX1aOuLMWM92BPJoqcROkLGLUUrZlawVZgIx
 fbkrfSxGrLub7sQPy8yKgzr07K41WRyq9n1fYJpcdeZKyrTGEbFXfhUQeuI7Ex7SMJR2wNgA6dp
 JraufTnrV9hqFAwBCTvM5Zd3wuuRPYSuGVLOTlRDqRZ087yDc9VvttrA2udGSnhchnKRTrIHaDn
 8VF6PIfxrzx/vowjV9DcRQrIUPmvzh8Ji3XcYOiluiHqkLhRRPE7BxCWRJUxt10oXWRgBfhQcBe
 h1/MEzE3RuvLNhPUVR2D5ItirQht4aiXgEmjzmJ+Ho9DJBrHtyncM0VGKkIBtR8hNRDpx1vpcbG
 tRMg==
X-Received: by 2002:a05:6000:2c07:b0:47f:7129:6e2d with SMTP id
 ffacd0b85a97d-47f8d71e0f7mr5775603f8f.17.1784837347483; 
 Thu, 23 Jul 2026 13:09:07 -0700 (PDT)
Received: from draig.lan ([185.124.0.114]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c531afsm17740155f8f.24.2026.07.23.13.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 13:09:05 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E99075F8BE;
 Thu, 23 Jul 2026 21:09:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Warner Losh <imp@bsdimp.com>, Brad Smith <brad@comstyle.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Cleber Rosa <crosa@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>
Subject: [PATCH 3/3] gitlab: add arm-softmmu tests to the macOS build
Date: Thu, 23 Jul 2026 21:09:04 +0100
Message-ID: <20260723200904.224413-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260723200904.224413-1-alex.bennee@linaro.org>
References: <20260723200904.224413-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

Now we have fixed the compiler issues lets have at it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/macos.yml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/macos.yml b/.gitlab-ci.d/macos.yml
index bdb3eae18f0..40b9b637b3b 100644
--- a/.gitlab-ci.d/macos.yml
+++ b/.gitlab-ci.d/macos.yml
@@ -22,7 +22,7 @@
     - export PKG_CONFIG_PATH="$PKG_CONFIG_PATH"
     - brew update
     - brew install $PKGS
-    - brew install aarch64-elf-gcc i686-elf-gcc x86_64-elf-gcc
+    - brew install arm-none-eabi-gcc aarch64-elf-gcc i686-elf-gcc x86_64-elf-gcc
     - if test -n "$PYPI_PKGS" ; then PYLIB=$($PYTHON -c 'import sysconfig; print(sysconfig.get_path("stdlib"))'); rm -f $PYLIB/EXTERNALLY-MANAGED; $PIP3 install --break-system-packages $PYPI_PKGS ; fi
   script:
     - mkdir build
@@ -40,8 +40,9 @@ aarch64-macos-15-build:
     PATH_EXTRA: /opt/homebrew/gettext/bin
     PKG_CONFIG_PATH: /opt/homebrew/curl/lib/pkgconfig:/opt/homebrew/ncurses/lib/pkgconfig:/opt/homebrew/readline/lib/pkgconfig
     CONFIGURE_ARGS:
-        --target-list=aarch64-softmmu,i386-softmmu,x86_64-softmmu
+        --target-list=aarch64-softmmu,arm-softmmu,i386-softmmu,x86_64-softmmu
         --cross-prefix-aarch64=aarch64-elf-
+        --cross-prefix-arm=arm-none-eabi-
         --cross-prefix-i386=i686-elf-
         --cross-prefix-x86_64=x86_64-elf-
         --disable-plugins
-- 
2.47.3


