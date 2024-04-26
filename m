Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp640235ejb;
        Fri, 26 Apr 2024 12:50:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYA16X4i7tVAd6Jd4ZofH0ppg8NbkRaCMpRgEXhCuitsT+VY/qBZKNP99l3Cs+5WagRsF32LZda0lSl1g6o5mdn3/Mb260
X-Google-Smtp-Source: AGHT+IF9tkkb/4tzU15LbzaCG9RshoKPBbf2OZNuL0XsDeq92A9MZ/0dg25mc2cip1g6UyGVGHJE
X-Received: by 2002:ac8:5704:0:b0:436:b189:abdd with SMTP id 4-20020ac85704000000b00436b189abddmr3715267qtw.13.1714161028571;
        Fri, 26 Apr 2024 12:50:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714161028; cv=none;
        d=google.com; s=arc-20160816;
        b=M0SRNgr0+Lrfcd9lW7RgK/dngCu9bgnbH4NcKJT5wpD0SxLlHYxEmWTB5pKyqIaW0P
         wCLFmZdBOOnPQcCYAXeZhapVJ8rFprMfGFKdzjZBKCJxEucZ3d5krBq/oSGZvnaWvegj
         qkWtdpZqJ6b0HjCd+GcclWJwZf/SHDGkeX8LkfkYpx06DTQeqOtQb8G4w513XB0h2Kos
         0avZw8cTjsgB+/NnUx9mflIbSyak6wQeQGeQj2Qq9SOnIHpFPFP/yaE+q/JzyDpZNC8L
         /x0GMx3H165Z8fT0hq/8YxVN3Olg0EcMU7EnwmOzreAZBTYM1zX6ccKewmSDZ8VbNmDo
         Wk/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qqr1BfgxtDJCbOWtFyibCNg276fEde+mRkEZWF16SzE=;
        fh=gUEsd95llBLtqUKhUnPIoHQ/SNwiv/bmtZ7rMzFWY9Q=;
        b=L+BlZKdmt5hR14SigHrF3DI4h0oaiXcMVLqAU5kNfxMhoS7VPDDsP9EXHxgpc1rGyk
         3reP27FPdGNyyLwOq6uJhIvjpPAW0G1H51sKm0TKTfhqWKxy+/E8VtHse6jcEtN7J/Nt
         8JKpx6tJ7u/8mu5aRRGgF4XwhpY7cMlgW9ZKmVFFcbQmYHpurWR42up0jrkkDpWUMGf/
         kwPL+KeQZnEIsf0EIKuiZU57zRrWrWxAjG3nAQhbeY4LopV8o7MUn9sS80FJyi3kIHIC
         tGyqBqOjQ2Ky00M2fKn2hbtMU+PnztrZ3mTR2m1qJ0GmYoYsk2e6T73MYDEuXWTSqq+H
         yb+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=acvXJmnQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020ac85903000000b0043a204c7db6si6974230qty.282.2024.04.26.12.50.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:50:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=acvXJmnQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0RVd-0001Ad-EN; Fri, 26 Apr 2024 15:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RVV-0000iH-69
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:45:18 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RVR-0004Xj-W1
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:45:16 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a51a7d4466bso303588466b.2
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 12:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160712; x=1714765512; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qqr1BfgxtDJCbOWtFyibCNg276fEde+mRkEZWF16SzE=;
 b=acvXJmnQOK26rVxfSyuscFfix4Ox1oR2nmZP9I6LUdrNC33cLp2tathvwzTkZAyNqD
 mq9QZwXMf/YVxBhISNZeG/E1uXYaYVn0BMIR3DuNjgVh5pI0GBYhiRICceKsXGFo+4y4
 Uxvl135LIz/5cvud71JZk1U2/ARrzmG6HOXVK8X7r7wxHn+aCgvo8REhiOgOnEVw9Ald
 LXxoiyRsPuERdTsMIoCNq4BZNYNPr3pRvumTUZk+VxmMoLEJ+1ocdErtofMJEO6oQuO1
 WAA7+og8ONjucTcoN8RazA/bdiJTpU04V8AcHXLElfEWkBGFb85Mx6M0DQRBWmk+5fEb
 7zAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160712; x=1714765512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qqr1BfgxtDJCbOWtFyibCNg276fEde+mRkEZWF16SzE=;
 b=tW9B9VYaVaPKIhq6JXOCLxavJAfMKJVOj2P4AxC7HE5jpQFqPJmFTj/rjhzweLBdTD
 EPqFppehjgTeOA4x+VVF0xhbVs4seN+NmMYaaiYf5ritUy13XdxjJEz4qWfsicxmRqW7
 kn8QVoU0TYUQPMKcIGGzhs0kzdL1JQQ9DnMz7WKF1MuZfyovvo95pBzvh1deqws1JXGl
 NAgm8LaTXKb4HlUBbXsyrH87W8nUD9vGr5nxVNBqJnDISMZHDkNOJsQz88FfLKloU7Oz
 0mnSz1oC/pWU1N4mUETcW3wSjas0WWAB4oXhYuNOajRorS0Mhr/QGlhbX0oG0kXx4VVK
 WSHQ==
X-Gm-Message-State: AOJu0YzbXKoqKfINQ/BP90EcfTGA9Cw3oodPAJW7cbQvRNHjW4Kaj9rk
 mX5A2yea+bFZ2a9U0uiGasE4p4F0sKILSYvUVZexy/OuZvtQcPmxErnNkV7A5co=
X-Received: by 2002:a17:906:28d9:b0:a55:63de:9aa9 with SMTP id
 p25-20020a17090628d900b00a5563de9aa9mr2583901ejd.49.1714160712302; 
 Fri, 26 Apr 2024 12:45:12 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 jz12-20020a17090775ec00b00a58a9a56c44sm2359531ejc.16.2024.04.26.12.45.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:45:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 32/38] exec: Restrict TCG specific declarations of 'cputlb.h'
Date: Fri, 26 Apr 2024 21:41:52 +0200
Message-ID: <20240426194200.43723-33-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
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
X-TUID: mARumfOQmZWz

Avoid TCG specific declarations being used from non-TCG accelerators.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240418192525.97451-5-philmd@linaro.org>
---
 include/exec/cputlb.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
index 6da1462c4f..ef18642a32 100644
--- a/include/exec/cputlb.h
+++ b/include/exec/cputlb.h
@@ -22,9 +22,14 @@
 
 #include "exec/cpu-common.h"
 
+#ifdef CONFIG_TCG
+
 #if !defined(CONFIG_USER_ONLY)
 /* cputlb.c */
 void tlb_protect_code(ram_addr_t ram_addr);
 void tlb_unprotect_code(ram_addr_t ram_addr);
 #endif
+
+#endif /* CONFIG_TCG */
+
 #endif
-- 
2.41.0

