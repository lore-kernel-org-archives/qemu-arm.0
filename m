Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1167090wrp;
        Wed, 4 Sep 2019 13:31:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzxkQqpk0NhdkdvTTodK3PhsLDnnsF0DcIXspvemt9MG+OuVgmQB38/x364BdQTP09RL9Hf
X-Received: by 2002:ac8:67d4:: with SMTP id r20mr40538635qtp.215.1567629092032;
        Wed, 04 Sep 2019 13:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567629092; cv=none;
        d=google.com; s=arc-20160816;
        b=gAnZoTEIg4aCXsnrq6MH88ZkqUugEGLlsL4AulQCOeY1mv0cuc6FEYFEDWX9cQk1kQ
         9IpfiejBNETus+VsJRjv07l6eQnE53fL8uG4TtpMBJR/nSw4IbU7IfX/ERtRN6oxWokb
         DODct+nle4PvUcvk7ogqgUx6Expzc34VuvjChDbRIgM2KzFsr4PgjOTw4Pl4t1t57pd9
         /Dh1eSoB9bAWXD55dFtTg6N2NPDuR0Z6fmSjJj3ddEoIWrnPzQulHMgtq+YccinZ6zs1
         7qq+tPHkp7UzUSHe8oX3EJoIbAm4K3Be+gyqEzARGTabv+7cG/L+3PlONskQYL0Sx2RE
         tP5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ii0cMPAGKfEnN3ypyinsSm3eOg33D1bxwpstQorBMS0=;
        b=Q9DvE2tcpmIdyL4FXZQq2BKFpl9WrxRSXc/7bvVgAxYrHd6LQ5Lyz2YyVXC3Ks/yGE
         YSArzXj0SRTqy1oRwRT0VFNze2GiOjVcpRztmO02nTIrzySRzdZPP4J/Ssf3OJ/YDwKC
         ja6mr5XA34tgbFGlhXEy7EWXQMwdgA5H5ChA3zjtARmvuoeqrBP17UiW9O7UeNNHjaQR
         1l9GkMMfW61OKP9rYLSyBRKrEMMEFdUyQd42MBD36KlF8TDpigPgiJ2iBOhHBhDDG9mM
         PlEYxasapFHxb0bsEz9Ybr+KKF3Xw9urSuuNLjHS4AwvV/9Bdm9jYX0d8zw6+pqw93Lz
         cwJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rByK5jGY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v57si10758341qth.106.2019.09.04.13.31.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:31:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rByK5jGY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bwA-00007y-CG
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40965)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0h-0005LI-NY
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0d-0002xH-NV
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:05 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:37368)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0b-0002vP-MS
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:01 -0400
Received: by mail-pl1-x642.google.com with SMTP id b10so3691plr.4
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ii0cMPAGKfEnN3ypyinsSm3eOg33D1bxwpstQorBMS0=;
 b=rByK5jGYc/ZJLB+fjtlkHdpM4BB6ICctEcRr5PEmHeplJWMUo8/UWvzv+cxuxaa8qb
 Ska/jeRC8gUSce3U+RS7DEA06Avndg80DMjQyFu8jLlhWksFZShIG3xdgoql+U1o4uXR
 kRKXWvoQxjAyfkKW1QuxnajjoO6gCTfBfJhSUcZ97Rzo6ICPbcwV5o3UY1jDGCBZzC5j
 wPLGf+c0Kvd0EgQu0w10E8P1mTpf2/5N8mkGqH2IyluiqOmdyVaEXoD7iMQdr2SY9t3d
 0cJnV6QWlzpAVvqrY9wKewukBcCluDedcYhGBKd9nSSx09+qzK80Ut0bIa8F876PPQ9F
 x3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ii0cMPAGKfEnN3ypyinsSm3eOg33D1bxwpstQorBMS0=;
 b=doH/fNrtiW0L5A8xmr5unDo0oP7f5LkFRuIB8ojodrt+aT8vfIni0L6apO8Z16nUR1
 BnA+5rZ99IY34OUqZoQqc2OKyq0WrCNsa3CymwYte8tFD6BLWpkQUBz5muAsz2foYEnN
 Us4V54wGMwl0hB9mNDYrpgmg0RoQwWezus0gBjIQFQRKyEZabxSEhqAK4iMWrLVZsjkq
 sA+nMbKC8JyWy0+NYqd8rLcxS++dDqrTw8jwKXsnz9dQlrKEpbjm650eTHcdL1ygZGsu
 Lo708p7aKZqoWuoL8SY873vjmQk3XXygiYm1m0hQKKR6ywMi7YUuntxFRa/VhReYIex1
 4+4A==
X-Gm-Message-State: APjAAAVoAsA0sMTby3N6z4vcoyIZSah/WKMJt592GNLdNJMe+tDdX5iN
 RN7xPJAVAto9+pAFMiZ3K8LSFg==
X-Received: by 2002:a17:902:4581:: with SMTP id
 n1mr43266552pld.310.1567625520776; 
 Wed, 04 Sep 2019 12:32:00 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:37 -0700
Message-Id: <20190904193059.26202-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH v4 47/69] target/arm: Convert T16 load/store
 (register offset)
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
X-TUID: iDehgEpDpO2B

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 51 ++----------------------------------------
 target/arm/t16.decode  | 15 +++++++++++++
 2 files changed, 17 insertions(+), 49 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b77922f808..789abe9b87 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10864,55 +10864,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         goto illegal_op;
 
     case 5:
-        /* load/store register offset.  */
-        rd = insn & 7;
-        rn = (insn >> 3) & 7;
-        rm = (insn >> 6) & 7;
-        op = (insn >> 9) & 7;
-        addr = load_reg(s, rn);
-        tmp = load_reg(s, rm);
-        tcg_gen_add_i32(addr, addr, tmp);
-        tcg_temp_free_i32(tmp);
-
-        if (op < 3) { /* store */
-            tmp = load_reg(s, rd);
-        } else {
-            tmp = tcg_temp_new_i32();
-        }
-
-        switch (op) {
-        case 0: /* str */
-            gen_aa32_st32_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 1: /* strh */
-            gen_aa32_st16_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 2: /* strb */
-            gen_aa32_st8_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 3: /* ldrsb */
-            gen_aa32_ld8s_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 4: /* ldr */
-            gen_aa32_ld32u_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 5: /* ldrh */
-            gen_aa32_ld16u_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 6: /* ldrb */
-            gen_aa32_ld8u_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 7: /* ldrsh */
-            gen_aa32_ld16s_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        }
-        if (op >= 3) { /* load */
-            store_reg(s, rd, tmp);
-        } else {
-            tcg_temp_free_i32(tmp);
-        }
-        tcg_temp_free_i32(addr);
-        break;
+        /* load/store register offset, in decodetree */
+        goto illegal_op;
 
     case 6:
         /* load/store word immediate offset */
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 44e7250c55..83fe4363c7 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -23,6 +23,7 @@
 &s_rrr_shr       !extern s rn rd rm rs shty
 &s_rri_rot       !extern s rn rd imm rot
 &s_rrrr          !extern s rd rn rm ra
+&ldst_rr         !extern p w u rn rt rm shimm shtype
 
 # Set S if the instruction is outside of an IT block.
 %s               !function=t16_setflags
@@ -54,3 +55,17 @@ ORR_rrri         010000 1100 ... ...            @lll_noshr
 MUL              010000 1101 rn:3 rd:3          &s_rrrr %s rm=%reg_0 ra=0
 BIC_rrri         010000 1110 ... ...            @lll_noshr
 MVN_rxri         010000 1111 ... ...            @lll_noshr
+
+# Load/store (register offset)
+
+@ldst_rr         ....... rm:3 rn:3 rt:3 \
+                 &ldst_rr p=1 w=0 u=1 shimm=0 shtype=0
+
+STR_rr           0101 000 ... ... ...           @ldst_rr
+STRH_rr          0101 001 ... ... ...           @ldst_rr
+STRB_rr          0101 010 ... ... ...           @ldst_rr
+LDRSB_rr         0101 011 ... ... ...           @ldst_rr
+LDR_rr           0101 100 ... ... ...           @ldst_rr
+LDRH_rr          0101 101 ... ... ...           @ldst_rr
+LDRB_rr          0101 110 ... ... ...           @ldst_rr
+LDRSH_rr         0101 111 ... ... ...           @ldst_rr
-- 
2.17.1

