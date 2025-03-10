Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp867294njc;
        Sun, 9 Mar 2025 18:28:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbWvVn6pOLFM27Cc+HKfZXmrYkZROgz9UA+7Bb7e7Urpia14mZCI1pfhEG3Yva63UOZqrOkMv9METHYw==@linaro.org
X-Received: by 2002:a05:6000:144d:b0:38f:3a89:fdb5 with SMTP id ffacd0b85a97d-39132d244fdmr6476397f8f.11.1741570109676;
        Sun, 09 Mar 2025 18:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741570109; cv=none;
        d=google.com; s=arc-20240605;
        b=HFRfanLq27OWNZPDPlrWxN436fCCIHJv5QCPPoD5/q/xoNOfiN8F3NN+yQN3N23ZBe
         XxoBfnSjDkYfwPBum5yf5WoNridlhzA/tAsLLwoaW0wxYN9pjeRjK4xE1V+E4msT8Jja
         juaB3nsr/toZY0owsoSZX+Ph9LfwHlyn0WPmeGEzdGevLRqLpiey/Hhzv+MlgXzHvRfD
         1Bjv9sKm82uuD13t7lOUpRrdddDAfl1XA0YMZ5Tm0mKDBALXREp3ZNs8TFLLv+dRxEv0
         rGPyuIImM18h1xqRlKiDCrky+d/djoS+q8gret721kAGxPlhq7qcpCKWvSILwAf2w2fr
         HSRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=ZuKji3TX6tvR6tij8RWO++VDOISRmSy52iwsHPgl6P4=;
        fh=f1IFOtqkrftenBnUBbzGSXz2yy9MQ+zz3F2OvfjUVR8=;
        b=jU8FUrvQk1pQb9p7l4Du9ywq9DSVmy8VGi0i49xqo4138B1aK17rC8MxySGDrs1ZWz
         oHS/XCl8TlqwQghIx7vDUCgE7F5L361+JQwD2lJcjUa/6b6WvJSJ8w+wQFh4sjT+bQD4
         a02jII2gpXVC3O8x6wzfBCYlAMOGbhK7jjW+nsYlIIG20+Ozf2VZLZGTGTvXKnVkrRjH
         XTYwtb9WJ5FfPUHnshRbqPtIS4mgBSRQdxIls5j7pnVfQGn2Cf0/Cw2AwUSdZghl5STE
         DzyH5D8joia+rb/cgKwzEq+JoY3QpbQxeqicm5SZmkcMpdbC8zyEuO3d/rq8OHOb/JYF
         7slw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wg5Cd6Yw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3912c13d58csor1879392f8f.9.2025.03.09.18.28.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 09 Mar 2025 18:28:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wg5Cd6Yw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741570109; x=1742174909; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuKji3TX6tvR6tij8RWO++VDOISRmSy52iwsHPgl6P4=;
        b=wg5Cd6YwsZv+qOW/siimXwijW7R9HkHmbiAyXLpv3R5HsVuzxy01kvZ/nzXGZnjvh7
         yzS0lxC0kPqo9/m+CzEShAt7IRmkHY2GF5Mw8OVnbqzCCT5Vh+okc39O1KeZVu5XXRs8
         Z+cKUR0/3lUuRvIljaHythaPVH31IyuND6z5Gd8/DLVGag8Myi33JF4/T1IRWncXE6V6
         HSSuP2H17U3CC179sVkN1AV0wqu18WpRnnq/Vh2uFl3t9Ni+5oVa3ejszLoemZN+f3wd
         F52ZGEk+noKUfx2JUi+UtZyDefIclt6K3KAoTFrg2T7d0xCC4kIIaeXwlEYNzu7UGs13
         cGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741570109; x=1742174909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuKji3TX6tvR6tij8RWO++VDOISRmSy52iwsHPgl6P4=;
        b=m3jvbIeJClL3Mqc4fkLtZRGCI7NnRE34pPjWzi1+f3oqc1yTnw3TPZjsJuVzgysBcV
         West6lyZcKLKV2XKBWZ5y3Ixpghbhq6EDAYKUvB0Npn/lw0MpLTdkUC+RON/KqTUQl1D
         lFS7RB5fuYSP+PvPUMmS3GNNyhYse4Zi5vWQVR1R2w1QGVsuyY2mfG2gbpmIx3vYcs50
         CR0kIIaPe7bhJDpvgHgolN7mIBQxlZxr3XntxnXNZQqusXPhrX8uCskTKOMc5JVu4YQk
         Qtci5J8V78I3It7Cj8dGSGbBP0PaSW3zzz+VCvPDAv80NJpbeYJKmKHIPZitPGNXhOcm
         MuIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgOoGOs1lQlJXI7oqh+TxnuGx+nmCi1XheKbQbXZUsFCjeZAQlnldI/CvmpT0qeiXKTKPn6eDDCP8W9A==@linaro.org
X-Gm-Message-State: AOJu0YwxrY1yPDGw82Iqm3uWe3SW7TMc7bU/V04DUntNrc1tFDObJY83
	p8+OReZagdmse7jNX+E8CO/UPQEjVkCswXoJ9xyckooFkcQ+ZgFe3As41CzbvmfCOrOuzjPW7/Y
	Lm3ofnQ==
X-Gm-Gg: ASbGncuvf+rMvwg2FFaa7g89XEIsC6Xq7BK0AV7UBcWIqWANHdAhUFPJfjoljFHC/ZN
	2JysBygNPFDXtScM9CjWbtoLx39XTyzpRjPjJyNdYQRgEFsSkoAj9y73OtvYy6zYxuD2x/9wZEC
	XdshFG9pC9bkXOyD1Sl97w9kt3IRPSZFxsInr1sR9OupvGrCUKBE88YIzQaXzGP0Dse8ydVbMoY
	1cjxf6Z4fLu61ypTf5KoEO6KypnWZXO3vdMnVh8S9EZM0WXskuXmMFMtQgss3YjxNwoYRoS69bf
	Gh85tsZ96OWOiFfN8Q02X8nxE0m8vJUdw84PtpZhcusyh/7xxIiYCcxjLlTHpUsaBoO12eOCeu3
	5RGk7FMUI+7H9RpcrLjU=
X-Google-Smtp-Source: AGHT+IFtgpsGprqlaqk5f63nyyVzGzsREmLq/AX4qELWJT65J+3LyUsh5oPaAL9dZz2jHK1qh1lD/A==
X-Received: by 2002:a5d:5e10:0:b0:391:122c:8ab with SMTP id ffacd0b85a97d-39132d5f36emr5316062f8f.22.1741570109152;
        Sun, 09 Mar 2025 18:28:29 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb7934sm13527928f8f.12.2025.03.09.18.28.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 09 Mar 2025 18:28:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 0/7] hw/char/pl011: Implement TX (async) FIFO to avoid blocking the main loop
Date: Mon, 10 Mar 2025 02:28:18 +0100
Message-ID: <20250310012825.79614-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: VVyacuTCP0xl

Hi,

This series add support for (async) FIFO on the transmit path
of the PL011 UART.

Since v6:
- Incorporated Peter's fixes in corresponding patches

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
  hw/char/pl011: Add transmit FIFO to PL011State
  hw/char/pl011: Introduce pl011_xmit()
  hw/char/pl011: Factor pl011_xmit_cb() out as GSource
  hw/char/pl011: Trace FIFO enablement
  hw/char/pl011: Consider TX FIFO overrun error
  hw/char/pl011: Drain TX FIFO when no backend connected
  hw/char/pl011: Implement TX FIFO

 include/hw/char/pl011.h |   2 +
 hw/char/pl011.c         | 150 +++++++++++++++++++++++++++++++++++++---
 hw/char/trace-events    |   8 +++
 3 files changed, 150 insertions(+), 10 deletions(-)

-- 
2.47.1
