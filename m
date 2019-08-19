Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3194130wrs;
        Mon, 19 Aug 2019 15:09:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxa3N9X36s602OdC59O6gR5JWOsNhOysG4v4ipMOb0Aq5bNS1Z/JZMXxX8IRRENmkUzPMza
X-Received: by 2002:a17:906:bcf5:: with SMTP id op21mr23175345ejb.190.1566252556400;
        Mon, 19 Aug 2019 15:09:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566252556; cv=none;
        d=google.com; s=arc-20160816;
        b=mnw9yY1od1rBGtMjplht+QywiTgzSgLQLUdOEfaQmYs/vhHAM5CIQFo3q7kmaH4Lq/
         hgkUBmT0wWSUo7melmJyGnHHfLMA7G/N5Ab9qMEUTxvFNXa0qyj6Zhvb+FXda6+OLrXB
         vDH7M1g3Vmp+SKeSqnZ3qNC061Cz5+8J7/Hrv9JPkJV3+Fqp+HtCKUw/JTxnTdFnrK7t
         8rHrDyIT2L936JRiz1y/6q3Ylt3wZdaNRNaF80E6VEy3TdJji6ciF01hKncgVnnmqADP
         gAXIzeLJwwSfQ0EDzDJm0tO/rW0C30Di+jODp8xxcPbnhjN0QpBo7D4hwb86W7mSzjSi
         coNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=UChj47Tk8bdejdFnV6vdPORz5eDZg2iYcmHyUtBCb38=;
        b=OaGYjxSVtNPOk1d+ERGa44CMTIf3HHEdIureMqkiIbAfV+8aHu1gYMyqP4Ibsd4CVW
         jlClAlVZvfN7Wm4pWVpFBL8UWjjr4VlkyovtV/+tZSQMDL+Zx+OS0NWnZvRIfNR/mcgb
         hNTkKu51Me2T1eRdyBamjWy82mhWjR1rWue+jIEeXaXy/ZbQbZ+EXtduzNjbMgi8UgBw
         Uu1FV6zLWu/IbSam31AFkyngJQnOkWbriM5eCTIj9wuKcIy61+hIssgSv2dZEa6DzMbB
         Rf2nuLHaBtOjX+Lu2mKgx+gTjbgDSvpt1Z5ocXuPOe7EEOWOOSy/da5IfiTUMdHA0Cs0
         8aAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RsDh0VI+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17si2196608ede.279.2019.08.19.15.09.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:09:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RsDh0VI+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzppz-00011f-8L
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59643)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMh-0002T2-ET
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMf-0006ff-BI
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:59 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:46333)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMd-0006by-9Y
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:57 -0400
Received: by mail-pf1-x443.google.com with SMTP id q139so1933841pfc.13
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UChj47Tk8bdejdFnV6vdPORz5eDZg2iYcmHyUtBCb38=;
 b=RsDh0VI+3TDvB/NdPYoknfGk7dHH7mMgWZnrlQx6TlORcBl3SNwSFk9BBsiMp3M2GY
 Om2LJwKbLJt6cGvBZqChMgSAkn4kgKJHXGCerSPLw+Ml9quHO85AQtNyN0+s8TMaO0q/
 OHYq6FCGbgU/VsejmXBUQn9gzzTEdQp8A1rlbVNV1W9k1VwKI8X7CImNe3L4KKgh8Gnb
 2W4hRZMli+w2g/u0Fh9hn9JqFdaQ+/J2LZeYVDish/5S8POpFBotfRnp60YxnTfjSuSH
 SBH1Jr615WL2ZnfToOhjoiGoDURu71TsHPT/M4NPcV78fXXxb7n8JJOnDaUCjtKuAdhJ
 80dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UChj47Tk8bdejdFnV6vdPORz5eDZg2iYcmHyUtBCb38=;
 b=rafT0W9lh2tv0AWSDfadkRN05dlGmkvgWWd2EcVH0uP4qcSMZuM8ZJje1A4MKmVgnN
 6gOoDe8VqrxVeABQKj5Kxpna5VIp/MVGJbKA8HZaSy2lHp5d/N7/qkipOKixdPloY2LY
 LQWR+y51UsQqsCN659+KxLshAWC6YxT7MnTo1ZnumPu7bdAg8Xc5T0U++QnKclA5DlOW
 Gz0yJAtB1OFBAofM6q0Qlj1IvPSjd83VT7IqmKlZC0r804GaLsfu3AKFJkwf91FIvcuK
 q+ZvSizJ/SjAvwu8703E4FvBBmZjSqTdSr4En9/K9hHB+EBaiENP8EsSU3Jqw0AwvF4Q
 7ttA==
X-Gm-Message-State: APjAAAWESt46zTA3BfwvItX7tOXRaZ0feI0dr/kvpGu9sQZOghZronUb
 Ux2HTl+7dL0SX8UniLONQeLlufAEfLc=
X-Received: by 2002:a62:5250:: with SMTP id g77mr26780026pfb.158.1566250733306; 
 Mon, 19 Aug 2019 14:38:53 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:33 -0700
Message-Id: <20190819213755.26175-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-arm] [PATCH v2 46/68] target/arm: Convert T16 load/store
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
X-TUID: TCLqElQzJqR4

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 51 ++----------------------------------------
 target/arm/t16.decode  | 15 +++++++++++++
 2 files changed, 17 insertions(+), 49 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7c5769bd42..e19961fb6c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10745,55 +10745,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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

