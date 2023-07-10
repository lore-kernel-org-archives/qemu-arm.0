Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1351359eje;
        Mon, 10 Jul 2023 10:51:35 -0700 (PDT)
X-Received: by 2002:a05:6000:11d1:b0:314:101c:42ba with SMTP id i17-20020a05600011d100b00314101c42bamr15443245wrx.54.1689011495039;
        Mon, 10 Jul 2023 10:51:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689011495; cv=none;
        d=google.com; s=arc-20160816;
        b=m3+/J28jb8Lc2SkyBsKNyf0440uSro37aFDuSxRfgCXVPVJWIxk2FnWD20tmK3d0YL
         ctQxOdPzWOvRgTZuHcaPTfscPEtCsltAtrOdAMk2ZP7D/f9pIycRLc7zvjc+UZYYcZbH
         agZ/ARAFL9ngBWEqw3vpkS/yW8dKmcGAHE22XooeEu2fA8dN35OLpjQdFAaDJni/2Yw/
         BjNpVqQmIZAq2tLZi5uubJp0Z+cONq1nus/u1itTMR8yjeJF2+DQ8aZ55dlG4afqeS0u
         QmRheMuEEQFi6smiczKDYZSzlmGEc2Do8b3s2sOC69toKB9imD4ipgTDA9CnK7Zco/Et
         nCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vINMBBFp0tNBmc0jxCNSawkrMv3zFmYswmW1JkHmuF4=;
        fh=4TWVGTMFk+XB48cTX7H3L2FEUZf3X6lSQ5h15kr1III=;
        b=myljRVja/8Q07pIe0gOLUVtqWeWhUfMmuoYARgZqVKVrSxt83LiWcBwNNlquFCsnAS
         0fHl5+68DtstHr4kFXlkfa5awdWEz8QkjC9muxHKMhsrY341bE0y93itRCxKAp2pND/5
         ckyhkGu514WwzrHZmFlMcXGUjDdCMe/PJiR8LSkbYHMMqIHiMXYWpAvmr6ex+AsLIeM7
         C+0V4aWraHLmLV0S3Q9Ty9W3VnSeKL0RoXn59tbrLVktytcBIv9nNzFzLxnpZfmxXHQ4
         PruCH4DKgaF00TzUfEIQpHZuNyhuAqBlpKxKqqlLfFRfgfb6Z8JWMrN9RtE+QmmxUWIE
         jhVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jn7tXF0V;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u17-20020adfa191000000b003159126fccbsor12678wru.5.2023.07.10.10.51.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Jul 2023 10:51:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jn7tXF0V;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689011494; x=1691603494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vINMBBFp0tNBmc0jxCNSawkrMv3zFmYswmW1JkHmuF4=;
        b=jn7tXF0Vb0kI9zsoLl9pbMSgyVMTyYig7Y7CT3MRnsBjQTEb/vS3dk7yZAseCFEMCk
         6HeReqKI82E32hJ9ZZhOEoVtrMYY+bVlDHWa1XJsCuY2rmP388jPFHHBdtF9lN26/UU6
         QcE16m6QH0l42CQgMTI8mgBeTOhXdyBBxNRU1bYSAkXlEpRRa6tgj9DVzgMnkepE6re4
         KAv1z49zOkq6eJib3YdFIHV3RtSLZa+UFcXQ3WqhD5mjSv5EFEhTcy/T4txY9xJjRWON
         ozhEaklkTE6GFj0ozcd2bHIHB7qa2oGjGLuFCPrBfMHi8L1Ns6Ue5M66BnJ4X3B56R6h
         vVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689011494; x=1691603494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vINMBBFp0tNBmc0jxCNSawkrMv3zFmYswmW1JkHmuF4=;
        b=joPjjtyyAOVOthqLoLql1ivHgIRsGAMyHTmNw8sA6mUNZnb9Ywi/vz+vEnuZBDcv06
         D495dj72YlOR3u8att5dspy8hDj93+H5SMmupBtraxPUG72YC+dGgy5NwaohPW5rua+Z
         zKCxSj4hlGwfznC+G8zRPLJ8f910r5kJlHJ+ohBX+NI6pO43TlkJKCQC3WMvN1AGULf5
         /Dez2HsZSRldem8AOfLSHRmOB7xrR48PQNlP5hxZgi8YltdSobQgtLRF5vP4d5TGOAbA
         UmxSdy/Jk5hFbgxWGNkLPMCK9lRtrnazfz/ZN8L/ww+CRyCCvCJ6GiUlvD8FrDg/ZPoT
         hv4A==
X-Gm-Message-State: ABy/qLYclfM9P+zzcEC9xgCLBSv9wQiLeIgyIdeWhYfkc5BZqiOq+Yu5
	kv8kKGE2dV9kic1FO33qDbzDWkDI
X-Google-Smtp-Source: APBJJlGaBovkyYwERLmKrPb7OJiP9ZlPYVS5p/QuhJlB/wE5PatCPCuRKHLHBISsokvssjA8uAqG2A==
X-Received: by 2002:a5d:4ec7:0:b0:314:3843:ebaa with SMTP id s7-20020a5d4ec7000000b003143843ebaamr16189249wrv.68.1689011494797;
        Mon, 10 Jul 2023 10:51:34 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (mst45-h01-176-184-47-225.dsl.sta.abo.bbox.fr. [176.184.47.225])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d66c3000000b00314398e4dd4sm29988wrw.54.2023.07.10.10.51.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Jul 2023 10:51:34 -0700 (PDT)
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
Subject: [PATCH v2 05/11] hw/char/pl011: Split RX/TX path of pl011_reset_fifo()
Date: Mon, 10 Jul 2023 19:50:56 +0200
Message-Id: <20230710175102.32429-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230710175102.32429-1-philmd@linaro.org>
References: <20230710175102.32429-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: c4N1ezxNdamL

To be able to reset the RX or TX FIFO separately,
split pl011_reset_fifo() in two.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/char/pl011.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 58edeb9ddb..1f07c7b021 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -132,14 +132,21 @@ static inline unsigned pl011_get_fifo_depth(PL011State *s)
     return pl011_is_fifo_enabled(s) ? PL011_FIFO_DEPTH : 1;
 }
 
-static inline void pl011_reset_fifo(PL011State *s)
+static inline void pl011_reset_rx_fifo(PL011State *s)
 {
     s->read_count = 0;
     s->read_pos = 0;
 
     /* Reset FIFO flags */
-    s->flags &= ~(PL011_FLAG_RXFF | PL011_FLAG_TXFF);
-    s->flags |= PL011_FLAG_RXFE | PL011_FLAG_TXFE;
+    s->flags &= ~PL011_FLAG_RXFF;
+    s->flags |= PL011_FLAG_RXFE;
+}
+
+static inline void pl011_reset_tx_fifo(PL011State *s)
+{
+    /* Reset FIFO flags */
+    s->flags &= ~PL011_FLAG_TXFF;
+    s->flags |= PL011_FLAG_TXFE;
 }
 
 static uint64_t pl011_read(void *opaque, hwaddr offset,
@@ -289,7 +296,8 @@ static void pl011_write(void *opaque, hwaddr offset,
     case 11: /* UARTLCR_H */
         /* Reset the FIFO state on FIFO enable or disable */
         if ((s->lcr ^ value) & LCR_FEN) {
-            pl011_reset_fifo(s);
+            pl011_reset_rx_fifo(s);
+            pl011_reset_tx_fifo(s);
         }
         if ((s->lcr ^ value) & LCR_BRK) {
             int break_enable = value & LCR_BRK;
@@ -506,7 +514,8 @@ static void pl011_reset(DeviceState *dev)
     s->ifl = 0x12;
     s->cr = 0x300;
     s->flags = 0;
-    pl011_reset_fifo(s);
+    pl011_reset_rx_fifo(s);
+    pl011_reset_tx_fifo(s);
 }
 
 static void pl011_class_init(ObjectClass *oc, void *data)
-- 
2.38.1
