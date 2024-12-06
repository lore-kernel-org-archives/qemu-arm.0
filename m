Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1088797njb;
        Fri, 6 Dec 2024 11:23:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW5qSbVQGqvTurHtqbPSRQy7r/Bdiuf7A3dT59yfgWWWQqMuRpRSLgxogJdCXpMx32rQ0Fdp1hoMp3rPA==@linaro.org
X-Received: by 2002:a17:902:c40d:b0:215:9ea1:e95c with SMTP id d9443c01a7336-21614d32c3emr68248305ad.13.1733512982714;
        Fri, 06 Dec 2024 11:23:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733512982; cv=none;
        d=google.com; s=arc-20240605;
        b=VAWz6keRKlRNSPbPWniV6n0QgatlUOycbcB+YFPtYX7Rm3uJ8vZl7/8zKVlpP2J8lK
         D5NWAugx+wfcItKJPg0OgVJMLmHkEU/gkCYXQo1MbPfcbOc9gtgz5Tx/HhVWvii0UYK0
         /vjEShm3H6IicEOjqaiJvJxy7k/H1mx9jj0Dkl/PCdKcepYJQxOl4SmXX/meM732whYE
         bRZBC/TFAhNwfvA82OxzrqlxNnI9stin7XoIxVOJ/BrjCY0BfepJwCMN3ZRbGj4iTBEl
         D0xnrqy5q/8W4YYGVGFcj7MPsZxoZ4aaZnAd2Qx+mDAcyUoJjC+jfUoluOYd7d2sKjNJ
         vOoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=3hKItZAJNPd3ymbmjbZvXdDTlbJIfy+hGFNvN3P9UFc=;
        fh=/IGjvzIBMRPR9OhottYTkpOoVYpmGdVU7thegjlib4E=;
        b=ebmpC5sX/3vcI2/UBiE7A6Oe0AzNJHsG8I6/Q4N7poTcC9h+GitOyjzMsr7N0hphrd
         ak+k2VIxot2JX9oC2R6KqQjQF0p337KxF8IKSt1NfCoh8QgnDkGPh+oFUx4XKye+od2R
         0dP/glV8IoABGoHaUxwgCE/Vu/Mv1HuST++JMZxXAJYPXNaohs7+UHSSivxLWOa8QztQ
         PuD6HJhhkfg0inK8LhjAf4rf5JZF6ZOdlCBhrpetaEJDLGCx/Io2An5eZlFyJZG6ASlE
         ENBY7YOHb3gPfD40FinmX9gfZv/INLoHKjWy4hV1QJhuUS/Zs0Z/+1fdJgCyByOXh3E5
         Ji2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=beZbTMnD;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-215f90855d0sor29790475ad.13.2024.12.06.11.23.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Dec 2024 11:23:02 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=beZbTMnD;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733512982; x=1734117782; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3hKItZAJNPd3ymbmjbZvXdDTlbJIfy+hGFNvN3P9UFc=;
        b=beZbTMnDDratrTSjElzxWpHNHvxHwVYvGd8UVLiB6FU78SjfVfkRM5DslL5yvxigX7
         wDa6J2Eu2dizQj18Pdm1CX75YwmaCUAS4TVxWJBP/3VNxdt2lhLCy7sPhXLc5sy+o8LC
         5lxwlp/bJbEp44C4cI0ujKOYVBcZeIlFk5FwhFBrLbtwiLxneO/mwVyBNzKN5iwU1If9
         HD8TiudjX1kYfdz2VO6PY97ga+L3vf6KzMxgXyhH+dZLx79hPKMHlZwMGIGi3WJmrraC
         6k72qlIDx/WTeuNm6042ew+bo/Dl17mnIM6UH4fR5VaAPk+g6JLoprMr7/uOnLIQaCWj
         3gEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733512982; x=1734117782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hKItZAJNPd3ymbmjbZvXdDTlbJIfy+hGFNvN3P9UFc=;
        b=RwWrEefij1OA/JsyVhCNvcuWFUUPuIrs2cG/N8ctvVnKlpCBHG074GtPkkK7ZrPfAa
         P9q61Qk1+fvNhph9k5WqmJgMCI8JSl0CySvnHLVdNeYYyEj65aPs3dK26+BtiUcLs3Lk
         or0q9neL/mYarvvgb+YPqb+P7Cp2fpoPMbLBInT3uaQmmBk3exxSKFQTAZnXgVxzSipt
         dkV0Ur2P+GqD39tohBkZ9wI4lvDQEIWlVzbgJwMPSfyP4gSjUvVxveHqg1k04YsfHfkO
         V5AN+Aif4L3gn041uaixRxrI6vaKv9dbHcH3taxP/E8tVYrY+tw8U+4ppGFsVewUaoz5
         zzLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOeUQqv6TEDQMZe8snxmKEwK5Ad8uO7ALwpTKXGhEm7qRpORK0E5LS3jg6Zje9T4+YuFgaKlAk/4p1Gw==@linaro.org
X-Gm-Message-State: AOJu0YygeBODEb/TYX7eR3i6+1A0tvs3WGTLuFO3AFrQ18T+QVG/puXP
	qL4hJW68FgYRaysQ7W2eScYdNYYbp55rULchGm6AuFr/CvjMMUAE2uL7QtgBPxlK1g==
X-Gm-Gg: ASbGncsuMmh9gkcXJ3giko0qu5B9JuXB+1pxOBwkwch98assGv92mK6oG1cOgEIctxR
	Spbj6BUZ7ABUkov0Fw84lNYBZdItkDw2ZElTJKfY8n3e77YfoLrLj0tpkGV213fRoKCdsrvtJ7I
	mHocucQ7/v/GbJWcaqOt4I9Ws8abh10xX/EMexDo1+M4SWYN1DYm/EDirNL6Ij365EoPyPn1SXj
	zlH8liPq025wCBA9umrmSY9h9g44Ij3PuNGOMYNf1Nf3SGOYE8+nBkLUUkGzVDzpmyUxMytGdJD
	Zm0W6YCj
X-Google-Smtp-Source: AGHT+IFJJHGwYzVBkOfGVJ5LnuLUXN/xsurWyrTNL7jCU4Fz6n2FH6s37rNgmvazlAvLzVi56ZGhCQ==
X-Received: by 2002:a17:902:f54d:b0:212:68e2:6c81 with SMTP id d9443c01a7336-21614d4ac70mr58652955ad.24.1733512982220;
        Fri, 06 Dec 2024 11:23:02 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2161e5a6f23sm11720395ad.266.2024.12.06.11.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 11:23:01 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Troy Lee <leetroy@gmail.com>,
	qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 0/4] Minor fixes for Arm documentation
Date: Fri,  6 Dec 2024 11:22:50 -0800
Message-Id: <20241206192254.3889131-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 3VlAEugwrkcu

Reviewed following things:
- system/arm/cpu-features (options)
- system/arm/virt (options)
- boards documented and listed with -machine help (arm and aarch64)
- grep object_class_property_set_description hw/arm: ensure all options are
  documented
- reviewed boards description
- reviewed all Arm features (FEAT_) from: https://developer.arm.com/documentation/109697/2024_09/Feature-descriptions/

The Arm section of the documentation is in very good shape, and this series only
has minors fixes.

v2:
- ensure link for orangepi is http, so we can't switch to https
- left patches from v1

v3:
- fix for fby35 asked by Cédric Le Goater

Pierrick Bouvier (4):
  docs/system/arm/orangepi: update links
  docs/system/arm/fby35: document execute-in-place property
  docs/system/arm/xlnx-versal-virt: document ospi-flash property
  docs/system/arm/virt: document missing properties

 docs/system/arm/fby35.rst            |  5 +++++
 docs/system/arm/orangepi.rst         |  4 ++--
 docs/system/arm/virt.rst             | 16 ++++++++++++++++
 docs/system/arm/xlnx-versal-virt.rst |  3 +++
 4 files changed, 26 insertions(+), 2 deletions(-)

-- 
2.39.5
