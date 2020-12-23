Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp6266624lfq;
        Tue, 22 Dec 2020 22:26:27 -0800 (PST)
X-Received: by 2002:ac8:6e83:: with SMTP id c3mr24448602qtv.318.1608704787485;
        Tue, 22 Dec 2020 22:26:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608704787; cv=none;
        d=google.com; s=arc-20160816;
        b=M9w1x5Rmf9RkJu77VVDkVoELJq1sZP1IiUgRFuJ74z3WGbyOlwSy3xLxlxopeyxIPD
         eAxxkA5gylPgIgbns5goEnRBogUGvvGeUYYF5NCGnL3Vk4kdayquTG0usYaTodNXZgGB
         nfAVKqH5MAK+yzQ1oBLVmctgLEoiOzlg+dpS7WQ0nIDQZ3FvXtmAg8ayjzA+jxpYUWU8
         51DRA8rO9LIb315HBx8xmZu2h02oXJH9BWNSwGxQbj5wDUt8eu4VlIGgFi0kZqm6fAdD
         RjiVDHhkM3XpBZ7MezCntkJfhIMWNMKN2NNjYgAiofnPCztM2akJS9/1IS3WmAzh0QFT
         TXGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DJuHHO8ZbiKmX8gRi7laW9cwXkwMAyTry16lt0sBt40=;
        b=UwbqJGp8jEPSbLSAEw+4LnhEpfMvkFAmaPxa1D/Dglq4aWSA7AZD5m6BObuj1KKISz
         QnZzW9TjNViNwDx5YG2hhyNUEKsrup6yMD5HKm8bEQT/7NFJa0zje+A1fYdcIchZFy63
         F2B8Po2wzyTbVtX9ffVy7oo3FPCTvbrD0TuVu8Pq673uk8fwRQ0PMa1D1cmSaGot1uB7
         SC/oe8qnNvMgD5Lbhniw+10THEiGE1/+LVXZET2CTZz4kW04nCxNdVMfCX03U5J9FyTp
         uH/YiWZSSSqJtgUynW5sPTw1i/TKBIvsbvqDU2oGCyrrxzINth4JWIOCbK0L8KD5TfSV
         ndtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bwOkSRv3;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h16sor20832283qth.16.2020.12.22.22.26.27
        (Google Transport Security);
        Tue, 22 Dec 2020 22:26:27 -0800 (PST)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bwOkSRv3;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DJuHHO8ZbiKmX8gRi7laW9cwXkwMAyTry16lt0sBt40=;
        b=bwOkSRv3o13aYj25tXdwbCIAjXTDsjOj5+80t6yIQG7w3UmzDmyhvOcDlUkYw1GYdh
         +yPujaboZX8+OlytksLMf5lfgdLobee2vYlBwc+XmkB5iDouFOwHtqyasTsNUMF8rZjt
         JuQTZJ1nQ9O45Blklu0BZVbYaqjWwAEsU31zC2RHfizBgmOXlgBjSu6uwhMcoVIPoN3N
         jgQ+363qJi8U5zwpCV4cNLC80KUagoq/ritiJ4cvuFMnIxs3DaXtStSlrRgzibW71x7h
         jID0RxJup/heRI0xilII9tFTTQcRMryVCNSE3bvhQYBKczTZcMKFbMpQHqw2wDOfM0Q0
         An5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DJuHHO8ZbiKmX8gRi7laW9cwXkwMAyTry16lt0sBt40=;
        b=JKUMXJ/32rnxnrRGD4LJzhmgLZCQN5UQymb/+gDg877Karyoo5wc33XBq/wnfvowi4
         jLzxSDetJtt5pp6LiDeUATXR52MFGaxNlSpmURWuq+kmWkOFStrDX5e5Z+Soqjq97uYp
         Phf6tMjNeo/vtCOp3TiX3GYSV+9d+tZ0z9YRNcw02WuV0U4rY9wfbWZTWRAve8/cNiB7
         tYnr6uUdX+zmoZyxSvITiY15UdvdTBRuLYBLn1Nx2C2mcRIr2fMQcSx6oTnSkoNNvxfQ
         4gf5re05hu51HlhwE9xhOPcyBvKC9QYWwrUoA4spmdlUhI4OwnqWhdOqEXuqPUCZ+TLN
         r2Tg==
X-Gm-Message-State: AOAM531KF2vB4X9dFGvvPRl2qW/+vq+hRJSRVHs2BR4WK+u9cjqWK4SK
	e7gp56SsdG5y4AOzVFf1nzs=
X-Google-Smtp-Source: ABdhPJy4KbuF1Mh1ZRb/x/rBR9SuD8p8nsiLXZP2mtzqxbXjrPcyPmPA4Tj/bjBPAVrONU3EV+16Qw==
X-Received: by 2002:ac8:5496:: with SMTP id h22mr24430382qtq.10.1608704787161;
        Tue, 22 Dec 2020 22:26:27 -0800 (PST)
Return-Path: <bmeng.cn@gmail.com>
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com. [147.11.124.94])
        by smtp.gmail.com with ESMTPSA id q32sm14518589qtb.0.2020.12.22.22.26.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Dec 2020 22:26:26 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 3/4] hw/arm: sabrelite: Connect the Ethernet PHY at address 6
Date: Wed, 23 Dec 2020 14:26:06 +0800
Message-Id: <1608704767-9317-4-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
References: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Rvnvjnduq6G0

From: Bin Meng <bin.meng@windriver.com>

At present, when booting U-Boot on QEMU sabrelite, we see:

  Net:   Board Net Initialization Failed
  No ethernet found.

U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
board, the Ethernet PHY is at address 6. Adjust this by updating the
"fec-phy-num" property of the fsl_imx6 SoC object.

With this change, U-Boot sees the PHY but complains MAC address:

  Net:   using phy at 6
  FEC [PRIME]
  Error: FEC address not set.

This is due to U-Boot tries to read the MAC address from the fuse,
which QEMU does not have any valid content filled in. However this
does not prevent the Ethernet from working in QEMU. We just need to
set up the MAC address later in the U-Boot command shell, by:

  => setenv ethaddr 00:11:22:33:44:55

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

---

(no changes since v1)

 hw/arm/sabrelite.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 91d8c43..a3dbf85 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -51,6 +51,10 @@ static void sabrelite_init(MachineState *machine)
 
     s = FSL_IMX6(object_new(TYPE_FSL_IMX6));
     object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
+
+    /* Ethernet PHY address is 6 */
+    object_property_set_int(OBJECT(s), "fec-phy-num", 6, &error_fatal);
+
     qdev_realize(DEVICE(s), NULL, &error_fatal);
 
     memory_region_add_subregion(get_system_memory(), FSL_IMX6_MMDC_ADDR,
-- 
2.7.4
