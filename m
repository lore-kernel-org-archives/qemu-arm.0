Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DB7CCFA1A
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 17:22:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIs0L-0006QY-CH; Tue, 11 Nov 2025 12:18:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIrzr-0005Zz-Ux
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:17:38 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIrzm-0003vQ-NF
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:17:35 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-640c6577120so8048079a12.1
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 09:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762881449; x=1763486249; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aa/Hvu3+mj3VcYiY7ZS0/+etKelXn5JiA4GmeNDBBYs=;
 b=COD5mG51AGi65Eq/doTQ4Qk3FLuIoCuP6IlvFcBpSGEod/PLss2jziOKrkNJ9sMhVy
 z3ntuDP5hHLWyE5RH8196w1QDLd4z34m7TklX85jLjubARW4HCjXkCRy+1Qv99sLJYhH
 lmOCVUrSrFTrF5Z/r19IEIpjoU3KMtrJKOKfRCHgNHh5CqO6Tfj0VCHdM2XbofbUEBpM
 vQc834jj0UmnlwzqeSLsRNdZA1313zPpQZ3wyzv75bqDPJTWG+8fm841cKl9DxeF4aYs
 ae7Ka7gpuBs2Ltn0RcJYwnZN0NXPj3OwxXJMrzDNLxVIVeHWhiI/Yc7ZBIGAQAFDCDQH
 nkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762881449; x=1763486249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aa/Hvu3+mj3VcYiY7ZS0/+etKelXn5JiA4GmeNDBBYs=;
 b=HnKAQw9eqshgMWkhPFJ+OnK60DgqaCzbTo+hwcx2c4cSDPmrzeucGeH56vAzZ1TYp0
 ZvMVwikACbkK3PvoPVAHH3FPY2Xmz7TwrX5gW2ZYOS/Be+CCCOeO3F4K8SlFhnrrcb+m
 xpd0Xfq3k793kqWQ8nlJONOJSZslll0WAuVYlVTMR/cHgdiR4wgE6ie/Py8V5CZ5vJ0j
 ga4wekrji0MPusN8VNElPR1TGEJIQv0FYTEvZuFeuV01ybVuGQYx3hRc8fxuhEMgYpD8
 n4FYlLz688XE9LRsmwSLb8tP4bJKgqiSqytiqfc+ZMBmxswoLfEVsAjRhU6GcR6YRQDk
 /OCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX0mcjARXgjjMQrPPs+N901FcuQ/zEukeht/l1SCgD7vn0oH5hZdpfUBKdYby6ZAEpJOa4UoHB9A==@nongnu.org
X-Gm-Message-State: AOJu0Yyg3LYhbJAnOR8cwvBy7Aogvk3idUG9ZGNyHP5X8pxa7vuRo5CX
 6+UxLHwbNv6rwod2Bej8AJypK/FMSOh0RLee5GsPY5+xvRjjyEUw/2wP0I4YyxsK7po=
X-Gm-Gg: ASbGncsDy8z7Ggmvf3Yj+binFK0H1GLQNd1ZPhVJBUBG5R7S8OsB8bCm3tri6ugjM34
 nDcoot0Z6t+RdQmKCie62/tQZX0DNBXcKCjLuzRqEoOBE8+islLLnydX1La56Rw4xwYMxqd9D5g
 gnnAFDn35dMpK7+7SW1IVz9yoXb/1oWMRSwWZOw/N3tRRUQXdrziIZ5tyEvQR2ZUH2m5T74nhRd
 WGIwdjbwwz8SqqCEaLZw7K5uKn6hB1ggAMVOG//6R+VyThW1Hs8KQeFL7k8r3sbsF0MOqepDcZB
 cJm6THNPxZk95oIDgYF+fV62q4UBWpdrjjWOM474hhNZo3GwmchlXCv0NLY5HYvArpBrPG1t8gT
 AJh3Foijz20816IiWA45tKIxW6h9rU/WDetLunCVcDQuiLZm1a4VpVkuuNw01X5erZgVjzll6uR
 SH
X-Google-Smtp-Source: AGHT+IFt1tpYSaCCrICy2rXEZq4OMYVJKMMMhCOjtx6avEQ7cfxPVVQ0hYV7iMDHT5tRZy036kAXww==
X-Received: by 2002:a17:906:6a19:b0:b72:9d56:ab52 with SMTP id
 a640c23a62f3a-b72e02d20c7mr1252795266b.8.1762881448962; 
 Tue, 11 Nov 2025 09:17:28 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf9bc83asm1367946066b.51.2025.11.11.09.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 09:17:27 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 186775FA43;
 Tue, 11 Nov 2025 17:17:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Ed Maste <emaste@freebsd.org>, Paul Durrant <paul@xen.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 06/16] docs/about/emulation: update assets for uftrace plugin
 documentation
Date: Tue, 11 Nov 2025 17:17:13 +0000
Message-ID: <20251111171724.78201-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251111171724.78201-1-alex.bennee@linaro.org>
References: <20251111171724.78201-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
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


