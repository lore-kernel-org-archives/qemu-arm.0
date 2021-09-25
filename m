Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2238725lfp;
        Sat, 25 Sep 2021 08:19:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3N3SLGwzqtYcxXdQJxR6yIOb5pGB3QJkDn5jCsDdEr5hf6NJWTa4/97zVyjrjaoGssCt2
X-Received: by 2002:a67:ec59:: with SMTP id z25mr14439993vso.56.1632583173384;
        Sat, 25 Sep 2021 08:19:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632583173; cv=none;
        d=google.com; s=arc-20160816;
        b=fHYUIXnUJems8XMRQRsUe2+hH8M0jDBkUls1dnsPG2a4yD1FWIKEz5qBzlnK9jIfTY
         SAxYJcBB6MAlGiuBWXHb7bBnGu7AI7A0hdfTvAsvL3inketxoqcqNrJJTnW6DQ3M3K/8
         6OWF+P0P/SMB2cjVvc8YM48wfj8hmkJ3FLxyWtFq9AYCZHVSd2U312fN4eEKXOLrArn3
         UKou1mFJ86TvMKL20j/RpNqYDe7cUJ8Ij65nA0jn8Si3hrtI1ev95a649HJ31zBlhnfl
         pKX5GTDrZF2pDlDEWJ5SugG95+QERmAQdNb8Fc3gVjBd5fN/mhgH2mqKq44vqBJQ60AX
         8Tng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UE09P3+95R7azQiB3uAxKhFAUsJxXecPBFCz3ofDdJY=;
        b=PFeLLWpJG3s4SNTcb/uVRny+pjgPfaBjOnuo8ZzsmH5ExJw1gMIJqLeFP0IBkAybu2
         Pr2cE7H+RqEyvg52t1yCvL9IlLDXLxihqwvgK8CmTXtF5N/89jSmslPVzCqBiK4zl/AO
         eikjgrsve8Mb8PrmLnCpWXOVYLdkOHBL+0kIVSeA6JHencYa2dtNjsS6epc2imkH28yQ
         2jIa0ltIQUIMc0C8z7ehGFpFhOcxEe6RvwTNbiJpBryheGMoJ6ydajrvpdNWiAEABZOv
         zveDsRiy7cof2f3qr6NyTjUoIWOTH2IVBP8fmk/Kzb96A02TVSq786X9bMVwnJc3uQDr
         wdlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=m8uSzJJW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12si7928736uae.125.2021.09.25.08.19.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Sep 2021 08:19:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=m8uSzJJW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mU9Se-0005FO-Na
	for alex.bennee@linaro.org; Sat, 25 Sep 2021 11:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU92c-0000uz-RH; Sat, 25 Sep 2021 10:52:38 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU92b-0005wf-AG; Sat, 25 Sep 2021 10:52:38 -0400
Received: by mail-wr1-x430.google.com with SMTP id g16so36517851wrb.3;
 Sat, 25 Sep 2021 07:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UE09P3+95R7azQiB3uAxKhFAUsJxXecPBFCz3ofDdJY=;
 b=m8uSzJJW5RbcD9v9b60DsxXyfZ8QYa5zKCrKDSbEKmRpjpjCykjDR1iOwS025VCpI5
 dvKNxMPoyGFGX1l6OQkuho7vDjhsD8N/+605Br3KKhh7JVh4iYRvAlmYhvl8aXx0+rEq
 KqArJgcaa2rUbO0jIM1Re+vP0yW7aEr7gRn3nQJ26UwV/slNVSVT+U+PmahlhvEnOAPy
 zXeozL9OsjqENrKfiX1rozhV32LX/ehCc2SJniHaqQQ0XeHk75F9qKhRQo63smQxQihB
 8AK2qb53yI6Qn37olIzRB+J+RiDG52jGE/2XLAhPXfXL+fdoL85OygikxHVjDmgcliE6
 MnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UE09P3+95R7azQiB3uAxKhFAUsJxXecPBFCz3ofDdJY=;
 b=7QROgOGMOgT/T7HKwg+X0pGHi5M+rHJRpvxniFrXQHx7bmfAT+Vt3dLsqLPgf4XywE
 DQf7crkp3lYPEzVnYAO4mpktq493/g1cbKCE7if0aFQgTJBB1hcXX5qK1ofEJ9ECWuqM
 zV0XLaFSvYs7vjktH/cdl3rZCQaD5EN0P2TE+bb/Kk9IbWdttB7s3d+pu7YRjCawKJMy
 hvZrOsP1fgXMz7CG1ksFmbGpfERaaPEMxuxC7sQXDRztccI8bX8ertbOgTX6WUOq9fGQ
 N97qE1FOFYJ4UMshiQbqUd287orYmK43tlPXdAr1FVsjofSgv6CyLsFQgORu77Y0JHfw
 tBiA==
X-Gm-Message-State: AOAM531ri6XwnYlhODsvdeIsYUY+LOweYcJ3AkKh9jLaQYE3Mhzj364z
 EslMyGT4xvHEzag0ZfJFzzSz4S12Pi0=
X-Received: by 2002:a5d:4d02:: with SMTP id z2mr18010911wrt.8.1632581555396;
 Sat, 25 Sep 2021 07:52:35 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 i2sm11055407wrq.78.2021.09.25.07.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:52:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 16/40] target/arm: Explicit v7M cores use arm_cpu_has_work
 as CPUClass:has_work
Date: Sat, 25 Sep 2021 16:50:54 +0200
Message-Id: <20210925145118.1361230-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dFR7a5D+D/mj

ARM v7M cores inherit TYPE_ARM_CPU, so TYPE_ARM_CPU's class_init runs
first and sets up most of the class fields, setting in particular the
has_work handler to the generic arm_cpu_has_work(). Thus M-profile
and A-profile share the same arm_cpu_has_work() function. Some of the
checks the code there does are perhaps unnecessary for M-profile, but
they're harmless.

Since we want to move the has_work handler from CPUClass to TCGCPUOps,
the next commit will be more explicit if we already register this
handler in arm_v7m_class_init(). Since arm_cpu_has_work() is static to
target/arm/cpu.c, we have to declare it in "internals.h" to be able to
use it in target/arm/cpu_tcg.c.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/internals.h | 2 ++
 target/arm/cpu.c       | 2 +-
 target/arm/cpu_tcg.c   | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 9fbb3649682..f20aeb97fa0 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -177,6 +177,8 @@ void arm_translate_init(void);
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
 
+bool arm_cpu_has_work(CPUState *cs);
+
 /**
  * aarch64_sve_zcr_get_valid_len:
  * @cpu: cpu context
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 641a8c2d3d3..4b08f717f64 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -76,7 +76,7 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
 }
 #endif /* CONFIG_TCG */
 
-static bool arm_cpu_has_work(CPUState *cs)
+bool arm_cpu_has_work(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 0d5adccf1a7..9a0927ad5d0 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -920,6 +920,7 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
 
     acc->info = data;
 #ifdef CONFIG_TCG
+    cc->has_work = arm_cpu_has_work;
     cc->tcg_ops = &arm_v7m_tcg_ops;
 #endif /* CONFIG_TCG */
 
-- 
2.31.1

