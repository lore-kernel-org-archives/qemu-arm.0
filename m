Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp549299lfg;
        Fri, 30 Apr 2021 15:24:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIQWP4nI5768u2yjbtnHoqz9NEComB3vghLE9TJEV9YeKpMnNcTed/Q1DziaaOfYxnyBNq
X-Received: by 2002:a9f:2d95:: with SMTP id v21mr944942uaj.121.1619821444523;
        Fri, 30 Apr 2021 15:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619821444; cv=none;
        d=google.com; s=arc-20160816;
        b=K2DxTpqcW7HH4jLzvOrHtJx5Q6lGteYS2V8yTH4wGnZKAyOoom9/6TjT0zPK1gz/xw
         OmluL1RglPNpcNEYZizyZwbLJVi7jDpnJbdVtlp/1i8zk2JnHRghbq0Ymej4fRGaNsA8
         q+TIHWMbpF210a9Im68QNMQyaCOqKCydGpnw2c1ifalgnTYUo53CcdIl/Xdy/H+nZsgo
         mnwIYUK/SXbid/MonA4D0ruDOl466zEncbdt/wfIRjTfeyZpj/R0EvJUTpEOZCoqZJET
         lxdUxqUr5NJESq7WdD0ThLJEH0pYzxR1/Y+3R5UCL+p7Y8GASjm8A/ANQDWpLN8lzovj
         mGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=U+20hUiagOV8D+dhZIu/lGuSxoJFQH5E6+upCy4ag+4=;
        b=C5JO7pDDhzXwRS5Mcje46+s4OnTIOgZx65aMFoaTmxAd+24o0eypwh/QI/jyq0WE4d
         +o18050olONn6liORLKDpjXtQ8KN7ozki1FGb24nMDsYf8WwIhkPN20kbI30PxR1q0Ab
         uc/vlrupPvlCllLaa7QNpK7XxnvXbNpqi4HX9M4WuqvhDp9SaD98q4YW8o5Gb4Sz11RQ
         1//RbsWPua3Dfz08dAX1E/eaK+8cF06V4aEI6emonb/ETZxdNzihbN2tp9CttRk/Bs8x
         XJqjKLHuBxNyqW8snnvwl7DBC2pkxt8/98tMAbEnkDJwsakpRMyJPjvnsa8FqUTMfup8
         y1jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DUDhqmD8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 125si1973239vsm.161.2021.04.30.15.24.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 15:24:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DUDhqmD8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcbYJ-0003H0-Pb
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 18:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcbYA-0003G2-Fs
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 18:23:54 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcbY8-0005dr-22
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 18:23:54 -0400
Received: by mail-wm1-x334.google.com with SMTP id n127so26770594wmb.5
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 15:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U+20hUiagOV8D+dhZIu/lGuSxoJFQH5E6+upCy4ag+4=;
 b=DUDhqmD8zgoZstFcUG323aqCjVEIQhrsA0NCP2lyR7DyAuW4KySlkcgETz2B7uuAiA
 uwbL166GuBUwP69XZG/foYWjGb+NV1bCglt64Q4Qrj+EbYFCd642R8Nsu3OpJqqFG8OR
 OKilsSSSTPcpDbcKnOr+YS80Y3bVu33dm8ib6ht5C7Wwhtb/5ldpcBTLC13VP+FOnnih
 RuGCrSmF2+3ApyyWqtNn+Ssd7xFMh9dmmJZzFY50ug7RzcwHUlDMaHQb+ASn4tg6vs2k
 32OQlZv0QQEQXzDqA6Uh4riGtJc+EyaS6OcRb1Kq7LtDtasKja2SHeL6lxy4Y6gCeh9e
 GabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U+20hUiagOV8D+dhZIu/lGuSxoJFQH5E6+upCy4ag+4=;
 b=RwsUPK/9SUcjJCanz3JWk5xTGrm+s194MyKpHV6x0RtSSlbh2NRgH70e6DmZC0FouZ
 OnSxy1jfHqYufKap3YiZtsjwjNKQBKMdCLRShcP089e0qow++Kqlxw4VGWUeWBkxkwlJ
 zBdp3PBFEwTYt/nz/mdsJ2NDMqkLs0iPBzy7Bdt6zaIAqJcm/J3Brj2ViIK8hhBUU9n/
 8aEAs7iTUgGagOFb2opqdGMW59S+ILbiXo/QrkR2Kg8I9FrMqQPFUBSR9Rg1b1vMp/Ah
 DjLhX5FAMGuXgTMdLfMK41OFG82+TPQQvOqpF3Lobkyt5oDTgq7pFI0IU51pTacrfWPU
 YV2Q==
X-Gm-Message-State: AOAM532irnxuqqkyLF5OBdHkhNyQNmSZE0aMxS35hLSSrCqhnJ0IC6NJ
 tr81iOWZMWEFvOknNP8zEPet2XY2PJnrRqyq
X-Received: by 2002:a05:600c:b4c:: with SMTP id
 k12mr18949797wmr.186.1619821430395; 
 Fri, 30 Apr 2021 15:23:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p18sm3719208wrs.68.2021.04.30.15.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 15:23:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/sd/omap_mmc: Use device_cold_reset() instead of
 device_legacy_reset()
Date: Fri, 30 Apr 2021 23:23:48 +0100
Message-Id: <20210430222348.8514-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H/bMY5gTV4wG

The omap_mmc_reset() function resets its SD card via
device_legacy_reset().  We know that the SD card does not have a qbus
of its own, so the new device_cold_reset() function (which resets
both the device and its child buses) is equivalent here to
device_legacy_reset() and we can just switch to the new API.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
cc'ing Markus who was interested in conversions away from
the legacy API. As warned, the conversion patch itself is
not very interesting as the difficulty is all in confirming
that the device being reset has no qbuses...

 hw/sd/omap_mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index 1f946908fe1..b67def63813 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -318,7 +318,7 @@ void omap_mmc_reset(struct omap_mmc_s *host)
      * into any bus, and we must reset it manually. When omap_mmc is
      * QOMified this must move into the QOM reset function.
      */
-    device_legacy_reset(DEVICE(host->card));
+    device_cold_reset(DEVICE(host->card));
 }
 
 static uint64_t omap_mmc_read(void *opaque, hwaddr offset,
-- 
2.20.1

