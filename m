Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2446046wrq;
        Sat, 23 Jun 2018 21:08:17 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpecLCrNSJ62W6MqYa77bkbmDAZ0brK8g9gpkEKvIOylhslhFObZVIwLIi4PIc1whEg+CUmo
X-Received: by 2002:a37:184b:: with SMTP id j72-v6mr3763900qkh.94.1529813297498;
        Sat, 23 Jun 2018 21:08:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529813297; cv=none;
        d=google.com; s=arc-20160816;
        b=Yk1da4hMLYUvCx2ZeKZNlU+PDao+AR9vw9RARddMlzdw8j4jz3YprYJ8WSMz7s8NEV
         CLEglkJe9n5toppCXgRNsuHXKveqggdaij3YhtSsylvSKyz0aThuvnjxUefS7aLK3ZmA
         cUXAWTwwBb8X97ST82UzGDaRIcvTqjahdJxUDezcEVYn/Gj1B0RpqDaPagJ8erF2emB+
         P9YD4VjEaBrlhoXkaflwq9udfrapIcB/8UoIGNTLk7zGS6obI6tuApjBgZL6sAfHUqj+
         R/RYa2qcQXEOJg8D9sY6TZbMvM9zN1DfIfFTp3/5xIimtbJX4pu26IMB5WUO+NF5wpXP
         mzFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=36on+xdgbXFxeBwwHxce84Ksqf4fOm9jRWSX1+NwhG8=;
        b=pBpEOJxhZmXex0Ru6RFq5uxYzUNUwqsVt7zQ90qQXKrSurDzW2CGNxCGFRv/7dSsmC
         HUWy9athWW6/Adihqc4UCI7nT+Ztpw1hqe7gYUBbLbC87708unvvI9bJDDqJwHw2y6fr
         X5S9Tjt6HPfakN+XbwW1Z4Nyzh5PXKdjBCYNt2VmJLCFj67dgGs6W2FxxlP4xU1Uox5Q
         UlF/cFqsPbchn87wPmFtZ6ScSIYoZ/DSjoaFdAL/eZvCRy+KivW8SUUBl46TZ78fReQy
         7v0fGZqcFrfgurSFnhS3moFNx9BsHg9wUv4doJXWIbxsLvIQf+d1o0MrQf6+VGm2Ivli
         FtlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n57dpeie;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x185-v6si10569166qkd.207.2018.06.23.21.08.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jun 2018 21:08:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n57dpeie;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40484 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWwK0-0004l5-Tw
	for alex.bennee@linaro.org; Sun, 24 Jun 2018 00:08:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIT-0003sp-DG
	for qemu-devel@nongnu.org; Sun, 24 Jun 2018 00:06:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIO-0003o7-KM
	for qemu-devel@nongnu.org; Sun, 24 Jun 2018 00:06:41 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:35494)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIO-0003np-FK; Sun, 24 Jun 2018 00:06:36 -0400
Received: by mail-qk0-x243.google.com with SMTP id u21-v6so244113qku.2;
	Sat, 23 Jun 2018 21:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=36on+xdgbXFxeBwwHxce84Ksqf4fOm9jRWSX1+NwhG8=;
	b=n57dpeieDdUQa1TjXoAPnFWyyrNm0SjjZ1g64Rd4aflPYkcjh65xqRrdQyU+M1Yb0d
	cgzG6ZdkEYxqrrYDmqlnpdhgMDB143v5rcQbJnEsEKvjsNX4yoQxXEHZuxgRM8HADmdO
	8S768EE3dcw+KpMRpSl4Y0TedVYPyFMEXlY52Fzd9ryceozPmZqbX/AaEm8IjqfLtFVo
	/WzSwfX2BmsQg/RbcyiQrjoKawCJd76J5W4K3r3a90wFW83VuVxmIlnm9txCf0mtHpU8
	fThXwqU4wQ/8icEWQE12MORSPP/6VWfgKvi2jzWQ9YPw0fBRsx9AoEu3a1l7FPn7rX9l
	gCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=36on+xdgbXFxeBwwHxce84Ksqf4fOm9jRWSX1+NwhG8=;
	b=ZkXpgadq8/U6GGgMohMw65W/yl+W3dgZrUJKPJBXOEfWjDBw6JdfZXk/eOgxrlkMKu
	c3TPzZ5IMtwtwXvCA1GXu3t0Nofj0fThQnSBRdBbvQbC9nRKMJ5LDnNA8f5jl0bsMXNG
	AS1LQyriCpZnN1mKq8RLwGedueb0G9zqFWXCfYwcAHzqHC6DSwlnqEyKgwpZ8Bat7Q5+
	/BKOyeqGwnIfa3Wm3WeUZT91IpwJke/6ZvNGYiEgybKzNVuBqQOjyYy7NCOxr2u9VmwR
	IFOf4HmgGZXH8YqlhoUBkUFh9u0QP2dD4pL5sTeyZ9g1Mm+TprAd7aVsJ6ryg6y8skP5
	Rr6A==
X-Gm-Message-State: APt69E1CLRyV9hRjcG+gAwMOiOSDuYlVMJCyBk6271Mp5hP/5cCIzsu5
	jcNPJPPalXpaXrSohsRDRCY=
X-Received: by 2002:a37:1328:: with SMTP id
	d40-v6mr6369523qkh.198.1529813195931; 
	Sat, 23 Jun 2018 21:06:35 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:06:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Sun, 24 Jun 2018 01:05:57 -0300
Message-Id: <20180624040609.17572-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-devel] [PATCH v3 04/16] hw/dma/omap_dma: Use
 qemu_log_mask(GUEST_ERROR) instead of fprintf
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MgZ9d0pdoLhJ

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/dma/omap_dma.c | 64 +++++++++++++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 24 deletions(-)

diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index ab3a1b0451..cbb920f31d 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -879,15 +879,18 @@ static int omap_dma_ch_reg_write(struct omap_dma_s *s,
         ch->burst[0] = (value & 0x0180) >> 7;
         ch->pack[0] = (value & 0x0040) >> 6;
         ch->port[0] = (enum omap_dma_port) ((value & 0x003c) >> 2);
-        if (ch->port[0] >= __omap_dma_port_last)
-            printf("%s: invalid DMA port %i\n", __func__,
-                            ch->port[0]);
-        if (ch->port[1] >= __omap_dma_port_last)
-            printf("%s: invalid DMA port %i\n", __func__,
-                            ch->port[1]);
+        if (ch->port[0] >= __omap_dma_port_last) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid DMA port %i\n",
+                          __func__, ch->port[0]);
+        }
+        if (ch->port[1] >= __omap_dma_port_last) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid DMA port %i\n",
+                          __func__, ch->port[1]);
+        }
         ch->data_type = 1 << (value & 3);
         if ((value & 3) == 3) {
-            printf("%s: bad data_type for DMA channel\n", __func__);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: bad data_type for DMA channel\n", __func__);
             ch->data_type >>= 1;
         }
         break;
@@ -1899,14 +1902,18 @@ static void omap_dma4_write(void *opaque, hwaddr addr,
         if (value & 2)						/* SOFTRESET */
             omap_dma_reset(s->dma);
         s->ocp = value & 0x3321;
-        if (((s->ocp >> 12) & 3) == 3)				/* MIDLEMODE */
-            fprintf(stderr, "%s: invalid DMA power mode\n", __func__);
+        if (((s->ocp >> 12) & 3) == 3) { /* MIDLEMODE */
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid DMA power mode\n",
+                          __func__);
+        }
         return;
 
     case 0x78:	/* DMA4_GCR */
         s->gcr = value & 0x00ff00ff;
-	if ((value & 0xff) == 0x00)		/* MAX_CHANNEL_FIFO_DEPTH */
-            fprintf(stderr, "%s: wrong FIFO depth in GCR\n", __func__);
+        if ((value & 0xff) == 0x00) { /* MAX_CHANNEL_FIFO_DEPTH */
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: wrong FIFO depth in GCR\n",
+                          __func__);
+        }
         return;
 
     case 0x80 ... 0xfff:
@@ -1935,9 +1942,11 @@ static void omap_dma4_write(void *opaque, hwaddr addr,
     case 0x00:	/* DMA4_CCR */
         ch->buf_disable = (value >> 25) & 1;
         ch->src_sync = (value >> 24) & 1;	/* XXX For CamDMA must be 1 */
-        if (ch->buf_disable && !ch->src_sync)
-            fprintf(stderr, "%s: Buffering disable is not allowed in "
-                            "destination synchronised mode\n", __func__);
+        if (ch->buf_disable && !ch->src_sync) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Buffering disable is not allowed in "
+                          "destination synchronised mode\n", __func__);
+        }
         ch->prefetch = (value >> 23) & 1;
         ch->bs = (value >> 18) & 1;
         ch->transparent_copy = (value >> 17) & 1;
@@ -1947,9 +1956,11 @@ static void omap_dma4_write(void *opaque, hwaddr addr,
         ch->suspend = (value & 0x0100) >> 8;
         ch->priority = (value & 0x0040) >> 6;
         ch->fs = (value & 0x0020) >> 5;
-        if (ch->fs && ch->bs && ch->mode[0] && ch->mode[1])
-            fprintf(stderr, "%s: For a packet transfer at least one port "
-                            "must be constant-addressed\n", __func__);
+        if (ch->fs && ch->bs && ch->mode[0] && ch->mode[1]) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: For a packet transfer at least one port "
+                          "must be constant-addressed\n", __func__);
+        }
         ch->sync = (value & 0x001f) | ((value >> 14) & 0x0060);
         /* XXX must be 0x01 for CamDMA */
 
@@ -1978,9 +1989,11 @@ static void omap_dma4_write(void *opaque, hwaddr addr,
         ch->endian_lock[0] =(value >> 20) & 1;
         ch->endian[1] =(value >> 19) & 1;
         ch->endian_lock[1] =(value >> 18) & 1;
-        if (ch->endian[0] != ch->endian[1])
-            fprintf(stderr, "%s: DMA endianness conversion enable attempt\n",
-                            __func__);
+        if (ch->endian[0] != ch->endian[1]) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: DMA endianness conversion enable attempt\n",
+                          __func__);
+        }
         ch->write_mode = (value >> 16) & 3;
         ch->burst[1] = (value & 0xc000) >> 14;
         ch->pack[1] = (value & 0x2000) >> 13;
@@ -1988,12 +2001,15 @@ static void omap_dma4_write(void *opaque, hwaddr addr,
         ch->burst[0] = (value & 0x0180) >> 7;
         ch->pack[0] = (value & 0x0040) >> 6;
         ch->translate[0] = (value & 0x003c) >> 2;
-        if (ch->translate[0] | ch->translate[1])
-            fprintf(stderr, "%s: bad MReqAddressTranslate sideband signal\n",
-                            __func__);
+        if (ch->translate[0] | ch->translate[1]) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: bad MReqAddressTranslate sideband signal\n",
+                          __func__);
+        }
         ch->data_type = 1 << (value & 3);
         if ((value & 3) == 3) {
-            printf("%s: bad data_type for DMA channel\n", __func__);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: bad data_type for DMA channel\n", __func__);
             ch->data_type >>= 1;
         }
         break;
-- 
2.18.0

