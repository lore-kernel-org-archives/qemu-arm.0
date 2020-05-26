Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2674777lfc;
        Mon, 25 May 2020 23:26:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDh04ZYoaHjjbMgjBCsgcE/G6LCraicGPL/71ykqJ8JLdfkFTk+XRH7k31WmE0tXWL1NR8
X-Received: by 2002:a25:b7d3:: with SMTP id u19mr48961717ybj.434.1590474384915;
        Mon, 25 May 2020 23:26:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590474384; cv=none;
        d=google.com; s=arc-20160816;
        b=QMxrHbBtlVt8PpUZtS4D/P30YODsco4aRhU6RVH3zDtI8UT7QKd+zHgBKXtFvGHalb
         ofX7UOHgxQLLDosPuK8HcQhDPlg4ST38b9q726CWR8U5+Vwb/SyfLL8wkNH8aalBACCn
         o4LmNpbLWj+Vwo7geVqVgS1C+DqSopIjoQowtNG8Pf2/GXe8ikPdbyTbDmo9DzEPC0km
         kbX4IpyfJQtjqIL3CgpkeyD0DSIYRl0jAlSEoALqtRr6duq2uB5MS3bIBgXHeBUdyOfI
         mYJM4jnaa75e/n+lK8gNEb81JujWGE9j/vPDSLZjZI3guZdCxsGT1Rl5dRCxgU0gU+DH
         bfBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=niKys0M9qCRdd5XE0vRzIcnavSTrjMmT5iXeBJ1UjZs=;
        b=b7LcjGraSLnotmYdpEor6WUOyJy8dXJrPENmA/11ljh0QKBBsJ1LRIZpDJfC2W30fL
         ZrQHJvEloHXUjkhi3t5tzodD0JNcjFInq6XxgCIhzpFtxCrf6oE3nUkF2KuVt9uWEVcc
         F2eAx1SXe+R/CicBLkCozHOfWAkfOhvGgQTZasdF7sNjcdC8QBnUlUcCz8j0Ccm2XC62
         LWrD8P0DBqF5X5DNgmTiqwclaWMnzO5tugSKbDm0iyJPQNiYs7pfLb+WkhzK36v1Kj7c
         NqnM+exCaVlptwyO37zrwYMpvpX2osMyKrmyDdvcNDr1E06I/aD6XH1SZiv4Ss6hFbY1
         /fag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="A0Clr/Nm";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4si5539701ybc.33.2020.05.25.23.26.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 23:26:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="A0Clr/Nm";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdT2e-00041z-9Y
	for alex.bennee@linaro.org; Tue, 26 May 2020 02:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdSzS-0006l2-V8; Tue, 26 May 2020 02:23:06 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdSzS-0002Tp-5I; Tue, 26 May 2020 02:23:06 -0400
Received: by mail-wr1-x441.google.com with SMTP id x14so13820001wrp.2;
 Mon, 25 May 2020 23:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=niKys0M9qCRdd5XE0vRzIcnavSTrjMmT5iXeBJ1UjZs=;
 b=A0Clr/NmfQGAjrdffxoKZ0zK5WUpCI8/5bUlZpe+cOPkiWEBvvcLL6JtpADF9lG7C5
 enMQntACeD1VYmS4372X9a02/jd/tyuPa2GYZI2Fi5dtJEAITru38G+BMKpmR5j96CNp
 bDbij5rTSGwBzsa8V5phrSJzndHYa5bBm2z+8FH9ECQ/dHuv7SIuvGWRqJt7/Pyaqmw6
 vw/Rlwdrfv7gLkSco5NSQGtpGyh+K1e9JRldZmUVdKrP+E49fOZEJN9I36jBYbZ2P5eH
 HhaNXcWnChtVoPPLomOL+IA4JpTC+oYHuptBBJa1H3hArWTYw/KyRxFO6bnr2QS/7KwC
 Y+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=niKys0M9qCRdd5XE0vRzIcnavSTrjMmT5iXeBJ1UjZs=;
 b=dZhRRUBP7LQT1jzqZXKNfNRQGfLijvGenMni8A0frQiAvB1g4Sm6PMaZC/d9tLJqjj
 6XzwmQQMhkfKl9IgMHnQikD14HCrs3487Dgi4eQWhO06SeGyK4B3EyFVecbHMWqoGU0m
 fqG7klfS5+yqsWZyvE07OTpJi+d+9fZ8KqMZM6z0qyOA4m1Yzjehtw1bea9nJrXaqgX+
 MT8pK9iadfm5W7u+iiLjNxxElh5p4YV6cj66jaz/kHNL3xTxNkA4n1HIMtaVo0w5bjsU
 211s30EmlXW3bpe1ZGkNsB5Fh/Zgc4R7III7Ccv0HM6tq+G0cyMEk4air2uG9cyPY6Nb
 KHkg==
X-Gm-Message-State: AOAM531OdA8wLdmz+kLVYDSHGCcb2uGZwxqMI2N4TcjN9G6YgASlFmvV
 lGxTujYo5LwfOEkLLAp97/w=
X-Received: by 2002:adf:e752:: with SMTP id c18mr18168910wrn.353.1590474184018; 
 Mon, 25 May 2020 23:23:04 -0700 (PDT)
Received: from localhost.localdomain (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id a16sm5764745wrx.8.2020.05.25.23.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 23:23:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 06/14] hw/display/cirrus_vga: Convert debug printf() to trace
 event
Date: Tue, 26 May 2020 08:22:44 +0200
Message-Id: <20200526062252.19852-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200526062252.19852-1-f4bug@amsat.org>
References: <20200526062252.19852-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QzkSxNJ7qtrA

Convert the final bit of DEBUG_BITBLT to a tracepoint.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/cirrus_vga.c | 24 ++++++++++--------------
 hw/display/trace-events |  1 +
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 76e2dc5bb6..92c197cdde 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -53,7 +53,6 @@
  */
 
 //#define DEBUG_CIRRUS
-//#define DEBUG_BITBLT
 
 /***************************************
  *
@@ -950,19 +949,16 @@ static void cirrus_bitblt_start(CirrusVGAState * s)
     s->cirrus_blt_dstaddr &= s->cirrus_addr_mask;
     s->cirrus_blt_srcaddr &= s->cirrus_addr_mask;
 
-#ifdef DEBUG_BITBLT
-    printf("rop=0x%02x mode=0x%02x modeext=0x%02x w=%d h=%d dpitch=%d spitch=%d daddr=0x%08x saddr=0x%08x writemask=0x%02x\n",
-           blt_rop,
-           s->cirrus_blt_mode,
-           s->cirrus_blt_modeext,
-           s->cirrus_blt_width,
-           s->cirrus_blt_height,
-           s->cirrus_blt_dstpitch,
-           s->cirrus_blt_srcpitch,
-           s->cirrus_blt_dstaddr,
-           s->cirrus_blt_srcaddr,
-           s->vga.gr[0x2f]);
-#endif
+    trace_vga_cirrus_bitblt_start(blt_rop,
+                                  s->cirrus_blt_mode,
+                                  s->cirrus_blt_modeext,
+                                  s->cirrus_blt_width,
+                                  s->cirrus_blt_height,
+                                  s->cirrus_blt_dstpitch,
+                                  s->cirrus_blt_srcpitch,
+                                  s->cirrus_blt_dstaddr,
+                                  s->cirrus_blt_srcaddr,
+                                  s->vga.gr[0x2f]);
 
     switch (s->cirrus_blt_mode & CIRRUS_BLTMODE_PIXELWIDTHMASK) {
     case CIRRUS_BLTMODE_PIXELWIDTH8:
diff --git a/hw/display/trace-events b/hw/display/trace-events
index c3043e4ced..bb089a5f5e 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -134,6 +134,7 @@ vga_cirrus_read_io(uint32_t addr, uint32_t val) "addr 0x%x, val 0x%x"
 vga_cirrus_write_io(uint32_t addr, uint32_t val) "addr 0x%x, val 0x%x"
 vga_cirrus_write_blt(uint32_t offset, uint32_t val) "offset 0x%x, val 0x%x"
 vga_cirrus_write_gr(uint8_t index, uint8_t val) "GR addr 0x%02x, val 0x%02x"
+vga_cirrus_bitblt_start(uint8_t blt_rop, uint8_t blt_mode, uint8_t blt_modeext, int blt_width, int blt_height, int blt_dstpitch, int blt_srcpitch, uint32_t blt_dstaddr, uint32_t blt_srcaddr, uint8_t gr_val) "rop=0x%02x mode=0x%02x modeext=0x%02x w=%d h=%d dpitch=%d spitch=%d daddr=0x%08"PRIx32" saddr=0x%08"PRIx32" writemask=0x%02x"
 
 # sii9022.c
 sii9022_read_reg(uint8_t addr, uint8_t val) "addr 0x%02x, val 0x%02x"
-- 
2.21.3

