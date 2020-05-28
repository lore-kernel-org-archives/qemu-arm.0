Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp488066lfc;
        Thu, 28 May 2020 05:43:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzClnZgP5DU2nWZJC4CansftgcF0eI/5K71hTeuWomqEJqx684fv9+I+kyThGKu/+5rGh+9
X-Received: by 2002:a25:448a:: with SMTP id r132mr5052436yba.277.1590669832752;
        Thu, 28 May 2020 05:43:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590669832; cv=none;
        d=google.com; s=arc-20160816;
        b=rLzKL48M1P+PCiaz7n6Ublgya+qLxvakYitSHXRLbUIqtqg21AvAzjTPG9d1/OPE5Y
         JuG4hmgyJ8n886QMwcNW9NdzIlQUVxxVecQZneSRgOFlnaz3JeBs8fX9LFmeVrf+Vr7m
         0Ch416q5Y4m9BS0ur1A8zMNnO84QQsDDLPVoFCYg7Ov2xt/TXR14+0CTRVy/rGovxXME
         jfa8V3rSNSzqCuGIHa12C+JkA8ZOZ/wzlk43NMUawofjdW9/n+EeglXUQNv+25HVLTuO
         UseI7eLEZ1ijMM/hSuYPrXWV3EDlIz73wD6VU8bNceCRk675jFdSMyPuGiKbDJNhi1um
         0m6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vhaGpItVAJY0Kh28EoW+iZj4wIKFYfoIVL8Ul9ZNK3k=;
        b=HNI0qK+bQd6PK4NhNzOpUAIN4xXh1VoicqE6fEAbzjV5yjbqGAiJqRyTfVcLocZeMH
         Nq29QnFSH4hIfBcMIOaeXHEQGNkfSKFKT7GVTvOzkc2/KOyQVwL8PgcORpyW6CR7/F2g
         5NJaUPtYCumEarRIXZl680gWWW1VO96D1d9uGspXQ6qO4vYMWWYd/lyoYHJYkM/31DWa
         nNK+6XDF56No6MGjtmkcjA3j5z/dT8x5TgtfgKe0gO7txpHDfuaIDUUFLAQ8eBIuQnKB
         8eaxF7b68Cphkrp4HBYOZyhJ3v8Xrxl4sjLRTykzqQ4A0O6+9ltffWzAUVW/L9LmM+ud
         DvaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cfAy0tIY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7si4985811yba.219.2020.05.28.05.43.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 05:43:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cfAy0tIY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jeHt2-0000tl-5h
	for alex.bennee@linaro.org; Thu, 28 May 2020 08:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHm1-0001yE-3B
 for qemu-arm@nongnu.org; Thu, 28 May 2020 08:36:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35769
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHlu-0005Gg-Jb
 for qemu-arm@nongnu.org; Thu, 28 May 2020 08:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590669389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vhaGpItVAJY0Kh28EoW+iZj4wIKFYfoIVL8Ul9ZNK3k=;
 b=cfAy0tIYTQ2UYTplUO9KibPyl3+s45DKtD5nKjUOSFr+QFUJDdLwqJjCxPBdLkiRcAHhAZ
 YGX1yRZ8cjCW/Q8uffStJjViw8v61SieRpjMefdvGKkWd2Z4H0aGOOSCgY5IJjKEyl0sFR
 AgF/k9kvEBu41GOmyD+/BFbzXxee8iY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-613lVL-COoqGZLJCqhXdvQ-1; Thu, 28 May 2020 08:36:19 -0400
X-MC-Unique: 613lVL-COoqGZLJCqhXdvQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D7DC8015CF;
 Thu, 28 May 2020 12:36:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3242A102D;
 Thu, 28 May 2020 12:36:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AE16D9D58; Thu, 28 May 2020 14:36:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/21] hw/display/xlnx_dp: Replace disabled DPRINTF() by
 error_report()
Date: Thu, 28 May 2020 14:35:57 +0200
Message-Id: <20200528123609.27362-10-kraxel@redhat.com>
In-Reply-To: <20200528123609.27362-1-kraxel@redhat.com>
References: <20200528123609.27362-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 03:11:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: drHtMU9yZ/ac

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

DPRINTF() calls are disabled by default, so when unexpected
data is used, the whole process abort without information.

Display a bit of information with error_report() before crashing.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20200526062252.19852-10-f4bug@amsat.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/xlnx_dp.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 3e5fb44e06ee..8d940cd8d1a5 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1,5 +1,5 @@
 /*
- * xlnx_dp.c
+ * Xilinx Display Port
  *
  *  Copyright (C) 2015 : GreenSocs Ltd
  *      http://www.greensocs.com/ , email: info@greensocs.com
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/display/xlnx_dp.h"
@@ -465,7 +466,7 @@ static uint8_t xlnx_dp_aux_pop_tx_fifo(XlnxDPState *s)
     uint8_t ret;
 
     if (fifo8_is_empty(&s->tx_fifo)) {
-        DPRINTF("tx_fifo underflow..\n");
+        error_report("%s: TX_FIFO underflow", __func__);
         abort();
     }
     ret = fifo8_pop(&s->tx_fifo);
@@ -525,6 +526,7 @@ static void xlnx_dp_aux_set_command(XlnxDPState *s, uint32_t value)
         qemu_log_mask(LOG_UNIMP, "xlnx_dp: Write i2c status not implemented\n");
         break;
     default:
+        error_report("%s: invalid command: %u", __func__, cmd);
         abort();
     }
 
@@ -631,8 +633,8 @@ static void xlnx_dp_change_graphic_fmt(XlnxDPState *s)
         s->g_plane.format = PIXMAN_b8g8r8;
         break;
     default:
-        DPRINTF("error: unsupported graphic format %u.\n",
-                s->avbufm_registers[AV_BUF_FORMAT] & DP_GRAPHIC_MASK);
+        error_report("%s: unsupported graphic format %u", __func__,
+                     s->avbufm_registers[AV_BUF_FORMAT] & DP_GRAPHIC_MASK);
         abort();
     }
 
@@ -647,8 +649,8 @@ static void xlnx_dp_change_graphic_fmt(XlnxDPState *s)
         s->v_plane.format = PIXMAN_x8b8g8r8;
         break;
     default:
-        DPRINTF("error: unsupported video format %u.\n",
-                s->avbufm_registers[AV_BUF_FORMAT] & DP_NL_VID_FMT_MASK);
+        error_report("%s: unsupported video format %u", __func__,
+                     s->avbufm_registers[AV_BUF_FORMAT] & DP_NL_VID_FMT_MASK);
         abort();
     }
 
-- 
2.18.4

