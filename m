Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp867363njc;
        Sun, 9 Mar 2025 18:28:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVcLbwAACyYrOrBLrsATsNQJRU8NkrEgcHs7Zqjo2Q4NuectVn5XhmxpON6Brlh7XJg72/Hi7/0mXcLA==@linaro.org
X-Received: by 2002:a05:6000:4107:b0:391:441b:baac with SMTP id ffacd0b85a97d-391441bbe46mr1677684f8f.50.1741570120052;
        Sun, 09 Mar 2025 18:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741570120; cv=none;
        d=google.com; s=arc-20240605;
        b=KmoaqTgIv5m2O4ENPQGEYku6usH3MxzkdzkaPxUoTMUGK6hh9NTP3FbSqbbgVCqht7
         qoVSn6aWXNUPcP7lgSKmJpZUDeLo8eLWJ5l6Py76L1u7x3CzKHPJztQ3w8sTX1eXw6Ro
         jLPe3lY1XHhGoiKI/IucnItybSE/PSudch2DeZ0kRsSeg0mdTK/uytoDEJoGV0YtlC5S
         oMF3REGlUzGhtNodZC403/AwUZURDVmJaTy0F8C+hYSJ8rKzVR+8INGhee22lVc2dmzJ
         DxXzVlU94vyO8MQ/jA7xGSGc72Bto4xruN9gZ3rkMf94wiuqfU1NQHWGJU0z4YsRcn7S
         CHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Tm1aRIWaBwgx/6x0GFSv25uAoJq4igL/u+tjPwXH2Gs=;
        fh=V0liTsPfBVYqngj2InEHrM/yFiwqsAdFaAEUMDnG8g8=;
        b=GM3iqfnLXvZiKAFD8N5QuGopSPxwrcq4ZGrX4Y4qzEn0x4nGbaxEUvNenwCWSPeo2e
         Nzvz2i8FJhg9pAFou1QL1nnfpYVFiAqORtcDc0CZ65RJHHQHl9dgpF1xI+nDxmfiDCb/
         HEVto7xrsfq+Gz8ydjUKOfg/pFrd9uG+3R88agyPnRJk/8hqs1L4Q0zAO3pD0VZJIK7r
         i+QezzZppZatuO5Hzc19hQpnLoS79jX4oSIXEQl4xseE2G7l9/2aF+gL0IB3vMyF0RZt
         6Hyo8iWMY9zbKuIU524/Zs0i9v/AzlfgJYlhzHLa31qMD/r/XVIBnDDmyan217YTNc3u
         Y8aA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mC1ivxJR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3912c01c654sor2369285f8f.3.2025.03.09.18.28.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 09 Mar 2025 18:28:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mC1ivxJR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741570119; x=1742174919; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tm1aRIWaBwgx/6x0GFSv25uAoJq4igL/u+tjPwXH2Gs=;
        b=mC1ivxJRwGOd7AeWQHE69HHoUAoYV8KbC7qMn4BFtIQ6x83ROPBCNHQbSLrBXpmvBf
         tCDat19TuwUdveV3y+2NZJ4Q10QiUEX8BVKN/lnFk6pK439yT72XbVkxr+eVprCCSqDH
         Ccq8l5GHJ7HImcV/Oa88/sUhQHYYUuPULhTtd+HbJcWwPeEQZw24lHLG+WP4o+mOdMqU
         HqJ99zd04r+6u0ZQ3VkiyBzyRXIRRcQM5N63F6IlyiPoSo3VQ7EyGa28C7B1/UXIWX7H
         ruMpHgekM1T3sUI1RCJuGVVgmraqqRLpdZN8kYxYI+zOYdq3oEiOez2K+Zt/eHx2uiZc
         SIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741570119; x=1742174919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tm1aRIWaBwgx/6x0GFSv25uAoJq4igL/u+tjPwXH2Gs=;
        b=RI3BMmKby+ZnB13lA0qj+fE8k05F0QrrESdwYIbqbmmGOOSkJ09PMUO/CEqV0Grp+/
         SackOfwNBV9iwGJG/Oi1BPSaJ/qBbTgP/Q5q0bPQKBs4uR5ao96NyG8PAeEW6WpqRKN5
         q8uGRElGFwhB6I13etr12p3N+Xp03koonnmn4aVwOw5Gn7+yCPSVJVKfhhRFQi6O5i/E
         FmqFW2Y4Of5k4gQaE6jhcmW6KAI3rOs+4cL2wO2TNwXjKfF6J145IudqyE+fd/047WZp
         SDYlrtAVIVHRvZxBoaa/KTUWACyZBkoZQjYnKRRfBP3iZ6k232sgjeqt2Lxbv5hRVm3B
         u9GA==
X-Forwarded-Encrypted: i=1; AJvYcCVBYabuyb9M5fiiMMnvR7pR06/1pWzlK2OLz0Skw+mA7XcSZ1dJqiW+BNCqy1Bzb+C2qGx9azd7vGOnUg==@linaro.org
X-Gm-Message-State: AOJu0YxfL9VS2Itj5PqfkSkbtlT29u3RX5ogcbOMUOSyt6EquLFcYuYw
	D+Lu/kaw8IC4QKhk+8Uc7vciFz3b3QeYFUspPWoOwVL2KjGGtIf7cDN4CmqmrZCwgv4+FMtKlKE
	s9kq7pA==
X-Gm-Gg: ASbGncutkICDJcQ2SDQkjhonZnrUj/r+SBDIwaNV8ngkkpdGKW27yeKIJXef7oegsdO
	lmY6MtUSAFtH80Z+7PEZ9+AbqWdavq/WtAIhjqASUDOrch2NYmphsZiHibPFO6jCVHZzFayKNRr
	+9zp6jV081FcrjYTI9cHymH7/PGTnkyWcwilqfx1iBXwbmzhXv5rqokSgk1zxg4YeGJfVB2nT8n
	IvifXj9irY/9nivF4g8hIH4CCjU2acfO19xTU6dRegQSbs0W+0aLpSJJ8B5BYpCskSufoJl5fTm
	ron95FHmwzlSoiS4Kn5be8OdyP3SqewZkF3jd5se5JJRJtzxBC2wWvcO7AA5EDzVUOk+GyRebn+
	kKBqHpPB8nehzycRPFIDDzMwpo977BA==
X-Google-Smtp-Source: AGHT+IH20yJX06giVzvivOa3QisLS22r9+2wZ9shvU/XR8v/DxHT+Vns6c2HBLmMYL96VsU4Q9vEtg==
X-Received: by 2002:a05:6000:18a3:b0:391:1388:64b7 with SMTP id ffacd0b85a97d-39132da8f0amr7923213f8f.46.1741570119480;
        Sun, 09 Mar 2025 18:28:39 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cef25f075sm45918365e9.28.2025.03.09.18.28.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 09 Mar 2025 18:28:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 2/7] hw/char/pl011: Introduce pl011_xmit()
Date: Mon, 10 Mar 2025 02:28:20 +0100
Message-ID: <20250310012825.79614-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310012825.79614-1-philmd@linaro.org>
References: <20250310012825.79614-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HBDQIRgpGyQN

Extract pl011_xmit() from pl011_write_txdata().
Use the FIFO to pass the single character to be transmitted.
Update flags appropriately.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c      | 43 ++++++++++++++++++++++++++++++++++++-------
 hw/char/trace-events |  3 +++
 2 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 0e9ad5d5d90..113b29cd9e6 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -226,6 +226,36 @@ static void pl011_loopback_tx(PL011State *s, uint32_t value)
     pl011_fifo_rx_put(s, value);
 }
 
+static void pl011_xmit(PL011State *s)
+{
+    int bytes_consumed;
+    uint8_t buf[PL011_FIFO_DEPTH];
+    uint32_t count;
+    bool emptied_fifo;
+
+    count = fifo8_num_used(&s->xmit_fifo);
+    trace_pl011_fifo_tx_xmit_used(count);
+
+    buf[0] = fifo8_pop(&s->xmit_fifo);
+    bytes_consumed = 1;
+
+    /*
+     * XXX this blocks entire thread. Rewrite to use
+     * qemu_chr_fe_write and background I/O callbacks
+     */
+    qemu_chr_fe_write_all(&s->chr, buf, bytes_consumed);
+    trace_pl011_fifo_tx_xmit_consumed(bytes_consumed);
+    s->int_level |= INT_TX;
+    s->flags &= ~PL011_FLAG_TXFF;
+
+    emptied_fifo = fifo8_is_empty(&s->xmit_fifo);
+    if (emptied_fifo) {
+        s->flags |= PL011_FLAG_TXFE;
+    }
+
+    pl011_update(s);
+}
+
 static void pl011_write_txdata(PL011State *s, uint8_t data)
 {
     if (!(s->cr & CR_UARTEN)) {
@@ -237,14 +267,13 @@ static void pl011_write_txdata(PL011State *s, uint8_t data)
                       "PL011 data written to disabled TX UART\n");
     }
 
-    /*
-     * XXX this blocks entire thread. Rewrite to use
-     * qemu_chr_fe_write and background I/O callbacks
-     */
-    qemu_chr_fe_write_all(&s->chr, &data, 1);
+    trace_pl011_fifo_tx_put(data);
     pl011_loopback_tx(s, data);
-    s->int_level |= INT_TX;
-    pl011_update(s);
+    fifo8_push(&s->xmit_fifo, data);
+    s->flags |= PL011_FLAG_TXFF;
+    s->flags &= ~PL011_FLAG_TXFE;
+
+    pl011_xmit(s);
 }
 
 static uint32_t pl011_read_rxdata(PL011State *s)
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 05a33036c12..1bab98fb5f3 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -65,6 +65,9 @@ pl011_write(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x val
 pl011_can_receive(uint32_t lcr, unsigned rx_fifo_used, size_t rx_fifo_depth, unsigned rx_fifo_available) "LCR 0x%02x, RX FIFO used %u/%zu, can_receive %u chars"
 pl011_fifo_rx_put(uint32_t c, unsigned read_count, size_t rx_fifo_depth) "RX FIFO push char [0x%02x] %d/%zu depth used"
 pl011_fifo_rx_full(void) "RX FIFO now full, RXFF set"
+pl011_fifo_tx_put(uint8_t byte) "TX FIFO push char [0x%02x]"
+pl011_fifo_tx_xmit_used(unsigned sent) "TX FIFO used %u chars"
+pl011_fifo_tx_xmit_consumed(unsigned sent) "TX FIFO consumed %u chars"
 pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t ibrd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %" PRIu32 ", fbrd: %" PRIu32 ")"
 pl011_receive(int size) "recv %d chars"
 
-- 
2.47.1
