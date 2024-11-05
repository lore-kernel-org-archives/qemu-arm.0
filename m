Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2806379njc;
        Tue, 5 Nov 2024 05:05:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUYzDuj+EWv7m535mMeyvkZrlSKjwzZXUTIuPVmsMyN7+KYnm8GAko5JGbSR3/O+XI3r5clfTONMe2aZw==@linaro.org
X-Google-Smtp-Source: AGHT+IGGJfZEaXxDbGP0oBB4aKN5K+i6DOLSU7cNHsdyL5t3CmrGyceJ9JYDIAN/Hn2emnN4iefP
X-Received: by 2002:a05:6214:3bc9:b0:6d1:87d7:c69c with SMTP id 6a1803df08f44-6d351b2e0cemr254711486d6.47.1730811956455;
        Tue, 05 Nov 2024 05:05:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730811956; cv=none;
        d=google.com; s=arc-20240605;
        b=O0Y8ogKXSMShiNV6EAlRZnCIIraVRaFojnraH8/E2Oc8H7K3IE6jyLdN9mIrwOAjHK
         ZnfiTbrpe+/mfCjkWucc3F/ObqQH9gWGN3uRGb2PRLjY2jh6WyWDfQpFt0Q0wQg3wqpt
         tIzMdXWQXn1LzFcRVXTYnmbyYM71qD3ELM+gDk6Kexvl33aEI8IqfCgCJeVgWmS09Xja
         4XGK8i3ShTrcpRRKwjHjWV3ftTbrucyTw9hIqqBuCUpCEQZlMqQXMG3b5RzLbqlnuIeD
         Ri65EhvMCumcNEnBEktSSxu57HgILCxDAm5cJrmJ8mN4HVA9Oxvc1weEl3K9HneQE++j
         XUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qAZ8YzntwrQh/mqW41UtJKIzn7e3ZbFGPYghnfpczwc=;
        fh=7SDMSN91Ql1ODoUCWpW2TuJ9czGjw2+D3x3YZsRs2/w=;
        b=cAeju4o+MlPbAuRe0jBKr18AvrkBITY5ZHfbaE4AdA/KpvoUGYN18mAthpSzvm0U93
         1yWu4KVEmy0WmaMiKI75ff8NKtlZCEuEKNXEyHvioPQvR07WQnKyEd53m7XUY8A9O8Sw
         aNiAi1Ax/1zQ2Uhdzp8cEo7r4ntLf7qknWrBC3K8QW3LQLPGWuIz+FLIy8fvaDjTNYBI
         rwGgB7WdU1o2MVPdhrE9/NCKvSpcfYhLj/mznzd6uPdIzlX5uvBKJjGhQWQQouRVNWcW
         +0D0bJOwZnp4fmpe3fGM3yt18OekA1q8TMQFDkC29WWjzrfCmhvUFWFy4+WdT483l7+4
         clkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e3/WIxrZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d35417fc59si137068016d6.373.2024.11.05.05.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:05:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e3/WIxrZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8JFd-0002I7-By; Tue, 05 Nov 2024 08:05:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JFc-0002GU-2A
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:05:40 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JFa-0002VZ-BX
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:05:39 -0500
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-539e5c15fd3so5282839e87.3
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 05:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730811937; x=1731416737; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qAZ8YzntwrQh/mqW41UtJKIzn7e3ZbFGPYghnfpczwc=;
 b=e3/WIxrZmVbUjv7muhynuJUt9uheb1R5hxiRw53dJTuxYDvNuM5yc/apqsTqJ8uLlw
 V1NfO9zkQY6J15j4X7Xhdjfn9ezJ7vz6sleW7dSAk4igWd085sD3fg7lCHgDyi8X1Dy4
 H1pUMwNcGa9B88AR6vBZKLaEoQKaSuyBD1Xxn6DaQ+yGxHdAcSL2ywX++7adcpqKM/mK
 HVnQ2w6zKL64UKNknbYB65PBMR2v2IlEuOLkirM5X+fHHBY11p++wkswXaTa82d//E1b
 gI+ZWXZt3Y6GcmNA7vzQOPAlqsWQ46hVLjLQa2TPBYBl1iN5ugNoyTJsS9wuvTl40lf3
 dYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730811937; x=1731416737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qAZ8YzntwrQh/mqW41UtJKIzn7e3ZbFGPYghnfpczwc=;
 b=j44es4WHk/Nw7ckukOB8efYV4DJw7YMWZk4Sh9KpWVmG+2pTAbaoitz0FFvJukNb19
 IB4pN3YKzzhLtDc4jRgGtzJdRNXsw3+r3UHhWyZC+Q0noQ7GxmFrSi0otAj66bMjRfYh
 iA+C07+0R+qItg6gWpOIwuFUWPseEkz/DtSjfPeH++MdLxhIew30FfHS9jW0xeD+WZ9o
 DKSBBTyY+a1n79bE2L2mza1oeEE9O22W1Hnm3TMmOA5i07Tfg9mebdc8l+Y33JQunAR7
 2qVEDDhz+Lu4goFQLJr8kkhvmMHJG/F3btVqlHokQjyKN/U7ZRGqd5ipQvIoZ7SFfi4b
 gEcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHVENkh57TVcXIsh3vOq51rxncPoab/B/kWLTKnF+I1vSXbA1+CIbtOrBAvBIkAX9LU6Jsg57dcQ==@nongnu.org
X-Gm-Message-State: AOJu0YwqZ/27M0xLreGRQIpLv55q/lSBlUkpHJEvMAQFEw9UG2fv+OOh
 UFX4/LarZchFew68PyhIoIc7rLK1ZGv9FGEBMdgRNqeUi4V5BCw5YCEzARqthhg=
X-Received: by 2002:a05:6512:33d3:b0:539:e7b9:df03 with SMTP id
 2adb3069b0e04-53b348c3954mr18508026e87.1.1730811936350; 
 Tue, 05 Nov 2024 05:05:36 -0800 (PST)
Received: from localhost.localdomain (86.red-88-29-160.dynamicip.rima-tde.net.
 [88.29.160.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd8e848csm222180125e9.3.2024.11.05.05.05.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Nov 2024 05:05:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/19] hw/microblaze: Fix MemoryRegionOps coding style
Date: Tue,  5 Nov 2024 14:04:18 +0100
Message-ID: <20241105130431.22564-7-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241105130431.22564-1-philmd@linaro.org>
References: <20241105130431.22564-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12e.google.com
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
X-TUID: iQK8aEzEz+Cw

Fix few MemoryRegionOps style before adding new fields
in the following commits.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/xilinx_uartlite.c | 4 ++--
 hw/intc/xilinx_intc.c     | 4 ++--
 hw/net/xilinx_ethlite.c   | 4 ++--
 hw/timer/xilinx_timer.c   | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
index f325084f8b9..a69ad769cc4 100644
--- a/hw/char/xilinx_uartlite.c
+++ b/hw/char/xilinx_uartlite.c
@@ -172,8 +172,8 @@ static const MemoryRegionOps uart_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
     .valid = {
         .min_access_size = 1,
-        .max_access_size = 4
-    }
+        .max_access_size = 4,
+    },
 };
 
 static Property xilinx_uartlite_properties[] = {
diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
index 6e5012e66eb..2b8246f6206 100644
--- a/hw/intc/xilinx_intc.c
+++ b/hw/intc/xilinx_intc.c
@@ -146,8 +146,8 @@ static const MemoryRegionOps pic_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
     .valid = {
         .min_access_size = 4,
-        .max_access_size = 4
-    }
+        .max_access_size = 4,
+    },
 };
 
 static void irq_handler(void *opaque, int irq, int level)
diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index bd812908085..11eb53c4d60 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -172,8 +172,8 @@ static const MemoryRegionOps eth_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
     .valid = {
         .min_access_size = 4,
-        .max_access_size = 4
-    }
+        .max_access_size = 4,
+    },
 };
 
 static bool eth_can_rx(NetClientState *nc)
diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
index 32a9df69e0b..0822345779c 100644
--- a/hw/timer/xilinx_timer.c
+++ b/hw/timer/xilinx_timer.c
@@ -195,8 +195,8 @@ static const MemoryRegionOps timer_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
     .valid = {
         .min_access_size = 4,
-        .max_access_size = 4
-    }
+        .max_access_size = 4,
+    },
 };
 
 static void timer_hit(void *opaque)
-- 
2.45.2

