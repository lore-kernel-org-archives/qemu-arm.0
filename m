Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4036715lfg;
        Mon, 28 Jun 2021 07:09:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3tdAyoNxz8so6KzoUKJvzNv3Tmi1wprDkJPJNhLVMg8FKeUFSXdf4/o91aEenzeH/+dXP
X-Received: by 2002:a05:6402:1655:: with SMTP id s21mr33671018edx.295.1624889342512;
        Mon, 28 Jun 2021 07:09:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624889342; cv=none;
        d=google.com; s=arc-20160816;
        b=jRmrH4L30LVnc3zEVJXGQRp2uCbUNggyeJ3BCcxSHVdHyWdrwttCQraKs3gOiJvNeS
         hs4tGRnA3VvZ/uPfSFSExRoeLsrqmEuHjzhH0+TKnetKS+mor05HJA/XWmcl2ao3QV7x
         K5AHjJ3GC1jCOosxEct3fOCMOCRNvg3qGkTD8Llq4Ln0oF7dTaTEApuXibA9vAPH/FY6
         FswPtFNu9vs8BgIZtWR1KocfLP329jeKq4VAiSiHH2PETDjMDWPv8rE95AJqpS9Fsl6i
         hg11KB3yRQMUTDZyJzh8aaszGc9b38zedu6PdVarxiR966UoSv3zOVATUje3l9Ux3mYH
         OaMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ACAUeCX9+Wz6GLIq3XrxvGBI0qMISpWslzw8tcPYLUU=;
        b=qEDMiYg5NGLC4EuXaC7T7scOti9wtLtfw5C49603VIcSsX46q+MKu3UgCC+nrIAi4I
         12agbrkSHJBLE2Aim5rhvCarXICOnvitAacZ/oiXzP88xIjMJIxNy9rX4FhOEC+0Mzor
         bpDGRLOhJqbgxjgvJ3vG2gLMYxOHn8ydSUAmRmYhAWUo2crHERF8EXOTfpzo+yGIWP/0
         8KPNMxbOwuhx6bZwk2/fJYRYq1hbmIcKukUD10zfTKkpbVcnKBK3dqV6WaEISDvB8SbQ
         n+l9D3YkARUwdlTWtUgMSyLIFy71mY/53RBI7cC6Lz3kkMhECDAH0kbYMrHgzav6Zej6
         hsjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pXxlE/VJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f24si13719482edr.606.2021.06.28.07.09.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 07:09:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pXxlE/VJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxrwb-0004vQ-G1
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 10:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmw-0003LN-6f
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 09:59:02 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmk-00065t-Pf
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 09:59:01 -0400
Received: by mail-wr1-x42a.google.com with SMTP id m18so21401222wrv.2
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 06:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ACAUeCX9+Wz6GLIq3XrxvGBI0qMISpWslzw8tcPYLUU=;
 b=pXxlE/VJprXBlqDmBw8K41KFOcJQvMFmQcpftTunHiqNeK1Vd+zHmw0eXHErfophfy
 CeC/pYyF0IJTnWTBWaQJJAaYoxl2SLdZFNf8A2Nf+bvyc15G7PeL8srxL8CrfA70idrp
 k9eZdlS4DtyE7rGHPbqLY87jLsPwtstf4AvKWi0wrUyTx+ddVKl4jeoLW+us22vpkoRK
 zC6Xg4s5OgnGWnXLZqQflMF/awKMVUEEXLm9qkRG2ZClhqys1voienR4yN1QcJZvpGoC
 CNmrN3ntH7HpxQYadWHWey81xTqvJyQIvpBU7eCiIHLBtzKySJohCNWrKGT//EjB+oAd
 yUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ACAUeCX9+Wz6GLIq3XrxvGBI0qMISpWslzw8tcPYLUU=;
 b=qAXCq/+Uzl7wNyuLeDg+vIyY3l6VfZfIEIIllbl5Lr7L6W5aaJD00+lN6UACS0QReo
 EyLfSWgsgRbLO/FZCjpDsPnowLomaBCUejTgGX4hkBLNX5c7ancq5EsofurNlJ4AGLRm
 oTKisRLdVVn1yAx163tjAHfLv3aIEhV9mzvDyqcGTDcX+q8uX+ryBYG2b1Q+FKm+AmaH
 RWeTpShmAHdm12vdlkAlDpTnIpuiYB6RTrh7DTFbyEZ0a3tymSYgeBrMFCAUgqCiv2IS
 Dmeeo6oITeDR9dlJRzURbqdqEsgcDN9tdkAWZnv4fIzYpuPbOMQr5+GrWRJQxFntxJFq
 b0Cw==
X-Gm-Message-State: AOAM532zT2IKMYAKoSlPlxd37Z8LvErNsXc5uRE7cOW/y+LsS8GFO/1p
 mHsHpEYtJXYUj9XzhDntuZ8GKa2exLQu+D55
X-Received: by 2002:a5d:698a:: with SMTP id g10mr26916272wru.129.1624888726388; 
 Mon, 28 Jun 2021 06:58:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d12sm12047627wri.77.2021.06.28.06.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 06:58:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/18] target/arm: Implement MVE VSHLC
Date: Mon, 28 Jun 2021 14:58:30 +0100
Message-Id: <20210628135835.6690-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628135835.6690-1-peter.maydell@linaro.org>
References: <20210628135835.6690-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: cqq0XF9etdj7

Implement the MVE VSHLC insn, which performs a shift left of the
entire vector with carry in bits provided from a general purpose
register and carry out bits written back to that register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  2 ++
 target/arm/mve.decode      |  2 ++
 target/arm/mve_helper.c    | 38 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 30 ++++++++++++++++++++++++++++++
 4 files changed, 72 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 96b4c0dfd34..d414b6309d5 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -444,3 +444,5 @@ DEF_HELPER_FLAGS_4(mve_vqrshrunbb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vqrshrunbh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vqrshruntb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vqrshrunth, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vshlc, TCG_CALL_NO_WG, i32, env, ptr, i32, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 1d11387bc07..914b108c379 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -419,3 +419,5 @@ VQRSHRUNB         111 1 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 0 @2_shr_b
 VQRSHRUNB         111 1 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 0 @2_shr_h
 VQRSHRUNT         111 1 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 0 @2_shr_b
 VQRSHRUNT         111 1 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 0 @2_shr_h
+
+VSHLC             111 0 1110 1 . 1 imm:5 ... 0 1111 1100 rdm:4 qd=%qd
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 3e736e89095..9d4a07c1c0c 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1468,3 +1468,41 @@ DO_VSHRN_SAT_UB(vqrshrnb_ub, vqrshrnt_ub, DO_RSHRN_UB)
 DO_VSHRN_SAT_UH(vqrshrnb_uh, vqrshrnt_uh, DO_RSHRN_UH)
 DO_VSHRN_SAT_SB(vqrshrunbb, vqrshruntb, DO_RSHRUN_B)
 DO_VSHRN_SAT_SH(vqrshrunbh, vqrshrunth, DO_RSHRUN_H)
+
+uint32_t HELPER(mve_vshlc)(CPUARMState *env, void *vd, uint32_t rdm,
+                           uint32_t shift)
+{
+    uint32_t *d = vd;
+    uint16_t mask = mve_element_mask(env);
+    unsigned e;
+    uint32_t r;
+
+    /*
+     * For each 32-bit element, we shift it left, bringing in the
+     * low 'shift' bits of rdm at the bottom. Bits shifted out at
+     * the top become the new rdm, if the predicate mask permits.
+     * The final rdm value is returned to update the register.
+     * shift == 0 here means "shift by 32 bits".
+     */
+    if (shift == 0) {
+        for (e = 0; e < 16 / 4; e++, mask >>= 4) {
+            r = rdm;
+            if (mask & 1) {
+                rdm = d[H4(e)];
+            }
+            mergemask(&d[H4(e)], r, mask);
+        }
+    } else {
+        uint32_t shiftmask = MAKE_64BIT_MASK(0, shift);
+
+        for (e = 0; e < 16 / 4; e++, mask >>= 4) {
+            r = (d[H4(e)] << shift) | (rdm & shiftmask);
+            if (mask & 1) {
+                rdm = d[H4(e)] >> (32 - shift);
+            }
+            mergemask(&d[H4(e)], r, mask);
+        }
+    }
+    mve_advance_vpt(env);
+    return rdm;
+}
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index eef4f1f6ce3..460dff260fe 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -938,3 +938,33 @@ DO_2SHIFT_N(VQRSHRNB_U, vqrshrnb_u)
 DO_2SHIFT_N(VQRSHRNT_U, vqrshrnt_u)
 DO_2SHIFT_N(VQRSHRUNB, vqrshrunb)
 DO_2SHIFT_N(VQRSHRUNT, vqrshrunt)
+
+static bool trans_VSHLC(DisasContext *s, arg_VSHLC *a)
+{
+    /*
+     * Whole Vector Left Shift with Carry. The carry is taken
+     * from a general purpose register and written back there.
+     * An imm of 0 means "shift by 32".
+     */
+    TCGv_ptr qd;
+    TCGv_i32 rdm;
+
+    if (!dc_isar_feature(aa32_mve, s) || !mve_check_qreg_bank(s, a->qd)) {
+        return false;
+    }
+    if (a->rdm == 13 || a->rdm == 15) {
+        /* CONSTRAINED UNPREDICTABLE: we UNDEF */
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qd = mve_qreg_ptr(a->qd);
+    rdm = load_reg(s, a->rdm);
+    gen_helper_mve_vshlc(rdm, cpu_env, qd, rdm, tcg_constant_i32(a->imm));
+    store_reg(s, a->rdm, rdm);
+    tcg_temp_free_ptr(qd);
+    mve_update_eci(s);
+    return true;
+}
-- 
2.20.1

