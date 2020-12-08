Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4245721lfb;
        Tue, 8 Dec 2020 10:18:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbeyOBFOC97FxGoxUlv/UPwMDNzjHSmwTiqetp67bIYF5DW4iijE7suGPhuJxGy0H80awP
X-Received: by 2002:a25:d014:: with SMTP id h20mr14470332ybg.149.1607451517630;
        Tue, 08 Dec 2020 10:18:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607451517; cv=none;
        d=google.com; s=arc-20160816;
        b=di5tEuf68pV8/tEpWL12LD9Ecju5dQ9GfsYounmvuWlsUnB0J9T6KM8gp5QHdxzLaa
         4xjogBHsmRSmSZ6KWwT6J9ZOYu29x+z7O9srLgcQ5xOQ8QdgoTYjzO+BqLP8e6lk84T9
         iwH0ZDsdomJpPFj2NgbxCDINmKp7LqM14Lv8znWxIeyE8vWEVqExG1hkortaM7vumLq0
         g1flCi2rggYWAxM/jZq3wGTtrkaiNYnA3uk5tUYs86FGOZ8yjBis0AuBctwikqF9JfUm
         kCpCiQHnZw1sV0/UH8cHH/tpm4TUr8unLPC0ylkRdjPihwAQk+GEPfM0QAhAfCF49tuq
         2NZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=toey/Gh1G1DJzpsLs7WlNkSOV2iyUSzl10bK1A4OJt8=;
        b=yipph0RwZYgOzemp5xsHka3QgPrCxiJNnktqK7MtzBdFIlpNWVcI0ZptEEDegv/4mZ
         j9EyG0pAQ/uUB6oXqSu5vyxXT3dmBY+scLq150lkOKx9cOp9Cgy/l8IfaAse8qZ4r45S
         G4zpogBa/cH/GJre8J+o76XoVAnX5ambni41Kbpc+h62g5Ozyxm8eN1/v8ImjSPKCkz2
         mTnU22SeCkdyzcwwOknRq2lqDsLfDq80pAIj3YYtQVBjUCXLzvR1R8C1idiGl46kDjOR
         G0NHUt6ZhDbVnm1jiUYl9muhoe7DDemsKHHRGEe9JPiI2em8TXIFtT+hK5XGRgBR9MBW
         J+gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X+43ehSX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si14918111ybb.239.2020.12.08.10.18.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 10:18:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X+43ehSX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmhZN-0007AX-1J
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 13:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJJ-0008CG-DE
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:02:01 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:33459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJH-0006QG-54
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:02:01 -0500
Received: by mail-oi1-x241.google.com with SMTP id d27so12781945oic.0
 for <qemu-arm@nongnu.org>; Tue, 08 Dec 2020 10:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=toey/Gh1G1DJzpsLs7WlNkSOV2iyUSzl10bK1A4OJt8=;
 b=X+43ehSXn9Sg7B+OUPjnZ6gHKUbqSWZ0oGJi0VFPyk/S9kUW/Zj1InEM56Y+oDjSqs
 0sZyWMGBxIXa1bvXj0Y5H3v4qVC2k69g9mpTsbqH5Gd9hrGrpGepMmU0hUBAm4JgolwA
 6ouB8HCX8G51WvRsPfS2u0Ysx1faVnNUp5OTqRlOdX1tiEWtSmEjolqqXiKl8A72cJR3
 vJRiWo5clIjpX3XIvL0IGdD6YL42WG0mpDbK/rkeYM0gDjWay8QPBNM1v6SY+Z07p1cM
 0KTtmyi3DZnJL/uBpmOKsKvhEiFClYTFKpI+aP084OpU97nMmZ6TUBErc87FSHVhGeUZ
 5Hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=toey/Gh1G1DJzpsLs7WlNkSOV2iyUSzl10bK1A4OJt8=;
 b=hbJKWgr4VRvw1WmeWO9kc78RV5pz6VblxJocfdqRfwppUmFdce37OX/Cgp2tO5dQUE
 H5xurGjihwzicbnjT3gurEvuu3bZgOiQNRvuoPPVCz8eVgvCFdaJK4YQ3UGFrT2xhe1/
 m980SDulFdlRLgIFa6z5I8bonz1h+bRwspvuxYLVVKjO9RccE/9YHNQ7hSq+M1aPFhyV
 6E16Tp4X2C4Xrd37XY730ZD99uUlOqwrTTionoLMk6CMNxeDaya/IWhcWOwk1D6F8Hxm
 01T2Zw7cgBvSuR1nd4drpdkLmRMOAGB0Epley0m62Jo5rBGEqs4UuWRn6tcKjaUV2yZw
 F8PA==
X-Gm-Message-State: AOAM532ZZIdsEyMiivFysPHHgIrudFf7IOqrvpZ7E4G4Rfkv5ywelR98
 AWfrYIDx5HCievau+AKFZtjYTBBP9ngUPlLx
X-Received: by 2002:aca:383:: with SMTP id 125mr3598440oid.122.1607450517995; 
 Tue, 08 Dec 2020 10:01:57 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/24] target/arm: Use MemOp for size + endian in aa64
 vector ld/st
Date: Tue,  8 Dec 2020 12:01:14 -0600
Message-Id: <20201208180118.157911-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
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
X-TUID: aS+beGR/BULy

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 67a9b3bb09..4395721446 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1140,24 +1140,24 @@ static void write_vec_element_i32(DisasContext *s, TCGv_i32 tcg_src,
 
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
@@ -3705,9 +3705,9 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
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
@@ -3856,9 +3856,9 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
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

