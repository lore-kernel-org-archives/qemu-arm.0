Received: by 2002:a17:907:686:b0:a6f:1bf6:7fc1 with SMTP id wn6csp1162218ejb;
        Tue, 11 Jun 2024 03:34:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/LUjczobw8hMK9phw0XKRHLMbdkyC4ro9NRs/lOMlWoBJzz/sK8lNfeS1AugaCDDjB7jcOnVgNs5d/8kTcc6vffCA6+js
X-Received: by 2002:a2e:a7c8:0:b0:2eb:e505:ebd5 with SMTP id 38308e7fff4ca-2ebe505ee5emr44319131fa.3.1718102081679;
        Tue, 11 Jun 2024 03:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718102081; cv=none;
        d=google.com; s=arc-20160816;
        b=HlDe+yP9BZo785AvnXCu5dc7k0r8iQkb67jon4BECZ0DUDZ4dcvIa0oXWvA8bzaT3D
         DQ2fozuBTeCiyzZzW+OLxahzRMSFlOEQ+OEaF3hvOHSECpFDsi1GQUJoebv90xagsdnR
         OKNlc77odXzwIoHO2ZDoO1vf0TTcKee79LSvhc6muIcLrOG6h0r1dOqNXvQyDBIEneXb
         R0Zex376/Qa4x853/ji7pklRVR8/lZEXTLzlODS62UxjxTPLOlVZQl/GWlexNx0BtjUg
         Gwm5Y1hHrbk/e1qZbwRZRnOp1onm4ZU2R1I0tUlIhx7eAK2bg7tR7+qnHLKjETpSXtto
         fT0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kfBlhlKJNBiXVGnmXKNokqgloJowB7odFyWS6IGw2Bs=;
        fh=uM0LylXqWT02HyJGXsGOdluA5ipjIDW6/KKZgQUdriQ=;
        b=jmgNOZD18LHWS6+WGfRFAnUHQdngtTH4sWDLQA9aV3mAwC2lg+g90kzN5uwPUDorg2
         RbywKwQms5Id0DaK3mJgl10P33lIL2IdchyuAfaOonueeYVWHuXvkLx5RaKmXw0r2jEh
         mzEOt9PHa3PZDF9blp04JL/Tk5PSHqMlzPls0I2kp8rUHDeL9UIO5ftJyogOVcpo5ixs
         oxZmYdKqiQZYubNYPspQOQQHuCK3k0Hn19zSW0NUurIXnzxbWSWmSxZNBKOHCttJbKmY
         +xgHNOXF2+4IrP3lWYc11+BpGLcsySSDDfK+mYvHehtmsZNj4c82T+j7JAOK23FK9Cej
         YF6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZisQhx0D;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4215cae5673sor8249645e9.7.2024.06.11.03.34.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Jun 2024 03:34:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZisQhx0D;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718102081; x=1718706881; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfBlhlKJNBiXVGnmXKNokqgloJowB7odFyWS6IGw2Bs=;
        b=ZisQhx0DYES734e+WLWnjyavgdwVVqiMb8SoLH1gtOyJUTHCKWA4eLCuXakjhbfIfN
         WNtRZ7veXNAEqPp4kq9QbJljGlDsmU3aT5+Si0RsCifvdbukijtnQs8jhIdlSJjYwGgI
         438EAfrEBPZIgWyha3/M6WlNLxMrrs7UfeckERoHnF/Zyb3L/vaGyUjLF/v83I8NolGT
         KA4fMgJpqLiE7s8j+5RRub+vwMSaKsmQU1BT0STtZNNJk8+5VVWwJvzS4bMIXSqfgBRm
         8cqSvnYDJJqsWj/D59M77ZwtFLB/s0LVN1A6g/NIta68k8dsowARGVUTDHtwPkWlk1UF
         eIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718102081; x=1718706881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfBlhlKJNBiXVGnmXKNokqgloJowB7odFyWS6IGw2Bs=;
        b=I0ossBXcP/qdBBCBFiojNuuf5DOCYOS2lUBVehNZkye8ETIBvJzLC3CYTF/qi5uEom
         U0h9ROpgbjfcXqAVHp+eKp+D/VbfAQYIhlsGyHNCga8locCNPz5PWTPMmD7cS/bIBiA8
         lBdxGZUzNJ3q8CyZT3yzqg5dztiEB79dfHoLWQ4CUpiGZDakpFNOF+8+lVBzmOmHD2OT
         wtIw1PHo6GNbPD5tfp9y53VLhIaU0iko/12XgbCtTPHOsPZ+/6rAGsZ0y8dfVH5ekbJQ
         KMAXwGgJyu5y9sG7TzWpjH1wFHnX17JP2/9RcB0bmf7BTrXE+ffSNPpGln2o0cjtJIHd
         2tYg==
X-Forwarded-Encrypted: i=1; AJvYcCVR5k2PFjvFHe2x/Sw8QnZon15b3vg1+++itwCcWXCfLU9MMh4e6796oYLS6c+M/Gb4HdcUAshM3HjWRFoNQLuqEbygGWOW
X-Gm-Message-State: AOJu0YyBBbSeriHIOf9I/5xNy7DRmjTm6OmSyEbwuCVLkD++Zz7e9DuX
	yh+R4zt5NsxKqJ9dxff0rGGrieEausMghyXDfiqPFUl5AmIjjIeAJXVoHSX6xcLcaQ==
X-Google-Smtp-Source: AGHT+IHWhKEzSBa2cdO917EciC082ul2gV+2J3yF1YY0erif6toRa9ToN8jZI1IA+OA7xlFcRJ1Sbg==
X-Received: by 2002:a05:600c:4ec9:b0:41a:821b:37f7 with SMTP id 5b1f17b1804b1-42164a328a6mr85033065e9.27.1718102081217;
        Tue, 11 Jun 2024 03:34:41 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-33.37.6.162.tellas.gr. [37.6.162.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42232e71865sm30878795e9.46.2024.06.11.03.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 03:34:41 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-arm@nongnu.org
Subject: [RFC PATCH v2 5/5] DO NOT MERGE: replace TYPE_PL011 with x-pl011-rust in arm virt machine
Date: Tue, 11 Jun 2024 13:33:34 +0300
Message-ID: <52534c3166e2b8b89421990d62ef90e8c73f9e9e.1718101832.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <rust-pl011-rfc-v2.git.manos.pitsidianakis@linaro.org>
References: <rust-pl011-rfc-v2.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: xukMizpV4/Fz

Convenience patch for testing the rust device.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/arm/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3c93c0c0a6..f33b58ae0d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -912,7 +912,11 @@ static void create_uart(const VirtMachineState *vms, int uart,
     int irq = vms->irqmap[uart];
     const char compat[] = "arm,pl011\0arm,primecell";
     const char clocknames[] = "uartclk\0apb_pclk";
+#ifdef CONFIG_WITH_RUST
+    DeviceState *dev = qdev_new("x-pl011-rust");
+#else
     DeviceState *dev = qdev_new(TYPE_PL011);
+#endif
     SysBusDevice *s = SYS_BUS_DEVICE(dev);
     MachineState *ms = MACHINE(vms);
 
-- 
γαῖα πυρί μιχθήτω
