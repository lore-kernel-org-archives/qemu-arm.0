Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1351639eje;
        Mon, 10 Jul 2023 10:52:03 -0700 (PDT)
X-Received: by 2002:adf:e4ca:0:b0:313:f462:769 with SMTP id v10-20020adfe4ca000000b00313f4620769mr12600321wrm.19.1689011523581;
        Mon, 10 Jul 2023 10:52:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689011523; cv=none;
        d=google.com; s=arc-20160816;
        b=Ok1YrNe486qA23cBZd1lU8wKfGTBFyASEcjLVQ3GzV3qMGmyAaj5g3kT+M74G5ZiqM
         fob6S7wEtmYq7itfHmpRelMHmiDRMQ+jwfgUODqjTRsNyFR+f7AP5CF2v0wbFcwX16KW
         5kdRna9agGWuFVWDFfBuFEjq/8S2g+dhU50bE2XMwduOD4fuZRIFaQs4aYuMTIpPFW+A
         7WnI4PTqT5yZY6R2NG7SJ+nndbpYj5t61ooVsX543POSBxzMyYGzHbo61DJbjUSU/8SZ
         OLgCaT8SHWTSvQI1WKUflEkPUQkZH2hqCvSCFSJXgJtdmRHNVzRMg0EXHrL/0HOjtlcP
         A0Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NZ8DNr0ETWD1Ms+NV1FciyuZYg6CvPu0oUthK2WDbYk=;
        fh=4TWVGTMFk+XB48cTX7H3L2FEUZf3X6lSQ5h15kr1III=;
        b=o9DMBrlcNgqt5ujcUrx4tQan7cosovdFqxkBR+4kueTG8duRYcL0DuOkLCRzPtrS6f
         EetFn8Hgzsv03i6NDhRz429GhOkWn8PKV8J86x9AZEe/axPkaxkBUs6qCExqIF4gNn16
         G4IuU8Hzb8ORvCmo+7nPMT6B25FjkrAZkoVfFwU7CPSZnDdDYaiib3d9ZZ/6Zn4e+koy
         COTHJSoPIJ7KHkFEexkDi45BEyrxINeQKnZ8YCu+lKRgSIrzBGt3CKOq0NEROYjXb8s3
         Vlb9a8jg4xmR/mtdlXIikciq5Sx1lplTbdiIMfiFCxzIDCRT5Of33dsjPdfn8g8WiwDo
         RFJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jRPo//N8";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g10-20020adfa48a000000b003145603b062sor11577wrb.9.2023.07.10.10.52.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Jul 2023 10:52:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jRPo//N8";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689011523; x=1691603523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZ8DNr0ETWD1Ms+NV1FciyuZYg6CvPu0oUthK2WDbYk=;
        b=jRPo//N88Xz2LKiydkosg17oCPcLw8bBUkxqEyYDL7buG+CtATrHJ/0Vbr0KK7fESh
         Y5jZtAtBb8faX3h0hzHRjbwptN6JV3RM4wcvuB/vp5tLRlCa1dBWSDEDNiAeW0DafnjW
         cVjoJyKV3HpPk+nx5qSGVRBiYpe2tWgekqYqqOVLbk4eFR4XvB2CHu4fmRgUI7SuuSq/
         E43UpmrWHYeEmxwFRXFWKHAxt3mjqsKzoi6pNuwKiZ3lo6BYo4CgzSSBuaxtms2TlrPh
         tFTK7zP+EkXeOlJjdwJQNP5FUn4zxArGF3/zMPyrWylERgd4g4BnzVxSE9DRcxEWtGbj
         MR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689011523; x=1691603523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZ8DNr0ETWD1Ms+NV1FciyuZYg6CvPu0oUthK2WDbYk=;
        b=H34s14Abaz/ZZ9zb0sxLQ79rEobnFHM2kELtGKjjZX3JYZww/nFbLlKuM2dhoCVGxe
         mu64EbaHwWHVIIzP8NFJEaZ1cb96yhZDlZ+5SUHz2m0frGUDZoQjHzHDx9iu3bnvNDQq
         r1J4d5xyYzAdGVNwkHPsNKgelQyLMewoakrx3d67Np/NEqWljb9bl9FVuO3KNcZfO5kd
         k+VrugunRd8eantWQ10jtJN9GJLMUcMN56jAmlSEGIug2geFM0Bc4hVm4Ft+WJ+M3Ts0
         fk90iHB4JWsLYf+EeChUcR5XVKH/mRKHdY2OaQeGs1xEAyMIh4z0FMI0UjnWEf04lU73
         Ii/g==
X-Gm-Message-State: ABy/qLaCs5ZMKZ7ynbDa9jsmsXrxXB8xlGvd3Xcv2FHWQ4WBGzfVZ7CE
	qD799WuBqe3EGJ+W/EuQbX1q7A+G
X-Google-Smtp-Source: APBJJlG0bCbTPyIF2mpHdv8nJElaML7v6z6Rr3jZG5bLcNpBm9grpTJxEx7vqk+D6GiDwuIo9COf9w==
X-Received: by 2002:adf:ecc8:0:b0:30f:af06:7320 with SMTP id s8-20020adfecc8000000b0030faf067320mr12999692wro.23.1689011523373;
        Mon, 10 Jul 2023 10:52:03 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (mst45-h01-176-184-47-225.dsl.sta.abo.bbox.fr. [176.184.47.225])
        by smtp.gmail.com with ESMTPSA id d6-20020adfe846000000b0030fd03e3d25sm20872wrn.75.2023.07.10.10.52.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Jul 2023 10:52:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gavin Shan <gshan@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 10/11] hw/char/pl011: Rename RX FIFO methods
Date: Mon, 10 Jul 2023 19:51:01 +0200
Message-Id: <20230710175102.32429-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230710175102.32429-1-philmd@linaro.org>
References: <20230710175102.32429-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4mcqxxg/WTco

In preparation of having a TX FIFO, rename the RX FIFO methods.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/char/pl011.c      | 10 +++++-----
 hw/char/trace-events |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 59d239cb83..7c785e7bb0 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -367,7 +367,7 @@ static int pl011_can_receive(void *opaque)
     return r;
 }
 
-static void pl011_put_fifo(void *opaque, uint32_t value)
+static void pl011_fifo_rx_put(void *opaque, uint32_t value)
 {
     PL011State *s = (PL011State *)opaque;
     int slot;
@@ -378,9 +378,9 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
     s->read_fifo[slot] = value;
     s->read_count++;
     s->flags &= ~PL011_FLAG_RXFE;
-    trace_pl011_put_fifo(value, s->read_count);
+    trace_pl011_fifo_rx_put(value, s->read_count);
     if (s->read_count == pipe_depth) {
-        trace_pl011_put_fifo_full();
+        trace_pl011_fifo_rx_full();
         s->flags |= PL011_FLAG_RXFF;
     }
     if (s->read_count == s->read_trigger) {
@@ -391,13 +391,13 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
 
 static void pl011_receive(void *opaque, const uint8_t *buf, int size)
 {
-    pl011_put_fifo(opaque, *buf);
+    pl011_fifo_rx_put(opaque, *buf);
 }
 
 static void pl011_event(void *opaque, QEMUChrEvent event)
 {
     if (event == CHR_EVENT_BREAK) {
-        pl011_put_fifo(opaque, DR_BE);
+        pl011_fifo_rx_put(opaque, DR_BE);
     }
 }
 
diff --git a/hw/char/trace-events b/hw/char/trace-events
index babf4d35ea..9fd40e3aae 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -58,8 +58,8 @@ pl011_read(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x valu
 pl011_read_fifo(int read_count) "FIFO read, read_count now %d"
 pl011_write(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x value 0x%08x reg %s"
 pl011_can_receive(uint32_t lcr, int read_count, int r) "LCR 0x%08x read_count %d returning %d"
-pl011_put_fifo(uint32_t c, int read_count) "new char 0x%x read_count now %d"
-pl011_put_fifo_full(void) "FIFO now full, RXFF set"
+pl011_fifo_rx_put(uint32_t c, int read_count) "new char 0x%02x read_count now %d"
+pl011_fifo_rx_full(void) "RX FIFO now full, RXFF set"
 pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t ibrd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %" PRIu32 ", fbrd: %" PRIu32 ")"
 
 # cmsdk-apb-uart.c
-- 
2.38.1
