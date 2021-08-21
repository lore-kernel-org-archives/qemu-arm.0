Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp406974lfg;
        Sat, 21 Aug 2021 08:45:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8grOLNJ0DBvcMR2ByGC7Yg0DdXgPl3xKWoclHqRD9yzRRNmwOmxkyd2GAVQKJVT6s5vxE
X-Received: by 2002:a92:ddcf:: with SMTP id d15mr17782827ilr.184.1629560733701;
        Sat, 21 Aug 2021 08:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629560733; cv=none;
        d=google.com; s=arc-20160816;
        b=CDzcw3fkFbCPGofeGqpQqMSimGioPy2S6d/Tyat1lIDGys2opE2xrGf7KFLVGNNZ7/
         oL09eIMm2vWdmeeMNUgZOhybum06o+Msef2tN8wCrCpOiuDOVyqblpqthvKPvwB8hhlb
         VzJl9Ts9f8JdIU6tIpuHbUMaYGiVA4HhFuKKxI3XuiotSeY0EkYmXV2EcICr3eiDR+KJ
         J3itYkfkz6+l7QifoF43BwE8xlCQayDJtbTGkgzrpGlKGpR1WRIUm82/kpI6rEjqujYk
         Lt5hpb7W+N+efDbcwPHtc+qtetxgOWwN6R1U4spyMGgtKQ80bPir+vIqdB0PhVvl4Ehf
         6ntA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=TNtcrfeWDh1xu3p2wPdO3YNUuTTB4Q8RsicutDqx+Ig=;
        b=yYJWdxbWPX4CoEZBwQFsc4XKQjNCz4U0gT0ue1MoLglu3H2GO7Z7GBif3P4xHyidkt
         JO/gW55uskS9IyP2Q3pxlqLd0fwgA3sqTdlk22pWDHGymPQ5I8xoNUN3WofiEBaYeF8y
         5hL05WuONLfpxD+pwx/v7OS+CP5kVcgmJj76ItdBo5STOaKQiBhklB3pRmBb1frIuL50
         GoSJHRbc+HDfzp4+O85DAeIdAUE4QyvSuVNJ3o2u2Kkh8dmsyU54YIKJgUSnfQ0El7lB
         7fnBf/XpJq2gZPcrju4xYO9aFweOSz7nGAYBHaR3wVfIzgrY4ZOMFPVsqSZozUa7B3VZ
         JZig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=lUi2RQUz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4si10146869ili.30.2021.08.21.08.45.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Aug 2021 08:45:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=lUi2RQUz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mHTBd-0001c8-3r
	for alex.bennee@linaro.org; Sat, 21 Aug 2021 11:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mHTBN-0001bs-VJ; Sat, 21 Aug 2021 11:45:17 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:43814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mHTBM-0002DF-HL; Sat, 21 Aug 2021 11:45:17 -0400
Received: by mail-pl1-x632.google.com with SMTP id x1so5104015plg.10;
 Sat, 21 Aug 2021 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TNtcrfeWDh1xu3p2wPdO3YNUuTTB4Q8RsicutDqx+Ig=;
 b=lUi2RQUziOvcKHg78PaSlpTnSpWjAz0VYHpENpthZnHjNHHxzZVLMXP+4ihSPF3zwv
 jOIaJfFuavgfYg5wMcTQLrE9vsZiakCcIwK3a4Pq6OoJaW9jt3X3kZfkG7xroM9LdJGn
 6P4M2xgNqWUDDbubhz5PPrTSTRht8JRzAf+J5gtvFgCBLAWTzgNyrMRVSb+GR9Fd7jG8
 TbAkzDrNNbEESHt6iCIqm+eNW1bJqMvxodRXy30zYCJT7Ns/G7ofuYreCcWvkVKg0dBG
 V02JSTvb35LKQwQyA/1dkDdwHb00tLG8Gl7lPSP0GWhrJ1abc+xzf0KPR9T/8Xt+x0dP
 JXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TNtcrfeWDh1xu3p2wPdO3YNUuTTB4Q8RsicutDqx+Ig=;
 b=O7jdDjfH7p5aWNGxrA5nQz0KR7MwLlapApkYKAtByesUKBMnWJ6ONgXE5xyosQ/r4I
 UgbXPrm1+v+eSuFpZ74JjgAVTGGxn60Wcbnl7htusS3dk2LSriaHs0zf6cFUK2RrYS4S
 yQ8Ak2DKyzL6qIUlax7qw2NEZloAXQHEkxVMZdWpE2p8uLaceQIG0J7xp7huImB5YgJz
 MsLpHUBb4Uqzt2Iq92mDCh8e8NO/5mmfRUF9S8n8KaEkhlFz5Z761z3iGt0APpzFJmT9
 uFKIimQbjQOaTSVYaFEao5gV3/2JiHsEWLLewA81/ihkSR3dCqkHvHhJWq20OPp+nCAj
 rzBA==
X-Gm-Message-State: AOAM530XuVIJs++npBOI0jfEh6PPB2nGxCFCaz22pFPGRYPM/dxGXB27
 qX6xQGcNcQG5kZ0GxA6w4uM=
X-Received: by 2002:a17:903:3109:b029:12d:3160:a815 with SMTP id
 w9-20020a1709033109b029012d3160a815mr20591783plc.45.1629560713370; 
 Sat, 21 Aug 2021 08:45:13 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id k10sm10350726pfu.139.2021.08.21.08.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 08:45:13 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [For 6.1 PATCH] hw/arm: xilinx_zynq: Disconnect the UART clocks
 temporarily
Date: Sat, 21 Aug 2021 23:45:05 +0800
Message-Id: <20210821154505.18033-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j4zjmmpU2Lcj

As of today, when booting upstream U-Boot for Xilinx Zynq, the UART
does not receive anything. Initial debugging shows that the UART clock
frequency is 0 somehow which prevents the UART from receiving anything.
Note the U-Boot can still output data to the UART tx fifo, which should
not happen, as the design seems to prevent the data transmission when
clock is not enabled but somehow it only applies to the Rx side.

For anyone who is interested to give a try, here is the U-Boot defconfig:
$ make xilinx_zynq_virt_defconfig

and QEMU commands to test U-Boot:
$ qemu-system-arm -M xilinx-zynq-a9 -m 1G -display none -serial null -serial stdio \
    -device loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0

Note U-Boot used to boot properly in QEMU 4.2.0 which is the QEMU
version used in current U-Boot's CI testing. The UART clock changes
were introduced by the following 3 commits:

38867cb7ec90 ("hw/misc/zynq_slcr: add clock generation for uarts")
b636db306e06 ("hw/char/cadence_uart: add clock support")
5b49a34c6800 ("hw/arm/xilinx_zynq: connect uart clocks to slcr")

Looks like we don't have enough time to figure out a proper fix before
6.1.0 release date, let's disconnect the UART clocks temporarily.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

 hw/arm/xilinx_zynq.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 245af81bbb..1bc749f6b8 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -257,16 +257,12 @@ static void zynq_init(MachineState *machine)
     dev = qdev_new(TYPE_CADENCE_UART);
     busdev = SYS_BUS_DEVICE(dev);
     qdev_prop_set_chr(dev, "chardev", serial_hd(0));
-    qdev_connect_clock_in(dev, "refclk",
-                          qdev_get_clock_out(slcr, "uart0_ref_clk"));
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, 0xE0000000);
     sysbus_connect_irq(busdev, 0, pic[59 - IRQ_OFFSET]);
     dev = qdev_new(TYPE_CADENCE_UART);
     busdev = SYS_BUS_DEVICE(dev);
     qdev_prop_set_chr(dev, "chardev", serial_hd(1));
-    qdev_connect_clock_in(dev, "refclk",
-                          qdev_get_clock_out(slcr, "uart1_ref_clk"));
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, 0xE0001000);
     sysbus_connect_irq(busdev, 0, pic[82 - IRQ_OFFSET]);
-- 
2.25.1

