Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1538638ejc;
        Fri, 13 Oct 2023 07:12:24 -0700 (PDT)
X-Received: by 2002:a17:906:23ea:b0:9ae:7870:1539 with SMTP id j10-20020a17090623ea00b009ae78701539mr22468751ejg.76.1697206344003;
        Fri, 13 Oct 2023 07:12:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697206343; cv=none;
        d=google.com; s=arc-20160816;
        b=DUj00lUgC/tYsnpm8G8IM2VvDn6y2KujxIx41Omea0Xt7/hjM5F8YSdsVj2UyP9jRB
         5UzQqg9c4Y+qkvdJCTaLShVK8EV7FeNS+ty3NqwG4ZOCHIg5YSkoCLkQ5Lx6Q4VarnZq
         XpYHf0JwkH97WDcqQe2vP+pij6cLP3BacNH2nXROUXSFSUQvcrS3lSKi54lN9PJuZmeN
         19IFauOBCxmqxmxIACt/M+dUdRAydlRBtKUcTi06CyXZoO9iPoVMWhEx3xH6WMUZxxy5
         L5WDgzOg4EA/wAViygSe+p1xRoH8CB/40s57Avha42ksgiVbySpUpO32NP0AOe5N4k+/
         GEIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FHrHAGB/EmMRyrEmXuczDQ4ZEQoq+gXqneExLSOiqGU=;
        fh=MusjSs7gXCZ/MKYOlww+3pkKR+FOAC+Wy5x6PlCIutc=;
        b=RQUwlX64gF5jtT8SWPJshHjxjrpuAnpfnpmxAkFMWChAGdhz0Eyc1Dxtv4FM6gl/cb
         Dk56IrsyVYAHQAdVIsW5ifGPCn6JHjsx/nULSx6q0h4pyqAHV8rf3zjIbjoO400zCwF4
         VhM2kzUJYzMAwbhyKYfzojbwsmaB2YYACj9dP5ZbhEJu5FiZGvx+81iJKQOdBr7bLSBf
         KcExHauqlJ3H9/rw0jEF5E6FBxFOdoROHLj/WS7TrkBSXPHsBM7o7XedTjK5D4auZ6kb
         5p2AImTJGKCwcevwFIysK7u8LeE0Z4BO3krV1OijtauCn6wKqaLhqeumkDbtEL2MFm+o
         zQhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xJINjLcE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jz26-20020a17090775fa00b009ae5d7eb4e0sor785956ejc.0.2023.10.13.07.12.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2023 07:12:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xJINjLcE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697206343; x=1697811143; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHrHAGB/EmMRyrEmXuczDQ4ZEQoq+gXqneExLSOiqGU=;
        b=xJINjLcEamoV0/xrqXs4FG1v7UDRS+K8tMU3bK2bmzQKwFbpdQjp6bBnsGlkbyJF4f
         ybgIlQc8MJrIL2CrteBYdoNBeaFOddZida9sK+FlP+AedJypnusTgJVl5FJ8W+9p0a8A
         HRFqOYvDQdWAxAix17zHyxn4PVDFDMLbbYvIqmMDppRpzio/yE8mjRkzb/oK6TRA5LxR
         dIyegtJTMgk68I6pVmZiENoBJOSTUVsUenm4GerDsOQsFwTRnDP6LiZQi6l1hLs9EY6P
         VVcuHKYGAGDUSk0LL6gLUupELV4ay2ugnf7W74zX0i8Kp6CKhXLGEmCqEl/XRaTJgYLs
         w/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697206343; x=1697811143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHrHAGB/EmMRyrEmXuczDQ4ZEQoq+gXqneExLSOiqGU=;
        b=S2sDRJZGLyU/M7ss6LwwdnQJOKHaO7IAVTTZVVY4uzQhW1LZTkw4Y0r88oXMUlY1nO
         wkOAsqEN80icrqEgIlycfAd2saXv7U2sEISsn3WVfQBnfmZJDznFbXV7qNnlxAuqA9lX
         4axAsFarT/tKtPEW5ZTJfiua/tmZV2kTv0vYqgs1ytr7m5KACOve3zhqRUb9rvyivLVz
         cGJ9DAcQ/l0RhyU/ULG3KtTsgYHRa8kJVE0tjnxm4JpL/E/WWtBWdUJpC5Wquy+aKtBs
         ytngLcEYB7XexyyDwsv/fAkO9wUBGtmoRdqQqufbLZI9WealVdjewhMBX5S7YmRhMBeN
         KtdQ==
X-Gm-Message-State: AOJu0Yx/UPvgbqULSaTMx7KcLK79qwgzo5S5vQqAE7PMfBINJTU70X8F
	irXIsHH0M3ykr2Qb/lDY+W+s/3o6
X-Google-Smtp-Source: AGHT+IFM9RE0iz19vG5MmBZR94zz3/RNlveixfAroNdffsR3/AGtIZBICp0SmQHTvMBAFjYjCZX/Mw==
X-Received: by 2002:a50:ef0d:0:b0:522:2782:537 with SMTP id m13-20020a50ef0d000000b0052227820537mr23076679eds.15.1697206343741;
        Fri, 13 Oct 2023 07:12:23 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.172.118.168])
        by smtp.gmail.com with ESMTPSA id r19-20020a056402035300b00522828d438csm11613766edw.7.2023.10.13.07.12.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Oct 2023 07:12:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Gavin Shan <gshan@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 7/10] hw/char/pl011: Check if receiver is enabled
Date: Fri, 13 Oct 2023 16:11:28 +0200
Message-ID: <20231013141131.1531-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013141131.1531-1-philmd@linaro.org>
References: <20231013141131.1531-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BogbjBzo3u3l

Do not receive characters when UART or receiver are disabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
TODO: Understand Richard comment from v2:

  this doesn't fall under "my first assembly program" because
  it isn't part of "Hello, World"?
---
 hw/char/pl011.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 9c43cb47bf..ca931be139 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -77,6 +77,7 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
 #define LCR_BRK     (1 << 0)
 
 /* Control Register, UARTCR */
+#define CR_RXE      (1 << 9)
 #define CR_TXE      (1 << 8)
 #define CR_UARTEN   (1 << 0)
 
@@ -359,9 +360,11 @@ static void pl011_write(void *opaque, hwaddr offset,
 static int pl011_can_receive(void *opaque)
 {
     PL011State *s = (PL011State *)opaque;
-    int r;
+    int r = 0;
 
-    r = s->read_count < pl011_get_fifo_depth(s);
+    if ((s->cr & CR_UARTEN) && (s->cr & CR_RXE)) {
+        r = s->read_count < pl011_get_fifo_depth(s);
+    }
     trace_pl011_can_receive(s->lcr, s->read_count, r);
     return r;
 }
-- 
2.41.0
