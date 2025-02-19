Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1628046njb;
        Wed, 19 Feb 2025 13:09:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWE4ZFC9o4cKNw+Gpyoia3HvyktyJJBW3qfTWev28aJi10xFX8l3Wg2xBobR4qnku9OtQEnTl8aRjL5Rg==@linaro.org
X-Received: by 2002:a05:6000:1569:b0:38f:465d:fdf5 with SMTP id ffacd0b85a97d-38f587959f7mr3983184f8f.26.1739999357708;
        Wed, 19 Feb 2025 13:09:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739999357; cv=none;
        d=google.com; s=arc-20240605;
        b=MZvRwjIqeS2VIcQmxwvNCsE7WqG/MvfstDpfxUZdq9u0dOv3HXpFx3pM0qpHYqWPq9
         wx6aEV9N9RKmyBeXg16NwG5FI1ci3c7NL633pWfiYIwwHJ1LxvtRQ6orf+BYqgBE/kBh
         A9ZQ6eq37ZGy087iTXupefe00KFcBnTgTLPhIe+KM/u2BeZecvYhf2irwBqRJ7n2ive9
         Mr8Eq1F7XXpkjJjtdu5CVfGp3ctQ6oDNYoAHCmNwhmlxec62duONdztIcCQhmgZBG6dp
         PSm9tCwkRGoibEzXslrH/cwljyk+zlbvshRP5oqDH3tXTGdVHDHM/VkQQ0lmDGKCue+q
         TSnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3COjV92AMlpj3jvv9iQTT0YQlZwWPXgOl76J5cO1OMU=;
        fh=KP7gUqJxrT3I0BhE6P9QMvW7YKu1lRfeDB4aI5HsSLU=;
        b=H0hXhYfz1gsP23wu1YHQEiHLRrOHWUgwYv/xZ9+SdaNG2qmxC2uI/vcXBT5I+98bkh
         rPFHG+/LmZRXdAKaRxarQBc2u621b4iEreMO3rjjrRk59jovT2px0+s0uPhgC84aYzTa
         oDOr/XJuxMd0xuG8WU8+PB0V8XQHxgO7ichIXG3GqA+miBNfRMQTekoBt6jLOOMmwy64
         MxpSKs7XOH0mQJBM4Tqua6nZYahWAfzI4D0oPLoXqlofRCjY9hN+x87IBbJBN0mQsBiN
         DiekKXcpYe/72lMdZ0mszwLKvLQUekhk70WZ9WzCxKay7OA9ipRSkAqSj3ZSFOcaSDVc
         FgpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BXdPTte7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-439815ae0a6sor33355455e9.1.2025.02.19.13.09.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Feb 2025 13:09:17 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BXdPTte7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739999357; x=1740604157; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3COjV92AMlpj3jvv9iQTT0YQlZwWPXgOl76J5cO1OMU=;
        b=BXdPTte7CH0XvsSE3H0WquqNAFHvDJZqEjf7IO6Bznp1TsOUdAzSgwxyTtFMcUqtwp
         WNOLEU0CqsB4NPxfXm1fe66Bodw58PZIRIX1Cgf0UMqMsm6gHnZNc4TPxi2GnJker5qS
         ugih0ABx3Ak+h1bJYxnFSbWUSa/92i3XN1t+U2UFzqBqKX5kNaipjrTOWwIZbK/e/Pvt
         WiErA6W6ITvCGxeUbIXopydU6BMW4jiBmrocLONOPNubrVzHOucS/E2p5R8ScNqtakdS
         SyxPD/I+0s984TK+tNftH/aPIgvKw5yohXM1eEDQ9L5U1/RlUK1qNPijFcY5gKik4Hja
         cGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999357; x=1740604157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3COjV92AMlpj3jvv9iQTT0YQlZwWPXgOl76J5cO1OMU=;
        b=t/H/3N/pDJ179uO5lZzU8VIe68j36r1IYX4O/lBQa1ciqyb1+ol0ITe/ZY6pKmukxS
         7elIKahLkEaEvCPnNODz8eFT0IJFCuxrz2tfMQs6Mewd/nBLjQIaWibHyhhUIhOblcpr
         Yd2u6WEKAe/EXj2rhNsQ2WFEcdqbQt7vme5gEb6d3whEvKZh7cYcioIs47d29Fway4Bp
         0X6gMpjWp3IZAXhynLi7vDmShlU0rtRmZG8PLUFoBDFpFhLvPsw2sCPjN1bPWVp3lc1M
         9PRXgxv9XPmsNOllnWUTfw/kOJfxEgjv/Bfj1boZSOpP2bUrT2XtDKGdoRxv9zhHoaxN
         HQew==
X-Forwarded-Encrypted: i=1; AJvYcCWC0vFWiaNRebY538skF/JIQ5KDn7KFRt7NvBy5qy4m7kUd1W6AB+ALbacV+e4+jkiPnTl6vAgVLwdDVg==@linaro.org
X-Gm-Message-State: AOJu0YzUjdSLfQoDt8k1pP43eni85qJ6ND1WoZmOZxiaSLDNnqFDQWLA
	2XYEGi1RjftZzN/zXMdr+Kmpm/N05fuHKMM5mEHshpDXXnUfncWcMiz8vB70oezWUw==
X-Gm-Gg: ASbGncvTkSCL+MVysAiN/HKCj8gV+21LKBwzmI05A+bvsCs0WTZBTVpug3Q4cj/5gBm
	PaOq1JwU4IOATFqwzAJSPP8+l5xeZwEtOjed1Q0ts989/yNrSW8uV1PQayZMOSgqTO7MBEb8Set
	hqYe/xLyDyZNXBjjynQkoLngmW4XshoDfZhp2mOJjFeoXJFjKB+TcGcqjAIz0G7zseILa99efG1
	kPNRof+fwHcCiU7FqOfjUehiZmcodGSLG9jxMllh9w/IpxvcmYE/Mbe0nTaSi2YEQsrxvrmgU/z
	U/weS6OeUxGbj3zK5uTSY66SUsSDTrYqGeIEyzRo1uUvEygBuN//i5mRPvWre2nbQA==
X-Google-Smtp-Source: AGHT+IHU4eUr3Yoqi1s4C3qI/7nZusOV3MFaTyZkQ5og19oJJ4B22TP2W9HKt5um3KFZ4b6STAOwHA==
X-Received: by 2002:a05:600c:1c1a:b0:439:9274:81dd with SMTP id 5b1f17b1804b1-43999d72b69mr42422485e9.1.1739999357169;
        Wed, 19 Feb 2025 13:09:17 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399600257asm55374655e9.4.2025.02.19.13.09.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Feb 2025 13:09:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	Rayhan Faizel <rayhan.faizel@gmail.com>,
	Luc Michel <luc.michel@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <huth@tuxfamily.org>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH 6/9] hw/char/imx_serial: Really use RX FIFO depth
Date: Wed, 19 Feb 2025 22:08:38 +0100
Message-ID: <20250219210841.94797-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250219210841.94797-1-philmd@linaro.org>
References: <20250219210841.94797-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GymTw8CML0PG

While we model a 32-elements RX FIFO since the PL011 model was
introduced in commit 988f2442971 ("hw/char/imx_serial: Implement
receive FIFO and ageing timer") we only read 1 char at a time!

Have the IOCanReadHandler handler return how many elements are
available, and use that in the IOReadHandler handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/imx_serial.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index 38b4865157e..6f14f8403a9 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -386,7 +386,8 @@ static void imx_serial_write(void *opaque, hwaddr offset,
 static int imx_can_receive(void *opaque)
 {
     IMXSerialState *s = (IMXSerialState *)opaque;
-    return s->ucr2 & UCR2_RXEN && fifo32_num_used(&s->rx_fifo) < FIFO_SIZE;
+
+    return s->ucr2 & UCR2_RXEN ? fifo32_num_free(&s->rx_fifo) : 0;
 }
 
 static void imx_put_data(void *opaque, uint32_t value)
@@ -417,7 +418,10 @@ static void imx_receive(void *opaque, const uint8_t *buf, int size)
     IMXSerialState *s = (IMXSerialState *)opaque;
 
     s->usr2 |= USR2_WAKE;
-    imx_put_data(opaque, *buf);
+
+    for (int i = 0; i < size; i++) {
+        imx_put_data(opaque, buf[i]);
+    }
 }
 
 static void imx_event(void *opaque, QEMUChrEvent event)
-- 
2.47.1
