Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42582njb;
        Mon, 12 May 2025 11:05:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWnEYwrm6LlQzSjWlsA/ZDTPbcd9MJZgKBkEIbsi/xM6qvU3SPN4M2hpbwjE23A2i184t3h1E6n1v11Ag==@linaro.org
X-Received: by 2002:a17:903:32ca:b0:22f:a4aa:b82b with SMTP id d9443c01a7336-22fc8b35a95mr200913665ad.21.1747073118397;
        Mon, 12 May 2025 11:05:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073118; cv=none;
        d=google.com; s=arc-20240605;
        b=aKTku8kUt7oXhNVi8QQLDjTDvfuShTpCQigekM+aA3gU/KCBuW9W/2ZbeP83NOIfVc
         cC/4MfUGObhlGxD/hLG5P0INJ0zEWmFo8rT3FJuGWTzKdrshlKlZF5BXSiMNyjlnVxRS
         NZ2uQtiTseetmYGWU+n2Uzd1J3zup9QYPlPKVMRfZaCU327CnzSl9DPlDGpIwaD2tkL5
         8lonj8PGsVEKBsiU269JHC9XL+N3hWf2JmzBo/+His1A0OINtOgGpWZP0UC2fjl/iJQa
         bKNfymRpFQNjKrxIOi5Q9y1rEo1SocpHEIPLFIPkbBEqypyIWR+oEhW9BhW6UIyXswpR
         13CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sgtD9a+F/fV1o8g6sPaSIZoYXGKqR0qNW17PKpxFW74=;
        fh=x4P+Lh/B4FK3orNp6MHFE7BG0G61g8kx/RdmQJPtPc0=;
        b=Ydmcbgs3oIZvTLGyBgc2mixXne8mil90SY7qdYVGDnLSXTz8j/Tfyi5GxTJKPmBzO1
         +rtbVO8WdMiriO88RH7Dy/GT1QBrFQQr4WSwF1r/s6q+1m7TUitXTn2UkmI2AoO7FtI1
         ld0OI0bUtPl8atdhnqBOP6zG8wZwti94FgBccctEbDgheP5Uc/WxOa1gNnLoAHgrB1zl
         rOod88aqv8bgtVu2i4KYyAckvUjxIig9rm0p2BLIWTSZiMGTV+t0zKd75JmpYaVC+kvQ
         ZtfGABmkXE58X1j+iV90jxzhWUS3uBN1yPi9Wz45xg0nsMcjb5+YrUhiGqHnH+okDsgk
         YKnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vt68IOd0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc61408f9sor48672725ad.8.2025.05.12.11.05.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vt68IOd0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073118; x=1747677918; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgtD9a+F/fV1o8g6sPaSIZoYXGKqR0qNW17PKpxFW74=;
        b=vt68IOd0wrzhqPbVdt+C9Z4bkLzS7KTtGSTMTjoiw3orjJi2CdkdNFmC8DAllo7Ir7
         Q92rEXQsCqcMrFl50zT7yf49ZGkDKxpbMBGS0R8lMaoX3qxKVg9AQBjR9RlRk8eobExu
         nttQctpLlr8ZtVSaGv7rabRXooSEP4WosGkECqG2RLBtUulmQwTY8S3Ng83hZIXe+MYU
         8ZOJcjP2vx3EiTfuxfWt3DNBra5gvedCygxYGvLKytSOxRWWnhLc7JSShHZJq69bYiQI
         IcBP33QtnMZS0UtjzSSwgx6eJS984qmz04jEuoGQdjABeCImOcXFD+qfTihib3oc/nqI
         ArCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073118; x=1747677918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgtD9a+F/fV1o8g6sPaSIZoYXGKqR0qNW17PKpxFW74=;
        b=ppiJmEuIOuPV0z8ehmHG4365UMV18g3gQgfXkZWdp0BOtD09ZKt836tWoi2IZpvnUk
         Vbzb2SLcl4NW2UOX7+sOXmoNNLbtsTVzbaNlVWXG+T/4UPP0CQ1P24YzrIvEzJinFb++
         eACJINLfVNrpPmdLQTPpr/huyhR9dj8rsLVZwvJqE+vUdv11nVOwEo2xFyt4qtClqglD
         adBw0on1vU60U9kgoq0qhVcDy3VDLYYkaJa67F9Z841isQWXZHszq4GzhlSsuTiazxbv
         Rzs/c7Q2dyh5uTRgtC7TyDBHQkmFxv9tdHySD6OXYLuRKCfvLnUpt7TWDwbrM2mieVBA
         u5Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXnfSmQK1YB6MA9MM7TM1GKcST9AnyIqSp2Qqdz7xo0GbuOqVtTvxOEpbIvcjsex3ysMcaUU8CLZgLH/A==@linaro.org
X-Gm-Message-State: AOJu0YyZdTXSK4FmDb8zWBmwousr9cuiWGsU5MyqZsT8EFojN/rygnC2
	P+3/pYzurex5pGg2XQTp8jZw788KngsFKDGQRhN1MMw7g+PjfGVoOKxCJD2jfM/oAA==
X-Gm-Gg: ASbGncvLiuubn9zB5oRB/geafddiHVL321xX4HRv0dxMmIPLtdQJhDeOhcbu6b9sPf/
	+ywIrRJVmXfECgZB8hGOiRElFNHCppfedBC+2zqpMBb/9yIKRH0W1C5aNr1eayXh9eMBRYI/NSk
	IVbZS/U3KRsPlUWlrGkjKoeg9ycW94xfoxu8zsalNaAlcgdlAzLjJX5iych8sudGKCdAE1Bo2dX
	ZMZzFsJZI78jRV53r25LsjZ456xAg9F5eCv0IhY54b0fTTTC6a6CEKX+y7VLk1HGzO5JWvokyc1
	95MpPPWQvBi35kVU8xNdabD7tTLcilenUKn/NW+Td42xp01P5mw=
X-Google-Smtp-Source: AGHT+IGFDRnIr5Z4IqZt9DDblisny1WwCZnifEmguV1wibcZJg9l4HCbr3eQigE/HjWaaYhhQjCACw==
X-Received: by 2002:a17:902:ce83:b0:22e:7e19:565e with SMTP id d9443c01a7336-22fc8affe99mr158659855ad.3.1747073117982;
        Mon, 12 May 2025 11:05:17 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:17 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 07/48] target/arm/cpu: remove TARGET_BIG_ENDIAN dependency
Date: Mon, 12 May 2025 11:04:21 -0700
Message-ID: <20250512180502.2395029-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ctMTWvpczZy3

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d062829ec14..b0eb02c88ba 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -23,6 +23,7 @@
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "exec/page-vary.h"
+#include "exec/tswap.h"
 #include "target/arm/idau.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
@@ -1171,7 +1172,7 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 
     info->endian = BFD_ENDIAN_LITTLE;
     if (bswap_code(sctlr_b)) {
-        info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
+        info->endian = target_big_endian() ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
     }
     info->flags &= ~INSN_ARM_BE32;
 #ifndef CONFIG_USER_ONLY
-- 
2.47.2
