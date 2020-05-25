Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1676652lfc;
        Sun, 24 May 2020 20:47:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGXqFlx7IqoPHWmPH7ropmy+Cu/v+4mNzzDAbIBe4wUYZam6Pg6XN3AvAiCRobkjaJJVd/
X-Received: by 2002:a25:7ec4:: with SMTP id z187mr29500410ybc.472.1590378442053;
        Sun, 24 May 2020 20:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590378442; cv=none;
        d=google.com; s=arc-20160816;
        b=I6bPmNpednWOLZv+/lUVRTV7Q/fIOS/34A8gGI1tz71IYpGoQwQoxG7sz0w98GH85b
         QlWZ86TNUxW0f6tmA9oNe6mXbawZ9AaRAWHj3k6xIdWDox4GaUzrfZKzTLktK6ISP2vz
         WgzzzAbf9aHlG0XDeVFFgZSrBR4mab7/LQ3SAtETB4GoOrjEvJMHnUNaA4Qqh6Bs7Jng
         x1MF12JezHa3kwzWw4cqoAgE4NxMOeu4lTW6dwltMalZRc2V/SjTH94hKG/yR6ba4Yfk
         pcENvdd1uUz5EvvxRxqFpe1zkfbb7RGSRhUcLXDXs74lr13SihTrGi0pfqhAP7Y0y/Jg
         I9mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jdIRLwa0ab05Cst8ONtq0+eHOzirKZG9j3qEtBls8q8=;
        b=O8ZN4OLx8MZvayukkP4CdGBRZNy+X430etUR6XsP37eXlzmhSwFF4pAlwNfxqrl1Xk
         BkMRzTITwlfSwUBqyo7aNlIgXv8jBT7axcukaU6pPD0+t5+yrnZd/TL1G4agMpzclkjy
         XSBRfqkkQtkyBnuVVgvBDY3TOcLik+uF6qWN+nabKi+9Yr9PjKeor3gVh3MeLcY9xqvM
         Zs9nnluQNLVRk6w+r0haF3543hB150SsolMfhb90FXEG9DshhA1sl7JH3XLchjhSfCDa
         oavyTlWg3NFH6SlL1T0KPEwJahr1EX7YDDpdbE6mm7Bzmq43STpYa5GAlZ9w7m3goLJv
         FVXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X294QEMQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 124si8005065ybb.178.2020.05.24.20.47.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 May 2020 20:47:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X294QEMQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:52932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jd45B-0001VR-8a
	for alex.bennee@linaro.org; Sun, 24 May 2020 23:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jd42z-00087g-E1; Sun, 24 May 2020 23:45:05 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jd42y-0006vF-PT; Sun, 24 May 2020 23:45:05 -0400
Received: by mail-wr1-x444.google.com with SMTP id l11so15852594wru.0;
 Sun, 24 May 2020 20:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jdIRLwa0ab05Cst8ONtq0+eHOzirKZG9j3qEtBls8q8=;
 b=X294QEMQkIEh2Ns4OZH2+M5N0cNj4/kIgMPBHtRkqsoNlnl4W+Be/rksfUoGGMP8hH
 iIIDHE7f7rvRqgLmh7ehOswMU2vVJNXXBBW6w4T+SlJ+LQBiF2aqpfOS+cIWWJJKxXB7
 o2wFx5/2e0haIiGj07PgRWJqO2rbbNq+mDtuBqitoVS41xPFf6tx724wCuognHbKxIEL
 ag6o0CVPOqK+g8FWA/Oq5IfMqi1S41PhFuTvuDT7E2jS9U1WmGnGZKdBLnvBHRXmriEh
 m0kWXq6thCoP17j52R5NEgEtZajVCR/LrlmfeZJfWi6Y6tZF4fs112O821TaiIlmnNwc
 zEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jdIRLwa0ab05Cst8ONtq0+eHOzirKZG9j3qEtBls8q8=;
 b=TnttYc28Wm9Jn7H1VFzUIUkXfV5z63QrwuPpj9Imcq7z+3kwZKlAG0qFrCQnKefGcG
 4qKYiHNgzZRoaJ97+8jD1sKYxanmeIMLGsoneoSfeSzBPZyw6RGcZNgJltA0QO0ZogSf
 JZp0OSYxscMEex+9yBKIW01EPz6O3JfIKnrop65Vbc1VjKVvEppoYDgeGJYUIiCyTEh4
 myxlCE+NWTMjR8d7FrKnccVfXjV9qr/b0AXvnPMoTJ7NAYb0n2OHzVJHsx/ehdzXdpqE
 XKCOWeVQ8K9T041ZcSlOeUDH2/hyei8xvwxEojf0cDsE2EQlrdBxIELKRDKh97gpQLpA
 IifQ==
X-Gm-Message-State: AOAM531c2wJv40e9NFmvaATo2BQ5JWXDJveEzaiRwon194NuiUqXm8GB
 4PIoC0QIMUb4CizWZiRcfM67Ss4i27s=
X-Received: by 2002:a5d:6a83:: with SMTP id s3mr13612103wru.308.1590378302429; 
 Sun, 24 May 2020 20:45:02 -0700 (PDT)
Received: from localhost.localdomain (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id n9sm17555150wmj.5.2020.05.24.20.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 20:45:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] hw/misc/auxbus: Use qemu_log_mask(UNIMP) instead of debug
 printf
Date: Mon, 25 May 2020 05:44:56 +0200
Message-Id: <20200525034459.28535-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200525034459.28535-1-f4bug@amsat.org>
References: <20200525034459.28535-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7tgD4zgDxsBA

Convert the deprecated DPRINTF() call by qemu_log_mask(LOG_UNIMP).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/auxbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index f8e7b97971..06aabf20c5 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -196,7 +196,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
         }
         break;
     default:
-        DPRINTF("Not implemented!\n");
+        qemu_log_mask(LOG_UNIMP, "AUX cmd=%u not implemented\n", cmd);
         return AUX_NACK;
     }
 
-- 
2.21.3

