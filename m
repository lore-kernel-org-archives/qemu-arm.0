Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2779309njj;
        Mon, 5 May 2025 16:22:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVTj3wxAG+iPoRmyq1+wGh7BlvgpuNie+ypGKVgY87KRR7gu8FVofEYWq4GZDcubSYQD5SGKDK+r4AQg==@linaro.org
X-Received: by 2002:a17:903:238b:b0:22c:33b2:e420 with SMTP id d9443c01a7336-22e328a4440mr15456455ad.7.1746487253677;
        Mon, 05 May 2025 16:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487253; cv=none;
        d=google.com; s=arc-20240605;
        b=lLM62pmsNvKplBlcTp7BGVTBBXrOmKWt2elIJkDSKwDP4dE5/BUnhHC8PSd6mlZ8gU
         GntJUHrArebpJ6z594CrCZ3ef6jKrKa71wHUcw5Ro86FNfZAYgNgM+LNb/OAUeFLI0N0
         Q3Ey43xLs3vRuSy/McV3/OnvKIKx3YtlPHAssuAfT4PjneemsEX8K1y5heR4cHLLqF4h
         qhxYgo34XOjAQwxsW9saHRLtbcdKMsQQz+MCTIsi6gsMoUn+yGJxKMZvqsxHwMBZGkmT
         0zjiF0FeX5x0FbXf45h+pixfwIJ3mijsVgkGLO0SfqEt1ccTHDhlQxziRbigC5cGhnRq
         KeXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iyeC1dYqzIyRbq0U6QJpnfGNVlqEyh7oNHL1QwbMptA=;
        fh=kOg5ljt+TdS+9eVWvAgpNW4L5Nw+yVi+XULyggqcQpM=;
        b=izZCA6bkXicXxsY4rz1gzBHbg0YVGJqaLx3UEST11QjsWLDhsKESKSIc0ERxKPrBL1
         0nOO5R30H1iPovhFR89XPBqon+IsisAunn2cmWgroazkSqOX3LsSlY4TvhOLhkesTy0j
         rl+MM4Xae2aux95Z3hYIDO2lcWT01oFC70sVat+S0zwD/8/FeLYuATi4+iTKQe23H53v
         RadMTUO732UbEsLFgL1KYFH9TD+uC3jnDigDKYROvo2n6fF8pMOCWqM/5p/02ABUhlV2
         VDJUVyStSx+9OiuOjpbkTLnNLycBw7TBu9XyQWwAdc36QyL34KKJf0P4a74Y5SsBJ9VG
         w1nw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b0+ra3JP;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bc89162sor76137395ad.14.2025.05.05.16.20.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b0+ra3JP;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487253; x=1747092053; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyeC1dYqzIyRbq0U6QJpnfGNVlqEyh7oNHL1QwbMptA=;
        b=b0+ra3JPmqsQDsBEsZrniv89/ahhNvjxjkDvHM/6bTYO5lFBMGXwjCVhrRPLT8x1Oo
         4owB4LfIU/79t+golb0S8fAc3xO/2lBb03bCIHUN35AJG+8n69v1uf6Vbl3Cg20whUp9
         tMLr6KULgQRgCTo5uk5FEE03FLxMuQMpVovPONYTNQ5JH7vsxyWaH5VT5c2iRsk5fKGX
         fikdDVYjXZbtTxENLoJJUhVpWDivVRQhCVtXJS6kyuJahtB1gvTGc8zsmk4tN1MeDbrr
         sP6R23Gq0Sq85h7/Bvxw2sP4NGoQHoda9F3N5NCq65vTFxrWMbRGGxsdkf1iIZiyoWCF
         dbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487253; x=1747092053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iyeC1dYqzIyRbq0U6QJpnfGNVlqEyh7oNHL1QwbMptA=;
        b=pnt+OSIoCr1vSXJjy+waT4+uWD+NcY7eC4sLulUB1/Tl7QKFOsz6cUcwpRcRYQVkzw
         H+34t/NhIFni6V/lUVyDuxMpdzq1p8FpKayBA0+N9V7acb/juY3gBUGKztQt1DCIbaxG
         DyYyaukW3mtHV9KgtRzTG+ax0PCjIugVDFHxNKBymSZk4mU4bPqe9u0AlO+XSDTmly2D
         D7LHzFo5aYteiB+K7tNhxAsUO+IzTMjJCIyZ10BOZmvJQ7V63E+W426HZFhWPUCoQ4LN
         b9YhxUwi1hwaN3WBZV5g5PnF+geftbdVwypEUc6OGgCe9lICSjqZYVDY7ctYwUVAfvOd
         s/bA==
X-Forwarded-Encrypted: i=1; AJvYcCWoxSgxGz2IQEizo9NrVWbFxXss5cCaMJAtHRvutOJNycC+McklClQhvd3QZ/bITJhfRSXJneqKRkvMow==@linaro.org
X-Gm-Message-State: AOJu0YwLK5rVEy6wZL18Bb5Pfw5hz9nJQKYEbX5q4Tlc479EDrijTkR7
	LO9yyMO3snZByIcX/Z5pFjrFm7l2DtAJi4uwXYqmk2DGcb0w5/CnvUT1zmM3+eQtSA==
X-Gm-Gg: ASbGncv8Zw1LI/GxfPDWmGbaaiNd0N4d1ehQQcasQK4OwRHzEpyeh8t2Uob2WSnfetK
	HfM9wE/3wcteog9uqWfkvjjsv7gkBDuqt0WGAvinTNgRz+6V7f/E8fR8Bp/W4qoTlLljp5mmZjc
	HP0p5Ww57+QJdnfrlnJkxl2NzAMuDtyOr9+z0XLvZQQiN014obDejj3n0Y0Why6AVvvZMEdMcjA
	ZuK8WFLOKjiOf6mnvLHWICZjuy1dgh6YNGPRpmHQsvGo/D4dHgA5Hkor80fHDkYGXxISW7ZKzKC
	JIdIyn9TwbYGQw/t+VTiRf7Mcd34EL+xV9sLAcRO
X-Google-Smtp-Source: AGHT+IEQz1uooxmmnU26y3jx3diyYO9Qb7x/IWS7jSUjRxMekEpaYNdIascgkfukWRRtAFkV+bb+RA==
X-Received: by 2002:a17:903:2349:b0:220:be86:a421 with SMTP id d9443c01a7336-22e32f00884mr19329055ad.38.1746487253295;
        Mon, 05 May 2025 16:20:53 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:52 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 37/50] target/arm/machine: remove TARGET_AARCH64 from migration state
Date: Mon,  5 May 2025 16:20:02 -0700
Message-ID: <20250505232015.130990-38-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0sRiTRXwXILk

This exposes two new subsections for arm: vmstate_sve and vmstate_za.
Those sections have a ".needed" callback, which already allow to skip
them when not needed.

vmstate_sve .needed is checking cpu_isar_feature(aa64_sve, cpu).
vmstate_za .needed is checking ZA flag in cpu->env.svcr.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/machine.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index f7956898fa1..868246a98c0 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -241,7 +241,6 @@ static const VMStateDescription vmstate_iwmmxt = {
     }
 };
 
-#ifdef TARGET_AARCH64
 /* The expression ARM_MAX_VQ - 2 is 0 for pure AArch32 build,
  * and ARMPredicateReg is actively empty.  This triggers errors
  * in the expansion of the VMSTATE macros.
@@ -321,7 +320,6 @@ static const VMStateDescription vmstate_za = {
         VMSTATE_END_OF_LIST()
     }
 };
-#endif /* AARCH64 */
 
 static bool serror_needed(void *opaque)
 {
@@ -1102,10 +1100,8 @@ const VMStateDescription vmstate_arm_cpu = {
         &vmstate_pmsav7,
         &vmstate_pmsav8,
         &vmstate_m_security,
-#ifdef TARGET_AARCH64
         &vmstate_sve,
         &vmstate_za,
-#endif
         &vmstate_serror,
         &vmstate_irq_line_state,
         &vmstate_wfxt_timer,
-- 
2.47.2
