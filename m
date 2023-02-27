Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4298671ejc;
        Sun, 26 Feb 2023 21:45:56 -0800 (PST)
X-Google-Smtp-Source: AK7set8/oRoQwU8BNqwRuFw6Ham9lSBodLdDXkoQtVFNTRVgChmueBPu1lIZpzD8luciFkpa4UiN
X-Received: by 2002:ad4:5de3:0:b0:56e:b59d:2ee7 with SMTP id jn3-20020ad45de3000000b0056eb59d2ee7mr36595402qvb.47.1677476755829;
        Sun, 26 Feb 2023 21:45:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476755; cv=none;
        d=google.com; s=arc-20160816;
        b=j/e400HnMCyhh1xmHSrhdOAfdcBl3ShiVVcJEM3V1yBKDg+fDSiZVHl4Cr2uIPECba
         ZUOnGKRoEkfsX6U2s7OYJULE2cWnYIyAsh/QNrqpAL2Q/XtB0CvZMXZDcw/86GgOxHlr
         kJBTQJnWvXkzbyH53oKuz5ncEBSGsxe6GGx4NnhryQWVKNPiFWWA8JI90NqmXvo5eGyn
         B+/E8SN7S4jQEAc58fDBUaeYqhxMvWEYVkcgiunb7u3mZ+QGeEhMenXVMWvg4drDIFky
         kNC4o6XUmDcjTMFLb2NlEG/iCf+TnhQ/CzpIXw+xayvQR4WhcYWSajDvkHoc8PaKVlxW
         5zjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0+GeilfFKKsm5WnLXBFyBAbE/3JXPiOJcMvh7tD7SqM=;
        b=zWPbRbjXEJ42uFe6XjFzce5GvsVKHlMFKAFnwiSxM61zq9/eapkLp3duWGrosWJTWD
         /ROhw4y00Ac1LbIWc0CdRxVfveHBlYHA0SUGM6I+SGEaTp2Z2BU3VeXQU53F1QDdAzKI
         90Uf4JbFJQSxSEDiBRvVxSQXJ7UIleJ93ks/5xfdTtWjAsq6q5gA3+rSbQSYJsgIh+TU
         7xuQRJ307TAsC1zQq4kQWzYDXFwaQQa88s72YEBL9GEJ+wyTeU1cfS2NleCm7J+avAov
         snQJYerxfWGIOlr9RewWJgLeQ2EXhlSE5tcRvofsqMUFE8R2UI1wcsqjzVhVdT2oJYGT
         wU4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JlLJq81a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fh6-20020a0562141a0600b0056e981c4fd1si5960767qvb.413.2023.02.26.21.45.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:45:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JlLJq81a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWI3-0002u4-6q; Mon, 27 Feb 2023 00:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWI1-0002pv-D2
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:09 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHx-0004rP-2c
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:09 -0500
Received: by mail-pl1-x62d.google.com with SMTP id i3so5560184plg.6
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0+GeilfFKKsm5WnLXBFyBAbE/3JXPiOJcMvh7tD7SqM=;
 b=JlLJq81aoJ9CD+Zkbg5co07+b8fAknE/f6ncCgivhmkFSxUjQnUvtOwD9lqcz8IuOl
 UjBHcAoYAyQYWXStHCAmdq32rZAsclOWVSRkgghz5N/u18Vf6UlXEyBD2sYq2DV62YvF
 5JKHbo/VDUfWkWCfsCqJt2iygTUBhA6Ru9bWu7OmknGxAuT+J5K7lM19QJ9v4u+op4wT
 kC6XV9EAzvinaTE0y9tuEoBvSYMiZiUuH1enZtfS4fwhZ1isAtcgl912HcArXhXNzTO/
 0CtJA1UR2RhtpolyJzxKq6DFB7gPkXIGjZQ2QwB0g3NAYZJLAAo9/iDqqJipnpSHKEDo
 mnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0+GeilfFKKsm5WnLXBFyBAbE/3JXPiOJcMvh7tD7SqM=;
 b=jBj0hB1FdpI0U0DUs7XccnMqRzlXIh5gcu3MNglq2lwEiSgz7lh0+xo+UoTxO9dvBF
 0jqCs2J1m6tdAkaa9KlIIWbMr8gEskKaXHbWMrmdS/5afo7Y/CL74QA/I/rI1wvSJG2Q
 GAuUxUdcgamDPfIkbylHC9ybmqRjPFS/zfuH5RRDl0lgeueJZHYsshoPFLhLm7JidxfO
 3qyXFP5wxCREUu8y6F5GJrCWfQmxF+STJTkm51dCNb55q7euw56Acyoyr3UxxioJkQq4
 BfPGiI4R6P0UXgriV6MrObC+trpKZl0RDHjfOR0oFpEVqX6eyy56zLFssiVBxKcWutWT
 FNPA==
X-Gm-Message-State: AO0yUKW/bV/w4H3EmjuOx4HTh/7het0s1No8wgxBEt0KpLCpwK5sue1/
 ekIBcgxU5hd31abTStLvo42lAw==
X-Received: by 2002:a05:6a20:1443:b0:c3:cc65:165c with SMTP id
 a3-20020a056a20144300b000c3cc65165cmr18810060pzi.61.1677476579990; 
 Sun, 26 Feb 2023 21:42:59 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:42:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 06/70] target/arm: Improve trans_BFCI
Date: Sun, 26 Feb 2023 19:41:29 -1000
Message-Id: <20230227054233.390271-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: wiIjjCvSEFRd

Reorg temporary usage so that we can use tcg_constant_i32.
tcg_gen_deposit_i32 already has a width == 32 special case,
so remove the check here.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 645bcf8d0a..644a3257a2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7261,8 +7261,8 @@ static bool trans_UBFX(DisasContext *s, arg_UBFX *a)
 
 static bool trans_BFCI(DisasContext *s, arg_BFCI *a)
 {
-    TCGv_i32 tmp;
     int msb = a->msb, lsb = a->lsb;
+    TCGv_i32 t_in, t_rd;
     int width;
 
     if (!ENABLE_ARCH_6T2) {
@@ -7277,16 +7277,13 @@ static bool trans_BFCI(DisasContext *s, arg_BFCI *a)
     width = msb + 1 - lsb;
     if (a->rn == 15) {
         /* BFC */
-        tmp = tcg_const_i32(0);
+        t_in = tcg_constant_i32(0);
     } else {
         /* BFI */
-        tmp = load_reg(s, a->rn);
+        t_in = load_reg(s, a->rn);
     }
-    if (width != 32) {
-        TCGv_i32 tmp2 = load_reg(s, a->rd);
-        tcg_gen_deposit_i32(tmp, tmp2, tmp, lsb, width);
-    }
-    store_reg(s, a->rd, tmp);
+    t_rd = load_reg(s, a->rd);
+    tcg_gen_deposit_i32(t_rd, t_rd, t_in, lsb, width);
     return true;
 }
 
-- 
2.34.1

