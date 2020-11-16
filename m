Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3835382lfb;
        Mon, 16 Nov 2020 08:14:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7RFlMoD1ecph7xaJPDxIISaD78JYH26xubxtSQP55h8N9BToIp/ukdSWeWlI1EB9N5hFE
X-Received: by 2002:a25:cc0c:: with SMTP id l12mr23767031ybf.90.1605543276918;
        Mon, 16 Nov 2020 08:14:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605543276; cv=none;
        d=google.com; s=arc-20160816;
        b=AVdJqNiSgLieHgHF0F6yKcF+k8yPOwsMGvhFlfdNgwXUayLi5toC0FP7/f+C4Oh9NY
         nklebCBKUTygPyF8ZYOdESfAOlBVcN91NLH+u8QV/By6kOX8aANM1ad/4TrRN9Br1S/H
         geWnCt9IwdV9+f0/UuySvYja6x+yxVNcJiHV7I9/ynJcGxS1fvg0gGhR8bhRg9pmTcW5
         78M+/z7VrSDt7X0Eqmrc7lPuip4N4mWeA9Cf4BoabEkMBL0Z7CRzKfRVAS634t2wYFot
         29clXe/XkfunqPLhdv4ankv5+8hiD6wfAZ+gOgcpBN6yyeAPuK7WZX3iefPnuGxJrsZA
         rpNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aHtpQRU3H8qXd2uvyEa+TFGGzXeXygeYRFKCnGAFOiY=;
        b=vIvXSfgRgId0g5+SvDXT0OCuD0pIbkBPmNjnLPDAe1PjUfEbEjIcns6HdQvEIWp0Ut
         M8Vq0mtBqxbF+YWXaynEKts2qizH6pny0IwgS4mxtO6aUjSBIsBPB5Pv2Xe2kgN25mDY
         3Hgei9FijMnQUHbU2QMkUIHgQzeb1gb0LYU3SxpyXjPjkAkXpQhenMwjS8yvZsB59Bjh
         QvtspZeo+mPhmJN15a+6Er2KpaARJ2cJe0tSB130W+Dw0lNT5n0kiqfT3aobnn1OqqV4
         yE/QGVnMiPRUOVJLKPhDLA+NWCPMznLOJsVkX2l7KDOgiZ/W7MXAinQat+SNSkBhPXs1
         Hcrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Thn+dm+Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b93si17988787ybi.392.2020.11.16.08.14.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 08:14:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Thn+dm+Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1keh9I-00058s-8b
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 11:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3h-0000B2-EF
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 11:08:49 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3e-0007sE-Fg
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 11:08:49 -0500
Received: by mail-wr1-x443.google.com with SMTP id o15so19268892wru.6
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2020 08:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aHtpQRU3H8qXd2uvyEa+TFGGzXeXygeYRFKCnGAFOiY=;
 b=Thn+dm+ZO0TrYHQlTvaQ4VzGkVaWnLuvydHfSoJ+yjvYVpb0xU0c/oS3rxUK4e37id
 KDPW+v6Hi6G50IR02aXSv104DfYj35r6oQ58JndUeetO9ok7lJ3YzjnGGk5eOOpIjOP1
 2K0kYq3i26Gzx76lQ7BgpsMkZWkyePoN2eDx3dqBdZszMOw7t8RcJb3IjReHi1mK2QiJ
 AJxKM4dZ+GTxYMOuwIky57yn37lTsFdqBtWtW0JY5aCXqUmRxLrq2+3t2sM5TgSDnGnA
 GTDnnhWhsr+Q5L4efYhGSSL2NnpcccOApcjBrF80eodvwzaiP+VrwQsUVrWhQmEr7sw0
 i98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aHtpQRU3H8qXd2uvyEa+TFGGzXeXygeYRFKCnGAFOiY=;
 b=PRUow9bRM83WgxdxtlG2dKYWOrqsG5pb6w3g4Gqz40qOGq+WX87jFxgvlD4aSztsaA
 9bskcOGVSFCxH6eoK/Uydlw0pH0zs1UUh+TwPU20IcP3O2wnmqxXl4gNDMsWpgIHQfRr
 zzXrMlIhnfKoaycVMyp9v3/4TAtL5vKqa6TmSQIXhUT8MSWskOjOFzoULAC7YnHCfs9y
 flCQaCQMNr8o2XBDdJY18PStJymLmW09A7yJAOK16klqrIZLsbB6HaelBJ5W1cN9AE/0
 irRr0kQ9T0g7d639pz0rMBZH84ZTjWTMe6avLwW/9cO6pNI0VNqTftgCzNSiglzfFO0v
 kaSg==
X-Gm-Message-State: AOAM531JDjo/Q7IPHvfCTqeYG8Iod2uFLhTD7Bm4XkPM4eC7taevUVAg
 xbQhK2sqLysN9YZ8fYAOQ2Z6TF2yk8f7DA==
X-Received: by 2002:adf:eb07:: with SMTP id s7mr19207487wrn.320.1605542924788; 
 Mon, 16 Nov 2020 08:08:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/15] target/arm: Implement VLDR/VSTR system register
Date: Mon, 16 Nov 2020 16:08:25 +0000
Message-Id: <20201116160831.31000-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HRXGWwCE9nSe

Implement the new-in-v8.1M VLDR/VSTR variants which directly
read or write FP system registers to memory.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp.decode          | 14 ++++++
 target/arm/translate-vfp.c.inc | 89 ++++++++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)

diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 51f143b4a51..45e3023840b 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -84,6 +84,20 @@ VLDR_VSTR_hp ---- 1101 u:1 .0 l:1 rn:4 .... 1001 imm:8      vd=%vd_sp
 VLDR_VSTR_sp ---- 1101 u:1 .0 l:1 rn:4 .... 1010 imm:8      vd=%vd_sp
 VLDR_VSTR_dp ---- 1101 u:1 .0 l:1 rn:4 .... 1011 imm:8      vd=%vd_dp
 
+# M-profile VLDR/VSTR to sysreg
+%vldr_sysreg 22:1 13:3
+%imm7_0x4 0:7 !function=times_4
+
+&vldr_sysreg rn reg imm a w p
+@vldr_sysreg .... ... . a:1 . . . rn:4 ... . ... .. ....... \
+             reg=%vldr_sysreg imm=%imm7_0x4 &vldr_sysreg
+
+# P=0 W=0 is SEE "Related encodings", so split into two patterns
+VLDR_sysreg  ---- 110 1 . . w:1 1 .... ... 0 111 11 ....... @vldr_sysreg p=1
+VLDR_sysreg  ---- 110 0 . . 1   1 .... ... 0 111 11 ....... @vldr_sysreg p=0 w=1
+VSTR_sysreg  ---- 110 1 . . w:1 0 .... ... 0 111 11 ....... @vldr_sysreg p=1
+VSTR_sysreg  ---- 110 0 . . 1   0 .... ... 0 111 11 ....... @vldr_sysreg p=0 w=1
+
 # We split the load/store multiple up into two patterns to avoid
 # overlap with other insns in the "Advanced SIMD load/store and 64-bit move"
 # grouping:
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 5d880d12116..cc115f1d35d 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -912,6 +912,95 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
     return true;
 }
 
+static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value)
+{
+    arg_vldr_sysreg *a = opaque;
+    uint32_t offset = a->imm;
+    TCGv_i32 addr;
+
+    if (!a->a) {
+        offset = - offset;
+    }
+
+    addr = load_reg(s, a->rn);
+    if (a->p) {
+        tcg_gen_addi_i32(addr, addr, offset);
+    }
+
+    if (s->v8m_stackcheck && a->rn == 13 && a->w) {
+        gen_helper_v8m_stackcheck(cpu_env, addr);
+    }
+
+    gen_aa32_st32(s, value, addr, get_mem_index(s));
+    tcg_temp_free_i32(value);
+
+    if (a->w) {
+        /* writeback */
+        if (!a->p) {
+            tcg_gen_addi_i32(addr, addr, offset);
+        }
+        store_reg(s, a->rn, addr);
+    } else {
+        tcg_temp_free_i32(addr);
+    }
+}
+
+static TCGv_i32 memory_to_fp_sysreg(DisasContext *s, void *opaque)
+{
+    arg_vldr_sysreg *a = opaque;
+    uint32_t offset = a->imm;
+    TCGv_i32 addr;
+    TCGv_i32 value = tcg_temp_new_i32();
+
+    if (!a->a) {
+        offset = - offset;
+    }
+
+    addr = load_reg(s, a->rn);
+    if (a->p) {
+        tcg_gen_addi_i32(addr, addr, offset);
+    }
+
+    if (s->v8m_stackcheck && a->rn == 13 && a->w) {
+        gen_helper_v8m_stackcheck(cpu_env, addr);
+    }
+
+    gen_aa32_ld32u(s, value, addr, get_mem_index(s));
+
+    if (a->w) {
+        /* writeback */
+        if (!a->p) {
+            tcg_gen_addi_i32(addr, addr, offset);
+        }
+        store_reg(s, a->rn, addr);
+    } else {
+        tcg_temp_free_i32(addr);
+    }
+    return value;
+}
+
+static bool trans_VLDR_sysreg(DisasContext *s, arg_vldr_sysreg *a)
+{
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+        return false;
+    }
+    if (a->rn == 15) {
+        return false;
+    }
+    return gen_M_fp_sysreg_write(s, a->reg, memory_to_fp_sysreg, a);
+}
+
+static bool trans_VSTR_sysreg(DisasContext *s, arg_vldr_sysreg *a)
+{
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+        return false;
+    }
+    if (a->rn == 15) {
+        return false;
+    }
+    return gen_M_fp_sysreg_read(s, a->reg, fp_sysreg_to_memory, a);
+}
+
 static bool trans_VMOV_half(DisasContext *s, arg_VMOV_single *a)
 {
     TCGv_i32 tmp;
-- 
2.20.1

