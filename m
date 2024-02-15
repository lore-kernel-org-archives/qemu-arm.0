Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp735398ejb;
        Thu, 15 Feb 2024 09:59:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW3/hP4nGfvO2mKPQvXmCMDIFpwktf7KfTHJGIDgDUT4IfVA7DvZ8op4P9YToQRnl9h4p5YctjDJx+sS6m072ZU8WpHepKA
X-Google-Smtp-Source: AGHT+IES03/wFOiYhu9S+JEnSrVsN3T5mT7IVYbpmRJE2EbVpS3CjS/9byor6Rfd6OLqx6qYMKCx
X-Received: by 2002:a37:e20a:0:b0:785:9516:e18e with SMTP id g10-20020a37e20a000000b007859516e18emr2408215qki.74.1708019991223;
        Thu, 15 Feb 2024 09:59:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708019991; cv=none;
        d=google.com; s=arc-20160816;
        b=VOHaIpyFUDOj+QPjLG8L17JYauf0IkFhgCuzXi1GIlBNyhb4XohTpuk1F6X5WdvL8d
         r28BiqoF7RLIRtnWK2lRaEXU+hQ0zMYSz6ShOVRM1n3kToTHOv3wy3tZ+Bnm3Tvd/aTp
         6zy9xYCX51absWrQT0wkf0GZs2YK2YWQJYBjwahd57cfJ7xSe+RPELSujlfnQTq4Cxsw
         T+w3hKjMISKUmZT+CeeO3SH2V7pBkIv5R37LKKFpks1AX34J2rWOVJlXBopuu/ecwlYn
         fJ58zfgoWKow1gubH/fIKJvgC3Maqd9RaHeA6YSFNAE38A6Na499KL/ai37bI43iZ1Po
         +mVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QwNGEAWw3MyWyJMilDfJbOdNttpJtHg5vNKPkajCNqM=;
        fh=lFbaFE9CCURXS2ZRFy5xEQEZPoERQGZgvMk0cqzTFRw=;
        b=RPAO6h3v+gJdeA4atIYuqcxX4HrXXXDTa1rYJVP+UnDsFqrBtBGZO5UBmsK5stu7X4
         e6L5XLvfEhe8q7zXkxdMolP26eMloHAgFEv6ZH8Qsr5eui3UR5aeFdvUojpiCApSw6QE
         0JjebJ0KAAhLsxiGga584FhOPHw1emNnyLpyAHcfBhArhF4jATsOqqni4CQeUEDBOIXc
         lIk5Ol3IaQ/YnWesG4kgHWF6H6NZ2RK3V6dKdbrwECFlVt/HmLjiWPRzSBUI54oZ/7WY
         +lo60mkOuVvClkO3Xo+jSKkZIWk+fdQvMVSAEQ3nKmjpqymBHXUam9RjepLKDqjY02bm
         GJxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ca0UodNf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17-20020a05620a11b100b00787320b81d0si1949044qkk.676.2024.02.15.09.59.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 09:59:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ca0UodNf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rag0o-0003PZ-0H; Thu, 15 Feb 2024 12:59:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag0m-0003Ec-5j
 for qemu-devel@nongnu.org; Thu, 15 Feb 2024 12:59:04 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag0j-0001fc-JR
 for qemu-devel@nongnu.org; Thu, 15 Feb 2024 12:59:03 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4121b1aad00so5988365e9.1
 for <qemu-devel@nongnu.org>; Thu, 15 Feb 2024 09:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708019940; x=1708624740; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QwNGEAWw3MyWyJMilDfJbOdNttpJtHg5vNKPkajCNqM=;
 b=Ca0UodNf9gv1AhxCnlyu9vDQPUvpYlgXNkaQnP3ndXISz9wV6Ic10bT6wk68zb/Lfi
 e7bsp1z5Sgbq44SjhVVuGiV83l+df/VRuxO5zVXMbtyjLd/NMuFWGuvlDSTtrbCnxVpO
 LjwB6Evk6Roan9Ph9wVDE/P9T9rSh8PK2T8fS9xz47X5w1yQAROxJMhShH/n+U+xCF0o
 OOmCnIWIyqg5hNggYov1/K0DkAtwwkWkWO7+aGRb9uiK8b350b6O03XtbYwsjQ/bIICR
 CeNI//H59sI0KErEuHP0vwwLiIFGM/tV8YtpvxWDQNZbl77HvZ5MWSxZdyTopVHo5zSm
 CEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708019940; x=1708624740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QwNGEAWw3MyWyJMilDfJbOdNttpJtHg5vNKPkajCNqM=;
 b=iUAr0rV5bQ6pfZFV/EwVolT7ULDEN9N1HlVi1LIkC52xGWepvzyLJavcsQD3MLe9/e
 O4RbrV1iTLNXv7Kb58MStiPSkBkTG1wTtF+oLHnvWRefyGzeRz4QLj2y6quK2W7yQPvS
 Ba4wsegxep3gzlEGZyyrkeTOT56cRhfiD0gUFs+451w9h5M3Wvf4kSsTTRl6gx9UuNT4
 OlNzhh/l1hbwD4YqZldD7riDX8/6A78SNRyLxkdU/7DFOAd3aUifCbI7qFliLcXxrKiP
 ykU+Dynn4xam+yFl+jWDObnTOoogJbX2Lm99Lr9Eg8W7QbONjkgxX0rki2PiUyN1Ry79
 VyPA==
X-Gm-Message-State: AOJu0YzgjHS4PeOFIjBH4qzwm/BiHMcfzKAh8Dp4GWDVf1SHiany5Bd0
 o8q4xbN9s+RNA5CUeWg3t9szwuf+pLKkoDTCeFL5sQeXrDP6cvIjQY7+oakegpOZGU1Sve5pD57
 GZIo=
X-Received: by 2002:a05:600c:35c2:b0:412:37f4:4a3b with SMTP id
 r2-20020a05600c35c200b0041237f44a3bmr120956wmq.34.1708019939901; 
 Thu, 15 Feb 2024 09:58:59 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 fl16-20020a05600c0b9000b0040fd3121c4asm2801783wmb.46.2024.02.15.09.58.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 09:58:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PULL 10/56] target/mips: Remove unused mips_def_t::SAARP field
Date: Thu, 15 Feb 2024 18:57:04 +0100
Message-ID: <20240215175752.82828-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: THRRVZ/lDMuO

The SAARP field added in commit 5fb2dcd179 ("target/mips: Provide
R/W access to SAARI and SAAR CP0 registers") has never been used,
remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240215080629.51190-1-philmd@linaro.org>
---
 target/mips/internal.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 1d0c026c7d..a9a22ea00e 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -83,7 +83,6 @@ struct mips_def_t {
     uint32_t lcsr_cpucfg2;
     uint64_t insn_flags;
     enum mips_mmu_types mmu_type;
-    int32_t SAARP;
 };
 
 extern const char regnames[32][3];
-- 
2.41.0

