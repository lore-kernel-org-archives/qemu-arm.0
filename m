Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1232123ejb;
        Fri, 2 Jun 2023 08:53:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7D/wTl8XRsOANjVWQ87WqNHpEHztd/EYpJMt5u+E7Elt0Ek0mC0qebOhJtme9Xu6sBX6MD
X-Received: by 2002:ac8:5856:0:b0:3f5:37eb:1fba with SMTP id h22-20020ac85856000000b003f537eb1fbamr15755228qth.23.1685721207827;
        Fri, 02 Jun 2023 08:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685721207; cv=none;
        d=google.com; s=arc-20160816;
        b=H8o5dGCanvuUe8eea97c0PfIo/W2x+OOktt8BbS6ML60n0cqwumlIH26+IfseTTK2f
         zwjsPXaO9Hp/EG50qsVnO5vHhqhCK1U2ng449M39uDt0OBNsdMyx1xPqMBn+EpQGZIGY
         6r5FNU3DyXUfzZva9OHn72Q3aHXj7vMbFTT7GqohPBqikObh5Yo0RT96UlqdcBmu0RLr
         Fz8DfnjIfvapUTL4J/DbqbCNkvIRT8+z+FYAgYnibaz7bgLClqzZ8hVrADL3V0S6KyiU
         Z92/1E7TbHpliWwGixPnLP35jJSlVMJPe6ITPNTs7i21DsfyOD9BJ3K2gb9xyUnIo6Ug
         WS0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1lZFx3mv+TDguBUy5+nAam7QazsVWb+5FMKek+p8BwM=;
        b=FFe1j9GdHhQvHIFhrP1Vw9E9B9dSIb0tImUjWiiCq68pOig77JKgO2PnnHVNDK39y0
         RKGDpeUXytXX0WBzYJAFWFHEgrp5zkB5ZVsZKFcsGTcXTh25sVfu8P+eHWZZhEB5yUAd
         tAkHPMHfiWuQ4bDEEVgi0oJdTfkubnpV1bcEIKT76huT4KsPLQCBUuvFfZBB2W3K3Q2R
         DgxIEe1F5xQ7gofCGkP5crayZlPaEHuI7bxfniKlt2iGogrtBJByudDmRKpIXIQrzmGK
         qho3+xaR0WpLE0X9rK5JHDpuZRZyfIvh+gsEKX/vpGrI3QG6aUar/6LKLSFxZPWu5wH9
         lj1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HKksRs2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v15-20020a05622a130f00b003f6c202b015si992384qtk.743.2023.06.02.08.53.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 08:53:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HKksRs2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q574t-0003BF-TM; Fri, 02 Jun 2023 11:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q574r-00038a-IT
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 11:52:33 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q574o-0003Rj-2K
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 11:52:33 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f6cbdf16d2so20522935e9.2
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 08:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685721148; x=1688313148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1lZFx3mv+TDguBUy5+nAam7QazsVWb+5FMKek+p8BwM=;
 b=HKksRs2+K5XhTjkizZ7CxpVHC9T5D/ma3U3Z9u+3VN7GTlSrU+3oO2iGHqboaQB3Q9
 RM/18tgSDen88Y914VA4ZPxS/GQV/5AJcZHbBV6PWe6AUy7UFeRjBPkL4/CTeaxN2WoO
 4X79yAWj2g/cVaatrGxvIc+Oo1b9Eg1mU8xmoZWjC1ooV041mLDl4Fdtj2NfHGsNid1G
 eCZov2jhfRuasjFvQQlefmO4ubFM79NQXvzKe0K9FeC65dG1P6HOQG9p2GHXpxwvP9Ho
 yS6gyXN8tE4o3Iqelft1B7zlAWI/xBDPnjc0pd1no0dMHpdc9SdbIFUo5jm9A4GzoetV
 RN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685721148; x=1688313148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1lZFx3mv+TDguBUy5+nAam7QazsVWb+5FMKek+p8BwM=;
 b=mCyql85Z24hmn6f+EIXY9yx8El3y/mvEb3VrUpkJYMoJWxxalL2wie3NXtyou7OodP
 H3gyQhU52uSrEQ69uD/kbTakhWtHNOYpP2IohHUdsy94ve3N+LF7BZV+KDo1LnJ/OhzE
 sjYzLl5Fkd7HXlYuHGqjfooqQFVIkS75A8McXGdeSfwz7co42HyowlOt/FMhSEOMKn8J
 OYJCR/AMCgXe86yon3aeGJOQ+PO+C5xkUBEsY8hxzFgqeoa4SDXEh639fFTXybmR+p3g
 5v8tzvIf6I66TpO1NVTxklz0r+2WvV9qDcc6nzLsubGzPCiXZR/XxpPhYeveZFwNgrcr
 +z/w==
X-Gm-Message-State: AC+VfDxDQeKssfn31Cep8AcDS0uJgYwuPH9ii2hj3Mn3cswRHdvreUVQ
 j1pUypxPmS5TFmG02d06OsSOTwzeXYCnpIg/d+Y=
X-Received: by 2002:a05:600c:2303:b0:3f6:f152:1183 with SMTP id
 3-20020a05600c230300b003f6f1521183mr2336763wmo.37.1685721148597; 
 Fri, 02 Jun 2023 08:52:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c214700b003f72a15301csm594952wml.2.2023.06.02.08.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 08:52:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/20] target/arm: Convert MSR (immediate) to decodetree
Date: Fri,  2 Jun 2023 16:52:08 +0100
Message-Id: <20230602155223.2040685-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602155223.2040685-1-peter.maydell@linaro.org>
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zJhce9Y8D65j

Convert the MSR (immediate) insn to decodetree. Our implementation
has basically no commonality between the different destinations,
so we decode the destination register in a64.decode.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      |  13 ++
 target/arm/tcg/translate-a64.c | 251 ++++++++++++++++-----------------
 2 files changed, 136 insertions(+), 128 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 26a0b44cea9..a645dac8d26 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -194,3 +194,16 @@ SB              1101 0101 0000 0011 0011 0000 111 11111
 CFINV           1101 0101 0000 0 000 0100 0000 000 11111
 XAFLAG          1101 0101 0000 0 000 0100 0000 001 11111
 AXFLAG          1101 0101 0000 0 000 0100 0000 010 11111
+
+# These are architecturally all "MSR (immediate)"; we decode the destination
+# register too because there is no commonality in our implementation.
+@msr_i          .... .... .... . ... .... imm:4 ... .....
+MSR_i_UAO       1101 0101 0000 0 000 0100 .... 011 11111 @msr_i
+MSR_i_PAN       1101 0101 0000 0 000 0100 .... 100 11111 @msr_i
+MSR_i_SPSEL     1101 0101 0000 0 000 0100 .... 101 11111 @msr_i
+MSR_i_SBSS      1101 0101 0000 0 011 0100 .... 001 11111 @msr_i
+MSR_i_DIT       1101 0101 0000 0 011 0100 .... 010 11111 @msr_i
+MSR_i_TCO       1101 0101 0000 0 011 0100 .... 100 11111 @msr_i
+MSR_i_DAIFSET   1101 0101 0000 0 011 0100 .... 110 11111 @msr_i
+MSR_i_DAIFCLEAR 1101 0101 0000 0 011 0100 .... 111 11111 @msr_i
+MSR_i_SVCR      1101 0101 0000 0 011 0100 0 mask:2 imm:1 011 11111
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 33bebe594d1..bdc1ee18cdc 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1875,124 +1875,130 @@ static bool trans_AXFLAG(DisasContext *s, arg_AXFLAG *a)
     return true;
 }
 
-/* MSR (immediate) - move immediate to processor state field */
-static void handle_msr_i(DisasContext *s, uint32_t insn,
-                         unsigned int op1, unsigned int op2, unsigned int crm)
+static bool trans_MSR_i_UAO(DisasContext *s, arg_i *a)
 {
-    int op = op1 << 3 | op2;
-
-    /* End the TB by default, chaining is ok.  */
-    s->base.is_jmp = DISAS_TOO_MANY;
-
-    switch (op) {
-    case 0x03: /* UAO */
-        if (!dc_isar_feature(aa64_uao, s) || s->current_el == 0) {
-            goto do_unallocated;
-        }
-        if (crm & 1) {
-            set_pstate_bits(PSTATE_UAO);
-        } else {
-            clear_pstate_bits(PSTATE_UAO);
-        }
-        gen_rebuild_hflags(s);
-        break;
-
-    case 0x04: /* PAN */
-        if (!dc_isar_feature(aa64_pan, s) || s->current_el == 0) {
-            goto do_unallocated;
-        }
-        if (crm & 1) {
-            set_pstate_bits(PSTATE_PAN);
-        } else {
-            clear_pstate_bits(PSTATE_PAN);
-        }
-        gen_rebuild_hflags(s);
-        break;
-
-    case 0x05: /* SPSel */
-        if (s->current_el == 0) {
-            goto do_unallocated;
-        }
-        gen_helper_msr_i_spsel(cpu_env, tcg_constant_i32(crm & PSTATE_SP));
-        break;
-
-    case 0x19: /* SSBS */
-        if (!dc_isar_feature(aa64_ssbs, s)) {
-            goto do_unallocated;
-        }
-        if (crm & 1) {
-            set_pstate_bits(PSTATE_SSBS);
-        } else {
-            clear_pstate_bits(PSTATE_SSBS);
-        }
-        /* Don't need to rebuild hflags since SSBS is a nop */
-        break;
-
-    case 0x1a: /* DIT */
-        if (!dc_isar_feature(aa64_dit, s)) {
-            goto do_unallocated;
-        }
-        if (crm & 1) {
-            set_pstate_bits(PSTATE_DIT);
-        } else {
-            clear_pstate_bits(PSTATE_DIT);
-        }
-        /* There's no need to rebuild hflags because DIT is a nop */
-        break;
-
-    case 0x1e: /* DAIFSet */
-        gen_helper_msr_i_daifset(cpu_env, tcg_constant_i32(crm));
-        break;
-
-    case 0x1f: /* DAIFClear */
-        gen_helper_msr_i_daifclear(cpu_env, tcg_constant_i32(crm));
-        /* For DAIFClear, exit the cpu loop to re-evaluate pending IRQs.  */
-        s->base.is_jmp = DISAS_UPDATE_EXIT;
-        break;
-
-    case 0x1c: /* TCO */
-        if (dc_isar_feature(aa64_mte, s)) {
-            /* Full MTE is enabled -- set the TCO bit as directed. */
-            if (crm & 1) {
-                set_pstate_bits(PSTATE_TCO);
-            } else {
-                clear_pstate_bits(PSTATE_TCO);
-            }
-            gen_rebuild_hflags(s);
-            /* Many factors, including TCO, go into MTE_ACTIVE. */
-            s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
-        } else if (dc_isar_feature(aa64_mte_insn_reg, s)) {
-            /* Only "instructions accessible at EL0" -- PSTATE.TCO is WI.  */
-            s->base.is_jmp = DISAS_NEXT;
-        } else {
-            goto do_unallocated;
-        }
-        break;
-
-    case 0x1b: /* SVCR* */
-        if (!dc_isar_feature(aa64_sme, s) || crm < 2 || crm > 7) {
-            goto do_unallocated;
-        }
-        if (sme_access_check(s)) {
-            int old = s->pstate_sm | (s->pstate_za << 1);
-            int new = (crm & 1) * 3;
-            int msk = (crm >> 1) & 3;
-
-            if ((old ^ new) & msk) {
-                /* At least one bit changes. */
-                gen_helper_set_svcr(cpu_env, tcg_constant_i32(new),
-                                    tcg_constant_i32(msk));
-            } else {
-                s->base.is_jmp = DISAS_NEXT;
-            }
-        }
-        break;
-
-    default:
-    do_unallocated:
-        unallocated_encoding(s);
-        return;
+    if (!dc_isar_feature(aa64_uao, s) || s->current_el == 0) {
+        return false;
     }
+    if (a->imm & 1) {
+        set_pstate_bits(PSTATE_UAO);
+    } else {
+        clear_pstate_bits(PSTATE_UAO);
+    }
+    gen_rebuild_hflags(s);
+    s->base.is_jmp = DISAS_TOO_MANY;
+    return true;
+}
+
+static bool trans_MSR_i_PAN(DisasContext *s, arg_i *a)
+{
+    if (!dc_isar_feature(aa64_pan, s) || s->current_el == 0) {
+        return false;
+    }
+    if (a->imm & 1) {
+        set_pstate_bits(PSTATE_PAN);
+    } else {
+        clear_pstate_bits(PSTATE_PAN);
+    }
+    gen_rebuild_hflags(s);
+    s->base.is_jmp = DISAS_TOO_MANY;
+    return true;
+}
+
+static bool trans_MSR_i_SPSEL(DisasContext *s, arg_i *a)
+{
+    if (s->current_el == 0) {
+        return false;
+    }
+    gen_helper_msr_i_spsel(cpu_env, tcg_constant_i32(a->imm & PSTATE_SP));
+    s->base.is_jmp = DISAS_TOO_MANY;
+    return true;
+}
+
+static bool trans_MSR_i_SBSS(DisasContext *s, arg_i *a)
+{
+    if (!dc_isar_feature(aa64_ssbs, s)) {
+        return false;
+    }
+    if (a->imm & 1) {
+        set_pstate_bits(PSTATE_SSBS);
+    } else {
+        clear_pstate_bits(PSTATE_SSBS);
+    }
+    /* Don't need to rebuild hflags since SSBS is a nop */
+    s->base.is_jmp = DISAS_TOO_MANY;
+    return true;
+}
+
+static bool trans_MSR_i_DIT(DisasContext *s, arg_i *a)
+{
+    if (!dc_isar_feature(aa64_dit, s)) {
+        return false;
+    }
+    if (a->imm & 1) {
+        set_pstate_bits(PSTATE_DIT);
+    } else {
+        clear_pstate_bits(PSTATE_DIT);
+    }
+    /* There's no need to rebuild hflags because DIT is a nop */
+    s->base.is_jmp = DISAS_TOO_MANY;
+    return true;
+}
+
+static bool trans_MSR_i_TCO(DisasContext *s, arg_i *a)
+{
+    if (dc_isar_feature(aa64_mte, s)) {
+        /* Full MTE is enabled -- set the TCO bit as directed. */
+        if (a->imm & 1) {
+            set_pstate_bits(PSTATE_TCO);
+        } else {
+            clear_pstate_bits(PSTATE_TCO);
+        }
+        gen_rebuild_hflags(s);
+        /* Many factors, including TCO, go into MTE_ACTIVE. */
+        s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
+        return true;
+    } else if (dc_isar_feature(aa64_mte_insn_reg, s)) {
+        /* Only "instructions accessible at EL0" -- PSTATE.TCO is WI.  */
+        return true;
+    } else {
+        /* Insn not present */
+        return false;
+    }
+}
+
+static bool trans_MSR_i_DAIFSET(DisasContext *s, arg_i *a)
+{
+    gen_helper_msr_i_daifset(cpu_env, tcg_constant_i32(a->imm));
+    s->base.is_jmp = DISAS_TOO_MANY;
+    return true;
+}
+
+static bool trans_MSR_i_DAIFCLEAR(DisasContext *s, arg_i *a)
+{
+    gen_helper_msr_i_daifclear(cpu_env, tcg_constant_i32(a->imm));
+    /* Exit the cpu loop to re-evaluate pending IRQs. */
+    s->base.is_jmp = DISAS_UPDATE_EXIT;
+    return true;
+}
+
+static bool trans_MSR_i_SVCR(DisasContext *s, arg_MSR_i_SVCR *a)
+{
+    if (!dc_isar_feature(aa64_sme, s) || a->mask == 0) {
+        return false;
+    }
+    if (sme_access_check(s)) {
+        int old = s->pstate_sm | (s->pstate_za << 1);
+        int new = a->imm * 3;
+
+        if ((old ^ new) & a->mask) {
+            /* At least one bit changes. */
+            gen_helper_set_svcr(cpu_env, tcg_constant_i32(new),
+                                tcg_constant_i32(a->mask));
+            s->base.is_jmp = DISAS_TOO_MANY;
+        }
+    }
+    return true;
 }
 
 static void gen_get_nzcv(TCGv_i64 tcg_rt)
@@ -2266,18 +2272,7 @@ static void disas_system(DisasContext *s, uint32_t insn)
     rt = extract32(insn, 0, 5);
 
     if (op0 == 0) {
-        if (l || rt != 31) {
-            unallocated_encoding(s);
-            return;
-        }
-        switch (crn) {
-        case 4: /* MSR (immediate) */
-            handle_msr_i(s, insn, op1, op2, crm);
-            break;
-        default:
-            unallocated_encoding(s);
-            break;
-        }
+        unallocated_encoding(s);
         return;
     }
     handle_sys(s, insn, l, op0, op1, op2, crn, crm, rt);
-- 
2.34.1

