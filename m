Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1443398ejb;
        Mon, 4 Sep 2023 09:13:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+Tu5aZBHdB6zmSZxOn71vjb+7beEXPgOddmxUOVaTBXQzsDa6WqHGf6DBDUxUG+o/5Eco
X-Received: by 2002:a05:6808:180f:b0:3a7:25c6:7b85 with SMTP id bh15-20020a056808180f00b003a725c67b85mr11882280oib.47.1693843991026;
        Mon, 04 Sep 2023 09:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693843991; cv=none;
        d=google.com; s=arc-20160816;
        b=W10zAShM1zV0pOwPdo8o3mQZeH/zjya99L/+euCkVxvu9RN2kXppT32Cu2CrWYaCQA
         Fy2FU43ReW4fXFmQZXrlJI11SMamzNAzaMW4QQlCVql+pfQwwCIC25uNaBX2YKC8gfuk
         OB7sk4J/rQdcV1eXkn5V7JzuJG8hEdOzTWIaEU1OUcByiVxaSmt6wIc4xvHxyO1B+4NN
         XJ5S9DNaRb+UmCts+H7cSRaWmBSoFAGc7TJjEPXhAGg7jM7Q/f0qpYMPaYzWVVis3Pm5
         F19MTLBxYADW+CD7APIfABut55LnKtMtE6SNuV3xJDakw1LZ1Np5AiO2g+nUBCPWlr+d
         vWHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=N90SnBdmWSypsr8O7NL02X7WPwcEDQupIGJmLBYDN2o=;
        fh=Ht9fe80UlXDtmadWXCaW/DF3K9q409zZ9r8h2aDhtZU=;
        b=IHXMwoLuFoHgCg0tgZWp3o6C0pHzJw++wzMH9AR/1zTHvRMtu1T4zLe8Fv+kRCUuXx
         Ij3cbs01NbVM6t0kAP1unVxelRJSC5R9l99c5PxkyovAq2R2vUFIDCigt6cKtxJBRmQD
         JSGEE7Kl6U4h5ydkc+y6ZoJcJOglYZ0rQj/ZriqztEZ0WvMjyVZBMSUlN534Scpb/czN
         qgK0C89vPJL4UP15bMFhtjYP4plZVxmW4zpHNGbzypToETv4jFsVebnI5tGd75uUIl+r
         Tcl5VcN22BIXDbf1rdi2aRgXj1KKcbeq98Fx5Xe17p0CuzLhDeZ/ekYXYLONVBjbZCbf
         Fqiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H7ice2gd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l1-20020a05622a174100b00410ac15cbf6si6588856qtk.456.2023.09.04.09.13.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:13:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H7ice2gd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCC1-0002GX-Ch; Mon, 04 Sep 2023 12:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCC0-0002G6-9A
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:12:48 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCBy-0007RK-0k
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:12:48 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-99bed101b70so250346766b.3
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 09:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693843964; x=1694448764; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N90SnBdmWSypsr8O7NL02X7WPwcEDQupIGJmLBYDN2o=;
 b=H7ice2gdLrYkndQFf6HXp/i52qTzrPChBhIFAvkOPA4PvR2kvlo4cpZ5hRKqpqnyFM
 nJmYmHPK5Ns9f86wqf8gIE0/svIEwXhLDNFNxTh+dLcig7Ch9GHRZtFyOurfGPG5o4ds
 SWf6RGBvzF+ep+u7JIwVI0RZblPpVoBWOZ99GaeksknIgiFf0jP5T9Ejh6DcVuTIuTLP
 a4hUKo4y3YQnTg2tdn5lN3qVjJs4B2obC9b497KVQk/aGXJ4Zg8RbMz/dGIGHpkmi3GS
 /gQRudJCGL+S2uU40sFYg/2OM6xNKlB1kAxAADYJXliRpzYBeRtgbalYGNBzeNydab0Q
 FKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693843964; x=1694448764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N90SnBdmWSypsr8O7NL02X7WPwcEDQupIGJmLBYDN2o=;
 b=TmrbOyfiCqaZiKpUMF0XEm6ecP6IRO3UnJb2VYJMQ6MSv0njiqQxdThiu1E8nbwnRy
 fuZXrD7xje7slvq+VKuRHVDUi1gY6DwD5Q9H8tOTGAGWtc47xFOXAiqJdcDXiJHxz7MA
 FfEMvzzFpvRGpQzl/uAeotxREYUhOtkm+nf1gOjkUSgQkH1Ni9XD0/+d1R+prVLKvWMz
 yG4CDh7MMWAljqIqglqC7I8+MuYK8aWyndw+mPiGwnzzeL6iShmDkZ8HJ8kkolV2fIcg
 BAHE+0jjZvN5FNoaqMu9nzXMYN6XgC9ye5rXdnRQy5ApBj+uXkeXEnTjczyHTwRAPoJK
 YABA==
X-Gm-Message-State: AOJu0Yywvlx8g7hJ0S1MHMet39z3byjcnZFZIusVWWBcqAkcYmZDQ2fP
 3j9J1FHZOp3qH17xjwV5w7zCVg==
X-Received: by 2002:a17:907:7759:b0:9a5:7e64:5c55 with SMTP id
 kx25-20020a170907775900b009a57e645c55mr8578981ejc.22.1693843964090; 
 Mon, 04 Sep 2023 09:12:44 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 gj17-20020a170906e11100b0098921e1b064sm6368723ejb.181.2023.09.04.09.12.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Sep 2023 09:12:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 01/22] tcg: Clean up local variable shadowing
Date: Mon,  4 Sep 2023 18:12:13 +0200
Message-ID: <20230904161235.84651-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904161235.84651-1-philmd@linaro.org>
References: <20230904161235.84651-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 6TbqGD0MYOF9

Fix:

  tcg/tcg.c:2551:27: error: declaration shadows a local variable [-Werror,-Wshadow]
                    MemOp op = get_memop(oi);
                          ^
  tcg/tcg.c:2437:12: note: previous declaration is here
    TCGOp *op;
           ^
  accel/tcg/tb-maint.c:245:18: error: declaration shadows a local variable [-Werror,-Wshadow]
        for (int i = 0; i < V_L2_SIZE; i++) {
                 ^
  accel/tcg/tb-maint.c:210:9: note: previous declaration is here
    int i;
        ^

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/tb-maint.c |  3 +--
 tcg/tcg.c            | 16 ++++++++--------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index c406b2f7b7..f1cf3ad736 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -207,13 +207,12 @@ static PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
 {
     PageDesc *pd;
     void **lp;
-    int i;
 
     /* Level 1.  Always allocated.  */
     lp = l1_map + ((index >> v_l1_shift) & (v_l1_size - 1));
 
     /* Level 2..N-1.  */
-    for (i = v_l2_levels; i > 0; i--) {
+    for (int i = v_l2_levels; i > 0; i--) {
         void **p = qatomic_rcu_read(lp);
 
         if (p == NULL) {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 620dbe08da..6e2cf52802 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2548,21 +2548,21 @@ static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
                 {
                     const char *s_al, *s_op, *s_at;
                     MemOpIdx oi = op->args[k++];
-                    MemOp op = get_memop(oi);
+                    MemOp mop = get_memop(oi);
                     unsigned ix = get_mmuidx(oi);
 
-                    s_al = alignment_name[(op & MO_AMASK) >> MO_ASHIFT];
-                    s_op = ldst_name[op & (MO_BSWAP | MO_SSIZE)];
-                    s_at = atom_name[(op & MO_ATOM_MASK) >> MO_ATOM_SHIFT];
-                    op &= ~(MO_AMASK | MO_BSWAP | MO_SSIZE | MO_ATOM_MASK);
+                    s_al = alignment_name[(mop & MO_AMASK) >> MO_ASHIFT];
+                    s_op = ldst_name[mop & (MO_BSWAP | MO_SSIZE)];
+                    s_at = atom_name[(mop & MO_ATOM_MASK) >> MO_ATOM_SHIFT];
+                    mop &= ~(MO_AMASK | MO_BSWAP | MO_SSIZE | MO_ATOM_MASK);
 
                     /* If all fields are accounted for, print symbolically. */
-                    if (!op && s_al && s_op && s_at) {
+                    if (!mop && s_al && s_op && s_at) {
                         col += ne_fprintf(f, ",%s%s%s,%u",
                                           s_at, s_al, s_op, ix);
                     } else {
-                        op = get_memop(oi);
-                        col += ne_fprintf(f, ",$0x%x,%u", op, ix);
+                        mop = get_memop(oi);
+                        col += ne_fprintf(f, ",$0x%x,%u", mop, ix);
                     }
                     i = 1;
                 }
-- 
2.41.0

