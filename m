Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A06CE8D6B
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 11:56:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vKxpY-0008Iw-Nr; Mon, 17 Nov 2025 06:55:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vKxpX-0008Gq-4j
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 06:55:35 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vKxpT-0005gz-2k
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 06:55:34 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47790b080e4so14339245e9.3
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 03:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763380529; x=1763985329; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xqHWnAkE618EWgRbik2E2u5ZOc1cs1N5HVjAC1I4HPI=;
 b=HIlHUznubxr3Czm5CdN8rAhCFt5yP2AEWu/8+g2/AlhCNULzRf+3wPrwavfgp1fka+
 KMKXgIVxVb8M9Rmc4diKnu+2dvp6M2kLbz1gtlIb6pXrRjySiKNJmmxnNi9Rfouxnj0E
 eNl3m0vbi99FdIJ7q/xAP8TYp5YTxNEpS6Ta0I84tGWBa35NuyfDAeBnPSmwIqcq8bJv
 /w55T0kNiQV2ZYFfVEqtlvRoSNCYZIHQgU6S2zK7PEN62ejGb0x99xwTbN4MTm9cN4wi
 UvohQz/PmlYW7B1tUe6STIkXzWJtT0/F+x6YWv+0J+8uxqvR9kPuy401gQJEUVCWWFee
 yfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763380529; x=1763985329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xqHWnAkE618EWgRbik2E2u5ZOc1cs1N5HVjAC1I4HPI=;
 b=TYMkMUdH1t44ENqr1sZWMy59l3xKuP5Gx4pZn03biLY5SccWw2HlU1xPpOzEtiW/Rq
 JUgVU5urNKJfBo04Q8Sl7yVa00u63v6vpADH7vSogXmVWkihDT2HtTG0X8Hz9/+K4Yec
 F+ekWPrnD5e/dhxNJuzTomGspN3QmXaYOCn/ydr9EaezDwD7XKsGqFRlRPzRDkSA//9W
 UMKubQGCZ7T6rJnEuOUJ2aqiDr7VYKUOUCKCe+JIglvtPV6nh68IoCWLQuH5VlpJ8fnq
 lMJsfeSIZn51c+7S0bTh1Qt4OylW2VDksKLqbC6Hm4zMLcqwyunLf8xRXhOywsY9XvK3
 v4kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWprzn9Ro4o9Pxlbufbyi/QU+6RWeFQ/hn7uXRcpfm8fTzQ7BXXtgabr/Dnw7kZLxXKslDcBsHAQA==@nongnu.org
X-Gm-Message-State: AOJu0Yywm91bAysr2X1LaRti0dC2nEr99mKmvTqVjXU9HpnmqPEdmYGG
 +j2CfWqKFPwFgHIiCCgD+fjGcEUbAuQm1igYl+an0SLbRooEmXQMoaQS+mnnXFSvrtk=
X-Gm-Gg: ASbGncvO9TUoTZ/54irl2iyc565qoEIpFWrAx3iVbIZbd4JsN4uS7Igc0UB3TWykXNv
 7ulsi094nBeEKHtB/LfTSumFPm7BEcs2knjENYbfQTNVTNI5jWKtXAIqalLCUGkKkDh8pw1ffeF
 /lWSR4Cj4nrEPDdYzKh/pYXONm3p3vbYco2pigh2DuTSvoVIT2eGCv9b3TmJOnBCntABXWMsjqp
 fFxjpIXj0TRvaUJkn0VCMXmcU9kDUWEaddWOJPEh0SWickNNXNjvUS6ElXdq5s9n5jt2MkgFNWm
 cno1bl+tyfKFad/j2zeJwAcISfrYmpv7Iw7cfRLfjLsMdGWDUpvmmt2SUQbpgULchbNRFjbH7wc
 BTJL16m6O2ecaZ4/Uu0BOzSMt3hI9m0P1/p/4djp9rWNPZPuHwRyX9gPwasxESOcRNxCX0v0d3z
 v7
X-Google-Smtp-Source: AGHT+IGR/obW2vE0r8t6POXGJ+bM/OuihSLT0ClVR96JK/weQvLyZonVZ6oPew/D1ImB76CYHq2eJg==
X-Received: by 2002:a05:600c:a49:b0:475:e007:baf1 with SMTP id
 5b1f17b1804b1-4778feadb6dmr104271715e9.34.1763380529203; 
 Mon, 17 Nov 2025 03:55:29 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e35b7esm311848305e9.4.2025.11.17.03.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 03:55:28 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C0F8A5F929;
 Mon, 17 Nov 2025 11:55:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ed Maste <emaste@freebsd.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 05/18] docs/about/emulation: update assets for uftrace
 plugin documentation
Date: Mon, 17 Nov 2025 11:55:10 +0000
Message-ID: <20251117115523.3993105-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251117115523.3993105-1-alex.bennee@linaro.org>
References: <20251117115523.3993105-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Linaro is discontinuing its fileserver service by end of the year.
Migrate assets to GitHub.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20251113102525.1255370-7-alex.bennee@linaro.org>
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


