Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp253158njc;
        Sat, 8 Mar 2025 11:05:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV/tBEjrFL9MLfAZyjXk8EKOG+lAFuF4DgQO5OENS5SJv90m1CIirMC2xvh6rj4A/fgZ/q4Mg2Csdau+g==@linaro.org
X-Google-Smtp-Source: AGHT+IEwoom9JqWIoqzmneLQBi2b7RiwGYk/mmQrlT7iN3/m97jLYGMZXAp1RhHTNR+TMA/JGY5B
X-Received: by 2002:a05:6214:1c0b:b0:6e8:eabf:fd4c with SMTP id 6a1803df08f44-6e900662885mr84721896d6.26.1741460755350;
        Sat, 08 Mar 2025 11:05:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741460755; cv=none;
        d=google.com; s=arc-20240605;
        b=banFZC5NVQObHLVcJ0Pes3pBa93osvsW25dgDU6Z4458njBvkeBNU38kZH4XeXrAXE
         vawKsbGXqKZYSjDBltV1MmnaEViCJdFHNuVIHIyUFqpPPmPyg8ZQv5hSiW1b52JtrRgE
         BzHaOFuoymMvEYCwm2fFhV7o5326TeexeCJC575VKUf7l33X1MauTr99MQjh5GXw3tI4
         WnXVWQRTniS2+mlTfBGtrBG3o11E6+fxNofNx9Jmjx5mGPq7qm8NlTXZOWmC1ifFDjF/
         brCJtui85C6jRW9Ti7pUMINH9kyYE4gzqQvHo6ewWDlUqucJluY/qfBKobkPqun/uN10
         O95w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=akRNzOoRRyY/xSKhmyVeI+5UU9kBXMKW6nWI01FbvUE=;
        fh=a4SM3OxvDN+gnpAfcKP2s8WzvmDBldOQFSzrHUHe6E8=;
        b=hs6Qx0lRzsnexqVGEwLTdm7rgDRnLkSwut7p+uvDTbRqKbym9q6UsI1b3JVtGcIWrL
         SiLC0hsrA9YQfzpC8FMgqA+LMRWdnLNRABzIqaeEgnItLMj78ktgEDwGGyhL0lzbMFwj
         n9155VShZeceapDAapVaa8Lq2hKuVXrriv7lwGkR8Ctz7G0KE/ejLHrXOkmipA7ereFh
         LzWmbpgh6uB5QmesersQt0eCWiA7MT+FpLf0QbPgjfPrUW3G1aimCyrcsqT6FWJ/KKWD
         71uW6J03ZsW5qBzefG7rX8HgyPyjnzh/ahppXqQ/uyUjnB/tMRNJFEHid8xz+1CITXhs
         8yPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NVv+e3ws;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f71626b6si58484516d6.196.2025.03.08.11.05.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 11:05:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NVv+e3ws;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqzS7-0007GJ-Vz; Sat, 08 Mar 2025 14:03:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzRt-0006xT-Gs
 for qemu-devel@nongnu.org; Sat, 08 Mar 2025 14:03:02 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzRq-0003Yq-6n
 for qemu-devel@nongnu.org; Sat, 08 Mar 2025 14:03:00 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so2139087f8f.3
 for <qemu-devel@nongnu.org>; Sat, 08 Mar 2025 11:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741460577; x=1742065377; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=akRNzOoRRyY/xSKhmyVeI+5UU9kBXMKW6nWI01FbvUE=;
 b=NVv+e3wsWAVRWUMqimnZHUFALAv33TIpU7hJ9GS19FP509KOZ7GUvhTRlLfxc8Xpw5
 cjSrcxoVwMZaQipi7g/LPAqkjsIRyGdDo+tUM4X2XaxQSY8/A9FouztLh2ANrxL3kZtA
 5LbDN6ZGPA+HUT/NmoMahGQfYk9VAqaMjiCo3b4IZJQZLd+VHim8MbMdwUyzqT3BaEFR
 u2vhRMtZyF6uWFuEYnJn9DW6P7dtpEjq5aXnuIqlkVSaNW9dNaDI/YGwB8zPizKoCLF9
 GpLBHC9Vw/Nu2i/0PVG3Wyib8ZPdeb2BQd1QlLc8EbtSVg18gBuMdFrzs+aedE6MDHKa
 PTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741460577; x=1742065377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=akRNzOoRRyY/xSKhmyVeI+5UU9kBXMKW6nWI01FbvUE=;
 b=nlwc0iZ4CNok7Oesm4duwbJyag5gmDrydvQQ+aC/k9hk63GUhMLL0xgtzFBR3mID2S
 lOupgiqJlgHfeDc2NXhl/zXNe4g3+u3yG5IEPH1CrW8KqbGyCHA+3Gy3kpu+5+wuM0eZ
 c1TIUY2rbhB8bKcvKpJQ40eG4pOyXXPOIFt3eV+ZprFQu64OKJGOEf16v49MqgCNedka
 36bDCLafFwn2sBVoIxI4/pn52jebBMNwkJd22DSCYySIOveSjGlbBaSxeB1FRECKsOJJ
 xtgFjk0Cp9iSaDQfwdECKcsLZlOJRCKmL061tu/65PhnFbJ8AvHZZrBuuiuhZjY0++ng
 bwgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV933Mr3GdDU4V0/mE97XZVXQjRP0w20gXvX8iVMQI4xQbw0IBcpmjPpqB13rTnt5q5ngBa+4N2XB9m@nongnu.org
X-Gm-Message-State: AOJu0YxWubzsY45IRViUaulNB79sUpngRugApbFEgAE0vQJwzibalJz9
 BgP8LBEGLecQg3Q/G8OyZdhs554vm2rNTTZLMhtSRg77bAZcGA04CEZF1381n6c=
X-Gm-Gg: ASbGncte0AC0PQNXILRDCPdRlcYMMg1U93Kd+f1v+Xwgb+zAWQHfwvoAblhCaMkIFiJ
 y7uXZs2NPvUdUUP28gewi406x0IILDcKtQaeLubNGozT+XPJBlmRvxURSTVs3rRcVMIkkQIxH5/
 YodsLJ+CI63tiseE2EPDtEe2AtpgMNB5ak6EUtKsrZGrhp4VLmsa/iIA9LUGR0RO1VWRXR114cQ
 R3HeeG8djzBGI6BdOGnaHmLkIZHVHvsNgJFAtV4mB4ZFzAJxAPZYDLujdcpJajvUmrCShWJ1Fu7
 PMlq8F5wSsrcE7/t7zIaR0Vs98xaXvtV7n58EcTdtbbZ9A2cw42K4tv0M+gj1vqXTNVRRQ9amNZ
 /OFD3FlhWxdf6afyuoWg=
X-Received: by 2002:a05:6000:1548:b0:390:ee34:228b with SMTP id
 ffacd0b85a97d-39132d465b1mr6094176f8f.24.1741460576652; 
 Sat, 08 Mar 2025 11:02:56 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c103aa5sm9698256f8f.94.2025.03.08.11.02.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Mar 2025 11:02:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 05/12] hw/sd/sdhci: Enforce little endianness on PCI devices
Date: Sat,  8 Mar 2025 20:02:23 +0100
Message-ID: <20250308190230.7508-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250308190230.7508-1-philmd@linaro.org>
References: <20250308190230.7508-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ZMCQBWMHhq0d

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

