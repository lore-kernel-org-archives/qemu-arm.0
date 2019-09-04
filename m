Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1151872wrp;
        Wed, 4 Sep 2019 13:14:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzWEMemVFqb/iVeg6xI06uxhLkiCk6R/KviDefSDNcs8lS4/hdHp8xY6q0ahxESr9sRv17H
X-Received: by 2002:a17:906:ce56:: with SMTP id se22mr29628373ejb.72.1567628071508;
        Wed, 04 Sep 2019 13:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567628071; cv=none;
        d=google.com; s=arc-20160816;
        b=Zbx14H/mbbOoW6DYVTQ+S4ZsJt6DFTxqjkRuN7CRT/6jDrpAJr3HMOz45+Ml6RyFEB
         /Jh0mlsh2dPUHs+esd99QCypweu4a5KIXb8Hn+GHYIhyVsDlvmrSa7ZbgURgnXBptPoJ
         tmC+bMaQ5ltR6Qg9YWxxDt1j9Um2bhJXruhOkelP0FLh89ByUyhN2Oewl4lh/NmHdaTk
         4YAwltGXNJP+VSX5NNp2cVaOe8SjY88pEdIUGdAmReca1irWJfN+qdBm2J6mm7cDYJth
         yjsQLz8LH7g6UvQukKH2Czicl7n+PFkOihjLaEjAv4k/QtnXfsQRy76+STVLaGHCj/Gb
         p6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=mvEFFgpnrevoU+lFhaPzzFj5g1KNJYV0Nc7dBdlUE/w=;
        b=C0Pt3phtk4uSQZGi25CqgszHZcoFFwgJ8fhspUF0I9alUNK9XwAQgCDWmxJn7v09ti
         IS0EiHBcUVhYcYymTtIPo2MRhH/xInOvcHrsRUffdeGG+moeluPTC1w5ruzRz8ooUsSV
         wXdvlx4gb9fNBEyyBtEAW2ucDKRIE6IPFsz3HlkB6njGmPnUBJDMs0UcL/iemIoegafN
         dzQlO/lpiUGchOJeDjjGfY4if2DSg5Jk5RlOiVCkto0TRPOYShU7pfPIaHTot6fRXd7L
         LsV2wDjnY7TvVBAZeSsUGS501p4ia+zkbzdjkdb2pk65Du7xO0lx//0znF6Bm6dtiuu+
         IAhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ptVHTZ5p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e24si18209edq.167.2019.09.04.13.14.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:14:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ptVHTZ5p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bfh-0000Xt-R6
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41059)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0p-0005QF-8O
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0n-00034X-6T
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:15 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45032)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0l-0002xE-Ru
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:13 -0400
Received: by mail-pl1-x636.google.com with SMTP id k1so2686189pls.11
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mvEFFgpnrevoU+lFhaPzzFj5g1KNJYV0Nc7dBdlUE/w=;
 b=ptVHTZ5pCK4x2SKJbJUky/7nYPfFcEFhzxz/9NLAUKkyY2bo+dJml+ycY3W/9hDVLp
 BC1ElBZzE8A+2o3b/o3rR1O+kWNKeStrpPDyB4XPv5x7RV6LcmHz3AjEuwABU4K0rP1F
 sxvBFp0ELizYO4TdIOr7crjzXymYMb7EiJiC/wB5pUEMuU0lOvU4MtJeQ4vnqPr+tlTI
 luJs4DDy/umrZVPa/3o5P4B2OOvmwPXECTq0x/Gc4bXvOChniIfV6brkTeAXm3R2MHcb
 Pn9JcddA1bdJUkBbEjWXjNGmOUfZtFr4HcxgIBUcPAcsoHhW++T/q8ybaNloLUrnj//r
 tmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mvEFFgpnrevoU+lFhaPzzFj5g1KNJYV0Nc7dBdlUE/w=;
 b=TIc6MCky7B3gsNz6kG3l3MQgc7FqcduCVD/MByXATPKWqrocOPgRIVnXNPysJpqhgi
 pRa5ABjkv/kd9oPDq93/4dl2udBRZsd5tu72pnSEN55OhpE1iHKydQhzZK+DeFMur+3a
 +Y4KGH2nb/qIkPKvXiz85QVQ9Y7ko+/XhlaTh9ut1/ZsazL+Qxhh64nE3rFZT5YUWTTt
 lxxsGsTaGHSas3iEYow4Ypsd/TXn7gX0ffL6DB1g/RX3HOM2NI1dnTeA2UIvmI05FUCA
 6+JdyUd6ZjVylp/X7erAq+KfXBZ3NlVC7T5GcdfyG1oaVhxTpT+6LSzm1vsN0FUzGb0g
 vGoA==
X-Gm-Message-State: APjAAAU1eYQ8nf/XD/cu2gvGXRDVyIAOuTKpnOPd/GbYZLVjvpVdG8bL
 pDexL/rFEmP4e7YAWem8abemUw==
X-Received: by 2002:a17:902:36a:: with SMTP id 97mr4447000pld.75.1567625523206; 
 Wed, 04 Sep 2019 12:32:03 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:32:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:39 -0700
Message-Id: <20190904193059.26202-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::636
Subject: [Qemu-arm] [PATCH v4 49/69] target/arm: Convert T16 add pc/sp
 (immediate)
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wi+L0D4I377p

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 12 +-----------
 target/arm/t16.decode  |  7 +++++++
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4ae73d1c92..d8a4c7bf99 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10868,19 +10868,9 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     case 7: /* load/store byte immediate offset, in decodetree */
     case 8: /* load/store halfword immediate offset, in decodetree */
     case 9: /* load/store from stack, in decodetree */
+    case 10: /* add PC/SP (immediate), in decodetree */
         goto illegal_op;
 
-    case 10:
-        /*
-         * 0b1010_xxxx_xxxx_xxxx
-         *  - Add PC/SP (immediate)
-         */
-        rd = (insn >> 8) & 7;
-        val = (insn & 0xff) * 4;
-        tmp = add_reg_for_lit(s, insn & (1 << 11) ? 13 : 15, val);
-        store_reg(s, rd, tmp);
-        break;
-
     case 11:
         /* misc */
         op = (insn >> 8) & 0xf;
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 1cf79789ac..71b3e8f02e 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -23,6 +23,7 @@
 &s_rrr_shr       !extern s rn rd rm rs shty
 &s_rri_rot       !extern s rn rd imm rot
 &s_rrrr          !extern s rd rn rm ra
+&ri              !extern rd imm
 &ldst_rr         !extern p w u rn rt rm shimm shtype
 &ldst_ri         !extern p w u rn rt imm
 
@@ -102,3 +103,9 @@ LDRH_ri         10001 ..... ... ...             @ldst_ri_2
 
 STR_ri          10010 ... ........              @ldst_spec_i rn=13
 LDR_ri          10011 ... ........              @ldst_spec_i rn=13
+
+# Add PC/SP (immediate)
+
+ADR             10100 rd:3 ........             imm=%imm8_0x4
+ADD_rri         10101 rd:3 ........ \
+                &s_rri_rot rn=13 s=0 rot=0 imm=%imm8_0x4  # SP
-- 
2.17.1

