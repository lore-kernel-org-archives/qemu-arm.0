Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp483318lfc;
        Thu, 28 May 2020 05:37:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTgNIIzbpZf6FDGK5xGDAoXTnostmPN0fiiPQ0J7fvlBOvhy2yQFexLWGajAbiP36awfaY
X-Received: by 2002:a05:620a:1388:: with SMTP id k8mr2499235qki.216.1590669427414;
        Thu, 28 May 2020 05:37:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590669427; cv=none;
        d=google.com; s=arc-20160816;
        b=sZovhHl2YC5txPagzmLgSMgOnvV4BO4HyqMyjgPOIl3wZ7nubX4un9+uUt1+ScFQLg
         i0IJD116scRhYNHJD6eJqmi2eDO9xyPIDiUAnahdRuCBGCmPAP3FgLzgjPJ4hlAzgAzK
         AU08tPiUyxKvIUCnGzWDDtV4Kk7W5OjYm71l7Lo3pgJGzmrV6KA3rJzVKUalVtlyjKTl
         IuEovGCZqmJnnVQI3bu6GiXfyS3btcJ4h0ttzKEjhND1Vq9S6Px77gfkVr5gQ5wc5TM+
         XIj0poo7tkqZ4tCnYQjCq+1qXuqUDfvgaKcdP8Cno6K9ohcGoyJ3oD4AZHFim/GfHlp3
         JubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gSO6NhcNMiTStuHwRH+gYIc78ZhIvSobrclrvmNcmdU=;
        b=bnTKMztw16YjIt4YqCTBKYa3gEvpJMPFiEmxTqV1RGnNWzdYyyRNAlzOwmFaqg2KkW
         PtFD9quPTg6k8U0uB8NnkJAuIzwJv8cdfC9MuZgAijEFRnZHgCV1y+Rdc1tiUgGzWM3m
         teO3LHyIaTZPgAX6INDOBxeaJd1WemQpnHtRpWse8unAINzUcD6i7LNg4mziK1O9JHmP
         37qNaADANoNUjduHrHjfH6pRLMpBx8L5pTAYgbHh/v/FuErtQOiBbnAPOglYN4D2cEBj
         9BFxk53mR/t1YohgNUS4V7/o1zgRmMn7WmHrwyHFE24l6YB+YQTkcufWz1XsqZpfZR+S
         bUcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZsEnPhfe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x26si3108837qth.367.2020.05.28.05.37.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 05:37:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZsEnPhfe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jeHmU-0002hV-Rs
	for alex.bennee@linaro.org; Thu, 28 May 2020 08:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHlo-0001SK-Gh
 for qemu-arm@nongnu.org; Thu, 28 May 2020 08:36:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40005
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHln-00059F-OH
 for qemu-arm@nongnu.org; Thu, 28 May 2020 08:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590669382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gSO6NhcNMiTStuHwRH+gYIc78ZhIvSobrclrvmNcmdU=;
 b=ZsEnPhfehKWwqh1ZH4RUJzjCXswxX1y4y0cvSwQlD/MzOeYkWeQjPWM2s3G8/qyDfySKPt
 DXU3iwPquasI76z6bdQLe6fjFaNHISGszo9OE/TiU5B/E5tG1zYLE1go2PTwAXZ7IY4hEl
 43UkbyIeIbfZk3EQnK6Frv/vKU/iagc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-Go_BTCXYMAC3E1__ZNjC6w-1; Thu, 28 May 2020 08:36:17 -0400
X-MC-Unique: Go_BTCXYMAC3E1__ZNjC6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2256E107ACF3;
 Thu, 28 May 2020 12:36:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46D087E467;
 Thu, 28 May 2020 12:36:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7DDE09DB0; Thu, 28 May 2020 14:36:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/21] hw/display/cirrus_vga: Use qemu_log_mask(UNIMP) instead
 of debug printf
Date: Thu, 28 May 2020 14:35:52 +0200
Message-Id: <20200528123609.27362-5-kraxel@redhat.com>
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
X-TUID: eDJ7dPMgM5h/

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Replace some debug printf() calls by qemu_log_mask(LOG_UNIMP),
and add a new one in cirrus_linear_bitblt_read().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20200526062252.19852-5-f4bug@amsat.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/cirrus_vga.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 33ccdde00061..f9f837b8508c 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -35,6 +35,7 @@
 #include "qemu/osdep.h"
 #include "qemu/module.h"
 #include "qemu/units.h"
+#include "qemu/log.h"
 #include "sysemu/reset.h"
 #include "qapi/error.h"
 #include "trace.h"
@@ -905,9 +906,8 @@ static int cirrus_bitblt_cputovideo(CirrusVGAState * s)
 static int cirrus_bitblt_videotocpu(CirrusVGAState * s)
 {
     /* XXX */
-#ifdef DEBUG_BITBLT
-    printf("cirrus: bitblt (video to cpu) is not implemented yet\n");
-#endif
+    qemu_log_mask(LOG_UNIMP,
+                  "cirrus: bitblt (video to cpu) is not implemented\n");
     return 0;
 }
 
@@ -989,9 +989,8 @@ static void cirrus_bitblt_start(CirrusVGAState * s)
 	 cirrus_blt_mode & (CIRRUS_BLTMODE_MEMSYSSRC |
 			    CIRRUS_BLTMODE_MEMSYSDEST))
 	== (CIRRUS_BLTMODE_MEMSYSSRC | CIRRUS_BLTMODE_MEMSYSDEST)) {
-#ifdef DEBUG_BITBLT
-	printf("cirrus: bitblt - memory-to-memory copy is requested\n");
-#endif
+        qemu_log_mask(LOG_UNIMP,
+                      "cirrus: bitblt - memory-to-memory copy requested\n");
 	goto bitblt_ignore;
     }
 
@@ -2412,6 +2411,9 @@ static uint64_t cirrus_linear_bitblt_read(void *opaque,
 
     /* XXX handle bitblt */
     (void)s;
+    qemu_log_mask(LOG_UNIMP,
+                  "cirrus: linear bitblt is not implemented\n");
+
     return 0xff;
 }
 
-- 
2.18.4

