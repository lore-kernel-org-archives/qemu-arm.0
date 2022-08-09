Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp3308259ejf;
        Tue, 9 Aug 2022 12:01:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR413HWuXvrcRuJIWB/49qFNMKwFB9zlbYz/R6oxwKB79JgvOB0bPQL+GA1bqP+38sepEY3b
X-Received: by 2002:a05:622a:118a:b0:340:52e6:7b57 with SMTP id m10-20020a05622a118a00b0034052e67b57mr21127550qtk.288.1660071718798;
        Tue, 09 Aug 2022 12:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660071718; cv=none;
        d=google.com; s=arc-20160816;
        b=gwGgyekUebTFQ00xm9XUHQh7811RaDJ7U58FHkfw1bFKAx6WbXm1k4vAPYylizvNPh
         wj4Paz6TjnErOO5jd9ehoMDtRBvDPZkHuepDtdqCnQeESnTJOTzLO+KuwIvkXMeS4Mlp
         D5D9cdkM66ekttvD9q5K3Dq9HCdW7Y00lAOby7wsR4UYiuuaCsASy5n0IZdzOQdwpk0G
         R6+9zn7wJI2E58WsYm22t3PuAKt4jiKnZfTGX8dYgLISjpTchyN2XrVc0TLBLpX+8I/y
         R2lWrQuI7NVC1f05BAtThZbgLGhM2gKfslGpSi+4TIvGY/g7GecBZ3BZj0Zdn3fBNwjH
         /Z1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=lCBcGQfi2DTqZV4cE8CDMbnvl55RNr8eUYA3ch0Eeug=;
        b=rLupnYagBVL+fGYjH5YuwoQXiHN53+VzBdQYtGiPonQKW3UIKV9Id4+Jsh9KBTafWE
         tOMGzhzZLWBNoNqjLAFEyCBdnwTz2wh/UUtxttxJ6+BpW83acqfiso6LegeJjpwMYbRX
         1/k77b0F6oEfmvw+w0VB7XEKhpGfm7InTRVWVFDUZ5W9LbhTksR4qSisydd3Tup60Xq1
         0zZZw2GZblGQFIx2QK4k2fGK2gndmKu9tWhEfps2EddfqGg00jfavGt5jRdPcRk41yU7
         GlnbTu/8FBA++YIvY7+yIPc0Yv8XWMRuoD/gy/qGeq6BC8VXoAy+9yFShSBqU2Ep/I3D
         xiEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11-20020a05620a44cb00b006b94a235399si4837482qkp.63.2022.08.09.12.01.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Aug 2022 12:01:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLUUG-0002vF-Qk
	for alex.bennee@linaro.org; Tue, 09 Aug 2022 15:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oLUQ8-0007KS-6d; Tue, 09 Aug 2022 14:57:41 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122]:57418 helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oLUQ6-0003Ac-JV; Tue, 09 Aug 2022 14:57:39 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oLUQ1-0039E5-13;
 Tue, 09 Aug 2022 19:57:33 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH v4 5/6] hw/mips: use qemu_fdt_setprop_strings()
Date: Tue,  9 Aug 2022 19:56:39 +0100
Message-Id: <20220809185639.750345-6-qemu@ben.fluff.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220809185639.750345-1-qemu@ben.fluff.org>
References: <20220809185639.750345-1-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.15.83.122; envelope-from=ben@luna.fluff.org;
 helo=luna
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, KHOP_HELO_FCRDNS=0.187, PDS_RDNS_DYNAMIC_FP=0.001,
 RCVD_IN_SORBS_DUL=0.001, RDNS_DYNAMIC=0.982, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oIDZOe9cAzTQ

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

