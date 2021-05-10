Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3258559lfg;
        Mon, 10 May 2021 12:09:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy36I3LtJc/w4Q6htMauWU38zwpwmphbIP6z0+YrdTP/c4limOdnAT+NWP+4Cy2owQhPuXR
X-Received: by 2002:a92:3203:: with SMTP id z3mr22228284ile.22.1620673773765;
        Mon, 10 May 2021 12:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620673773; cv=none;
        d=google.com; s=arc-20160816;
        b=JDm7Dquwr6sBZKgWBi/W20FKoyzfDfoXvtXZntB4n/5HR90Le1dsJl4TnIZ0ZIeTEd
         z1P0cw1fWvX4C9F4R1+EcyviHSZTWb3pOybTf3sOdkImbSUCSYvFkLLARaUW6bNmvSTP
         t8LGishyXkar5/tXxYg1xu3Wa1mkQzP0vOaYSPIN+xcei+mkeuGMBGZ2R7LQPQM2A0Ct
         d0E6REab26YTNGCbmBGdELT71HO22B3bxHKrrRVOvoBn7bm3t4VH9bKsUDHbQJUTeBOM
         a6lnA7aWFCcZ3vG4GECZd2MWWLLcw9wFyQ/TpUuZBpnjzAN98F++g9B82GWMLwIPp+fx
         8jNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0bAVgHwIjQtf8To6Si8JBYpO2wJiNylkQh5/jVI8Anc=;
        b=GPz8/y9oU0Y1ZGeL06c5UY6PQxHdhdoiQpgsc+CKSLbIBaQYSQxCYHyIPqoN7WRlAX
         nJHnklEuB+Y9EROwWkATO9/oIKAZrj9F/YCYcPI/n9prs1Iu5Ui/wgsvXPiF6aBB47ji
         JAAjHds+jGIKixZbkQPl+YNmwss+bEki7Kq8IIBR7PEgKoL4qzSI6GdMwdKnQsMOvTeJ
         AqYcjVVqUSVVZTL1V9ri+ptCVpG9PQc3shpfBnKrRE3ryH+AfG8yfBAA9yOQ5v2aTNGf
         0qBJVs0XnWcUYMuz+fk5NR7m1vy1D90XV/u07nsOt8vnIve9NI4ek6dKr+K+L5hfk6QL
         L4gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JP94KqFZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f21si16412862ioo.37.2021.05.10.12.09.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 May 2021 12:09:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JP94KqFZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgBHZ-0000fs-2z
	for alex.bennee@linaro.org; Mon, 10 May 2021 15:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBGx-0000Zc-45
 for qemu-arm@nongnu.org; Mon, 10 May 2021 15:08:55 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBGt-0004wr-BH
 for qemu-arm@nongnu.org; Mon, 10 May 2021 15:08:54 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 b11-20020a7bc24b0000b0290148da0694ffso11769574wmj.2
 for <qemu-arm@nongnu.org>; Mon, 10 May 2021 12:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0bAVgHwIjQtf8To6Si8JBYpO2wJiNylkQh5/jVI8Anc=;
 b=JP94KqFZS2ZSh87HU84b44SChHlEVfTxmFuy3QgBdfNvx6v/kCcK7BJJP0d6Yltc/8
 u/y5SjbN8L01LvHNyg83zqK7q5Zn9sKVi6GTaTH/eD7N18HJcgplOpCD/r04Y/F/nYv/
 +STKgoreCzEkHNmbZzgto8R9HaHf9dYDefp0EybeDc2zcMGCU6J+z3GHCGUMOiPE8HxU
 BzxB3flVPROC4roV5YLrsM/uDns7jYAh9eUqhWMcxejLyvvBPWs+rSC8vQEsywTm3kZw
 taOGUeO9/hWyAJyWpa++joZThfei6ajnlEtdYlyRVtAqlQ8kl1PCBDJ2lRgXkiCH5YTo
 /BaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0bAVgHwIjQtf8To6Si8JBYpO2wJiNylkQh5/jVI8Anc=;
 b=XxTL9USxLfNyZO5onBAcGqWZZo5ZqsiS0ZondIroCoYvEov2Oah21yYXM96mo9uFsi
 riO0UH+hMOaX7kuIgOFQM74ftnlasvoImktjpwmqI+vDEBABdCyAW3L325lDf7d7zjyz
 LhvLT6NGnaE72Q+4GV4zYtQpmVP0iyj9Jvnkgytme66rfooQyEvTlAfamRffZYfWz1Wp
 dlneA2w7PWI4lDYVdS/WmTfnIevLRY0Lu1FGZ/drKnlzw11rEnvN/LBd4yum+frNWH+/
 WY8oLV52r9UiszBrg5Qstl+AknsnOy5TFHE6RJb71NOpYXpkzcLkrSXBacMMtSk2m/SG
 brCQ==
X-Gm-Message-State: AOAM533LSWowsFx09Mh+xTVffXhNkCY4dhAXAL3Vdf+JVITVaYrj+Rd4
 6Pgpi+O2DWmGWlcuyIi1tcS5klumLG1QgQ==
X-Received: by 2002:a1c:e446:: with SMTP id b67mr685801wmh.117.1620673729749; 
 Mon, 10 May 2021 12:08:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t23sm463892wmj.31.2021.05.10.12.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 12:08:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/6] hw/arm/mps2-tz: Make SRAM_ADDR_WIDTH board-specific
Date: Mon, 10 May 2021 20:08:40 +0100
Message-Id: <20210510190844.17799-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510190844.17799-1-peter.maydell@linaro.org>
References: <20210510190844.17799-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>,
 Devaraj Ranganna <devaraj.ranganna@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f9MCq2lC72jx

The AN547 sets the SRAM_ADDR_WIDTH for the SSE-300 to 21;
since this is not the default value for the SSE-300, model this
in mps2-tz.c as a per-board value.

Reported-by: Devaraj Ranganna <devaraj.ranganna@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 77ff83acb06..f2595b1c7f7 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -123,6 +123,7 @@ struct MPS2TZMachineClass {
     int numirq; /* Number of external interrupts */
     int uart_overflow_irq; /* number of the combined UART overflow IRQ */
     uint32_t init_svtor; /* init-svtor setting for SSE */
+    uint32_t sram_addr_width; /* SRAM_ADDR_WIDTH setting for SSE */
     const RAMInfo *raminfo;
     const char *armsse_type;
 };
@@ -806,6 +807,7 @@ static void mps2tz_common_init(MachineState *machine)
                              OBJECT(system_memory), &error_abort);
     qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", mmc->numirq);
     qdev_prop_set_uint32(iotkitdev, "init-svtor", mmc->init_svtor);
+    qdev_prop_set_uint32(iotkitdev, "SRAM_ADDR_WIDTH", mmc->sram_addr_width);
     qdev_connect_clock_in(iotkitdev, "MAINCLK", mms->sysclk);
     qdev_connect_clock_in(iotkitdev, "S32KCLK", mms->s32kclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
@@ -1263,6 +1265,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->numirq = 92;
     mmc->uart_overflow_irq = 47;
     mmc->init_svtor = 0x10000000;
+    mmc->sram_addr_width = 15;
     mmc->raminfo = an505_raminfo;
     mmc->armsse_type = TYPE_IOTKIT;
     mps2tz_set_default_ram_info(mmc);
@@ -1290,6 +1293,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->numirq = 92;
     mmc->uart_overflow_irq = 47;
     mmc->init_svtor = 0x10000000;
+    mmc->sram_addr_width = 15;
     mmc->raminfo = an505_raminfo; /* AN521 is the same as AN505 here */
     mmc->armsse_type = TYPE_SSE200;
     mps2tz_set_default_ram_info(mmc);
@@ -1317,6 +1321,7 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
     mmc->numirq = 95;
     mmc->uart_overflow_irq = 47;
     mmc->init_svtor = 0x10000000;
+    mmc->sram_addr_width = 15;
     mmc->raminfo = an524_raminfo;
     mmc->armsse_type = TYPE_SSE200;
     mps2tz_set_default_ram_info(mmc);
@@ -1349,6 +1354,7 @@ static void mps3tz_an547_class_init(ObjectClass *oc, void *data)
     mmc->numirq = 96;
     mmc->uart_overflow_irq = 48;
     mmc->init_svtor = 0x00000000;
+    mmc->sram_addr_width = 21;
     mmc->raminfo = an547_raminfo;
     mmc->armsse_type = TYPE_SSE300;
     mps2tz_set_default_ram_info(mmc);
-- 
2.20.1

