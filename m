Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp578058lfg;
        Wed, 27 Jul 2022 15:40:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sny3zIkJGwCYV/iQTwPjBR1MABt746YmMn77jpu7CC6N1qOYzxHaw6ebQYfla9NLzuwA5c
X-Received: by 2002:ae9:e113:0:b0:6b5:cdd9:68cd with SMTP id g19-20020ae9e113000000b006b5cdd968cdmr18181254qkm.671.1658961653805;
        Wed, 27 Jul 2022 15:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658961653; cv=none;
        d=google.com; s=arc-20160816;
        b=m4YVdU0Afz4b3/a/zCQ2YL9m8fJ/HkAnHzxG6iW6M7R3DH2eVo9gDaKrWQxpH+zR1A
         YOfYNhLel6dfzMaA2SZM5Wo1KnP1rYHt0KDdKqjjOB8aMVdeMyHfHVKqC5leYb/AeoXg
         XIiV5+9HZ3IG7L43v0fgzQ3QuzvlMjSAOjq54LAJlhzYODIIEu4ujwLCtOK6+1HEwtem
         V1zJZAy54ymPLmJK9PCVda6YxL5UMGGLMJHMiDUVvvXHRR+Hm09UTRMVukVRJCXfHbIW
         J3h+kJAKbyWouqDme0XhOPO7ki1bPTXLD87Vs53s3uzBi2B+k27SCHEiv+izdQizBwY9
         GIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=q6xhnQCKv+mYbrM0sNCdIKA7Rp5XoZblhcZu1vrnCV8=;
        b=d96DtD0OX3TmuvKIMW4utCG4wpg9De+Cls8I98NHrkf66fCzvGAhrcp28dFxbploW8
         Be4WlG/RGceG/xy4lv/8v8ebIm61od0Ex8LL5pu4jrgyhYtHUVGw3Rx15CQgNf0hpnVb
         ydkXXx7j/hp6or7Mm9BRST4bYKRV0XwN8zLk5iq95gHSslmlxY6Z+VfriIkA1vxDMVnQ
         DJK4dAV7hz/ag7681/G2yQujyfTv7XeS4umyahowYW+tKVB9iZzfghORzOfAcp5uZTAg
         eYPWMDKa1QafcMaOUoSLwzf2ZlA0uIeRa0SNwTJH21lKR2mxwZVPgahCR5MuaBGr8kl4
         kIRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fn4-20020ad45d64000000b004738fd6fa4bsi13807719qvb.87.2022.07.27.15.40.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jul 2022 15:40:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oGpi1-0005oI-4z
	for alex.bennee@linaro.org; Wed, 27 Jul 2022 18:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oGpgU-0003gv-CQ; Wed, 27 Jul 2022 18:39:18 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122]:52720 helo=luna)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1oGpgR-0007uh-Jb; Wed, 27 Jul 2022 18:39:18 -0400
Received: from ben by luna with local (Exim 4.96)
 (envelope-from <ben@luna.fluff.org>) id 1oGpgI-002cR2-0Y;
 Wed, 27 Jul 2022 23:39:06 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-arm@nongnu.org, Ben Dooks <qemu@ben.fluff.org>
Subject: [PATCH v3 4/5] hw/mips: use qemu_fdt_setprop_strings()
Date: Wed, 27 Jul 2022 23:39:04 +0100
Message-Id: <20220727223905.624285-5-qemu@ben.fluff.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220727223905.624285-1-qemu@ben.fluff.org>
References: <20220727223905.624285-1-qemu@ben.fluff.org>
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
X-TUID: IdS7/ZSccRSF

Change to using qemu_fdt_setprop_strings() helper in hw/mips.

Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
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

