Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1278934njc;
        Thu, 20 Mar 2025 15:30:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGy85U+Enlus5FySDFf5x2sOmrrk+N02khYTNg1jHIsyvxnI646IHt8WfYN/qcm2UfmqHSERQMvLJrkA==@linaro.org
X-Received: by 2002:a17:902:cf0d:b0:220:eade:d77e with SMTP id d9443c01a7336-22780e10a17mr20095595ad.40.1742509822718;
        Thu, 20 Mar 2025 15:30:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509822; cv=none;
        d=google.com; s=arc-20240605;
        b=SyCkzSBXjXHyoNAqSYiASTpsC5u9H4IREaPgH+TyL+clrgsSYwZHW5jxMvslmnVVXP
         Tk5Huj8eU/xbcvgZOvcuTIurD1w2JgT2KfkrWUf6/Bk5ad5fAdoq6g8igpLsaM9VP0PU
         PcuszbX+2iUqc/3cNl1Probo+O2p71dlTttU06K7LPEfGSEaL81b/RfCQhHJKgeMYJZW
         Dmv0LW7hjqipw7Nfag5JMnHTtlQMNzP/twkVurBVYWCf6bdIXwZIchxoH2/ylLXPxdA4
         ja85Uu8PWqWmLeHoJLyW3Q4PsD+XvZu4yDufuEMBMbMhe+43pknuooldVnv6BLr63h+J
         3Jyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=purOXWOR3Fj7UU3csfI8HYdWZCzZY8lYxjlph8NWhiA=;
        fh=SwBSsG9Fzf3fgRrw2i9ZYTFXEWIUehpOukOEateNit4=;
        b=OaWuQYAxyRwnnVtXvNrxr9JvZOst1rn9D5+yIAF9OwXZXsV26bG72fgS8yIoIsILUH
         NMQxL/kbAH5iiVaYCGDRBBr2m8qsE854TZlf9RTgJE5pUMNBmF1GvIVCCDx4/wuYSUyv
         sfOmCvpxUpxAWnxFl/zWm7ZmCjE3nYXos/lv3XefuXzu1JujGUqn9uQoDpATjfotzCIC
         tqzFmTETnR8DcU3z5Yxbt8whomv32/1E0rjFTBV7EDuC0c4JHrKEn+K8xoxbUmP8kpRb
         VrO10lfiy1SqumjJ7LiRd7wdrG6k5PuAQCFvPCeF4gn1q5m5dqM8Hp4nNC4iwy3HV6fs
         mfHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g0GTQCwF;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780ee4891sor3376885ad.1.2025.03.20.15.30.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g0GTQCwF;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509822; x=1743114622; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=purOXWOR3Fj7UU3csfI8HYdWZCzZY8lYxjlph8NWhiA=;
        b=g0GTQCwFAabiEUyGAyUeQovRh1p0GC3ysiBF4qNo4yGRo7oPZWYHQ/yNSY7A4z8ZOj
         WR9jJckAHugO4Yv7twAMdq2mjnuLuPtBIz3LwQ2EN26wg0/Zw0dd/LrL4AFkhujSL5Gn
         3yp7OcOOgsfQCsdsnrUSz6qAi7isODKFqdHkA8WWDs7lhhIZdcDQTyYLgKnKGysDlJy2
         xhVIy+S/RLJoELcP+0+fsn6udKB67P0uj5pZHJDN7od/OmRlzKqYH0t9mKwg7G5xmI/o
         It+Csa5ptVPxiKaMOaDPiD9mDdxa7OAZrJbcfV4NQlj4JjfBoyOU6R71653jqA7Dx0Xc
         OPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509822; x=1743114622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=purOXWOR3Fj7UU3csfI8HYdWZCzZY8lYxjlph8NWhiA=;
        b=UK8hO+DKJbu+ownzVsgpBGrYfDJjQwdE8HnWfxTgDLtnfj1X9Qh680fFV0sycDcFnx
         gpAOhZh1W12icvn0c55BLo41HG+U5hG1vx2CtB5XkUjCo+GimQQU3pNxzBBDeMEedybq
         0+6uNy9VPMr8eTO1e3ttMNG1N1lUXMlxx6PRbD/AzRACDofIscdHbI8qCWVMrI0evnQE
         3pS4TxAOfY0LCF91myBQCf9itlEn4jVL8ZBWt0InXHVwbUJUA7DCrjvpBHuYKzagI0nE
         6nZG0Hz6t9of/7aGBmcXtgRewqqHJJ/g8kAvfqaKyllTj8ZV6SQgExWYPWrJiQ2ONpOa
         vBbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr4rq48PQfAvQDkMgZS4WNBMg7ZpqE9dPtc4AdVNi+W7D3gqsRZ6SFqqBPoh4s7WyZ+ZDDY8iIXLrC8g==@linaro.org
X-Gm-Message-State: AOJu0Yzh4tyt+50TzQZkIBQTt1L+4BDvI5Gy7P1WkqMXBx6KyrDIWLxg
	US1Q6MRvy9oEJgmWM1MnvFYIT1TjoyWmyclUY7pdfn772z0DRzaeTrHioVyul4hvbA==
X-Gm-Gg: ASbGncsQXjVajH/xi34qwSXTJe5zfr6+ChLfRNKb/Nh2pqGpVc6SBHRkxugujIFNILe
	dUsDXAZH5gXY8RHGJtZ7C1Zw3vrWCWORYHqhbtfXmpn52Bc6Bx8omnB6jClliSnZ4c/zQ0vrq1j
	6jhRbCPiK1SkaIcdBmHDGGGp8X8jqVM7+hl4Zhx2asdUF9U3fGXUjyOC07a8vtiKsBG755lcSct
	AbWiGfPi655F70Ua5eaFL5ljHAob8mDwNaUHDeVt7mqWg5vIbIlyv6gDRorkZIT/Ks2V+CGC4eg
	Qox8r2eyvGY4ps2Hx0U8sD1kXmH1LsfKdeOjMI3Q9IBR
X-Google-Smtp-Source: AGHT+IHaNLh4H3nOX0n5FztI8RzThHS/Cd+JnSg5LqxEttWiRhXwEic0w9kPLtKsb41I99998VMKRg==
X-Received: by 2002:a17:902:d4c7:b0:221:7b4a:476c with SMTP id d9443c01a7336-22780d80176mr12012615ad.18.1742509822336;
        Thu, 20 Mar 2025 15:30:22 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:21 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 09/30] exec/cpu-all: remove exec/cpu-defs include
Date: Thu, 20 Mar 2025 15:29:41 -0700
Message-Id: <20250320223002.2915728-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 2C2DPHkFO8Ge

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index e5d852fbe2c..db44c0d3016 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -23,7 +23,6 @@
 #include "hw/core/cpu.h"
 
 /* page related stuff */
-#include "exec/cpu-defs.h"
 #include "exec/target_page.h"
 
 #include "cpu.h"
-- 
2.39.5
