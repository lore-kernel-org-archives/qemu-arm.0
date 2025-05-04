Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756208njj;
        Sat, 3 May 2025 22:29:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhKcT4jjXjsbIPLbzYeCOZFwpTHYt6MbSjheLDn+/5Mu48YLbJJgcIUZ/JU5RLp+ewLy+BT+pDjL4QQw==@linaro.org
X-Received: by 2002:a05:6300:218a:b0:1ee:c7c8:ca4 with SMTP id adf61e73a8af0-20ce04e699cmr13508087637.36.1746336589480;
        Sat, 03 May 2025 22:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336589; cv=none;
        d=google.com; s=arc-20240605;
        b=CqFl1r1xBKwA6j6snnkixGXwn+7fUGtT9Kt4uALY1eyMdh/56t6gk8hBDmo7F9hRWy
         kpyjtGj+84LNgKY/HNiL61AgnjXzl/oFE7/br2NiYf5QNgb9k+XKBWMJwd8nVv+ZWxfg
         0JejzQ/qe591LiU968VLhGnp9xkqiGBgKL+voxYGMD33T3obWe5vEQ9b7I4PEn18P9tY
         HYmU4hT8xRcYLUonfeLO3cSDzjRIa9O9ah92IePCz6tP+6NUd0NuccfaM3CP8IEptllJ
         RYZQBkI9FuoAVizn30O5/8xDHRnJFYp4YSTpbaT+kE9UoaMj0QNxFD46pOLwZ7S3NRg0
         mORg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=E27VnLHwdjjgu7+qzkSpdD6sP1u8J5fzfB0GITxze0s=;
        fh=WovEIkj7Gbp/Acrf8Y/Ga1/5NCvkmR6SsQIU6RUBSeI=;
        b=RTiy6zXb5aHmBULF1udZMt6iuv5iHVO8GBtoY7k6tLdrj/OnL2NzaCnpbzXwz/qK/R
         qsJ1oKDA/LMr6/uT6YccTgA116YjDvmaJakX8h/olLfFkArY/WUDoZr95Zl2fRH/2FIx
         mfQXpAVYyQZnzHCteLZA/Oe2SxBSdiaMeqCGQ8KnlpyZ47GJuapIg6+vYspWMWRe75bQ
         UnCzakFOIITxL9TCWx2De6uyY0F8RQA4uWWImuNPBE52CKI4eFFfitN5UT0O8bLd4k+7
         kf8s3xKAR/4xiG6XvNCEhvHxbFFgJO/aYEPcv+1vfCP2nLsvaXaG8X+Oj089jKAisA2x
         FotA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RsCUP6aK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa0ca10sor2562060b3a.10.2025.05.03.22.29.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RsCUP6aK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336589; x=1746941389; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E27VnLHwdjjgu7+qzkSpdD6sP1u8J5fzfB0GITxze0s=;
        b=RsCUP6aKinELlr2O7GUae5UbVtwzdE02kyzg2CMP+X51soZxO7UAbX8D7sY30l6dqo
         MVyhlgGGNp6qHGz6bQj3ViLQQXuBp5c2nIkozWgU4M+ahcKdu2KfQ2oWv+iVUMU3M7kU
         GBaPoWno3KjZ8BdWsscL6oyPkYsgNTwVPpt3+80JuytgNr7p4KAlVQdgkWcEp2HV0vQD
         jyxlpj5mBh9G+vV5n0u8SAPLtPo94QBjI5eYBNJgpRf6vNZzMLmO2pF94nGfcME4ZOo/
         ma4XQBRaV0fTS+ebwk8zNnl2KHKT5oUql970oJ8SqnmzJy7OrAxmQDOGb6yPoQYMtiHa
         L6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336589; x=1746941389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E27VnLHwdjjgu7+qzkSpdD6sP1u8J5fzfB0GITxze0s=;
        b=rHpoEaFqwNkKJUDW5Y2uXjBo0e6+Proe2obQcHLIvx6jQWB2mRzd54JWcKyIC7HDC+
         nWbazKqCNR3bUu1L+j1xxwSJwN25kdDzRIN7WUa84J8/0UPFT8D5DqgjnXhXy/vmhV4+
         7/34nxmm8ZphbdtL+i9xxeWA+xzu8RSLBrfsxqiu0k081071xJidB7PgtPyjLNxGvZqP
         qUf/IRKSrSV2++5OGydFPtDvgRfC/6ZSzak1n678VVzRZCjbft1KJ198k6laC0eoQoHC
         XW02kjPK3zTlhaIOiC6TATSNJ4j8iIM7Z0iHcGr2/lYW8TDmPlZcPO4P9mz26AQa5WE4
         eyqA==
X-Forwarded-Encrypted: i=1; AJvYcCVXVZ4At4Dqwb4F2nXVEOom826lHmpPC2vZIaCFfS5LtGfd+z9m50ojArBwU9EhTULDmg6tUYcblEvkfQ==@linaro.org
X-Gm-Message-State: AOJu0YxqYMF52vR/S9X7yDyWw/B/W+RBp9WSfzTmBWCqsYAPUF1mWVCA
	ZyrV6NbFz/ZuLRzGYWDgoPTMxDJ9cWUJAvjaLWX1YcQ0S+VPJfSkuuCszRkAIj6LaA==
X-Gm-Gg: ASbGncvBGFoVGzBmpHV5gBDml7D1pSnIpcW+0ZX5rMxlmxHe9Hr0lbM+mJIdS5TgWNe
	FoujkUDjII3MjHVSIbU0sTYJZ/iVjViHoYAk8WsDciWjYkSK473cDbfbz8dLJSFZ6O2HjxJM9IH
	+BvA0TuaYwD2eKyMwrK70fo9rqZbKM1D5jb0qKrQs6vEAi0c4qmedErc7WM+BqPLQSnGmft7+JO
	U9kPsJ1Ea2bN9V23ZzofwOoOPuVsdudjpjBxnHIOjOfsx1c7hNn0PqtX4jFTqqhY0nY9PH8v8kH
	1wGUqCdmVOD7MQ40KX7sax0ATHjs5QYv7L30WAJ2
X-Google-Smtp-Source: AGHT+IECb2kqsXYdYx3HexFcHoSRwPANHXQWSjcMKm+7Iwt/AOnqMohaPWxRynpWHSWLdEAcrQgA/A==
X-Received: by 2002:a05:6300:668b:b0:1f3:41d5:6608 with SMTP id adf61e73a8af0-20cdfee99ebmr10830982637.26.1746336589134;
        Sat, 03 May 2025 22:29:49 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:48 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 33/40] target/arm/ptw: compile file once (system)
Date: Sat,  3 May 2025 22:29:07 -0700
Message-ID: <20250504052914.3525365-34-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: afJ2uQe/MuQn

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 6e0327b6f5b..151184da71c 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -17,7 +17,6 @@ arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
   'arm-qmp-cmds.c',
   'machine.c',
-  'ptw.c',
 ))
 
 arm_user_ss = ss.source_set()
@@ -40,6 +39,7 @@ arm_common_system_ss.add(files(
   'cortex-regs.c',
   'debug_helper.c',
   'helper.c',
+  'ptw.c',
   'vfp_fpscr.c',
 ))
 
-- 
2.47.2
