Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp843828njc;
        Sun, 9 Mar 2025 17:11:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVOFdsuFePpGEAGo8i4QiMXJQcZJ/+8MOyAFOuEY+EDcYrnTWcLTs/VXxqCS8q65Na/byWOsewH1MnpPA==@linaro.org
X-Google-Smtp-Source: AGHT+IENgAB7oVCyV5520SpyFScR8z4VfBCa8mGlmg8Mpu9p4/OhPNagRycBhBL0PGqVwxdeCTEX
X-Received: by 2002:a05:6214:1d22:b0:6e8:9525:2ac3 with SMTP id 6a1803df08f44-6e9006adc67mr177396176d6.34.1741565489058;
        Sun, 09 Mar 2025 17:11:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741565489; cv=none;
        d=google.com; s=arc-20240605;
        b=L6pAkfL7sWJ3xzbd3tdJ+spsLDW0Nx4PYGA5H9daa8R72G/NaxmcmPOdxJUi0f7Xw+
         33402Hq24Ewji3TsRJTNvmzseDge05XxME0c+tXYBh+87lQY+N2B5QlaG2F4b5sPu+fz
         +fmEu7F8worgcFBNi04RX5qzlS1kE84vqxMThcRFmd2tv4UiYtWhvEng6VLrL4WzuCph
         WzpedsiwenDyBkMK2sptB7twhArT2BW4bPtGg1twVbLAjUROM61Z0npsQ1i+O3d4fVIT
         TE50YcetI2obKaHJIvJaOjo673RqgyUIUw3QgXT+H5hCmAdZ3mHcDxZ+rwV1s7/2vQj4
         Q+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Py9KY+fnraissHmshv8b8vP/Jh1xZMVT/AazakuO3Zc=;
        fh=RYKEUW6vzOU1SSyJYJk7WymgubXGryxlmeQ6Tzs1ojQ=;
        b=PlnLQozra/aj7SHrXdjYhOUNK6N+iLCe60DQyGCsR5dlwVhKonzZmeIoEB+rAN2HcI
         9sHRzhS2wj1WNLghMtDCaYQrxihZ0tNzRgnlbgDBRaWcysO5S/Q3EurPOwC2ffRw3PE+
         GOUFQP+VDCrQY94juV3e9P7JSI0iRI1VLl14bowrPN2+e0G8gUei1x+jF+YdV/IQ5XX+
         0rwj5+3eGuaUzhWwbKobD8u7K+t/Zb/rC1K0IN+2dghDH5/P4IMhSP8vAMNyFk1MYjDI
         o9n/eX+Ph3muHXDk1sqCZzonZY71g6cRdFcijbnQVYau4IUSjG5oGErHoNGvmuA76NU3
         llkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nRfKj3jJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f74672absi78452096d6.460.2025.03.09.17.11.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 17:11:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nRfKj3jJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trQiM-0005Vi-Ox; Sun, 09 Mar 2025 20:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trQgJ-0002Ob-8U
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 20:07:46 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trQgF-0007X7-N4
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 20:07:43 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso3630435e9.2
 for <qemu-arm@nongnu.org>; Sun, 09 Mar 2025 17:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741565257; x=1742170057; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Py9KY+fnraissHmshv8b8vP/Jh1xZMVT/AazakuO3Zc=;
 b=nRfKj3jJK0n+ktgfvCysL+fqGjlXEFaUR6XIbHhc47agQACnwWCwSOt7MYQv3CNQQQ
 gvk0xf5EPdhlda7pOAAA6RUM6GhfVFyBB+46CaO7B0z6McMCfaomBhYiF2XDMMPSlJgy
 pvmpG9DInqygAfxO/EUmGe/TNmg47+H21v+yDe2Vzx/g6J6UmZOMvIbgfSBQFuq7LDli
 eN++sM2HE16GptmpojUeNl70IPyHeVODf9DXybn69BhlE8veC3x08HMK8R9tHLa0/i8P
 MLHzzIlVI1cH7c3uwrmCXxrh4iy09AN0Gr3o5awa8RILJy7iOsLu4ifv//ebU8HJ/ZHZ
 /RDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741565257; x=1742170057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Py9KY+fnraissHmshv8b8vP/Jh1xZMVT/AazakuO3Zc=;
 b=jco5whTpcdCDOQdvvdxBF0uAIsoM4c3UM01zTZSJqiPWFANxlwl9fYjMICYnK8u0Qc
 v3CpPgzdwn6SGKNAXEQQcpysYLXHEY1+8dkImfTwo1qXS6k1zKlq6sMfTGvJ15eipHpr
 rMY/GBm5SIVEaZXMLWRAMS3FWJM2N7wVOP5U5VSCiWwkVQnnYcR88t8/lUDLbD9SNjcT
 rc4KJU8iMSRJv+p9rkllK8b250IaMvQihi/C/yTHmGoz11BOG6L9dc4qG7QSb7/C1XQy
 a2QMon+lofrk9MsRym5pOGdMuq8fxN/UvLMOyW0cfh/GiDPhjGuHIvjM0NGYJV/w3/B7
 WtPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCHNPJZ6u7eBmoW+ldZB6l8/Ol0noRQFecYSzyitNfvL5fNUHCO+wvozYwK8oRWrcBhPQYJc1+5g==@nongnu.org
X-Gm-Message-State: AOJu0Yy+Q3YOZQBVHfDmse5YOQmkU06ZBjX6yD8iP7nfL1BNJPpya8bO
 Gec+wMGYFIHobs+ZL1EIKB2GkqtxqITRIUsACwKABZxeHcObMV2U0MgrKiZh4dA=
X-Gm-Gg: ASbGncvtDakeohyz7UT6xMFZdmBmiLP153F1Kc+Dm1lNzPymh8pLibig3dCzw2eB2fW
 f76sumJlns10b/C3ZpnvtjCq8LF/6C+XSdIs1BM3ovpnn9A49wwMSDXHHC6Xs5EjFGmlnAoZbsH
 9OV5/gd/d9vvuP+0aPxu/cW0q0IVavH1+kqF6N9fhIolVpsrbvDkq2J9cBTNpJK7I7wp4k3kt0i
 9TD21oKEDoodHBGkZSF8XGUfkze8ofmAZd9YQ1N1sh92Et9XmwlQZQ2hFM+C0vwhy683+BYpnc+
 zsZUKnMw/T2pqRnFgnlL5HkbTBC1CD15bzdVB84uPpmLT2ptBnpJkMIcZNl4l89FF5H1dserLIP
 FLlO9BrrT8bJJRAARaRZr/Lp/jumaQg==
X-Received: by 2002:a05:600c:1c04:b0:43c:f629:66f4 with SMTP id
 5b1f17b1804b1-43cf62969f2mr14732705e9.0.1741565257265; 
 Sun, 09 Mar 2025 17:07:37 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfcfbsm12872089f8f.28.2025.03.09.17.07.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 09 Mar 2025 17:07:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v5 14/14] hw/sd/sdhci: Remove unnecessary 'endianness' property
Date: Mon, 10 Mar 2025 01:06:20 +0100
Message-ID: <20250310000620.70120-15-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310000620.70120-1-philmd@linaro.org>
References: <20250310000620.70120-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: 5gomMOmh9PRy

The previous commit removed the single use of instance
setting the "endianness" property.

Since classes can register their io_ops with correct
endianness, no need to support different ones.

Remove the code related to SDHCIState::endianess field.

Remove the now unused SDHCIState::io_ops field, since we
directly use the class one.

Suggested-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sdhci-internal.h |  1 -
 include/hw/sd/sdhci.h  |  2 --
 hw/sd/sdhci.c          | 33 +++------------------------------
 3 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index d99a8493db2..e4da6c831d1 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -308,7 +308,6 @@ extern const VMStateDescription sdhci_vmstate;
 #define SDHC_CAPAB_REG_DEFAULT 0x057834b4
 
 #define DEFINE_SDHCI_COMMON_PROPERTIES(_state) \
-    DEFINE_PROP_UINT8("endianness", _state, endianness, DEVICE_LITTLE_ENDIAN), \
     DEFINE_PROP_UINT8("sd-spec-version", _state, sd_spec_version, 2), \
     DEFINE_PROP_UINT8("uhs", _state, uhs_mode, UHS_NOT_SUPPORTED), \
     \
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index e8fced5eedc..1016a5b5b77 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -54,7 +54,6 @@ struct SDHCIState {
     AddressSpace sysbus_dma_as;
     AddressSpace *dma_as;
     MemoryRegion *dma_mr;
-    const MemoryRegionOps *io_ops;
 
     QEMUTimer *insert_timer;       /* timer for 'changing' sd card. */
     QEMUTimer *transfer_timer;
@@ -105,7 +104,6 @@ struct SDHCIState {
 
     /* Configurable properties */
     uint32_t quirks;
-    uint8_t endianness;
     uint8_t sd_spec_version;
     uint8_t uhs_mode;
 };
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 47e4bd1a610..cbb9f4ae8c0 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1391,17 +1391,6 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
 }
 
 static const MemoryRegionOps sdhci_mmio_le_ops = {
-    .read = sdhci_read,
-    .write = sdhci_write,
-    .valid = {
-        .min_access_size = 1,
-        .max_access_size = 4,
-        .unaligned = false
-    },
-    .endianness = DEVICE_LITTLE_ENDIAN,
-};
-
-static const MemoryRegionOps sdhci_mmio_be_ops = {
     .read = sdhci_read,
     .write = sdhci_write,
     .impl = {
@@ -1413,7 +1402,7 @@ static const MemoryRegionOps sdhci_mmio_be_ops = {
         .max_access_size = 4,
         .unaligned = false
     },
-    .endianness = DEVICE_BIG_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
@@ -1467,23 +1456,6 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
     SDHCIClass *sc = s->sc;
     const char *class_name = object_get_typename(OBJECT(s));
 
-    s->io_ops = sc->io_ops ?: &sdhci_mmio_le_ops;
-    switch (s->endianness) {
-    case DEVICE_LITTLE_ENDIAN:
-        /* s->io_ops is little endian by default */
-        break;
-    case DEVICE_BIG_ENDIAN:
-        if (s->io_ops != &sdhci_mmio_le_ops) {
-            error_setg(errp, "SD controller doesn't support big endianness");
-            return;
-        }
-        s->io_ops = &sdhci_mmio_be_ops;
-        break;
-    default:
-        error_setg(errp, "Incorrect endianness");
-        return;
-    }
-
     sdhci_init_readonly_registers(s, errp);
     if (*errp) {
         return;
@@ -1493,7 +1465,7 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
     s->fifo_buffer = g_malloc0(s->buf_maxsz);
 
     assert(sc->iomem_size >= SDHC_REGISTERS_MAP_SIZE);
-    memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, class_name,
+    memory_region_init_io(&s->iomem, OBJECT(s), sc->io_ops, s, class_name,
                           sc->iomem_size);
 }
 
@@ -1578,6 +1550,7 @@ void sdhci_common_class_init(ObjectClass *klass, const void *data)
     dc->vmsd = &sdhci_vmstate;
     device_class_set_legacy_reset(dc, sdhci_poweron_reset);
 
+    sc->io_ops = &sdhci_mmio_le_ops;
     sc->iomem_size = SDHC_REGISTERS_MAP_SIZE;
 }
 
-- 
2.47.1

