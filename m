Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1888226njb;
        Thu, 20 Feb 2025 01:30:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXqREwe4xapUYxihvkuyoVwRAdSxmgeJTDx/ejcwWUDkwExwbxSzyaC170tVbEMbcms+OnuMkr+wJbswg==@linaro.org
X-Received: by 2002:a05:6a00:cc5:b0:732:2269:a15c with SMTP id d2e1a72fcca58-7329df7d43emr10668194b3a.20.1740043849997;
        Thu, 20 Feb 2025 01:30:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740043849; cv=none;
        d=google.com; s=arc-20240605;
        b=lKGIBkGy6XBgz2qPCNdr+cmK2PZWF/T5+BTOPjTl5XbPI0IgShEi31yBxn98im+GC3
         ZoOONT3fizr4qw9KplCJmMuakL3pWv0bvtjUpY/U7wYLEQADyMuKPjsAQHu8MqJqF1+I
         zQ/fH0YmoYH77JoRgBw9X9RBliP03K7tT3pxWulJkjii54+VipBvedl2FTDJzlig/kLm
         jokj2OpdXx+1qZ52OiBw1C0AWOAeUpD44M12IGX8KYNzDoCceK13cyl/pZFOUm9Q8dkw
         oypIpD/nBQ65mkl580ukcVByvpB220xtqTNlTT1i5J0qvlmT88JtB2TGZqYa2Lb7dIHv
         xLWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=H2/xpK9DtdqY8a6ieh8rBtI4fW+GPrI9nBJmXLMfGvA=;
        fh=ihEUeAl5lEzfQrZ/cTGWojAXP4HCNRwp0UrzU2RxNj0=;
        b=d4CYEi6jgB+vN/lmofgMBbAxIkNRNA8pjUUg7Z5wuxRDvC3zgLU+gq69mYV+zxh9Oi
         2G6Gpj3Mfi+Wy6/eDrRw9jKBl9u6pKMF30/cKnRp77ozJuVOBwoEe7V/zgCI3BhpxVU7
         CDMcHxMoNh+l7ynxxxf9nSGeyl/K1BF9r/MIMRzK7n57vcMPVdL7mNL3f2wkZyMTc5G6
         KyaP/FChi4E4b7h+tcMBynucft+50jTGvPXEJvRAQLp9t5C+Mq/sIi1SxBqaKWYXJSNf
         z7XvjwhYSbAIZkvzvrT4PAXP4CWtwXSuxF4gBKp0BS8dB4ziF8obqVgUFWCFCTs56Pge
         vveA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pnnvWv+5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73242457350sor9837099b3a.0.2025.02.20.01.30.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Feb 2025 01:30:49 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pnnvWv+5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740043849; x=1740648649; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2/xpK9DtdqY8a6ieh8rBtI4fW+GPrI9nBJmXLMfGvA=;
        b=pnnvWv+5fLw7qiZOURe6e5KgoOUL4ld2ykWVo22qKfXU1IKkhwzMZP41IXBqlhEMsx
         YVHA9xZGo3aTip9nMyuiOEux9fb2tUag2FtKi6/hFnCATdC+wLt+WrMV6+lUIN5P7UkX
         Z5jhz12j4KR71lgnOs6vS04b1cxZIiQBuwAWiSRFsqJIOtp2JUnJaRCMO6jnO84FR4bs
         r2cN4Zhdl6j+xlOJqu8JVkQvZmMvChj5j6u182vm8OhsUMVO9GA7va0oWVCnhkfT45DZ
         W/MCQs4nPSECCt3rj/OGrfmZ0TlfYJlUsbXGmPAC6XzXemRTSDrwf4sDFHNuqDtt4Xpy
         A4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043849; x=1740648649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2/xpK9DtdqY8a6ieh8rBtI4fW+GPrI9nBJmXLMfGvA=;
        b=XlphxFm9wwHoqTxhPcwUHu8UJepvV1pFNsN0UQ9g2EAjf3JjtP4esQnvWiS9m5dLod
         rvVDSgi1nKjNXRObRAMMiyxnQ6j/zSFzAmufH5QwdVWWGUTfJdhpMoDqPl3xdaqJV6Gf
         bKqSZT2OCGoT+t5Rt3AWfYFN22QInT3P1RjMQmrEMvWNMddoytZuR4peQVFT61Ht+HAa
         K0STJScJZfA/Wn9oVpKilaUkZwLmlrvn+iMR/kKSL3jwjM1rPwyKO7SaYyg/K028Vuqn
         5QIdN3ckod/h5I4W/OgXoSOje07k5w7czGeurkW9aU271Kp1a/FIRi1BnUDdC0w6Jt7m
         m7cg==
X-Forwarded-Encrypted: i=1; AJvYcCX4EyETJ/GJg7I8l17gY5OAR7vSaUVif+aJdb4JKK/e/0AogEDnHsp5dbDXfQarOZfJzJA+ZNx4U35Ifw==@linaro.org
X-Gm-Message-State: AOJu0YxNn8DHF87MG9wcZwXe/pqvCZ1adFe+iIJis9RyC3CqyD2+H/Uh
	t6Xk9NaA4TC3iL/C/2q38FM6wcbKQcXzWgkhCQRFcZQS/AqlmKMcUomXhO6cRLGSHQ==
X-Gm-Gg: ASbGncu6gQM596ODV7AUYJLn09AkuJo2mEmm3ZdQClCSCNdCmh1qe2d20UbN2RL6dU3
	OnivjskoiTDpUKJgaoNzgDne7GxCkR0F66ghTy1cVJ7GL23lnhzJn98xBR2sS+Y/kh5CxEivjxU
	dqkUNVMLxBN+0zf/VlLchzIPrZR3HuJJh96l9LfyfA4pJfln696Oy4QVqNwnCe6meARvGEApsi+
	OlnVUsgCarvCwXEAxjYTWCAQFuJzEwZObE8S9c1nRnk4afgmyRdGrM3NB0k6jC34ZcyZ0m5lGi+
	cE0LQSP4GL5CyNx+8KVWSxJwiABOlZFMF9f7a2pl4xbKvcUq8HlG+82pEf+zHWKLDw==
X-Google-Smtp-Source: AGHT+IHIx4leUuspMjpWzO+3Wj2A3mhErhuiD2Bz9XyO1/h5M4RnaibopAF5vU8f3ZAYNAwt67HZkg==
X-Received: by 2002:aa7:8889:0:b0:730:979d:e80e with SMTP id d2e1a72fcca58-7329de640dbmr11337339b3a.7.1740043849365;
        Thu, 20 Feb 2025 01:30:49 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732700c1c31sm8603468b3a.1.2025.02.20.01.30.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 20 Feb 2025 01:30:48 -0800 (PST)
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
Subject: [PATCH v2 6/9] hw/char/imx_serial: Really use RX FIFO depth
Date: Thu, 20 Feb 2025 10:28:59 +0100
Message-ID: <20250220092903.3726-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250220092903.3726-1-philmd@linaro.org>
References: <20250220092903.3726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: p9Tv/n0nv1qW

While we model a 32-elements RX FIFO since the IMX serial
model was introduced in commit 988f2442971 ("hw/char/imx_serial:
Implement receive FIFO and ageing timer") we only read 1 char
at a time!

Have the IOCanReadHandler handler return how many elements are
available, and use that in the IOReadHandler handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Luc Michel <luc.michel@amd.com>
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
