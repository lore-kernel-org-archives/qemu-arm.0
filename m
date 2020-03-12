Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087354lfc;
        Thu, 12 Mar 2020 12:42:36 -0700 (PDT)
X-Received: by 2002:a63:1e44:: with SMTP id p4mr9404057pgm.367.1584042156249;
        Thu, 12 Mar 2020 12:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042156; cv=none;
        d=google.com; s=arc-20160816;
        b=r8+j56Vkv72YjQG9yjgnY3TifL26bA2HpgeEWyg7pFF44hPHnLoRp13qVvMKMkhSL/
         DJwqHvYnKrLPvd+1fcPtHN6C4eNxQi+446ImD0OKjUHrc1MBdnlm44cHyXoMijy0B1ru
         UHAOEkK7vjaWdTlr4Vfdy4CjjFjLXj92ePT7eSMTSgfNWMPSoMSy3TcF4mYmxD3POkRK
         rhDUEWl0uEU6OvbiYLe6J/iAJ29nIE28GtWspKnXbpo8YSzjYe9Di3QxHmUq5+FrBOMT
         lmHtDTmTTes+WHWw5A8nsXa9FQqjaTvgftj75/F1ZO9YKfA9s1bH5SvekbwgzPnEnAzs
         jsVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vuXdTs06kem+zl5v2k/H9+yey7HUM714c+09ME0Bjkg=;
        b=TkuXNPwNrvJwNEAdzq2EC5OuR9S4FUa+9GoX9supGouPJdQa1/y0qAyeUkf4bPBWQC
         ubpTYkZYF89w/9MgMx9xF9/4zqXLIIV8+B7nlIhIfpIaFfKvHAX9pJsYtgBupIjeVS5N
         kTIk101mJrtIz/khJaNFSmWyVQORcUKoi88uP+iY/Q/Yw5F3RkwYpfiC271v+BikBWS2
         j8uEwJpoPM46gHZ+QBFu7D3whGSUopYOa4Ks1OJPhfKN5Ok+vUlevWDPUdx/nyVwLCiB
         GVoNXFYNldBTX2Fk9a8qOhTJ4hCrkhXhyy2q7Tp9VPcyZDeC1VNNdTa/vHBkxsS7pCKc
         QGEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iz9sohRf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id gi7sor6987957pjb.29.2020.03.12.12.42.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iz9sohRf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vuXdTs06kem+zl5v2k/H9+yey7HUM714c+09ME0Bjkg=;
        b=iz9sohRft4D9uRi34zYLnkcdeuYuaRlbH5kQo7eRR1/e7VPH4K4Tjc4NMe9l38s4fU
         LKU8fAYriEpgtYMww3XYpdo1P/nU8TZcCNienZSyx1UcLgNB5uV/3iKzAWvoE90xTBje
         1xm5O2JWrJuODowJIlGj8IlWMIo7mLelZe/LaARcxNRnT/hvWHYH1Pc+pqdIwtAqxRAy
         2N0XzpmdHo2zrr87q7rUR0TaaOWOwDAJ3joD7NkkFWwtgKJJzrDQtoJqa/jIYUcggRPP
         QVkvaxwtGKROVTsG2gPJ06vndlWwiTP9ABVW7LB/CF29Is/w8kVe5w6cOoJehDaw9Lo+
         3aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vuXdTs06kem+zl5v2k/H9+yey7HUM714c+09ME0Bjkg=;
        b=Apgb3/GE9zM7vdh2otrG6R1QJcQx0hyW2aRZm+StQhigWEH7MJtXBQVcJWNFBqcejv
         pQSCFLd5vPvMhCCD6+KL9rRp1ZVZPsozKMpxJlKNZG1qELg1c88lq4oIrvbxVPVA1zIX
         1W+VSkBj1qFAtsp1Asxaj23ozO+xSe0DCQvdzGL6sM5S6eKqykjoi8FpRXaZDkq0wXM3
         fm4df41riV4l6fIhiiymsLBugfVUEzB7QZMJq82QRfMIKCLYwpv4r/UtC2BXm+mhfG0Y
         7vYMrEkSPUri5mRlT82QZPUn4WYQXlST+2M0f/l741E++EN8SZ8yo8kMi75RFBNgzqlf
         kqmw==
X-Gm-Message-State: ANhLgQ3FKNuI3gvztaYYvct7KwQxTyh8G12yiCQriOryU6L1k1SixmcI
	zFP5sZ4pPVkRF9ywTt7ehcjtJuZ0bWhOdg==
X-Google-Smtp-Source: ADFU+vsKEQLUZZnJN6ZTtI9bx9IQVtIb8yCOdGzzJtAe2wF6GoQ+7kdu+n68zRj4ngsm8qqJtRA6ug==
X-Received: by 2002:a17:90a:e658:: with SMTP id ep24mr5584622pjb.70.1584042155798;
        Thu, 12 Mar 2020 12:42:35 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 11/42] target/arm: Implement the GMI instruction
Date: Thu, 12 Mar 2020 12:41:48 -0700
Message-Id: <20200312194219.24406-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: BvJf+ljCZSxd

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v6: Inline the operation.
---
 target/arm/translate-a64.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 02f31d5948..9adc259186 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5379,6 +5379,21 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
                                              cpu_reg_sp(s, rn));
         }
         break;
+    case 5: /* GMI */
+        if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
+            goto do_unallocated;
+        } else {
+            TCGv_i64 t1 = tcg_const_i64(1);
+            TCGv_i64 t2 = tcg_temp_new_i64();
+
+            tcg_gen_extract_i64(t2, cpu_reg_sp(s, rn), 56, 4);
+            tcg_gen_shl_i64(t1, t1, t2);
+            tcg_gen_or_i64(cpu_reg(s, rd), cpu_reg(s, rm), t1);
+
+            tcg_temp_free_i64(t1);
+            tcg_temp_free_i64(t2);
+        }
+        break;
     case 8: /* LSLV */
         handle_shift_reg(s, A64_SHIFT_TYPE_LSL, sf, rm, rn, rd);
         break;
-- 
2.20.1
