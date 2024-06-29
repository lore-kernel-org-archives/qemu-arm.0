Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp463915njm;
        Sat, 29 Jun 2024 01:56:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHNLO0HPGbAKXj0GoOc47PBf2QdgmNklIbl+fLPqf+gx4iQ4b3pgSVZuNtFyabhQZDoBH1OqP+BKgbABKkwxwxQ0bW+O/A
X-Received: by 2002:a05:6870:d1c5:b0:254:a57e:1aed with SMTP id 586e51a60fabf-25db3537d69mr462271fac.26.1719651392491;
        Sat, 29 Jun 2024 01:56:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719651392; cv=none;
        d=google.com; s=arc-20160816;
        b=fCZDy20CgdyjM5vxLytnMTq/evcy1SCx+uNupGGGe2ct0hvBlXnJRKttKgNsPpNIhA
         MSWl9OMuXfPv6MKu83xYkxn54MBBpJTcq8vhPkJocEqE7CVtL6RaUnyNLw3KVjMK4pdc
         cuf/nXzP3RCx3zpGM1ycq7kTIEdlfWBqO56fczdgRIbT2zXvR4dTbH+i0gx6Iu7mngPr
         8VlZDfZb/u/j1DpTxGscTwJxr3tT4khghE28bjlfdD5wNbrIR06udMUnHDg/aGUhq7uT
         27tCmgvRO8RyyoBS5CqgLLBkA8PtjJ5mBseuZ3UOeyoQ6WgxSpvDGFd/03BEbwuDrIvH
         4U9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:dkim-signature;
        bh=GhzLCcbYqjj4/wO4kZa5ouP20FwgGHEunUiM0ObyYwQ=;
        fh=BzDa6zfZUbXCf8lPaUYVomOYHh+ldO7QCW4cPvXPOUE=;
        b=qyy2Y1J9qWRM8LSB/jRZQanfxtFcYisPmldtLJvdXG768oLgUIk4WeGaHFsqKIUnaP
         8Bq3IFum+G/imkyDFzHgJj61tPOAWe3VLl4Hqu/36Q2xosFnXT5XTU8CUHhY4Ns85Czq
         s1PxMk5uBCpc2914wt8NHd2CJdjf6aAKXuJULogHsBs01cy1808jNalrlwEXOacJh0ZF
         yKdA8EEpQXo90m72yhYZ+jPIGtAlSRu7Nzj3FnKIpwthdA53doxobJmzYZfrubXSgDOu
         kR1hk+i08ByN2/JkHEvBbAy5UR/0CjfPa08zdGoChoG5Q2DqY76tOfgTRhhAWYE+nMli
         NoZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=PiHlBJmE;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 586e51a60fabf-25d72b582f7sor2304496fac.7.2024.06.29.01.56.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 29 Jun 2024 01:56:32 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=PiHlBJmE;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719651392; x=1720256192; darn=linaro.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GhzLCcbYqjj4/wO4kZa5ouP20FwgGHEunUiM0ObyYwQ=;
        b=PiHlBJmEHrJzLA60vNuDezKwP3I1pyXIZDtj2deexzF54GhdvVPJZd+6NH2hPssueQ
         C1g8a+6vmirr3f1E6B2wyxZy/YWLtUFq0E2tfOb9WLvGU5xVVeABnZGRmSdoZxFSYZPQ
         ed3Jtb+NCpkH5I9R1/PQ4Ic6Tgc6g8hjGCt4MGlVKO5H3h0VH6bRZ/62fvE8y4oiyup3
         mwVXOkqDg7KPwLqx3o4V6taUWOlHeizlXWjjfQ0/NVZILs5EJMsacU3VkCdeCP46EI7H
         lyVNsD0M+h/Zhicl7xmyqtmnRWOTRxptyQH6zvysXaSKvH1qux1LNsFVNWb9Jv8CAxj0
         xx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719651392; x=1720256192;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhzLCcbYqjj4/wO4kZa5ouP20FwgGHEunUiM0ObyYwQ=;
        b=peTs1S5+hkZ1fUasZYCCvvc47AaS0H3jVKinRmBQhtrf0aSWh2KV+uFc/YREdKQS/B
         /6qhhpgBSpLNrIparGv4EebO7l+Mdsc0YIHnWdK5Rl/hSiEtRANco1clq6sqgNV5PNbE
         bnXcNu7zCTUWbzGhvdAlQa6rKesU+7mgZ+1iHQ6SBU727Ht4NCHBazK5FmQgRwr4HFvA
         BQk+uQapK01ciaZkuWA36aJhU2wxnGAyBEKn7GhpJbYOeOAp32oxkvyDCpIGfDMo76h/
         xtUdTZDEl7Qij/wPMOEZa24ils8rS6YRu1JslWSqDYXXPOO793t3YMNejqWnkmdw7rrY
         aEYA==
X-Forwarded-Encrypted: i=1; AJvYcCUs8gF1hxUFwW1PmJf7fEtZ4fBTkzv5A3tkNUBRbQFmgwPl5Y8lp7ov9pBh0U+GpizwExtdrnvMF++mH70nvOy50ybLSnWP
X-Gm-Message-State: AOJu0YxfRGGOtJpFeHCRyrX5hNr2TbfTq31MV7XKA77iaAFzQ3Jk+bNr
	7No74q9q4Yw3fKJSnT1owh059mh9TuisoJhHZ7syPWH6u+9hNqhnSCgbQZd3oWE=
X-Google-Smtp-Source: AGHT+IFkhoKdI4hPxVYzwXf2g733giCS7xxgIM6zGu+xKMleGrJL+SYfJF2lNmFLQ3C+GBdZAULwvg==
X-Received: by 2002:a05:6871:7806:b0:254:9ba7:488b with SMTP id 586e51a60fabf-25db366c32dmr421989fac.40.1719651392034;
        Sat, 29 Jun 2024 01:56:32 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.204.135])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-70802959452sm2938138b3a.90.2024.06.29.01.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 01:56:31 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 0/7] tests/tcg/aarch64: Fix inline assemblies for clang
Date: Sat, 29 Jun 2024 17:56:26 +0900
Message-Id: <20240629-tcg-v3-0-fa57918bdf09@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADrMf2YC/1XMQQ6CMBCF4auYWVszbbFUV97DuCh0gFkIpiUNh
 HB3C8ZEl28y379ApMAU4XpYIFDiyEOfhz4eoO5c35JgnzcoVAUaVYixbkXVWCkNWXSNg/z5CtT
 wtFfuj7w7juMQ5j2a5Hb9erP7JAUKrJw3Z6Ox9Pbm3dzzdKqHJ2yBpH5R+UEqI2ku6KzUurD0h
 9Z1fQOiW0OKzAAAAA==
To: Peter Maydell <peter.maydell@linaro.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>, 
 Richard Henderson <richard.henderson@linaro.org>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: QNzvBm0tSyI5

Unlike GCC, clang checks if the operands in assembly matches with the
type in C. It also does not support "x" constraint for AArch64 and
complains about them.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Changes in v3:
- Added patch "tests/tcg/aarch64: Use -fno-integrated-as".
- Added patch "tests/tcg/aarch64: Specify -Wa,-march=armv9-a+sme".
- Dropped patch "tests/docker: Specify --userns keep-id for Podman"
  as it is already queued.
- Link to v2: https://lore.kernel.org/r/20240627-tcg-v2-0-1690a813348e@daynix.com

Changes in v2:
- Removed spurious a compiler flag change for normal SME tests.
- Fixed sme-i16i64 detection.
- Link to v1: https://lore.kernel.org/r/20240626-tcg-v1-0-0bad656307d8@daynix.com

---
Akihiko Odaki (7):
      tests/tcg/aarch64: Use -fno-integrated-as
      tests/tcg/aarch64: Specify -Wa,-march=armv9-a+sme
      tests/tcg/aarch64: Fix test architecture specification
      tests/tcg/aarch64: Explicitly specify register width
      tests/tcg/aarch64: Fix irg operand type
      tests/tcg/aarch64: Do not use x constraint
      tests/tcg/arm: Manually bit-cast half-precision numbers

 tests/tcg/aarch64/bti-1.c         |  6 +++---
 tests/tcg/aarch64/bti-3.c         |  6 +++---
 tests/tcg/aarch64/mte-1.c         |  2 +-
 tests/tcg/aarch64/sme-smopa-2.c   |  2 +-
 tests/tcg/arm/fcvt.c              | 18 ++++++++++--------
 tests/tcg/aarch64/Makefile.target | 21 +++++++++++++++++++--
 6 files changed, 37 insertions(+), 18 deletions(-)
---
base-commit: 046a64b9801343e2e89eef10c7a48eec8d8c0d4f
change-id: 20240624-tcg-bf8116e80afa

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>
