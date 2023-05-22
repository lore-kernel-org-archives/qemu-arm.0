Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1286893ejb;
        Mon, 22 May 2023 08:32:32 -0700 (PDT)
X-Received: by 2002:a7b:c843:0:b0:3f5:d313:db5e with SMTP id c3-20020a7bc843000000b003f5d313db5emr7561738wml.15.1684769552677;
        Mon, 22 May 2023 08:32:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684769552; cv=none;
        d=google.com; s=arc-20160816;
        b=QTg+fXbOzm2wPhfTogiY9Jzpd0tK3H+Knjwi+wjbGqv0hHNG/nzczIyFGQoCxV/cRj
         IrAp/7mqT8HbNn6m5DZidYUMPprDK6WKoRWW9S7Xy5DC+++7yUuYVy/33X49P26aRbKd
         cQcojN4lcJQP8ybTltI5HLBpllIfunNHJAzwn4kPD8o27OFL9vFBpQstmyuGOfYnresj
         Sve6BSBZhCoHrrS9N73N9OmW5h76PHvWawSP//tqCm065kd7PBmWzVNx+c5LzWFsi4io
         gietX5uMBFTBxKfv1WWTa/rwNR2T9tap03dI7NPxkBCYDE6q5rH8d7xW76PYA2nt0f4Y
         udpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9q108c2Lliqjn2JXt6hPBTH1oW++ckhJeDwIAiOICrs=;
        b=eail+mc1oMpTdJoxw545pTkE+1NHALeA83QP4YeqSiDCEBrXJ93XyxrsYjvvidYB9a
         P4q6MPEAa2DoT8uVJJSJzFM7iUsRYSXcyLqLSe6RQvQafgW8DDdNQX/hZiUV5enMDhuA
         NUn2MjF8tShahh07T3T8LGNO4pGOQuIlbpeELZapZ2nvfN5IzBrLwNEppO+qzCB1UGpo
         ZWmMgiB/1dGKPZudErrfcFtQEU8et3zWmBpn5sZ+TmjFR2leO50Bv4/yT4Hi9UsHqYyx
         xtxDPk1VMriRWST6RAMygYohiSoOATWWSvgebxRDElbce1SrXrts66f2wpdAi1IIKLA7
         SmNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IMHyvW6b;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bq24-20020a5d5a18000000b0030628040a9bsor1512013wrb.10.2023.05.22.08.32.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 May 2023 08:32:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IMHyvW6b;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684769552; x=1687361552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9q108c2Lliqjn2JXt6hPBTH1oW++ckhJeDwIAiOICrs=;
        b=IMHyvW6b41w7xSQpLSpQKb/8I2BRZydodmSpCk/NRscgvzIhUtZMGKq5KcvWaFEhOk
         Kq70ExoxrZc3in+/b0WTJVRJTql9fCnKjgwxk4UTIBsCmo/ZqBTLH/PGLV9bspkR7JCU
         QucW5H14V+L+xxo2ZQnmqRjlxK7vHItTLcDcyrYvBAtTI3fmQEs+ZFEVvJCGDV7F2SH4
         NcXQLKdGt6NfS5pCmdLaVvxNp82i5dkrT6AtUuyRlBW3pxd++Km/O4C9lG9/bC3sbco+
         K/0d97xu9qcqWdRqZ+z/QdH9D1XUPeSqJAu8WUoEDLCbpYnZD5c2NowZnrPpSDZC1weZ
         xLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684769552; x=1687361552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9q108c2Lliqjn2JXt6hPBTH1oW++ckhJeDwIAiOICrs=;
        b=EtJzf1qniDcjIt8kwYvFKvSQhDIxFEXF54qc1H4+osNUG/OJk/46LW5l2hkm8uK+/c
         mViDCNxlqcV8s3UvE33+x5PB7CbgN8LP2FW+a4pxOT8PXNNiT5BRFubZwxIcgzNbEX5b
         sO0v2RiX0f+zxV3NTpZjKxj6qNh3LZW6DfLCXL1x/d09UXn89zbAESoe2RbJOqAuIYn8
         2BVB4hZcEV+QMmpR5XE3wXJwas6ZB7vH+RlvujO1L4eGsTWMsiTwpwlttwxEmrgn3ylg
         Jquh7+ab5dGoiupCwh9DJgRzMjA5+MW10xkheGnsSQJTooN7mDKbFtwoRpZlf+QKQuWv
         WX1Q==
X-Gm-Message-State: AC+VfDwO9UOcF9lbV6PzfnH/OF08/CbJLL4eStXuzZTL56a4MzH50WzF
	9tFPDBMhs0aAJtz4mpg0qtYOQTaY
X-Google-Smtp-Source: ACHHUZ5daT317HebxC6rzNCrJzzvlRIQAwbUTOm48bB91IEBi8el7d5GDaIyU5ujf/bHkMcUQahh9g==
X-Received: by 2002:adf:dcc7:0:b0:309:32d1:59d8 with SMTP id x7-20020adfdcc7000000b0030932d159d8mr7907619wrm.64.1684769552397;
        Mon, 22 May 2023 08:32:32 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.176.153.164])
        by smtp.gmail.com with ESMTPSA id o14-20020a5d670e000000b003062b2c5255sm7999526wru.40.2023.05.22.08.32.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 May 2023 08:32:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 08/12] hw/char/pl011: Extract pl011_write_tx() from pl011_write()
Date: Mon, 22 May 2023 17:31:40 +0200
Message-Id: <20230522153144.30610-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230522153144.30610-1-philmd@linaro.org>
References: <20230522153144.30610-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Lole4GZw4b/P

When implementing FIFO, this code will become more complex.
Start by factoring it out to a new pl011_write_tx() function.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index f0b305e5d7..c55ef41fbf 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -149,6 +149,17 @@ static inline void pl011_reset_tx_fifo(PL011State *s)
     s->flags |= PL011_FLAG_TXFE;
 }
 
+static void pl011_write_tx(PL011State *s, const uint8_t *buf, int length)
+{
+    /* ??? Check if transmitter is enabled.  */
+
+    /* XXX this blocks entire thread. Rewrite to use
+     * qemu_chr_fe_write and background I/O callbacks */
+    qemu_chr_fe_write_all(&s->chr, buf, 1);
+    s->int_level |= INT_TX;
+    pl011_update(s);
+}
+
 static uint64_t pl011_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
@@ -262,19 +273,12 @@ static void pl011_write(void *opaque, hwaddr offset,
                         uint64_t value, unsigned size)
 {
     PL011State *s = (PL011State *)opaque;
-    unsigned char ch;
 
     trace_pl011_write(offset, value, pl011_regname(offset));
 
     switch (offset >> 2) {
     case 0: /* UARTDR */
-        /* ??? Check if transmitter is enabled.  */
-        ch = value;
-        /* XXX this blocks entire thread. Rewrite to use
-         * qemu_chr_fe_write and background I/O callbacks */
-        qemu_chr_fe_write_all(&s->chr, &ch, 1);
-        s->int_level |= INT_TX;
-        pl011_update(s);
+        pl011_write_tx(s, (uint8_t *) &value, 1);
         break;
     case 1: /* UARTRSR/UARTECR */
         s->rsr = 0;
-- 
2.38.1
