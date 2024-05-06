Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1271374ejc;
        Sun, 5 May 2024 18:10:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWl0aQQlPeyoDhamMF1G+oJoUddM4M4dmdGY4PNXOqLbJ6lUahI8Vo09xea0i9q13K9R7ySUNe0N1o1ZNA53de9stFp2zJJ
X-Google-Smtp-Source: AGHT+IFdFsWKZuEF/gILwNdBaIXwevXyw8UsZ8WYt9WCV5QocHvIKomyiAF5YhRBeK9m4JyJvjyY
X-Received: by 2002:a05:620a:8c9:b0:792:9e51:c839 with SMTP id z9-20020a05620a08c900b007929e51c839mr176014qkz.40.1714957803084;
        Sun, 05 May 2024 18:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714957803; cv=none;
        d=google.com; s=arc-20160816;
        b=E3mKcws6PKNDk7MSIvRbw+PP3DvRySxB7SLPJObaahtsEuw/mIBMeXC9+MWBHUA07I
         0Z7+4wERNQDNFGWLIP4im6PJtePzcAJX84ZKrSZeqJRoyuIfg0Li5iqgYo5ljD6qO/BQ
         LtvAB8j8h8xowDrwmXEYeSHoOupTOZh9m4VXEDBWfOog0SV/SoubZ7Z8s95wI5nBWMz6
         Xu/4HV3BeQM2IRny/spLkfAJbIfAsYS9YtLE8UjT4ak2bSb9AStdLH+zvPPnhYaZvOnM
         N/6DtVAFgkfexILwFfUEeeBzT2vOXMZp22klrFt3XaaIECCIMnSCBsU+QnkUa4QWX7o4
         QaiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=C4/5h0uAx53XUsvwPgdWXSBuiPt7UhAYW1dXswvw8E8=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=phSD8xp+MfAweRos9IlPRhO/qdHj5+fvZ0qTGEoUdFtqWXkFy7ZKXeZFggDqqBeS9z
         LtWrRlII4kzGKMIbFYlsMDZWoqjE+zQjfo6v03eACUZyzrmKr9T+eIsVN3iuqAcil1oM
         U1WrBesofMtMGOp+9CZQtIkAge87wCE97A6Q12Qft9aVuLV0dNp/5/juSKmYFfXPqZZx
         ByA8GyQ42DT+lrVIu1e5xCZ5ohPH5UxsoeZ21CRHWgDGIQUjw1g/k0Q0/OV0g//zEGpt
         Tdkl1LOUj9PcCbhqx5yC7gX4t2gLgkucyt4UTUr8HUM6y7/f4yy0XyarjYG0vvyWqp4t
         zbRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UIGo8mPZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020a05620a400d00b007929125fa67si3267766qko.118.2024.05.05.18.10.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:10:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UIGo8mPZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s3mqa-0003E8-99; Sun, 05 May 2024 21:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mps-0008Be-Pl
 for qemu-devel@nongnu.org; Sun, 05 May 2024 21:08:12 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mpZ-0003NP-71
 for qemu-devel@nongnu.org; Sun, 05 May 2024 21:07:57 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6edc61d0ff6so1374044b3a.2
 for <qemu-devel@nongnu.org>; Sun, 05 May 2024 18:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957668; x=1715562468; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C4/5h0uAx53XUsvwPgdWXSBuiPt7UhAYW1dXswvw8E8=;
 b=UIGo8mPZA6nWaiNLMKZNRFAXfQe1uUxtiZ+2WgP+Pic1vAu/KAx0hQJ6jvn//gl35k
 F4o/Oc+j5ewY3dtgyEqlB2vu9cSrwBxENUsxAF+g1p0jHhWVdo+RS6cKEsJjlXCIHYcp
 HQjTdK/8uVeAKMEFdlO84knSxjhbD2EKwG7xkr3m0TkVjFdlnnogxBHivbxJn7lUAmA9
 dDBE6nvz8gO+IBQzVk4of3QzOqjr+viSfa1GhhH/ZKQ5RDmtMAW+TfpC63DAMSaKcGom
 nVOxmP/Trwpdv+W+r4oS+7qzbTUSM2GYl0z3tkIFrBVxvk+p2PdAisX4Rt2erNLMslX5
 7MwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957668; x=1715562468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C4/5h0uAx53XUsvwPgdWXSBuiPt7UhAYW1dXswvw8E8=;
 b=n8oBKmhJMOObbung5VlN0EnLwzlFEPkjqVkYOZfpBaImPsEAYA3XTQkQzqmRoBdzxA
 6ON85umnh7C64eIiMi4qR0J6ZM/SMQc0xnFoy0TBdTHN/ZmhjHG83+DZabj3rhSfYFZP
 XJwhKXp12y36r8MB8FSEBKHOHHMFOI5TCmJ8gcsleZjOkTsMdIHB6MWTU817ZBB1QsqW
 OtMXeQOlDAxcYbXJ3TbWBlcS1OJbyxhxac0IUCffKIFyh2Rp5D1ZygB9qHpoGI1ROLWx
 kcxA87+gr8n3G2qDKmjUX1LYTU+WyoYU75B88OOkuVyp4USbmmcPfSpe4ec4CsXbvaLA
 eb3A==
X-Gm-Message-State: AOJu0Yx8OMnKrVEJW+MdxTR532F8W6L/AqzS+LEqGUxC6aOIAc1ZYPFv
 +rdfh/boVvT+62Naav0rge1oy3Uie8LC/7Bdi3dnCNiyNFP+YwKCi5aFzy27cX6pdlFdBxMnTcG
 1
X-Received: by 2002:a05:6a00:3916:b0:6ea:dfbf:13d4 with SMTP id
 fh22-20020a056a00391600b006eadfbf13d4mr10055359pfb.18.1714957667907; 
 Sun, 05 May 2024 18:07:47 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 kp4-20020a056a00464400b006e580678dfbsm6577287pfb.193.2024.05.05.18.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:07:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 51/57] target/arm: Convert SRHADD, URHADD to decodetree
Date: Sun,  5 May 2024 18:03:57 -0700
Message-Id: <20240506010403.6204-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1qXkqf1tymBt

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  2 ++
 target/arm/tcg/translate-a64.c | 11 +++--------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 80c4c650c9..fc8a5ca14f 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -916,6 +916,8 @@ SHADD_v         0.00 1110 ..1 ..... 00000 1 ..... ..... @qrrr_e
 UHADD_v         0.10 1110 ..1 ..... 00000 1 ..... ..... @qrrr_e
 SHSUB_v         0.00 1110 ..1 ..... 00100 1 ..... ..... @qrrr_e
 UHSUB_v         0.10 1110 ..1 ..... 00100 1 ..... ..... @qrrr_e
+SRHADD_v        0.00 1110 ..1 ..... 00010 1 ..... ..... @qrrr_e
+URHADD_v        0.10 1110 ..1 ..... 00010 1 ..... ..... @qrrr_e
 
 ### Advanced SIMD scalar x indexed element
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 87b86b7c54..b707c6ae4d 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5459,6 +5459,8 @@ TRANS(SHADD_v, do_gvec_fn3_no64, a, gen_gvec_shadd)
 TRANS(UHADD_v, do_gvec_fn3_no64, a, gen_gvec_uhadd)
 TRANS(SHSUB_v, do_gvec_fn3_no64, a, gen_gvec_shsub)
 TRANS(UHSUB_v, do_gvec_fn3_no64, a, gen_gvec_uhsub)
+TRANS(SRHADD_v, do_gvec_fn3_no64, a, gen_gvec_srhadd)
+TRANS(URHADD_v, do_gvec_fn3_no64, a, gen_gvec_urhadd)
 
 static bool do_cmop_v(DisasContext *s, arg_qrrr_e *a, TCGCond cond)
 {
@@ -10917,7 +10919,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
             return;
         }
         /* fall through */
-    case 0x2: /* SRHADD, URHADD */
     case 0xc: /* SMAX, UMAX */
     case 0xd: /* SMIN, UMIN */
     case 0xe: /* SABD, UABD */
@@ -10943,6 +10944,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
 
     case 0x0: /* SHADD, UHADD */
     case 0x01: /* SQADD, UQADD */
+    case 0x02: /* SRHADD, URHADD */
     case 0x04: /* SHSUB, UHSUB */
     case 0x05: /* SQSUB, UQSUB */
     case 0x06: /* CMGT, CMHI */
@@ -10962,13 +10964,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x02: /* SRHADD, URHADD */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_urhadd, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_srhadd, size);
-        }
-        return;
     case 0x0c: /* SMAX, UMAX */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
-- 
2.34.1

