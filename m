Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3138330lfy;
        Mon, 27 Jul 2020 12:35:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjSvzpWQPM8x5tBO7Atp1W8Vae74cO+ZEg9Xs5i/gQgbdW8wsa08LY1ASAXIJiSLCfdos/
X-Received: by 2002:a25:6d08:: with SMTP id i8mr33584397ybc.6.1595878516759;
        Mon, 27 Jul 2020 12:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595878516; cv=none;
        d=google.com; s=arc-20160816;
        b=HHkbGJvW4XQDFhioBrgkjcGPNqISqIxTvVCIEAnQSSHu2MDOiEIWSzeonNeteR7fJV
         EyMFP2Zlcn609DP2m7Zc/7eZCxaGmlnic9NAbN+wFZy/Q25uOuybV/QvOc4Fa2Wr0p2a
         p1LTTEcQxby4+h8Ag1CtLuBvtsQcO+Mqrhi2GEA2TMdq1sK9NtFQtfSsY6LjMSp0Lirg
         TWcvyWQL5FZma2SdxLXcPDXAjp/YeAja9oz0nee0oijEXymq98AbDh+Jtxs85tdUWMeR
         mmuFUCAR+beR9mBLlsgS5U6wmCGHLK/gCNYtwHQF9oB+Jx5/RoZ4a52N/eE/FNrNGD+/
         czOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=NE3BHoZcVo5rUaArzOLXnKqyeyPe9cLG2NZvnHPubpg=;
        b=gtoZd87h9eDAn4HpYvGKqQ2wZmpwllRfcjRm07GkZSeW6U8SlzFHnL7jy5rSpyYFr/
         rJ4heZYQiaJRSbqlYz+94RpmObbnDUsVqwHvvEKJ6EtFaLQel+nP9VXFXjlBxa6shsdQ
         XCqifDkA6mXv9vAGrSsl96aRAfQ7t6h3/jekor3xi5VN8siywN3wHLEAskSrGc20AXfw
         7CtNFjc5YWusr+RzBh4qVRmsFd/rd21iG/klg1TiQwBIZ2iKefGUH5/ip4dbe47IE0ps
         ZriyXm3Xoeb9VtLSXjnE+Lp/lJPqxRcpr+xG1jBsavvmdG7Thezfbf9ZFwd9CdN0dBp7
         EqkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zAlJbFq1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q132si5394045ybg.21.2020.07.27.12.35.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jul 2020 12:35:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zAlJbFq1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k08u4-0007Kx-3n
	for alex.bennee@linaro.org; Mon, 27 Jul 2020 15:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k08tt-0007IE-HT
 for qemu-arm@nongnu.org; Mon, 27 Jul 2020 15:35:05 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:39185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k08tr-0002fz-CX
 for qemu-arm@nongnu.org; Mon, 27 Jul 2020 15:35:05 -0400
Received: by mail-wm1-x342.google.com with SMTP id t142so9525461wmt.4
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2020 12:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NE3BHoZcVo5rUaArzOLXnKqyeyPe9cLG2NZvnHPubpg=;
 b=zAlJbFq1ISIbewRaV9wsUZv89IstyJ0SLvWEn3/zVTko8JK3eoRdv2sl5JwXPNqfUP
 KH7Qqjfsn0eIgvPz7bSWZI5ab+xpXqqIRAHTAyIu7x+Kg6+lOf/uSOa24jF766/zxxHq
 OrMsBETtG/sEYT+ykW2jfShJ6PQHlghcb+NAQEcNjf7d4C+ySyp0jq5mRWqQV02wapBQ
 Yxq94HBkvoTdQuvJZA/CGhO8+PxrhT19kiky6z3jNQ1uR2Y/IjU6P0bBqjG8aimcOkcD
 CcCgjp6NAhgkyqKHVXC40LcxMEPfp95y1Xk1MhbI8tf8Xn6pDqOwGtpG/7yHugi5+2VI
 inbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NE3BHoZcVo5rUaArzOLXnKqyeyPe9cLG2NZvnHPubpg=;
 b=uP8W4ABbE9x60zrLtYjVeGsUqIEIrXpFOiqRbvI7HpNvcDGr94jar/m7BdWL5pEAee
 yUdLcGmJXoCwu9ZTgsTXWUFr7kJoPgyyUo54kyMGLJ3sOC6cxJB6clVLCj2U1E3X6yba
 uEOfE55p+EutSEKVh6mbP84VQw7GpRkGRSvwTqWZehgw+RY7C5SsjZxVUx0anfZQmAEB
 Lx5Sfa8oFI7JUM+ykbQELEk+IpTRnr1F78obRzIf54tn36KSw+EB6f3ENVOtYfyBlhnD
 sTkYE5sERfVf7nBZMyl9IXPhw+uub3tKjYGbOnmjkTvqdhgpbSsewkaR4CjI1xKbUJV6
 tgjg==
X-Gm-Message-State: AOAM533em3t/0Ar+8e9FBh/jxDKoqfJ7KRSvGvNZUi0aU8eqOgsGW4ue
 17cKGdh8kXg6uxdlm3a2Zwd2cFXLi33qqA==
X-Received: by 2002:a1c:de85:: with SMTP id v127mr739995wmg.156.1595878501555; 
 Mon, 27 Jul 2020 12:35:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g7sm13860319wrv.82.2020.07.27.12.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 12:34:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1] hw/arm/nrf51_soc: Set system_clock_scale
Date: Mon, 27 Jul 2020 20:34:58 +0100
Message-Id: <20200727193458.31250-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AmboGunFroWL

The nrf51 SoC model wasn't setting the system_clock_scale
global.which meant that if guest code used the systick timer in "use
the processor clock" mode it would hang because time never advances.

Set the global to match the documented CPU clock speed for this SoC.

This SoC in fact doesn't have a SysTick timer (which is the only thing
currently that cares about the system_clock_scale), because it's
a configurable option in the Cortex-M0. However our Cortex-M0 and
thus our nrf51 and our micro:bit board do provide a SysTick, so
we ought to provide a functional one rather than a broken one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Tested with 'make check'/'make check-acceptance' only.

 hw/arm/nrf51_soc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 45e6cc97d70..e15981e019f 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -32,6 +32,9 @@
 
 #define BASE_TO_IRQ(base) ((base >> 12) & 0x1F)
 
+/* HCLK (the main CPU clock) on this SoC is always 16MHz */
+#define HCLK_FRQ 16000000
+
 static uint64_t clock_read(void *opaque, hwaddr addr, unsigned int size)
 {
     qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u]\n",
@@ -65,6 +68,8 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
         return;
     }
 
+    system_clock_scale = NANOSECONDS_PER_SECOND / HCLK_FRQ;
+
     object_property_set_link(OBJECT(&s->cpu), "memory", OBJECT(&s->container),
                              &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->cpu), errp)) {
-- 
2.20.1

