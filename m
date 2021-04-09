Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1208430lfr;
        Thu, 8 Apr 2021 23:36:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRw6QlfpU7brr8yswhSjm6YRHFn166QGPkDOQfbyJ5T+rAaABPiWHx5zlmieAah9YSkM1o
X-Received: by 2002:a05:6638:14d0:: with SMTP id l16mr11860415jak.41.1617950205537;
        Thu, 08 Apr 2021 23:36:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617950205; cv=none;
        d=google.com; s=arc-20160816;
        b=eX6UrxNSVE+oorTvEyVvVMt0CY3cQ9DNrVddGNeU8T6HBSPntk9E1KEokGdp8Yh5rE
         9ZPE4SRLbt0UR5WCWwCbqnw9lpUF/UdhjQxbWTZBfI1RkCvW61r7vxl7dF4eyexbrC5g
         KveoZ4uRBQ08VgX9tU5FTM37QhziGi3NAoanv3MGJF7btl9xabH0MZMQeCVcJxOrPExR
         Ch+bpVjTpqzBHRlMpfyMsv1QsXxwG6G4k8HTeuCTiCDifZaCoO/RD/EzDghRnTJG2Upb
         HP/hoMSRGToe5DlM3xkUBeK5o/XtT5wI3ay0gvYR/D/4wYLTUleRv5XAyCY4HIplZSaq
         H0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/OEqLEQHCmytseRt1FhXxp+Rob399wNsde0XeRnkGgQ=;
        b=sjip+gKNN4bEw/TjBSgzDrUE8yIe3g+VE3xQLNNralxG2tLsVBYweWnl+tFNE+x0Fn
         UFVerLLFx97ROE7rxIKdW80X8epUckiZ9TYEYcT/5RpVq6+xetuv8gzIf8rK06fu2IKP
         YNxVg2hK6mJDB5dak/3/uiLeWh3Hg1P+X7ZupEKGAta6fvwn9ySH3J1VtUTLE+Z1XfBe
         WuPPTnFHZ9mBUofgvCaCwP90ATFiGzO8cXCm9igLxJ+XyqVb5RC2k45bpBvWcr0C0oUS
         /ll4pfMsGGg82ENuYGNOZz3u8T0IpfOoE86kdZbSEwtmY9jXFI8sON20A1m5g24rMn6q
         rXxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ltZ+3820;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18si2166621ili.52.2021.04.08.23.36.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Apr 2021 23:36:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ltZ+3820;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUkl2-0007NG-TN
	for alex.bennee@linaro.org; Fri, 09 Apr 2021 02:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkZM-0004ff-0c; Fri, 09 Apr 2021 02:24:40 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkZJ-0001bZ-Rr; Fri, 09 Apr 2021 02:24:39 -0400
Received: by mail-ej1-x62b.google.com with SMTP id mh7so6822290ejb.12;
 Thu, 08 Apr 2021 23:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/OEqLEQHCmytseRt1FhXxp+Rob399wNsde0XeRnkGgQ=;
 b=ltZ+3820lLw6oC8xOjK05tEQA2ZV7Fjzd8OCarI9OfHsTY+NUKyaoYnOxRPhtsSRQm
 8uGBBx3oMvSTowr3SN33+jgx5Wp+bCKEKx4LqgyNCmlQISba3rl04LV+cot9vw8rNO92
 NobHeCeMMbo9VZFaZZl3Foopgh42a555jALD5/rqJ1fO7k8VwVdoQ3IRh/30Mcwor4l6
 sRCR2ONs8ovaSJGtwNawSnhFxVgd9K4ZdP3FI1t/ZDtpy9z4m8mhy5kkFLr5YpwoaJeF
 Cbd9OTiZCfRkCWBGki4i8JE31x093/IQUIwLmvu/PnzjT6F4BSZwXsK+8KVHL+wHyCBQ
 EHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/OEqLEQHCmytseRt1FhXxp+Rob399wNsde0XeRnkGgQ=;
 b=WMkVUPNypia5wYXssGgnQKJugGjE7XUurjxu74acreS70t9nTBrRLWZabwP4G7I0bm
 IoQCxpD8T3Y2V5vpnW/L4sYOUMETj0QZ4UGSEfvBQpLGEby9V5Jr6THlaXDloPk8Lvl7
 okLtYThEujMisblNYaWNo2lOsbQ2YWwVFzk11p1syXqd+rVeJOw+HKkgGOXXV0wJjHp7
 wzyafrXnrNN5SsCbXWtkqhWveOGv8gNwgwRdO7/7OzXklzv73L8NtYpS+m1v7yjfXBLN
 oSEiFB8jouCwhcVBL9xykSZZGnNzgvjVUl4eAZbvv2z5FGELkW5PiUHF5WtHOkQxuGtu
 F5ww==
X-Gm-Message-State: AOAM530dypJuvtEwn80wHsqMFxgTWCrkKXI/81k+hKpxC5vI0UoyhVhl
 9gy2h1rGrappENpXXE2MmuAF2cBlWey2EA==
X-Received: by 2002:a17:906:170d:: with SMTP id
 c13mr14302431eje.491.1617949474885; 
 Thu, 08 Apr 2021 23:24:34 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id ay3sm845372edb.2.2021.04.08.23.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 23:24:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 6/9] hw/misc/bcm2835_cprman: Use
 qdev_ground_clock() helper
Date: Fri,  9 Apr 2021 08:23:58 +0200
Message-Id: <20210409062401.2350436-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210409062401.2350436-1-f4bug@amsat.org>
References: <20210409062401.2350436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DvaqlYjbhGch

The ground clock isn't really an internal component of the CPRMAN
peripheral. Use the qdev_ground_clock() helper to access the board
ground plane.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/bcm2835_cprman.h | 1 -
 hw/misc/bcm2835_cprman.c         | 7 ++-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/hw/misc/bcm2835_cprman.h b/include/hw/misc/bcm2835_cprman.h
index 3df4ceedd2e..2996ccb4632 100644
--- a/include/hw/misc/bcm2835_cprman.h
+++ b/include/hw/misc/bcm2835_cprman.h
@@ -204,7 +204,6 @@ struct BCM2835CprmanState {
     uint32_t xosc_freq;
 
     Clock *xosc;
-    Clock *gnd;
 };
 
 #endif
diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
index 75e6c574d46..5039b7632b4 100644
--- a/hw/misc/bcm2835_cprman.c
+++ b/hw/misc/bcm2835_cprman.c
@@ -678,9 +678,6 @@ static void cprman_init(Object *obj)
     }
 
     s->xosc = clock_new(obj, "xosc");
-    s->gnd = clock_new(obj, "gnd");
-
-    clock_set(s->gnd, 0);
 
     memory_region_init_io(&s->iomem, obj, &cprman_ops,
                           s, "bcm2835-cprman", 0x2000);
@@ -697,7 +694,7 @@ static void connect_mux_sources(BCM2835CprmanState *s,
 
     /* For sources from 0 to 3. Source 4 to 9 are mux specific */
     Clock * const CLK_SRC_MAPPING[] = {
-        [CPRMAN_CLOCK_SRC_GND] = s->gnd,
+        [CPRMAN_CLOCK_SRC_GND] = qdev_ground_clock(),
         [CPRMAN_CLOCK_SRC_XOSC] = s->xosc,
         [CPRMAN_CLOCK_SRC_TD0] = td0,
         [CPRMAN_CLOCK_SRC_TD1] = td1,
@@ -708,7 +705,7 @@ static void connect_mux_sources(BCM2835CprmanState *s,
         Clock *src;
 
         if (mapping == CPRMAN_CLOCK_SRC_FORCE_GROUND) {
-            src = s->gnd;
+            src = qdev_ground_clock();
         } else if (mapping == CPRMAN_CLOCK_SRC_DSI0HSCK) {
             src = s->dsi0hsck_mux.out;
         } else if (i < CPRMAN_CLOCK_SRC_PLLA) {
-- 
2.26.3

