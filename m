Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp867406njc;
        Sun, 9 Mar 2025 18:28:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXebY6S3vBoxLcrDEv2LeU9qTr42iLLhWLVC/4UCQ7CIjpm+esfDiPXgjvPSh30zGTSCa0sRWeRcFzMHA==@linaro.org
X-Received: by 2002:a5d:5848:0:b0:391:49f6:dad4 with SMTP id ffacd0b85a97d-39149f6dc65mr803549f8f.41.1741570131035;
        Sun, 09 Mar 2025 18:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741570131; cv=none;
        d=google.com; s=arc-20240605;
        b=Eg7LCiaJx31YS10B/1wO+KlEBvucPvU/Owj5pdxzcemqPhdYsSLJTSVD7qe82yM2eE
         Ex5UZbAdVSUCw01I0L2sts9i92/fxq9niy7kxB3uLyYfBz1Eih9GAdDfenob+GJsinLH
         jaO3UYlgpcCfAhyTTktkpi9+GL+N6TffbkS3qHU7q7yu00cg9RMjLD69WMCnHqcJ69Rl
         ExI1nTOmi4920F1IF1nEArUNjqvpGAF27m3VtCny9jRdMXZEqmD2q+ZQYidJeVLQNSY2
         0OwQV/fseoqUA5ULc8QPrZmBy1kVk9GTPsothGcbl9BDBT0Y1Vsn4J27touzpGv/zF7E
         lmww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wS79SS1CQxxkd3qnon8nNpovVlwqoGNVt9KU+09W3OY=;
        fh=tngv3MEYnrn9g7sMmo+JXa1jKzAe4+1TboYWtOYgW/I=;
        b=cjNDb0gvVuZmr4WptB7SO1cghaYTyyp1abT7hEv6u4UxFER/9JjSZPgxxtCWJzb8Bu
         GyqEQAgTJoZ6stt7XuckLx2io10pkplvGL6R+JAWBM1jk66M4v7pkHW5ghP1iQNxP15n
         GTvMzyOvTbenYILgfY2oHo28RvTru5URiTFYCSr4RrnO7kNjb+oNR4OcdYrUwSYqfVN/
         OVOR+yraKOpqEpOmVccDu9zErzSKE3j7ospXiJvbLZpxkwdOCJ/dB/RLyt5g5icz3Gyj
         1ffJLhtPoNyzkQzK6g2jOdkyhXfftjuDLqGjsfJH3zBleW/p0c5U4eodL5YyJ0TRKfXV
         V7QA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xH5BLo2P;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3912c0f29a2sor3285230f8f.5.2025.03.09.18.28.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 09 Mar 2025 18:28:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xH5BLo2P;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741570130; x=1742174930; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wS79SS1CQxxkd3qnon8nNpovVlwqoGNVt9KU+09W3OY=;
        b=xH5BLo2PzBlkizHPixmwlhVKRj5jmsSrtZaa4MpQL4aeLcsZfnPAuRP2ToRnsiSNo0
         srOw/H2Tby2EU/i6gM2fvi8lpETapsEiNTINhCSzeGdAFCgq4QNNdb0L47WlSmVtuLzw
         4Wr0VdY0AxJJjxs88syTDe39lLjBwqno0lycoWsFAHQ5Vuel7oimfkRLE0471nDGg2dq
         ir2rigg3B6IDm09Ay5ANJid1yw0jyQywC9Ej+E8Tu56kGYVFVH6mSITlGg+SGlMeEOlF
         Ehpz+f8t9Bag7rmKd9AuWXKVqtYIr9IdvaFxpFBaJAM0+bElnlki+A1WbTi+5wOuos+3
         58bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741570130; x=1742174930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wS79SS1CQxxkd3qnon8nNpovVlwqoGNVt9KU+09W3OY=;
        b=I8JbNyRWY4BpCO0Kl8tjOdxNBSY2Ahy0uNJT90LOCUsloJl7F1xXV7Bn/1BmK8NOI6
         CBTipC+LKlExg+Lnkgy4lIOp/pWquKFShNxyMPJjH3e34IgMSmM5vB5iBFH67VfKLm9R
         PSWke/qYHo4AAUTbEpo3aRkoC9E/aIKMX5/5EwNQo0nBiEZiQpnwX/+QvCEsxvaXzUom
         obRBWwGIIipk6oh4oSLOO+m1wrc1HR/EbbmYxyDIC/9LcsrJmEeqI1dLhMkyLljJs9rM
         pGP6vA3rHoc54h3V1lkEFYH1YPjdS9ofL+z+mY8U3WfHfY+db3DG7MH6pS1pMDwhMVB3
         e8/w==
X-Forwarded-Encrypted: i=1; AJvYcCXvFqN9LJFPwSaRDymLG7rccIw4Xn5FT0/cRC5B96t1o5uBN/YTeMcEUZlZMWAtyfnXWCqBPN5wS+Z53w==@linaro.org
X-Gm-Message-State: AOJu0YxRRVpKUO7NxxILZEn0V334ryYioz2unWx+Zj0kl6mB+5500mVy
	4cvy0PS4YFRtR2HM6tqeI2A3zjCgWz3n5WoI0bgnnDL0XHXy3KmmLQHr/FwH6QgJ6cz+t3BTJFv
	Uq7MRRQ==
X-Gm-Gg: ASbGncubKK1Gncuq3QgENE8SQt2vueD2a96EslibGLylAfFMTP5YkvkEo4NfvnqIaDc
	lLO5SvEmtQ/rdSG6XtZa6vQQub3nef35VXiUvqPBCVM4Xtd7DnniGBX2naJzHbHxpACN2GhVlTM
	+bpHQXPP5ARiVJNjNkYkPLjfkJZWdQLu6OZvkevzKWgGsyyrrfhEOgEBK/HJHHKPA2FdR4Pq2wf
	84jofwBfKHJ4bUOjXPLRnHmCDmK/7GEusgSOkNEmUEkUl9DQXW2b4VY9VkIIjn+nWTWR07YUbI4
	izybcRDIL/qQxZeivnBV4zJwS1dY0GIVQeaernOBenG3xfE7x6KNAAWvazpfnGzQrW7WsjcHQsz
	npFuLPF2j6Ajhwiv8EyA=
X-Google-Smtp-Source: AGHT+IEU+o3PvNWcLG1GvyNSXZDCJC2rsfUpn1+77ppYPB98quLAsSLIG7OR2dN6KsAByfSmYcdcrQ==
X-Received: by 2002:a05:6000:18ae:b0:390:f394:6271 with SMTP id ffacd0b85a97d-39132da96b3mr8000092f8f.43.1741570130520;
        Sun, 09 Mar 2025 18:28:50 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79fbsm13570645f8f.13.2025.03.09.18.28.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 09 Mar 2025 18:28:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 4/7] hw/char/pl011: Trace FIFO enablement
Date: Mon, 10 Mar 2025 02:28:22 +0100
Message-ID: <20250310012825.79614-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310012825.79614-1-philmd@linaro.org>
References: <20250310012825.79614-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sdz+EBoj+6OY

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/pl011.c      | 3 ++-
 hw/char/trace-events | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 18ea03a52f4..34a5cb3af5d 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -480,8 +480,9 @@ static void pl011_write(void *opaque, hwaddr offset,
         pl011_trace_baudrate_change(s);
         break;
     case 11: /* UARTLCR_H */
-        /* Reset the FIFO state on FIFO enable or disable */
         if ((s->lcr ^ value) & LCR_FEN) {
+            /* Reset the FIFO state on FIFO enable or disable */
+            trace_pl011_fifo_enable(value & LCR_FEN);
             pl011_reset_rx_fifo(s);
             pl011_reset_tx_fifo(s);
         }
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 1bab98fb5f3..c857f4c4b38 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -63,6 +63,7 @@ pl011_read(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x valu
 pl011_read_fifo(unsigned rx_fifo_used, size_t rx_fifo_depth) "RX FIFO read, used %u/%zu"
 pl011_write(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x value 0x%08x reg %s"
 pl011_can_receive(uint32_t lcr, unsigned rx_fifo_used, size_t rx_fifo_depth, unsigned rx_fifo_available) "LCR 0x%02x, RX FIFO used %u/%zu, can_receive %u chars"
+pl011_fifo_enable(bool enable) "enable:%u"
 pl011_fifo_rx_put(uint32_t c, unsigned read_count, size_t rx_fifo_depth) "RX FIFO push char [0x%02x] %d/%zu depth used"
 pl011_fifo_rx_full(void) "RX FIFO now full, RXFF set"
 pl011_fifo_tx_put(uint8_t byte) "TX FIFO push char [0x%02x]"
-- 
2.47.1
