Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp703316ejq;
        Thu, 9 Nov 2023 11:28:18 -0800 (PST)
X-Received: by 2002:a50:f604:0:b0:542:db91:9531 with SMTP id c4-20020a50f604000000b00542db919531mr4469415edn.27.1699558098047;
        Thu, 09 Nov 2023 11:28:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699558098; cv=none;
        d=google.com; s=arc-20160816;
        b=wPFha+t0EwIYzg/5TxcV27GCRlD247CebeUL213g6ETPhr+oS46Uj+vZWAgiLRkjH+
         /F5LnfciCt6pQ/vqw4uWOj88LGzZXnKKQZhGVX/gkNPaMKwPkzSVok47ANkD0eSjA+SK
         DLeWdTfYBUunYUpIB5fFuVfW7lYGRPjHVp7svtXBC9Bk8RrIgEzhJ3owDre7IlX3+1Ay
         55PlMViDHqmz/3IkByjKBV+ASpXnNUCJfIlq9BTj/2QFO9Nvx+do4uy6zYWXUJV93Xit
         zvWYDGJjiFsgSj7op2nrzfrStCY8dxvbohBcz7YWfJMvqDDRHw4bfXC9/Z7w3jQXYn/3
         j8UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=n5b+3846yd1OEZUDu5Pn1q6hKrxR7/QT62gd89N3lm8=;
        fh=DIg4VbvV6UsIVtjymVavUODq0hsDWu0+XvIrfuGsGdI=;
        b=yRtg6SSqQos4iY51Je8kHliCmeE281F2khpBV504XsKqE/ftgt89pQuyyqJJHzPyk5
         /mEw/2gxH0t+z9nVHDE56Nbk7u3ojE08hM/BQl2VQ3EG2yXcQtzzrqlQhdnugSX/md/y
         dUM472wvFJOP5fVgxrqFhAv7Hufoo0bXdKtLPdNsthBRHdOFNoNBxV5fy3TslLnC2vfs
         l1BbH6lKex7acvwzPFmPw9OcHBlCIE1rhJ63FW55GlhsCrvYaTcENMwqfkzp8u88vLxi
         1TRWitd/I5z7Brgtt9BFZiYbVXBJo/ZW6XYa7qqUkQHQHwDkCPkEJ+sGuxjBmLDSDRpQ
         NmjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Akd6nftf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b3-20020a50ccc3000000b0053da4d4a8c7sor294432edj.8.2023.11.09.11.28.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Nov 2023 11:28:18 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Akd6nftf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699558097; x=1700162897; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n5b+3846yd1OEZUDu5Pn1q6hKrxR7/QT62gd89N3lm8=;
        b=Akd6nftfrECjx0g+hR/q2PsqDK1WWu2NlxWKx8uT19cj3VbtDgmFWti2w2FxA1iKA4
         anUjtapoGe2ENGvBCID0JEwM8CNU4wk8JYSVdfb4pRsNf0F+tmjWN30332xIVa/OuqqA
         2J/0W2ijQEKtGLP1EIObMjWhIFpMSOlrhGFSbLBjEQrgzIRpVVK5cHXELir7qNA1iD00
         dr3ubJcn4WGPZHNIHqysmtaXTabA3IBkVK8ZMHLT6YFKymBiu1/Glv+P5tU/s8A0au18
         /fFhwcXofuGXj0kv09C8f8MTD8be2CEeeKU/st11i+nWm5bPA3bSaaYAf2kS5XPWBYb/
         eIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699558097; x=1700162897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5b+3846yd1OEZUDu5Pn1q6hKrxR7/QT62gd89N3lm8=;
        b=LeORcr8e9WxGe7j+UI7Upjo6q79S4TcgF5KwSeRv0QesIhGJkHxQ732/x3RV/chKPT
         A2b6YnbUBjNE9oawXlQFxA1P3R/pKOqPgvGA1nP13NTC3t0LsjvGx95dfDz2E0IpsHda
         KPD2fDkBRz6Vb8d+jNd3gqqekQyt44wDAtzzBJFhUIA0oIgAmf8JzGVnu/67XgXQgFxl
         kYiZvulC1tncwJHe64PbDb8ZQXLQLUta4PGqh+xQSDfSvRtNB5yf6qP3EUuD0I/r7ZHy
         PhNalg9svkFe0kZiIT00O/xY+FlnloQvXqKaPdGLqGAKj5GrDrDG9Ioyh9/IRx3NqIs9
         UVzA==
X-Gm-Message-State: AOJu0YwAmod2NkWIBUpoWZ6yU3WtfcUoYzSrggPMl+MyAY47AEhER/Vd
	f6IFys7wpkCP5BERNms2++BWh2J3rPcRBfjfZxXmoE9D
X-Google-Smtp-Source: AGHT+IGrlKcfj5xzrZDhzt+RJuMCRpLZlDP0DX6DujHBSZ6U10TjsTODrCjC5TiNNWG6PDtdnUJ6mA==
X-Received: by 2002:a50:d098:0:b0:544:92f1:83d0 with SMTP id v24-20020a50d098000000b0054492f183d0mr5291281edd.0.1699558097729;
        Thu, 09 Nov 2023 11:28:17 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.199.161])
        by smtp.gmail.com with ESMTPSA id q18-20020a50cc92000000b0052ff9bae873sm190257edi.5.2023.11.09.11.28.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Nov 2023 11:28:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gavin Shan <gshan@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.2 v4 00/10] hw/char/pl011: Implement TX (async) FIFO to avoid blocking the main loop
Date: Thu,  9 Nov 2023 20:28:04 +0100
Message-ID: <20231109192814.95977-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: RqLsugibWH+5

Missing review: #10

Hi,

This series add support for (async) FIFO on the transmit path
of the PL011 UART.

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

Philippe Mathieu-Daudé (10):
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
 include/qemu/fifo8.h    |  37 ++++++-
 hw/char/pl011.c         | 239 +++++++++++++++++++++++++++++++++-------
 util/fifo8.c            |  28 ++++-
 hw/char/trace-events    |   8 +-
 5 files changed, 263 insertions(+), 51 deletions(-)

-- 
2.41.0
