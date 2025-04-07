Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6426383njd;
        Mon, 7 Apr 2025 07:47:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d12:b0:736:34a2:8a20 with SMTP id d2e1a72fcca58-739e4c19f56mr18861353b3a.21.1744037278695;
        Mon, 07 Apr 2025 07:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744037278; cv=none;
        d=google.com; s=arc-20240605;
        b=NEq5rcOr4y5/t7neA0LTXUfyt5dqRHPjxlhVBsqkR04S1ZwiPhAT7UokJHxh9pfDsu
         EQodqtxAUdYZ7HdyqLYYI5wY4MibtoGtEAbCox0kSOkLqAaKOBPVV9E3UFpsxXMy1YoA
         Azm4nE+NIjQG0WkI+sHSNjVU77Cw/0Oa5foPt5EEanbELpNBx4BBfqlS+CcOhwsHxLWS
         LiOH6Y3GMRv1aeJ/63ulM7JVI5V20g5Gx1ufoRKmPGUicE0ifW9KrBqEoeirQd2IMpBW
         3wosbJ7owEiOb5AQKrk3FF6n+vaqvvzbTNhgP7v0bO64FJs0Y9TOPAliHARXID5AVtUl
         1ZAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LeWm4gdwYX7Mpk2+jTOfSOTsV04a2XRASVxxD/NFs3U=;
        fh=WZuGVYKruktk7PrHJjDxZNHAy274/CJzESlrEWcZdOY=;
        b=gbaXCqsmPt9K4KQnNrrbiCR9sYhI/d0RtU97NwR14U07THXwYD+6F1HSkri7h85d5h
         do7L97PKn2qPsIuPkENEDHYFQHSR5nCMIBKDRE3ZQXnd2mF4KRLgw/WHSvttVlTsY6+u
         ZgCt7A0SgB5gmNDI0xf1ImYX2pUNuE/eoKYY/AwfYdKm2aafVXdKOYlry8bp2XB7/e2F
         tQ6kQspzSsNQJjPMs4jbndwwkIk+TvSPakyOVUMZHBT3EEaZmHrE+Jv/jYtMnoZm9IZa
         1qnodnzUhQyj2gT0RMqSj4d5HoudRHh2gT3TvcOPANmyHv2tyNLu+6XXfoJfpLGbrwjl
         5bGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=WrMOAKH2;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-739d97cfcdfsor5078786b3a.1.2025.04.07.07.47.58
        (Google Transport Security);
        Mon, 07 Apr 2025 07:47:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=WrMOAKH2;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744037278; x=1744642078; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeWm4gdwYX7Mpk2+jTOfSOTsV04a2XRASVxxD/NFs3U=;
        b=WrMOAKH2bdlUUwMEV8oRFTgmlnfSEh2KkNj0AgiRaKFXfg8EjPf0mPMCwAAapSVqiW
         50rmBjgVT6RRV4UCXQqpMwZmDEDt13PUzCgEgn3PaANyvKkJi/SiAS2Q/e19I3ih2r/V
         3HER08wwRZIXmneWzYjkf8IYiPm/PZq9Cmfks798zYxRnQnrREtlnFzMU37DBfHBALAj
         BkDroZe62vfB/XjLRRFm5+T9FYwnOClG+9ojO3ZybrODQ2riblxALRjpSFiJ60hoGiAQ
         9995OEfwrOj6HcbfTA+ZZ6/pSSP789VB/Qxkt1KLDGc3eeD+4uj1p1w9jDfPgRw7qCIq
         oF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037278; x=1744642078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeWm4gdwYX7Mpk2+jTOfSOTsV04a2XRASVxxD/NFs3U=;
        b=moiZQgMuR3kxWW6F4azaocZirA8gpEzLP3GfndLxgMF7S4GuQsBOIfonZehLrVh4y6
         w4NP4DM74z0cW+K4BKo6z2YwMkWODwKfy76d1TpUf2/JdRInvGGWA4A48BOfblm9yJBl
         eaC9rJ3dYlJkQnl02HR0QV8KmvWeB8Ud+MuV+IOp4OeekhlQnKnoiSmZoPgqA4krD5lx
         Ika3qo42oI9oQeFLHqCrZj6c+BDx4IKZ2Bu8lFc/Gy1kIONCqzTzCR28auKh85tbJ5it
         verkoN+JUwQFz4DbAS0nJz0ssWd9X/YPhBB8Ej86MzH+oHGJH8q2X5inNepAEz1WyftC
         mfgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOS/KhxPO32A5ALHkWEE6MjGXTlmW2+52JwVD+3bMEePOfo5XIEOlguX0YVpg+4Gwtw41uOb03vY1e04geukkoYyY=@linaro.org, AJvYcCVlD6JZ7dW1iFV/JNJuEetkg6R7PQY7HJmIQmf89AkK1OLx5XusJZsLsjtE8e0cXyURdhHNPiVP@linaro.org, AJvYcCX+dm+ieIBx419cAwCgmBMVsB92A+5I5h5Gj90JcCO68DzT83pN7+kU+FumMQJ0RX9b0CmAp9HH3j6pme5i@linaro.org
X-Gm-Message-State: AOJu0Yx3OLOBcv+WtaAPVggaqI7pT0R9DcqfZVfV5xfi+UXfX0DwJWLj
	PfrwioKu+mvW8e5221MaNccf8ZYMzL+xiyh02qg4YDffysN+7SRY
X-Gm-Gg: ASbGncu4bBCT49Yc7FGRpyqxvVUvxXRl+2/LtGWXzJi3GJyqFqQfTq4HYaewRZdsqjF
	5xLrl2oBK7p15yWbZqiDGy6pojFcVASnSAKGP5FghvlTaxtQSRau8stWJMLzBkBnLSpAexn5nzs
	J3S5XF2TMrLuEiW8AK+yBH7+wGS8SrZmuONXC/G7YzHYvoirCdzyZs0Ll9NPHLJapxzbxgfWymF
	VXRHZVUGyGSq4mW/XPlnVlFDwTz+CKhLEGLoSXqgoQUdxBskeQpDBsn2Q4US2dGTsUEMh5tJOqr
	G+AYOsy8SGvlRPt7YhHCdWUlkI/1uxXLsYVA2a1nNmossfKW8I1N4iAxmANc3+P1g2d2YLti
X-Google-Smtp-Source: AGHT+IFK5Snnwez+9Z1jA55NI18ZTP1BoHatw9I8udhAd9+QfwRAfkorXPb+OzP1TByBPcIzR0wn1A==
X-Received: by 2002:a05:6a21:788f:b0:1f5:619a:8f73 with SMTP id adf61e73a8af0-20104735fdemr18035606637.26.1744037278135;
        Mon, 07 Apr 2025 07:47:58 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:8768:486:6a8e:e855])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ef3c2sm8856960b3a.59.2025.04.07.07.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:47:57 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Greg Kurz <groug@kaod.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 03/10] util/mmap-alloc: Add qemu_ram_mmap implementation for emscripten
Date: Mon,  7 Apr 2025 23:45:54 +0900
Message-Id: <8c2b176bd4c499233a88dcd18e62d8cf94e08f56.1744032780.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744032780.git.ktokunaga.mail@gmail.com>
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tkT5DabFslOl

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 util/mmap-alloc.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index ed14f9c64d..91f33682e8 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -145,6 +145,7 @@ static bool map_noreserve_effective(int fd, uint32_t qemu_map_flags)
     return false;
 }
 
+#ifndef EMSCRIPTEN
 /*
  * Reserve a new memory region of the requested size to be used for mapping
  * from the given fd (if any).
@@ -176,6 +177,7 @@ static void *mmap_reserve(size_t size, int fd)
 
     return mmap(0, size, PROT_NONE, flags, fd, 0);
 }
+#endif
 
 /*
  * Activate memory in a reserved region from the given fd (if any), to make
@@ -244,6 +246,21 @@ static inline size_t mmap_guard_pagesize(int fd)
 #endif
 }
 
+#ifdef EMSCRIPTEN
+void *qemu_ram_mmap(int fd,
+                    size_t size,
+                    size_t align,
+                    uint32_t qemu_map_flags,
+                    off_t map_offset)
+{
+    /*
+     * emscripten doesn't support non-zero first argument for mmap so
+     * mmap a larger region without the hint and return an aligned pointer.
+     */
+    void *ptr = mmap_activate(0, size + align, fd, qemu_map_flags, map_offset);
+    return (void *)QEMU_ALIGN_UP((uintptr_t)ptr, align);
+}
+#else
 void *qemu_ram_mmap(int fd,
                     size_t size,
                     size_t align,
@@ -293,6 +310,7 @@ void *qemu_ram_mmap(int fd,
 
     return ptr;
 }
+#endif /* EMSCRIPTEN */
 
 void qemu_ram_munmap(int fd, void *ptr, size_t size)
 {
-- 
2.25.1
