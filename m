Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1538006ejc;
        Fri, 13 Oct 2023 07:11:34 -0700 (PDT)
X-Received: by 2002:a17:906:1d:b0:9b2:be12:d9bd with SMTP id 29-20020a170906001d00b009b2be12d9bdmr21866889eja.77.1697206294696;
        Fri, 13 Oct 2023 07:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697206294; cv=none;
        d=google.com; s=arc-20160816;
        b=VE5ZSLdAQHIs86GGp2mekRAoImpSvV7RvUkLrZpl45TfIq8HUbgr+1VuXe7MA6msdj
         Y631Lhcz+w4WqdRZvWVjhNkN+FuMFKIdwwIVu0nA8iCZkDd3xlYPdcYpluwKxFpOM1Ae
         2PpL095eBMUXNz2Aq4p2lnIg+XJbWJ00wPBaMF20HdjFOiXKega6ArotLH7jfguQuTgJ
         vJHSrdOW17n7sU9Q8bzuHXsXF4rrV6ZnLiemSJ1KIFDeZHRLDR1z/cGqZMTsuCWjV4Aj
         3i6JJIU5VEPKxJTTLwp79qLQBHTntnt3ICRv6DTaKc4vWNPe2nd72+4f+3n4QjL5oz75
         cOww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=s90efDO1BIm1Rx3O8v37p3cF+pWbPvUZT6DeInS4MHU=;
        fh=rgPM1QcSOyRuPluCdnsNd8knie+1OCUx2q8ta7MpVFI=;
        b=DMfbqwKyDDbxjLaBXmZHbWh3Udbg/8Ln1BOZ0+ooYj/cRnkjhz9JUhXFUXPMTfjt1w
         o/n1DEzVzL30r7Y7Xh5NkQO/ZWjA85OhqZbiGKWWSkpOGrSRPr4Cc/mPDcdB8ETSAU46
         pmfLnk3aZfzZyP8GUsrpt3Fqf7Vgbuqj3mzPdmd0uMAHULWfBQOs09f9+jbSdhxxsG0N
         EjKcKEBsN7nBJgbcDrhsLMHqUnOxyxQIkSTuRlI+dGkw+U2BJnR4v0lx9GUuppIgwNOO
         4slqUyll6+m4y3jRFUDtwGiC1UMxp2FIDTM275gdDranBOTwnB5Tug/MLkAnEyoJfAOS
         eXSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D4eeFNVE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s15-20020a1709062ecf00b009be0b121425sor127189eji.21.2023.10.13.07.11.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2023 07:11:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D4eeFNVE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697206294; x=1697811094; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s90efDO1BIm1Rx3O8v37p3cF+pWbPvUZT6DeInS4MHU=;
        b=D4eeFNVEcYfIEm31nxx6VRVFZP/pyX4C8TEdIeaMDZSc7E7jj3sxSInf7rPZH4GOY3
         MlSotH1strG4Mk6t05xTjTl6iLMcmZpotKhU+CfLrZtgGQFMznuilnFV6J+Rt1TlDwSE
         yf1o4blROJFxRBlyHzViJ4Tci6z9GuBq1gYW1UknM7uqK9lbuU3QUQRCj0WdQBadNcHX
         2EX9/BG3nkP/x8ZUAu15hw2WijkTT8VcdqZ4VgT0mHI0E4FPwW8XNQzXhoH/Lj2/gV0a
         iJ1A6nB7l0xFusEundqIUH6v5hT1T8a4vPHGbfSU33lgDdD7J0GsLw7uDVU0Gx1rGNRq
         Bhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697206294; x=1697811094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s90efDO1BIm1Rx3O8v37p3cF+pWbPvUZT6DeInS4MHU=;
        b=ZGs15nHH0d2s2YQ+jSdeF+wJ84mi7Xx76t5mnkTbd9CmSM7rf8ztA4yQe0QR/GXgsE
         kgnppYy868q1J2ibZ88fhN9HuUiGYWpHJLdRtzw9jd5hDyXDZi9VWS1Sr20N7Q1raYTC
         61EKXJO3MebuTj8m/LlM5IvHMfZ8eRITRABcZs6Pf6LHqsF+mNfSCsHOG8ApJ7o+5e6F
         9Oqb6f892tMAB6h/shDobFDnawWDpLaA0co+Opr5gVWiNHNa0xC3GvCm4r7Q/CE5kn6H
         YAmXKuZBtKJ+A6gFVKlAmYjwbRcIvYT6VsJSg7XGU4WlAG5ZU50l+vX3VzKtDPUGgbUm
         50GA==
X-Gm-Message-State: AOJu0YymuCWWA2GdiwIQxPt50GLg8fxK7fZtZDm82QblLb6HY4+JUoaO
	XJ4IMfJAUO2uaJvf6oSMkCNEsxMi
X-Google-Smtp-Source: AGHT+IGIZNhFaQDEX8RRp3UYG3CNLSEfyasGA1+3fleyRZrdHksc7qpV6DoVphx8jT1ebeVDB3nyzg==
X-Received: by 2002:a17:906:2929:b0:9b8:df8e:cbde with SMTP id v9-20020a170906292900b009b8df8ecbdemr21574346ejd.51.1697206294263;
        Fri, 13 Oct 2023 07:11:34 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.172.118.168])
        by smtp.gmail.com with ESMTPSA id s10-20020a170906354a00b0099bd1ce18fesm12674983eja.10.2023.10.13.07.11.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Oct 2023 07:11:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Gavin Shan <gshan@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 0/10] hw/char/pl011: Implement TX (async) FIFO to avoid blocking the main loop
Date: Fri, 13 Oct 2023 16:11:21 +0200
Message-ID: <20231013141131.1531-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: itoEWVsBIINl

Hi,

This series add support for (async) FIFO on the transmit path
of the PL011 UART.

Since v2:
- Added R-b tags
- Addressed Richard comments on migration

Since v1:
- Restrict pl011_ops[] impl access_size,
- Do not check transmitter is enabled (Peter),
- Addressed Alex's review comments,
- Simplified migration trying to care about backward compat,
  but still unsure...

Philippe Mathieu-Daudé (9):
  util/fifo8: Allow fifo8_pop_buf() to not populate popped length
  util/fifo8: Introduce fifo8_peek_buf()
  hw/char/pl011: Split RX/TX path of pl011_reset_fifo()
  hw/char/pl011: Extract pl011_write_txdata() from pl011_write()
  hw/char/pl011: Extract pl011_read_rxdata() from pl011_read()
  hw/char/pl011: Warn when using disabled transmitter
  hw/char/pl011: Check if receiver is enabled
  hw/char/pl011: Rename RX FIFO methods
  hw/char/pl011: Add transmit FIFO to PL011State
  hw/char/pl011: Implement TX FIFO

 include/hw/char/pl011.h |   2 +
 include/qemu/fifo8.h    |  37 +++++++++--
 hw/char/pl011.c         | 140 +++++++++++++++++++++++++++++-----------
 util/fifo8.c            |  28 ++++++--
 hw/char/trace-events    |   4 +-
 5 files changed, 161 insertions(+), 50 deletions(-)

-- 
2.41.0
