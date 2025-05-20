Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp476236njc;
        Tue, 20 May 2025 05:54:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:944e:b0:736:5b85:a911 with SMTP id d2e1a72fcca58-742a97dba4bmr27212966b3a.8.1747745671560;
        Tue, 20 May 2025 05:54:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745671; cv=none;
        d=google.com; s=arc-20240605;
        b=ZiAmASaYoJnaDJDnorkMPb2UgCGvPUKXnRlyi6BbrW0c3cR5J2vgj4X0q0I3GoRL8x
         dyQne2DC5WbRDzGl+R46A1JTzJ1mmI3Tc+ZnFV7ulwVDciKZtIVmaCUpnOV5G5M6DKmV
         AvgTTILrbBoY2FlyMw5w7W9yLwFESlY5yuvCZ8LiQDB0eBb4ttYdo0BbI3JWzkeeTYPh
         YXByedycn8Xw90ChwjLqpIzPYjJWC2tryIs45KniUwB2tr6jhrOzeR9tYyGnTkVbakJi
         J5J97FE6CK1X5uvcMqQA4Pbb+3dHi6iNSzGlCeDme/kAV5kJkfysZmKxaMm1vXjjMunD
         Rvag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TW1RsXRiDX3fR+HjAtpX8n14C4CKemsei/P4rdx2cjg=;
        fh=Ay3sLNPf20TFWean+EGQ06buAfWpHRlA77p5TT7ivCA=;
        b=NXez1RF6+sLsc/Qw/2TX7Hz3hEzpwgNDCFmNwmex1nlutXK4xEX7DYtZCw1Ean2Xj5
         HKU1vO3vPuZ+iMgmgw/NmKbsqcOuH5aha0lCLFpKzkUs/G4iWdGuOrpzoKs23lgJ4YOu
         sZnplhfcdN4MNO8KZv2LgCjr1T3dd7qtUm5LI6a5VThAH2IegjLyA6nNOKpQjZpisHlZ
         VIeHwfoj4IZySDGQBI6shPgFLrniTTgpcEw/ILGyy+bqKE0QQIyANmqQ19lp6xY9qoAl
         LQ9F6TUL6dQkRaHXvDtyYo3HOpCG9+fiCBUvD8kaq003zik8ulLlbYJqRncnNf+Qb7G2
         8U1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=F4D3SaZ1;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-742a96d462asor7858064b3a.2.2025.05.20.05.54.31
        (Google Transport Security);
        Tue, 20 May 2025 05:54:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=F4D3SaZ1;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745671; x=1748350471; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TW1RsXRiDX3fR+HjAtpX8n14C4CKemsei/P4rdx2cjg=;
        b=F4D3SaZ1VzKX3TGELwUTDZ793ZJNhu0YWaiX1bHaADPdRZpnuKvZ9TI5BruwJnNQYH
         pl/N+J5DjsWIAahOV52J7NsDkxLQokUiNjkZ3mmBXGuwdcQ6tld+eBKSQSyyKzO/SXc2
         RLz+kkOkIy+dUXvrXjZIwuI8XXAduNaqfppwlR4nnsypRN1VCwtfUXIg89GQVzE8hN/I
         U50M1SlvyO2squ81Kmgka3+g0qjeWumhIPzXsQKv3eEAS2vmZTNiilfraHVpjQ8oYiD+
         CzyxkM1pJqZ2KUbN48vZWEPF4m84mNM4uLHU/AI1t7etGnRztUYf3JDH14nbddxctkIe
         nzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745671; x=1748350471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TW1RsXRiDX3fR+HjAtpX8n14C4CKemsei/P4rdx2cjg=;
        b=cy3/ZoyzknoBKURiKtuKpnPkERviMOM5+QlpQxi+2Lk5hQM3ndER93x17lZdP8WALu
         fCKFIgETdMto5rcibYG7gMKNIPQ/fkoDQxjOkEtZR61WpHvlXdCHrkqij3rdULyvO0bP
         NgXtlYd05WllvY3DvH1p4yqKyuiBG+0orHcbjsOIoH9fLr5YJZnXFcGb8TPhg28UJHNm
         fqKDCAEEFZCEgluzbf9a1nZIoUyrrrtPzD4jXV0HlH7hGzhDUiQP56Lc2LKjMwHO4Yt0
         vLFDomnDQA+ftXOJgxXKxbDgyVEEFyA3yhig7XaRQMUL5GpgLg1v2LvvSjqSNSU4lPQ6
         0LXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsUS9zNLvPXkPn+C/1UQMOhk18qEy9xoZiKW8ncEjz+PHx4aWIoKOFdu+sdkxx2ToXU5tAtrs9Ezc31YmiFVj0RQ==@linaro.org, AJvYcCWSNwECAZcd0cYzJHM+NBhFHmmtIJC3AGt8pl6Hotn+3onn6+QHXUCd3HaGm3S14VuQor/ojLc=@linaro.org, AJvYcCXGwRVS+XVWR84QR13MJwB+ShE4DMWIcr1coZgK0yzTcuYR8F7dtWWGVSRmvwXUO474pB2Ozzkh4E32PYM6xbEl1cY=@linaro.org
X-Gm-Message-State: AOJu0YyE9yv9l9o+56iLgcFAYHKTLKue1NDWDwzJR8aFA9SqocmrJ6/7
	+ASbd8nRaHqWI7bRQXG3lZbT+gT6KoziKbLbq4hm9tFQ23+V2F/jZFh3QTgODqB+
X-Gm-Gg: ASbGnctyKnxIXoId7/z1uvV9sO0TOb0PtcXz5wuqpRpXeFUU3krmgJLbcAaWFmx+dR9
	XdHOnKwhC0aqN1QGOWeuUbi1DrhcByq4yEPYm+jxu3H0wf6ntuSsb9IPwGgWl1X9qxhNezd9tTC
	obRRtpFn3XoOJEa+PNYAf3xYoOsozSRor3Z+tIKvtBg6PJJwg0pzX3KDEXYr7QgZk+t0RBIs3QW
	iL8i0a+QiAB27vdionhQY6OcXX3AQ+XxVRmoUBovqXM2S2ddtoUEy1pEaCUkLG/hQO/LDXtkuH3
	GdJsz/PtETYNOBOg2EBsfTPWCHK8uaZ2F7nZqB4A2L5riH4QY34SmQmAjabQBg==
X-Google-Smtp-Source: AGHT+IEugiza3fgduRxn2ow9OvjRvHyOfJwN+IFpHUh7HXpHpxCh+bAzoEvIlSNWAfmhOeZyaMK5eQ==
X-Received: by 2002:a17:90b:3905:b0:2fe:b8ba:62de with SMTP id 98e67ed59e1d1-30e7d5a96d7mr26190895a91.25.1747745660242;
        Tue, 20 May 2025 05:54:20 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:54:19 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	WANG Xuerui <git@xen0n.name>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 22/33] tcg/wasm32: Add qemu_ld/qemu_st instructions
Date: Tue, 20 May 2025 21:51:24 +0900
Message-ID: <50dd6a8e7cce06b191b1dbb3c5cc470e0819a566.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: mxw0DCE20hD7

This commit adds qemu_ld and qemu_st by calling the helper functions
corresponding to MemOp.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32/tcg-target.c.inc | 108 ++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index 708af1fbb6..ea9131e6fe 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -1793,6 +1793,112 @@ static void tcg_wasm_out_call(TCGContext *s, int func,
     gen_call(s, info, func_idx);
 }
 
+static void *qemu_ld_helper_ptr(uint32_t oi)
+{
+    MemOp mop = get_memop(oi);
+    switch (mop & MO_SSIZE) {
+    case MO_UB:
+        return helper_ldub_mmu;
+    case MO_SB:
+        return helper_ldsb_mmu;
+    case MO_UW:
+        return helper_lduw_mmu;
+    case MO_SW:
+        return helper_ldsw_mmu;
+    case MO_UL:
+        return helper_ldul_mmu;
+    case MO_SL:
+        return helper_ldsl_mmu;
+    case MO_UQ:
+        return helper_ldq_mmu;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_wasm_out_qemu_ld(TCGContext *s, TCGReg data_reg,
+                                 TCGReg addr_reg, MemOpIdx oi)
+{
+    int helper_idx;
+    int func_idx;
+    bool addr64 = s->addr_type == TCG_TYPE_I64;
+
+    helper_idx = (uint32_t)qemu_ld_helper_ptr(oi);
+    func_idx = get_helper_idx(s, helper_idx);
+    if (func_idx < 0) {
+        func_idx = register_helper(s, helper_idx);
+    }
+
+    if (!addr64) {
+        tcg_wasm_out_ext32u(s, TCG_REG_TMP, addr_reg);
+        addr_reg = TCG_REG_TMP;
+    }
+
+    /* call helper */
+    tcg_wasm_out_op_global_get_r(s, TCG_AREG0);
+    tcg_wasm_out_op_i32_wrap_i64(s);
+    tcg_wasm_out_op_global_get_r(s, addr_reg);
+    tcg_wasm_out_op_i32_const(s, oi);
+    tcg_wasm_out_op_i32_const(s, (int32_t)s->code_ptr);
+
+    tcg_wasm_out_op_call(s, func_idx);
+    tcg_wasm_out_op_global_set_r(s, data_reg);
+}
+
+static void *qemu_st_helper_ptr(uint32_t oi)
+{
+    MemOp mop = get_memop(oi);
+    switch (mop & MO_SIZE) {
+    case MO_8:
+        return helper_stb_mmu;
+    case MO_16:
+        return helper_stw_mmu;
+    case MO_32:
+        return helper_stl_mmu;
+    case MO_64:
+        return helper_stq_mmu;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_wasm_out_qemu_st(TCGContext *s, TCGReg data_reg,
+                                 TCGReg addr_reg, MemOpIdx oi)
+{
+    int helper_idx;
+    int func_idx;
+    bool addr64 = s->addr_type == TCG_TYPE_I64;
+    MemOp mop = get_memop(oi);
+
+    helper_idx = (uint32_t)qemu_st_helper_ptr(oi);
+    func_idx = get_helper_idx(s, helper_idx);
+    if (func_idx < 0) {
+        func_idx = register_helper(s, helper_idx);
+    }
+
+    if (!addr64) {
+        tcg_wasm_out_ext32u(s, TCG_REG_TMP, addr_reg);
+        addr_reg = TCG_REG_TMP;
+    }
+
+    /* call helper */
+    tcg_wasm_out_op_global_get_r(s, TCG_AREG0);
+    tcg_wasm_out_op_i32_wrap_i64(s);
+    tcg_wasm_out_op_global_get_r(s, addr_reg);
+    switch (mop & MO_SSIZE) {
+    case MO_UQ:
+        tcg_wasm_out_op_global_get_r(s, data_reg);
+        break;
+    default:
+        tcg_wasm_out_op_global_get_r(s, data_reg);
+        tcg_wasm_out_op_i32_wrap_i64(s);
+        break;
+    }
+    tcg_wasm_out_op_i32_const(s, oi);
+    tcg_wasm_out_op_i32_const(s, (int32_t)s->code_ptr);
+
+    tcg_wasm_out_op_call(s, func_idx);
+}
 
 static bool patch_reloc(tcg_insn_unit *code_ptr_i, int type,
                         intptr_t value, intptr_t addend)
@@ -3128,6 +3234,7 @@ static void tgen_qemu_ld(TCGContext *s, TCGType type, TCGReg data,
                          TCGReg addr, MemOpIdx oi)
 {
     tcg_out_op_rrm(s, INDEX_op_qemu_ld, data, addr, oi);
+    tcg_wasm_out_qemu_ld(s, data, addr, oi);
 }
 
 static const TCGOutOpQemuLdSt outop_qemu_ld = {
@@ -3153,6 +3260,7 @@ static void tgen_qemu_st(TCGContext *s, TCGType type, TCGReg data,
                          TCGReg addr, MemOpIdx oi)
 {
     tcg_out_op_rrm(s, INDEX_op_qemu_st, data, addr, oi);
+    tcg_wasm_out_qemu_st(s, data, addr, oi);
 }
 
 static const TCGOutOpQemuLdSt outop_qemu_st = {
-- 
2.43.0
