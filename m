Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3082634ejb;
        Mon, 5 Jun 2023 15:24:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Y926LrNuST1/SxBOsRJ+vIfiilTj1+3QA2yXNtewXYklgP5Yh41Xk11KXCbojglUMkHNW
X-Received: by 2002:a05:622a:1305:b0:3f6:b31c:ac2a with SMTP id v5-20020a05622a130500b003f6b31cac2amr149912qtk.29.1686003895729;
        Mon, 05 Jun 2023 15:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686003895; cv=none;
        d=google.com; s=arc-20160816;
        b=P/z6zTMAukrniRG2kZd6cdYFS+voMzZqtUqfTYWe7JauxtBoEiE83KMqF8+sEtgUGv
         1kOg9TUxBEmJoek6uXXgygyKrPsoyH9RZLOqgEQ+H5WP936yePToes73++/Zq33AdAF4
         HL8PmCjqM3rN7xqLVutDZ0IuqS/VTHM1hHv3cTyruz/hX7GHVpJAg3w4ZvZGP4HPiWAK
         jpil49cg5s+77HQu7nR0cUfqXSW60DlmA+8PYgxKcJmpFpiJBTNRKrkbVUS67RnGD2Qv
         PaUrXgCuAEefZzSx+LRVH/C9BICd1AlAvdKvzcD6sg0BJbT0VZpe/sYcNn/pDCS/jVYI
         +KnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Y7qE+XF1sdC5qKTLQBPA7J0xIVj1iHbCF/ZSK/gcraw=;
        b=I2gOSlPBAnBIpQaVuKnIw1rvVjGYn9eV/8blyXJ/yisVZ3ie+w8PQJMptcIPj/APUy
         kaml15ox8xXa5TXfCDN+l4x+srz1ZvmS2yDYlRUBMPoKb6cs+lGq9iNHuK8Nt2ASK2du
         dey7d3gMBb4bI2n1wIf/r57FBqSATVP8D8X5hLTq3ZEi9hOiN6n5bE2YMIOUMoRUDc1i
         GFlWEYcn48aLj7Ukp/z6WLps79sBbtQcrsBwk975mpNHTPFidqUVzzaTmboDGQjsr3PF
         +JcnKVBtLH8flFxS8WLNE1QiXh5f+cVWETxTnleZ0Kp31MsHVKTszYiVW1IGgnEtj0Ig
         5Hyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TkiOyJWv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v15-20020a05622a130f00b003f6c202b015si5507294qtk.743.2023.06.05.15.24.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 15:24:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TkiOyJWv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6Icv-0008KG-Mj; Mon, 05 Jun 2023 18:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6Icu-0008JQ-F1
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 18:24:36 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6Ics-0005zl-VQ
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 18:24:36 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-30aef0499b6so4310538f8f.1
 for <qemu-arm@nongnu.org>; Mon, 05 Jun 2023 15:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686003873; x=1688595873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y7qE+XF1sdC5qKTLQBPA7J0xIVj1iHbCF/ZSK/gcraw=;
 b=TkiOyJWvy3drsZuKtR3vKHprfSuGo0NZQHJKgB/5PIEzC3gKiRx+RCaJuBjBkv2Wz2
 jUaSJz9HpBTLxHrlCEy+JJAsYQd+voXJdLD4vYSSX28BeI2SzhBMU9b5oH6hYkYAooPl
 Gq7a6idcPbtQHnSpqocTfSdiIZyu0FLiYKqyojX0oX4fDNOC8eFoW8zxXJ0tPEnsVKQV
 3KjERfYQhEXhbaWIncID/h1n3Ntn0sctR71FuOyvMTAWxZorMyc4JnCkrRPJR6uAUXdz
 yrhrLyzUW1OarRKrAW7mDzb/MnZ1uB6e/H/OtkM8GS1FmTtwU/Wd/htlXYRhDTYb1bWw
 A5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686003873; x=1688595873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y7qE+XF1sdC5qKTLQBPA7J0xIVj1iHbCF/ZSK/gcraw=;
 b=j3brxiV+51sYd2mmnnnZKpZWoEREm8IiVV/toKGZFM9WZ9fcvfEmyq2XCbgV+eosHU
 TJQzBjFRPrsQl6VDtQfLxC4EXVnz+BsRxjrpNE8akPO2fvKfkjDpI1tklikwy++7MV3D
 twl6vE/Oxx3aHgKmZ3PmfbhJIkUr1jiket0OWf4kP9+dPJBu2piVXZ8ky2+wvqanfTQA
 C6AdrhLaj6tBPXI3209dFIhXhB3F+giouOiwui8oySOHujGWbz3yd4Kil1QZW0nY3DKH
 ypp+JpmP5U7lcjHSvhL7r88hSlXjbvkezFUfIi4qggw0Legdj3qyq1yifF2iP3uzezIb
 dzSQ==
X-Gm-Message-State: AC+VfDyrX9Wy4El9t3Nl6Dps82Hg7chjJr9bH1tDudlFLDr0tZAhkbNl
 9WoGzJm99nNDE6gSGaV26vZkgw==
X-Received: by 2002:adf:fccb:0:b0:30c:2bbf:bf75 with SMTP id
 f11-20020adffccb000000b0030c2bbfbf75mr159034wrs.26.1686003873750; 
 Mon, 05 Jun 2023 15:24:33 -0700 (PDT)
Received: from localhost.localdomain ([176.187.217.157])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a5d4cc1000000b002fda1b12a0bsm10850321wrt.2.2023.06.05.15.24.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 05 Jun 2023 15:24:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH v2 2/9] target/i386: Check for USER_ONLY definition
 instead of SOFTMMU one
Date: Tue,  6 Jun 2023 00:24:13 +0200
Message-Id: <20230605222420.14776-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230605222420.14776-1-philmd@linaro.org>
References: <20230605222420.14776-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: KAbL4x4v2hZ5

Since we *might* have user emulation with softmmu,
replace the system emulation check by !user emulation one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5cf14311a6..750253e679 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -6915,7 +6915,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->popl_esp_hack = 0;
     /* select memory access functions */
     dc->mem_index = 0;
-#ifdef CONFIG_SOFTMMU
+#ifndef CONFIG_USER_ONLY
     dc->mem_index = cpu_mmu_index(env, false);
 #endif
     dc->cpuid_features = env->features[FEAT_1_EDX];
-- 
2.38.1

