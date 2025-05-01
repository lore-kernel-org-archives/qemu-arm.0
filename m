Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19709njj;
        Wed, 30 Apr 2025 23:24:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZ75rlimzGCmFVnhMsbbG33sDTV+0A2bg6CMzuDoEI0sGiXru4HAIVfSZ3UdPeneVeP4KQ53IYtkKpXg==@linaro.org
X-Received: by 2002:a05:6a21:8dc7:b0:1f5:7873:304b with SMTP id adf61e73a8af0-20aa43810c3mr7590228637.26.1746080658575;
        Wed, 30 Apr 2025 23:24:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080658; cv=none;
        d=google.com; s=arc-20240605;
        b=FY2wmHgeavPN00UthkIU8tKHl2MWLJdtWgCYaPu69QlngLAzZ0soi/VHL/lEC8CmCX
         hgivQsANMZxBNkURTKD34cJeEjDRCWRmZqLivCLxTYz3wrKtDoM8NdKvfvwsOuOnetw1
         s1N9pSYJn5UYSPu17AxCMPJ6VlG85iR2Zgilvp8Pdt+M+UABiozIDO5g4e3IdjJ8SEcx
         jdixp9iO30UAeaTxXGxTNw6uQVgTGn8xDskJ11qifKiqTSQzV89VtNk01bwbaFWT14gZ
         izAYgqAXscAwl58qQ+xBgPuYngAYqmRc3a4hwrkIH2XZWQ7dpY43fDngwPjyWxy1Vr22
         WD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yIdah7DauyVJu2UfcXO7gW3KsF259Fcu0NGf/SnDj/4=;
        fh=H7IEANvVjvK2gz9tYaNmtYkKAC0PaBiXcoWCOmag27E=;
        b=ELZJYyNeQAbEzxIaMH4HqNnKhZSZ8xNi/90A/QUpeX7okNrcytai5vFXjci9Phk3cb
         OKdWesstl87iRi86UoABfBaVwICjgWtmH5+Wyf7wW0dCqxGkcqKvn/F6rDgBup4zPbsm
         /QpDpVw6JQL71DAkzIIT0swU5e7Z7frC5ui22gYd9+TKfeWa4EPRt6aceYo0GhYs8SKq
         lvA14rSzVP2TP6D0D4ZwPczmIYnF/TSKlygC0IVWNyiN/Ok1PlCpBhDP2qdG7gwLzDnY
         QORa46B34J5FrCsxK2vTutDCuEaffMRFTdscBleT0mzFeb3PvW/CnuLI3uyC8n/DrGqU
         67YA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bgNuEJw7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9e950fsor110680b3a.8.2025.04.30.23.24.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bgNuEJw7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080658; x=1746685458; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIdah7DauyVJu2UfcXO7gW3KsF259Fcu0NGf/SnDj/4=;
        b=bgNuEJw7XQiJZbzH/7ktom6TOphPVOi22uO9G9FtVBH59vRi9sFl8ruX7ATR5OZ2tr
         /knfn8a1o0y9aKabx9MaXpCPr1l3RFribkMVsPNsOXvCxII2sjAvwErIyUMJBa9JmouK
         QnhMThNVX7WBRP2OCDZ/Ar1i3c5i7v2+YVURxH3e9iX4yk/51kfB9/TFosF6VL2BS4J0
         8/hqmVdvlJCq9Ue5nDQqaNI6EHHGtm1dnJwAJCizPw5xo24cP2SwxmufPVOKmXU6F38K
         SmVA/zOHUaJsLHucy4u1DHAxDJkjwNOzAtRrjNwBCCmKmoaXlFAD9iyGU1j66F/q3T5r
         w8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080658; x=1746685458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIdah7DauyVJu2UfcXO7gW3KsF259Fcu0NGf/SnDj/4=;
        b=bCnAIDwycvmhfxLvkr5IEYK0KkCynsUC1Es2IlJKE1PHSlVYN1wlDE5psZgXcYLVcc
         DzC9XvDyKBSQq41j++tpvLMSYW/ZM/Ge+TszqlRs0UqOYxYt8g1CVGx4K6OOrmOSW7wO
         43YNEQBicX4rWhsPjEyZy4w8FniNz1eGm0tyf0eGg8oFGjSCEQJ/+Bvh9CUR0BmQClRu
         tb6DWwbUJpF92bX7qAZQnActOYB8CbgsdHc2GpkXIGnDTqne4cf7g0RcOVtvdOuZVxi4
         XiDfcnOQ9YTOzESfQjJO7dsyU7Xk4hgI9Otf9oCXAWHWW4D/Rhm6tqwAaIbWCZE9w6Ao
         cUXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV+Zyj2zQg1TNy1rosGxPW9f4XWBn6aIzJC6Um8f/v+l7HJS8sUKvOLXQS1cLHppDed+GNh8F2KR4Ajg==@linaro.org
X-Gm-Message-State: AOJu0Yz5U+dM9QYVUdBRG2PbVOTST6FKxy6Vuh7tj3sGur2x7kNA7Jzj
	o/zbLEEOStyQe4AYxs5t39Cu5IG/war0qgS+TAe+t83HN/t6ibunMtayPis9kiTNq0UAdZUIJb3
	Q+nc=
X-Gm-Gg: ASbGnctBl4d2jzFTHIdZdxRSap6f+cDuA1F04jlF/71qO3+WAZ7WE9kcJm5QfL8k/vx
	D+eoTCM8717nRnNdOm6dv04esh3CGMd+voz/wk76vcAMfIa8jgjkio68zS/5mzvLItGc5g29pdn
	JOET0vFpiEeiltA2VBYNqoxyUMb+/YmXXnOwFGpgUzfa52dsFSdqNg+eud802E3AcYHLEfy8k7/
	6h7z6ZFfcE1WiS9/p6RKSk2+SyU6sjoRKY2SZ8LWWUgfZHfAY85HL6KLdDgFJOVjXprldYCV6rE
	2yR431+4lha2X29dV++kSod07kgIx4EgYniUugTH
X-Google-Smtp-Source: AGHT+IHttOmkTpBafkysIVaoZUp91eACZx3aaBB5iL46qJwlCVUoqafWxeTAwZ79dnw/ta9yzjKOpw==
X-Received: by 2002:a05:6a00:2181:b0:736:4cde:5c0e with SMTP id d2e1a72fcca58-7403a77e9e2mr8027903b3a.10.1746080658189;
        Wed, 30 Apr 2025 23:24:18 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:17 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 30/33] target/arm/ptw: remove TARGET_AARCH64 from arm_casq_ptw
Date: Wed, 30 Apr 2025 23:23:41 -0700
Message-ID: <20250501062344.2526061-31-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YWNXAXhsdlUZ

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/ptw.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 424d1b54275..f428c9b9267 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -737,7 +737,14 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
                              uint64_t new_val, S1Translate *ptw,
                              ARMMMUFaultInfo *fi)
 {
-#if defined(TARGET_AARCH64) && defined(CONFIG_TCG)
+#ifndef CONFIG_TCG
+    /* non-TCG guests only use debug-mode. */
+    g_assert_not_reached();
+#endif
+
+    /* AArch32 does not have FEAT_HADFS */
+    g_assert(arm_feature(env, ARM_FEATURE_AARCH64));
+
     uint64_t cur_val;
     void *host = ptw->out_host;
 
@@ -851,10 +858,6 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
         cur_val = le64_to_cpu(cur_val);
     }
     return cur_val;
-#else
-    /* AArch32 does not have FEAT_HADFS; non-TCG guests only use debug-mode. */
-    g_assert_not_reached();
-#endif
 }
 
 static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
-- 
2.47.2
