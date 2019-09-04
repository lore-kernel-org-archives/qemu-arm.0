Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1146846wrp;
        Wed, 4 Sep 2019 13:09:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw5DwttWumgSZIEPCa3+/p/QoN3/UqdjpXOCyxLKsak22EBAdqgoBvrVng5Uu6j7/U50384
X-Received: by 2002:ac8:468c:: with SMTP id g12mr19496294qto.110.1567627743653;
        Wed, 04 Sep 2019 13:09:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567627743; cv=none;
        d=google.com; s=arc-20160816;
        b=FUsYhknjjo2wSro7qvTjwS/4vzvCikj6frjt3yZYbOUcYZ0P1GsbS1Q+NqrNJh2nl7
         eph1EeQov4yMs6+7LDlOuvuhzEubTjHYqtx2s1Fmp/uWtu8vHAr/INKVpwp7kRL7aFTW
         rFR4qQEo5IOiH3talD9URHvpYtUyOdxoGgNB6seASf93B/r/DUgC6Pv7haR/LqjebWLb
         H8ao2Hp/6pFp+rIHV2CWS8Xx/g3lsjzya7cji9WKmdEDAwx2vbD/Tr3p4QHGsNcscoNW
         r+BZSUJ5SGaVgVvZbR+r0nbcP2qmxm9v26eeMCmqbqAUHBH7/XILItUvs5fb4o3GRhMI
         ARWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=w0yZvSWJxMpGMZQus1AoRlEpuCLgbCFvsCSBHnvLgJY=;
        b=Jkctt4IGLHfR+nrUqZVeDVY+A/POAsp84qPT56ce9pu75k7lo40Wg4wuOAy2CicPup
         Ehv8YSo3kLNCslysC4cRt2gX6yGmF6ePCd8o7DUodhoim2udsziAyd3TeV/4oOw3cAct
         YQNM2ez3uBx0UpISErHY4eHR99dxhdiIpOjSDkDIoMzqodp25BYu3QgyxEScpkI0D19H
         Jxq8ceEynUSbueuEdEY651dxqDnQ9FBvb/SvbL9+zwjFeogLhDDHypaQP9n9SkTBu9cq
         Dwl/WVc8G8hpmkCjN+G9YAoSFxPx7+YI5tPS9RXzMh9DbEGmpFEAhF7FfkL6blRUTjsn
         xByA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oAWMyx+O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b62si41253qkd.94.2019.09.04.13.09.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:09:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oAWMyx+O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5baQ-0003Ht-Fa
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41167)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0t-0005Uq-IJ
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0r-00038a-CZ
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:19 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:36058)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0p-0002ye-4b
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:16 -0400
Received: by mail-pg1-x542.google.com with SMTP id l21so11787257pgm.3
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=w0yZvSWJxMpGMZQus1AoRlEpuCLgbCFvsCSBHnvLgJY=;
 b=oAWMyx+OInAyeHVBRTYQ0211CU9f7YQQu7eHhi0OtBesm6zLBmEq4gf0IAnKFOltPU
 FKqnJxVRtrbo0daKSFCCZxQHxGDhHrvx0UwxrpjDBHWNdI50D9d4+Okda5HrDKAlRBAa
 XCNHiXgJS0RaUzzpBG6aMA4PvDSaUmgY61v0ysv2xMJAP443bsF8l6TmdKYeIGbiIVKh
 BJ487Djgb1nLzYlDBW/Y6mfmewyiEIlU5m7YHGwrB6yAcgOlTqLcVCx/AbOQj4k3kqs7
 vP38dqCyHKO54mAMSc225E7JzZ5IGQlDoCVCYyvU+Svt4po73TMEDYbt0CFoJxXJR1c1
 71Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=w0yZvSWJxMpGMZQus1AoRlEpuCLgbCFvsCSBHnvLgJY=;
 b=B60/ReyAv3+oFhO9yy3cg5vVgVlZNecRYHsM+XOikZfRwBtWMsqXamfU3eKBgWt9cg
 Pi6h0pi6SLQqFawYtWBm0Su8oOmLpD+52rIWdRrspSG1EJCsb36d+r093UECz1gkZPs2
 QIW/ntvHuWmjI2+BYgRMEY5zm1OqX803yEKu7o6NwdEXaz+ivRxoiPHm3ckXu6s86zrD
 4ZEI86Bbow9G+/q4YqN5/vQhFOvRHK1pGTRcJ/EAtk5GWZZ6KDqXproy+Vq6ivN6et+j
 eb47mPqILFkos/MSasBaadCd+ZrbDjH17ht5efmyWIFYeEQOH6vzFOm8vg6PHym0ftpH
 ldIQ==
X-Gm-Message-State: APjAAAWmrzjb8TShgnT6RL7SLq5PjTO3HijOWF3b3GzcPQKcbnD51Nl1
 XYjuwBABtnSX2bXiQ0kYI+HLcTXAidw=
X-Received: by 2002:a63:b346:: with SMTP id x6mr36949199pgt.218.1567625524723; 
 Wed, 04 Sep 2019 12:32:04 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:32:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:40 -0700
Message-Id: <20190904193059.26202-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-arm] [PATCH v4 50/69] target/arm: Convert T16 load/store
 multiple
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
X-TUID: iaRZB3PH+YC/

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 48 ++++++++----------------------------------
 target/arm/t16.decode  |  8 +++++++
 2 files changed, 17 insertions(+), 39 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d8a4c7bf99..f9d4b619fa 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10092,6 +10092,14 @@ static bool trans_LDM_t32(DisasContext *s, arg_ldst_block *a)
     return do_ldm(s, a, 2);
 }
 
+static bool trans_LDM_t16(DisasContext *s, arg_ldst_block *a)
+{
+    /* Writeback is conditional on the base register not being loaded.  */
+    a->w = !(a->list & (1 << a->rn));
+    /* BitCount(list) < 1 is UNPREDICTABLE */
+    return do_ldm(s, a, 1);
+}
+
 /*
  * Branch, branch with link
  */
@@ -10869,6 +10877,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     case 8: /* load/store halfword immediate offset, in decodetree */
     case 9: /* load/store from stack, in decodetree */
     case 10: /* add PC/SP (immediate), in decodetree */
+    case 12: /* load/store multiple, in decodetree */
         goto illegal_op;
 
     case 11:
@@ -11092,45 +11101,6 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         }
         break;
 
-    case 12:
-    {
-        /* load/store multiple */
-        TCGv_i32 loaded_var = NULL;
-        rn = (insn >> 8) & 0x7;
-        addr = load_reg(s, rn);
-        for (i = 0; i < 8; i++) {
-            if (insn & (1 << i)) {
-                if (insn & (1 << 11)) {
-                    /* load */
-                    tmp = tcg_temp_new_i32();
-                    gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
-                    if (i == rn) {
-                        loaded_var = tmp;
-                    } else {
-                        store_reg(s, i, tmp);
-                    }
-                } else {
-                    /* store */
-                    tmp = load_reg(s, i);
-                    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
-                    tcg_temp_free_i32(tmp);
-                }
-                /* advance to the next address */
-                tcg_gen_addi_i32(addr, addr, 4);
-            }
-        }
-        if ((insn & (1 << rn)) == 0) {
-            /* base reg not in list: base register writeback */
-            store_reg(s, rn, addr);
-        } else {
-            /* base reg in list: if load, complete it now */
-            if (insn & (1 << 11)) {
-                store_reg(s, rn, loaded_var);
-            }
-            tcg_temp_free_i32(addr);
-        }
-        break;
-    }
     case 13:
         /* conditional branch or swi */
         cond = (insn >> 8) & 0xf;
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 71b3e8f02e..a7a437f930 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -26,6 +26,7 @@
 &ri              !extern rd imm
 &ldst_rr         !extern p w u rn rt rm shimm shtype
 &ldst_ri         !extern p w u rn rt imm
+&ldst_block      !extern rn i b u w list
 
 # Set S if the instruction is outside of an IT block.
 %s               !function=t16_setflags
@@ -109,3 +110,10 @@ LDR_ri          10011 ... ........              @ldst_spec_i rn=13
 ADR             10100 rd:3 ........             imm=%imm8_0x4
 ADD_rri         10101 rd:3 ........ \
                 &s_rri_rot rn=13 s=0 rot=0 imm=%imm8_0x4  # SP
+
+# Load/store multiple
+
+@ldstm          ..... rn:3 list:8               &ldst_block i=1 b=0 u=0 w=1
+
+STM             11000 ... ........              @ldstm
+LDM_t16         11001 ... ........              @ldstm
-- 
2.17.1

