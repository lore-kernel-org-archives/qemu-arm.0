Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1074622njc;
        Mon, 30 Sep 2024 00:36:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZb12BFVTWIH4NJjyHIiUYWFy1Jbjscfkt0CamiJo9+T8i273ghUbl24+JUPTwkUwkDt+7hmzLjhM1Eg==@linaro.org
X-Received: by 2002:a05:6000:d46:b0:374:bdc4:cfd3 with SMTP id ffacd0b85a97d-37cd5b319ccmr4781680f8f.37.1727681794728;
        Mon, 30 Sep 2024 00:36:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727681794; cv=none;
        d=google.com; s=arc-20240605;
        b=O+v/JscboKWSyM6Rsn34VKlIYbxwg0IGTHT5WssxhiIfODMq/k7OAjDI83rUEYgx8U
         lBQTDkEPgrrNaxN/kMx0SY+HQnT/Azq7WQclyA6Zi2Ck1uwppfDr5XAg7flVAD5dUcG0
         a1X/DUlTW7KEApD2WeLZ+XaMVHCkahLeS39gQZ6AmBCx8SZfeUGYqsSmfqUWMw4GAsbx
         kfn+N2KHzJVGIHQJlMXppUKXuWP+TpjVws4d4b9R9sfH1oYclJ8jxAS+/kB4fYRCnn2y
         /dCrrtVIDIXUYK8UBdAxhVS3BVHjNT2o1D4FEYvTUjg/kIDUPKMq7kS4PNXIbYITa/AG
         p2Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=J3QK0sGMtG8TI1HL5/V5FwLZQoUZnlZNYr8FgmUN/RY=;
        fh=hgLUgcn9XBNKY/oMWjtFEu+2QA9mo7UdNWyEwnjCg9s=;
        b=G84zHIA+rTu/eZ9p69+madz/y4q9OFc3DnAUBrqr/vVmpRhXmiw/s7s4lFRDLSiyxO
         dB2VfWTafut9GXyV3jY0YKE+Q4Wh0u7Z2QmJldmdOMl7E1JWCaHUQFSu56GHUT0fnZKl
         C3RT9Sx0FDfBZDQrk7Wy0ITo/p+wW9+U4VVmTd4TNJcD/2cUbrEHRB6qxoGrkDLjfyHu
         vkVbzyeYvQGp7vABd6kQSuubdbF+IYE5NzEQfcUKRCfqGkZio0oTR7g43QH/5ZRNaBrv
         ujRy6coN2ldDCA9AEsU+lfHJo3/5DH66aXjYn0kcU9Cv0YQ4QVK5AY2ZHGpKhgcsFuFG
         h2ew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bsn2SbKV;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-37ce0606fdasor619658f8f.7.2024.09.30.00.36.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Sep 2024 00:36:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bsn2SbKV;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727681794; x=1728286594; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3QK0sGMtG8TI1HL5/V5FwLZQoUZnlZNYr8FgmUN/RY=;
        b=bsn2SbKVUxL7+0iiS5JXcu6r9/0WpHYYeSxZwyPlfVN/XSDPuyIPWB14hK68lo/PpO
         qnnO+iCgthgSz7X4c2f0lw+1zc1Ovjo942eIPu5WC8g9r7GYiE2LlIoyzMhovDqppXxk
         fx9nareSWZx6jYtjxcSd6sW1RtYLkqJY9hFx6uII0uSUVhrBcUV46FomVszkaouDucv6
         ANtoZylXfez0xvwQ/PNCkk3FEltmUZj7K94Zh6tf/KQirXHNc0CmnDGf3wcL0cEibBsz
         vYlsjMOAHk6/MI54lmaIW82vvt5YHirve3QMV6DyLVGXxztMruiQQwE6G+Mg52gxFut/
         NjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681794; x=1728286594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3QK0sGMtG8TI1HL5/V5FwLZQoUZnlZNYr8FgmUN/RY=;
        b=bhS/loVDUNhXOeDteditCG2oBSezP6ZRjv9MUk3Ki9c2ZvWdaJtDpE4e5eCP2qauh0
         2hsP7XWSDaQ91BhgdZjnrXhT3tcqNGkmJzlKUGdLD2DiOFTlDvYBQc7FQ0v6ZZcYhYLA
         eybUfvRIoswp4UM1A/mn/p3st/LpEW8c8GHJAU2ipx3OlXUODzPDk9T8BhUCtkK5s/TB
         5Oc7dVZ5B/I/6k79whh2Q5sfQX9OKIKDFSHYzyRlIxDrd9nxfpLAFhvU3PkPVR/poFAq
         jLZQXNayJEEbOEabp6WnHHYWTWN1y/XOna2B3WfTHaH4u0qDU/EJUuV1Gn6xvwZJSBbr
         uDgw==
X-Forwarded-Encrypted: i=1; AJvYcCVTbZrqq59I8JIJzFW1OorPvh0170ZOCRC7S8UV9YAnSIIxG7s/8zB/vM/kz6JTm7tNheQphR/kA75cYA==@linaro.org
X-Gm-Message-State: AOJu0YzQZthjgPmYtmoczhFPIj1WIWRex+7Xc/MglbCzmJ9ZCPRCrfoV
	9q+kXiYVB1HtyKAdpwDtA805Dvtgz/oGwpxAMdQa8PBnrNZ9E0vqM8G+VNRqo2TlOA==
X-Google-Smtp-Source: AGHT+IHfyb7T2OKPtc/aN3zF39s8yY/HEtBknVQ7wiGAPxn0Lopn0hpb6weLKhFtYxrMG/LxHKBT4A==
X-Received: by 2002:a5d:630c:0:b0:37c:d1fb:82fb with SMTP id ffacd0b85a97d-37cd5b3172dmr5782965f8f.36.1727681794106;
        Mon, 30 Sep 2024 00:36:34 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (186.red-88-28-13.dynamicip.rima-tde.net. [88.28.13.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a54dedsm142631145e9.44.2024.09.30.00.36.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Sep 2024 00:36:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Jason Wang <jasowang@redhat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Anton Johansson <anjo@rev.ng>,
	Peter Maydell <peter.maydell@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Sven Schnelle <svens@stackframe.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Paul Burton <paulburton@kernel.org>
Subject: [PATCH 12/13] hw/pci/pci_device: Introduce ld/st_endian_pci_dma() API
Date: Mon, 30 Sep 2024 09:34:49 +0200
Message-ID: <20240930073450.33195-13-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930073450.33195-1-philmd@linaro.org>
References: <20240930073450.33195-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: N2UXPwq/k8LB

Introduce the ld/st_endian_pci_dma() API, which takes an extra
boolean argument to dispatch to ld/st_{be,le}_pci_dma() methods.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
TODO: Update docstring regexp
---
 include/hw/pci/pci_device.h | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci/pci_device.h b/include/hw/pci/pci_device.h
index ff619241a4..dc9b17dded 100644
--- a/include/hw/pci/pci_device.h
+++ b/include/hw/pci/pci_device.h
@@ -300,7 +300,29 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
 
 #define PCI_DMA_DEFINE_LDST_END(_l, _s, _bits) \
     PCI_DMA_DEFINE_LDST(_l##_le, _s##_le, _bits) \
-    PCI_DMA_DEFINE_LDST(_l##_be, _s##_be, _bits)
+    PCI_DMA_DEFINE_LDST(_l##_be, _s##_be, _bits) \
+    static inline MemTxResult ld##_l##_endian_pci_dma(bool is_big_endian, \
+                                                      PCIDevice *dev, \
+                                                      dma_addr_t addr, \
+                                                      uint##_bits##_t *val, \
+                                                      MemTxAttrs attrs) \
+    { \
+        AddressSpace *pci_as = pci_get_address_space(dev); \
+        return is_big_endian \
+               ? ld##_l##_be_dma(pci_as, addr, val, attrs) \
+               : ld##_l##_le_dma(pci_as, addr, val, attrs); \
+    } \
+    static inline MemTxResult st##_s##_endian_pci_dma(bool is_big_endian, \
+                                                      PCIDevice *dev, \
+                                                      dma_addr_t addr, \
+                                                      uint##_bits##_t val, \
+                                                      MemTxAttrs attrs) \
+    { \
+        AddressSpace *pci_as = pci_get_address_space(dev); \
+        return is_big_endian \
+               ? st##_s##_be_dma(pci_as, addr, val, attrs) \
+               : st##_s##_le_dma(pci_as, addr, val, attrs); \
+    }
 
 PCI_DMA_DEFINE_LDST(ub, b, 8);
 PCI_DMA_DEFINE_LDST_END(uw, w, 16)
-- 
2.45.2
