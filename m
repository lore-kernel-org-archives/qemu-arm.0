Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5554807lfc;
        Mon, 15 Feb 2021 03:57:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYwAoN74vjuJ/3a3VCsSoiLko08bUMMrW3vAHZ56DBYEuDvKBPMQXfJz6Qa9JF3lZbs024
X-Received: by 2002:a25:ca88:: with SMTP id a130mr7388459ybg.414.1613390234322;
        Mon, 15 Feb 2021 03:57:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613390234; cv=none;
        d=google.com; s=arc-20160816;
        b=EGts8afXikeP48pbwrAsyR7fImt5Ana6EPGHK2L+sPCJZne4NUMyvX2OWmRESTqVwl
         gFbdZmBZDHFfKeBltdpZ7mzH+020VKG1dJHJCAal5PaTYstSrNZofhS5yUEYypqmt0N+
         d1cFH6H9BbTDnuGywohV0SDUS5wfUnR69u9++HvMILuYTv2q4TaIHfvppTIExhsAqqcq
         e4/upTu1eCCNHlWbf9rC9vFANqR6o4br/G+lUcZgYj7zBe2gR6ZIGeQmmES8/QlJr7v1
         wA8RzJmuPZHltn25xihSHk2wZLvAG/BV6ZqMvVyozUGGZJgZKj4+94e/XX5jWREPifEd
         wItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gQ23dryhYlpvJQf3jI2/hncVTbnfMBWe8fcCzHmxYJw=;
        b=JsinIrm+V+w6YphlqJNnohkPa2tZ9VCOMYre536x6/GbFDtsZ94R+I4EkIr7YWeceh
         z6dWGn/f4P6TFbbMO/i4x3JGqVaR72KUVhIudxnB4ZGFOPF9661bKGxoTy2DxCHnDanI
         h1SCYboszTWWVOJB8lporU1++LIRcfFds7w7DWJgalFKTaLd/2fU+KeeCCAHQgFE/hP7
         I3qm3kO5rzr0bbVbx7q4kigwr+dWv4VNURHvaQHd8L6/ERyqCsJ+BTYa7MKS3vVJdgRP
         huwrJb1IiwUj2BseoicHr+Lm6E7Yaya56PSl69rGorn1YxtnYtAiIxl3eC8URAfl9tPh
         2CZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mylxvaoU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si11046376ybo.438.2021.02.15.03.57.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 03:57:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mylxvaoU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBcV7-0006oU-O2
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 06:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQJ-00074P-Fi
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:52:15 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQH-0003tp-D8
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:52:15 -0500
Received: by mail-wm1-x335.google.com with SMTP id r5so2726929wmp.1
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 03:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gQ23dryhYlpvJQf3jI2/hncVTbnfMBWe8fcCzHmxYJw=;
 b=mylxvaoUVxgcyeE5u9vPxsFK32UYRzO7GKA9+a60vV3G2kaxC2ZvM4d5W/3np3s6KY
 CYPRLceB5+gtEItUj8M8f6/ema3TARi1A0VHZ7WLOsaC/Buxhd8gl+e9IXZUoAD54rCE
 rVu0CCPAZJBti+sFeaQMcpKOXB8s5lKOkfpP2VpbNwj9c1PbkW7GrF+e5k6b7dFveQPV
 RhBbI1RzYvB7tew5LnCE88cmTVJPseDzms/Oj7dSwVxn1qCToS8w3aMCyFx0gUh6sjAG
 tvkb+ZOf4+9rdrJkZ1ddUtC3KgIVjTo9vpT3ggv20OWKuWj0w4jYFsWmzV3RE4eUWIVH
 a/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gQ23dryhYlpvJQf3jI2/hncVTbnfMBWe8fcCzHmxYJw=;
 b=evSxa6A5dq5KGBALTALucWiuqOhrlUdq7I873I/T8eTZkpubIfkHU4mOqkS4ApdtbO
 AT50f3YF6VqFNWbV4KeLgwubSxJuvS6eAcwjq4v7IljGh/OVYl8oaGrwRT+Aplrw5dXU
 V/tfNmTDyC1/evvH7SpWVWlRdlJf0o8rRRH5x6GnMCNLJ0ydXEaSYFWzPA2qTViVk+m8
 Xx7lfO7mKKXn+NNS3Izpepglj5QPU725rKpN1ilFh4njInhJ4E4ZInxMgha8sfvd/y6U
 bZUhc0hS4BamA2Nt50NAdGRU320YH3VANsvTDbfKnfbMQZaHJEE6CN5Qc3yVWzWD5s0N
 YWJw==
X-Gm-Message-State: AOAM5334WTrrQXPqQXKtkAQ05pkZgbvNxPldEpgtFIl+smwCMSM6dI/l
 OkP4dUS+MVfoyh/xRWN3zjmXtW3soZD50w==
X-Received: by 2002:a1c:4ca:: with SMTP id 193mr13925166wme.178.1613389932082; 
 Mon, 15 Feb 2021 03:52:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 06/24] hw/misc/mps2-fpgaio: Support SWITCH register
Date: Mon, 15 Feb 2021 11:51:20 +0000
Message-Id: <20210215115138.20465-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0LEzh6m225ta

MPS3 boards have an extra SWITCH register in the FPGAIO block which
reports the value of some switches.  Implement this, governed by a
property the board code can use to specify whether whether it exists.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/mps2-fpgaio.h |  1 +
 hw/misc/mps2-fpgaio.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
index bfe73134e78..0d3c8eef56c 100644
--- a/include/hw/misc/mps2-fpgaio.h
+++ b/include/hw/misc/mps2-fpgaio.h
@@ -38,6 +38,7 @@ struct MPS2FPGAIO {
     MemoryRegion iomem;
     LEDState *led[MPS2FPGAIO_MAX_LEDS];
     uint32_t num_leds;
+    bool has_switches;
 
     uint32_t led0;
     uint32_t prescale;
diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index b28a1be22cc..acbd0be9f4b 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -35,6 +35,7 @@ REG32(CLK100HZ, 0x14)
 REG32(COUNTER, 0x18)
 REG32(PRESCALE, 0x1c)
 REG32(PSCNTR, 0x20)
+REG32(SWITCH, 0x28)
 REG32(MISC, 0x4c)
 
 static uint32_t counter_from_tickoff(int64_t now, int64_t tick_offset, int frq)
@@ -156,7 +157,15 @@ static uint64_t mps2_fpgaio_read(void *opaque, hwaddr offset, unsigned size)
         resync_counter(s);
         r = s->pscntr;
         break;
+    case A_SWITCH:
+        if (!s->has_switches) {
+            goto bad_offset;
+        }
+        /* User-togglable board switches. We don't model that, so report 0. */
+        r = 0;
+        break;
     default:
+    bad_offset:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "MPS2 FPGAIO read: bad offset %x\n", (int) offset);
         r = 0;
@@ -318,6 +327,7 @@ static Property mps2_fpgaio_properties[] = {
     DEFINE_PROP_UINT32("prescale-clk", MPS2FPGAIO, prescale_clk, 20000000),
     /* Number of LEDs controlled by LED0 register */
     DEFINE_PROP_UINT32("num-leds", MPS2FPGAIO, num_leds, 2),
+    DEFINE_PROP_BOOL("has-switches", MPS2FPGAIO, has_switches, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.20.1

