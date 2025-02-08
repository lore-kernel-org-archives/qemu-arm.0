Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp976377njb;
        Sat, 8 Feb 2025 08:39:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXbJjwkCfArB24XNKOmTHc3w18seJFFLLsp9ZeCDN+dpNb1VGh6fC9UXoWAcQvGqgCsoTAFd7W69PduWA==@linaro.org
X-Received: by 2002:a05:600c:1d0d:b0:431:5632:448b with SMTP id 5b1f17b1804b1-439249c658cmr48383835e9.25.1739032754592;
        Sat, 08 Feb 2025 08:39:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739032754; cv=none;
        d=google.com; s=arc-20240605;
        b=Bj4kjCg/cPWKHZOCBESNBBGq9foZzZ8tOz27SKBGzU4IwAwYmUenHcx0Q6sXxgGmeA
         +Q5/C0O212SMxnkHebADtctSJioKc50eS/8SHI6yOKvgyoFW+3s87bLyVI5h7zmm77lC
         H7UCeyyQ7FJw92DB5jDhS58N268lq4UrUHGkynF5gpM7L+0kZGXzmyw7H+bWZOOKfsak
         yi/1uxAzXICaSgLwnaxJXy7S2bOdcASLtTv8MihRgBEQFj6FGtQ9Ql7VWU/I666wc+Zp
         ABJQo3UxQdPduMGFf72ampkDO4dUpz7EO5FWzNDx5SXfb51ji8JocPOJwVsFqCemYTWr
         fT8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=qaigCbdh9lLsPPD1nebNreJyZCsil1fOMv0TEy5XZiw=;
        fh=qruG9N0OdoJ6z5PQwGTaWI88pQ0x5OicZrxH2lf0gwU=;
        b=LvR3AwermKLEJWGxJdWp8+GyZlFf8oUFyHFZNRuLwuaYV2zSUK7DidVyb/INjbLzjR
         cTXDWMX27amUc2SwPIo573lDaTSk9HR0ULAypJvbV4EB1eqAzBji6/umifU9pzgNAjDu
         ovrEm+dBDVr7sAnwXzg7cCvxUpo6kw+UEwTtA+Dt/GqOa84z4PHgfedWte6BlnDKg2HM
         ZyZlBUeBfm1nFz4wm3pprkdbTiVCv3+umS9aFoOu/Ns7zizRHf1NEUpZfP080b1q6cZU
         lShLe6GTxKW0gs0ClIPWSJ1ifGov4NJLKNGtdg9xxPvDA+ezju+UZJD2nyAXw01Rg2kh
         rhNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="W7/wn4uw";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43924030d34sor18549855e9.10.2025.02.08.08.39.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 08 Feb 2025 08:39:14 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="W7/wn4uw";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739032754; x=1739637554; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qaigCbdh9lLsPPD1nebNreJyZCsil1fOMv0TEy5XZiw=;
        b=W7/wn4uwC4QyVfooFuwcoaxv64sQ+6sHC0qlxpz/cZ6VmRozGrjHkDq+jozZtsZouo
         L+xD620zxbKjIVafnWC+0++4vAe8oTbUeHGTC2kmV/7Cev99ZZBZBv8wBNArD7qQD56z
         048KSTY2RIkFNLPmaPMqP5WH23vaVcjd3V57D8sPJRSzhRQVvp4d2dJ3P567RJc/7xA9
         oW2fgxwFwWCSh7E8d1Mt2gypai8FRHEdcM2Z2DTIBurEpMd97FrwWuRftJjpHykVoSXv
         VBdsCJE4I1iL5E8xncygxWGhR+Z+tud696sR6+fkMcIhPniHLlJBEYeYHWXPPSVx0aam
         ivaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739032754; x=1739637554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qaigCbdh9lLsPPD1nebNreJyZCsil1fOMv0TEy5XZiw=;
        b=Yfge0pAfmP2WAnoeqUCP5Xg1WsUF4mV7kdgqaOE354u2clCUfEnjEcomJ4UEWg8Oup
         BhA6b0etxY4HWWFMu3Ynvba7+GDSPhj1LIIxAB6bbCfzNVk3eiRcf4L9ETJ2rFKDTZ6N
         EFpKuZYKSyYRliYP1ZvVuJcIxZ3XajTduZcqAH9CQP8veQXfusFCzHgmK8h4xAdAxZ3N
         0nkC1/WdhvL0AVnSn7rheesqOP1M0Ws3b/K7j9/xHfzOUUOACrJpUMF75bRvU55STBut
         0rzU3DRkw5QjvzYf2Srl5rY7T/RwTHOG8zOXz368U3/ypB9WOwgFBqbDPE8Lkqa+2qIW
         3PgA==
X-Forwarded-Encrypted: i=1; AJvYcCWdD4wx+CzVwr53OIjqjO+SfKL+NMHhOgsm0H5Xq2IR1RXeJR+uZOEmVRTWRIgy5DfMmcZn8gkEfaOAgw==@linaro.org
X-Gm-Message-State: AOJu0YzKJ5FFMWVc1atpCa70C4iEfsLmAYHnqe1T7W5SBEfWTMqH7dKm
	vIDvDDlIArgBB/hdFf+SusCLd0oGB9dgCWkIaFRw7Up7vlW8hJgBJh1UEN9RH9yBQA==
X-Gm-Gg: ASbGncvpJ0N+OPB+xKgKcLw+8zz4ZodBODGAdYayRU5jMtRC5jsMqPM6S24RJ3W14nF
	pNeALIVpmR+c4ZEEmTrVJMI9GBDLA7LzumnXa80Dz8zTJX4eDG2UtwcJsCfSNH4Y3byF1kJzjFX
	txJYyFIRknhEEeHris/8MpOTLBWPK4NvQk1pxNCQw7ngqpCxVZ7OQ2cKV5w57D3eEzizxbfBPLF
	ig2/s4qi8jxJYUYIHelt/XqtYtwL+kKFEVHxTrnQugzR2mMI+r0ctd5SliLoEYKigByq5j5pdO/
	dpjuMnnv65Hpskqr7Uz2ausWRBL+JcIGFAFGfZqha8qZGP96usjUniLqigKRpv3CHQ==
X-Google-Smtp-Source: AGHT+IHygbNeN/nzmn3uAxT66ZJ/KOZhj/7LBKvwVV9M/SHGpg95uFH5ZT36qRSQPZfOiTvu5G8SYw==
X-Received: by 2002:a05:600c:cc8:b0:434:a94f:f8a9 with SMTP id 5b1f17b1804b1-439249c6dfamr55862665e9.28.1739032754064;
        Sat, 08 Feb 2025 08:39:14 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd44c5e3dsm2007425f8f.62.2025.02.08.08.39.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Feb 2025 08:39:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 0/7] hw/char/pl011: Implement TX (async) FIFO to avoid blocking the main loop
Date: Sat,  8 Feb 2025 17:39:04 +0100
Message-ID: <20250208163911.54522-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 7srNg62Q134R

Hi,

This series add support for (async) FIFO on the transmit path
of the PL011 UART.

Since v5:
- Rebased (few patches already merged)
- Do not forbid disabled UART/receiver (Peter)
- Use fifo8_peek API for wrapped buffer (Mark)

Since v4:
- Rebased (loopback)
- Addressed Richard & Juan migration comments
- Split in smaller patches

Since v3:
- Document migration bits (Alex, Richard)
- Just check FIFO is not empty in pl011_xmit_fifo_state_needed (rth)
- In pl011_xmit check TX enabled first, and ignore < 8-bit TX (rth)

Since v2:
- Added R-b tags
- Addressed Richard comments on migration

Since v1:
- Restrict pl011_ops[] impl access_size,
- Do not check transmitter is enabled (Peter),
- Addressed Alex's review comments,
- Simplified migration trying to care about backward compat,
  but still unsure...

Philippe Mathieu-Daudé (7):
  hw/char/pl011: Warn when using disabled receiver
  hw/char/pl011: Add transmit FIFO to PL011State
  hw/char/pl011: Introduce pl011_xmit() as GSource
  hw/char/pl011: Trace FIFO enablement
  hw/char/pl011: Consider TX FIFO overrun error
  hw/char/pl011: Drain TX FIFO when no backend connected
  hw/char/pl011: Implement TX FIFO

 include/hw/char/pl011.h |   2 +
 hw/char/pl011.c         | 140 +++++++++++++++++++++++++++++++++++++---
 hw/char/trace-events    |   9 +++
 3 files changed, 141 insertions(+), 10 deletions(-)

-- 
2.47.1
