Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6638718lfg;
        Thu, 4 Mar 2021 14:36:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxEdHzzdv7Qmj9lyVb6OIooq6aLqIZFcwmY2OvRi62Tj9fY6M7BMIwAwTBPD+EDwk6GmCD/
X-Received: by 2002:a9d:4792:: with SMTP id b18mr5471293otf.350.1614897411111;
        Thu, 04 Mar 2021 14:36:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614897411; cv=none;
        d=google.com; s=arc-20160816;
        b=kJmTPoLy3kb/1+rXadrlCpWoIaJAneNXsuMvvRh/74sADsrn5dvGigYoM6Gkc6/pyH
         xsRkxgwwX6Knqm/6lASisM6qCtTNTP2J/U6LGpD4iNwiICLisePKIxjBjsuQYyu6SRr+
         /0c2sZ8m1UEJAzqRh9dLqW2H3nsDu6jXLlqFN7f6L1Af5aSeVNSr9uBmmX5mKwCZ9gBO
         Kpt/31EZzE77qZm39PfWe+wQP8l7a6EljOkPyqWSLmcG02A7HFW2i/pxdlTNBxuwwksB
         QZ30+nnouTmfT2EOH6bhjHoupFS0H8FolR37nXpTKz/ZPYpzjHEHJK7YU8liPvYH0den
         FiPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Sy2H6EddRIKWB1GSb3aR2E61qw1Oji422a4IED5nUFk=;
        b=mK8KaE3C7Of+BC9xiM6HtZje5JwlXH1QSgxr63T1OgOtyf0pN8y9nL5NGhPC7T3a/8
         0LMuX/3p566HGjSEY73EzaDcvCJaD2oLfjp+nV9SuKqOktCR2WvFIK49Z3xUuJvhRQDg
         C0Mmtex9zWuNFWDDY1lBhjU9CJnSeu4/tafBnNjJyITeGjGUWhb2zsvlG/uEkukdOdc0
         YSBCooSWoqvVZ2MZc0l2WvpwW13drvaqe+F0NlL03zT89jp4nWUvryIBC0oqfgf8HiJw
         gQuWCfmZvhvC6kH4GQuj5mEYNnaG9hyd3zwwwifNJmsaM0wL2j68CSssGMaFfQgih64T
         8cjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mhBQEJUj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18si761335otr.19.2021.03.04.14.36.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 14:36:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mhBQEJUj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:50404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHwaQ-0006BM-Cf
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 17:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwNl-0006yk-PO; Thu, 04 Mar 2021 17:23:45 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwNk-0002T2-4D; Thu, 04 Mar 2021 17:23:45 -0500
Received: by mail-wr1-x42c.google.com with SMTP id f12so25577162wrx.8;
 Thu, 04 Mar 2021 14:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sy2H6EddRIKWB1GSb3aR2E61qw1Oji422a4IED5nUFk=;
 b=mhBQEJUjEnB/YIfFNMe++iCNWz0lJM5t4I45IW7gGw6pz4iPRjTY1kAOLOwqDZL7ot
 Wx6nDJEaMvdheasiN9HYKocpqofzOsYa6I9yN1m8YReMdvKynY8+wujDG65Dj6IX098p
 k6JYfFDivampkjG3tsfEA1KmoNyGSfrG/M8MigxnAEPnhKwY4+/zP1jjPXo7acXe4AYA
 TOwZP3ZM17VgTe1jvAEzCBdzewFmVfSuRLmAClJ3jCN6LTWOnBm1hmpgbip1RqQ0BYyP
 xBrgN+hVJKOAwXYAwIDNGgunDGyGfP/KSz6SAnwFUq9yzlHIYY38BES3bHNHoQAUNUie
 JDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Sy2H6EddRIKWB1GSb3aR2E61qw1Oji422a4IED5nUFk=;
 b=Fz/DDcWMhweGUFdmSLt7LsB/jHx2aHgkno7ggjMuG9ODQ99TwU0wv28DtIXkYllBc0
 xX65c+8M+5sD8pjdEQvrP/tq1MKKoqzb8RAkGbGxf0L1xihT8q6N4799ydlBBsDkVHiK
 Axtch0q+lEqu+If+GUpywVkoYwlXctQ0LFIiV30N4azJSoetHu/8wJoraWadsMSafBqQ
 STUYdpCx/VEv5gQaDCDFTrlPs0c4BgwNjp7GzvjEJWF7lo9LNjoDlt3SzzCHNng6WoUt
 ZRO9BZmUxaE3wLeZgIfD2ldI3ojS9YQw+xuSkQt929qXOUrD0+6us1DEaE56KEMMN9np
 yQ2Q==
X-Gm-Message-State: AOAM533cGBz1ZW97vwhl7YNSaC6wYmuEx9GE+/VQFGrfoIPKHCrH1Tlt
 FGCTBv/gnrq6v13buW4No0/7RD1COx8=
X-Received: by 2002:adf:ed49:: with SMTP id u9mr6088176wro.337.1614896621247; 
 Thu, 04 Mar 2021 14:23:41 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y9sm907051wrm.88.2021.03.04.14.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 14:23:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 3/8] target/arm: Directly use arm_cpu_has_work instead
 of CPUClass::has_work
Date: Thu,  4 Mar 2021 23:23:18 +0100
Message-Id: <20210304222323.1954755-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210304222323.1954755-1-f4bug@amsat.org>
References: <20210304222323.1954755-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OR4tStdWEh0G

There is only one CPUClass::has_work() ARM handler: arm_cpu_has_work().

Avoid a dereference by declaring it in "internals.h" and call it
directly  in the WFI helper.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/internals.h | 1 +
 target/arm/cpu.c       | 2 +-
 target/arm/op_helper.c | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 05cebc8597c..1930be08828 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -172,6 +172,7 @@ static inline int r14_bank_number(int mode)
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
 
+bool arm_cpu_has_work(CPUState *cs);
 #ifdef CONFIG_TCG
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5e018b2a732..6d2d9f2100f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -76,7 +76,7 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
 }
 #endif /* CONFIG_TCG */
 
-static bool arm_cpu_has_work(CPUState *cs)
+bool arm_cpu_has_work(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
 
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 65cb37d088f..a4da6f4fde8 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -289,7 +289,7 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
     CPUState *cs = env_cpu(env);
     int target_el = check_wfx_trap(env, false);
 
-    if (cpu_has_work(cs)) {
+    if (arm_cpu_has_work(cs)) {
         /* Don't bother to go into our "low power state" if
          * we would just wake up immediately.
          */
-- 
2.26.2

