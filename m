Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4288086ejc;
        Sun, 26 Feb 2023 21:26:54 -0800 (PST)
X-Google-Smtp-Source: AK7set/S36i+fHbu7wb+4j0DRPANjjSHN3KL4UOO90DOsf4GQIBnWtahJUfqRP0mzu6HMQNdWLqE
X-Received: by 2002:a05:6214:262f:b0:56c:25dd:f739 with SMTP id gv15-20020a056214262f00b0056c25ddf739mr45605721qvb.24.1677475614142;
        Sun, 26 Feb 2023 21:26:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677475614; cv=none;
        d=google.com; s=arc-20160816;
        b=sH7GkCvTWEEIGTXdb8TPQM1kCNPnRh2P17R31fHKgcCoeNRmC+OwBav559PMfbqQ6s
         1VkoJB0TRqyWi6tsMkmytl/VrG8lavJAy4QnxHm9yacjIRnyjKQQERMB/EO/uB39mk3q
         UkvC1yz5u4ymFcsBZh9EGToxpMmIPolw8vd5YMwAZC/GTGVjE4AspE5ySRhvl9y2sHyg
         aYRf9T8no/ESm5xsEaZIskoctmnqKwB9tZMyFHIDS3dekNmafZSRQNCoRmGw3lEQR5Y9
         HV6HuzuuUXi0pGT32HF9CCSXvTVFWbOxO/afkhfL1Tx/lMvlGBTUVFVpUlQ1jw9Igaj9
         9/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uAH8ikgVoM0tmsv4PlPVbF0wuX8FOHP0nhWlFFURJoY=;
        b=ssJiwv551NNFZ+gFT9NIu3OI6M5lL72j/iZfgXF+k2iR0DeQK9u8u0O77dQDE7F9PY
         CpZ1y1CPS4JDRnMsiXjl7qDsy12EMaurIQfJedl4E+mn5XFBsGuk2OAEBZIEgfZz/YsS
         fCgbauUo9U+Xv+as3xMXZhdcuaeP3Fh+aBoAIXGZDYeLvjUBVG+jBy35j24aO5X6FIo5
         AsFbLBBLnBShzMTKGEscD9nShKhOt//6K4a6acmBi55CCQ0j4CbardcHFC/dWwdy/A9z
         0IZ8Gs6YSf111JeQ2GBjokujdkY+Kn6YgURppt9A94p60/NL6dpPNpHP0FuZcHaXxZLC
         FVUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uY91TEym;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o1-20020a0cf4c1000000b0056facce1170si5238116qvm.393.2023.02.26.21.26.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:26:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uY91TEym;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW19-0006mo-W2; Mon, 27 Feb 2023 00:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW0z-0006hw-0k
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:25:35 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW0s-0007F9-5u
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:25:28 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so5040823pjp.2
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uAH8ikgVoM0tmsv4PlPVbF0wuX8FOHP0nhWlFFURJoY=;
 b=uY91TEymIvOROqCyc3f8T5/iDb+AgW5yzmpq+9/HL2VXkgh3cD2xHCIis+l9+xfnaw
 Y64FURVLiTm5hHKD3cvRUqdCcaK/Zku2JnD/VsmedcyosKTxeT6exqFyjp04Fu8itJdB
 IEiTFo/fS6NXoHrFxnx/lTlZW0XXQFPievCIi0i8Om9LXWjT1nexRIJldLei7SLHa/2v
 LXhKzPKjpK7iIhdjTPRMXBhzKVIMmxZJBFGkZWBHoAPFikomtDkVpHL6qgKkqwVF/GdQ
 dvR7sR3xDAoIEBtyhKg4QU8J8FmjcgR5PBQMBdd4GDtUN17jNKg4HGJnLphUsLynx9pY
 1wEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uAH8ikgVoM0tmsv4PlPVbF0wuX8FOHP0nhWlFFURJoY=;
 b=r6S1SAJVqzHKJqHsI1q3GflUrWjQ8oZslw3p8cBCpcfh6k9KlHmP4OP7pamRaNv9n0
 igXDN3W/YxoEHniVbO7LD63glKqIJEfVGmQ8teB6tchUbte7letLAqdfSyhFoIil/SnX
 EvW6hDnJCd1IQ+HpNMOny7S1o4W35FoUnG4u2j+cx3PbAapI4rF0tbSUhBEGG7XkBwQf
 lYHdewbaPvDjicStrEZ5pDYBPgD+mTN2VV34x2ym/ayiXMkUk77g+c3oElQLrkMaJSHn
 DY9Qa/THVkSEjXR5pUnhbtrVjbqnkrrXBliQes8crWXoZN8wZ1b3s7zKrAzyuXGvzNRy
 T7Ig==
X-Gm-Message-State: AO0yUKUeqKAut9DO4956qBT7jMNcqH6a4OADXuEu4vf/TuA5Vq/ptIHN
 9/UJUJsnYmHTPR4Q2s3SVTuoytqxIWEpy43BShg=
X-Received: by 2002:a17:902:db08:b0:19c:da7f:a234 with SMTP id
 m8-20020a170902db0800b0019cda7fa234mr11843415plx.67.1677475523774; 
 Sun, 26 Feb 2023 21:25:23 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:25:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 05/76] target/arm: Remove value_global from DisasCompare
Date: Sun, 26 Feb 2023 19:23:54 -1000
Message-Id: <20230227052505.352889-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-TUID: pB3msDo0CB1f

This field was only used to avoid freeing globals.
Since we no longer free any temps, this is dead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h | 1 -
 target/arm/translate.c | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 7f52f08c5e..db29e8d799 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -157,7 +157,6 @@ typedef struct DisasContext {
 typedef struct DisasCompare {
     TCGCond cond;
     TCGv_i32 value;
-    bool value_global;
 } DisasCompare;
 
 /* Share the TCG temporaries common between 32 and 64 bit modes.  */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index a0a298f8f7..f76a83b473 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -672,7 +672,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
 {
     TCGv_i32 value;
     TCGCond cond;
-    bool global = true;
 
     switch (cc) {
     case 0: /* eq: Z */
@@ -703,7 +702,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
     case 9: /* ls: !C || Z -> !(C && !Z) */
         cond = TCG_COND_NE;
         value = tcg_temp_new_i32();
-        global = false;
         /* CF is 1 for C, so -CF is an all-bits-set mask for C;
            ZF is non-zero for !Z; so AND the two subexpressions.  */
         tcg_gen_neg_i32(value, cpu_CF);
@@ -715,7 +713,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
         /* Since we're only interested in the sign bit, == 0 is >= 0.  */
         cond = TCG_COND_GE;
         value = tcg_temp_new_i32();
-        global = false;
         tcg_gen_xor_i32(value, cpu_VF, cpu_NF);
         break;
 
@@ -723,7 +720,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
     case 13: /* le: Z || N != V */
         cond = TCG_COND_NE;
         value = tcg_temp_new_i32();
-        global = false;
         /* (N == V) is equal to the sign bit of ~(NF ^ VF).  Propagate
          * the sign bit then AND with ZF to yield the result.  */
         tcg_gen_xor_i32(value, cpu_VF, cpu_NF);
@@ -751,7 +747,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
  no_invert:
     cmp->cond = cond;
     cmp->value = value;
-    cmp->value_global = global;
 }
 
 void arm_jump_cc(DisasCompare *cmp, TCGLabel *label)
-- 
2.34.1

