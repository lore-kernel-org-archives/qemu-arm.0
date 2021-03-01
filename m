Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3559716lfg;
        Mon, 1 Mar 2021 05:21:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOxD/F5eq9w1LHJErkg3/4dNMnd8W2ETh3jx3iOE+rW4da26ydDdeRv39/fZqyV2ycRf2w
X-Received: by 2002:a67:e459:: with SMTP id n25mr7718620vsm.6.1614604872174;
        Mon, 01 Mar 2021 05:21:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614604872; cv=none;
        d=google.com; s=arc-20160816;
        b=kj8LI6mx+iErT5Zs+EvAa49HNVAQBiuqjTE1UHznyI4gcHn70uCkWFn8JeO/9J8rxX
         eYS/apWfF2OaiU4ytFBCTA/vfw0eS5aAxXOBbQj6qI0cY4MRAcyDTWAseZwNH/lNVhMc
         O92gsmiLBRli5NZ9UsytScYxWDArogjivxrevsix2M7ZHDLeWqAius/0YC6vu/OZ7erx
         Oa5i/nWwXC4ufrlxgYkZECFxe4jVaNcc/2FAYJ2pZ3be8qCx5osaZKQan4YI2ABiJuJC
         pUGNTfrfBintbmneNhjRtyz/F+94bBIteInCT+SGFdrO7+0PNvHqoLTtZHD3uwFHnN8/
         mGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=5Xb7q0QxWQ8W18mQurok1Q/VxL/osNBdJ6hcw2EYGUY=;
        b=TB1wBI1wo3ofhlMgKxaqWWQqiM7KlXr5f9bNfyr86VCAyN5Jcjp63GTJiwpncyaBLa
         wD26aA5l55CxTXFLLgMJm/42bWUuiPiIkhAvZpbIE62pDZ2Rc0eTRInE8jNfcoChLMJY
         Qdi12sBppZVMwXrDNgdwa1Xx4Cu2JaXVXqGSW/JbFdKsSC2aHpvbjfjFXtGU/0STBnl5
         ZdSm5A5BZI2u+zhap0qPQP4f6nrGa8q1CruykG17/gSdIzhiSu6RrJFVs3IEIYPmcXd2
         gRnXbUPQcKniEU6SEWhSAEs6Kbr7uR2m6x8ICIxpO9eyl9D2mIBnk2blhRD1PUND45rr
         Ojyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bDbTxsz1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x23si2716078uao.19.2021.03.01.05.21.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 05:21:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bDbTxsz1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGiU3-0003Os-Ed
	for alex.bennee@linaro.org; Mon, 01 Mar 2021 08:21:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGiTK-0003Ob-Fq; Mon, 01 Mar 2021 08:20:26 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:34272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGiTI-0003EZ-OK; Mon, 01 Mar 2021 08:20:26 -0500
Received: by mail-pg1-x535.google.com with SMTP id l2so11567481pgb.1;
 Mon, 01 Mar 2021 05:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Xb7q0QxWQ8W18mQurok1Q/VxL/osNBdJ6hcw2EYGUY=;
 b=bDbTxsz1ZFD8M1ORHK21iU+gcvZou4+b47W+EbEEPG8WW3UzqrQWCgoIunam9UWlLQ
 +udGh6BEjMUqJbzmQE98aqod2zAml7uuAGu+GZ/Cu1wVuGcdZDwasr5ARjNAOTlbSYvg
 1CwEmvL/A9d20kb3L5Jk1Qy4Nb1yNGZceHLbV9oql9nryJsmECETPGxAWGy5phr7poQs
 WCgcwF+2jJqfz0RGaB2QoWCr3c+IXIzIhWkq7wgqUsHB3VV/DYUHibe4msyChzuO6PnP
 +0Pj5Ai9xhJX+c/dtOcybIya0aizQOzOuKHp+pw/icUfaGD6t/s9yfq6gS9RJK+wcOX7
 pcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Xb7q0QxWQ8W18mQurok1Q/VxL/osNBdJ6hcw2EYGUY=;
 b=IlrEP3O6P9fvomodNIWH/BL7JMVsFYIUB6Ppt5hBvdboGXt6qzUuLWG28KPgJujXN2
 DDLSNh0NRkU52otlICXcU10kN+QkAOx/sFpCVdKjCFq0gnciWDnwbdjOQ1PKNm8aW3L/
 K/6XZsSHiYnVW47bQrCHi4L3DSNqYEJ6sfkcP1ilRZ0Nh/sBOjxcMvIMjBD+6ctlT+6c
 N2i0tneOSuW8Rn31jsuLoLeBsoUCw+EfUjrZ0HKOA404f1bR7XW3vZLQaKlwMg2Payvy
 SIijBk+oJIPYUVqXqwgB/OKiqhdAVR3Q1R7eIoNg7k40jjaI1uZDdzsD9tVe+94K6WRn
 FxOQ==
X-Gm-Message-State: AOAM531fzAWvuGY0DXlv5bWpATGDRrQMSQJCcrvvYT6tHHGRAoZA4KM2
 bP4F/KdcZOiIHRax5clFXT0=
X-Received: by 2002:aa7:91d2:0:b029:1ed:b10b:5a7 with SMTP id
 z18-20020aa791d20000b02901edb10b05a7mr15326299pfa.2.1614604822433; 
 Mon, 01 Mar 2021 05:20:22 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id q2sm17748793pfl.158.2021.03.01.05.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 05:20:22 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 0/5] hw/arm: zynqmp: Implement a CSU DMA model and connect
 it with GQSPI
Date: Mon,  1 Mar 2021 21:20:06 +0800
Message-Id: <20210301132011.8494-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x535.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tRgFr9Ogh9Ey

From: Bin Meng <bin.meng@windriver.com>

ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
crash. This is observed when testing VxWorks 7.

We added a Xilinx CSU DMA model and the implementation is based on
https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c
and the one in Edgar's branch.

The DST part of the model is verified along with ZynqMP GQSPI model.

Changes in v6:
- int_enable and int_disable do not have its own state
- return 0 in int_enable_pre_write() and int_disable_pre_write()
- remove XLNX_CSU_DMA_INT_R_MASK in int_status_pre_write()

Changes in v5:
- int_enable and int_disable do not affect each other
- do not modify int_status int_disable_pre_write
- set MEM_DONE in xlnx_csu_dma_done if it's SRC

Changes in v4:
- Add complete CSU DMA model based on Edgar's branch
- Differences with Edgar's branch:
  1. Match the registers' FIELD to UG1807.
  2. Remove "byte-align" property. Per UG1807, SIZE and ADDR registers
     must be word aligned.
  3. Make the values of int_enable and int_disable mutually exclusive
     otherwise IRQ cannot be delivered.
  4. Clear int_status after int_disable is set.
  5. Coding convention issues clean-up
- remove one change that is not a checkpatch warning
- Rename "csu_dma" to "qspi_dma"
- Modify XLNX_ZYNQMP_SPIPS_R_MAX

Changes in v3:
- Implement DMA as a separate CSU DMA model
- new patch: xlnx-zynqmp: Add XLNX CSU DMA module
- new patch: xilinx_spips: Remove DMA related code from zynqmp_qspips

Changes in v2:
- Remove unconnected TYPE_STREAM_SINK link property
- Add a TYPE_MEMORY_REGION link property, to allow board codes to tell
  the device what its view of the world that it is doing DMA to is
- Replace cpu_physical_memory_write() with address_space_write()

Xuzhou Cheng (5):
  hw/dma: xlnx_csu_dma: Implement a Xilinx CSU DMA model
  hw/arm: xlnx-zynqmp: Clean up coding convention issues
  hw/arm: xlnx-zynqmp: Connect a Xilinx CSU DMA module for QSPI
  hw/ssi: xilinx_spips: Clean up coding convention issues
  hw/ssi: xilinx_spips: Remove DMA related dead codes from zynqmp_spips

 include/hw/arm/xlnx-zynqmp.h  |   5 +-
 include/hw/dma/xlnx_csu_dma.h |  52 +++
 include/hw/ssi/xilinx_spips.h |   2 +-
 hw/arm/xlnx-zynqmp.c          |  21 +-
 hw/dma/xlnx_csu_dma.c         | 743 ++++++++++++++++++++++++++++++++++
 hw/ssi/xilinx_spips.c         |  33 +-
 hw/arm/Kconfig                |   1 +
 hw/dma/Kconfig                |   4 +
 hw/dma/meson.build            |   1 +
 9 files changed, 838 insertions(+), 24 deletions(-)
 create mode 100644 include/hw/dma/xlnx_csu_dma.h
 create mode 100644 hw/dma/xlnx_csu_dma.c

-- 
2.25.1

