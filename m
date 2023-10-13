Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1333666ejc;
        Fri, 13 Oct 2023 00:59:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFenoXsbBWZPhVQbbhZGbcSvCOyHqK42zlPjUM6nQVXbVGeNmlxlEeKNShGahFpKULbBOsJ
X-Received: by 2002:a0c:cb8e:0:b0:66d:775:d1af with SMTP id p14-20020a0ccb8e000000b0066d0775d1afmr6612727qvk.59.1697183966775;
        Fri, 13 Oct 2023 00:59:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697183966; cv=none;
        d=google.com; s=arc-20160816;
        b=1JQBPp7635zBP+PH5PZ8kCn5pPbdCArMR7H2dc50LgWPa4SoaHm8k8Mq582nOjgrKg
         4jRdLd26jUb/rIeFsx1lRl79kgeFmsIEQyUptfsUoCCGDXrtrhBeVzzu88yqH9wCxERB
         2pRYtDLrN4tAZRovopgukOiXjfBCzG47bT8ULVYQfsKkHsJfhfextiO1nkqARJfyBoGY
         Zy4nn5QOmpRvflEmZu17Y7XhfgeVR3q/biOelbyMkNuNdQUoSNKHRl2OZjSeaQmdtT2X
         4Ik637FPAPN8iRgnxxqI/rqaiy8eZpEYLKeluYS2HRZ9sCtcuEK/i9vda+kz9KinKuW9
         B+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=94FOLE3AewODflMphRBNbnkQLSI+z+5hLHjG8ZH95+c=;
        fh=+ZsZUTuyxoQ5ZtM1/3hdknpz4V7RB/CRpE4IdMKqcXk=;
        b=tMECzI6DJFNVlARyuWWhkvqMz3E1lEdrppgN2PALr2w2iMFNSsKou9sAKA3a5MT6K8
         m40WCJCqlFw+T3+PK8RrZ2f1BquWOeVbqTYfQy5ziD/iUp+oxVFMRQLebehRMJEHo35K
         /h+fc0bfYtYZZmeW57Zo6joAxaBU0q5lFdBXv+2CdnsvP/EO0w1fUMBgAy1VCZIHxqYm
         UfCg7HjiUzYbQX/92u1ABtEIeqMTEFb5k/ECpXx75PD2qF7l9lA+6OU1B58BvggrANWM
         JEV3LJ78tllGqvCZFhZy6g+t5iFNk/w2J7aMRQ/XgPjaCdl2f9RTsTUuX06E+Uvsapho
         HYvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rd+JNnji;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10-20020a0cf8ca000000b0065b05c4da3dsi820580qvo.561.2023.10.13.00.59.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 00:59:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rd+JNnji;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrCxq-0000oN-FX; Fri, 13 Oct 2023 03:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCx2-0006Mi-7w
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:51:16 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCwq-0004ww-IT
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:51:15 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31c5cac3ae2so1646836f8f.3
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 00:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183463; x=1697788263; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=94FOLE3AewODflMphRBNbnkQLSI+z+5hLHjG8ZH95+c=;
 b=Rd+JNnjiT9hmYEnHXiJrJRCJvmPAxZUc2Pn9mmmFPJdixmn3Qo0MlG6mWEITR0nQAn
 q4YlHOMIewfGqhdZXoOurBemBk/0i1oJ8G9Krdp8wR5MJPjSf7BV0u6FXHqVwc/BbLyJ
 H11R7xmwSB6uCBaU4ZciEDi+e2YedGfHBmYxIkJlm0HQvgA1ajDR1Qt4HPRddUK7mfz1
 w36A+ofmOCgyrAYelrWLMIwauw1Z3WDz+JBj1n522UpxEm23hTrr9wnntAgtikcXyWnV
 OG1BmtHbj00z56a0VShSmAN9eEDrYNq+ATbulyXB/6VUQOJmJXfV3uoGFLFgiSSFPzRD
 HitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183463; x=1697788263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=94FOLE3AewODflMphRBNbnkQLSI+z+5hLHjG8ZH95+c=;
 b=k8DFaSn3RNUY3O8CDP6qNzoSxNNJi6tkbBK7zNwiRYALtGBava5QV6OUs5KOM10FeL
 EJy6sPN8V4MpJHUAm6BnF6xgXxx1LhOBb5REKAPbCVL2IDzJWe3Icvmv5YH8hgZj5AsN
 IV4ncaKKF4E+QdZSFy8AlggmO+eMLDkEMp7yaGomiViZelwccIM0ACsH0020anElJ/vG
 jgB6EPrqZ77B74XxrY1g9yDkWjG5avapKyDFbJ5+RtEzaBaCKEl3g1o7wFLO6nJ3tmEF
 1Xx4fhW40/46jt1GSHCMGVOIoVD0BvwO41XkMsr26993bWl3qOk0KgvcUMKtoQTjJcue
 bawQ==
X-Gm-Message-State: AOJu0YyuUJbn5zH5pOo/MCU5v+FGWf4cPs3wuHwgqy9zesA8/yOb7aKr
 8xDwuR+H8HBQfuM0AjWTGFydIA==
X-Received: by 2002:a05:6000:614:b0:32d:8c7d:a13a with SMTP id
 bn20-20020a056000061400b0032d8c7da13amr5054363wrb.18.1697183463114; 
 Fri, 13 Oct 2023 00:51:03 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:51:02 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [RFC PATCH 38/78] system/rtc.c: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:47:44 +0300
Message-Id: <fd4aa9a42a7ec65acca8836696bb5a8c8215c88c.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: TX8nb6Jm2eox

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 system/rtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/rtc.c b/system/rtc.c
index 4904581abe..bb406542c8 100644
--- a/system/rtc.c
+++ b/system/rtc.c
@@ -48,22 +48,22 @@ QEMUClockType rtc_clock;
 /***********************************************************/
 /* RTC reference time/date access */
 static time_t qemu_ref_timedate(QEMUClockType clock)
 {
     time_t value = qemu_clock_get_ms(clock) / 1000;
     switch (clock) {
     case QEMU_CLOCK_REALTIME:
         value -= rtc_realtime_clock_offset;
-        /* fall through */
+        fallthrough;
     case QEMU_CLOCK_VIRTUAL:
         value += rtc_ref_start_datetime;
         break;
     case QEMU_CLOCK_HOST:
         if (rtc_base_type == RTC_BASE_DATETIME) {
             value -= rtc_host_datetime_offset;
         }
         break;
     default:
         assert(0);
     }
     return value;
 }
-- 
2.39.2

