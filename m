Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp805126njb;
        Tue, 18 Feb 2025 08:27:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV8XTx/K7fYmo1bbbCeSTW1WDvJc1uLfUW6cluNX+x5RjGf6CUPH6yVfw3XaizEJKyHOaLlYeXN6to0rg==@linaro.org
X-Google-Smtp-Source: AGHT+IEvM8XPDDovLZSncWxl6ek0WN+Q+YgllQYy5dx9rCiZsWe7fEnicnxS4gwLOUsRvqT3e5aG
X-Received: by 2002:ac8:5e4e:0:b0:471:f21f:2a1c with SMTP id d75a77b69052e-4720810e489mr6337061cf.18.1739896050644;
        Tue, 18 Feb 2025 08:27:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739896050; cv=none;
        d=google.com; s=arc-20240605;
        b=KqywD81Rg6GE2bJji7P7pZmr9glj3niH+R0oEcTBb5ICia8FuVVOOWpu12oYvM6Cok
         7cOpxbk/aH8t+aWJQpkUZW11SytpdLgMMX5Jfas7MCya8YPxVNOvg+QsMRE6aHincnug
         h1Fa0Hb1lmUr9TgmapXu1iFTee5gUmI0Zk5cg0JKP5uA72+FCUNNxV67lu0r8RzUz53T
         Ascs03bRZ7FtMSUy5Z9Qr6j1feuEDX22ykCnqexAdW1dsOS6p/j5IQSQ5egFggmlUNuB
         SNcVAmdmjvpBXkZLDzxU4OnctNDQmbVpHjpI0PPFdRvurIRd3tzRHHf7ZgeUJG4Hsb57
         5Ylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=C8Njo+qOXhV4Sx/ta7KiauuSaoi71X4Ex5TI1JyVyyI=;
        fh=pezKtt5kFh1acoZz+VlVvOZATvrNfQ9vgvwBwGxRnjY=;
        b=J+QaTjplRzSf5kmvUkWrH9OJi9Sn6VNIt9J/oJq2OPafOcv4+dnWNnEwnaVR0rdsha
         g0FqucOMySwm5z5jypus7IHIoetG113AI1Lh13sEJm2dn0uG2REWXbNN0owj7mmyPrv9
         qW8TCq/GUNM1c74prZm0ETS0ljptN4I0RUXRE+CGmpquMkMmOV4EwClBdwWSK9nhXnWa
         WMqrIYD4XKJkF/wkQWW1NJeRQjRr4JaU5wHMnwk6lPt2uhaZ5AK/PtuuxARrVunDTnL0
         7aM5UdRHYCyU9O3igoYgRbEE0xUxTE7JhQjHzuYyFl3/dvOIp2X/G0ynUSrZAOGrPL9Z
         qbkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JJlkYZjD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471f3ca59e1si35512981cf.600.2025.02.18.08.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 08:27:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JJlkYZjD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkQR9-0005bS-Ls; Tue, 18 Feb 2025 11:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tkQR8-0005Yt-Fx
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 11:27:06 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tkQR6-0000oN-Ha
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 11:27:06 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4397dff185fso24914195e9.2
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2025 08:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739896023; x=1740500823; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C8Njo+qOXhV4Sx/ta7KiauuSaoi71X4Ex5TI1JyVyyI=;
 b=JJlkYZjDHy1SyWYNS0ofTXuL3jnbHk9TyGp+zaNdP+RZnPMhUf9uF9vncrgpTt8293
 jrNPP78tE9nFy66qTC6ONF8xRcNDNQuv0azituwdkofRsH1QR0ENwxD0t2ud1eA8/ox5
 P0hYjnKwlxfMPMWT6j/0JEgxcmkfUAQHhoOJ1CftW3FhqwhcpjIFKFB22p8SDRyX0K6o
 MXAdmT2PYpCdwWlyJqFpgwLxaCPetRfUk06OgfxE4ErFC6oj/f+aE4lyZsSmP+6GUlHE
 PHOACDuDDZPSuyALXI9/fKzuQ3y+W/uj36+NTVTk1aM3imZX9rntSY38g4WUezERfzL7
 DeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739896023; x=1740500823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C8Njo+qOXhV4Sx/ta7KiauuSaoi71X4Ex5TI1JyVyyI=;
 b=mwYQMddrvEs63b8kpF9rYo0u6D+8iBVDBn0cFNJhTO3C7nNu+CsKWn0nw3f/uItJAw
 pKWh13TBYpbvDNBLWGxU/JJ2+PV0bdm1cyDQlmI3cqKJ99vQyB2X21zgTOldIRbzdWOV
 2jKem8RBMt3h3n569UE0/W6eo8jqAbLcig+tNGr2BrmvW+IzLjaQWH7RJjWuZ+M+wmTk
 UksyHVK1crOYuVpSX9Ut5dSyWI+wmdp7/uc9ZFOI/YHx7nKoXbG8IZCiLzi2QcOwqmCG
 83rJ5a1ZmCck7q9aBKDBI+Z5Jmg6aa0hlBVRQjMpPBhyMJG+uxBarb3wBGhe1ixTszXA
 oEvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz/wEz3hYDcTprniqI4ywXQSS2P6FQ/dkmxrdlQA45x6ZWR/nyreaWGdus7HJ/IgNx9SV42Y+xPg==@nongnu.org
X-Gm-Message-State: AOJu0YxSX/v8aNGhcdZhIaA71x7lHeu8MmYvlUL6IK9jXhEc1/FnoYee
 PsjTM8gI2s5EuBctMWs5l8oeNQEpXlSbw7BeAUcAq4MJ/5lBRfpLj/v2yxKPixnnWdUdMtE37no
 2Ik4=
X-Gm-Gg: ASbGnctAaErvOFNq4zJGDEDetGwWsFZhMur/d/UlAbCEEgDx6fMxU+8d5+ge7/pzjaH
 TXwGLl8DmlaoqLJr6LH7r6Xk+0v3en6I7LJ/ZysZJG/CnEIMAGDerl60HB2wEew33z6oq3iHosa
 t1uagKUtVhqelpb2rCbhVLruy7MmpX+OzXDbzP6fMdpHEgHx8sFyxT58orIsmD115jeKZpLpjHe
 XXSExVOEoTfo861ssGcYguwH45dvOAkHv1XW9k5gfGvpa3VIuJqS1viLF+4FzEDGLQbKAgqgHHc
 9GRL3nCYHwyqqR+0sdYPVtOwushDCZwnnps4EWo0pVzyDSmuriLh2+LR+9StDvo9wQ==
X-Received: by 2002:a05:600c:4f55:b0:439:95b9:91fc with SMTP id
 5b1f17b1804b1-43999d8b49dmr3064455e9.12.1739896023034; 
 Tue, 18 Feb 2025 08:27:03 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4398a44264csm48848305e9.25.2025.02.18.08.27.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 18 Feb 2025 08:27:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Thomas Huth <thuth@redhat.com>, Jan Beulich <jbeulich@suse.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 8/8] meson: Remove support for Xen on 32-bit ARM hosts
Date: Tue, 18 Feb 2025 17:26:18 +0100
Message-ID: <20250218162618.46167-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250218162618.46167-1-philmd@linaro.org>
References: <20250218162618.46167-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mhHORnQw54/E

Per Stefano:

  For ARM 32-bit, I do not think we ever had many deployments,
  as most are 64-bit. Even when there are deployments, they do
  not typically use QEMU, as QEMU is less important for Xen on
  ARM compared to x86.

The QEMU project only test to cross-build Xen on Aarch64 hosts
(see 84eda110792 ("gitlab-ci: Add Xen cross-build jobs").
Since 32-bit host aren't tested, simply remove the support there.

[*] https://lore.kernel.org/qemu-devel/alpine.DEB.2.22.394.2502031438170.11632@ubuntu-linux-20-04-desktop/
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
While apparently running Xen on 32-bit hosts isn't straighforward
anymore (see [x]), we don't need to remove it ASAP, it is already
in the deprecation queue since commit 6d701c9bac1 ("meson:
Deprecate 32-bit host support").

[x] https://lore.kernel.org/qemu-devel/173d18bf-f68c-4bd5-b822-abb1c1f0c51b@suse.com/
---
 docs/about/removed-features.rst | 5 +++++
 meson.build                     | 3 ---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index c6616ce05e5..f6ea53acc8b 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -969,6 +969,11 @@ MIPS "Trap-and-Emulate" KVM support (removed in 8.0)
 The MIPS "Trap-and-Emulate" KVM host and guest support was removed
 from Linux in 2021, and is not supported anymore by QEMU either.
 
+Xen on 32-bit ARM hosts (removed in 10.0)
+'''''''''''''''''''''''''''''''''''''''''
+
+Untested for more than 4 years.
+
 System emulator machines
 ------------------------
 
diff --git a/meson.build b/meson.build
index 8ed10b6624e..7b80d8dff09 100644
--- a/meson.build
+++ b/meson.build
@@ -308,9 +308,6 @@ if cpu == 'x86'
   xen_targets = ['i386-softmmu']
 elif cpu == 'x86_64'
   xen_targets = ['i386-softmmu', 'x86_64-softmmu']
-elif cpu == 'arm'
-  # i386 emulator provides xenpv machine type for multiple architectures
-  xen_targets = ['i386-softmmu']
 elif cpu == 'aarch64'
   # i386 emulator provides xenpv machine type for multiple architectures
   xen_targets = ['i386-softmmu', 'x86_64-softmmu', 'aarch64-softmmu']
-- 
2.47.1

