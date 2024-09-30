Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1074112njc;
        Mon, 30 Sep 2024 00:34:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUumlH8PLZ5o8mn+k6/a9mRXZht7YYzdduuFIipYsbK0egX82joS3J7xAUIId2aur4XA0gdvP1rJa4/cA==@linaro.org
X-Received: by 2002:a05:600c:5681:b0:42c:b843:792b with SMTP id 5b1f17b1804b1-42f6b1a2918mr15324315e9.2.1727681696745;
        Mon, 30 Sep 2024 00:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727681696; cv=none;
        d=google.com; s=arc-20240605;
        b=RQw0M0qnUdonD3NG0DoOnVFm9JeRTrhLiVpdGF7u/9c67gQCgaFxr9tFvbGsE3rKZh
         Q2qQ8LvTpPTFvKoFuv28StVHOSzkQGKodbLTPnzWtKGrWcW9BrnCxkIhVXp+OoMx73l4
         iPyz1oirscafyKscVrixsmnvnKFLLzN4R29Ptio5bp+YxmxnwZcsGoxozE4upFZ2WSps
         6FhpuOpE/5FFpgJvkcgtH+iC0Dh+0yGZzmJPXBgCYTrMi+Xw5PvxBE5yeziKp+4jWWDf
         Y1fAuS+3fwoU4JEVyO1hMG/OSVpVDDEOiU+TL6Yssduhipqjz4pHlk+gyZaocid9UmZj
         P1dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=gRCWILJ5tP1CDEp4iIo0yM0ySxnxf6B3WCed3GxvioA=;
        fh=O1WqQsFA69iYBYxE+XDeQ/mZtGl5VaZlVka8GSshAxQ=;
        b=bV2xM14H1DZvfhvfBWARTS7c0xsEwZWLScOEOoBqiF7d4UYE16L0blgd5Z57sUK9QZ
         Gy2a+DbihO3HkS5+HavnD5Bzb2XXKT3O5kwoFsjfnLNej99iVOnDyJPvyv9Mb7VwNetV
         u/6syccZcIJyM1mq9BE88ASifAhDCDIC2paD1HHZlq/DuQPTjibYQw9k9NJYE5wR8KlW
         1Wvx7Q4OsIrzVmdrzH5EH5deRdEBqjDDN5PD/sGL1Rha/I9JM2tdmfxsH4Yo884sucIE
         EQeXQyBd5ADP+pafPgncv17ipqtJUNyuEpmmuAcZMScwqVHPXjA+DcvZSRFDSYSsbehv
         L6kw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=maP9ngP1;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42f581c65afsor24424395e9.3.2024.09.30.00.34.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Sep 2024 00:34:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=maP9ngP1;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727681696; x=1728286496; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gRCWILJ5tP1CDEp4iIo0yM0ySxnxf6B3WCed3GxvioA=;
        b=maP9ngP18HjOoFKrCjjM0dSFRf2nttUS30WU1n7YrwG8VBBqIEsKhxY+PvEt4BRPQ/
         m3xg5ZzBhoZvb5pb58LlJ3DvR1XaF16Yh9+QLh5f6MoLyTwjQWR4Umn1cJOpbzBuRGUf
         0X/+uu36c74bA6Fm00lFzf5Hwym2MZfynpznbQw4t6c15UQcx0lXz0nciNTOlnp0QADU
         vxz2xoV9nbQpdBxTHvPQsXIr5sQsXpzth0FcrqMNUTOvY/EW2cUCSltD2s0thrOGIVFR
         OGhvx2NURywtqg2FAZs6ZTy1whNvOeJdmE4UxuZMipcYAhpraO+BIdQ/6i+tA4PVLODE
         JhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681696; x=1728286496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gRCWILJ5tP1CDEp4iIo0yM0ySxnxf6B3WCed3GxvioA=;
        b=BoiR6VhDuigUeWp9q1I6cIWcEN/Mc/ZXQzRNduksRrIuoF5/LnxFECG/BPO+lJvRXB
         0Yq+69dmaK459nzyV9xVorp7IADVvY2i7uXs74GW7hetNWjExPQBFgAikafhVIgLcUzY
         g/l6RVt0u3EjI+I8jQqFNYIWuLPXMEBLpjOg6EuLsr86nkIv1sVwwA4LwyMiDUR4xatY
         U5wkPyZKuHr3S6jMaSHz9C3qvF6D6UxvEzIUK91XhRDzIoCJ12G/Sv8M2OQbpiv7jq5G
         KrdKVoTC1ccpWW+kgIIw8d1LrlJKOzfIo6fkC5KWKnpOZP0iA+pNlV54CfXaujkHFSoF
         NJTw==
X-Forwarded-Encrypted: i=1; AJvYcCVu4ut6lhkVD2Zh1tp7wQiIkyYDZ9kR2PAPVqAhhHv6RGJ+Ys35ujtDtm6lTWOVtWuNqOWbay/EhKvOAg==@linaro.org
X-Gm-Message-State: AOJu0Yz63T+UHFee1EA9YtSqtDvoWj+EMmOPV4ZtaSuzBZJ4Y/qrh+AZ
	vSwVXC4OYuIb74uRvUfzLxwaoNKHOi1nI7FnBtGiQ78n/7CkFJoEHBHQ1xrIkbA4/w==
X-Google-Smtp-Source: AGHT+IGOtyU4Ofketg2XtEwaLaGUAiZZznXObn/Hil68D/dTg/agb5ZVPgC/bKHQcLcITIBmDftCLw==
X-Received: by 2002:a05:600c:1c85:b0:42c:c073:412b with SMTP id 5b1f17b1804b1-42f58490786mr87695785e9.30.1727681696153;
        Mon, 30 Sep 2024 00:34:56 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (186.red-88-28-13.dynamicip.rima-tde.net. [88.28.13.186])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd575dd04sm8282495f8f.114.2024.09.30.00.34.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Sep 2024 00:34:55 -0700 (PDT)
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
Subject: [PATCH 00/13] hw: Add ld/st_endian() APIs
Date: Mon, 30 Sep 2024 09:34:37 +0200
Message-ID: <20240930073450.33195-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: sAncGB1kYWIN

In preparation of heterogeneous machines, remove knowledge of the
target endianness in generic hw/ code. Move it to the machine level.

Philippe Mathieu-Daudé (13):
  qemu/bswap: Introduce ld/st_endian_p() API
  hw/virtio/virtio-access: Use the ld/st_endian_p() API
  target/arm/ptw: Use the ld/st_endian_p() API
  hw/mips: Pass BlCpuCfg argument to bootloader API
  hw/mips: Add cpu_is_bigendian field to BlCpuCfg structure
  tests/tcg/plugins: Use the ld/st_endian_p() API
  hw/xtensa/xtfpga: Remove TARGET_BIG_ENDIAN #ifdef'ry
  hw/xtensa/xtfpga: Replace memcpy()+tswap32() by stl_endian_p()
  exec/memory_ldst_phys: Introduce ld/st_endian_phys() API
  hw/virtio/virtio-access: Use ld/st_endian_phys() API
  hw/pci/pci_device: Add PCI_DMA_DEFINE_LDST_END() macro
  hw/pci/pci_device: Introduce ld/st_endian_pci_dma() API
  hw/net/tulip: Use ld/st_endian_pci_dma() API

 include/hw/mips/bootloader.h        |  18 +++-
 include/hw/pci/pci_device.h         |  35 +++++--
 include/hw/virtio/virtio-access.h   |  63 ++----------
 include/qemu/bswap.h                |  19 ++++
 include/exec/memory_ldst_phys.h.inc |  66 ++++++++++++
 hw/mips/bootloader.c                | 152 +++++++++++++++-------------
 hw/mips/boston.c                    |   9 +-
 hw/mips/fuloong2e.c                 |   3 +-
 hw/mips/malta.c                     |  21 ++--
 hw/net/tulip.c                      |  32 ++----
 hw/xtensa/xtfpga.c                  |  18 ++--
 target/arm/ptw.c                    |  19 +---
 tests/tcg/plugins/mem.c             |  24 ++---
 13 files changed, 269 insertions(+), 210 deletions(-)

-- 
2.45.2
