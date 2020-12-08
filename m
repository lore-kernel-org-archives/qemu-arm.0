Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4245290lfb;
        Tue, 8 Dec 2020 10:18:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/0NCVp/BJ2rpEW7NA2yjj6NvsYHOJajYLb3TCUF4b1r4dPE2iORyZui140c6LfEJynJnL
X-Received: by 2002:a25:af8c:: with SMTP id g12mr31819595ybh.511.1607451485406;
        Tue, 08 Dec 2020 10:18:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607451485; cv=none;
        d=google.com; s=arc-20160816;
        b=efW9+OvWSNdnoj+2tPvhhwPpUhquZf0rc3SOnKFIjJ5lIHo4VhGmva5l0Ud+B3yqFK
         zojDDQPYLBhrjAZzFmO08xfFL+Ljxo1qS+cDQUEKxGmhA3kWXtx7qIvSAqSAmmSEf3iA
         +xMV3UysRcBmYAp75z36hJo8q6rlDVuQsvZz5ikZ7FWrORk3s10ad9CNjCKh6v2FXOcy
         TqKwTB1bU2B4AtcTeGuyRrXJclAajbwy0xBmmgziCWBxUTKK9OjiIdkaUzWZw9IPKo5L
         75M07O6MqHF1ngvGy8mmfCC4OidCvZWYGcnIgCiNS/QEYuJnvfSpE7xYUIN9iPGbPCMs
         jYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sz4OfX2JcpPtJYKWU9aAlMNGI1f4lYPUyryiQe7SsD4=;
        b=CGEMxPqAy6nHQxkOZxx1JiCETvQkjngeHXM0Bbc44NtccH3PwQRVjlRYjsDpxkgCKK
         YW1qed3o9x0jazHLtafo3Gg4gBuw2N8BPBI2O7Dl9aeGMEwoOKIjiaRW2ByLLytQUE9/
         zNGtnLgALbk+aSh6wC8tDLR2QuauUDsu8jk8g9CARnQAzI1s9/GBLTBL2jQ0l467uJrW
         LMYKLUYCYhIZFQSiSRqiOp9qQvIk72z/sQFf5ii5+ZNPg+0gvXqKhDFvxI2w4C00Zded
         FLkQdSCwu1cxK8NtaUpkNi69w6FMeXo7LCUUG4oeSc4vYgAnOvXZpReHkZIE5Q9UWDZz
         9CCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eSdpL6M6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8si1594843ybo.100.2020.12.08.10.18.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 10:18:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eSdpL6M6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmhYq-0006PR-NY
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 13:18:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJH-0008AN-1E
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:01:59 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:44818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJE-0006Pk-CF
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:01:58 -0500
Received: by mail-ot1-x343.google.com with SMTP id f16so16597772otl.11
 for <qemu-arm@nongnu.org>; Tue, 08 Dec 2020 10:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sz4OfX2JcpPtJYKWU9aAlMNGI1f4lYPUyryiQe7SsD4=;
 b=eSdpL6M6pT0Trz9laEZRwTYV+hEirnUnX9+F77rG+Ma6Klldh/GtOEd3NQ/6d59nEc
 +83AmVz3/CQ1gtR9ii35HlR5jDkHUasbo+s5ggNaMrlg46CwKgGLG/hpOhMdJdU4cr/L
 EFGXGo4pWnfVhl/VUQVZTISnw1v/Vf2XZYanHhlp600Qvz6xULlIlGJW8gYO8LV/n02C
 9KkLo8KQCx5eLnev2LY8z4GP9vzSNQl4QSkYCKwk+ISnPxr0V0qL+yUrFQjcbI5wHm3L
 lIk0RjZBx6fhWxPkDrPkvRp3r4lKXoub/XlxS+ou1oOorke4K5OytaVLUVmkqkXLZ40G
 Y/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sz4OfX2JcpPtJYKWU9aAlMNGI1f4lYPUyryiQe7SsD4=;
 b=CDks8kuogQO/btk7AScC4v0jMRR9DwF6vomyw+12teYTaUthl75sreBd2Y2HJpOjZI
 9Ndz4tYhbtDzEs/zak+YIeYeQFm3lLV4LLvBgFwQzfzw7Ly6sJzkvNn/9T7lB/pikceM
 JPq/LnaLBweXxpm2gNt9p0yUdMwp6a3oyyQCR6VplK2blGeXwfB2id/Ahx4qddF1ITc5
 qW3+UWuGQ5LkXwU/589L8ohtZUDwD5ubSif8ftQhrCXCZndAe+MF3dz26Cd201/BPiym
 82UviaXvtH3sdc2QmDxUdHBiumM3dHVTBMDcpkxzIhFxcaB0+qN6kZVKS+jnZvjYWGbH
 gUsg==
X-Gm-Message-State: AOAM533b990eXqcqqrvDM9qFgzoUHspJE/LaWojh/OZN4q++ALXEmJOS
 UUhEfN/aDExQJO3shgyU2WbfIg==
X-Received: by 2002:a05:6830:1092:: with SMTP id
 y18mr1759959oto.243.1607450515195; 
 Tue, 08 Dec 2020 10:01:55 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/24] target/arm: Use finalize_memop for aa64 fpr
 load/store
Date: Tue,  8 Dec 2020 12:01:12 -0600
Message-Id: <20201208180118.157911-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pzkp30UpHfzf

For 128-bit load/store, use 16-byte alignment.  This
requires that we perform the two operations in the
correct order so that we generate the alignment fault
before modifying memory.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 42 +++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d34ec892c6..152a0a37ab 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -957,25 +957,33 @@ static void do_gpr_ld(DisasContext *s, TCGv_i64 dest, TCGv_i64 tcg_addr,
 static void do_fp_st(DisasContext *s, int srcidx, TCGv_i64 tcg_addr, int size)
 {
     /* This writes the bottom N bits of a 128 bit wide vector to memory */
-    TCGv_i64 tmp = tcg_temp_new_i64();
-    tcg_gen_ld_i64(tmp, cpu_env, fp_reg_offset(s, srcidx, MO_64));
+    TCGv_i64 tmplo = tcg_temp_new_i64();
+    MemOp mop;
+
+    tcg_gen_ld_i64(tmplo, cpu_env, fp_reg_offset(s, srcidx, MO_64));
+
     if (size < 4) {
-        tcg_gen_qemu_st_i64(tmp, tcg_addr, get_mem_index(s),
-                            s->be_data + size);
+        mop = finalize_memop(s, size);
+        tcg_gen_qemu_st_i64(tmplo, tcg_addr, get_mem_index(s), mop);
     } else {
         bool be = s->be_data == MO_BE;
         TCGv_i64 tcg_hiaddr = tcg_temp_new_i64();
+        TCGv_i64 tmphi = tcg_temp_new_i64();
 
+        tcg_gen_ld_i64(tmphi, cpu_env, fp_reg_hi_offset(s, srcidx));
+
+        mop = s->be_data | MO_Q;
+        tcg_gen_qemu_st_i64(be ? tmphi : tmplo, tcg_addr, get_mem_index(s),
+                            mop | (s->align_mem ? MO_ALIGN_16 : 0));
         tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
-        tcg_gen_qemu_st_i64(tmp, be ? tcg_hiaddr : tcg_addr, get_mem_index(s),
-                            s->be_data | MO_Q);
-        tcg_gen_ld_i64(tmp, cpu_env, fp_reg_hi_offset(s, srcidx));
-        tcg_gen_qemu_st_i64(tmp, be ? tcg_addr : tcg_hiaddr, get_mem_index(s),
-                            s->be_data | MO_Q);
+        tcg_gen_qemu_st_i64(be ? tmplo : tmphi, tcg_hiaddr,
+                            get_mem_index(s), mop);
+
         tcg_temp_free_i64(tcg_hiaddr);
+        tcg_temp_free_i64(tmphi);
     }
 
-    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i64(tmplo);
 }
 
 /*
@@ -986,10 +994,11 @@ static void do_fp_ld(DisasContext *s, int destidx, TCGv_i64 tcg_addr, int size)
     /* This always zero-extends and writes to a full 128 bit wide vector */
     TCGv_i64 tmplo = tcg_temp_new_i64();
     TCGv_i64 tmphi = NULL;
+    MemOp mop;
 
     if (size < 4) {
-        MemOp memop = s->be_data + size;
-        tcg_gen_qemu_ld_i64(tmplo, tcg_addr, get_mem_index(s), memop);
+        mop = finalize_memop(s, size);
+        tcg_gen_qemu_ld_i64(tmplo, tcg_addr, get_mem_index(s), mop);
     } else {
         bool be = s->be_data == MO_BE;
         TCGv_i64 tcg_hiaddr;
@@ -997,11 +1006,12 @@ static void do_fp_ld(DisasContext *s, int destidx, TCGv_i64 tcg_addr, int size)
         tmphi = tcg_temp_new_i64();
         tcg_hiaddr = tcg_temp_new_i64();
 
+        mop = s->be_data | MO_Q;
+        tcg_gen_qemu_ld_i64(be ? tmphi : tmplo, tcg_addr, get_mem_index(s),
+                            mop | (s->align_mem ? MO_ALIGN_16 : 0));
         tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
-        tcg_gen_qemu_ld_i64(tmplo, be ? tcg_hiaddr : tcg_addr, get_mem_index(s),
-                            s->be_data | MO_Q);
-        tcg_gen_qemu_ld_i64(tmphi, be ? tcg_addr : tcg_hiaddr, get_mem_index(s),
-                            s->be_data | MO_Q);
+        tcg_gen_qemu_ld_i64(be ? tmplo : tmphi, tcg_hiaddr,
+                            get_mem_index(s), mop);
         tcg_temp_free_i64(tcg_hiaddr);
     }
 
-- 
2.25.1

