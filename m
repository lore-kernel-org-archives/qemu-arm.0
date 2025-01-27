Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2378520njk;
        Mon, 27 Jan 2025 03:55:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXM8lkjpDsiO6y/Y3jyD0JlQLycB2d503fO1pd/gHwCMHl5MPeg0SBel9s5nJIxRNN2WAMYkcVFdyhuSQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHnMsUMJHyXMTbVAhTIKXnt/d4daP3DNRaoysaYJAFEQhnl9XqI/RcP51L9kSgbrFALS5sM
X-Received: by 2002:ad4:5c68:0:b0:6df:97ba:4f7a with SMTP id 6a1803df08f44-6e1b2229fb0mr624937836d6.33.1737978952949;
        Mon, 27 Jan 2025 03:55:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737978952; cv=none;
        d=google.com; s=arc-20240605;
        b=QvfILSVs1vc1/2p5wXtYh3izr/Nivs49b63Dp2kTcmTuJprWYfzTlXo2y3sAOP7MIx
         jVfIvdi1bOMWNKtAyd1bTJXrbdaM3blhFf8+Uo0mbwMRPhBpVTn4AOXwHOMqRJCcFHim
         2WQerzUX3iozHyb85l0SCgjqEn+mYz5YIwZFP8p5lRKzTo8UVVfjJipN5IiogOjkXwoT
         F2aFh3hlgrPEU9VnCztxezoptdfAEtyqIheLWR+zVxJO0TF0UOrwkf04PSu7ajwJCrMv
         w3okJVEt4D/yH0IviOTO52Knz/qS8mlR5Y0FGqTZcVfxdwIRqpTZxx12WJOesVttWNXV
         XKtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=B4IS3z5t6aeYLZ7NAuHNel+nPJsLHRUkUZSl5ZYMkwc=;
        fh=UT36gCECAOtEsgOrSReymFda56t2Gj969DHeMwsi3As=;
        b=P939mnXZFLxACoZV4Ic08QOKF20HYD/C6CTttwTkvlAZl1nRRqgFhD/mSHPomBswtf
         lxJIV7gP54xgYDph9ql9jLoRxzfqFMAjmYvtuGc1EUexC7mZGIuMTiewQgJbymA85OaX
         l92o/RedAdbs3DfgdAycCug1FodKkW6HehohBVKd6xl/pM1dE6Qjm2Dlbw0y+TlpzqhK
         UlUphizUmOU+Tq8U4XBkeWjkJ9Rd6zQYBvHNNQ3gMBGMyJU8jp3KIlt9/vmPL0HwtCTb
         dP5zjX5+AybBZV2/Yk7GcqbuE9ubGpdC1VCNJS59fXQHigTKErgs4/m26BAJFlP3PLVD
         TTSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=knJHu9Sy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e22a13f027si19654116d6.491.2025.01.27.03.55.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 03:55:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=knJHu9Sy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcNiL-0007Qe-1a; Mon, 27 Jan 2025 06:55:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNhp-0006ln-E8
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 06:55:08 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNhn-0006z6-OW
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 06:55:05 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43626213fffso33478025e9.1
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 03:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737978902; x=1738583702; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B4IS3z5t6aeYLZ7NAuHNel+nPJsLHRUkUZSl5ZYMkwc=;
 b=knJHu9SyuiZHxjrTdCFTk5xLIAODPj6854jIhzC/TQhm2RzIu/EE0qY+fnHPRekzuw
 BypN6mGXmoxhwK3Oyf4HDwyYWoSUPGNIYe9PPLOWuqGa7Un2ez2+vGTHUwlE1Hj/Cd61
 80YSTPOEL1cqRhSbTtE9XTgjIIbVAeWJdU4oRGyFMnUK7PxqGiur5FwxhQY+d4xqcv75
 bnZe6ZcMeiEfkBg0JqgByxje+sixQ7n7zQbgo+vcR9vMgM0p8Hi4Ado4YlUiUE7iYTZz
 zroleyWXpcKe8NJdl8O7/8IO6zugb7MUulvdM/vEEjNeHsjOgUCddqj7fvQ5vmBSwgSF
 p6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737978902; x=1738583702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B4IS3z5t6aeYLZ7NAuHNel+nPJsLHRUkUZSl5ZYMkwc=;
 b=bTQikQxapsEbHRzyOF+LlAsDGpHgjPKVq8IZ/exaObgZUH1vnO3tDdFcUCnNfjgBT2
 Q4fFKjtPbwbLfGvObIf72vh0Kz3TxQMO2jWpGrp3KqyGLbs6ewwo7huGhvKCnxn5TQtX
 vB20yqqKN/Z0LhaXKoqrrp7cQ0YCLP06IOZqGLEPJhXjn6rf36ySWeJZksLODEnTuMT2
 44fBGYau7Ru4370O6rLJfca/bPmDfypAm9aDKLJ+WIORUGKu2w8vcQp8EJVafkeDpIyh
 qqDWDrZEYNbRZnj3bMHmSuKPYczHYpvwiRVjiDI4bsMY7tu5KQGxsG7fY7iOxtZMFxeO
 bCSg==
X-Gm-Message-State: AOJu0YzK7581Ph0xDFuNGUu6dhSZ2P+lGPqmhgww1q04qJV4B1e6zAA4
 uS8WbxZ/NbF48fxawPOPKLGJrMYrPzQSYhpPFEzb6VtvmmSJOvnbrLGDmM0VTh4=
X-Gm-Gg: ASbGncuLiXY8n7o2zaeclx68A9xa+/rHqT/w2+ocFM5qx2q4xb621mHswrHbRe9DKEq
 V3zeu+rx2WXj2Yi2Wt14FL9KtftGu6n+6paO7X95eBi9meQajSXkDTZsiVeBT32oqr8WZDy6G2L
 yOH3k7VfU9KAm5WjtneaBwEFen1ptTM8xmE1vsk+oXzWfFztTuxWz0mc+WYv5TxJzOhv2L4oi72
 +rw2985BWQd/mOaDbCQwTcGEfcMkNtwpExffPRkw2pNvbebW0rP1e++v+QhajMZHBOp13jdHWUD
 TV3pNnPf3Fs9ouVL5lXshqo5WRu6BnCR5885W8qmdtVD4vQyQ3tD1IQ=
X-Received: by 2002:a05:600c:3546:b0:434:fc5d:179c with SMTP id
 5b1f17b1804b1-438b885f8ebmr162465155e9.13.1737978901751; 
 Mon, 27 Jan 2025 03:55:01 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd48574csm130454235e9.9.2025.01.27.03.55.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Jan 2025 03:55:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/10] target/riscv: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 27 Jan 2025 12:54:23 +0100
Message-ID: <20250127115426.51355-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127115426.51355-1-philmd@linaro.org>
References: <20250127115426.51355-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: xZd8g/MwJcqJ

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/cpu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3d4bd157d2c..b39a701d751 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1156,6 +1156,15 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
     CPURISCVState *env = &cpu->env;
     info->target_info = &cpu->cfg;
 
+    /*
+     * A couple of bits in MSTATUS set the endianness:
+     *  - MSTATUS_UBE (User-mode),
+     *  - MSTATUS_SBE (Supervisor-mode),
+     *  - MSTATUS_MBE (Machine-mode)
+     * but we don't implement that yet.
+     */
+    info->endian = BFD_ENDIAN_LITTLE;
+
     switch (env->xl) {
     case MXL_RV32:
         info->print_insn = print_insn_riscv32;
-- 
2.47.1

