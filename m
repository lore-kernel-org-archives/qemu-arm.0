Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1286697ejb;
        Mon, 22 May 2023 08:32:16 -0700 (PDT)
X-Received: by 2002:a05:600c:3c93:b0:3f6:829:71f0 with SMTP id bg19-20020a05600c3c9300b003f6082971f0mr917876wmb.14.1684769535938;
        Mon, 22 May 2023 08:32:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684769535; cv=none;
        d=google.com; s=arc-20160816;
        b=ZvyWg0/25ETD1m0TwssptJAkKfeynCTWFJzYpTos/3Bhr2uncIppXrMtOBai7GDkxn
         IyQk30391hRAOWWizbX36+L3vzOxpv3DZyeMsiE4quKiZeK2uB1SuaZWLllr25HzYvNF
         cYZiPJ85q2v16IiORfUt4TDR1rbbOhrZ8oi+PKjRDDOgc+3hd452UfqgPYMMCcmkVJtU
         N4V7fpAifXOJGNIfD+RjGvitzJKvIyqj+uW/c5NN+8Gtrbb+xvttLQboKJ3CycKFppMY
         dgJIxJvP6O3cMpYRPS3pKD5hD61aXxJ674itjbvCTKpQz3pKlsWp4kK2jgZddAgB8MBk
         6VDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tnpVE0KcY4+JRcfuSFzjf1/8d9/S4c9dHftftoYjEBk=;
        b=X4jsM/UrcwbIDVVxICOKMo81JHS1wA02DMeZhghEjYgsikJIylfqWl4M4APULPRVso
         alx+VLMvSUXJ/uuqFEphfe1gDUH5eKCtDwrWqWELH9rVS4+Eta3dz8NOvk1simhH7mCn
         E0A9Zfg6TTNIfgHd9AT6Za9NnoTurfbwxEVZzTD4g0XzlaBuEnVT1sberYVDhK0Tdj/L
         SJoRIVocGakpT8y0iD+uY3EvVDR/60mKQqFwQ9U+sSPclpRRIqMGiVkGm7K3pW1dPFtv
         rgq1Pg+K/+2PhhP59dFVDgndBJk9JTLce88o8xs+zb9eyXuBvA4VdL/YeIyoHN4JO0cw
         Nuww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wrPfWhfA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p3-20020a7bcc83000000b003f6050e0516sor806069wma.4.2023.05.22.08.32.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 May 2023 08:32:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wrPfWhfA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684769535; x=1687361535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnpVE0KcY4+JRcfuSFzjf1/8d9/S4c9dHftftoYjEBk=;
        b=wrPfWhfARqAZEI26T8s2j5R4+TGHe7B/jSYVvOJNK4gsHgEG6HV9e2eXDLZsT71Jm3
         ODoxO7HsYFmg+bgZbiPQGBuxMnmsKfOp6fax0jrPepxdlA3f4rVuRrg6ouctiQ2XmZcm
         yLNScv4q91N8KvsU4f8RDA3pS9XYR7JCI4JDMv91dyLmtDkOyD54QigtvAJrz3LdgcIe
         ufPkfT9D2YnIu6/f1TKGetyJ+zImBnwN/heNu6+2RHZXPrWHpLbhBKa5IM9kcWwowD2s
         AN1CzLtixljLrASPCMmelwfMLD9kgWTVcGmaKtR8+ADS7sFGZaE60Gf7YyAujI3qBL5s
         Cyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684769535; x=1687361535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnpVE0KcY4+JRcfuSFzjf1/8d9/S4c9dHftftoYjEBk=;
        b=ZK7nIDVMFOaI3y2vP4RG0ZN3Ly52e6o6Q0Xz6nZbpum+A3J7hkjz0Fnr8PLbirnuEl
         LNBL07l8uTYS7qJ2kTjMAufxVQIZJqFbnGCAbMjczZvK/OV64No+/4eECTEUbhYbuN3E
         0j+YjPcxByfRSjTUzw+joyb5gSj1exwIbgDwN2W7PNv7xuvSWce3uOGfzVaMyVJsPlaI
         IC2+J/0m6nlDOh+wuMrnLAtQVFY6p0g9AxR3cbbN7E1ATEexc3q5KO1gQS1P2DJnIZ4v
         MuOCDLibb34qSEw20Jf4UJXA/c6B/xHuaWH4Q0Irrm9aydmL5tXXdL34XVT9Em9xIO7N
         5PaA==
X-Gm-Message-State: AC+VfDwOHp64lGvlWWGCuNxIlYYl92hZBbCn6g3F+PF/J2sAvbpKsO8r
	bj/VYtvssRfo6P6ombK0iBVwOyrO
X-Google-Smtp-Source: ACHHUZ5nWLq1Q6uL75RxBlw3CYXHjQj51PfGGGaNKb+Y7t3d/zBETgyzGb17ORcbG6GAY8LoTeALFQ==
X-Received: by 2002:a05:600c:3146:b0:3f4:ed2a:4347 with SMTP id h6-20020a05600c314600b003f4ed2a4347mr7854105wmo.16.1684769535492;
        Mon, 22 May 2023 08:32:15 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.176.153.164])
        by smtp.gmail.com with ESMTPSA id h19-20020a05600c28d300b003f427cba193sm11884546wmd.41.2023.05.22.08.32.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 May 2023 08:32:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/12] hw/char/pl011: Remove duplicated PL011_INT_[RT]X definitions
Date: Mon, 22 May 2023 17:31:37 +0200
Message-Id: <20230522153144.30610-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230522153144.30610-1-philmd@linaro.org>
References: <20230522153144.30610-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: suAK6B1q/5D9

PL011_INT_TX duplicates INT_TX, and PL011_INT_RX INT_RX.
Follow other register fields definitions from this file,
keep the shorter form.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 274e48003f..93e19b2c40 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -48,9 +48,6 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
     return dev;
 }
 
-#define PL011_INT_TX 0x20
-#define PL011_INT_RX 0x10
-
 /* Flag Register, UARTFR */
 #define PL011_FLAG_TXFE 0x80
 #define PL011_FLAG_RXFF 0x40
@@ -157,7 +154,7 @@ static uint64_t pl011_read(void *opaque, hwaddr offset,
             s->flags |= PL011_FLAG_RXFE;
         }
         if (s->read_count == s->read_trigger - 1)
-            s->int_level &= ~ PL011_INT_RX;
+            s->int_level &= ~ INT_RX;
         trace_pl011_read_fifo(s->read_count);
         s->rsr = c >> 8;
         pl011_update(s);
@@ -262,7 +259,7 @@ static void pl011_write(void *opaque, hwaddr offset,
         /* XXX this blocks entire thread. Rewrite to use
          * qemu_chr_fe_write and background I/O callbacks */
         qemu_chr_fe_write_all(&s->chr, &ch, 1);
-        s->int_level |= PL011_INT_TX;
+        s->int_level |= INT_TX;
         pl011_update(s);
         break;
     case 1: /* UARTRSR/UARTECR */
@@ -350,7 +347,7 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
         s->flags |= PL011_FLAG_RXFF;
     }
     if (s->read_count == s->read_trigger) {
-        s->int_level |= PL011_INT_RX;
+        s->int_level |= INT_RX;
         pl011_update(s);
     }
 }
-- 
2.38.1
