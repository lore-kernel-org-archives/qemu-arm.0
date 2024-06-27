Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp248382njb;
        Thu, 27 Jun 2024 06:58:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUaiMHvPozTn0CJ/IwZXb05HWr9cY5ZclcvmbQhjr288r5QwMMCGQ+uiYcgDA43cDB6Q6ahBZ23ErAx/Fy0gKsG+hFibEPH
X-Received: by 2002:a05:6e02:1a6b:b0:375:a3a9:db49 with SMTP id e9e14a558f8ab-3763f5bc3e8mr186788335ab.9.1719496694037;
        Thu, 27 Jun 2024 06:58:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719496694; cv=none;
        d=google.com; s=arc-20160816;
        b=YyzJ4m52yIIjQLCfQ6PfLqSX7rfqPM47n4it1t+FZ8eVgfeWacCIL9iobWxfxkkt24
         i7xVkhYX2meb0fGyoLfajG9iivFvNTpMMnIta0479btI1G1hOoNqa7tH6pwEA04nb5ks
         Yxx59zbGtGw6yiQaIdKI/usu/OQULUlXf6xF+PIcxCtpYkXGR1dfOyeNBRJJJ9aQb5nd
         lBhfyrYNaN4olxe4sPG+0aX188jbZ0dWFnwMgDPPu0eHwnFebab9JCSsBh9wM8iyjC2O
         FI31UvBy8T/gLfo/cXNPkv8/GlxDTweJBr57qTSCDsgEa1SXpyZF3bY3dbk+pDWddzBT
         9jKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:dkim-signature;
        bh=krQKuKxY8isoEphRQtni7oJK0QyOsCIS1H46MdJLkac=;
        fh=JtTD9ZVkUO7E9ZegzfdJERbEcv6DePmuVXZURAZSRoY=;
        b=QaHBiC6rEF2w9lliYAm8u4mwd4S9+JXhBRfYMT7TVuFgNUe8Z7i7fb7txyVYYp8czG
         65TFNjGJEVgQMxWDVvUxDcOfPeUmrVymhwWqp5iYPTBR9GJgsqJ6IGHdP/XtWQZdOYkj
         U6c+iRaaLMpqJoQLc4yNT+u2jOmkQKj4L1104DiPSFyfnlNONg74+4jZJssekF/aku/4
         FL5hmA+vj4YjQqwwlhpaQPp86SyGU10BrgijIfLk6p+rFgtzcNOtPIo64zwmJWSiWc6+
         s5a2HMacYW5q8ltzE33BSzMgqhm5+p6qaUtu9b9jmglou+BejH7LgUyQZepRWJI1/YU5
         Xd/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=tMhKvaNa;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-72745092e1fsor514199a12.1.2024.06.27.06.58.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jun 2024 06:58:13 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=tMhKvaNa;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719496693; x=1720101493; darn=linaro.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=krQKuKxY8isoEphRQtni7oJK0QyOsCIS1H46MdJLkac=;
        b=tMhKvaNauQaRgX8VNgfJv6kn4Gqot/xcVeU6D/AZSfDpv+E18Cn7CSI9b+5GW17tN7
         JvexKnxOJv5ZKPbAWcGX+4an9OXkTkuMf9GvRbCyUvR8cl6bj5gWVZpdF2Xw+6BO1AFp
         pzfxL7f43iQMlM4ThEOStXbAN8ZtsL33IKtAbqzbdZ+YXGS8qJ9IoO3ggxtgusBpzMkF
         6giYJVQqu03a+dqcFxhHny/EaAhucJRMAXzfSTJMd6/dJJM4Jdc3mvxy1IsQlsiLOdPW
         Myi/veQ01dfBsBE+097Bw0u4k+MD72fFIoq7wYk3FkYAukKdCs48KxkZZ4QQG64o1HpS
         JsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719496693; x=1720101493;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krQKuKxY8isoEphRQtni7oJK0QyOsCIS1H46MdJLkac=;
        b=hMCWe1nhnGRczMxiGSja/2TFqo/ZNhCejUyXtwqFfxVt04aUOUTn/WfLClZbjqsvFs
         sp5BWHcpB8a5/gr4O7z01/7gHvt4LAimpe2SexLA+mPbM/47ut04RFrjI9luuq1sSpvn
         V9MLVMryS/zhAcjKbiK7NHfBIb9IPNaLwQeAT41QDve/jHtYHTr61lCQ9cX9WSY0j+eg
         ojqUbOAAJSOAhPaMuoz2MxJSWt0Cxv8eQjgPrV4drP9Vm8aFIMnTK8b94TmMDGCyx5i7
         0BNYf84Qquhlnkn5XT1M/oyuybWA+4w8h+5TulwtADec2MVSFkGc+yZCp3t56K0gMV8O
         bjoA==
X-Forwarded-Encrypted: i=1; AJvYcCUM3VK5xgEwdqzP32ahqfO+GTc79X+KRZVYuPy7ICAX2sTOr13pUGo7nMTPLxoZ58GKWh/v5okgxAMBfp19Fo9jdDdYLSYK
X-Gm-Message-State: AOJu0YyzzEfwbtzipnvgiqQshZbLYNiEjBU/kuYp05tyzZKiqtvYikSn
	14CcMwv8Rnnj4xXsM2FUlReawgqzA08LbSIh8+DtQ0GINgM2tRW/HtVoSIWgSPY=
X-Google-Smtp-Source: AGHT+IG77dzeSA1z0lafJxK8ebTqJPJUAjJweHti/NL1FQrYFMhih3j9X2eKx5sO8u2Goy1S/R01jg==
X-Received: by 2002:a05:6a20:7346:b0:1be:d321:7e09 with SMTP id adf61e73a8af0-1bed321a4e6mr1809950637.28.1719496693493;
        Thu, 27 Jun 2024 06:58:13 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1faac8fcd45sm13518985ad.116.2024.06.27.06.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 06:58:13 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 0/6] tests/tcg/aarch64: Fix inline assemblies for clang
Date: Thu, 27 Jun 2024 22:58:01 +0900
Message-Id: <20240627-tcg-v2-0-1690a813348e@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOlvfWYC/zWMwQ7CIBAFf6XZsxjAisRT/8P0QGFp9yA10JA2D
 f8ukniclzdzQsJImODZnRAxU6I1VJCXDuxiwoyMXGWQXPZcyZ5tdmaT10Io1Nx4A/X5iehpb5X
 XWHmhtK3xaNEsfuvfV83PgnHGJ+PUXd34w+nBmSPQfrXrG8ZSyhci74CulwAAAA==
To: Peter Maydell <peter.maydell@linaro.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: Z4bk0Wbj58qN

Unlike GCC, clang checks if the operands in assembly matches with the
type in C. It also does not support "x" constraint for AArch64 and
complains about them.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Changes in v2:
- Removed spurious a compiler flag change for normal SME tests.
- Fixed sme-i16i64 detection.
- Link to v1: https://lore.kernel.org/r/20240626-tcg-v1-0-0bad656307d8@daynix.com

---
Akihiko Odaki (6):
      tests/tcg/arm: Fix fcvt result messages
      tests/tcg/aarch64: Fix test architecture specification
      tests/tcg/aarch64: Explicitly specify register width
      tests/tcg/aarch64: Fix irg operand type
      tests/tcg/aarch64: Do not use x constraint
      tests/tcg/arm: Manually bit-cast half-precision numbers

 tests/tcg/aarch64/bti-1.c         |   6 +-
 tests/tcg/aarch64/bti-3.c         |   6 +-
 tests/tcg/aarch64/mte-1.c         |   2 +-
 tests/tcg/aarch64/sme-smopa-2.c   |   2 +-
 tests/tcg/arm/fcvt.c              |  20 +-
 tests/tcg/aarch64/Makefile.target |  11 +-
 tests/tcg/aarch64/fcvt.ref        | 604 +++++++++++++++++++-------------------
 7 files changed, 330 insertions(+), 321 deletions(-)
---
base-commit: 046a64b9801343e2e89eef10c7a48eec8d8c0d4f
change-id: 20240624-tcg-bf8116e80afa

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>
