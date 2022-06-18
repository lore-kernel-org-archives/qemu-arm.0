Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp669282lfb;
        Sat, 18 Jun 2022 02:02:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1stoCngBolILJU32sySJKueFJG2SGPA2HSpD3CUagSK9zzrM60opBxlkgzwfpkCu932SDEj
X-Received: by 2002:a05:6214:4114:b0:46d:c5fa:bf63 with SMTP id kc20-20020a056214411400b0046dc5fabf63mr11482322qvb.13.1655542942349;
        Sat, 18 Jun 2022 02:02:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655542942; cv=none;
        d=google.com; s=arc-20160816;
        b=Fb7McM10VBMm59T8siix+Z2xo+9Zq9bg3Lst/KsoPMBbjQciPmCWln3z9R+8LM/LnU
         245ruMLhWH8jnnI/n493RdfR+9jHq4CQUI7+ovAUY5sM9SiDQfCQVNqzS7kK8IKxG6nX
         awzUm/yIj/SfQSXb6oL48dQN5SYdccK4APY8HT8mIV5kZOFz7UiFce95dtfaVR2P7YdH
         rr3fDJcm0V6kS5JW3kxb8JlHKrHLbcJZA71vSCL0XNXs4Pibz0+nBhk5gQNuxufhKIqN
         mdwGwRvdwoAlFEqwTInk5gkX23vKKWtULT+m96AbPXHYt7uXgIIX1Zy7mPzTDK2B9WC/
         quUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=63cavFc5cxjvfePJTjWfXSGCWx+MupVUzl1XIVF5GEw=;
        b=yqXcOlqftHsbpPOzKCEjAE1T8U9uxKmKcjuoygnh8AQnRwM+EkH4q8UIGrSz4PJPrV
         HUUZubalDXLl3Ec2dhAlaXoKb9xA1Njh0MChq/Bl8S9LRBI3oWw9RXTQSvq0nAirweWf
         qe30INCs+amVWA9GmpmbRVukO9cb6iIno1NJbdodtiUD8TLw1fD1h8ep822le8D4Pd4/
         0gcPozEcmOS/Wl8Q8i0OGr09PsG2jkVOw/gkH0lV5ujN739C/TCiKsYVzP1MfIwr4d7x
         ywLtUfJswgpaqVc1Mm9jbNWN/0118UguQP4UGNbDNiNyooa99u8+SfAnW2PmmqRrPykM
         P0Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Ydh08QN6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if4-20020a0562141c4400b004645bfe13e4si5013348qvb.52.2022.06.18.02.02.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jun 2022 02:02:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Ydh08QN6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o2ULV-0004eN-Nf
	for alex.bennee@linaro.org; Sat, 18 Jun 2022 05:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o2UKj-0004Zf-6E; Sat, 18 Jun 2022 05:01:33 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:52917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o2UKf-0002bY-Qv; Sat, 18 Jun 2022 05:01:31 -0400
Received: by mail-pj1-x102a.google.com with SMTP id p5so303586pjt.2;
 Sat, 18 Jun 2022 02:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=63cavFc5cxjvfePJTjWfXSGCWx+MupVUzl1XIVF5GEw=;
 b=Ydh08QN68JZJXUcHfV7ObXi6L4hWXU9PIuqRb+QSAOo5Iw6Ilvg53mDOXIUToPHa0T
 D9ALNxIZ4tMVPCpVbiOpnnfMwHlzY0Vw6hB5XCZRF1cvwY88AvdlltjW2X2fUIqyNlBy
 s0fu9fAJngf/ruidYt0YQ4jWnG0atPpdk/+tJTau0r75fP7cZgopFXnYmnrMWgRTD4r9
 szYbXxFaDjogpJhwHze0zj9fj9Gmm7QC9psHXQK+rHxtepG6R5yvJvfNt3KphXe1ltzl
 6F0sNS+Vb6zeG+FB+XDiwkFwsTF/sZlOTUPk21NPaWb/Wa9+O0EwpJv9xp0UDYeC4JOw
 fyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=63cavFc5cxjvfePJTjWfXSGCWx+MupVUzl1XIVF5GEw=;
 b=PeEj0jp7qh5htrb9/4Q8YvdOMZxtCAtwVa3Jtqn6AabObEsj6YBW0X/Dx3fBo9MgIN
 890b7pX1QZO2kmFyAumJVaQe+ejL3GMrrhg7cCpgKvVY1rFLO5hjjAW24yaqzSF93FwZ
 AvPr6pbf7prhTROyASPs1EvWVPkqMBK/IHm5Q1wI/P9pvMTxnd9JZq/mD2bIPXUCDDEV
 yPPnXDRQd9uYHwgyfgM6k4dq7xiiYbDX+tVUicVJsrZ2Q8gC1niEKf+xhbgzipn06NEV
 6PtBwTb34zWw+4DRuitN0rBLTARxtRDG35zinC8AkisJdW0eyA42ka+BwIa2CgiiotI+
 dYrw==
X-Gm-Message-State: AJIora9QD6khUAvUrzZKZd/EJ3FKfljBcR0K0+fxjrR2KTCXxGEp+OeX
 0ZJqGlMxpsIvOed0j4vGVKo=
X-Received: by 2002:a17:90b:314a:b0:1e8:5362:5620 with SMTP id
 ip10-20020a17090b314a00b001e853625620mr15377190pjb.9.1655542884662; 
 Sat, 18 Jun 2022 02:01:24 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a17090a530400b001e0cc5b13c6sm6783622pjh.26.2022.06.18.02.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 02:01:23 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] aspeed/hace: Add missing newlines to unimp messages
Date: Sat, 18 Jun 2022 18:31:14 +0930
Message-Id: <20220618090114.3158904-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 03R0YiqwvNk+

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/aspeed_hace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 4b5997e18fad..731234b78c4c 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -340,12 +340,12 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
 
         if ((data & HASH_HMAC_MASK)) {
             qemu_log_mask(LOG_UNIMP,
-                          "%s: HMAC engine command mode %"PRIx64" not implemented",
+                          "%s: HMAC engine command mode %"PRIx64" not implemented\n",
                           __func__, (data & HASH_HMAC_MASK) >> 8);
         }
         if (data & BIT(1)) {
             qemu_log_mask(LOG_UNIMP,
-                          "%s: Cascaded mode not implemented",
+                          "%s: Cascaded mode not implemented\n",
                           __func__);
         }
         algo = hash_algo_lookup(data);
-- 
2.35.1

