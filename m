Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5370713lfg;
        Wed, 3 Mar 2021 05:54:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqxnmA+xxR9dQYLPDmrPShUzsVUkPJ60mQ/lamNPStdnEaHu5Big6PQKQBX7iNdbch1kw2
X-Received: by 2002:a9d:ef3:: with SMTP id 106mr3328015otj.24.1614779662576;
        Wed, 03 Mar 2021 05:54:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614779662; cv=none;
        d=google.com; s=arc-20160816;
        b=Md8fzy+GDm3tDq5Yus5PsNWiTYZbTa8HsBhrAv/t1q158l/ubBQYXPKYhh3/kuM6To
         SrQVyfr1yQDPdLQrAlxD+OxNz5PnFi4fMRGQ2GuG9sznGsXmLMgFCd0yNFtbFWdiLeX6
         PnPNUjheJnOCwnhD2XhISwjC14Fco9m6yorDKaCzISl2yTx8JpNCse17exvvjS62TgXr
         7w76rDOZVgOUnfp7M85Y4VLwssBeZkUeXeGm0bKpueXI3EI+6J02wfamRChCzlOc+Jm+
         eDCSG3SZfgY+ofcDwL7aQzZFSr8e5rhUJB+gcdImVwtBB3vePyHGqCmoR6KbtqdEWK87
         SE/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QdPd6+T9TYulDYan4MqsgMWZ2nXNjoGfebenRUzAWpA=;
        b=xqAEHzpairUwDj5FS1f2IyB88GuDMjgEBxGxnBmQvq7TK24rB1mNLFyg65o1jDtrMr
         GEdE4ZL1L/BujoxBG6k1CWgy5oEVerLNca7LesmJ/fy/+7gEBHCGWhYKk9IXXjRCOiCQ
         f6lNQJyH8E/L6zK9vs3TO4n9ex7irEUOFQ7lHMmKsHK4ya26e95GpuVdk1gfygKLxBkq
         dPQo0gtpY7GqjFYuXr5fOKSd2PIA7Q5ffu/PV38b54BRl4rxLrTH44ffelCDwZ0HHOuA
         TboyNYbbIU1cGNBbzveUrjieqx5fCKWNdIZ2iMzyGjjP9WV1M3vfQohrGlAkC5gp98bX
         i9/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cmMk2DzV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d28si20872350otk.45.2021.03.03.05.54.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 05:54:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cmMk2DzV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHRxF-0005NC-R3
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 08:54:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHRwO-0005Kx-KQ; Wed, 03 Mar 2021 08:53:28 -0500
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:37320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHRwN-0002B8-3n; Wed, 03 Mar 2021 08:53:28 -0500
Received: by mail-qv1-xf2b.google.com with SMTP id n4so9373699qvl.4;
 Wed, 03 Mar 2021 05:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QdPd6+T9TYulDYan4MqsgMWZ2nXNjoGfebenRUzAWpA=;
 b=cmMk2DzVL05NQGTnFI27wpv8wj2V8yOnPQMsZ15mwEtaNlLi+KW20LgNLjiGMZscuO
 RBcZjyEk6eMwo99Y+94uUoIaES/Fq0WruRlApc7vbFG0dfsdiQfjaTIRYfnnvSjEJlZJ
 qZZ5OCbBWuRnD9hzVHllj/Vq1xKUF6zGXnN/Zl1KF13mNdVFLMYda7KfTNIWACwNbXLV
 v8QEjPgd17RRZHJhdvSKwjGAwOWjVURiOwWSQ4Qij9VxHVm34bLQGOOuvj1+f5sPundy
 4vs14xMqpfcsxXFb/nmP6aKRxj3K50iFcknFe4DfB0Ndun/SsmBKTZOwrenT4Miq1JJL
 6EFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QdPd6+T9TYulDYan4MqsgMWZ2nXNjoGfebenRUzAWpA=;
 b=GkFWS664wvGo7z8CyKteoxoEyKi2RFmZiHbQakId/avt14OzMr3QZ6rnjobuR7nUAG
 3zzT78mCFMKfiKcxJdFsA3lz7hOu7CMHr5NbB4rQrCtK9Qj/jep0DDIyvZBEQxIo/ESl
 +gWT47iZs3B9hbs7q9zm4Dw5PJs6WCgR4kT5Ja54A5jxXKfZv2O69KzufYKEPhPvCEBx
 oNA0ruWuT2uLauBTZu2xNL9xP3uC+bfqUN9kFOyg9P2OSih61Z3rmUjU+KhsPfMbXRzR
 VyQae9TFzvF10pnZohN9gElfVB9Gn1pNWjmMuI7U52+Q7LX/SjUhFC+rbkyrceurbVWW
 SRLA==
X-Gm-Message-State: AOAM533nR0j48CQod8Vq3d2ku4Dhx9cHuwWWM5T5ybRz3epjzulmaw3K
 poUJEv++dXjgCLu5LhAfj9c=
X-Received: by 2002:a05:6214:5af:: with SMTP id
 by15mr2695342qvb.37.1614779605846; 
 Wed, 03 Mar 2021 05:53:25 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id x187sm17425500qkd.83.2021.03.03.05.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:53:25 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 2/5] hw/arm: xlnx-zynqmp: Clean up coding convention issues
Date: Wed,  3 Mar 2021 21:52:51 +0800
Message-Id: <20210303135254.3970-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303135254.3970-1-bmeng.cn@gmail.com>
References: <20210303135254.3970-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2b.google.com
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
 qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WPjtpMG44l+7

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

There are some coding convention warnings in xlnx-zynqmp.c and
xlnx-zynqmp.h, as reported by:

  $ ./scripts/checkpatch.pl include/hw/arm/xlnx-zynqmp.h
  $ ./scripts/checkpatch.pl hw/arm/xlnx-zynqmp.c

Let's clean them up.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

---

(no changes since v4)

Changes in v4:
- remove one change that is not a checkpatch warning

 include/hw/arm/xlnx-zynqmp.h | 3 ++-
 hw/arm/xlnx-zynqmp.c         | 9 ++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 6f45387a17..be15cc8814 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -60,7 +60,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 
 #define XLNX_ZYNQMP_GIC_REGIONS 6
 
-/* ZynqMP maps the ARM GIC regions (GICC, GICD ...) at consecutive 64k offsets
+/*
+ * ZynqMP maps the ARM GIC regions (GICC, GICD ...) at consecutive 64k offsets
  * and under-decodes the 64k region. This mirrors the 4k regions to every 4k
  * aligned address in the 64k region. To implement each GIC region needs a
  * number of memory region aliases.
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 881847255b..49465a2794 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -301,11 +301,13 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     ram_size = memory_region_size(s->ddr_ram);
 
-    /* Create the DDR Memory Regions. User friendly checks should happen at
+    /*
+     * Create the DDR Memory Regions. User friendly checks should happen at
      * the board level
      */
     if (ram_size > XLNX_ZYNQMP_MAX_LOW_RAM_SIZE) {
-        /* The RAM size is above the maximum available for the low DDR.
+        /*
+         * The RAM size is above the maximum available for the low DDR.
          * Create the high DDR memory region as well.
          */
         assert(ram_size <= XLNX_ZYNQMP_MAX_RAM_SIZE);
@@ -526,7 +528,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         SysBusDevice *sbd = SYS_BUS_DEVICE(&s->sdhci[i]);
         Object *sdhci = OBJECT(&s->sdhci[i]);
 
-        /* Compatible with:
+        /*
+         * Compatible with:
          * - SD Host Controller Specification Version 3.00
          * - SDIO Specification Version 3.0
          * - eMMC Specification Version 4.51
-- 
2.25.1

