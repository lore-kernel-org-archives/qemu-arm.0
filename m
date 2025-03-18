Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2694620njb;
        Mon, 17 Mar 2025 21:51:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUrKWX5HVHDeSZtrbn5znXtLHmrPCeSjB8nEYSZ/nUVwSns1BPC5vppOJBb3BBwzsswqpgXpwB2d9cLGg==@linaro.org
X-Received: by 2002:a05:6a00:847:b0:736:46b4:beef with SMTP id d2e1a72fcca58-737571fb74emr2992153b3a.3.1742273501187;
        Mon, 17 Mar 2025 21:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742273501; cv=none;
        d=google.com; s=arc-20240605;
        b=CJGASRz6awsAMWZK8cbjjpvLgnCRVis3Luvoks/GQmg77yIjzGN6PDb3KUNVetvCym
         VcAm3VSrmRsvBsLeJABG124QLiz0wPV7YmLoqb/Gl1PDogDA9qngjj6VfwTROlnLhEjf
         mELLB/YfX4BWEVksAmYtiBKvL/hSw0uxlyu4+SZFhVqSNHiOu4sFagUriBK6QJaoqtjw
         wluvS2vVhxc4hX5o2VTQeL+k0/Q3c9WJMserxScZLDrEbWGQHDc9/PwbBp06EPRQUYFt
         5Q0ZjGOhf7q5mvaoO5ygoDfl2mVJHkvWtoH3Pg+U9F7LTpUksSBeVIcHE3Dej9V0+EA5
         I2iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zREl7MPAGqYRU9KvXrtENxfPFFrO3Nb7yWvR8XbX8nk=;
        fh=x55HddX+AkcHPV924ixHP1IoWm8vTpJw4syzr5miLYo=;
        b=iw41Ps5GI6xS9DQkN0w1FWVjzraPNmzME1u9viOg8kLbtbLv38NLI6E2yyL5jwdKsV
         BlDvCSGjnRSoku8oz701GOn9PJIrMe2FsOaTfv5PCNc3bu92MhsP4+2QQ4do4P3qtIkf
         KMWVxaY2ovLe7YQmbTxSsR3hJT9OjgQnrOSuM9MW0E014z1VnroEongQKsz3/dvjz9et
         B68smUo2/YwhHGdF7gqfnXXBQfWh2vOaX4FlDv2wN9PKFxk6mcWxEAAheYx5b0OvAdM0
         AntzMyw+dpClgNFMIsi8HGh4qTWb6L0tOcv6A9rX+ivXYTJUgcQslkSMSPpqLOWLiulv
         wz4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C8ZPozbX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-737116a0017sor5343380b3a.10.2025.03.17.21.51.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Mar 2025 21:51:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C8ZPozbX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742273501; x=1742878301; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zREl7MPAGqYRU9KvXrtENxfPFFrO3Nb7yWvR8XbX8nk=;
        b=C8ZPozbXFU2BG8S8kzXYE9ZXbRchLj471UxPRk2NJZAzjwEIFfgqpTsOEKpP23FqJ0
         HwrsTPaEaG9xLVY0tie7dE0koSojfFO2tBZIPuOVKma1+F5qbOnfIWqJF+0A7NwDGSXs
         wL1LNSBZchJrXlhX+g1cs2oLmO9GmcPpJl7DR+RkgZYPqfM+YwvKrgMdRBv27QzGlMmG
         dH5zOAZrNHBbllAaJfq/5puVDXgkqgqVeq82LHUDrWoSHwyJPnLNHgE+fSbtKviisAzq
         i2IeegvN7sppmQRyPKp/QxqzXJvZqYNA7h8RJSjwGCZcoMlq/LxXIbMn2h4W9Go54d5Z
         8HnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742273501; x=1742878301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zREl7MPAGqYRU9KvXrtENxfPFFrO3Nb7yWvR8XbX8nk=;
        b=ZG/3PUR6PSkb5eup4qa2uJ7p8f4lG/ySOjPjoYHj731N74airX3eS1ZBuSmHDy6ztm
         bF63NZGsUDWWSFKvNj9riqAajrTTxwIP8V1yE3gMOWnuglu0iwTyVJy3Lutb10D4Atus
         aNaBfW7Ktrv/5a28OsSisMKr4SppQJNz0/FJrwBZ291oyV5VU4qcnmVuSBcLdVOZaiv0
         6EhyrmcKSWq1FlrW1rKHz9cOV1BbC6QkLMEJzw//6OXWACL0XmSJAdEJKByIyfxvZ4yQ
         2SQu1pHReZTEWF8rGMJ3T5/LOe98yj2OcoRtiZwXokLBePpBOxnu2oUoxCEt3ggq95q8
         sxTA==
X-Forwarded-Encrypted: i=1; AJvYcCVIWfTgL2uIEPO7Xu/wcHu6z08uFFUnUpuZ7LNJqSq/KKNSG0C5ks2Eq4aNZmhhiePDLQZ+fLDDlCeAdQ==@linaro.org
X-Gm-Message-State: AOJu0YwrcDAS3Rv11QgA12os0QLOAtZtMVyG7efAdkkAcBgOYxsoTCAL
	Eoeobi2MCJFM4alsA41jqtb2v4d/QHuKgu28PjdaQl+s6KGXAI/OkxgrlwN4zw72MQ==
X-Gm-Gg: ASbGncv/1C9ZLhFAjn1aCpbHB48bKZU0g2PErk6uNl0IQ0fr9fS0fJQZP00f+MiuGVm
	pMS9wg+5aoUhCMkMeCha7CHwU6piYPtJiTUMvIBfV4/Qx5rh0SyqhYIVxTjFNtNoJfKot0sOocr
	sTUeiK7ttGdD/HiAwcrZw1TbGBFIxsICaPzaERg2uMq2FOhJSvzDW0GouYc5JjnfFv7jv5EcDpj
	kN06SCDAoDIMuwtwjBGqp/ouSKg3pEWm4TkR72fZlaCtRwMYokfOet7jQ3fLJt9vuJh7op3T9e1
	s+CQX5OsZw4XUm7U5MFsfYEth2adr70zS9+XQjIC6UaM4FB5Isa6U6c=
X-Google-Smtp-Source: AGHT+IFqAyZQRbRYtYEmeMsrs7MIVpz3F5a0071joCl+4E1pyIG8nDoF4tustrp2jVDZXF29mgQhWA==
X-Received: by 2002:a05:6a00:1829:b0:736:a540:c9ad with SMTP id d2e1a72fcca58-737572d542bmr3107911b3a.20.1742273500665;
        Mon, 17 Mar 2025 21:51:40 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694b2csm8519195b3a.129.2025.03.17.21.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:51:40 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 08/13] target/arm/cpu: flags2 is always uint64_t
Date: Mon, 17 Mar 2025 21:51:20 -0700
Message-Id: <20250318045125.759259-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: bZ/psPHbNVqz

Do not rely on target dependent type, but use a fixed type instead.
Since the original type is unsigned, it should be safe to extend its
size without any side effect.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.h        | 2 +-
 target/arm/tcg/hflags.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 96f7801a239..27a0d4550f2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -194,7 +194,7 @@ typedef struct ARMPACKey {
 /* See the commentary above the TBFLAG field definitions.  */
 typedef struct CPUARMTBFlags {
     uint32_t flags;
-    target_ulong flags2;
+    uint64_t flags2;
 } CPUARMTBFlags;
 
 typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index 8d79b8b7ae1..e51d9f7b159 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -506,8 +506,8 @@ void assert_hflags_rebuild_correctly(CPUARMState *env)
 
     if (unlikely(c.flags != r.flags || c.flags2 != r.flags2)) {
         fprintf(stderr, "TCG hflags mismatch "
-                        "(current:(0x%08x,0x" TARGET_FMT_lx ")"
-                        " rebuilt:(0x%08x,0x" TARGET_FMT_lx ")\n",
+                        "(current:(0x%08x,0x%016" PRIx64 ")"
+                        " rebuilt:(0x%08x,0x%016" PRIx64 ")\n",
                 c.flags, c.flags2, r.flags, r.flags2);
         abort();
     }
-- 
2.39.5
