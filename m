Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp6266546lfq;
        Tue, 22 Dec 2020 22:26:21 -0800 (PST)
X-Received: by 2002:a37:983:: with SMTP id 125mr25031647qkj.496.1608704781386;
        Tue, 22 Dec 2020 22:26:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608704781; cv=none;
        d=google.com; s=arc-20160816;
        b=SUYkf0mi/AQdO5eabhjOomOeTutlHh74cn8B53XBV0reeVGheANzzu/S0Q2GqauxLy
         0w02P2s3nNGnU9SnPb/s6+Kv5Q1DlMd+PoX1sKuRjdkwRObk2BlCUIzjjIgHNYR3JPT/
         5TPQMyD7UUMBGdWn3bNVts+JD3kf+i1/u81qlUwe/yjpiXx0vpke6JSbQ/STla3Lg9Tx
         tw/GbWl28EBYqewW4EeeLPy2OzC+mw/6dimfGfnT/TYNdhXthkphr20miGrN/pDU90c4
         5g2pBZaVRMoUY5VHtSW1OT6L2xfB/kQv3YTSidfM1ModomGbBMrigtS9lVfpKxnBiG1x
         YQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=j8t49DEBS83dY7ANND9n6teA2PnlK0M21YEXBIleMjA=;
        b=TbQMcybQjbahrivtAm59jh78NuxMq6QEIxCJ/mkLaRkh3inTvWW3t1lw6vg9JLuZSK
         D2km2Lf9KijxfuZF+AacjPnbbqr42AwcJayC/F5gbYB6zhO9cQ64T3578cLZ4zluc8+D
         B1ESdwPlmmyORiBEXhUBSrXwobH1rt1k7ivJcVR8CleWkLttFmlSC2HIoky8/YQmAOBF
         mp+N7zttnbhyjlvv8inqp7TYoFgQz3PA9KaG+MUFjiiO9KI4sEi1o3TqRPDArtaBMx9Y
         0Rvprs3OOJ6QEdHW8ImhBuNbgYaNu9Kr/S/z+MZ2U7L+tYekXuk7dJM49csEt/TYIWGQ
         tZuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=I3GcjVkM;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q22sor10158248qkq.129.2020.12.22.22.26.21
        (Google Transport Security);
        Tue, 22 Dec 2020 22:26:21 -0800 (PST)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=I3GcjVkM;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j8t49DEBS83dY7ANND9n6teA2PnlK0M21YEXBIleMjA=;
        b=I3GcjVkMNTvz5ksBtj8GmebyLEU3WaeFkP+bSJyenGcQqNnT5Apt0LWIqFS/9pfvUb
         DM4/8hrPR/o1G5GDG6T4VLIb6k5eO3WqO4/3BwTFm9zJJUO8N5H79xhx+JbeaH5XafZ1
         PATX1Q/mTpemz1HWykfcbTFRHITXUt6YFVxz1T/pFNr3RvknwS5Yhhjl2Z8QfwaNctjf
         685uY/XbFbk6e1GEmmm9onwKCnqFeYAZrvJAwEScUHTtO/6CNM9TA1eitF16YElBuQ0x
         XKEh4p6BycLCEdTP9RnEgCwzLL3YwSAMl3Z0EwToULt5XF5W6KbVrX3h/uH4dO22gERF
         YHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j8t49DEBS83dY7ANND9n6teA2PnlK0M21YEXBIleMjA=;
        b=G7qlHIQlz8pJJA2kFW8EzyUKiiduBBw7mUfloJrHc2VMygUG+hfsjq8/neKmds9YrK
         jR49VKfw3MivjJNdmEyHOiLakBwitdBcMCgqahDYwp458pyN1BTSmUFbBBQ/07X4CeC+
         k1NivB+iXT3UOLLbLz0UMoToe3uTrMoyTl0cJ4v5EQQX+FDQl4tqXfNC9znYiWjQ5nFn
         pBLyPkW7NB/YVqcsBGkyZZj+7qdZtc2uT1gc4xKInSwYkNVV1ClHTrZaSuqAbZki4ZjC
         IhuRNtzxzlmx5fcyVFLQynAEvws+/MFFdVabhPgQ5uN2U6fMV46k8spIn8mECrrs9Zg0
         6Etg==
X-Gm-Message-State: AOAM532rREeSQGHKpMrWhaFeZNa+EHlNqGrt1SS+zme3hzAyoMiFHs8O
	rpzqP5KCIiNuESk+stysl7I=
X-Google-Smtp-Source: ABdhPJyhgKRPV7Djrt3r+cq1sOevbyI8Njg2+F4Do80DIxqU/KFzn/iEPnUjoyCaGQAWqsDY5iCOjQ==
X-Received: by 2002:a37:a0c6:: with SMTP id j189mr26196558qke.142.1608704780961;
        Tue, 22 Dec 2020 22:26:20 -0800 (PST)
Return-Path: <bmeng.cn@gmail.com>
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com. [147.11.124.94])
        by smtp.gmail.com with ESMTPSA id q32sm14518589qtb.0.2020.12.22.22.26.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Dec 2020 22:26:20 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 1/4] hw/misc: imx6_ccm: Update PMU_MISC0 reset value
Date: Wed, 23 Dec 2020 14:26:04 +0800
Message-Id: <1608704767-9317-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
References: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
X-TUID: d8R5ASp5c/vU

From: Bin Meng <bin.meng@windriver.com>

U-Boot expects PMU_MISC0 register bit 7 is set (see init_bandgap()
in arch/arm/mach-imx/mx6/soc.c) during boot. This bit indicates the
bandgap has stabilized.

With this change, the latest upstream U-Boot (v2021.01-rc3) for imx6
sabrelite board (mx6qsabrelite_defconfig), with a slight change made
by switching CONFIG_OF_SEPARATE to CONFIG_OF_EMBED, boots to U-Boot
shell on QEMU with the following command:

$ qemu-system-arm -M sabrelite -smp 4 -m 1G -kernel u-boot \
    -display none -serial null -serial stdio

Boot log below:

  U-Boot 2021.01-rc3 (Dec 12 2020 - 17:40:02 +0800)

  CPU:   Freescale i.MX?? rev1.0 at 792 MHz
  Reset cause: POR
  Model: Freescale i.MX6 Quad SABRE Lite Board
  Board: SABRE Lite
  I2C:   ready
  DRAM:  1 GiB
  force_idle_bus: sda=0 scl=0 sda.gp=0x5c scl.gp=0x55
  force_idle_bus: failed to clear bus, sda=0 scl=0
  force_idle_bus: sda=0 scl=0 sda.gp=0x6d scl.gp=0x6c
  force_idle_bus: failed to clear bus, sda=0 scl=0
  force_idle_bus: sda=0 scl=0 sda.gp=0xcb scl.gp=0x5
  force_idle_bus: failed to clear bus, sda=0 scl=0
  MMC:   FSL_SDHC: 0, FSL_SDHC: 1
  Loading Environment from MMC... *** Warning - No block device, using default environment

  In:    serial
  Out:   serial
  Err:   serial
  Net:   Board Net Initialization Failed
  No ethernet found.
  starting USB...
  Bus usb@2184000: usb dr_mode not found
  USB EHCI 1.00
  Bus usb@2184200: USB EHCI 1.00
  scanning bus usb@2184000 for devices... 1 USB Device(s) found
  scanning bus usb@2184200 for devices... 1 USB Device(s) found
         scanning usb for storage devices... 0 Storage Device(s) found
         scanning usb for ethernet devices... 0 Ethernet Device(s) found
  Hit any key to stop autoboot:  0
  =>

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 hw/misc/imx6_ccm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index cb74042..7e031b6 100644
--- a/hw/misc/imx6_ccm.c
+++ b/hw/misc/imx6_ccm.c
@@ -450,7 +450,7 @@ static void imx6_ccm_reset(DeviceState *dev)
     s->analog[PMU_REG_3P0] = 0x00000F74;
     s->analog[PMU_REG_2P5] = 0x00005071;
     s->analog[PMU_REG_CORE] = 0x00402010;
-    s->analog[PMU_MISC0] = 0x04000000;
+    s->analog[PMU_MISC0] = 0x04000080;
     s->analog[PMU_MISC1] = 0x00000000;
     s->analog[PMU_MISC2] = 0x00272727;
 
-- 
2.7.4
