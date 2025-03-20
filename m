Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1278963njc;
        Thu, 20 Mar 2025 15:30:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGnBlFv4XrzbnYJDQrp/tUEhjhaKsEwmk9p4zpWQIkPRqAWbtE6sbXWyN3p1l9rZqpf/ckWN+kkB9zsw==@linaro.org
X-Received: by 2002:a17:902:f648:b0:224:fa0:36da with SMTP id d9443c01a7336-22780c7c06fmr15411145ad.18.1742509825427;
        Thu, 20 Mar 2025 15:30:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509825; cv=none;
        d=google.com; s=arc-20240605;
        b=f7AL2cPUxu6s0sbvU+3h0pfBpU3ZoAQzihOfzfRkJShIrkUO5QyFs8Gz8Hl4rv2fcH
         NgraI2U2G0L2Kc4VHXFvEYJFCaTlk1tqVpgzbcCIzlq7Dao7sSWEKXyJV9P7BYE8QdNm
         5FgABh6VqN+ta+7fOwKpgahnAsZ4oqSMEYZbDwgzTlKOcbVSCUCCTIBtkRGnA57lurUO
         stde6NYGr58LCr6AKsmvqfgB+tsyMXS5IbrxeF40SnF8BvyhxeS2k+9iDWnvkXtgQZFD
         EnzWjNBIJU0mzap/aOkq36B3fyOeUanCNE9IGKFl2OfpfaLterjjG3Z6AFXjdUWyo8ZV
         XZuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pRpFizF/E4rJtnjS8JYR/AaD9jyyXl0WSOs/w63P0CI=;
        fh=zR8ATt9bGma1l03TOU6Q75Tt1AV6f5yj701RebgKO9s=;
        b=EJ29bMelisv62fYgi+ZrUMwGwMNuAHLHMi/+mKx6cQY4Te8nDkw20W/ijCj4dqz6H0
         GsbKhCHFLrrL0w9I34VBkdOYWoV485P7WDyvv7C0W6vnGtt3WL1RKTtPaoUmJfzNG+F+
         7wfuCPH/tDQbIZfcy/M/N0QCnNCVDk7HTIzX15oQl+nM+4gWG/J0R6c2l5FmgwspZ4Iq
         XFMN2BEALfnq5bemg4vH6B3hs/3ijZQ0LJwSteikpwsNnohvZUb54yhNmFSbslgMR6SV
         eb1O/EPWAGFFeb3LZWlQZMTBvBIKBone+3OFrLXgdKhxZwv4Q6KHogYdiwmFItUBi3C0
         VJ2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xLGT55EB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227811add57sor4211415ad.13.2025.03.20.15.30.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xLGT55EB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509825; x=1743114625; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRpFizF/E4rJtnjS8JYR/AaD9jyyXl0WSOs/w63P0CI=;
        b=xLGT55EB/nvKF00rlnLFdFTXfzZqXPA8IExiWETP60GRYTP3Mx/9kQvg7B/cHcTTpO
         BdYSOA5eA3SO5gZS5bFEgzWiIkcaSn9dczqTBNKdvoOnQdfoKF34LtT8DfT35ROawqzL
         HFGB78FWlsl5bBKaCOhXA8j7UM21+BnAUvS97GFHmqGOenZuPSTBPELuhL3gQCeNeJ1x
         noqhczhOMEz+YHNo9rB93DViYKHae4bE4z+M7mfSz7i+NwsW8u3DaxKjsC20/dPb1tUd
         YLrq/X2br80jC9XwBqQSnA3XN36OYWrDjrQs4Fck+k0XvJLRZItW3LgLP4/hBdjMpYPk
         jK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509825; x=1743114625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRpFizF/E4rJtnjS8JYR/AaD9jyyXl0WSOs/w63P0CI=;
        b=jLSAwGVFVxKWMzwwKSiO5RBZkl2ZmA5uYq5hTIgJ2zTUr4VQGn//EfsqbDKffPYRwF
         RCKpUmgte0GjvJefqGPFgtZh+aqZqZqsCk94s5hm9XAHMRAVmCYIEbsRjzy/pig0ofs+
         mZgNWuU1og6g1DPX/vE3OcI4f09CmDdCvlMVlJi6zxGjRlrKKkIWdFgOMIGrQZnifie7
         9bS1+CH/krS3O+7ERKee/zYsuR67XzGIAmMsPYM9YDz5zpaGMhkg1xRSGy8KU/KuYYPb
         DFynAgLv6pgSrqot4tAPOmSIJF5BJpKSlKY+u9mp6JhVYsthHtIEjHl3/KszwVkSGBT9
         Tuhw==
X-Forwarded-Encrypted: i=1; AJvYcCXgJWmwnAzWNC4jMbfmzNqMrvsQpiJUh5i3MM08h1L32J6Il0H9DeAI4GWm0tMptpzvGAkEjXZdqmNY8g==@linaro.org
X-Gm-Message-State: AOJu0Yya0jQSgw2DGKgKgqiiD4rNOs6Gk21nBSag62XaneJyrfLOyYx/
	aZ6B4YZI8in+SBpLecmzdEDA8TwfGBOjYaxwyPe3J8A83M1JlEPhWrdPw8+ekRlO6g==
X-Gm-Gg: ASbGncuOtpULTUlAn8Rq+W4Azf7wFiyXKaatfO2KJIRNPBfkEb85mELI3LiIPZBqWyG
	KGxeulaYhrjxWOScJshyxgogCuCJsA1huH4wfMeoikHjO7j/l8PgqWZqhU6RrdyJwx/Y+e30vZ5
	tG79hEDFT90iklu+Xz94+42nL25VMJotzawVXlapDLb/rGjXaVQH5L7UyqORG+Q71FPkVVGRXqS
	CMtPjVBZbJsbkkApMiJdB+EDi+ucKNy2gnAMwb9IrApZsQQUcU8bt3sgxCD5/aGSdlYz3eEXiZ5
	ugONnnao5aoBuipIb80I1NDMC2Pm6n+hd62SeHIiFh/0
X-Google-Smtp-Source: AGHT+IH7BU2m16/sgWEFUPShLOXk9J0IKxzRbCfN3ZFlgtRMYkB/snGd7MYIM9wzSgKzXv734g5omA==
X-Received: by 2002:a17:903:2f47:b0:224:376:7a21 with SMTP id d9443c01a7336-22780e0969cmr15319855ad.42.1742509825033;
        Thu, 20 Mar 2025 15:30:25 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:24 -0700 (PDT)
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
Subject: [PATCH v2 12/30] accel/tcg: fix missing includes for TCG_GUEST_DEFAULT_MO
Date: Thu, 20 Mar 2025 15:29:44 -0700
Message-Id: <20250320223002.2915728-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: j8MRXyNZPzG2

We prepare to remove cpu.h from cpu-all.h, which will transitively
remove it from accel/tcg/tb-internal.h, and thus from most of tcg
compilation units.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 accel/tcg/internal-target.h | 1 +
 include/exec/poison.h       | 1 +
 accel/tcg/translate-all.c   | 1 +
 3 files changed, 3 insertions(+)

diff --git a/accel/tcg/internal-target.h b/accel/tcg/internal-target.h
index c88f007ffb7..05abaeb8e0e 100644
--- a/accel/tcg/internal-target.h
+++ b/accel/tcg/internal-target.h
@@ -9,6 +9,7 @@
 #ifndef ACCEL_TCG_INTERNAL_TARGET_H
 #define ACCEL_TCG_INTERNAL_TARGET_H
 
+#include "cpu-param.h"
 #include "exec/exec-all.h"
 #include "exec/translation-block.h"
 #include "tb-internal.h"
diff --git a/include/exec/poison.h b/include/exec/poison.h
index a6ffe4577fd..964cbd5081c 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -37,6 +37,7 @@
 #pragma GCC poison TARGET_NAME
 #pragma GCC poison TARGET_SUPPORTS_MTTCG
 #pragma GCC poison TARGET_BIG_ENDIAN
+#pragma GCC poison TCG_GUEST_DEFAULT_MO
 #pragma GCC poison BSWAP_NEEDED
 
 #pragma GCC poison TARGET_LONG_BITS
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index bb161ae61ad..8b8d9bb9a4a 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -43,6 +43,7 @@
 #include "system/ram_addr.h"
 #endif
 
+#include "cpu-param.h"
 #include "exec/cputlb.h"
 #include "exec/page-protection.h"
 #include "exec/mmap-lock.h"
-- 
2.39.5
