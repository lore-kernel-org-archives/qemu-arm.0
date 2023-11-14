Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2083468ejc;
        Tue, 14 Nov 2023 06:40:09 -0800 (PST)
X-Received: by 2002:a17:906:793:b0:9b2:c583:cd71 with SMTP id l19-20020a170906079300b009b2c583cd71mr7060010ejc.50.1699972808916;
        Tue, 14 Nov 2023 06:40:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699972808; cv=none;
        d=google.com; s=arc-20160816;
        b=v+KTdzqAVCXbEPqLY4P5N6oEGCNTMeXv0JPsNYLGANckGHVQ9jNsPFB4BxI3jVc3UH
         UmCi7WwqC+irlQAT0djWhRNpNYv15xk3jf8Oa2uXf1wJUXAjtxR2pag/QOU8QDZZmZdd
         gzN7RAQHGhwrhrN3Z7zywcPEbaQsr7TWQ5ejO/zT3ukD++mf6RHI9jLuiH6Fr0Fr1lp0
         xLga9d5eTcs5ESgVK4+nYFTxFa8tZopzq9GpKHJfXdgNZNjYnq5aINDrbHTGKVtJo31V
         9MXcbgCqMPN5ZNi1tMQeUvZcxqso2LMGDqv27rNlfeVA57v/Cge6hAe1tQaIhF/bRsgf
         wvaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CAcrCtDRFE27SgAEHRwd23jK5KSLpjZ+znXdyGAiZas=;
        fh=WgzlLWvbY5R8+4JotruerK0jeEkAYyt0q4wPP6dSEVI=;
        b=OtMu8/cT22z73DVF3jQGLmIVq7elBnhFi2e2tu15mydPcSYwmUBc87P30ysmgWCkNu
         rS4UtyyE1CZYb5bG09Ufa1Wisc4gdOK9O9sztMaxR6bFUsjPF+XqPoO/rW3Uu5BCkaei
         gM0dCKz/FWt32roAmnbNDa+FwYgANN1HmwbAqxx3Ob6IZ9nJzl/wBPhA5JKF+/CjD7RM
         CmvrZSGXOLODgsZCNn/dgOr4TcUv0hWvtFBgRpTMFRRAo+nsMiccwUPbVLpD5dbFCLFR
         ecA12LDuoqOHVyGMj3Qk1h8/qFq3atHADkFlM5c10YykIBOWqFIn3jnqydOSl+RyDRXA
         T92A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MzE8jUlL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y29-20020a170906519d00b009bf48f61797sor1955484ejk.2.2023.11.14.06.40.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 06:40:08 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MzE8jUlL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972808; x=1700577608; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAcrCtDRFE27SgAEHRwd23jK5KSLpjZ+znXdyGAiZas=;
        b=MzE8jUlLb3gON0PUHs9jRXrvMirtkRDqm+vcNoO42BQ1fWjRxjn63sB4Xrju0LMWbp
         9JzHoJiofoBhAmOisyVBvjzo6Wn212JH5bJP7DgYRhFiauCOn9FT389Z+9J2cAQxK1Yl
         8X+25qP6/6zQrAxafH7TQlCGQXUHF7hbDmqie5BMG698RxlciogPvQBl6F4XKRY0sui6
         p3kom/2AKTJjt06b/4J0UT26IJX8j9vMIHWi9FT7ZtiYPNWcDK7r8IxDE6HmDHcVc4HV
         4m4Tv72HicGZ8F9ptpv8fW4O2QId80HxgHsw9cz5ttaBMaS8tRglkhMmXQh1rFIoS4Xy
         NT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972808; x=1700577608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAcrCtDRFE27SgAEHRwd23jK5KSLpjZ+znXdyGAiZas=;
        b=F0nqiZhp0BtLKaQ/MqXbujPlbbowCSSOPYY/Ls9ajlHOLUY2ZQQ23lMjhsXaIRLB6u
         ZYE2XUkyfPbHhiiynO/lsBcgMzYBY+RUYe3LhZmHGnK4cw4pSz0ZMtVw2ai24OIvwgpv
         jIqGJlRVewq4qxPkCItIbQY6I2vjc8GjVTFdG3PrXp3JAk/+kF319p9/2L92xwH4YJVM
         7XVUpTYA57+AYx415uHIoQM3f0y5HrLqLRQuNu6TaNYrthNfogjJtbQatVpEGEi56UTj
         z0XmhGwgmlQwrmL5/Bjb5eYV+iBKLmXHYhQCrLkHCeW6PFrTfYf1mBNMvk9ik3YnvcH7
         mXUA==
X-Gm-Message-State: AOJu0Yw1s2P3QKGlqO9ZXv6py88lswrm4VQus8OZtMaCBG+14EBFjs+D
	sqm9V0CyVQ9Kdek+LCkH0U894Ltg
X-Google-Smtp-Source: AGHT+IFRbdN3aM58BgezwVky3EFK69MoaorjbUe4txfqvi/Mr07fntHT95KnMqBlE8Dz9TGy0ZX5tw==
X-Received: by 2002:a17:907:9848:b0:9dd:5adc:b1d2 with SMTP id jj8-20020a170907984800b009dd5adcb1d2mr6678484ejc.38.1699972808614;
        Tue, 14 Nov 2023 06:40:08 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id y10-20020a1709064b0a00b009dd7bc622fbsm5606206eju.113.2023.11.14.06.40.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 06:40:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 v2 16/19] hw/xen/xen_pt: Add missing license
Date: Tue, 14 Nov 2023 15:38:12 +0100
Message-ID: <20231114143816.71079-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pQPan/8UEtpU

Commit eaab4d60d3 ("Introduce Xen PCI Passthrough, qdevice")
introduced both xen_pt.[ch], but only added the license to
xen_pt.c. Use the same license for xen_pt.h.

Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/xen/xen_pt.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index 31bcfdf705..d3180bb134 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -1,3 +1,13 @@
+/*
+ * Copyright (c) 2007, Neocleus Corporation.
+ * Copyright (c) 2007, Intel Corporation.
+ *
+ * SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Alex Novik <alex@neocleus.com>
+ * Allen Kay <allen.m.kay@intel.com>
+ * Guy Zana <guy@neocleus.com>
+ */
 #ifndef XEN_PT_H
 #define XEN_PT_H
 
-- 
2.41.0
