Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp307715njc;
        Sat, 8 Mar 2025 13:39:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXvk4FCc2WQc33OAqNS2BMV4gFqA6AO8G5AyVdLQt7HmtecK49ubHjfdE4OoOzTY5vkS+7WXsWBfN7+Iw==@linaro.org
X-Google-Smtp-Source: AGHT+IFxWxjL9NZmtyjfM1us7UHoAtYcZOS0NL68Vx0s54+GprPj2REaotia+sFNTaOK77ZqYiX7
X-Received: by 2002:a05:620a:6606:b0:7c5:4a63:be9f with SMTP id af79cd13be357-7c54a63c067mr96736785a.34.1741469996710;
        Sat, 08 Mar 2025 13:39:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741469996; cv=none;
        d=google.com; s=arc-20240605;
        b=LNSJQhnjKpH2U43ekCLAW8ZmlRMQA4pXl3gyaFPXO6rIMPmdShrpsC6W07y4+hN2DI
         wJ9EWM26IWq9g5f2NOpubSTNAdaDdebpJvpBHbroS0nGi9XHiqyLdWT3lJD21r1VnBTl
         i252v8grxmrZmIY73f8x4thgXa+0YMNmTYxaJlQYNY8VeAZBdyiHvNEfp35uPV/Z0nJA
         /nm4LAf0rkESopsjaZcXjj7hkRYCmJd2oUIr/G/A52LNkiCCGQRGZBvAbiVnup+Ad0HN
         pealWHSXZFR70VTjHlGhps0TkIdDr13P3J5m2Fym85txjsb6NlqVWX/ByC4dMOSl7P+m
         H7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=akRNzOoRRyY/xSKhmyVeI+5UU9kBXMKW6nWI01FbvUE=;
        fh=VY+yaha2RKelkrz4KORzp4oTbhHTn5Ly6Y64UTdaBMc=;
        b=iI1Tnux2U5bobNP9P5O7MMLTLr4LC+/KkN0iFwvFD09IJauevW80MZNJA7y3jqZXcy
         fq5Cco/amOQo/asezO6MUZfCPt/yAJFVWkEKmyWC4UD92f9ROc1X6NnKbnojXYM5/3nd
         Kcsi88oYS2eV7mWMnLDJPORinBQxv6BH+25cPv6ILCFExWSlUoPjEC5hbJUizNGN2KsX
         /zyC5mlyJgEPK5idsRj33hxPKwyrYr0HqkkVlKSqedGObwlRFSgwPknjGnFeUFBLv0/E
         f9wu+4hwjp01/hTRbYTqETw4oZeZLoQ7ePXcxssxS0oOsGBm5l2ipaFBZGpPi4++Mjgj
         0jMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Io2AyQFP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e536d365si596072785a.189.2025.03.08.13.39.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 13:39:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Io2AyQFP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tr1sU-0006su-Bz; Sat, 08 Mar 2025 16:38:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tr1rF-0005Yx-2o
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 16:37:31 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tr1rA-0003vp-SG
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 16:37:18 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4394a823036so25410015e9.0
 for <qemu-arm@nongnu.org>; Sat, 08 Mar 2025 13:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741469834; x=1742074634; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=akRNzOoRRyY/xSKhmyVeI+5UU9kBXMKW6nWI01FbvUE=;
 b=Io2AyQFP+0pG4t9mNFdUsDeQtliT4b9N30kLRMQEQJn6KyOtsTVXXM+QhjO4BJH8AD
 yBua7QK4P/BT1uGx7H2poKbeUICqCRpCe+tU/gwzzoCAQycQmRK/s6i42QUtEv1OMPSd
 gMkMIEiSjtKjJG0P9OZxLQtZogpxQMtCgDZA2d2TLrIbNMLj6sTN8Jasdt1cH+xHghsu
 ddNdR5oyw/QPILobDkoDPkA0YBp4aC2ITC9aBVMXg+3WY1FKklF4n7Fo4w6tT9XDvH+S
 mfcb3iUpEMRKR9fuLcoENDC+Ahy2rVA7yH168LCzLq03EzwBx4+INaeADeRMEnoJdP5m
 wzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741469834; x=1742074634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=akRNzOoRRyY/xSKhmyVeI+5UU9kBXMKW6nWI01FbvUE=;
 b=t/j3YULKJvp0w2nLAEzp/FZsOB4m7d1UDSYxyosD9nbSkBtmTA05S4Ty0Z7N13Q/1K
 zfac+jfJuspOC34uA5MlTeMSOcvlDi8uLKvtYO4J3d0hpy6z1vf15Khij/H9gkTBlH1K
 blSlirtH58RzczcCAa7FgsfcD7rzVX0paSBSoix37UOiSVsybJ0YXsm2bpu/CEa8/H1Q
 kV6Q8maRyksCBsg+Q/q9Gnq9YlUFYr2RcBIQ4lCuNvJA2K+4VB3QAwPvuQHT3tj+rjS4
 Y6JRURw4HeM2J2rAf9ghkGqS55mYHzh3K0KKoqmfeJ94O6UnVGkE9dYSvJBfqb8MtBn3
 MVTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqPuzYVP751b9Bi32KhVYx6jkT1F/aVHenH7t0Gywn+QyX+ctiOaKSPG0cK64DiXqa3gkQ1hEW9A==@nongnu.org
X-Gm-Message-State: AOJu0YyHLv1ZMDLE2aiBDHLCO5rfJM+atAAIPs3clhUCEGt/ff5Q1eiw
 t5lHnkO+XLKkZbp9HDT2Tp/NHEd7+jlr8AG90fEYpcFHZSJx/3MTPlViVJK7Yc4=
X-Gm-Gg: ASbGnctggKyarjnhrjoL94uP2hj3NQEKo64ZnSkEzbuFJsCzRgWj4mZpvzpK9dSt8NK
 cdtV1jh+e3S3DYbPKdwJGAYd1oIkp+KTZLWdOqMPIithQpcYDunOTB9Lm8LeBGoA01AOdqJLsV2
 lLmxncF06AFQT8ClN1pzoQD+R4UCtEuXxsRWI/m1IBmI5KZHoblHCA97LkGamkCzNUZnYSEAsXw
 xFdtCIg7A9SITuTxPOXS3Zzt9UH54xaK2kQVupOeuXsz8+UYOjue7qQ6U5Sj7gfl3uKby6MZUKG
 xBGMzKPkNFUe5rQZypJE/2bF/lLZ/Hpp34vlQ+p8LbOBVG97dfM9OlntVZQ8ujuwqN52deD7K0/
 gjhBeS/48S0NkDNheXCM=
X-Received: by 2002:a05:600c:46d0:b0:439:969e:d80f with SMTP id
 5b1f17b1804b1-43c60231ddamr59791445e9.31.1741469833745; 
 Sat, 08 Mar 2025 13:37:13 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfbaa94sm9963087f8f.14.2025.03.08.13.37.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Mar 2025 13:37:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Guenter Roeck <linux@roeck-us.net>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org
Subject: [PATCH v4 06/14] hw/sd/sdhci: Enforce little endianness on PCI devices
Date: Sat,  8 Mar 2025 22:36:32 +0100
Message-ID: <20250308213640.13138-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250308213640.13138-1-philmd@linaro.org>
References: <20250308213640.13138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: B1lZwWq9CRu3

This is the default, but better be safe than sorry.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sdhci-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/sd/sdhci-pci.c b/hw/sd/sdhci-pci.c
index 5268c0dee50..5f82178a76f 100644
--- a/hw/sd/sdhci-pci.c
+++ b/hw/sd/sdhci-pci.c
@@ -32,6 +32,7 @@ static void sdhci_pci_realize(PCIDevice *dev, Error **errp)
     SDHCIState *s = PCI_SDHCI(dev);
 
     sdhci_initfn(s);
+    qdev_prop_set_uint8(DEVICE(dev), "endianness", DEVICE_LITTLE_ENDIAN);
     sdhci_common_realize(s, errp);
     if (*errp) {
         return;
-- 
2.47.1

