Received: by 10.223.188.70 with SMTP id a6csp3964170wrh;
        Sun, 27 Aug 2017 20:53:29 -0700 (PDT)
X-Received: by 10.13.242.67 with SMTP id b64mr4778164ywf.383.1503892409389;
        Sun, 27 Aug 2017 20:53:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503892409; cv=none;
        d=google.com; s=arc-20160816;
        b=nsZDMYFJg9krA5QsjIt5NGCahufRewdv6b05t1Yl/fL/24KxElKzRoDfI0KXh+FpA7
         0XQ3rAAnFOUo7/2LbA5HM7nHg1w0L7zwVz2vkTISLP0ySKY1qlWsFmD1//maRmhozEqD
         7WSZ9m2xfVkFywnAIA7bRR1ad5SMu3H7aacJig1SdeOY/87u9rPj1SQS2S0AJGR+CprB
         9p5fX4fARSWjbF2HplQLxxVgsGA9cjeylsUVENkd8+IMWb5QEi9iXnW6F8TCnB2MaNAT
         A5LBQaThU38t7LjZiAwnfO2cEdVgDaeWfaK3hJNJKac604J8ZYVhn3ZG1X+9m/xECXJo
         01XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature
         :arc-authentication-results;
        bh=t8FBrkfB07s9pw9b9O6Qh9ZHCadicrTF8TnZ05hruSc=;
        b=hWvuQT+W05mVlrzZBNpD9R9EY/bRlf58Eoiqi/53ibQHKq9axdPykbG6HeAg6mfS2e
         iPQDAHDq1W53JxmT8TkB4UAtyswhsrHoB2YzFsugrP/m/1oSjCM7EVHPyf84YH9TsXpN
         pQTMcqcSVdBWAXp4mCQuuEBFkZPyB0vftXGliJp/N3w7tqwNS6l8rYB+rhf/9mYTTcSR
         vWq8QLxMt2V202NlLcRf5GAak0hoeLDyJPlf7f9dLxqyws//w8IIkJP8TLsaRqVWbLqV
         w0aAfCMIVqalnQ9YHzsROGVGGPg2T/YLMF73UqzxljqDNvcGBT39La7mRKDnYbdtUOwa
         Zk/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LKGFub7d;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <bobby.prani@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r189sor1341943ywe.172.2017.08.27.20.53.28
        (Google Transport Security);
        Sun, 27 Aug 2017 20:53:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LKGFub7d;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=t8FBrkfB07s9pw9b9O6Qh9ZHCadicrTF8TnZ05hruSc=;
        b=LKGFub7dnIPwx8uoYb1+mfGm2tg2I4Ql0Op0utRS1GLMKmBiO5VBNkWoK+1E6G3LYE
         ND3iUr9ksJ5CdtQ8mKctCchdzNCpVmnYGIaG+Re6YTR0VQlrRsJw1D/IQkbeLvFiR4CZ
         9h7msevX2u6sqlhSm37O3Up8VvTVQU7cBBn2cAigQOAGRGMUU5LqtH299W+f7HNUK918
         vh7qt8ZbSzfiffsnLryUQ7/ORcj2rbI7g/LRmOB1/J2BXMo6TbgiYgSFY4scDeHBlMr0
         9OwGmoelbaOwCXOCnOUBTKD59YnRgPhAfiA4kPCsHx7TwjSvmNT5o746SRhCY94brZU0
         3+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=t8FBrkfB07s9pw9b9O6Qh9ZHCadicrTF8TnZ05hruSc=;
        b=Y5IVseBdj47//45q3xn80F5v+AYjBBTDqnqh0rXgLbCjdSvLEXIJFo7z8w0UW52kxk
         ygw+MejL1K7Xc0v6Vm7X0fcmWCdOw5ZPSV4NvejsfgHcTUrkeXYci7q5tRBJGOcmg636
         cdwihre9ZL6QBuR5ickb0Tu0pF407C8PCOYEdiOSHRWWmjrtu6zWLL7CLTEF2AXSaeYV
         rdkO3Rey2juUEsD2UDKjUNe9YUOWl0nxoBf7sKg6Bvik3xX42l9Vd/FGb+0B/M3weorg
         gjAfbgPiie4y+Vw0AGePR49JOfFJaoqqok9BAuoUAaNLbu3pFEL0L6JrI4hYrHyp/3nj
         DFqg==
X-Gm-Message-State: AHYfb5jYiKgCBrlJxOHNthXhEd1luMV1qzndwEBaHHY7Ybr2/BwRYAcd
	5qvtyE1jAhhYq+6TpTk=
X-Received: by 10.37.183.196 with SMTP id u4mr5145423ybj.39.1503892408517;
        Sun, 27 Aug 2017 20:53:28 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from localhost.localdomain ([98.192.46.210])
        by smtp.gmail.com with ESMTPSA id i64sm4820865ywi.64.2017.08.27.20.53.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Aug 2017 20:53:27 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: alex.bennee@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM),
	qemu-devel@nongnu.org (open list:All patches CC here)
Cc: qemu-devel@nongnu.org,
	rth@twiddle.net,
	pbonzini@redhat.com
Subject: [PATCH 1/3] target/arm: Remove stale comment
Date: Sun, 27 Aug 2017 23:53:24 -0400
Message-Id: <20170828035327.17146-1-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.13.0
X-TUID: 3EIauxp2qEZ8

Update the comment which is not true since MTTCG.

Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 target/arm/translate-a64.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2200e25be0..f42b155d7d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2012,10 +2012,6 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
     }
     tcg_addr = read_cpu_reg_sp(s, rn, 1);
 
-    /* Note that since TCG is single threaded load-acquire/store-release
-     * semantics require no extra if (is_lasr) { ... } handling.
-     */
-
     if (is_excl) {
         if (!is_store) {
             s->is_ldex = true;
-- 
2.13.0
