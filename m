Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp882149ejn;
        Thu, 20 Oct 2022 23:05:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM45cBktRYzlfVKsE/YjZGsLwJPQJGonh9mKGtJPXzDledJR1Tp3zLejuvMuPtEcH2nZ+Bh7
X-Received: by 2002:a05:620a:1b96:b0:6ee:830d:9a04 with SMTP id dv22-20020a05620a1b9600b006ee830d9a04mr12293470qkb.48.1666332349648;
        Thu, 20 Oct 2022 23:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666332349; cv=none;
        d=google.com; s=arc-20160816;
        b=yby0inuXblSmf3Ja5vTMiou3klQV3aDOV2vFwU9+69BgDrfrItJxKUukD3FxFg/SA3
         8UrgVoMXo7MQdMCrNcQ2aMjBrphosHgZPcIR6S8v6yxul4ITAH6mOFCEEIFAcME8jqPO
         ZCGkt1X1Sg/UTZOrdNa2HI8scTWmXI3xq259czY9r3nDMJ5kPd760lRbCfdeHRrlkO/f
         oU+snx1H0Dk5I/V03RWlOO0HFwaOzYyr7MB4vgazoSFLePmmOXOQW5w4YXt/8GkjfATz
         XBnpBUPnfGSKeQRW1x7ckVYeyF3n/jm68H1aYFJSa/Vfw6GMiVoR1b8/G6FbSis7Q4Jr
         vMZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=lCBcGQfi2DTqZV4cE8CDMbnvl55RNr8eUYA3ch0Eeug=;
        b=gaYKQWmakr88kiw/rct5VxIRx93UgyV5t8ZnjuKLh0tRH77Ttg/QTvnpe53fdWiHZM
         91VH7oKprTJgNFGhMiN7mK/DzeZKPH/clOv2ZvBCMA6+r0zlhjTJF8EWNJR3YXb8jNc3
         07V+Nar2XZzDiQJZCoVZcu2BHW5nZ8QPTqynDTbpejTEOMXAeChpLQs9RJXlBRFabrJZ
         5CPErHKUn2NLrfBQKvf7a8TJG4notptn6+A/xaBPwpUc97FwrdzLMNGX1pY34i9ohXHa
         gfN6m5cqbvARWk3BYZvB/ylbLgjbwTEHYO543wafsWibRSifylFmnjZ/VuBXdFeSACRu
         uQEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a28-20020a05620a439c00b006ef1a8de757si1015749qkp.91.2022.10.20.23.05.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 23:05:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ollAC-0004Lg-7F
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 02:05:48 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oll2y-00013c-EL
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 01:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oll2w-00011h-2V; Fri, 21 Oct 2022 01:58:18 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oll2u-00074P-4C; Fri, 21 Oct 2022 01:58:17 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oll2n-001R0a-2i;
 Fri, 21 Oct 2022 06:58:09 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, alistair@alistair23.me, peter.maydell@linaro.org,
 qemu-riscv@nongnu.org, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH v5 5/6] hw/mips: use qemu_fdt_setprop_strings()
Date: Fri, 21 Oct 2022 06:58:07 +0100
Message-Id: <20221021055808.342055-6-qemu@ben.fluff.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221021055808.342055-1-qemu@ben.fluff.org>
References: <20221021055808.342055-1-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.15.83.122; envelope-from=ben@luna.fluff.org;
 helo=luna
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, KHOP_HELO_FCRDNS=0.4, PDS_RDNS_DYNAMIC_FP=0.01,
 RCVD_IN_SORBS_DUL=0.001, RDNS_DYNAMIC=0.982,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: klKrmX3c+Qnm

Change to using qemu_fdt_setprop_strings() helper in hw/mips.

Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/mips/boston.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index d2ab9da1a0..759f6daafe 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -515,9 +515,6 @@ static const void *create_fdt(BostonState *s,
     MachineState *mc = s->mach;
     uint32_t platreg_ph, gic_ph, clk_ph;
     char *name, *gic_name, *platreg_name, *stdout_name;
-    static const char * const syscon_compat[2] = {
-        "img,boston-platform-regs", "syscon"
-    };
 
     fdt = create_device_tree(dt_size);
     if (!fdt) {
@@ -608,9 +605,8 @@ static const void *create_fdt(BostonState *s,
     platreg_name = g_strdup_printf("/soc/system-controller@%" HWADDR_PRIx,
                                    memmap[BOSTON_PLATREG].base);
     qemu_fdt_add_subnode(fdt, platreg_name);
-    qemu_fdt_setprop_string_array(fdt, platreg_name, "compatible",
-                                 (char **)&syscon_compat,
-                                 ARRAY_SIZE(syscon_compat));
+    qemu_fdt_setprop_strings(fdt, platreg_name, "compatible",
+                             "img,boston-platform-regs", "syscon");
     qemu_fdt_setprop_cells(fdt, platreg_name, "reg",
                            memmap[BOSTON_PLATREG].base,
                            memmap[BOSTON_PLATREG].size);
-- 
2.35.1

