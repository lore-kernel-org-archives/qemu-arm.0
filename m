Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp153739lfb;
        Tue, 24 Nov 2020 20:07:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmg8zk84HzNgQpT9S+sM0R3ZP6sbTq4gOl/WZTsfPYhyNudoxCL4Sp1K/ipqIwZ82XJJGu
X-Received: by 2002:a25:8684:: with SMTP id z4mr1412515ybk.120.1606277253554;
        Tue, 24 Nov 2020 20:07:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606277253; cv=none;
        d=google.com; s=arc-20160816;
        b=VbWb8kHfxCeeokH1wP4faU39NF4lTZ2YhutsSp3TpbJ0s4Z2uZTM9gkbDIF1nSg8xI
         7KAxuaZS6+bf2G9DNVs/vhXy2TpVuV0dbkodqAQBj/U+hhbY4ExHxXbFaDWNMJLBGGNA
         YTX5inbm/j2WF5j5opJvrTQBZ//lrXZpyb9xSCY32bLKVlMHiNfA77GUl+dJimduRLVQ
         g8l6iq3xykR/+KLGz5OJx0fPs32L9CvQG8v7T5LHUoq712IoN+cKtM1FKM66nLm5sPhW
         NBEF8g4JWdniBrkoIkAE/tFWXGy8cnsgMH9yL+g5wdF4MSces1/+amxosQ7K3lnBZv4u
         eqog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nu/Ovkj+6UMFJbUMB5ay1PUB81CaPlCNyUgEjjeQxrc=;
        b=fjGYvmtmQNv7gVbFHvf1ZIF31GbxC8TgFsALn6rsEHtDip/VnpLGgh85yPI1Pt6i34
         oLKI9KPLRcfFGz/hzDAIopEAe8RiIbt8KztyM7VDbEHZ01vveTzC6Z4drIgsr9aQlxES
         26S05bkKaIt45UTnIf28+Fu+iI6t1Va8Q6PmmNIaXLC/DMCpWtcP6WotaxfFh3nXjLoc
         7lEMlWC6R/GbAn++qfWsrIoRJWxV2dqjZFhJY8Jf1uhkRzblsyLouj32SLlhvYg8EUeq
         wcPhgOSh8c8mo5UIOXFajp2CA+vaKQr2rWbPp63YvjG2Sei/zg3z3xsGlCKAnxEHrPst
         cPyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AKEyKHrJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1si1113435ybl.470.2020.11.24.20.07.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 20:07:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AKEyKHrJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khm5c-0004hT-Pi
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 23:07:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4v-0004fA-W5
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:50 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4u-00060n-9R
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:49 -0500
Received: by mail-pg1-x541.google.com with SMTP id 81so1218822pgf.0
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 20:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nu/Ovkj+6UMFJbUMB5ay1PUB81CaPlCNyUgEjjeQxrc=;
 b=AKEyKHrJslwxk/lcm9Q9s77PG0gmeaWgvdWkQD3YenuURG8qC+p+BffZbgnDgKX582
 EG+iK++2sVR+LMp0/l9RY10u/eHGsc7RdIIFWCsjL5vdiicHfz6aQiI2BHYM1WspI4xb
 QjCYzS1eURaqZ0XyoOTCqoRPU81pctycyrifMRnjB3z7SdPJe1ga8WZExbBGT5sprnfY
 eIl38jh5BtrBJ0OA46rjXLvHKzdElawTWFjQXC8BCviPOEi8kROVd09+mlDDEfL4Y7CX
 B4tYnyaLmUarvQjfyeJEpGfLbu9PVyLmHZXYJ7ITJCGykE1YAcDSWM3fsWFtYAqWx3rm
 nhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nu/Ovkj+6UMFJbUMB5ay1PUB81CaPlCNyUgEjjeQxrc=;
 b=pPRdHLhui83E5mIZzeRWDft39rxrZK+ZxVpDesontU02joBG7TrLjFnWj08do/hmq+
 V6p2cYySyR2HT00emtDktwsiMusG9aPb8jZNujLdSrEdk3z4Z2oS65Ez6LM7HRsIyGJU
 LFhxWcYJ0s0Azyj4OFN3jaBlIsZcM4C+wRH8IA1L54gF0WVmKbwEi+m+ZID/AQtVvW7D
 /nuvNxqyV8d2Aq6A25337bV0n2EifN1hPaEtzb817EXNRh0XnLaBhtf7VSzJLF3ux2L0
 7oEjByqtLRlrKJzpeFWXw4U8w53itNEpg3J7OuSpPURsE1qh8a2cCCIJZ3CEGlL2ojjG
 NtjQ==
X-Gm-Message-State: AOAM531/sr+O5jyi+NN/71h4NE+sHpWQ48snQcSNwCf1cpAf7Z/Ni12y
 dIJ8/P5jU4C7vDMLrrdSZ9kn8fSDxL8u6Q==
X-Received: by 2002:a17:90a:fe0e:: with SMTP id
 ck14mr1773081pjb.80.1606277206639; 
 Tue, 24 Nov 2020 20:06:46 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/11] target/arm: Enforce word alignment for LDRD/STRD
Date: Tue, 24 Nov 2020 20:06:32 -0800
Message-Id: <20201125040642.2339476-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1gJJYAujQ5MO

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6d04ca3a8a..17883d00f4 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6458,7 +6458,7 @@ static bool trans_LDRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN_4 | s->be_data);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
@@ -6487,7 +6487,7 @@ static bool trans_STRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN_4 | s->be_data);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
@@ -6595,7 +6595,7 @@ static bool op_ldrd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN_4 | s->be_data);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
@@ -6634,7 +6634,7 @@ static bool op_strd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | s->be_data);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN_4 | s->be_data);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
-- 
2.25.1

