Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2006151njc;
        Mon, 22 Jul 2024 09:08:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgD5HsgxhXmU6fkeyrhA6O4pODFMVJ2pkLR/W/H81hVASnRtrx0k9LIbWjJXSuYM9eGv60Dk1M17jO6Txd32A9PLVMEgXc
X-Received: by 2002:a05:600c:34d6:b0:426:6688:2421 with SMTP id 5b1f17b1804b1-427dc52303emr40056435e9.11.1721664486426;
        Mon, 22 Jul 2024 09:08:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721664486; cv=none;
        d=google.com; s=arc-20160816;
        b=iKLl9nllEIXoiw1i4SYhqLIe99xwgptwttzKZj+ZLSh6R4idPmGlNsoSlcXnz7Jn8/
         5Xw6BsMGQAq7t7aoWjQBTw7g6c19to1DPRZMxJq86dHKDaY0UUdC+icULPXzLQRufT5B
         Dl97CTWeaw5U+4zBgAC2aUexRiPqeLpu6m6lpn4w/9kGIIYl+6B49Pf4KUmeKhsqs5xp
         d9+si2H5Or08br5YM9k59yQMAJ5tU5NU/1+Ovg1w4P3Oi/FJUD83j2Un3Jv8vuytTD51
         Ms3bNh3Zoqmjj6UOhpnSwFwBedcBMHBjUFF2Fn5nVeghYRN2Pl8Sa85pMurA0fc9frQB
         t8xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dS9AnThSzSBrSy+tonVpTP7pqJETnOM97XqDCYC+F+8=;
        fh=9ksKhW2xHTnc0yXmmYlIvPpH+1AAaLEAqTjl64kk7qg=;
        b=nFkjK+X+VtGC70DsU29Nib9HlOD5IijSieQBUKxRPD3BsVw3FRDu4jHlrCCPGW6lhs
         nR8fK61te+BJLdg27MDdw9KZU79D1DIoQz0w0RtG4hBo6r3Yi0pguaPUIjk1W/jAgDxD
         V8ru2PX80Tt/JNgALpBqPLune0QBRMxkefZteHGw1B93TITppKB06HwOhgS0QTPhStrW
         7lnfCtHr2op6X9gkAnmEL0HCNu+S/E0qwYQPsekLJUSZvDVE7uxoAvWWevKK/qlfN4i5
         64ya4mFCQAZi4rFCOkMeFRVZm0VGI96mgY8kkuZZAWEGYmaBl7+qwGuTRnb2gsxx3+S0
         aKOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ilhokOPT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427d6d7b65asor20784435e9.0.2024.07.22.09.08.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jul 2024 09:08:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ilhokOPT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721664486; x=1722269286; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dS9AnThSzSBrSy+tonVpTP7pqJETnOM97XqDCYC+F+8=;
        b=ilhokOPTNAD/amdLtUSReNEL7v8IwaJkFRytggjYymhBSv2MGjL7q8H1dv7t3HTI4w
         GEXOSiExwVGedzXmieLhuy2YxLagIneDs/PQkEurdL9wBDJD73BspWfgZTpgI8gZIMEj
         KTrrjt2kQeemLA0T1sEN3zo5EDBAIbQ8FXHz840p6RfewRoKpgGszWwWV9NefB9RgHQP
         NECxkhBNpYAk8bmIIHcAfG6Jz6PAFIrMBYS+iH67XOON1h5yLEAbFi7yHtQ4N4xuQDiV
         evwLp2cctpHkwWYAQoKj6AQYNlfrxuUQCLdV/meKVNdBO0XzPOeaqki2vt1LNMrgTHyJ
         er9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721664486; x=1722269286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dS9AnThSzSBrSy+tonVpTP7pqJETnOM97XqDCYC+F+8=;
        b=rBEAwuQtMB60gqHYq3WMeyfxNbMNKKIzpNOiNA2gYO3S4lqh59nZrYQbRqGbybp//H
         G0UwCPSrZGH79+meWpikl0Q3LjG1DikwAFloehy+sOGbU3BdnXfP0D0uTXXvxLMKzRDm
         3Y3gnKPeNiCjA1r1BCnieo06UL7KRZAP6brEAz/gM5HHACoNaMbVdb5tNmY9+sYIdUh3
         X2lI6S3mYU5ORDSpoPTOZRCcuIWZ1sU84hhekQSYJoy5dlREC6nyiph6aiD2QKw3UW8S
         nSKb2oijmbH6Q9t855ta/jYF1Pr1uONDY2poeFwvtqRpqGy18w8zdU7x33qxfsBZ+sZX
         SM8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUzMMCQj5T7PQSiIFDWoEpyQxsr01esZNJDlIYt7wGVIqFZ6H+l6uKy3T8pYQrDiJBTHT+4FEwYrUW/JXKm4pKq7rCXj37
X-Gm-Message-State: AOJu0YxjdIke8YG15JvW8yONWfj6iQr4w/j7chuVZCvsn56duYARuEgw
	bGoS/JeH11SHFezr4cgAogMusbBadrpCXY6iKEnGgFpPbCUSRnBSdYx1nhBBElMKZA==
X-Google-Smtp-Source: AGHT+IF//xZooh6F8wrQlhQGx3PPEaFSRd5iEOX4H6OK6eNunLO3B/Y4GiT1cQNAmy+3XU07ENp6ww==
X-Received: by 2002:a05:600c:45d3:b0:425:649b:60e8 with SMTP id 5b1f17b1804b1-427df7b6d07mr45973825e9.18.1721664485987;
        Mon, 22 Jul 2024 09:08:05 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (gen92-h02-176-184-20-254.dsl.sta.abo.bbox.fr. [176.184.20.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a8e2a1sm159685935e9.31.2024.07.22.09.08.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jul 2024 09:08:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/7] util/fifo8: Use fifo8_reset() in fifo8_create()
Date: Mon, 22 Jul 2024 18:07:41 +0200
Message-ID: <20240722160745.67904-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240722160745.67904-1-philmd@linaro.org>
References: <20240722160745.67904-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GCZtl081ERYD

Avoid open-coding fifo8_reset() in fifo8_create().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 util/fifo8.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/util/fifo8.c b/util/fifo8.c
index 4e01b532d9..2925fe5611 100644
--- a/util/fifo8.c
+++ b/util/fifo8.c
@@ -16,12 +16,17 @@
 #include "migration/vmstate.h"
 #include "qemu/fifo8.h"
 
+void fifo8_reset(Fifo8 *fifo)
+{
+    fifo->num = 0;
+    fifo->head = 0;
+}
+
 void fifo8_create(Fifo8 *fifo, uint32_t capacity)
 {
     fifo->data = g_new(uint8_t, capacity);
     fifo->capacity = capacity;
-    fifo->head = 0;
-    fifo->num = 0;
+    fifo8_reset(fifo);
 }
 
 void fifo8_destroy(Fifo8 *fifo)
@@ -97,12 +102,6 @@ const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *numptr)
     return fifo8_peekpop_buf(fifo, max, numptr, true);
 }
 
-void fifo8_reset(Fifo8 *fifo)
-{
-    fifo->num = 0;
-    fifo->head = 0;
-}
-
 bool fifo8_is_empty(Fifo8 *fifo)
 {
     return (fifo->num == 0);
-- 
2.41.0
