Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2428806lfb;
        Tue, 7 Jun 2022 14:33:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8uUkYR2cb8mNjo8BhVvADSLGoVOWAfCc/7HpTlk7xoOFzwVY694PqSZn41eZqcrnSi0bc
X-Received: by 2002:a05:6214:2301:b0:435:38af:2f87 with SMTP id gc1-20020a056214230100b0043538af2f87mr23118280qvb.83.1654637616362;
        Tue, 07 Jun 2022 14:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654637616; cv=none;
        d=google.com; s=arc-20160816;
        b=wFSye1ZOPjZmAqqbhAay86D72xpRqE0KhgXm2eaiBUi8PzphoM70XetGvmMsS5UCsV
         PXiJoBG2FfZI9TVHSn3NzJ2NH6+crpJ+cUdl+U1GOrPQMJ3q1F8nsPQ4M7SqdAVKY8sg
         htC+PHMzScm5Wy1hdDifNanCbYr6YGNGuvGz7IFlMBqNMeXzRZZ7juzhtsgUQwptJuql
         /2NSzNp9tcMlWZH9OFQ/oUbbG+n+POxFyZPucaX2tRViE0HJ9Ttsu8xPeQZIzGTtoZit
         Zg5+jbqDOsaw/jJbdozKlRRKJ4hSe954kGU3G4i89Ac9/rA8Kk7gPZcyWL19QTI2i7Dv
         EQ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=I30aLppER5tQQ7h0Mg89eOPMXEx89vDljlXptRvoUBA=;
        b=wyuwsKVxHK4Tw12z+giEDgebwTFAt6YAWHskDGr80GJUDhGNYormHLlJSzHMbI8XoT
         nHF8C6meeUtKUsTAWo+GOmnuoTdgpBvjoE1hGa22tDkDsTE9US9KV5NBcXrLFTQmIG9g
         sU9to+pg5geZPTJgRxIVnuxWNv2A6UAYPapb8f1BGwUx/50wj4s7pNF76UAbHC0V/4zL
         /mAe0TdgSdQDmSGhZooGutGMZ6NGkJOPt3M/Njfy5vrhRZ9S02PY8d3mmEinH26VzxxK
         +ZQBW1/LGlHRLamll/Tq/j786qw8PSwSRLejvtqcWfpvMCWm+ak2skHw9CEBK/EhfwXW
         3T3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EgRD1GvA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020a05620a06c900b006a57339a6a6si9252428qky.595.2022.06.07.14.33.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:33:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EgRD1GvA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygpT-0002YQ-RX
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwh-0006ZR-2M
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:36:59 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwb-0008FN-I6
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:36:58 -0400
Received: by mail-pl1-x62c.google.com with SMTP id h1so15783115plf.11
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I30aLppER5tQQ7h0Mg89eOPMXEx89vDljlXptRvoUBA=;
 b=EgRD1GvARjzSsF/ibUsYkZu/godbzrorx3g2Fh0Ox9xwnri/mqzc7EmcEDpFdKt4Yv
 UcWh6JzAw/QLN06o6aeQmH3dkmAP3E45aBHuPenBIGtrkcUQeMILHH1259XcU/esYojq
 MTn/Cn9vWLESW5unQTNszLgpUgDeEalBRvfp9jvX/kslsGt/Axt8Lu33PlwYssqwkf8R
 CXJ3cfAR3Wyijb6EO7KBBKYTstVvmIQTbKbgyT0RjnHNltRlO1wp77vLgmYo/8L48sqh
 K1rugkmtlCC+ES2oIlIB71vQ7sKRi0mgLLpZj0awSQHJJtbG7zaDKInLbN5OO0sSPisO
 TKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I30aLppER5tQQ7h0Mg89eOPMXEx89vDljlXptRvoUBA=;
 b=5UB/l0EOmO2S6s2dXiXWADhYleX381n3MshUkzJ2+73D+TUt/PCtVe5S9hStWlERtj
 yM623CLl3ZjjmCvM9cYWs3v2fkqUSedamE2Ki+Ih2deGsgiT9c+AjgGwkJ4yjG88vm3p
 WsvvDKhHc2RP11Ga1GGW8GKPdbVyKRo0BynRIRvv+PcqKMhQkFqWpqqOzmjW4GX24TMG
 8fH2ld66ShsXZ6v7/vspvAyUDlVkQtLUooQ7WeIxfeINyCsLOEc9XaXMX+uREsUjBybt
 BH1V+isGl1MsHSMMOR2RJvXSZkpPXaxQl+WFQwfix6Vm134NfsJe6lUU9QWgCjUAH1ng
 ZMRA==
X-Gm-Message-State: AOAM530YN3wI8McmjdckVo2w1dFYVRyNhVZwCXVRpcM08dHlLenAVKk2
 6Gm8rBrPY+Zo1dfeBSqMOFK8M4/1bQCBpw==
X-Received: by 2002:a17:903:22ca:b0:163:e2b6:e10b with SMTP id
 y10-20020a17090322ca00b00163e2b6e10bmr31645695plg.28.1654634212249; 
 Tue, 07 Jun 2022 13:36:52 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:36:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 48/71] target/arm: Implement SME LDR, STR
Date: Tue,  7 Jun 2022 13:32:43 -0700
Message-Id: <20220607203306.657998-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 8Tng4yvu8njj

We can reuse the SVE functions for LDR and STR, passing in the
base of the ZA vector and a zero offset.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sme.c | 23 +++++++++++++++++++++++
 target/arm/sme.decode      |  7 +++++++
 2 files changed, 30 insertions(+)

diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 978af74d1d..c3e544d69c 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -220,3 +220,26 @@ static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
     tcg_temp_free_i64(addr);
     return true;
 }
+
+typedef void GenLdStR(DisasContext *, TCGv_ptr, int, int, int, int);
+
+static bool do_ldst_r(DisasContext *s, arg_ldstr *a, GenLdStR *fn)
+{
+    int imm = a->imm;
+    TCGv_ptr base;
+
+    if (!sme_za_enabled_check(s)) {
+        return true;
+    }
+
+    /* ZA[n] equates to ZA0H.B[n]. */
+    base = get_tile_rowcol(s, MO_8, a->rv, imm, false);
+
+    fn(s, base, 0, s->svl, a->rn, imm * s->svl);
+
+    tcg_temp_free_ptr(base);
+    return true;
+}
+
+TRANS_FEAT(LDR, aa64_sme, do_ldst_r, a, gen_sve_ldr)
+TRANS_FEAT(STR, aa64_sme, do_ldst_r, a, gen_sve_str)
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index 900e3f2a07..f1ebd857a5 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -46,3 +46,10 @@ LDST1           1110000 0 esz:2 st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
                 &ldst rs=%mova_rs
 LDST1           1110000 111     st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
                 &ldst esz=4 rs=%mova_rs
+
+&ldstr          rv rn imm
+@ldstr          ....... ... . ...... .. ... rn:5 . imm:4 \
+                &ldstr rv=%mova_rs
+
+LDR             1110000 100 0 000000 .. 000 ..... 0 ....        @ldstr
+STR             1110000 100 1 000000 .. 000 ..... 0 ....        @ldstr
-- 
2.34.1

