Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1351463eje;
        Mon, 10 Jul 2023 10:51:46 -0700 (PDT)
X-Received: by 2002:a5d:6b47:0:b0:314:152d:f8db with SMTP id x7-20020a5d6b47000000b00314152df8dbmr10112251wrw.58.1689011506694;
        Mon, 10 Jul 2023 10:51:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689011506; cv=none;
        d=google.com; s=arc-20160816;
        b=duPi32Q2sW5cvfZNMR97iogLCAXoKQOL1UfeTYQmEeUMrykrIPE2KhEGTe33XrDOSz
         a9H7DHdUeWJItSpw6GgTlOxW/ez5vdNs75K14vIPmahhvgVF2JIQQUQ1Me0hyxwn3Vuo
         p0UwV+AK+3dQumBkcMd9n7LYxzwF9gWEqeOqLDOnlFnO3/dHQvTRQVaIV0rzVsmvYHlL
         kAYk8+NelIg1XxSgFR+I8OBp5R2j77kAUKODyV+xhgj3X4B/WkV7ZhjujcPibvQLT5TR
         8WvJ49hBi9OpEjgq4DgWyhVB5pNahtB0greenmuLLCOXkbUiRj8WXweFnlM6lNk9/w7O
         2+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OE5HK+6QzUc16kbWLHpwXHz/gljwcqm0t8YsiPIa+LE=;
        fh=4TWVGTMFk+XB48cTX7H3L2FEUZf3X6lSQ5h15kr1III=;
        b=VPtgusECxIPivp5i49dYWEc3N1ymGJ9eAXWifz7YAHkr49mVBHfcp/ycsMXTEUc9bC
         dMD2r/yvZ0r6afC4XyrHYe/zChTLJdOf/vH+iTGbCJO5Wbal0l87Gh7hkBHptqzOzdVn
         vhcjRJ8Gm5B3CA0RwhqGt3UYtIeDaknmtf/8aId+s3iLpBx0pAZoj5wLflX9FEFQCp9c
         bVSVGwEvkXI1w2Er688gfCVvo+NPoyxWS4k6iJmWN0SC31NBxhM/c6w9EbK8Z8QYd8Ss
         MGY38aoLwLO67XSQnJVRuEA/35efEZOxfoz/QRtu/JATDPnAKvoLDQj5uVsYXSVRT1/t
         iWJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tsYQMg2N;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t10-20020a1c770a000000b003fbe356b600sor74209wmi.0.2023.07.10.10.51.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Jul 2023 10:51:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tsYQMg2N;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689011506; x=1691603506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OE5HK+6QzUc16kbWLHpwXHz/gljwcqm0t8YsiPIa+LE=;
        b=tsYQMg2NbC33ht6evJmCGeSa7UL/wN88thUqyVnXUKJhrqDGOgovZaK9R1khey0t0V
         PyoJRqKvVn/Yd+cPopI/5dvF2h0qS5Ezd/Im1smwkUbk3OpqrpR/tvk+ug/CPleCD2jn
         y7HspVdPfjr3jxxW0PKb706nk6VeyCqGidMkvB8pZg1HmAr7Runxp9kYODIH9pRBPijk
         1ye/EBtVY9Q3/iQoNRVFuJG2wpbpVmTtigFlfhCCHW8XjN3GJLKryA6px8DXBb79ley3
         0UqHyj1HLgdz1Den5lROTV5lGe0ApSKERlghFJHMykkaTtvmVczV0Al6RPPofYkiu2uA
         XjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689011506; x=1691603506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OE5HK+6QzUc16kbWLHpwXHz/gljwcqm0t8YsiPIa+LE=;
        b=RwK5WNWVEeEd5LYY0TTKrHJe3uUZMuZzN67WtByqVKoJOLH/r4FZ1Suc8ZFXUK6PKm
         AfGRoVZaGLPo7pmMLslc1/hY6hxkHAJ4pcPblBdvw4vOH1XmLDgK4XNVNqac8KnJp1JW
         NU6YdxgE8sLIhEOuXKOU8Hkx67JytSLjffYSLNrPz0e+qo7DXSOfeq6tbnoam0MUe29t
         PssmEcTU6PARK1d1KNcraewNtByPsccwsto38HIDiKSAdtMgoKIl91+XvVCOZ3z/ap7q
         mtWPwnRlWPEIhnOSpovIpdT68UDM3aN9ATSU+FhWnH+q+BQE9FPpV+EkNJwBUmbNbUJn
         WL6A==
X-Gm-Message-State: ABy/qLaTRFcYDKEgnQYIGpR5JZ6/Nj4qGYq4x5+YNL4jmggUCy4D7Zb2
	Agj6EpipLhBto/p5zntcCSUpg0p4
X-Google-Smtp-Source: APBJJlGTvuvn6A71yE7i5fL3LrX5XO9YvpLbbataZS1IeAugak+MoNlv7E7GWVtCndLHD/YCKFEzhQ==
X-Received: by 2002:a7b:c5d0:0:b0:3fb:b008:1ff6 with SMTP id n16-20020a7bc5d0000000b003fbb0081ff6mr10921652wmk.0.1689011506342;
        Mon, 10 Jul 2023 10:51:46 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (mst45-h01-176-184-47-225.dsl.sta.abo.bbox.fr. [176.184.47.225])
        by smtp.gmail.com with ESMTPSA id k12-20020a7bc30c000000b003fba92fad35sm10908860wmj.26.2023.07.10.10.51.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Jul 2023 10:51:46 -0700 (PDT)
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
Subject: [PATCH v2 07/11] hw/char/pl011: Extract pl011_read_rxdata() from pl011_read()
Date: Mon, 10 Jul 2023 19:50:58 +0200
Message-Id: <20230710175102.32429-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230710175102.32429-1-philmd@linaro.org>
References: <20230710175102.32429-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rY+vbnix1ZaH

To keep MemoryRegionOps read/write handlers with similar logic,
factor pl011_read_txdata() out of pl011_read(), similar to the
previous commit did to pl011_write().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c | 40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 7bc7819d8b..e2e3d48b91 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -160,31 +160,37 @@ static void pl011_write_txdata(PL011State *s, const uint8_t *buf, int length)
     pl011_update(s);
 }
 
+static uint32_t pl011_read_rxdata(PL011State *s)
+{
+    uint32_t c;
+
+    s->flags &= ~PL011_FLAG_RXFF;
+    c = s->read_fifo[s->read_pos];
+    if (s->read_count > 0) {
+        s->read_count--;
+        s->read_pos = (s->read_pos + 1) & (pl011_get_fifo_depth(s) - 1);
+    }
+    if (s->read_count == 0) {
+        s->flags |= PL011_FLAG_RXFE;
+    }
+    if (s->read_count == s->read_trigger - 1)
+        s->int_level &= ~ INT_RX;
+    trace_pl011_read_fifo(s->read_count);
+    s->rsr = c >> 8;
+    pl011_update(s);
+    qemu_chr_fe_accept_input(&s->chr);
+    return c;
+}
+
 static uint64_t pl011_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
     PL011State *s = (PL011State *)opaque;
-    uint32_t c;
     uint64_t r;
 
     switch (offset >> 2) {
     case 0: /* UARTDR */
-        s->flags &= ~PL011_FLAG_RXFF;
-        c = s->read_fifo[s->read_pos];
-        if (s->read_count > 0) {
-            s->read_count--;
-            s->read_pos = (s->read_pos + 1) & (pl011_get_fifo_depth(s) - 1);
-        }
-        if (s->read_count == 0) {
-            s->flags |= PL011_FLAG_RXFE;
-        }
-        if (s->read_count == s->read_trigger - 1)
-            s->int_level &= ~ INT_RX;
-        trace_pl011_read_fifo(s->read_count);
-        s->rsr = c >> 8;
-        pl011_update(s);
-        qemu_chr_fe_accept_input(&s->chr);
-        r = c;
+        r = pl011_read_rxdata(s);
         break;
     case 1: /* UARTRSR */
         r = s->rsr;
-- 
2.38.1
