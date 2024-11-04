Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2002373njc;
        Mon, 4 Nov 2024 02:16:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV9+Ih3N8V0Gy2PzkRG4N7ejvKNqdv6VD52Mf9PGnMegMDmvYzH/hDR4OOt1grn+XL1nYHgERCeCq5UFw==@linaro.org
X-Google-Smtp-Source: AGHT+IGfEzNWF/tR+JjAsaS3tTVpWufAn+PokZLj2gc3hFdpFG4G0IQcCMbE0RiwndGgER0WC9Du
X-Received: by 2002:a05:6214:3bc5:b0:6cd:f0aa:2967 with SMTP id 6a1803df08f44-6d1858635aemr441260546d6.48.1730715416569;
        Mon, 04 Nov 2024 02:16:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730715416; cv=none;
        d=google.com; s=arc-20240605;
        b=cOoiOaaPtxUF0cTjnFRr7HaDXO5LfRi/dDBE/HC4Yg/X2OlR5V25ppf9aavO/T5mgx
         w77wNgmkLsVavbzCh0+iu3UYpx8hjelvuA73Zg102WmpL3JIEtI/K+utDW7qNWPQnXva
         s6Itjf+e8o1wv/cOxXRJaVqwjRXMGjhiK9+uRfligpOdKko892pOqo68MtITYzb6via+
         KMPHjZ71VBmKFoiqCQgA/zk48Brj7hQgTNDPDc4X50lLhJnnFvdmhinZLeFbwSSIo2CY
         lH0BchJ4y6SPEqoDQMO73B2adkPzca6cdh7bG6inTayYKFz7jmJftkD0Rxnxt3QX0yYq
         dqEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XDWTCwsr172GMIVIz46icHB2vfgXzk9epA3gt/SWP/A=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=bZCBOx91Di4IC2Se6Wn900qoH/aJMnUZm3ymCmKIANTHBgj/rBZ4KOkgdcoq7Lgt7F
         SuVo5+9+UPDBpXyQUlwgjvez0rOwMBUngLXoLV+IQqbAYY2vQ1WFVVsoNhMymKh0PK41
         MCbkKF/36ah9WcbxNTyRiprWJgaelZqYFb282XUNtaczvhLljfxoOyRT8h+rJ3S6mPD4
         ZVquIX/5OMJ+SY2vD9QiluTwlebG2Qr4vKgF+7tw4695hgiVWBi6oViEhjARS2CFgQBH
         2BwncoU9crpmuAqzM4MmyYCUUF//jocxzyF9jJShSodcJ3f9KRCy6O+7JvBXK6Io9i2y
         cWBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gRT9e7qH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d353fa9fc3si104170546d6.16.2024.11.04.02.16.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 02:16:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gRT9e7qH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7u7k-0000oY-Fw; Mon, 04 Nov 2024 05:15:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t7u7S-0000mU-Un
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:15:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t7u7N-0006bi-As
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730715328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XDWTCwsr172GMIVIz46icHB2vfgXzk9epA3gt/SWP/A=;
 b=gRT9e7qHDEPNtIuB3MBNgjKZAlALJxntKsytO3bOJK9J613cHyh6VIupx4gvjmAgTM5O6A
 7dvfnAN3UbpOd8ltWKQvvqUT3BwkZ4Om4uraAXUEvW5++UfF7Ew3hPE80BxwZ7lRIVfGLp
 OjVmM1+FIf+Xvuh+lCCzV4FABD9FIdA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-499-hFocdE4iMJy70iZK2nGKUA-1; Mon,
 04 Nov 2024 05:15:27 -0500
X-MC-Unique: hFocdE4iMJy70iZK2nGKUA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7E0D0197702D; Mon,  4 Nov 2024 10:15:20 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.67])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2456E1956056; Mon,  4 Nov 2024 10:15:17 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 06/10] hw/timer/aspeed: Fix coding style
Date: Mon,  4 Nov 2024 11:14:57 +0100
Message-ID: <20241104101501.2487001-7-clg@redhat.com>
In-Reply-To: <20241104101501.2487001-1-clg@redhat.com>
References: <20241104101501.2487001-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1GzrTiJecKZ1

From: Jamin Lin <jamin_lin@aspeedtech.com>

Fix coding style issues from checkpatch.pl

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/timer/aspeed_timer.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index b1f860ecfb80..5af268ea9ebc 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -276,7 +276,8 @@ static void aspeed_timer_set_value(AspeedTimerCtrlState *s, int timer, int reg,
         old_reload = t->reload;
         t->reload = calculate_min_ticks(t, value);
 
-        /* If the reload value was not previously set, or zero, and
+        /*
+         * If the reload value was not previously set, or zero, and
          * the current value is valid, try to start the timer if it is
          * enabled.
          */
@@ -312,7 +313,8 @@ static void aspeed_timer_set_value(AspeedTimerCtrlState *s, int timer, int reg,
     }
 }
 
-/* Control register operations are broken out into helpers that can be
+/*
+ * Control register operations are broken out into helpers that can be
  * explicitly called on aspeed_timer_reset(), but also from
  * aspeed_timer_ctrl_op().
  */
@@ -396,7 +398,8 @@ static void aspeed_timer_set_ctrl(AspeedTimerCtrlState *s, uint32_t reg)
     AspeedTimer *t;
     const uint8_t enable_mask = BIT(op_enable);
 
-    /* Handle a dependency between the 'enable' and remaining three
+    /*
+     * Handle a dependency between the 'enable' and remaining three
      * configuration bits - i.e. if more than one bit in the control set has
      * changed, including the 'enable' bit, then we want either disable the
      * timer and perform configuration, or perform configuration and then
@@ -582,7 +585,6 @@ static void aspeed_2600_timer_write(AspeedTimerCtrlState *s, hwaddr offset,
     case 0x3C:
         aspeed_timer_set_ctrl(s, s->ctrl & ~tv);
         break;
-
     case 0x38:
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
@@ -623,7 +625,8 @@ static void aspeed_timer_reset(DeviceState *dev)
 
     for (i = 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
         AspeedTimer *t = &s->timers[i];
-        /* Explicitly call helpers to avoid any conditional behaviour through
+        /*
+         * Explicitly call helpers to avoid any conditional behaviour through
          * aspeed_timer_set_ctrl().
          */
         aspeed_timer_ctrl_enable(t, false);
-- 
2.47.0

