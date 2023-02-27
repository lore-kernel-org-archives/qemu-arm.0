Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4301576ejc;
        Sun, 26 Feb 2023 21:51:29 -0800 (PST)
X-Google-Smtp-Source: AK7set/1pT2KHBByW6VC3EY4HM96zdJjCkh3YL+ThgoswX9bsgTu6sNqdBbMoh5SJdL1KZ/3ZtlQ
X-Received: by 2002:ad4:5dc3:0:b0:56e:a899:1604 with SMTP id m3-20020ad45dc3000000b0056ea8991604mr50617781qvh.14.1677477089260;
        Sun, 26 Feb 2023 21:51:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477089; cv=none;
        d=google.com; s=arc-20160816;
        b=GsU3csh0iqJVXlVN5Z+ovARPHVoOBceKqeO8Pb+G2qo4edqTy4SGrTqa24/gb1Xu8L
         QE56nCEkeQVTbicftqeUgPy3zTch9XK2Mo/9Yh6dXco1v0NUtIJZcasRyoWPsFZzbM2X
         GCYQXPnBSOLaWwcsYluv+v/lGzufpn0zrMmlxktH97Te7rTIbHLMM5bV3KdwW3Jv5Fen
         Dfx/9IAYnOwtT9MuSe9FdpFQd4mdQEX83oRQwjrzVHoYYw1tZd8ogSJvnM+EBEn3z/mJ
         7GFNfngkmcgILF3++YPcG4yNOeFPybyswDK3ihAVGFTMN8cevXFtwEtZlbvY36v2ZiI4
         NpPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=L1GGh7DMqJjXiFDkrXWmx7lkNkzrItdtK7foWMBTyE4=;
        b=nrt/px8tNkZSTfxsdSr4TADhe0bN6HToPOyCCrKqjHRis+hJNxkNpwxJy/XfJdESTk
         XyDDnIY0tEJ4u/e1FfTJn/qD9Q7BuvVbRltLLDlnEKsopMfqygjXoWOWTrffDocg91gf
         fkIi/cg909ojyWihIhS3ScCYMmisVY49EicCOQ8pkHo0tZ1ieKl2I6rrPjcUw8tB+eAn
         aA6adJs+tF6VO6HJ31liraOuBc4FL/BeZZPJ5Uz1mZjIKE4833pOE0m0naMaYPOHZm/9
         PrfGWPcu8JPwizQlxqav6wre/ZCAkXMRXkG0S9qbCIQzWD4o6FQR07vXHxq9jA5uHp0O
         83QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GVzzv4mk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs6-20020a05620a470600b007426fc20ee0si5579314qkb.535.2023.02.26.21.51.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:51:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GVzzv4mk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWOj-0002Y6-A6; Mon, 27 Feb 2023 00:50:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNP-0004VU-3f
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:48:44 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNJ-00078U-GT
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:48:42 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso954185pjb.2
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L1GGh7DMqJjXiFDkrXWmx7lkNkzrItdtK7foWMBTyE4=;
 b=GVzzv4mkD/9Ikhv7Z96vauy6VKz9nqaW86TpN43eHsBR6JkHepotzv3WUUv1GPPMZC
 kGDiPq9UqdczFT0/r6K6JJftUhNqrrBxH+pDk1SOwQMhRreFTjDjdkVDxx6ZFQqSjoMz
 qL4O9v6FXOpaC6n2CNWXVUG7RZfCQurZjovB/E2zD5yq1eZKgGbRnBuTXUeqto8JsbIY
 cEo9VqMliCy5A8/anLb1GbAqFpw2nX3vy3hqLPWW/GGb6/TwJmkO3lLLj2+Xk317i7/t
 6mmw6eE/c7vqKGiPJ26hajB08yULISCduEJ7OkB44vyL0xdmIBw8ZckfZtGhasEupMOL
 qgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L1GGh7DMqJjXiFDkrXWmx7lkNkzrItdtK7foWMBTyE4=;
 b=F6WtkOfWfgW0wUzlXvPtWr+TACanHnVl1UdKm2Zm09/enaCUGElUhclqQHlYlTGesE
 T2//96caSqMqSQGGMbLifCx1nGOQdgXP0T0OlYJjvwW5c72JlTNNN519KX9lQgf0thG8
 YYdKEUyVh/Mvd6gTJ+HpRx58hiMuI2+ooqvCsQYb1vNncjwgJEP2Ccolsdm6WRSJGQnD
 7GVNEiPaeafc33P9NDt10W94NMjOuZxmufWAUoIIoIaza1Cp5psf54JQDt1l5sJAFNeZ
 qoSttfZdtWbuqUcTZ5SFdiGQ3P970Zubz0G2df1XiwK+YPps3eWXbhBOrxaD9mgHtcLe
 vlfQ==
X-Gm-Message-State: AO0yUKUMGUxVP91l9MdN09yR0wGf1hMtGEb2UuY9ZXYnOTjHTV3j/6Zc
 Z8BncXxfToQuxQkGZKloVBYGIA==
X-Received: by 2002:a17:902:e851:b0:19a:7758:e5e6 with SMTP id
 t17-20020a170902e85100b0019a7758e5e6mr29462074plg.48.1677476914605; 
 Sun, 26 Feb 2023 21:48:34 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 64/70] target/xtensa: Avoid tcg_const_i32 in translate_l32r
Date: Sun, 26 Feb 2023 19:42:27 -1000
Message-Id: <20230227054233.390271-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
X-TUID: 95SurvdrAYhh

Use addi on the addition side and tcg_constant_i32 on the other.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index d727f9ffd8..41b84082de 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1721,10 +1721,10 @@ static void translate_l32r(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 tmp;
 
     if (dc->base.tb->flags & XTENSA_TBFLAG_LITBASE) {
-        tmp = tcg_const_i32(arg[1].raw_imm - 1);
-        tcg_gen_add_i32(tmp, cpu_SR[LITBASE], tmp);
+        tmp = tcg_temp_new();
+        tcg_gen_addi_i32(tmp, cpu_SR[LITBASE], arg[1].raw_imm - 1);
     } else {
-        tmp = tcg_const_i32(arg[1].imm);
+        tmp = tcg_constant_i32(arg[1].imm);
     }
     tcg_gen_qemu_ld32u(arg[0].out, tmp, dc->cring);
 }
-- 
2.34.1

