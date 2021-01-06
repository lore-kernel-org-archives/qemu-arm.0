Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp600468lfq;
        Tue, 5 Jan 2021 22:35:24 -0800 (PST)
X-Received: by 2002:a65:51c8:: with SMTP id i8mr2940359pgq.81.1609914924748;
        Tue, 05 Jan 2021 22:35:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609914924; cv=none;
        d=google.com; s=arc-20160816;
        b=nlz0poNUzZ0l9FPbTrPc/+Ib4S6Ov1vjvFcTR8z+PHu5G7S5Soe3PWI5C6j8aDG2xs
         SvphOX1wSxR0Od301c1mn0Ax4CJDRrfH7LhmBGnR4HIkZym+fz7VoY83sOB5e5/4UVvc
         zbwqcELux2T/PaPerkyxG0+C+K6Y8tpsVlXd9dYnmUY0UG8JrxugrFibaXls8Iykmi1I
         /VHQ/Hic+mz8qzJOXMkNtcDlwEq9wtB7fq6mTCV2E/2zn4XEgCZZsHY1Zu44Qde5rCma
         ftMxEZufl/nE/dkorSlUyBG4IztHzffemsviFkdEwaNNPDKbt7IeCFDacNEfYlLMFxTX
         Si6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CXG7bK3DGo/swZLf3xUG4CksXWWUngcawbrNPY8Gm1o=;
        b=kk7jCL9Em1S00Bs+MXUN74IK3aqmVESR/t50updm5sH7mLuuCjHgMSZ0x666f/GIyn
         ldbSgPsa8+Y1LefsxDVII7oZ14WBVtJzMReE0NE3AhCmq+qxOcgBMLqiT/+0cJCwiZ8+
         ZZObAfj+ZAZgiN8mw5Dw7SdjYKfw31haWwwsY5K9DRKelioj0yMhwooqEUkc/JEWeA6M
         wdk0A8KGB6ThkuRoBEjRyg8Lu2X4NKKyZMqHftZEE8Skc+8ULtf+ttbOFNbqdFHsRrhv
         OWqR6oKbA+IPOrN5omcWWzZ4R4hwTRjBrqbUaZSob/XM7D8KmSvqlSJFpLif/U0yvQQr
         RlKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LHZ6mdL7;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e1sor774433pls.33.2021.01.05.22.35.24
        (Google Transport Security);
        Tue, 05 Jan 2021 22:35:24 -0800 (PST)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LHZ6mdL7;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CXG7bK3DGo/swZLf3xUG4CksXWWUngcawbrNPY8Gm1o=;
        b=LHZ6mdL7ECrIk0DSUNHKlIRmiWe71383NBHMeAggswZHKZiSZ3xctUiFSL9YSrgbgx
         Q+WZ0tYqT5D6NeaQObm5XZNuXcTtMqOFTlAf+YOXOgP9bqApsTc3YebU/JHTe48+m6B3
         gl5iHUT1wP+QXYvjXgijBittEE3MjeOGqGnHM/8bnMlDuvaL4Rvr5D1xI5hwZGOZ47Kk
         S6wDqynDhzewulPPGEh1nTDcgj7s9MqTquzZD4js6IAkaZOESylDF7RtBXkKEzXoBBNu
         O89e4CPHMv7FPkMtc4lZIWzO9jptOrgtF4xabbZG49+NB1T9pBXDRndXDQzDdidQDjy5
         UiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CXG7bK3DGo/swZLf3xUG4CksXWWUngcawbrNPY8Gm1o=;
        b=UJ75HlZVQGZNmQdvSEB7QggA2lTnkSSpcsHxVpF8eMk2I0M2KLso2RDDYDyhXTjsFN
         Zn0JDAVk823sZiZLGCQGhdBc6nrb8mjZIpCvaBJzENjzzxep8mny7QEWWdH19Z2NODJw
         4T0vTRz2vnafEtz/LtQmdoT6Fjg5kVBXofHD3dYilYAS4FAnddvoWoG5fK7kwDyMb8Ik
         na6hDy8y0r4cZHjrcxYXu0DIUi9v1M6RfMTxcmF35Cld0Y81tz5HymKgPXphknATb0Ia
         COyTWEOHj48NL4bGdnjikNkFK4buw7mRBW/J8aohTLlAyKol/xopcrVdk9EZLeodBQm3
         SD4g==
X-Gm-Message-State: AOAM532sdEoA0X/jt24PrFI1fiXJeeo1RkyOJ36BiZFv95uK3qT+pBDS
	WcNsAk+ruGWlyBUxbwDE6OixeUoqrTA=
X-Google-Smtp-Source: ABdhPJyOtT/Dzea5HsTFMD2HJVEVlpVqcOS2hxl0kKuEjQyj7KLnuly37ZqQkh1gQxB5lisfFE3RYg==
X-Received: by 2002:a17:902:6b87:b029:dc:3402:18af with SMTP id p7-20020a1709026b87b02900dc340218afmr3126456plk.29.1609914924141;
        Tue, 05 Jan 2021 22:35:24 -0800 (PST)
Return-Path: <bmeng.cn@gmail.com>
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com. [144.168.56.201])
        by smtp.gmail.com with ESMTPSA id cu4sm1132976pjb.18.2021.01.05.22.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 22:35:23 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 3/4] hw/arm: sabrelite: Connect the Ethernet PHY at address 6
Date: Wed,  6 Jan 2021 14:35:03 +0800
Message-Id: <20210106063504.10841-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106063504.10841-1-bmeng.cn@gmail.com>
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cZG8fafB/zG5

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
index 91d8c43a7e..a3dbf85e0e 100644
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
2.25.1
