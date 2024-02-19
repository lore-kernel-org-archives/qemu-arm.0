Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp424188ejb;
        Sun, 18 Feb 2024 17:21:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUGvpKgO59jKWNT2bkoxFwqMyHQIl/oiG4sMvWZF/8gnySadB7RMwXOM6Ap2Rvc+SXOQ4rfl/8p/SYaPSuURtZ6/3dnXJle
X-Google-Smtp-Source: AGHT+IGw9B2eBoYE9qtFZx/Sk/Y1MYPwd1UPqYpvNtCnyFGfjK7XcoU9VB6KKoKbLEQD3IBn5SWi
X-Received: by 2002:ac8:6649:0:b0:42d:ce4d:5c15 with SMTP id j9-20020ac86649000000b0042dce4d5c15mr9818795qtp.46.1708305661426;
        Sun, 18 Feb 2024 17:21:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708305661; cv=none;
        d=google.com; s=arc-20160816;
        b=Hr4Rjotl8Gs5rAl7KhYhEQ8EFW7FvG36zqaD7x+YB5OyZ9P0XzTMG0YAUp0ab3t/yQ
         pR8M8aLyNTbDsJoZVPjCFD19gescA/cVrG5ICDGKMdPBp/yQBEkSD3OYZzgpQEKgSClZ
         HO6SSBFX6H4I+ma+Rkz0YQzJzqrgHQbUsklvbox/+wKa5GqJvB91T4GXcGrD+JYEDUPr
         qsNZRzPtnLewVzPdXV5NW2RI9o73lCqhFy94ZgTi8C/HNaQYwYdh+HdnVp8f0H4F3XO5
         GEBeN+BoOgjsPWXbVJFTYbsrbpDnecVyDPjVpjxoZMa8pz2Lb8VtAKpyfEcr2a93Xdh6
         JeLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Xkr/gnxxaICGpe6iHiYAh3AvCqlJB8T1ravIgTidKoY=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=NKZVVjqnAlxJmmizgvVpZ0BUzGpazHwG9ylAnSvxr9RpqFAK4lebiZaPFwu/1qWyJt
         NwmL+qK86Dt2FeKFKnjEYkhPJYg9t56srgWybBb5Rh0EXH01qtihI0OVnXwEnJP9LxfX
         WGb2JHrAwIIpCBFB0oB+22pMC/qR7Mus49yIfj+X5R63xAAiTlchTbH23gV4k+PDIxDW
         rIbvhjJ5upa8YDEonJFbthoC+WcaN269l+Yzy78C3e6cQf8oHxY+toxuY7Us2KOXuZcS
         Mnl2No7OHs/y29+p17/gmygvI8hmtGW1ZdLIgPxpGpIv/zBDd2SjaG5SBtenyRJelKW2
         ELYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=XzXgzaxP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12-20020ac848cc000000b0042dadb53e19si5056152qtr.445.2024.02.18.17.21.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Feb 2024 17:21:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=XzXgzaxP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rbsJI-0004Tj-SV; Sun, 18 Feb 2024 20:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rbsIQ-0003Mh-Va; Sun, 18 Feb 2024 20:18:15 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rbsIO-0004Ho-4T; Sun, 18 Feb 2024 20:18:14 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-60843233278so306437b3.3; 
 Sun, 18 Feb 2024 17:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708305490; x=1708910290; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xkr/gnxxaICGpe6iHiYAh3AvCqlJB8T1ravIgTidKoY=;
 b=XzXgzaxP1DkBtoE/k8fYdqSOAcDb2vCq8QcEZp53EWPjp/FT8SBOq5vh1r0Qbh3Hp5
 yUcoQkhigANRt5dpIh2XEM32jDMfjjG5mLASEmCCXb3dFsk6QQL4kahbrIGW31dtSUZQ
 s7N08ytL89qcQ3mNVR2kZgPjbTwBEgQpb+9pJsuTZG23ZfqnNPlfDp4Wx8wtrCI2hfPQ
 /wQfD8Xrsgeh0wddIy4CPg4IegmttFHUK0ZS4CThvlaFrHg2eMW8JPg2zBYJz95Nm7ws
 HC0FqQPDvd5SaXq3Ew4EvuumWZ2GPw1HtaS9j7DJuzHPfKxUaSmBTin583vqKt29GAk2
 cddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708305490; x=1708910290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xkr/gnxxaICGpe6iHiYAh3AvCqlJB8T1ravIgTidKoY=;
 b=vFUC448XdDdCTNT9b1XNdyI3Fry/v7/O05eH8EP5m0jpUBzltnNOmXeb5hEDCk2ALs
 3/fLp6zLyuijMpILUYUDI9uKzz3ngZMwhJER7A3rCwkjGTABUOMs4ZzZ3clSxT9gjonC
 96LP2xQtXfXfyVHJLxo1CnH91ZlYL6TNErLRxv2iBMVIKmBsmvbCcpdIxEfmQCHDApf9
 teWOwkrTB8VLsEwlrpUxhtzQfd7TUzSI5KZZ3/Gfs+dbXbFjOQNmpWzWhBvGWypgdcEC
 u4nVSVNazMdrGFqbMcUNgqqNmvcUKfg0trSiFcvpLPNWrEqpelGawWjBpMIuirgTgEAU
 b8DQ==
X-Gm-Message-State: AOJu0YzCPIAAVTsYUHdOjLNnO435U096dv0c1R7wjhQ2l1KQ2EbnDhsJ
 lIa01n3bdYvw/y1/LuQqEeD6dMWCKRvYf1ALSu6jgwjyfxx9aAmOViav/NVb7II=
X-Received: by 2002:a0d:dd92:0:b0:607:e8c7:faa6 with SMTP id
 g140-20020a0ddd92000000b00607e8c7faa6mr9525264ywe.4.1708305489953; 
 Sun, 18 Feb 2024 17:18:09 -0800 (PST)
Received: from localhost.localdomain ([201.203.117.224])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a819e0c000000b00607ff905ed3sm1204704ywj.58.2024.02.18.17.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Feb 2024 17:18:09 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v5 20/41] Add GENET register structs. Part 1
Date: Sun, 18 Feb 2024 19:17:18 -0600
Message-Id: <20240219011739.2316619-21-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: S6VjV3QTOWE/

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/net/bcm2838_genet.c         | 37 ++++++++++++++++
 include/hw/net/bcm2838_genet.h | 77 +++++++++++++++++++++++++++++++++-
 2 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/hw/net/bcm2838_genet.c b/hw/net/bcm2838_genet.c
index 4420486e00..0d98d1b30e 100644
--- a/hw/net/bcm2838_genet.c
+++ b/hw/net/bcm2838_genet.c
@@ -15,9 +15,46 @@
 #include "hw/irq.h"
 #include "net/checksum.h"
 #include "sysemu/dma.h"
+#include "hw/registerfields.h"
 #include "hw/net/bcm2838_genet.h"
 #include "trace.h"
 
+REG32(GENET_SYS_REV_CTRL,              0)
+FIELD(GENET_SYS_REV_CTRL, GPHY_REV,    0, 16)
+FIELD(GENET_SYS_REV_CTRL, MINOR_REV,   16, 4)
+FIELD(GENET_SYS_REV_CTRL, RSVD_20_23,  20, 4)
+FIELD(GENET_SYS_REV_CTRL, MAJOR_REV,   24, 4)
+FIELD(GENET_SYS_REV_CTRL, RSVD_28_31,  28, 4)
+
+REG32(GENET_INTRL_0,                0)
+FIELD(GENET_INTRL_0, SCB,           0, 1)
+FIELD(GENET_INTRL_0, EPHY,          1, 1)
+FIELD(GENET_INTRL_0, PHY_DET_R,     2, 1)
+FIELD(GENET_INTRL_0, PHY_DET_F,     3, 1)
+FIELD(GENET_INTRL_0, LINK_UP,       4, 1)
+FIELD(GENET_INTRL_0, LINK_DOWN,     5, 1)
+FIELD(GENET_INTRL_0, UMAC,          6, 1)
+FIELD(GENET_INTRL_0, UMAC_TSV,      7, 1)
+FIELD(GENET_INTRL_0, TBUF_UNDERRUN, 8, 1)
+FIELD(GENET_INTRL_0, RBUF_OVERFLOW, 9, 1)
+FIELD(GENET_INTRL_0, HFB_SM,        10, 1)
+FIELD(GENET_INTRL_0, HFB_MM,        11, 1)
+FIELD(GENET_INTRL_0, MPD_R,         12, 1)
+FIELD(GENET_INTRL_0, RXDMA_MBDONE,  13, 1)
+FIELD(GENET_INTRL_0, RXDMA_PDONE,   14, 1)
+FIELD(GENET_INTRL_0, RXDMA_BDONE,   15, 1)
+FIELD(GENET_INTRL_0, TXDMA_MBDONE,  16, 1)
+FIELD(GENET_INTRL_0, TXDMA_PDONE,   17, 1)
+FIELD(GENET_INTRL_0, TXDMA_BDONE,   18, 1)
+FIELD(GENET_INTRL_0, RSVD_19_22,    19, 4)
+FIELD(GENET_INTRL_0, MDIO_DONE,     23, 1)
+FIELD(GENET_INTRL_0, MDIO_ERROR,    24, 1)
+FIELD(GENET_INTRL_0, RSVD_25_31,    25, 4)
+
+REG32(GENET_INTRL_1,              0)
+FIELD(GENET_INTRL_1, TX_INTRS,    0, 16)
+FIELD(GENET_INTRL_1, RX_INTRS,    16, 16)
+
 
 static uint64_t bcm2838_genet_read(void *opaque, hwaddr offset, unsigned size)
 {
diff --git a/include/hw/net/bcm2838_genet.h b/include/hw/net/bcm2838_genet.h
index d166a5c24c..f583818399 100644
--- a/include/hw/net/bcm2838_genet.h
+++ b/include/hw/net/bcm2838_genet.h
@@ -19,7 +19,82 @@ OBJECT_DECLARE_SIMPLE_TYPE(BCM2838GenetState, BCM2838_GENET)
 #define BCM2838_GENET_REV_MINOR         0
 
 typedef struct {
-    uint8_t stub_area[0x10000]; /* temporary stub */
+    uint32_t rev_ctrl;
+    uint32_t port_ctrl;
+    uint32_t rbuf_flush_ctrl;
+    uint32_t tbuf_flush_ctrl;
+    uint32_t reserved_0x10[12];
+} BCM2838GenetRegsSys;
+
+typedef struct {
+    uint32_t reserved_0x0[16];
+} BCM2838GenetRegsGrBridge;
+
+typedef struct {
+    uint32_t pwr_mgmt;
+    uint32_t reserved_0x4[2];
+    uint32_t rgmii_oob_ctrl;
+    uint32_t reserved_0x10[3];
+    uint32_t gphy_ctrl;
+    uint32_t reserved_0x20[24];
+} BCM2838GenetRegsExt;
+
+typedef struct {
+    uint32_t stat;
+    uint32_t set;
+    uint32_t clear;
+    uint32_t mask_status;
+    uint32_t mask_set;
+    uint32_t mask_clear;
+    uint32_t reserved_0x18[10];
+} BCM2838GenetRegsIntrl0;
+
+typedef struct {
+    uint32_t stat;
+    uint32_t set;
+    uint32_t clear;
+    uint32_t mask_status;
+    uint32_t mask_set;
+    uint32_t mask_clear;
+    uint32_t reserved_0x18[10];
+} BCM2838GenetRegsIntrl1;
+
+typedef struct {
+    uint32_t ctrl;
+    uint32_t reserved_0x4[2];
+    uint32_t status;
+    uint32_t reserved_0x10;
+    uint32_t chk_ctrl;
+    uint32_t reserved_0x18[31];
+    uint32_t ovfl_cnt;
+    uint32_t err_cnt;
+    uint32_t energy_ctrl;
+    uint32_t reserved_0xA0[5];
+    uint32_t size_ctrl;
+    uint32_t reserved_0xB8[18];
+} BCM2838GenetRegsRbuf;
+
+typedef struct {
+    uint32_t ctrl;
+    uint32_t reserved_0x4[2];
+    uint32_t bp_mc;
+    uint32_t reserved_0x10;
+    uint32_t energy_ctrl;
+    uint32_t reserved_0x18[58];
+} BCM2838GenetRegsTbuf;
+
+typedef struct {
+    BCM2838GenetRegsSys sys;
+    BCM2838GenetRegsGrBridge gr_bridge;
+    BCM2838GenetRegsExt ext;
+    uint32_t reserved_0x100[64];
+    BCM2838GenetRegsIntrl0 intrl0;
+    BCM2838GenetRegsIntrl1 intrl1;
+    uint32_t reserved_0x280[32];
+    BCM2838GenetRegsRbuf rbuf;
+    uint32_t reserved_0x400[128];
+    BCM2838GenetRegsTbuf tbuf;
+    uint32_t reserved_0x700[64];
 } BCM2838GenetRegs;
 
 struct BCM2838GenetState {
-- 
2.34.1

