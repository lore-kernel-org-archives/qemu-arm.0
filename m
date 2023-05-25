Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp788151ejb;
        Thu, 25 May 2023 16:27:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4IHP/+eX5WfVn7DHXo9sha88QUH1jY0bhZA/2HJ1ztnbgSk7n8FDtIDzuUSepJ4P6eZCxu
X-Received: by 2002:a05:620a:6746:b0:75b:23a0:dec2 with SMTP id rq6-20020a05620a674600b0075b23a0dec2mr296342qkn.64.1685057246241;
        Thu, 25 May 2023 16:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685057246; cv=none;
        d=google.com; s=arc-20160816;
        b=JWyqmYhVFgjp0lkJtfjcL4tQVLZXpgxkIrO2F7BhDoCocky0zDuCfNNOGK1gtnHI9U
         G71Bzt+cpK6AHEnsnh3Wydq3jng576XNxEVyc11PCgO6pXN9ifGXe2Y/x9IrQeKT+wAC
         KHk/aJzUk0Eax/DS4oEeFM4td/0nCnjxyjTE/jAqFQpCq7QKeBl9pOLQySQj0EvJ7YBN
         CCw521VESi/7KhcDciR+L1n02EiIqqYRzQnNJvUiQq8wvT9hbN8SoJaubKK/z4olA0Lu
         AjxrFYVky/l8bImPBxX36+VeFWhg8fIRWIpWw2AMhQ+mYwwi/tecz1zXoY2YCTXmJZ+z
         8+QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=reNglzojAm/2eSC7ZTJRnNXnyOyaPQoOTSyZDoXpgF4=;
        b=eKP+wO2vcIK43W/cLkYG2iJ6L0XYNQRJbrAfPJY4j6oKkvD846MpuSeZ6zW+wQb1xK
         7yxuPLX97zsVuum11+5hkkaPUCv0oNGhP53tMIJDnLHsvZxFEHjkWp8nTuV6fEBRQs80
         OrUKG38NkZnaNcJlD+rmB8cMf7vfszmusd/J/wLjwkIL5QV08JwwGiZzxgTY0cP8brq+
         8BuPz0O26fUlyoZbDNtDd01Ttu3K/1LutWW/QosOIgAiqbTGqHYZg0AzcqgXAhf8lJwy
         otkg8NniV9ejJ308joKeYEWxuKppmutbL9rxqr4aRbXejAugxhT6C7ceLDVTHi+ZNKo3
         67pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ttAFYgjU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3-20020a05620a034300b0074e1ee30485si945330qkm.16.2023.05.25.16.27.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 16:27:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ttAFYgjU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q2KLa-0005rj-SE; Thu, 25 May 2023 19:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2KLV-0005n0-AQ
 for qemu-arm@nongnu.org; Thu, 25 May 2023 19:26:13 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2KLO-0005lR-Mt
 for qemu-arm@nongnu.org; Thu, 25 May 2023 19:26:10 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1ae4baa77b2so939665ad.2
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 16:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685057163; x=1687649163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=reNglzojAm/2eSC7ZTJRnNXnyOyaPQoOTSyZDoXpgF4=;
 b=ttAFYgjUID5bqCY5HC/r3gQuI2aI9gNe+jagFjsluF337n7Lf025YSJ641UTid+hDq
 n6/IHd4juVDXp7WaoZR3Jov4xLHTDmKc86LHJoyhpht2wY7opNAiHeta9TDyBoclnLNX
 ueelr0BKoY8DHmyarT2HP7zYAypka3JN0rLCjfl5Q+JaoUkpybcNWxDEYjRNlhJ96aST
 UREOucQlIuTC49VvzkGm7N23bxtt3jkSrLaWM2PoRBj+IQxP6QwnY0cYCuB43G9T81MT
 brPPmXsF2YTRhWvKah0dao4f1cmovQjWFcVp5xjnnhFWauiJ9DKbU7h+jNRx6CYBz1GG
 CDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685057163; x=1687649163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=reNglzojAm/2eSC7ZTJRnNXnyOyaPQoOTSyZDoXpgF4=;
 b=jA6lwx3JU2uui7EWOeyQ5SAxQ4w2AnG0WU1clwQcopJ40V0f98dYUWcESr4Ot3rYH1
 SgusESh7iqTbsilvcNQmYwcn7gAj59Ocs3loiA87+yyH9UuSbpdXakmoZMsa48AkoFLT
 CtpmRVxUWEYeSKwqKHlXk7ZD75LHeRebVnmkUwjdY09kiLYTjNfDYfXSplkQaQWrae64
 kWnxYoAaKwpp1ny0mFO19Ikk+qFVxHBXdniI1kNNrBlenM6bGJeZ6GHwGsEsmsM4Dyql
 2E7AIq/RA3uwDvAScnjbWznt2JqyVHQbKzTyFT1YeFcJnzWR7Va+p1jm2aVA1kp5Z2xj
 2Gug==
X-Gm-Message-State: AC+VfDyY6VPG+uJJEFat+14MqGgzeX4cqQgQao9i8+WgYkEsFIwdKpsl
 mQTawwDpYT5h7ggJmvntVYfLGgUFFvVCl4X/rec=
X-Received: by 2002:a17:902:d2c9:b0:1a9:90bc:c3c6 with SMTP id
 n9-20020a170902d2c900b001a990bcc3c6mr464591plc.16.1685057162943; 
 Thu, 25 May 2023 16:26:02 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:7ac5:31cc:3997:3a16])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a170902ea0f00b0019e60c645b1sm1885036plg.305.2023.05.25.16.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 16:26:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 04/20] target/arm: Use tcg_gen_qemu_ld_i128 for LDXP
Date: Thu, 25 May 2023 16:25:42 -0700
Message-Id: <20230525232558.1758967-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525232558.1758967-1-richard.henderson@linaro.org>
References: <20230525232558.1758967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
X-TUID: iTeoYM3ypgY/

While we don't require 16-byte atomicity here, using a single larger
load simplifies the code, and makes it a closer match to STXP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 967400ed68..0e720f2612 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2398,14 +2398,14 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
                                TCGv_i64 addr, int size, bool is_pair)
 {
     int idx = get_mem_index(s);
-    MemOp memop = s->be_data;
+    MemOp memop;
 
     g_assert(size <= 3);
     if (is_pair) {
         g_assert(size >= 2);
         if (size == 2) {
             /* The pair must be single-copy atomic for the doubleword.  */
-            memop |= MO_64 | MO_ALIGN;
+            memop = finalize_memop(s, MO_64 | MO_ALIGN);
             tcg_gen_qemu_ld_i64(cpu_exclusive_val, addr, idx, memop);
             if (s->be_data == MO_LE) {
                 tcg_gen_extract_i64(cpu_reg(s, rt), cpu_exclusive_val, 0, 32);
@@ -2415,21 +2415,30 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
                 tcg_gen_extract_i64(cpu_reg(s, rt2), cpu_exclusive_val, 0, 32);
             }
         } else {
-            /* The pair must be single-copy atomic for *each* doubleword, not
-               the entire quadword, however it must be quadword aligned.  */
-            memop |= MO_64;
-            tcg_gen_qemu_ld_i64(cpu_exclusive_val, addr, idx,
-                                memop | MO_ALIGN_16);
+            /*
+             * The pair must be single-copy atomic for *each* doubleword, not
+             * the entire quadword, however it must be quadword aligned.
+             * Expose the complete load to tcg, for ease of tlb lookup,
+             * but indicate that only 8-byte atomicity is required.
+             */
+            TCGv_i128 t16 = tcg_temp_new_i128();
 
-            TCGv_i64 addr2 = tcg_temp_new_i64();
-            tcg_gen_addi_i64(addr2, addr, 8);
-            tcg_gen_qemu_ld_i64(cpu_exclusive_high, addr2, idx, memop);
+            memop = finalize_memop_atom(s, MO_128 | MO_ALIGN_16,
+                                        MO_ATOM_IFALIGN_PAIR);
+            tcg_gen_qemu_ld_i128(t16, addr, idx, memop);
 
+            if (s->be_data == MO_LE) {
+                tcg_gen_extr_i128_i64(cpu_exclusive_val,
+                                      cpu_exclusive_high, t16);
+            } else {
+                tcg_gen_extr_i128_i64(cpu_exclusive_high,
+                                      cpu_exclusive_val, t16);
+            }
             tcg_gen_mov_i64(cpu_reg(s, rt), cpu_exclusive_val);
             tcg_gen_mov_i64(cpu_reg(s, rt2), cpu_exclusive_high);
         }
     } else {
-        memop |= size | MO_ALIGN;
+        memop = finalize_memop(s, size | MO_ALIGN);
         tcg_gen_qemu_ld_i64(cpu_exclusive_val, addr, idx, memop);
         tcg_gen_mov_i64(cpu_reg(s, rt), cpu_exclusive_val);
     }
-- 
2.34.1

