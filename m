Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp662004lfr;
        Fri, 16 Apr 2021 12:19:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGUMPXnfjyg6DBIhynHSV3koYFuEKM73WM5Gt9WN9IZeAXP7CvUAUUyNF15fzeSLWSma0V
X-Received: by 2002:a05:6602:180c:: with SMTP id t12mr4792612ioh.109.1618600774888;
        Fri, 16 Apr 2021 12:19:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618600774; cv=none;
        d=google.com; s=arc-20160816;
        b=ZW8kddS3cyCC1gXmYNO8ch5zmbDHTwqs81ph7sw8ds2RQ+21CDqdtPvJ8lHoLnnadM
         5Ym/x3joNLWRzLMommqbJc9G9NB5qSXHw/onJA6Goxn9Uja72GHO1NiemZ4WIUXEeChR
         EZmJSeMq0tY7IZjyiL9DnokbRdJtgcZ/WBdwuCsIyDTgue3Nd9WJPXJZIeKdjs4gcbrz
         HwEti6NGCZD86fSm9JwrQ9BKMLqMVh/yZgBtMVengTIKKs23Vui+w4juLW4AFPGOVFjj
         AKWONRD6Z0P0vBEQjaFK4+9tuWp7MQXN+30xSG9v6xAxoG3lESCMZeWtimRa816WcAAA
         L5xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aHJm4yhflwYT0zFdnhDkesD7hVJG4+2l6Mj+AHEyIq8=;
        b=CsWK6w8gkak6CkxFvv66kTLodIYS3RQ8LiSk2ZbA/0vrafLn0Z7EBzXcqma86fqsfB
         Ko9pDgtmGmw1bi1BtOMeFSzJRxeguDyU6DauB3RCNXrrpFSzuTP1S1XfjchPQVrQKF3R
         sFlWmrR+m/k7CZ783zKKn0WQVqzjzFYCIRTMGh22BME7iIvzuH5awZeZFplRROm4dXfk
         dgz7O4jxZSlpTRcb0L1NT5NwBLXLHmhASSphbHaHUl0E5lbsUhy9yQGJdeoLFOYEssEP
         FMaCoT3euykwvyvE2+QCGUna5sUXiYUYoR+Cu0PhWjseYu0NKxKwxUt+EZQQp6/dy2pv
         9KfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nHrXZFf1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11si6153197iow.52.2021.04.16.12.19.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 12:19:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nHrXZFf1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXU06-000578-58
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 15:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTi7-000442-0B
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:59 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:33552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThc-0004Tl-TR
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:58 -0400
Received: by mail-pl1-x62c.google.com with SMTP id n10so3334477plc.0
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 12:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aHJm4yhflwYT0zFdnhDkesD7hVJG4+2l6Mj+AHEyIq8=;
 b=nHrXZFf1gghtBb9qtMWpo63WL8owrcPR5+vouErtFy9wQMzWy77IrXrwuWlT3YnErg
 95VOFeQBa0wVZT+b4SiUxp9+x3seqP1jOcLggxHSCDpYUGjuc0oc94qDvZmVKsYvXBXi
 qyDKfQ2+mpTi2vyb/b9dvJExQaH3LOjHDtunlnn4dbdaR6L90GQ9eEkoJ2H55NbTWmpb
 CvguinCNcSlFwdZweuU76WLU0UfF60D+KZ0csHtBIA5Lc+x3zJUKXDGQhfSAWDMQgY/6
 vMcCujie7cK9OjynbhVIssT+1N8uB7v8r7PBORANy+8EwVR/PzfMMoG/AHq5J0us/Kvr
 ahiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aHJm4yhflwYT0zFdnhDkesD7hVJG4+2l6Mj+AHEyIq8=;
 b=F+PoTE6+AzQV1uphZK1AbXQ4GYIqOHMB8lyB2S/iCK3RrL6f5RydQe55kPMh6KT4dP
 HS32rqne+P+fIev5usgA/4xbBkrQ7T8rq9ORosrJy/QuwmDLlcgJTX1qUQ7u7UcXlYNB
 D3H1RsuUCyhcIka1SCJPlmU5gOgpoaWaX+exIlzLn2s1yeDAzn7wirKZzR4TwWwAmFI4
 FaUFnxgPwTIip6wYQJLWblCl2eD0Y2kh4sRD6c7uztXinhIw4MF1DxC9zQULKuQjUCHt
 ZZUZdc8oh2H74+EnuVqgFUiEa5N/zrWXYUbmUc+ZRN8B6SH+Tb/ErecCbYp4evDzBMwC
 Y7cw==
X-Gm-Message-State: AOAM533BMpRaYMoyfX36Br4TWitmB+VWJWPezC/a9t61j0SU5qTyYtb5
 XkabF3vCYPkmFujYEnWQ2aKWww==
X-Received: by 2002:a17:90a:4381:: with SMTP id
 r1mr11700641pjg.214.1618599627423; 
 Fri, 16 Apr 2021 12:00:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 27/30] target/arm: Use MemOp for size + endian in aa64
 vector ld/st
Date: Fri, 16 Apr 2021 11:59:56 -0700
Message-Id: <20210416185959.1520974-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kqOiNeWB2ekq

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ac60dcf760..d3bda16ecd 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1146,24 +1146,24 @@ static void write_vec_element_i32(DisasContext *s, TCGv_i32 tcg_src,
 
 /* Store from vector register to memory */
 static void do_vec_st(DisasContext *s, int srcidx, int element,
-                      TCGv_i64 tcg_addr, int size, MemOp endian)
+                      TCGv_i64 tcg_addr, MemOp mop)
 {
     TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
-    read_vec_element(s, tcg_tmp, srcidx, element, size);
-    tcg_gen_qemu_st_i64(tcg_tmp, tcg_addr, get_mem_index(s), endian | size);
+    read_vec_element(s, tcg_tmp, srcidx, element, mop & MO_SIZE);
+    tcg_gen_qemu_st_i64(tcg_tmp, tcg_addr, get_mem_index(s), mop);
 
     tcg_temp_free_i64(tcg_tmp);
 }
 
 /* Load from memory to vector register */
 static void do_vec_ld(DisasContext *s, int destidx, int element,
-                      TCGv_i64 tcg_addr, int size, MemOp endian)
+                      TCGv_i64 tcg_addr, MemOp mop)
 {
     TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
-    tcg_gen_qemu_ld_i64(tcg_tmp, tcg_addr, get_mem_index(s), endian | size);
-    write_vec_element(s, tcg_tmp, destidx, element, size);
+    tcg_gen_qemu_ld_i64(tcg_tmp, tcg_addr, get_mem_index(s), mop);
+    write_vec_element(s, tcg_tmp, destidx, element, mop & MO_SIZE);
 
     tcg_temp_free_i64(tcg_tmp);
 }
@@ -3734,9 +3734,9 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
             for (xs = 0; xs < selem; xs++) {
                 int tt = (rt + r + xs) % 32;
                 if (is_store) {
-                    do_vec_st(s, tt, e, clean_addr, size, endian);
+                    do_vec_st(s, tt, e, clean_addr, size | endian);
                 } else {
-                    do_vec_ld(s, tt, e, clean_addr, size, endian);
+                    do_vec_ld(s, tt, e, clean_addr, size | endian);
                 }
                 tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
             }
@@ -3885,9 +3885,9 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         } else {
             /* Load/store one element per register */
             if (is_load) {
-                do_vec_ld(s, rt, index, clean_addr, scale, s->be_data);
+                do_vec_ld(s, rt, index, clean_addr, scale | s->be_data);
             } else {
-                do_vec_st(s, rt, index, clean_addr, scale, s->be_data);
+                do_vec_st(s, rt, index, clean_addr, scale | s->be_data);
             }
         }
         tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
-- 
2.25.1

