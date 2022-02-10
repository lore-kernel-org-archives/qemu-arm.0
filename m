Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1287671lfk;
        Wed, 9 Feb 2022 20:04:39 -0800 (PST)
X-Received: by 2002:a17:902:f60a:: with SMTP id n10mr5959073plg.1.1644465878975;
        Wed, 09 Feb 2022 20:04:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644465878; cv=none;
        d=google.com; s=arc-20160816;
        b=fo52iXBR1cO+5nRWD1YXrAZb0c7YMgNKl9OEgWCBqNwcz3swGQafNwT7WUEVL6MPz9
         pXTNWrmPcAUfyond804EHBtNRu4jTd3Uu4UgpR5LZe2yZtmqSNRAAiXOEhqPqIiWKYlX
         66XJvmw26FMBX6OY00cOO7wJBO753yDOeLpLig2jFPHh2qTP16c3LWMutGfWInsQIyoy
         2oDOBTZdbBfqKOuCVmrzopUFsBSxaa+Q76Tgta6g+pRtWR0F2UNfXRkym1K2LheSLfd/
         h8xprGLCnqNXxg7LBwQZdM+Tku5U1hd2VyMgJK05ggQYJ/82OaWjV5ynNwLGAsVrJTi1
         E9Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6GEKuSQX+CG8gt0Gp9cWbbYI/Mw1WHwT/DCHRQdQ0Wo=;
        b=pOCOQRAvOj+42q6ERu23+r2P1HxAG9utuk9LU3NTAYVmFH3gjLv5wv5JnGiRkJvM2E
         ECJ75TciNWXKupW14laWuNBQxBehD/JnmDn5UGWOIzF1d6WhynwsvAH4AbRx18t92NLX
         OFQFq+1a6no17sIfvSHxXxXGNEGy0Gb2mD/N9IEtDgI0WR9StRsiQSNXpLfCKQnhyeTn
         pf7UxpjkluViMxxDtooOujaGSPo50nkG9OEIl0q7I+TvKNWvpIk48hoZptUfHDoZo61k
         8ogcc2eYbcFL7kG665TsycYDW6I4FAVoP2MLlQYdlo03nxe4bSh5OxQacJq3W8riNR7G
         D5lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C0+Zc979;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k13sor389796plg.68.2022.02.09.20.04.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Feb 2022 20:04:38 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C0+Zc979;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6GEKuSQX+CG8gt0Gp9cWbbYI/Mw1WHwT/DCHRQdQ0Wo=;
        b=C0+Zc979DKm0HtHVIYzphg2iahc5MEGH3giJcDjotVxWiX9WGysmtfpqykIAhJDNqL
         C6By6zaYx2M5lThzs4F9vLKkudL+HbEvbJB1cZ71+xPRacDan+RLcksfYKa3wkk/T2NF
         bN3wtfc7hgQtYW19Hea2WUF5y3wEYztDsrZnYHD4zxnqq7FUU4OfK0HBCNCZR2sbqnyf
         xos1qUn2DKUmsjRenneyiOO4CGbbd/cQhmtnv9os6quloGLDsrZ+8xkIvzmHXCOXAtTB
         tLcYfP/7TB4ItpRyh0FB6Bf7hRJFqR0On5ZLHIq+Fob8y+m/VNlxw7FParuRUi9JpOhF
         BdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6GEKuSQX+CG8gt0Gp9cWbbYI/Mw1WHwT/DCHRQdQ0Wo=;
        b=ZLGy6wdDMAX10sS8HfOeGdgo3I8KPvvIWvKFqydyA6X8hBe6Jd8Q6fUid3ltF8baon
         iSpd/3no7zwNsXzEQ+ToxeYJzjD5IA+aOPrU30WEM8awHEsejMwV+LsTbL4jiNliuT9D
         dSpUtDRhh3zpsz7eHvFzAL2yP+aHWRkl20mQS0J3Ru2+C8uoXgPUkL+9Zbfr7OOVNK3w
         nSgee0nRdwfDx6bU01ZO6k0eUe+aiYH9+asleUCXP/NyTzmF6HE2MdypHaEPNVaECnb/
         DCb+/jyK3148+wl0FycvktfWZuj/wb4llsmoB4yPJZW4RyFmRcoGJOMyF8/5KByWWnXW
         SMRw==
X-Gm-Message-State: AOAM532nTjGyI2E5kl19UtGXsQudFwjMsmdw397le01tzY/rTN/WD00f
	ztDptB7XzJZTwFFMzi5/DUCfASfh
X-Google-Smtp-Source: ABdhPJzVGqBtuSreWgvu904LP4dfn2quNXp3d0Crw2xoyeoJqgE+Gt5mBZmpNSXHpgtwlv+9+JrciA==
X-Received: by 2002:a17:902:ccc2:: with SMTP id z2mr5498369ple.145.1644465878436;
        Wed, 09 Feb 2022 20:04:38 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([124.189.222.164])
        by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 20:04:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 02/15] target/arm: Set TCR_EL1.TSZ for user-only
Date: Thu, 10 Feb 2022 15:04:10 +1100
Message-Id: <20220210040423.95120-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WaIzjnK6T9Bz

Set this as the kernel would, to 48 bits, to keep the computation
of the address space correct for PAuth.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5a9c02a256..92f19f919a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -206,10 +206,11 @@ static void arm_cpu_reset(DeviceState *dev)
                 aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
         }
         /*
+         * Enable 48-bit address space (TODO: take reserved_va into account).
          * Enable TBI0 but not TBI1.
          * Note that this must match useronly_clean_ptr.
          */
-        env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
+        env->cp15.tcr_el[1].raw_tcr = 5 | (1ULL << 37);
 
         /* Enable MTE */
         if (cpu_isar_feature(aa64_mte, cpu)) {
-- 
2.25.1
