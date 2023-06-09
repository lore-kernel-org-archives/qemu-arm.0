Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp103890ejb;
        Thu, 8 Jun 2023 19:26:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5B2WG9nXok8b41nuyNFBqoJ+S9Wch3cLHAXp4Ve6LADd/yflAt4uOb2oL0Wb/zrdH4CQ23
X-Received: by 2002:a05:6214:2422:b0:621:1b73:52c9 with SMTP id gy2-20020a056214242200b006211b7352c9mr385944qvb.10.1686277595459;
        Thu, 08 Jun 2023 19:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277595; cv=none;
        d=google.com; s=arc-20160816;
        b=f56TR2wuk8cgKTuflSeN9dbIxTrmMF7HTWfwzbOtRUFHMV4lqYVe6boEkZK5WqSH+g
         Bp5YfPvu9y6uTl2TwMJJNF4GAup7GA5TZu/d6J6VrNGMN4gY/hUEQCsMRwJL6UsOFnuz
         7OlHy7bx6T6dnu2hkeez2uCDlKEqlOET3j4zsuiRDjTLa1HLGWXnliITJczUCPKz6z5X
         bHxFZRAu7WVLmJISXV9Dn7TgK+6/cjVCvDTgGZzzeukpZUgs2/znx6PVQ1/S/5VWQKcU
         ELVOVVCRqNYBNNr+r0A1Z7EVgQyS4QytpsUQJdYJ1WS5Gyt0enHV4aslKP/cgX4bOav6
         JYyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+os3nHQ/ZmARewYX8s5fRYkcgS0NtfZNFjYHPGkpaM4=;
        b=eq8V88jH5SFKxXApXJZ6aVozKgZgYRE25cp9cc6F964E6N26UdhFXh1RLDWuPFj84B
         UlFkFFoJpvi7Vf7NYUVtdPUeZMmW20litRM81pC4kmpafOHgsMAkaX5Z+yPYVPMANw17
         Piu+ml5bJITOq82355vluyS5KaYDbt4mJijWI0CfLxI30EH0A/1dTm1Jfy1WBtQSPkjX
         L8hgJG6XGfFBzm+Q0u+UmSwJz16UDWzRygiHI+d0hp+LsgNm0qVBBx0zt5lOXp8Q99e+
         f556onpBtqsDs65nmh3u1gjCAP9P3KtRiWl8OhFhL+FPg5Xm+Iq8m9/d2ZowcTIAbT0Y
         zdOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qwJFwEtr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a12-20020ad45c4c000000b0062119cedb7fsi1662663qva.18.2023.06.08.19.26.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:26:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qwJFwEtr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q7RpD-0005ig-Id; Thu, 08 Jun 2023 22:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RoB-00032n-5Z
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 22:25:02 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rne-0005jV-H1
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 22:24:58 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-53fbb3a013dso353246a12.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jun 2023 19:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277465; x=1688869465;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+os3nHQ/ZmARewYX8s5fRYkcgS0NtfZNFjYHPGkpaM4=;
 b=qwJFwEtrz4eOmeSiRKmOQjyX5vkfNx9xvMgp5tnbPcapURUKhy4JHSyVeucoRbzaOT
 VGsB9YaLH9crqdxESzusaqjIDh4PNhPflORyRiB67AJT6LXAkhh9vchbf0Tvese6Z1dh
 cUexEXa6/hJhdpPyvJfqgnmHsfhaHWMWm5OGH6KuHx+4f0I3fi2/qPHTylmbp5LkbnWH
 +0lBxU/njOfDZyaiRQ0itBp4Z9/BQAbCZF27RJy5U4XqnR5n4Lu2t7P0RDJeuX/+CcB/
 WmOhSlP/hHBWyXhsuW5RAZ/Z2b+oJ6NXvTMLwyHaVrejuxZ8yhFzwX8GtuVDahRrK21r
 L9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277465; x=1688869465;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+os3nHQ/ZmARewYX8s5fRYkcgS0NtfZNFjYHPGkpaM4=;
 b=gfbYAI7o+xI+zuBEJAlrtjK8B+HBb33nxlRw8cdt/pdiJpDwapxSqLxj2rhKOD5f9E
 Y+zaklSOQOMO4+K8qE2MxSijFaQAUAf+P1IP5rSI/bh/q7rgO1xjX6lHa13kDgTuIQoY
 jpIeqjdT9u6YIKY23We5d1Z5VFvWGEx1rzVCcZ47YH6R9pOLcQQR80ESx566MyYIga47
 nJf2DcmTNCOUAhPG3APq9WX/+gm4Qq/qTlh7nj7KdH6Z3Hr52TG8RKt6lw1FxV83Yywy
 tH6Uh8Zle+jkVzA6GhaV0YGhfl+7/XtmpebJ9vkEZzKZqkHMK906S3VcEjBwyNK/bsuJ
 GXkw==
X-Gm-Message-State: AC+VfDxHKRhs/gGtZ9WLUbCFZ+M2TsOnIEVKiZYgqMc5/Mu1P2eYw1K/
 Am29mGPgoisL+N0y+H1tD6/fywVdF1LD8BQa74I=
X-Received: by 2002:a05:6a20:159:b0:f3:33fb:a62b with SMTP id
 25-20020a056a20015900b000f333fba62bmr59777pzs.9.1686277465099; 
 Thu, 08 Jun 2023 19:24:25 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 24/38] target/i386: Use aesenc_SB_SR_MC_AK
Date: Thu,  8 Jun 2023 19:23:47 -0700
Message-Id: <20230609022401.684157-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: LTOHbqitSBkn

This implements the AESENC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 893913ebf8..93a4e0cf16 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2188,16 +2188,12 @@ void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 
 void glue(helper_aesenc, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    int i;
-    Reg st = *v;
-    Reg rk = *s;
+    for (int i = 0; i < SHIFT; i++) {
+        AESState *ad = (AESState *)&d->ZMM_X(i);
+        AESState *st = (AESState *)&v->ZMM_X(i);
+        AESState *rk = (AESState *)&s->ZMM_X(i);
 
-    for (i = 0 ; i < 2 << SHIFT ; i++) {
-        int j = i & 3;
-        d->L(i) = rk.L(i) ^ bswap32(AES_Te0[st.B(AES_shifts[4 * j + 0])] ^
-                                    AES_Te1[st.B(AES_shifts[4 * j + 1])] ^
-                                    AES_Te2[st.B(AES_shifts[4 * j + 2])] ^
-                                    AES_Te3[st.B(AES_shifts[4 * j + 3])]);
+        aesenc_SB_SR_MC_AK(ad, st, rk, false);
     }
 }
 
-- 
2.34.1

