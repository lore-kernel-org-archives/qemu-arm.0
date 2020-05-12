Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1321724lfb;
        Tue, 12 May 2020 09:44:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypIxYAtphfbTFDjVhDd9hkY50BnXnDq3E956WQptglbdvLX/c02TdmXj/0pejlqnx9PG8xlw
X-Received: by 2002:a05:620a:2015:: with SMTP id c21mr22441539qka.176.1589301891015;
        Tue, 12 May 2020 09:44:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589301891; cv=none;
        d=google.com; s=arc-20160816;
        b=MfYntAH7fcQ9Xj/FqpoFcTc1nOjrTUj22ZY9GQoQM1bXV8Kva6x31orQFj+0nVoxP8
         ehh3IqyaMPEi47uw8+xtK6oa0NVpqNf16eFz2hsG76iAoFnm7GuDzTE5ic8RLvxXnyjU
         uvy/49NQeDeW95K9Da+v9TjrDzgzWqYAXvgaNRYCZEwN3XxSaybF2NqH7vbfQK6jViOh
         pDwN7VXmoRL2QFFkkalurli4qdRGGoTk3nzm/GSdD3+PUqGer67u1iBaVIEEk7in8fpP
         AU7zaNE0bN6O9pQih4yhGMhR7vgg4dV5C/wNdz7Gj8vr+3tk9igwd8sEKDtAklxCsEjg
         uDYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yPOdog2d2dwbfs28fCvHLLSNJsF30PqsU53nWUWzmY4=;
        b=UwXiShwSubijruhCxbvDaPdo/APt65WY6ISbhSUpfdDsQsD/zVHcQRh49brWPqdVaL
         aTHj9LfDbwL/QQ9kITOxDwZfMC2/qX8h0dLf695s7tgEsOlsRRW4bwl0qqZ1FY7EKWvN
         ZPqyYftCg7ujxRnG5KC97IWJkr2DORImJ9pZL6SB+QcWzw1YZNwBea5ADTkW9QC7pfjE
         RjMcFL6mQlDEmqII83MS8gkB0i35J++8Nk6CrrIWBif6/aqwqkhyEBUApSH7PaNwODhB
         uHaw11/xgL1sS6wpjpfHmfCPoBOeeHNjW3mwXz7ubCP0F6fHhQXzfbRHSz4cfVY2X2Fd
         gziw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iNkpzGLP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11si7635165qkf.35.2020.05.12.09.44.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 09:44:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iNkpzGLP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYY1S-0005oV-A8
	for alex.bennee@linaro.org; Tue, 12 May 2020 12:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXw6-0006Pf-51
 for qemu-arm@nongnu.org; Tue, 12 May 2020 12:39:18 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXw5-00066o-Av
 for qemu-arm@nongnu.org; Tue, 12 May 2020 12:39:17 -0400
Received: by mail-wr1-x441.google.com with SMTP id e16so16301489wra.7
 for <qemu-arm@nongnu.org>; Tue, 12 May 2020 09:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yPOdog2d2dwbfs28fCvHLLSNJsF30PqsU53nWUWzmY4=;
 b=iNkpzGLPqI/BguCb4PU0EiKPZ1SzO9fFeH/STZkGC1996Mnh4EAul17bthAghjtTqq
 i77JbCi0X79uEGcy26oHCu2lz1EIUml5KvMYDzQf27MdzSoWAJgeWxASN83XkMEZaxeQ
 45KcsNRWhVjgje4PPZrs+qslSm68hNUgvkONMVXiWRhHsd6f0zLtQZygWFLKj9pOfIMc
 DdvLGJwOVzya/roaY1TalX/gwSHAgihQxk27CtrR2MH0sq+nbKR9XDa3Tn7wRYo5pO4+
 OHNjr8ZlwoTyQQwy4gpSh8H//0eVJvc/PFE5S1drPpT+XF27oV4TjNjtsEGPrOBymjFo
 nA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yPOdog2d2dwbfs28fCvHLLSNJsF30PqsU53nWUWzmY4=;
 b=ujqjKlR6EzzupnDC7YXGARDzzE4GD3v+c2uSEuWg323rMBP/3U2FUgOy6xJ6f+YGia
 4wQ/wNts4nPJYMjraowJjRo4WG2WD6idRLg10FFOJg1gcnqb6WPbS0TupP3Eo20KEIhm
 8SUe47qXppl7OyyQX6FPLAf5NChZWFo0GeBk7ixT90cPepLYtZwTKncefMci3l2WtT27
 WynirFA0jX4rff+9/Qp87NRVRtrgVMFLxwlrukskCT1dYTjUrlhPsBSmbdejVdpR77su
 Wxv5NSPicHdzbBfYZlvHBZhonV33F2kJc0Pj6A521xRplhHqDREa0I0bDrM2hnSv6jg7
 YMMw==
X-Gm-Message-State: AGi0Pua7RrG2Onn9HWxJYU9PqQ67XatIg0P2OdvwjyoPcziBjsIjziO6
 DkheN51RiFwcfrjCXBQNCRB1Gucyua0LAA==
X-Received: by 2002:adf:ee87:: with SMTP id b7mr26448992wro.104.1589301555588; 
 Tue, 12 May 2020 09:39:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o205sm18525981wmo.32.2020.05.12.09.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 09:39:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 06/17] target/arm: Convert Neon VRHADD,
 VHSUB 3-reg-same insns to decodetree
Date: Tue, 12 May 2020 17:38:53 +0100
Message-Id: <20200512163904.10918-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200512163904.10918-1-peter.maydell@linaro.org>
References: <20200512163904.10918-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /TTB3AoDJq25

Convert the Neon VRHADD and VHSUB 3-reg-same insns to decodetree.
(These are all the other insns in 3-reg-same which were using
GEN_NEON_INTEGER_OP() and which are not pairwise or
reversed-operands.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-dp.decode       | 6 ++++++
 target/arm/translate-neon.inc.c | 4 ++++
 target/arm/translate.c          | 8 ++------
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 25c08a4170d..353cb1f4992 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -47,6 +47,9 @@ VHADD_U_3s       1111 001 1 0 . .. .... .... 0000 . . . 0 .... @3same
 VQADD_S_3s       1111 001 0 0 . .. .... .... 0000 . . . 1 .... @3same
 VQADD_U_3s       1111 001 1 0 . .. .... .... 0000 . . . 1 .... @3same
 
+VRHADD_S_3s      1111 001 0 0 . .. .... .... 0001 . . . 0 .... @3same
+VRHADD_U_3s      1111 001 1 0 . .. .... .... 0001 . . . 0 .... @3same
+
 @3same_logic     .... ... . . . .. .... .... .... . q:1 .. .... \
                  &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp size=0
 
@@ -59,6 +62,9 @@ VBSL_3s          1111 001 1 0 . 01 .... .... 0001 ... 1 .... @3same_logic
 VBIT_3s          1111 001 1 0 . 10 .... .... 0001 ... 1 .... @3same_logic
 VBIF_3s          1111 001 1 0 . 11 .... .... 0001 ... 1 .... @3same_logic
 
+VHSUB_S_3s       1111 001 0 0 . .. .... .... 0010 . . . 0 .... @3same
+VHSUB_U_3s       1111 001 1 0 . .. .... .... 0010 . . . 0 .... @3same
+
 VQSUB_S_3s       1111 001 0 0 . .. .... .... 0010 . . . 1 .... @3same
 VQSUB_U_3s       1111 001 1 0 . .. .... .... 0010 . . . 1 .... @3same
 
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 20f0f2c8d83..e9da47171c6 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -877,3 +877,7 @@ DO_3SAME_64_ENV(VQRSHL_U64, gen_helper_neon_qrshl_u64)
 
 DO_3SAME_32(VHADD_S, hadd_s)
 DO_3SAME_32(VHADD_U, hadd_u)
+DO_3SAME_32(VHSUB_S, hsub_s)
+DO_3SAME_32(VHSUB_U, hsub_u)
+DO_3SAME_32(VRHADD_S, rhadd_s)
+DO_3SAME_32(VRHADD_U, rhadd_u)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2c842df4451..ebb899d846e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5435,6 +5435,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         case NEON_3R_VSHL:
         case NEON_3R_SHA:
         case NEON_3R_VHADD:
+        case NEON_3R_VRHADD:
+        case NEON_3R_VHSUB:
         case NEON_3R_VABD:
         case NEON_3R_VABA:
             /* Already handled by decodetree */
@@ -5517,12 +5519,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             tmp2 = neon_load_reg(rm, pass);
         }
         switch (op) {
-        case NEON_3R_VRHADD:
-            GEN_NEON_INTEGER_OP(rhadd);
-            break;
-        case NEON_3R_VHSUB:
-            GEN_NEON_INTEGER_OP(hsub);
-            break;
         case NEON_3R_VQSHL:
             GEN_NEON_INTEGER_OP_ENV(qshl);
             break;
-- 
2.20.1

