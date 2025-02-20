Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1887514njb;
        Thu, 20 Feb 2025 01:29:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVEZpUDc65P091oJbOIXRDAqXUedfoENmRvRAaPEw+Vj2ocpEzz1DiAiffxnNPQtp4V7vGjszi9i4JVyA==@linaro.org
X-Received: by 2002:a17:90b:278b:b0:2f2:8bdd:cd8b with SMTP id 98e67ed59e1d1-2fcb5ac05f1mr11084384a91.29.1740043756107;
        Thu, 20 Feb 2025 01:29:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740043756; cv=none;
        d=google.com; s=arc-20240605;
        b=U9ys7ruXBqMaYcP5UIeJ4XISSgdZ1mFHiEd/zZFv7DKxcBY/5n81Ju2dtj969jRiy9
         Q5cDi8CBYAL1EURyGXdv85R3C9UQEANkRXh6JQoeRZ2xJV+0IU4XOmbcDBkoR5vBCqmQ
         q2Mu6dYFCZBhM4L4hZwtOfr7dstf+4opIEVjo8dnTw4onJ8uyLYUnBdVXmmNarnWlOr+
         pxHhLRRx6QBB7CGf5yafKmNiIJ1fpqfX7qo8pnLlVPflFG7p36pYSmo8iZIKIscKgf/s
         LREcJtGv264CHgoQ+IF0D1pg7Oiahn8EHpucc4zC6I+ebXfXTzc0RvbSDrKg/TTUadrn
         MO5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=f7n0sYwrB8IT7jhirk9RyIiTw/ke91kLSgIHGTYFSYs=;
        fh=BmEoDUc7wOP7E+HVNbtY8RrArmT1l2Y+feSGZuHVIic=;
        b=bCtfTPBfXvJMe4r7JDkNWtqLQTONrabWaPcEP2tcWCbgUJ+QSR2M/OreE2hJZ3Lt+F
         Xye3PBGCLW+QjTHZ5mQ6g2x7Hfk0akNdQY8b0A2oYUkOFPtKyoCucqdiyPd/1TK14Nd2
         9bbRtcwyWh0zknIcLFCjSH6yM4uL2ymGCu1AfHV6wQQVycUe8GJU5WVUI1VaW9ycY/rJ
         U+fsYh/21uajtqVmk4+vTziVNJ38skLa6U548AdaOC0zgtLSyVG4wuMXbyLBoqTtTnjv
         y2rSkmI5mfk8C1gLxKIa6JNpU3wD++4rHiWiGr/eeJcScqR/1d3T9FbQHlgEg28HzldG
         gkaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gpawU5mM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2fc13b93700sor16300496a91.4.2025.02.20.01.29.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Feb 2025 01:29:16 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gpawU5mM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740043755; x=1740648555; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f7n0sYwrB8IT7jhirk9RyIiTw/ke91kLSgIHGTYFSYs=;
        b=gpawU5mMKPgeEoWB0GyivIEW+6dx2jz/0rWe4LazsGSH2ESn7SxKUgCNAeQcJkHAYx
         fTyHRxnAO9OBYXty1GvH3lLL1lYziMH2kOaGeaK5R1DQ3E6Gt1dnlgvOhLeIEMGvSQ7X
         CqpbJ4+qFd2TvEEPFRzvtNDL19N02S1Ubm4fLjzKhfoH3t5dR4lyG6NRzQEEEEh2D0AK
         mSAbNdgBgEo1eWwp6KYXM12AwC8uwzke7P9JFY5OvmjMsOkJrL5F/1/I6Ywv/ctlKcSx
         CWdTdLXiC5Z5nRCx/YtHGfwv1WQrkO/tWqv5XtWiJ0RkJBwbiqkqRCS4SJW5iKHsbjEj
         gB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043756; x=1740648556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7n0sYwrB8IT7jhirk9RyIiTw/ke91kLSgIHGTYFSYs=;
        b=qcOwXReKaZe6zo6SmCMed09/+wS1G77pWeIOHKhhTCnGyXpdwp6Rl0WMJ35pgS36uq
         G48LcuImzR/S3cYbkK44oQqBhjWQs8m8TIh4i2ykm1N5Yny8VZ3ZNxzzKJrZa/u1MDU6
         ZIu6aSw2sKM7ERWwmvQs4l38E/rTfXJ1vOVDs99KO8M2pVEZgLnZVCYXnXUjb2tq0Piq
         1o4ANapDIy5mr4CZUcmeawqpwGCBbYBnCOOw4ig324R3vB9flmkPFmvzmCmQ/QjqFYB1
         vIGPiAgdFxppFbehJ4entnZE5+DowOHNYZxPWYIXoPTpYHHS3tbsXYKv94CwAteJ5zs1
         B0Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUBGdEDYNvuSVcjyIXspLOi0lcTpoHM0wH807ZxvRI/vqOcDotevdrWJNzPKm2o/FKJWcF1Sx5r254gaw==@linaro.org
X-Gm-Message-State: AOJu0YzcMqgVUElM2YGuRVyA/ocLpJYWJZYwzqzrrr8P8ZL5xA01G35h
	6KnHl5U4Br1hMQZgBxWVjArKRewsaGehXJE0vOqt0kq9ChVhgNQ0mbfaCqz2jPg4Xw==
X-Gm-Gg: ASbGnctystXb6pCBfHB6cJcbsS0zBWSEKdm/m3wd7783Hfxn29pZsZO1AIZ5B6JbU8w
	XdB5h2vpXEqIN6DsHm/tPffx0qZs9MnsyjQcKekhatRITF6IGDoswM0F/dqLRjx396Ttli6o/Qz
	L/pqPFiI9egzsiqkL8Y6BoqoRIg2evbrLAWtRgx40zfy/iBi0K4LMYwBc67+cZ9sRJtWdYnpqeF
	aGWhdnLqBWW8OYrAw/tW5jOchoBdXFXEEmS4qAxuknKyS7SdFVp73+VbNSbGP1Biy5djpXgTqZR
	tcvSX9CoNklR5VBFCMriqWYovXQoiN+ssMRalz5ZTJzqHW9LO2KW0kyqY65H3TJx0Q==
X-Google-Smtp-Source: AGHT+IG2Q3SYtbCe4wTkUv4WZF8hYqRULU15v/XV9f3q2XdUUXN3lL352G9sZmm2sqDD1X2AbWrY9A==
X-Received: by 2002:a17:90b:180a:b0:2f6:be57:49d2 with SMTP id 98e67ed59e1d1-2fcb5a36812mr12484165a91.17.1740043755174;
        Thu, 20 Feb 2025 01:29:15 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98f6965sm15329037a91.29.2025.02.20.01.29.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 20 Feb 2025 01:29:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thomas Huth <huth@tuxfamily.org>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Rayhan Faizel <rayhan.faizel@gmail.com>,
	qemu-arm@nongnu.org,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Luc Michel <luc.michel@amd.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH v2 0/9] hw/char: Improve RX FIFO depth uses
Date: Thu, 20 Feb 2025 10:28:53 +0100
Message-ID: <20250220092903.3726-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: gZYxjIIyrAl3

Since v1:
- Fixed typos (Luc)

Some UART devices implement a RX FIFO but their code
(via IOCanReadHandler) only return a size of 1 element,
while we can receive more chars.

This series takes advantage of the full depth.

Inspired by pm215 chat comment on yesterday's community
meeting on the PL011 Rust implementation description by
Paolo :)

Philippe Mathieu-Daudé (9):
  hw/char/pl011: Warn when using disabled receiver
  hw/char/pl011: Simplify a bit pl011_can_receive()
  hw/char/pl011: Improve RX flow tracing events
  hw/char/pl011: Really use RX FIFO depth
  hw/char/bcm2835_aux: Really use RX FIFO depth
  hw/char/imx_serial: Really use RX FIFO depth
  hw/char/mcf_uart: Use FIFO_DEPTH definition instead of magic values
  hw/char/mcf_uart: Really use RX FIFO depth
  hw/char/sh_serial: Return correct number of empty RX FIFO elements

 hw/char/bcm2835_aux.c |  6 ++++--
 hw/char/imx_serial.c  |  8 ++++++--
 hw/char/mcf_uart.c    | 16 +++++++++++-----
 hw/char/pl011.c       | 30 ++++++++++++++++++++++--------
 hw/char/sh_serial.c   | 30 ++++++++++++++----------------
 hw/char/trace-events  |  7 ++++---
 6 files changed, 61 insertions(+), 36 deletions(-)

-- 
2.47.1
