Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1735357ejc;
        Wed, 27 Sep 2023 03:19:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCN7Xf602AY4aKHGUSk3QLMhotQoxckHYQHdRxW5W1FZ6aIrZP4pIycwon+eU3mzW+KWOb
X-Received: by 2002:a05:622a:1a14:b0:418:bdf:f4d with SMTP id f20-20020a05622a1a1400b004180bdf0f4dmr1521688qtb.14.1695809972756;
        Wed, 27 Sep 2023 03:19:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695809972; cv=none;
        d=google.com; s=arc-20160816;
        b=ZmN1TxUDtJfl7uUMW7GVzP7YyqoJXSs3HM27NYBit/zZKxwmAirP5NopUyG4WD2vux
         Mx+yLUs8pFNry7lr1BBM4Yfx4zAgBMt/IBLakezzCIM6dCaY07g1dqsCUkvhaG/6s8dp
         YubCWn51Z4tfoFcYsNyio5G6jnlxVdGXhPC76ib+TT87aJs6kMweTfxkXgr+lXZEjhHG
         QWf15N05uNp+7km4wTXTQMUDr5yPkcL4n2tKkPpgVAAlEN4mnT5iUfYurWytn73XWztz
         yGzcAA585OtDtl1b0nR0agmh6wRVlTodg/0HEegplzaRZjXgbR8zAhR+P6UQWWpeuxHz
         UwbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ZZKsHEITqMChQMSdz1HXB6c9tibacP85Unu+w9XAuhQ=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=VVF4+P6pNacJn6y6dj/jRruvqI0MCCNLq4zcu9IVROKtsHlDpuAffQ5fB5we4gYfwV
         hF+J5byYx7oqKBqh9q1Ff5Ql6dcPutYRifxmt6oDkpgLboRBs0Hz5IpFZFaoAxgIPQXm
         IQoa2dMZGDmXrSaoV2NBOHsH2SIRDo6Y4HXmZOI5xWPy0iACbaScOp4WKU4qFzviuGB1
         md+Wthecm9W4/Mitm6IhG3Du5EuxIr/n2uUH0fwb4GubZzb5EAJ9ad/KzfjCLdRUPnTQ
         R1YNgfVVhYdbL0a4CgT2MY+wusn2b+h0MEk8djsgF0mN79h3dh46jKbRFicN1mkP+CNK
         tWPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=apKaU6pt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jz14-20020a05622a81ce00b00417fd10f754si6465657qtb.412.2023.09.27.03.19.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Sep 2023 03:19:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=apKaU6pt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlRdG-0002uY-FY; Wed, 27 Sep 2023 06:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qlRdE-0002tn-6l
 for qemu-arm@nongnu.org; Wed, 27 Sep 2023 06:19:00 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qlRdC-0008UX-B2
 for qemu-arm@nongnu.org; Wed, 27 Sep 2023 06:18:59 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32172f8a5dbso9075290f8f.3
 for <qemu-arm@nongnu.org>; Wed, 27 Sep 2023 03:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695809936; x=1696414736; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZZKsHEITqMChQMSdz1HXB6c9tibacP85Unu+w9XAuhQ=;
 b=apKaU6pt4ADqRatK/XQ0rX5dA/+jHavlhU3ceKnUoEdopUVrE9KqG1+RcXpIyRD0rA
 gEE4kOSoUra0OYOMGBAh1eIcNXQ0pFGy4XlZN5ZOkSxAsMp2Pf1Vz0YFG0fj1I9hoVUK
 E7BhacLqqKP76o7rnPT/p4yA6518GUa+ydcGYibDDEtAU+P3ex2e+wUF7CpolhUDD46q
 G3ZSHoVIDoe0o4qxhksClmA2ugADDm0MvVp71IfCvwNTFnSFDqyR36A9tFid4xBvRZYt
 mgDbbL8hLaIJ275yHK9BmdsvJHdixXTNW9qu+KiuEwgqPFQjpIDbFnywhnYn2QXiXKNc
 F4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695809936; x=1696414736;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZZKsHEITqMChQMSdz1HXB6c9tibacP85Unu+w9XAuhQ=;
 b=Fv075oT6Y0CTBnMwB9HzlCaVWHN5raNppq+BdLUzY6BH0Ygw2KALwtLXA2riqNCN+d
 3auWOKHQiVm7CdnG4ZE6G2LaToMHFRTDAVUNatPDrdY5SJx+aAEY6JLT++c4L3hE2w2Z
 QhpJo4Ef9o533yDdcZeZ5MhMx7KAuZ6CY2RMv/jot12Qu6xVYZxZ5JLkGzxLPVdGf+J/
 TyhPmhAqyxAh3Dq5C8sICHr5UMA4EGjwb8ud07lpkBWR+aAN1fzoW6uRJeve/D5Eewp5
 TTalkquLWpNwIH8Bb2cT3mfQ/6rhBhspBHudlQAgL9vcqH7gBak9utIFVIXn4yRN0FFc
 NU6A==
X-Gm-Message-State: AOJu0YwxElQ5w4u2cvJ+/I7hoTeCU3j2KHW6pATOIQed12lkJ1I/uQBk
 JO8Z4pxV+2AEnFxM7olR7Gw2DPDUyOq9af1mIlk=
X-Received: by 2002:a05:6000:12c5:b0:314:1f1e:3a85 with SMTP id
 l5-20020a05600012c500b003141f1e3a85mr1159604wrx.61.1695809935573; 
 Wed, 27 Sep 2023 03:18:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c3b8300b004053a6b8c41sm15789974wms.12.2023.09.27.03.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 03:18:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Permit T32 LDM with single register
Date: Wed, 27 Sep 2023 11:18:53 +0100
Message-Id: <20230927101853.39288-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: hd3/qcBDbsZK

For the Thumb T32 encoding of LDM, if only a single register is
specified in the register list this instruction is UNPREDICTABLE,
with the following choices:
 * instruction UNDEFs
 * instruction is a NOP
 * instruction loads a single register
 * instruction loads an unspecified set of registers

Currently we choose to UNDEF (a behaviour chosen in commit
4b222545dbf30 in 2019; previously we treated it as "load the
specified single register").

Unfortunately there is real world code out there (which shipped in at
least Android 11, 12 and 13) which incorrectly uses this
UNPREDICTABLE insn on the assumption that it does a single register
load, which is (presumably) what it happens to do on real hardware,
and is also what it does on the equivalent A32 encoding.

Revert to the pre-4b222545dbf30 behaviour of not UNDEFing
for this T32 encoding.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1799
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index d83a0e772cd..32a0fa1d1fb 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -7882,7 +7882,7 @@ static void op_addr_block_post(DisasContext *s, arg_ldst_block *a,
     }
 }
 
-static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
+static bool op_stm(DisasContext *s, arg_ldst_block *a)
 {
     int i, j, n, list, mem_idx;
     bool user = a->u;
@@ -7899,7 +7899,14 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
 
     list = a->list;
     n = ctpop16(list);
-    if (n < min_n || a->rn == 15) {
+    /*
+     * This is UNPREDICTABLE for n < 1 in all encodings, and we choose
+     * to UNDEF. In the T32 STM encoding n == 1 is also UNPREDICTABLE,
+     * but hardware treats it like the A32 version and implements the
+     * single-register-store, and some in-the-wild (buggy) software
+     * assumes that, so we don't UNDEF on that case.
+     */
+    if (n < 1 || a->rn == 15) {
         unallocated_encoding(s);
         return true;
     }
@@ -7935,8 +7942,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
 
 static bool trans_STM(DisasContext *s, arg_ldst_block *a)
 {
-    /* BitCount(list) < 1 is UNPREDICTABLE */
-    return op_stm(s, a, 1);
+    return op_stm(s, a);
 }
 
 static bool trans_STM_t32(DisasContext *s, arg_ldst_block *a)
@@ -7946,11 +7952,10 @@ static bool trans_STM_t32(DisasContext *s, arg_ldst_block *a)
         unallocated_encoding(s);
         return true;
     }
-    /* BitCount(list) < 2 is UNPREDICTABLE */
-    return op_stm(s, a, 2);
+    return op_stm(s, a);
 }
 
-static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
+static bool do_ldm(DisasContext *s, arg_ldst_block *a)
 {
     int i, j, n, list, mem_idx;
     bool loaded_base;
@@ -7979,7 +7984,14 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
 
     list = a->list;
     n = ctpop16(list);
-    if (n < min_n || a->rn == 15) {
+    /*
+     * This is UNPREDICTABLE for n < 1 in all encodings, and we choose
+     * to UNDEF. In the T32 LDM encoding n == 1 is also UNPREDICTABLE,
+     * but hardware treats it like the A32 version and implements the
+     * single-register-load, and some in-the-wild (buggy) software
+     * assumes that, so we don't UNDEF on that case.
+     */
+    if (n < 1 || a->rn == 15) {
         unallocated_encoding(s);
         return true;
     }
@@ -8045,8 +8057,7 @@ static bool trans_LDM_a32(DisasContext *s, arg_ldst_block *a)
         unallocated_encoding(s);
         return true;
     }
-    /* BitCount(list) < 1 is UNPREDICTABLE */
-    return do_ldm(s, a, 1);
+    return do_ldm(s, a);
 }
 
 static bool trans_LDM_t32(DisasContext *s, arg_ldst_block *a)
@@ -8056,16 +8067,14 @@ static bool trans_LDM_t32(DisasContext *s, arg_ldst_block *a)
         unallocated_encoding(s);
         return true;
     }
-    /* BitCount(list) < 2 is UNPREDICTABLE */
-    return do_ldm(s, a, 2);
+    return do_ldm(s, a);
 }
 
 static bool trans_LDM_t16(DisasContext *s, arg_ldst_block *a)
 {
     /* Writeback is conditional on the base register not being loaded.  */
     a->w = !(a->list & (1 << a->rn));
-    /* BitCount(list) < 1 is UNPREDICTABLE */
-    return do_ldm(s, a, 1);
+    return do_ldm(s, a);
 }
 
 static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
-- 
2.34.1

