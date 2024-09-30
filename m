Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1074583njc;
        Mon, 30 Sep 2024 00:36:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZIGa0Mch0/+0HPZvY4WtaCH3VZO1Kl2OJdj/dnvBQk5X5Zb4+okksclsDlREKpK3oH9BXpFo+wb5pBQ==@linaro.org
X-Received: by 2002:a5d:4bcf:0:b0:374:b3a3:3f83 with SMTP id ffacd0b85a97d-37cd5b07311mr6235895f8f.53.1727681786814;
        Mon, 30 Sep 2024 00:36:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727681786; cv=none;
        d=google.com; s=arc-20240605;
        b=UbjZ5CBBcdHkrmkVB2Kx+PkcjxVdt243Zcp84LO1D6TVNAXwD9eiwCmBsXeo869N8H
         zjqqyS+1bB4GNJ+Y1FZozPJM6U4h9FO+fwREjzR8o6DT+eyzh3OMjvLq37iokkJVujuR
         nj9gox23VtKJZ6ZP1fPjCBRR0SRXw411vJd0TJGJfMOAs2Uz8C+mo2pmUyH+Oj18Rtdi
         EQkgmkHUE9Xgnx/F/FCLsE7Z92EqHg3RWq07wdRgGKbAC+vsRMnVe7IisQcmwd0ZS51h
         /onjz79xwzYVR43HcT+bJRjhCKBdmtb63MH9h8kZe7qo2S+hUjUiZcb/K++8HGuZnMUs
         d8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=olm5MEqTuo7Wlc02c6b6qRoX+TEZG1pRsM1M0qwZSUk=;
        fh=YMod5UhbtQj9Lg3wyR2jvoxlI2FjLjaxIsGVLTOSSKU=;
        b=OsOpyY/CAG+ew2jueHe+2ZbcXaWCr743NUxGJTab3o0qf/4yM95LQyRilo315HUthh
         YA4/AKcGDTIejfsNFAXlfekIx2vLncTkUBhMvsk5EBPeT8KIG7uc0LZQZyLvBf7yklFy
         Vn/nB0doHR0eOotzi2nBoy1RlknDCbss4OVwYDaBIWPa5j6jo7aLNUEIeYHwY5BiI36/
         CpWa96kp20KZbakN5QQmNUSGpVlpJa6BEt/VWxtsmcj4meid0lE2IEW7EsRaMqR2lq4V
         wFu4DbcVEChjsiuJ1GXV87F5ZrZyPjRhlQYh92cxbHD5sCqrCPuXAfJQqMbLrp8SdxWA
         3rOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nOaQJx6s;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-37cd5667fbesor1301172f8f.3.2024.09.30.00.36.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Sep 2024 00:36:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nOaQJx6s;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727681786; x=1728286586; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olm5MEqTuo7Wlc02c6b6qRoX+TEZG1pRsM1M0qwZSUk=;
        b=nOaQJx6ssMS6Ookm7OrImb9q/ay4DViOyxkKrgYKFi1XKVYcDuhM9J8cfPJpQZeNoD
         wi39AgiLoI5emdlhAwm9joAyW3f69FIamMid6WvFB18F6yaC2Xd4b+CEejDTxAOgxSFq
         yw7+em2vvMFYEGSAyPEkTIh8u/1HWtrhzTULy2v9Abg/HyiB8ogjrM0HQYn2Ekk26LOW
         8T0Nnlo6Bs9OVPGfF3tBuBTCr2xFLM0StQEL6miTVg8G7YGI7+WOx5jk+a9osDPsorIO
         0j2iaUn7dNIynjINvUucLjqlLQijxpuDrF1HodA9BD/HaSrSa2TRr/ckaT0elVaqGlhT
         t9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681786; x=1728286586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olm5MEqTuo7Wlc02c6b6qRoX+TEZG1pRsM1M0qwZSUk=;
        b=ruCOJzJRgB7eNE/w4OqLl6delXiUxanInwV5Ay2rkKY/JGmpfkGmQ94XuyYYlstFNm
         3YZH/WH7iTOjRyv5xySHaQRkpWv8pgK1ZW03CbC3leevFKZ+oiTyuElyuPY2JWQVxel3
         P1FjSGQHmbu/FvLKIoOPJFCVFbm602VlXjmozIH7cbdGc0RGj5zQrMtYiSjLuypyLzQ+
         kTCwAjcwIHqhRLQ/qxyvY9FTfiff6SwhjJjWORajK+si955y5UWT312kE/o2yjNWuz/G
         miIk9daQHnZAkFB+HngHAoGKcPJT5I0B/vFcNDOtRx3ktVsgej27TKWpTOxKJc9Fi5S0
         w4Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVYA5BQnO4mqEUWn4zwB6SPBaIeYXXr8SvOPyLxWTONuweoDRuqGC5fFTPUXNwyzH+X4BVUSojRKzFm9w==@linaro.org
X-Gm-Message-State: AOJu0YwyuAUdHidtHhe3u3C30KVrED56JrvX/OJ4LYEnki86q3b8qOTV
	leD7FT+7q3Tnepz/F7YBjBkOWQ1RzCOjiZ0Dq1TjSgbqVXNV3gHUp2gTasWStyi6yw==
X-Google-Smtp-Source: AGHT+IFJ/LX8GVVEsOLDWrfB7Tgyojyz4e841ap2Xfa6UE1pQYhd3FzF3SxsSMfp08WAfw2JTro3Mg==
X-Received: by 2002:a5d:690f:0:b0:37c:d4ba:1127 with SMTP id ffacd0b85a97d-37cd5a8791dmr6298056f8f.16.1727681786225;
        Mon, 30 Sep 2024 00:36:26 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (186.red-88-28-13.dynamicip.rima-tde.net. [88.28.13.186])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e6665sm8343859f8f.54.2024.09.30.00.36.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Sep 2024 00:36:25 -0700 (PDT)
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
Subject: [PATCH 11/13] hw/pci/pci_device: Add PCI_DMA_DEFINE_LDST_END() macro
Date: Mon, 30 Sep 2024 09:34:48 +0200
Message-ID: <20240930073450.33195-12-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930073450.33195-1-philmd@linaro.org>
References: <20240930073450.33195-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5MLglLu7hepL

Define both endianness variants with a single macro.
Useful to add yet other endian specific definitions
in the next commit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/pci/pci_device.h | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/hw/pci/pci_device.h b/include/hw/pci/pci_device.h
index 91df40f989..ff619241a4 100644
--- a/include/hw/pci/pci_device.h
+++ b/include/hw/pci/pci_device.h
@@ -298,13 +298,14 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
         return st##_s##_dma(pci_get_address_space(dev), addr, val, attrs); \
     }
 
+#define PCI_DMA_DEFINE_LDST_END(_l, _s, _bits) \
+    PCI_DMA_DEFINE_LDST(_l##_le, _s##_le, _bits) \
+    PCI_DMA_DEFINE_LDST(_l##_be, _s##_be, _bits)
+
 PCI_DMA_DEFINE_LDST(ub, b, 8);
-PCI_DMA_DEFINE_LDST(uw_le, w_le, 16)
-PCI_DMA_DEFINE_LDST(l_le, l_le, 32);
-PCI_DMA_DEFINE_LDST(q_le, q_le, 64);
-PCI_DMA_DEFINE_LDST(uw_be, w_be, 16)
-PCI_DMA_DEFINE_LDST(l_be, l_be, 32);
-PCI_DMA_DEFINE_LDST(q_be, q_be, 64);
+PCI_DMA_DEFINE_LDST_END(uw, w, 16)
+PCI_DMA_DEFINE_LDST_END(l,  l, 32)
+PCI_DMA_DEFINE_LDST_END(q,  q, 64)
 
 #undef PCI_DMA_DEFINE_LDST
 
-- 
2.45.2
