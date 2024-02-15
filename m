Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp740190ejb;
        Thu, 15 Feb 2024 10:05:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWkM/9RY3GhJTbLkZ31fq5bpVzwTET7M0oq9boHhDU3F+a9atjOjtBhTfJzK9HzCf/SUccxjBcfGFLJHJ5SbSttmccl9d4+
X-Google-Smtp-Source: AGHT+IH79uZnJGVLD0i7WPlzK8xZXBPqlql+r6t8s6R4PbSdYwEVqJWRwWJtdBAIcKNGhYKdXJx6
X-Received: by 2002:a05:690c:d1a:b0:607:6634:cfcc with SMTP id cn26-20020a05690c0d1a00b006076634cfccmr2654903ywb.51.1708020312466;
        Thu, 15 Feb 2024 10:05:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020312; cv=none;
        d=google.com; s=arc-20160816;
        b=rJr/WE4iD0QrPxigyAf2aFff9C1cHlJ4GOUHghGBawF0MbOKZqWxYESgaYzN3GE280
         KgvONqgtlfBs7l6vGjzHsr1/8tlWHgEovRXjCHPaUY1HogPYOYCcMnsuwqQE5ZZT1j62
         zwP1dMB2bXaQ/ZRQ+U6vaZp9MthYmJyvQAT2sD0mFSq0PRNLY+BWM2mJ99e9HjUnFl1A
         wN3toElVv3B/LY2m9SmQFJPGP4STjZXXBNOIyHcu/RUGsP/pdb/yYBzulo6rrwsf4ndD
         vdJxTuBNaIrjFNG/0cNCQb3l5k7t3v7iVxZeOMhsY42RiNy3LNzSCp24N8BMmEiTltP/
         s7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LO7EQ9/NcsUn+L+LcRsaAULB8zo1/K9N0sf9+N40e+k=;
        fh=rAqSx9LNv277eMDkz7BnoWiv8X80FuWnwDQ88ZeCgmI=;
        b=Ji8LRV/as6eR3JmxQWHaw7m9CwExQsp4OB60f4s3/0Vtdw6Yxfh70KfyeaaRQcyBaW
         HQuMeAXvFmOTSeVE0YizKA2h1Oe4qMBbCHX3i2H1ZGWZDloqJGNsCoUv12RgKrfdGWl3
         8NuZiTmN6SL8heh4mVQbO4yPBQMRIYZB7PZrOQ9PLtvYy53IUzqN7EyqbYYVcyTvuMtB
         UkN4J6u+4XysT7wwqYBgFpiCIWmpnkHq0BKEK+CN2lXoVX8yjS24v946e900GrWm6jRb
         Wkfxgf0Rv4VTl3v9tQr0axoafyQOkczys8G7gdfpJqdQp3WFN/ZlLBShCPZC70nelZc9
         ybOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VNNCDr2A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20-20020a817e14000000b00607c714cdccsi828490ywn.496.2024.02.15.10.05.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:05:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VNNCDr2A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rag6B-0004Se-Ac; Thu, 15 Feb 2024 13:04:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag5l-0003e6-Jt
 for qemu-devel@nongnu.org; Thu, 15 Feb 2024 13:04:15 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag5i-0003Hn-Mp
 for qemu-devel@nongnu.org; Thu, 15 Feb 2024 13:04:13 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-55f0b2c79cdso1874048a12.3
 for <qemu-devel@nongnu.org>; Thu, 15 Feb 2024 10:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020248; x=1708625048; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LO7EQ9/NcsUn+L+LcRsaAULB8zo1/K9N0sf9+N40e+k=;
 b=VNNCDr2AE6NqTlGkRxwFkj3qIAcerrb4fHwcFqkKXMANa/hHn/dktJiozLuDAKCMmc
 +AFkYCsaJj86V4yORy3UW/p/x0zrhQD/lGu0X/vfBr1oSKEm8VHE9NalYLUmr106Ga8l
 U2wsXynC+lUYXhTH/465tBNP10rY+kEAY0uil2xBmoTc2hAFLQ2ASygPFLRtJq71x8Tv
 uKTF9pZFpdMGKf3Cm60n5xZjVl+e7M4SVlewar9khidGPgYNBsH09yY9gAUj4wlKYsXN
 xCqduRyrf2nZ+iWFSdnPLYYJIS2EvETaHvkKQpUM7b660SiWmeZB2MiWaBoeZlKkDnsX
 fNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020248; x=1708625048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LO7EQ9/NcsUn+L+LcRsaAULB8zo1/K9N0sf9+N40e+k=;
 b=qxPysDDJWLHlzXD5M+a5D2LetxvPZzTI7heHCo0Sgu5WLdVF6yfvE1ylAwoRwffqKX
 KBDmejO7P4S1Kc+/fBzO29oeejm+tbQcwlBH4/5OW16nUMa0vBhg9u+KN0iCfqSo1QOl
 KWa2WPgHtxm/J0Ya3TyQ8FbnEOgomOdZD7tlmUegbvECdw3jtj1Qx5wM/YF24HNqvHCT
 pE9+dlZu1Q4V/+NHCN+eE83ezJztZA2Qxpdfu992EvdnaxhJfOWevhq8EPIcf7FOhr+8
 a4elqN7y0EOjhwEy0ACfuqGlVnarIxYlMJiVK+1n4Y8BTEVHUZX20MS9zj0xWM81iOyU
 +ssw==
X-Gm-Message-State: AOJu0YwNcHgYecm0EXBEyVcCcRcBm+BGyZyzkQdOOpYibUMUh/ycOpz1
 nv21KsnVTZxSqZAyVyrTXuaaQdCBAI+Z8hZJNj5yK8Jlr08880qo/BI70yC94d5dWG2bxzGIRX1
 +NU8=
X-Received: by 2002:aa7:cf0d:0:b0:55c:d503:764c with SMTP id
 a13-20020aa7cf0d000000b0055cd503764cmr1899966edy.22.1708020248315; 
 Thu, 15 Feb 2024 10:04:08 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 ec55-20020a0564020d7700b0055c85e6d75dsm772448edb.87.2024.02.15.10.04.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:04:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PULL 56/56] hw/ide/ich9: Use AHCIPCIState typedef
Date: Thu, 15 Feb 2024 18:57:50 +0100
Message-ID: <20240215175752.82828-57-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: f1fkspxEQ68U

QEMU coding style recommend using structure typedefs:
https://www.qemu.org/docs/master/devel/style.html#typedefs

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240208181245.96617-2-philmd@linaro.org>
---
 hw/ide/ich.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ide/ich.c b/hw/ide/ich.c
index 122fc7e0ab..3ea793d790 100644
--- a/hw/ide/ich.c
+++ b/hw/ide/ich.c
@@ -100,14 +100,14 @@ static void pci_ich9_reset(DeviceState *dev)
 
 static void pci_ich9_ahci_init(Object *obj)
 {
-    struct AHCIPCIState *d = ICH9_AHCI(obj);
+    AHCIPCIState *d = ICH9_AHCI(obj);
 
     ahci_init(&d->ahci, DEVICE(obj));
 }
 
 static void pci_ich9_ahci_realize(PCIDevice *dev, Error **errp)
 {
-    struct AHCIPCIState *d;
+    AHCIPCIState *d;
     int sata_cap_offset;
     uint8_t *sata_cap;
     d = ICH9_AHCI(dev);
@@ -156,7 +156,7 @@ static void pci_ich9_ahci_realize(PCIDevice *dev, Error **errp)
 
 static void pci_ich9_uninit(PCIDevice *dev)
 {
-    struct AHCIPCIState *d;
+    AHCIPCIState *d;
     d = ICH9_AHCI(dev);
 
     msi_uninit(dev);
-- 
2.41.0

