Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp600421lfq;
        Tue, 5 Jan 2021 22:35:19 -0800 (PST)
X-Received: by 2002:aa7:9738:0:b029:19d:dce0:d8e7 with SMTP id k24-20020aa797380000b029019ddce0d8e7mr2717590pfg.14.1609914919149;
        Tue, 05 Jan 2021 22:35:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609914919; cv=none;
        d=google.com; s=arc-20160816;
        b=q+2eCHuziPfasKEz4KL31wPaROUavsMMgECLMqubS5WTnwatoCGfeIoT5G+d0WkmI3
         ul8sb6QcMo6Sm/KiYQtczxKfiON52QtQ7eLtX/0OB8DBBGGQuXQijy6UI7pdtCjcZMdc
         PDano2fB4OQcjUTOt/+d1ybPafDLJKl9ZucsJfdoGHKjqUpsMfxm29dzNBDEbZ986GGx
         tBPhMbArwq1bPfKuiBpWg63WKKqybdC0fD+t4Z7dO6jt6vJ9Ii0r1PD7XyXnvUbdzmp9
         20qX3YJKdhzr2CDDfbmiWDi6CMcHIft7nCf5sKeqA5mtu5Hu/s9Cfh58EbRJBIim0Arc
         Id8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hI10iUcIAI/iQ1m4mauQ5SNhBSk9eoPehRL5woqTjh0=;
        b=ZcoGSHQchlIiOVQxiiAUDdiDHnSRTd6ya1VDdk48EgWDVDoqlUWq3gV0dbSW/ngU/x
         suVbwtdbTtEdk9NbDK6NT7ZWvlBeKWO2nEMgAo+gjvZtznocHRYMi+CD+NKQvdMhq/ST
         /S6fYfkK1T3RPq7P0Uvh2FwwmqaRtilTDVBhGmWttRMsglaBeRkZeXnrK50Hlrq6dGBC
         msCS69ag7FtPtZM7BhnDjpyBQ4/vqPFtHzfzunFDCRzWIfxrU76KGv/XFcnQEcKxkXeR
         YoBo19gxf49xGqIDcSGPXQFG9wAiGTTn6k56RbSGFU5JOItUXUE0S8/X8rDfPiTrXVo2
         L2eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cirqna35;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k15sor764049pls.25.2021.01.05.22.35.18
        (Google Transport Security);
        Tue, 05 Jan 2021 22:35:19 -0800 (PST)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cirqna35;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hI10iUcIAI/iQ1m4mauQ5SNhBSk9eoPehRL5woqTjh0=;
        b=Cirqna35dtXcLZQD2EsT66GQGcUbjHQdzG1rkJ09VrqTojHqqeycKV+wyMbMlX563Z
         cM3Nq9hpiyxcj4CYwa8s4c5esP/zfFUnMfQlMG95fEYbhDzkXxKH5y6dogE3gslqu3OY
         j8ITonjQ5IL1gkYMp3ANDwNcLlMgnAGEuOPp68yHz7DHPJytWTASupvQperkEBdk+aDa
         zLbYac4QlUUySnqG4cAgOUYNAjvuIjGgOO94O/CmxY6VlzaOYwanB8VyOQXZ6wfN3mNq
         6KHn3LdMwEnNch3+lRLruN8Ekig/FUpbAv9HfsgsRd1PUyYVH8yAdXJvDDsqGG7jHmIU
         VIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hI10iUcIAI/iQ1m4mauQ5SNhBSk9eoPehRL5woqTjh0=;
        b=iI5ydtwU41+3lVi88uMyDhcDhLBN+axts7EY09yJ0Ff/E+dVKUoUznaYYx23Cy+Dp+
         BfGPwqlf+i/s2cbae67qpCBHfVnEygYMe5p/H7cs0Xev+CyN7AQZAknaHQVCRCcXWMM8
         6nFM2LGxMGREDlEo99nq3/IY4oQNxNoC7GZcZeAL5T3obLFFm8Unb8OE8Pw/5Eq/2dT/
         icDy2rVUQmedc3v8RiozskYBArAPe4TWtD7wDA5diYbRfXg/wcJISOTnT/52LfzY4XIO
         wrrHkBkrA4fyoYysggjVNttk7bR0AcIfnXGWes7NYrc+ZsNIrVtW5G5SMTFm+9N/wAGf
         dCGQ==
X-Gm-Message-State: AOAM533jjw46nPGTOlKd1sr938BBFrmVkECS4ipX49IlHyLHoaLJHz/Q
	Q2jw7WejTXbwSBu4QZ3LU5xZdKf4nFA=
X-Google-Smtp-Source: ABdhPJwGl7aSlb4N5qQUKOqbhaQy/7mo+ogiUeTv28yqfxJdN96xOBYNX+F7U2vNubF0yR3Exi3TNA==
X-Received: by 2002:a17:902:bf4a:b029:da:d0b8:6489 with SMTP id u10-20020a170902bf4ab02900dad0b86489mr3170171pls.58.1609914918392;
        Tue, 05 Jan 2021 22:35:18 -0800 (PST)
Return-Path: <bmeng.cn@gmail.com>
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com. [144.168.56.201])
        by smtp.gmail.com with ESMTPSA id cu4sm1132976pjb.18.2021.01.05.22.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 22:35:17 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 1/4] hw/misc: imx6_ccm: Update PMU_MISC0 reset value
Date: Wed,  6 Jan 2021 14:35:01 +0800
Message-Id: <20210106063504.10841-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106063504.10841-1-bmeng.cn@gmail.com>
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hAoopuR5Edzz

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
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---

(no changes since v1)

 hw/misc/imx6_ccm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index cb740427ec..7e031b6775 100644
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
2.25.1
