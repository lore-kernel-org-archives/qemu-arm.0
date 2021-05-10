Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3259798lfg;
        Mon, 10 May 2021 12:11:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfr+XJYrGgqLAQcFOM//HHRq1IYknO60yU9dub2tdFWG2P/oF8VQdgUznWPoF9hnMDZobW
X-Received: by 2002:a92:c8d0:: with SMTP id c16mr24060874ilq.238.1620673878852;
        Mon, 10 May 2021 12:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620673878; cv=none;
        d=google.com; s=arc-20160816;
        b=pHicUDkq7euB3ln61dWjTVVcOMP2VYYDfoRrIOZquB6GiqvxtY0ElzaIOvNPXU1SQ9
         8ilt7V7H7m7ggAdDC9bC7oGjTNPVn7dkwL2J4WX/A2wMyFSQY+LrcWcjGMV/t0YAfCI3
         CDmt6VFLmEqoejqIGfhTBlbILMOMW4MXpOc1wyCz8fjv1Kejzwf8hUMzfVJNZRHDiK1f
         5yfqW6SiZ0xYZZoq5s/VnBvADL1IO4pEQIHT6aqqi43/5tDPOl5d3L1RrW6z1cDA4td/
         FF8sHdJ3WC8CQXhRWIOkoidm6USn2sVZ9+W8bbQ5cWLhH9OcY/5XVSr6eJLZoRrhIeke
         QLcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ad4UlI6darwKHtTKEKCPbY9frkKNCFD/9SwZN13PKXc=;
        b=n4hor/jqGjvqHNs6lDSNqGi5bLBT4wP8gBcdMY3GpTVHbBT1qnYAfZh0Hg/ocQlHos
         4livjYPr2n3z2qCOgBCkBWf1Yh2wkpMuh/xg0VM/HH5NqkiWnmr7tjPiMyvbKrgcE4hb
         fPh8pnu9qxB6LeeTZyOmKRxRJrJtWwoCjEDX4O2dtbJvGj5Gisj5oW3kMCx6bmxlgBmu
         WKefw+d4dFOjaZ5lwPscJ9IwAt2+sfmu40BRO2tXWE+VIDbx38vJmXKA3AEHnHlm4mvR
         pAfo6ByPQyn3Afc5hJs8RAjWqIwvgvlvZ2ueQy3DAgcc0dlRtPkCxrgbrBLj6PFJsjLM
         pbNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UQfG965V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13si10766014ion.63.2021.05.10.12.11.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 May 2021 12:11:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UQfG965V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgBJG-0001mt-6m
	for alex.bennee@linaro.org; Mon, 10 May 2021 15:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBH7-0000fO-LE
 for qemu-arm@nongnu.org; Mon, 10 May 2021 15:09:07 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBGv-0004y1-ER
 for qemu-arm@nongnu.org; Mon, 10 May 2021 15:09:05 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so11764129wmy.5
 for <qemu-arm@nongnu.org>; Mon, 10 May 2021 12:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ad4UlI6darwKHtTKEKCPbY9frkKNCFD/9SwZN13PKXc=;
 b=UQfG965VU2/ih32N0Wwv0MVMC2YJgfxd9CKIriZdDOez7q7mETfhAAIU2IRI2MroFS
 6zUZTpG4BymLJ4Ef8UyfsYG6eaanKyfCkmca/9SS6//+LawfTMGEUwl6r1wkqt4IkHgb
 tU+yrhN9hZX8pwtlPOADecm/rh/gfLXAy6VZt7wQFwo9L47Gv4xSqu2f3h6shZjrucAt
 dR3Fz7FtPONc6OHwdiu0REJY/0vTWofXOC1JUeZn7dnOFFKDk7BbuTYTGDe0p0DIyIEF
 9aeedij3WJ1MRVyOoBe1As+WT2TB7yX4s475UU+u7xxcOSBBpAkpIu0tlEhyH0NblOWU
 E3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ad4UlI6darwKHtTKEKCPbY9frkKNCFD/9SwZN13PKXc=;
 b=cEHBJqs7wPM0INzBMtPMualTaDwBOmuI9RvMCMuC0RCrH3nAs5T18wpqQ812yE+/Br
 3Cp92C0R3OBXZPHEmLLw6s1+D3tRPIfbGtjfP823dtx/bTp4NpKzFEOjpDMh+MiICmys
 10ZmngoSECPZi6zRGpSBRY/aLsikXXv58Y97h5f5HB8AVV3Bh2ECkrh6LUx4R0y2I1Fp
 7ytxp9hM5/7/k2GAlBpQs53OpANSZNj5Iv1u7WA/lNWwv+WhMaBeyPDYfuo45sghAyKh
 6TTMq/SXKiZTMiDO8WVQMfXyzC4YbPrHAaem72UGrhV19JZItctcPsP10C2z7pek022p
 iMYA==
X-Gm-Message-State: AOAM533llymcSgU+uy08aEuLh0a6MFUbo2vrqWoo/+htLYMI8miFU+TZ
 QjgDwaHEuxDN8FNmRH7wJggjjGSfm/3C5g==
X-Received: by 2002:a05:600c:4ba3:: with SMTP id
 e35mr765025wmp.16.1620673730998; 
 Mon, 10 May 2021 12:08:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t23sm463892wmj.31.2021.05.10.12.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 12:08:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/6] hw/arm/armsse.c: Correct modelling of SSE-300 internal
 SRAMs
Date: Mon, 10 May 2021 20:08:41 +0100
Message-Id: <20210510190844.17799-4-peter.maydell@linaro.org>
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
X-TUID: itYVwUm9MmXj

The SSE-300 was not correctly modelling its internal SRAMs:
 * the SRAM address width default is 18
 * the SRAM is mapped at 0x2100_0000, not 0x2000_0000 like
   the SSE-200 and IoTKit

The default address width is no longer guest-visible since
our only SSE-300 board sets it explicitly to a non-default
value, but following the hardware's default will help for
any future boards we need to model.

Reported-by: Devaraj Ranganna <devaraj.ranganna@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armsse.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 2e5d0679e7b..1729f09c7cb 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -59,6 +59,7 @@ struct ARMSSEInfo {
     const char *cpu_type;
     uint32_t sse_version;
     int sram_banks;
+    uint32_t sram_bank_base;
     int num_cpus;
     uint32_t sys_version;
     uint32_t iidr;
@@ -102,7 +103,7 @@ static Property sse300_properties[] = {
     DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
-    DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
+    DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 18),
     DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
     DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], true),
     DEFINE_PROP_BOOL("CPU0_DSP", ARMSSE, cpu_dsp[0], true),
@@ -504,6 +505,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .sse_version = ARMSSE_IOTKIT,
         .cpu_type = ARM_CPU_TYPE_NAME("cortex-m33"),
         .sram_banks = 1,
+        .sram_bank_base = 0x20000000,
         .num_cpus = 1,
         .sys_version = 0x41743,
         .iidr = 0,
@@ -523,6 +525,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .sse_version = ARMSSE_SSE200,
         .cpu_type = ARM_CPU_TYPE_NAME("cortex-m33"),
         .sram_banks = 4,
+        .sram_bank_base = 0x20000000,
         .num_cpus = 2,
         .sys_version = 0x22041743,
         .iidr = 0,
@@ -542,6 +545,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .sse_version = ARMSSE_SSE300,
         .cpu_type = ARM_CPU_TYPE_NAME("cortex-m55"),
         .sram_banks = 2,
+        .sram_bank_base = 0x21000000,
         .num_cpus = 1,
         .sys_version = 0x7e00043b,
         .iidr = 0x74a0043b,
@@ -1161,7 +1165,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         /* Map the upstream end of the MPC into the right place... */
         sbd_mpc = SYS_BUS_DEVICE(&s->mpc[i]);
         memory_region_add_subregion(&s->container,
-                                    0x20000000 + i * sram_bank_size,
+                                    info->sram_bank_base + i * sram_bank_size,
                                     sysbus_mmio_get_region(sbd_mpc, 1));
         /* ...and its register interface */
         memory_region_add_subregion(&s->container, 0x50083000 + i * 0x1000,
-- 
2.20.1

