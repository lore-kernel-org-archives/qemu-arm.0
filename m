Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp366147lfu;
        Tue, 26 Apr 2022 09:47:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxAxNG8vqMmq9HM7T8cEyXdtPaBWHGhiaU9BkUjmbyJrQYgS0s9sVep71y1EqKNCMv1MhJ
X-Received: by 2002:a25:ab33:0:b0:648:4c23:c4b2 with SMTP id u48-20020a25ab33000000b006484c23c4b2mr11853242ybi.403.1650991620274;
        Tue, 26 Apr 2022 09:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650991620; cv=none;
        d=google.com; s=arc-20160816;
        b=If/wjUP9wMeYBTDlsvM0r+HRwWJhbN2T1wzZ894LIQkUAeLgIFh/ItwIHlI/qkUYyu
         xCIzbJsbfnaBYiH4mVEC4VFunfneyzONCTnKKzF7MV0oPEXpteghhJWCC0uPj2m9n9zN
         EsD+8uD4wnyoR60lNkL4tuX6LB5i0QLp29iOTM6MANqWwVgJcE4sfKIsVVNj12DgH24h
         HRornAvBcC6CKbXkNUUL91shZQCX6fE7t0i3sx7YY2DktILpc85s91ssIga9msABBW5b
         sgbEKE9yh+v7rNNBactpZVlf3SRTBrndFKhl9vlKKbhrkh0R9RnSPQSkwaCCCTptoLKB
         sLlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RL/cU2KUkEBT0HxlomYcXgHotXYUZUNOdsb4bQKVOHY=;
        b=pLfbJwRZPRt8Cst2D/VnVMThRmCToDJkDAw2MyIcZa1v2iqA4041swYhLvMoRirRDH
         VC8J0Ns3zjkISZ85Rdy8Ik+LmJqfeeDuZqx9ocbKFtQdDDpY1NNT4zdZ9q0cLZepRdPp
         UK0YBiRDpzIsflEsmU8Cc/RacOort/UmjIR5XxWz9oAQhBykgMOYCZuJrgcLgBLcRaUx
         gd3bA+ZrbpwWKt4ojJJF76wfCDxr/po++xx1OWwqjdunKzD1JRmw1WnhQweIr/6dwzv9
         qt315Cb0lGauKWUjveRxFhYRKajIDi8LCc9DpasFmssP8COr4/3tZKNvQYiGbV6ShoRw
         kyAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J7CfEZwA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6-20020a816206000000b002e5bb9dcb05si14946095ywb.398.2022.04.26.09.47.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:47:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J7CfEZwA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOL5-0003pv-MI
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5z-00038S-I8
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:27 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:47072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5t-0003us-LW
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:19 -0400
Received: by mail-pl1-x632.google.com with SMTP id u7so15374705plg.13
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RL/cU2KUkEBT0HxlomYcXgHotXYUZUNOdsb4bQKVOHY=;
 b=J7CfEZwAfA1qRCxGxFPfcN1NZtL9btEfZ2Lnu1hHgQwVtF0GZ7r3nifDPBTDaghS6E
 6BDAEwpuhkFuHvAYpohxLWirUwlRf9HdEulHacnbhz8LEtm0BuZvwZFJgPjga2d50N3R
 cp1SDJU4NvdqZ/YytvYXW1G7ExqF3e0dsHrH4bQ6c0VSrs9n84V1keajMvCZnSmPvYqv
 I8gD1V8SiFQ7tXqY8K1NaWZOnAfHCwM1XEB81tt8yMOcW/rv1hGDDSqQFXchWrE7BRTw
 0buXLuFTrcqprYtKS5i58N/Z/NxdoPm2kmpkHyILautjCPQ2EQtRJBj3gVPnvlWLedtF
 otaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RL/cU2KUkEBT0HxlomYcXgHotXYUZUNOdsb4bQKVOHY=;
 b=lkZqUyQZIa9ESEYpcyuQUnpYej9aluUDVLI4Fgm4tjh/MgcBGoi0DuuvNE+jTQV/Kk
 +w5zfGBxAx7jV3Qcd3X/y4URCMdfzCTZEiihE1nxdLWQcaJxm5FBxtQe2ih0HQg6P7XM
 MkVouUMFS52Oq9+ASuJ2MNYm5Mac1VtEYQ9b7j+AzQs6aD328uW2vAfHFqa56CMPwtuL
 JGGB4jngALDs2h27MpgtNXj54lIUCwV6v8ZDtR3no2cYuZYGXb3XyBY4msasAJWMXzQA
 i23oRNhIa21W6SeTGOlSMA3AY5qCT9TGNZzDwgInw55DT0aKuzcN3gjG2q4gytxih4Lu
 t50g==
X-Gm-Message-State: AOAM532jADq+GS8Mjj0QEF2CAzSss+cSAUbsEtwQd/bzBClY5pYrGTeV
 SlqmQHyESwbYoUCh/1zMxGKrYl/uRqjk5g==
X-Received: by 2002:a17:90a:e008:b0:1d9:2f9a:b7f1 with SMTP id
 u8-20020a17090ae00800b001d92f9ab7f1mr20018882pjy.173.1650990675787; 
 Tue, 26 Apr 2022 09:31:15 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 33/47] target/arm: Use tcg_constant in CLRM, DLS, WLS, LE
Date: Tue, 26 Apr 2022 09:30:29 -0700
Message-Id: <20220426163043.100432-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QORkT02F6FYu

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index e0469da0a1..0e9fde2589 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8257,7 +8257,7 @@ static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
 
     s->eci_handled = true;
 
-    zero = tcg_const_i32(0);
+    zero = tcg_constant_i32(0);
     for (i = 0; i < 15; i++) {
         if (extract32(a->list, i, 1)) {
             /* Clear R[i] */
@@ -8269,11 +8269,8 @@ static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
          * Clear APSR (by calling the MSR helper with the same argument
          * as for "MSR APSR_nzcvqg, Rn": mask = 0b1100, SYSM=0)
          */
-        TCGv_i32 maskreg = tcg_const_i32(0xc << 8);
-        gen_helper_v7m_msr(cpu_env, maskreg, zero);
-        tcg_temp_free_i32(maskreg);
+        gen_helper_v7m_msr(cpu_env, tcg_constant_i32(0xc00), zero);
     }
-    tcg_temp_free_i32(zero);
     clear_eci_state(s);
     return true;
 }
@@ -8416,8 +8413,7 @@ static bool trans_DLS(DisasContext *s, arg_DLS *a)
     store_reg(s, 14, tmp);
     if (a->size != 4) {
         /* DLSTP: set FPSCR.LTPSIZE */
-        tmp = tcg_const_i32(a->size);
-        store_cpu_field(tmp, v7m.ltpsize);
+        store_cpu_field(tcg_constant_i32(a->size), v7m.ltpsize);
         s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
     }
     return true;
@@ -8482,8 +8478,7 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
          */
         bool ok = vfp_access_check(s);
         assert(ok);
-        tmp = tcg_const_i32(a->size);
-        store_cpu_field(tmp, v7m.ltpsize);
+        store_cpu_field(tcg_constant_i32(a->size), v7m.ltpsize);
         /*
          * LTPSIZE updated, but MVE_NO_PRED will always be the same thing (0)
          * when we take this upcoming exit from this TB, so gen_jmp_tb() is OK.
@@ -8609,8 +8604,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
     gen_set_label(loopend);
     if (a->tp) {
         /* Exits from tail-pred loops must reset LTPSIZE to 4 */
-        tmp = tcg_const_i32(4);
-        store_cpu_field(tmp, v7m.ltpsize);
+        store_cpu_field(tcg_constant_i32(4), v7m.ltpsize);
     }
     /* End TB, continuing to following insn */
     gen_jmp_tb(s, s->base.pc_next, 1);
-- 
2.34.1

