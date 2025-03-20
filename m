Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1279058njc;
        Thu, 20 Mar 2025 15:30:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWhreUb6FHkOFzEPJ9Cg+qQgotsJUuIPuMmbEhPfuoehzXHjoc1+EEmWCYZAph6spGdc8FaMJ9mLRL3/g==@linaro.org
X-Received: by 2002:a17:902:f605:b0:220:c911:3f60 with SMTP id d9443c01a7336-22780e262c6mr17922115ad.47.1742509831677;
        Thu, 20 Mar 2025 15:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509831; cv=none;
        d=google.com; s=arc-20240605;
        b=DZUtX3yREuG/J8AWAV8MYjqWCLRQxecFyPdJwqM0nCFf4Pr4DRSLa0OSnrhoSZ0m7/
         7l8its5dvp9/EIseNbqw/xZ/O5rZiWCmC6Ndzn4zu709NBDD+CNGKnlWi3bPdYuyj71x
         8uxH+cQr9GuBv3mG1QCK3n5hfkiVM9fQ45Ima5y+7t6WrRg9iq/mVPasUFp2bEF9Src4
         zoHeV5W4/fNjicrcXTS2iD4jYB7BGzQwsFiBkLSEo/FHIglyRDghzx3yquBD+XlCZrPb
         kSnNIYG/fGVz+AwdFETLLBU4ifqWjcJ3BQMZYm9Vi+GPakok3Ve/MRoMZMn3ZXJpsw6k
         TI/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lGjkhQ7Rm7y3SPTNm83ItgGSoGlWsmhX663zoINx/mY=;
        fh=Rw5cFvlk7x8SFP7gZB+inbSwrvIAP6kj1zPwOQtCoYE=;
        b=QEiJOE9agMeIjKtuonCI1iU/94xCqtRy2rwgRqlWe1CXfAiVHci3N4F+T6DpPskgvu
         aOCE7SyS3yORPGWQjCyDCzUV/rrM4/TyLi6V6MgFONILRJNNQecw7xZBwF9G1qUu2aq2
         Fb5fVLjQrRTaoLvg7vpWHc3b1Q2AyyWwNaZz3Y08CyKW+Wc7lasKjRS6iyDGZGNGSQo/
         E006EA8uG77YGZRvDHtDAx/6YgCtRo4/nR4WwnrLB8K3Mo/HTf+LK82Ic+P2OqZml9oU
         k7lBRKOhWIdgMmEbfIFHxZeHHlE5mJmhAammt3m0w6pcj/OYI7rDUa17tF9U334kItz9
         IOVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nz1hkFlG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f75ee1sor3405035ad.14.2025.03.20.15.30.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nz1hkFlG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509831; x=1743114631; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGjkhQ7Rm7y3SPTNm83ItgGSoGlWsmhX663zoINx/mY=;
        b=nz1hkFlGmMw/NyJo6yijDv0SC1n1w2xHQyV/3otxsaDllc6pBtoYT02abpcZReQ3F8
         H4vs70K7qII3LGyiW1uUtcNqt2zcDYhhmzOQqqf21pX7pR2C1zr693WeClf7H5lgNogx
         zqYr208xDvLfBhcnMWt42+luj2MeQGRo3589dNkWi6UCD9JHaeNGfPN7nrIvQUY1lGSk
         Ugp9DFNNbFELHE3IjXWVBv/BPkpgLqa1c9CcmrdSmMoCwoWvj3rfWXe+xzTs2K6bg50w
         HWTWIujlwdbm8r6anbv2p0LTbRJ8kFswXA36QiNcbmGTbbPc8pC1WMAsBt3uGW7Q3j9F
         DGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509831; x=1743114631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGjkhQ7Rm7y3SPTNm83ItgGSoGlWsmhX663zoINx/mY=;
        b=IgSKbqe7u5Cp93vFfLfHWIejNAPwgNyex0gqZ1lHaVKCI4mmHdZO0OLmLhFM4d8lcz
         dZFRb9OG4HDuIG+bXwChz6YbhaK6R5U+Cq1GknScw96+4DdlTWtidvP/OiZqr+gFWuPN
         64aQLW3P3Evp1Up4nVPxCiuwLp7yh443UBnQEfT0+YpMoO3Gz8OaP1m911A21rYE6x8V
         eXA73Ke4F4g3TWfMqsu6F+Gmkhsi4+C9+AB6WcT1V2IjKnl/xdWYYPAGvyrA5XEIiI/e
         yfq/ZO2mtZqSpeC4cvWpoJdiO9mPUJSidGMtnBONevOHo6VmJkkI+xtR4mvVjP3E3VGK
         TDBg==
X-Forwarded-Encrypted: i=1; AJvYcCW2ky4UDXuQPxYWzXipjYT3qdto+I1yflwryBkqJWi7b+ZSsBmz4UHJohvGhfdH+vLSlTvw6n3yHT+zrw==@linaro.org
X-Gm-Message-State: AOJu0Yxx+sV3brjfQfeyPf8gSwuqdCsX/CTtDTbrFSZP3zoPnczMYZxV
	DXqW0uURCUVZ8nvst9uoQYLGxNuNL45BH2KMD3PnVkGN61QJx5wvo5aQQ5L3k7LGvg==
X-Gm-Gg: ASbGnctPQn1M4dunGa6iaWUcXzwZATscXuCI8fTpo6mu+vvo7Ip2YUwYiYQA57YMxOT
	/Ci0oAfZRyYq9qjUw2zKHDHatImaz3Gp+8nD3o+Amnc2t/5/DAxRQOi/Hj+c1o3FaI5J5mlAgl/
	hDQhQ/CdviP3bEHKlJ44F7Kj7LKXEAMwUWKQSws5MhHm8d2LKo0ZFoWD+g3jUzimRBYWarPkDwS
	WOF7RTSob4eAxxGIMWJzLkhggn8PQewnQMcgt4rJUG5y2WSwuL+f6TFyaGzd555jtdxohN+LZ+K
	7jt0xSlolTT/h9tLTvHr+VvhGYM9BTY7eFlHbtZRCNph
X-Google-Smtp-Source: AGHT+IECC2u96EUAdCu+nIhzRGOlzelUPCPjSbY+gS5iVhhPcKqW1YWZqHzKBvuL+vB+mhXdR/p94Q==
X-Received: by 2002:a17:903:2350:b0:223:517c:bfa1 with SMTP id d9443c01a7336-22780e10d13mr14113105ad.38.1742509831103;
        Thu, 20 Mar 2025 15:30:31 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:30 -0700 (PDT)
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
Subject: [PATCH v2 19/30] exec/poison: KVM_HAVE_MCE_INJECTION can now be poisoned
Date: Thu, 20 Mar 2025 15:29:51 -0700
Message-Id: <20250320223002.2915728-20-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vcXvcNFMEm/w

We prevent common code to use this define by mistake.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/poison.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/exec/poison.h b/include/exec/poison.h
index c72f56df921..d8495b1d358 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -74,4 +74,6 @@
 #pragma GCC poison CONFIG_SOFTMMU
 #endif
 
+#pragma GCC poison KVM_HAVE_MCE_INJECTION
+
 #endif
-- 
2.39.5
