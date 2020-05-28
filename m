Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp489595lfc;
        Thu, 28 May 2020 05:46:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+VXrGYmR/P25+mD8ScPhNHHicQ67Ptv3ELwCPSZj5VLTJGUsJNm+eqza9APL53jcEW/wG
X-Received: by 2002:a25:3f85:: with SMTP id m127mr4696951yba.228.1590669966875;
        Thu, 28 May 2020 05:46:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590669966; cv=none;
        d=google.com; s=arc-20160816;
        b=P+4wuEKo3rViGZghTOZR58I4ezOzJB5QxMHuDmeqHL7G2krPolu78j5PY/U54Xhwg/
         t4nRwFkIQN7T/HtAlp52mR5qHuTkBe7oE5GbNP/3K2ia/aXqCIOAKky8nMGtOT9s0D9K
         z6+Oi/QUZro9ZHboe34GzActZM54xXm71HGkmH7HYOFcpj/IlHbwKzIhh6zvyCg9E3y8
         nyKifXcWUGUsuGKoDvtJdr1aat8749jwt3m6sx8zFi7wYmPMlxrWC1/RzHR2yw/TmrCK
         aydOFeNwso6XBAy/ipp2rww816uHYrFJGCH02wUOwTUNB/eN7Q5U7ampfqns3/x1xmQg
         lU4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=alJWWguzMdAxzeeZpfBMp4t+t9rEX1QSKuKtB7IIv5E=;
        b=sXlqURxHLOnYqPZD25ltK/85M3/EQdKnRUgQWx0GKirBLCpN4CHbeCshXYrQ13jZ7t
         SD6ZvBuE7EJtKoFGUz6PLxC25HaITcFpAPzuDgCTfMaTikcX48UnmwPmUy3z19/GiAv7
         DEmPYnxVpa2mgRavtLrPyiavjWJ4pWoJXG/+IPlrWNXOSiXSG2p8YWukpWRXPXk4ZlNF
         4my65BrWWWxMpCQSX+Ky1IBJ6NZImC+WirnCc+bkOLEHpkxwy0VyfnpvvUUYPjdKZqGD
         b8ZJ09MaEr6Q1Fv6iSqd4hNt5DikPj31wAzoqy0zu2eVfkYXrixi1r4thRn4u0MmZ+Ay
         7cig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MuLaLznV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f35si4088702ybi.135.2020.05.28.05.46.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 05:46:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MuLaLznV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jeHvC-0005Uc-7k
	for alex.bennee@linaro.org; Thu, 28 May 2020 08:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHmD-0002Xy-IV
 for qemu-arm@nongnu.org; Thu, 28 May 2020 08:36:49 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20289
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHm7-0005NV-6R
 for qemu-arm@nongnu.org; Thu, 28 May 2020 08:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590669402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=alJWWguzMdAxzeeZpfBMp4t+t9rEX1QSKuKtB7IIv5E=;
 b=MuLaLznVahQ31texZ5QnalElOdTj0/3a71rltmXwcR5hs8nobjojtb0YYPvYNjVRFiWG3a
 oEZNRKDXry7I0S70yNJYlr5Nn6puh79dZBoyPD6alBHYluybptmxVWKE9ltNgPhU+ZVIOm
 iYWpZIlabnhEvHU8GM+r/qJgJcObjj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-JuWgx9MlNF20MyKJL9fEuA-1; Thu, 28 May 2020 08:36:22 -0400
X-MC-Unique: JuWgx9MlNF20MyKJL9fEuA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFD301855A10;
 Thu, 28 May 2020 12:36:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7179A60FC2;
 Thu, 28 May 2020 12:36:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 871139D54; Thu, 28 May 2020 14:36:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/21] hw/display/cirrus_vga: Use qemu_log_mask(ERROR) instead
 of debug printf
Date: Thu, 28 May 2020 14:35:53 +0200
Message-Id: <20200528123609.27362-6-kraxel@redhat.com>
In-Reply-To: <20200528123609.27362-1-kraxel@redhat.com>
References: <20200528123609.27362-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 06:31:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yjVaSqVi4LAn

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Replace some debug printf() calls by qemu_log_mask(LOG_GUEST_ERROR).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20200526062252.19852-6-f4bug@amsat.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/cirrus_vga.c | 77 ++++++++++++++++++-----------------------
 1 file changed, 33 insertions(+), 44 deletions(-)

diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index f9f837b8508c..76e2dc5bb604 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -978,9 +978,8 @@ static void cirrus_bitblt_start(CirrusVGAState * s)
 	s->cirrus_blt_pixelwidth = 4;
 	break;
     default:
-#ifdef DEBUG_BITBLT
-	printf("cirrus: bitblt - pixel width is unknown\n");
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "cirrus: bitblt - pixel width is unknown\n");
 	goto bitblt_ignore;
     }
     s->cirrus_blt_mode &= ~CIRRUS_BLTMODE_PIXELWIDTHMASK;
@@ -1037,7 +1036,9 @@ static void cirrus_bitblt_start(CirrusVGAState * s)
         } else {
 	    if (s->cirrus_blt_mode & CIRRUS_BLTMODE_TRANSPARENTCOMP) {
 		if (s->cirrus_blt_pixelwidth > 2) {
-		    printf("src transparent without colorexpand must be 8bpp or 16bpp\n");
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "cirrus: src transparent without colorexpand "
+                          "must be 8bpp or 16bpp\n");
 		    goto bitblt_ignore;
 		}
 		if (s->cirrus_blt_mode & CIRRUS_BLTMODE_BACKWARDS) {
@@ -1135,10 +1136,9 @@ static uint32_t cirrus_get_bpp16_depth(CirrusVGAState * s)
 	ret = 16;
 	break;			/* XGA HiColor */
     default:
-#ifdef DEBUG_CIRRUS
-	printf("cirrus: invalid DAC value %x in 16bpp\n",
-	       (s->cirrus_hidden_dac_data & 0xf));
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "cirrus: invalid DAC value 0x%x in 16bpp\n",
+                      (s->cirrus_hidden_dac_data & 0xf));
 	ret = 15;		/* XXX */
 	break;
     }
@@ -1307,11 +1307,9 @@ static int cirrus_vga_read_sr(CirrusVGAState * s)
 #endif
 	return s->vga.sr[s->vga.sr_index];
     default:
-#ifdef DEBUG_CIRRUS
-	printf("cirrus: inport sr_index %02x\n", s->vga.sr_index);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "cirrus: inport sr_index 0x%02x\n", s->vga.sr_index);
 	return 0xff;
-	break;
     }
 }
 
@@ -1400,10 +1398,9 @@ static void cirrus_vga_write_sr(CirrusVGAState * s, uint32_t val)
         cirrus_update_memory_access(s);
         break;
     default:
-#ifdef DEBUG_CIRRUS
-	printf("cirrus: outport sr_index %02x, sr_value %02x\n",
-               s->vga.sr_index, val);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "cirrus: outport sr_index 0x%02x, sr_value 0x%02x\n",
+                      s->vga.sr_index, val);
 	break;
     }
 }
@@ -1501,9 +1498,8 @@ static int cirrus_vga_read_gr(CirrusVGAState * s, unsigned reg_index)
     if (reg_index < 0x3a) {
 	return s->vga.gr[reg_index];
     } else {
-#ifdef DEBUG_CIRRUS
-	printf("cirrus: inport gr_index %02x\n", reg_index);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "cirrus: inport gr_index 0x%02x\n", reg_index);
 	return 0xff;
     }
 }
@@ -1590,10 +1586,9 @@ cirrus_vga_write_gr(CirrusVGAState * s, unsigned reg_index, int reg_value)
 	cirrus_write_bitblt(s, reg_value);
 	break;
     default:
-#ifdef DEBUG_CIRRUS
-	printf("cirrus: outport gr_index %02x, gr_value %02x\n", reg_index,
-	       reg_value);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "cirrus: outport gr_index 0x%02x, gr_value 0x%02x\n",
+                      reg_index, reg_value);
 	break;
     }
 }
@@ -1648,9 +1643,8 @@ static int cirrus_vga_read_cr(CirrusVGAState * s, unsigned reg_index)
 	return s->vga.ar_index & 0x3f;
 	break;
     default:
-#ifdef DEBUG_CIRRUS
-	printf("cirrus: inport cr_index %02x\n", reg_index);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "cirrus: inport cr_index 0x%02x\n", reg_index);
 	return 0xff;
     }
 }
@@ -1721,10 +1715,9 @@ static void cirrus_vga_write_cr(CirrusVGAState * s, int reg_value)
 	break;
     case 0x25:			// Part Status
     default:
-#ifdef DEBUG_CIRRUS
-	printf("cirrus: outport cr_index %02x, cr_value %02x\n",
-               s->vga.cr_index, reg_value);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "cirrus: outport cr_index 0x%02x, cr_value 0x%02x\n",
+                      s->vga.cr_index, reg_value);
 	break;
     }
 }
@@ -1834,9 +1827,8 @@ static uint8_t cirrus_mmio_blt_read(CirrusVGAState * s, unsigned address)
 	value = cirrus_vga_read_gr(s, 0x31);
 	break;
     default:
-#ifdef DEBUG_CIRRUS
-	printf("cirrus: mmio read - address 0x%04x\n", address);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "cirrus: mmio read - address 0x%04x\n", address);
 	break;
     }
 
@@ -1946,10 +1938,9 @@ static void cirrus_mmio_blt_write(CirrusVGAState * s, unsigned address,
 	cirrus_vga_write_gr(s, 0x31, value);
 	break;
     default:
-#ifdef DEBUG_CIRRUS
-	printf("cirrus: mmio write - addr 0x%04x val 0x%02x (ignored)\n",
-	       address, value);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "cirrus: mmio write - addr 0x%04x val 0x%02x (ignored)\n",
+                      address, value);
 	break;
     }
 }
@@ -2047,9 +2038,8 @@ static uint64_t cirrus_vga_mem_read(void *opaque,
 	}
     } else {
 	val = 0xff;
-#ifdef DEBUG_CIRRUS
-	printf("cirrus: mem_readb " TARGET_FMT_plx "\n", addr);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "cirrus: mem_readb 0x" TARGET_FMT_plx "\n", addr);
     }
     return val;
 }
@@ -2112,10 +2102,9 @@ static void cirrus_vga_mem_write(void *opaque,
 	    cirrus_mmio_blt_write(s, addr & 0xff, mem_value);
 	}
     } else {
-#ifdef DEBUG_CIRRUS
-        printf("cirrus: mem_writeb " TARGET_FMT_plx " value 0x%02" PRIu64 "\n", addr,
-               mem_value);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "cirrus: mem_writeb 0x" TARGET_FMT_plx " "
+                      "value 0x%02" PRIu64 "\n", addr, mem_value);
     }
 }
 
-- 
2.18.4

