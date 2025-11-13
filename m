Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E314DCD5BBB
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Nov 2025 10:27:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJUWP-0007tw-Qd; Thu, 13 Nov 2025 05:25:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vJUWN-0007nD-BM
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 05:25:43 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vJUWE-0007Ir-In
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 05:25:43 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-640c6577120so1150221a12.1
 for <qemu-arm@nongnu.org>; Thu, 13 Nov 2025 02:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763029533; x=1763634333; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aa/Hvu3+mj3VcYiY7ZS0/+etKelXn5JiA4GmeNDBBYs=;
 b=MO2pjHp2pHK/ZlZ3ZgZN/2AKCIhkguzItfeL1lSaNYVHrNntefcUWMPCfsdS5zgZBK
 o8IYsKqGTeiftgNinlMAUYBQ6w5zXSJ9PB9EPsE8IR/bZHpIsgW8W0FxV0Rsk45nW1el
 RiHA3ip5TOlg2snKix/kapI3E+cn/YNbkduf0oXKoJRwuOgIJzZUDGd8D4VfQmjccAi0
 gonYUhSvn856qtH4DsayFI8RhysVCpxqZIhycWa5a7IErrIloMOQe6+mHVTfiEOXK0zL
 O3qAZK8hWWMlqpby3L24R1vPgUYNCif6RE6YrF1HYCCwBajxHqgRASzzClfanVWNOEKI
 CkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763029533; x=1763634333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aa/Hvu3+mj3VcYiY7ZS0/+etKelXn5JiA4GmeNDBBYs=;
 b=rrsFlTeE1MDVuQ06o2/R6pjIUIrLzLfmjlnlqQIwOHrmVV6/28JPH7VAZR97Ba1Npz
 gaPqQSHRTCgm3K1cgmk6eSPk0VSroUbM/JDn9tZIq0IPsLNsCSUkjdaW/Y+T/B9NlBTC
 gj8tSstKMaxocrxKC/I8d5idPa6Tew9hS2f7j/D4yMIERP5F299Fj6/kYewjVgSqIzPt
 epQodZc8DI2CpRTbz/0fEtcvh5mtjMOuzECu26/zTJgwtrPhp4hAMOTdE/hT+MRhBJ66
 BXlDkj1YrNs8sdsqsots/pmiHMsxkv3rTxvFguOq0iRtAwfwBDxfVctK9rRh8BfXoZUa
 aaeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlhXf4ze+CMk07VegR8K2Vf+y8T0zApnuic6v/EXBescTsf8HrnFGzJES+qHIHJJhjcgrVx1/aVg==@nongnu.org
X-Gm-Message-State: AOJu0Yx7nGfkAm52vH1COL5KysWTR9sB8bOz+PgeArb56Lcg4i0XrBPw
 hxDwffPORPwdlTJ761PF/tEwlPULEjYVwv1lFFTCfnvnOnlxfr0qrPQ/9+Wf2+uiF0E=
X-Gm-Gg: ASbGnctUTdg0tZK9hlZx6LcwrM2ZAV4CiE4RmrQtFSiXJYUJI0OIeWSDtUOAvk5613k
 LR3fK4OdMXZLlImwPBcdHfNDUBoGqdxNrWtwg3V50u0oNFZ+BG+ABRrA0nCiQ3E5uulctn6S503
 vgonMEZcK3gMGP2KHL7okRs0ygbtCZgx4KHx65wT8Ss4faKo06n3PTfcjI/M84lvyYxlyAqqA34
 HrHHS3L70V+k3X///X1TdqzNwCzEQmmxducWxp41dQPVJgYGoxE+8cTseei2IYo84kLLTku5Tzj
 PDUqlQAvpMRi2OHKokOBbZw2qwSKR7E3mn7riaKNcPF/9UMjMiG+M9kkdHzo2QM5tIMqtpMCm5o
 hbNlsOCoTYTZe3Xn9pXNzwRQbZBrS+m/T1QHhkXlhMweSLELuFgV33TmniZoQips/+m+5o6lvct
 AN
X-Google-Smtp-Source: AGHT+IEhS4Xh8DX3GYPD0N75xy69ERICfT67SnEZJxDRmqSdvrUOZYOyhdBy4JynSbrH/wlxrmAnEg==
X-Received: by 2002:a17:906:6a09:b0:b6d:6c1a:31ae with SMTP id
 a640c23a62f3a-b7331aed418mr622585566b.49.1763029532803; 
 Thu, 13 Nov 2025 02:25:32 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734ff36ac6sm132331766b.74.2025.11.13.02.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 02:25:29 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 89D965F951;
 Thu, 13 Nov 2025 10:25:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 David Woodhouse <dwmw2@infradead.org>, Ed Maste <emaste@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 06/18] docs/about/emulation: update assets for uftrace
 plugin documentation
Date: Thu, 13 Nov 2025 10:25:12 +0000
Message-ID: <20251113102525.1255370-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251113102525.1255370-1-alex.bennee@linaro.org>
References: <20251113102525.1255370-1-alex.bennee@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Linaro is discontinuing its fileserver service by end of the year.
Migrate assets to GitHub.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/about/emulation.rst | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
index 92c219119e8..4a7d1f41780 100644
--- a/docs/about/emulation.rst
+++ b/docs/about/emulation.rst
@@ -886,24 +886,24 @@ As an example, we can trace qemu itself running git::
     $ uftrace dump --chrome | gzip > ~/qemu_aarch64_git_help.json.gz
 
 For convenience, you can download this trace `qemu_aarch64_git_help.json.gz
-<https://fileserver.linaro.org/s/N8X8fnZ5yGRZLsT/download/qemu_aarch64_git_help.json.gz>`_.
+<https://github.com/pbo-linaro/qemu-assets/raw/refs/heads/master/qemu-uftrace/qemu_aarch64_git_help.json.gz>`_.
 Download it and open this trace on https://ui.perfetto.dev/. You can zoom in/out
 using :kbd:`W`, :kbd:`A`, :kbd:`S`, :kbd:`D` keys.
 Some sequences taken from this trace:
 
 - Loading program and its interpreter
 
-.. image:: https://fileserver.linaro.org/s/fie8JgX76yyL5cq/preview
+.. image:: https://github.com/pbo-linaro/qemu-assets/blob/master/qemu-uftrace/loader_exec.png?raw=true
    :height: 200px
 
 - open syscall
 
-.. image:: https://fileserver.linaro.org/s/rsXPTeZZPza4PcE/preview
+.. image:: https://github.com/pbo-linaro/qemu-assets/blob/master/qemu-uftrace/open_syscall.png?raw=true
    :height: 200px
 
 - TB creation
 
-.. image:: https://fileserver.linaro.org/s/GXY6NKMw5EeRCew/preview
+.. image:: https://github.com/pbo-linaro/qemu-assets/blob/master/qemu-uftrace/tb_translation.png?raw=true
    :height: 200px
 
 It's usually better to use ``uftrace record`` directly. However, tracing
@@ -916,7 +916,7 @@ Example system trace
 
 A full trace example (chrome trace, from instructions below) generated from a
 system boot can be found `here
-<https://fileserver.linaro.org/s/WsemLboPEzo24nw/download/aarch64_boot.json.gz>`_.
+<https://github.com/pbo-linaro/qemu-assets/raw/refs/heads/master/qemu-uftrace/aarch64_boot.json.gz>`_.
 Download it and open this trace on https://ui.perfetto.dev/. You can see code
 executed for all privilege levels, and zoom in/out using
 :kbd:`W`, :kbd:`A`, :kbd:`S`, :kbd:`D` keys. You can find below some sequences
@@ -924,27 +924,27 @@ taken from this trace:
 
 - Two first stages of boot sequence in Arm Trusted Firmware (EL3 and S-EL1)
 
-.. image:: https://fileserver.linaro.org/s/kkxBS552W7nYESX/preview
+.. image:: https://github.com/pbo-linaro/qemu-assets/blob/master/qemu-uftrace/bl3_to_bl1.png?raw=true
    :height: 200px
 
 - U-boot initialization (until code relocation, after which we can't track it)
 
-.. image:: https://fileserver.linaro.org/s/LKTgsXNZFi5GFNC/preview
+.. image:: https://github.com/pbo-linaro/qemu-assets/blob/master/qemu-uftrace/uboot.png?raw=true
    :height: 200px
 
 - Stat and open syscalls in kernel
 
-.. image:: https://fileserver.linaro.org/s/dXe4MfraKg2F476/preview
+.. image:: https://github.com/pbo-linaro/qemu-assets/blob/master/qemu-uftrace/stat.png?raw=true
    :height: 200px
 
 - Timer interrupt
 
-.. image:: https://fileserver.linaro.org/s/TM5yobYzJtP7P3C/preview
+.. image:: https://github.com/pbo-linaro/qemu-assets/blob/master/qemu-uftrace/timer_interrupt.png?raw=true
    :height: 200px
 
 - Poweroff sequence (from kernel back to firmware, NS-EL2 to EL3)
 
-.. image:: https://fileserver.linaro.org/s/oR2PtyGKJrqnfRf/preview
+.. image:: https://github.com/pbo-linaro/qemu-assets/blob/master/qemu-uftrace/poweroff.png?raw=true
    :height: 200px
 
 Build and run system example
-- 
2.47.3


