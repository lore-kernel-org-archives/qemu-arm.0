Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1463662lfg;
        Sun, 22 Aug 2021 19:08:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTWvPsj/vm2lph00FwuGxLYPP8hbt/q7OVfgPHs3jOp/3d++wISnO9K4WYdfLwh+Ti1ojG
X-Received: by 2002:a02:a317:: with SMTP id q23mr23720559jai.83.1629684517176;
        Sun, 22 Aug 2021 19:08:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629684517; cv=none;
        d=google.com; s=arc-20160816;
        b=jVJhVExJnRZlRAoS+hRT07APsjIadM0G7IU5uvc3DqMcYZag0us9VYACKj+yUMABZg
         2Gjlw8jEIhgYXaILnSQcVcoQekejATPS2acNgWs6cdpho6dxd+erLIqwKnxiACkMRY+W
         8SwqNG3ous10ebEr32fcuCvr34KVAPkEQH9hQrvSPBB/H/9BH8OZZkK9xu3ojGc/iKGq
         GqWC9X+Luqu31tinRjZfDDIthT1Rtl5CpVwVPPgFhHBvRiovYWAH+k482CAKbfbC2WkK
         Rzs6bPglbMLVOvCF/QSw6h2uKzyvhW49XqK9vTBRnNy2r9zu5ph2ryZ1q6g/TBs/dxbb
         iaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=IsrzO/Lp2Th0I10sGeT4W/vuPaOlI3Gh6oj9iYU2+Sk=;
        b=yZtIgbpQFMY0f/UDWh0DAMPLGS6BtYo2l62KKmd/vbioyEZlpnfQQIf3GqeAVXY7FN
         NVV8HifBr0n+OtRcDgLuYlboaPvUPuvqV9ACHdd/dqRPp9qhG6boiE44/6ehYVRQ/gfQ
         0OKH3Gfbnf6IkB8SxC1Gw4Dll8E311ECa9xVqFFgMtm7UaERqZmJJYIiRgRUZzHXvNUZ
         XdaB8c49QRNpIIcnkfFkimmKmICKY26PoKLbysFQvk0+hKVv4BlWxQDTNpUK0g7Ul7DE
         2FmECtyjusy8PKJ5YS40t/a0IIl0FZ8DYTDBJWGhFL4jjRY9ipIG+1hMGEufA9yU4dBR
         ncdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tndKcgLk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15si13192113jar.80.2021.08.22.19.08.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Aug 2021 19:08:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tndKcgLk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mHzO8-0004GF-G9
	for alex.bennee@linaro.org; Sun, 22 Aug 2021 22:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mHzNx-0004FJ-M5; Sun, 22 Aug 2021 22:08:25 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:34497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mHzNw-0005p5-4N; Sun, 22 Aug 2021 22:08:25 -0400
Received: by mail-pf1-x433.google.com with SMTP id g14so14011731pfm.1;
 Sun, 22 Aug 2021 19:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IsrzO/Lp2Th0I10sGeT4W/vuPaOlI3Gh6oj9iYU2+Sk=;
 b=tndKcgLklJXeyp3qo2+WD8e4GfjSEorGyHvF5Fs42AqNBI4zhbIB8cSmBhnq+DGjAR
 DZtw/LaSVS6w1WXorkDjF6kTyoIeSsEqXPkS7+ywKmHNxEc/7lrXtAuNMIl8hhHuKq+i
 BkhDRnBpXrJR5ZO71jBHDRlmWrH8SrMBj8NUMbql5SmMpt26WG8XHvJWcSTCdbvoWc8J
 C+Xt+1yv6qwEY91AI6ioMFQxku+3D3B+YaUrsQHyAoCq2Wf8fQqYcUwPprvrbbIMLzaD
 BpN/UH9I6y9U5abg4nD9mcd8V4cXh+97Y5sLn0Mx2PwIQMgLtbYgeJnrg+hCzP5kerp8
 /UsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IsrzO/Lp2Th0I10sGeT4W/vuPaOlI3Gh6oj9iYU2+Sk=;
 b=jwVwB3EEMSlS+YTskz1PVu+fPcnbAiOBczp7TD+exkQ4E6NgWRQOB7om2hmIPo5OMI
 9QcI/xg0zxDRjBysONJLYenQj2uRljA99TOAtbdID688g6Gmj7BXEOulczlPYnfKwmjz
 bllabIWfhxfmSvtMUvRsM7Dn1JjiuiTOzUFdBFhtv/rvWbZam/hYZZ5vw/ehXJ24iyqu
 UkrcZDofJgip3cxSNTsD/rUDcd669bBd9PB2TbmB3tinXsLGCFSlK7N2j0cCoI2uH61Y
 ZCCo7sq6BuWKbixrbHV1YTlNxJZ+0Gy6kFivEsBB9gguCQQNzoDWBa8rFCcyTDkeZfsc
 dr7w==
X-Gm-Message-State: AOAM530fczbI12uZGDQODiR3+hNUvAgtvpytOT9YnbKggG6SMXiXOK8a
 iO+kaTLDT3SD02KD139E4JQ=
X-Received: by 2002:a65:62c1:: with SMTP id m1mr29986929pgv.339.1629684502067; 
 Sun, 22 Aug 2021 19:08:22 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id e26sm13804358pfj.46.2021.08.22.19.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 19:08:21 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/3] hw/arm: xilinx_zynq: Fix upstream U-Boot boot failure
Date: Mon, 23 Aug 2021 10:08:10 +0800
Message-Id: <20210823020813.25192-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x433.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +C/zG7w30n9D

As of today, when booting upstream U-Boot for Xilinx Zynq, the UART
does not receive anything. Debugging shows that the UART input clock
frequency is zero which prevents the UART from receiving anything as.
per the logic in uart_receive().

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


Bin Meng (3):
  hw/misc: zynq_slcr: Correctly compute output clocks in the reset exit
    phase
  hw/char: cadence_uart: Disable transmit when input clock is disabled
  hw/char: cadence_uart: Move clock/reset check to uart_can_receive()

 hw/char/cadence_uart.c | 16 +++++++++++-----
 hw/misc/zynq_slcr.c    | 31 ++++++++++++++++++-------------
 2 files changed, 29 insertions(+), 18 deletions(-)

-- 
2.25.1

