Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1768996lfo;
        Mon, 7 Mar 2022 12:15:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6Yo87fMQY6JqGjJgvSF0bdH3f2jwKZULnRmCcfqD9EF37Ipg5NVkwW11r1OHEoavBHUoc
X-Received: by 2002:a05:6902:533:b0:629:52d7:e4ae with SMTP id y19-20020a056902053300b0062952d7e4aemr4115487ybs.601.1646684108083;
        Mon, 07 Mar 2022 12:15:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646684108; cv=none;
        d=google.com; s=arc-20160816;
        b=uBpl5Mg8CW0KIe12dzuIfjVjtGwLB6AyNmeDAY40o2zkUQS/716TNf1pRLK2oPzS9Q
         7wTCQdwsgMR6Sze6ENzkiNnne/+z83iLfGBbCkG74pzKX+35HVqePV6816b1jjzGKK2c
         +X2nSjtljxBaKotfJGk/lBZeRAAYFnAyXAAdGy/eRfFgbc1aeI8odPzxQx92JGC7b+l4
         W6Dd+vm0uCvM0P9+BchXneoH8PJ1aR5UFtrdtMoyzEpkh5c0+DWVptmPN9joq2s5tLqe
         OU0fDsZjn2jBCVYFLD5mfFnOjGmSCMC/MCQl9eIIwRrkaxD9myV7Jt6R0EMSDh94+2wC
         nM0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=C1QU/XG0WjYMmOuB0Sr7RgGJYPpVOPbbX4rLSKFUlSI=;
        b=TWe8411aXfldVj8cg/CXvR6QsGGO+oOleTFq/aFQFU9TLF+IzNYjEsCS29sqCGjkLu
         Qo/LRlDpIfrMzvJjqilzkQePmIhQW7aDVO2rIDy6PiODT42IRZwUJytan8zmi5gSbcKN
         zxN4RaWj2dZ7EJFbBwX6DSUkggEOY2BD/N+coDrsXL33mQJIgluu5uBLN0YXh+DJ/ltO
         SNjExBR5vCdsc/CNZwU0B53ONnbvZEsPgFu0FaMGeGhz9yH3nG6PgsV6dtCAjJ7yfJxx
         i3aYt62oWOVkcLiGBozxefNx3KBgsZgdVyhIjQJd0W39Qv3u9uX5jb2g6eV3cWX+0bL4
         twyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=dTbZYyaB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q62-20020a818041000000b002d6168e34a5si8508136ywf.172.2022.03.07.12.15.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Mar 2022 12:15:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=dTbZYyaB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:50952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRJl5-0008Vn-GK
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 15:15:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <33GUmYgYKCFkK9KLJI7FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--titusr.bounces.google.com>)
 id 1nRJkk-0008Qr-2D
 for qemu-arm@nongnu.org; Mon, 07 Mar 2022 15:14:46 -0500
Received: from [2607:f8b0:4864:20::349] (port=33770
 helo=mail-ot1-x349.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <33GUmYgYKCFkK9KLJI7FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--titusr.bounces.google.com>)
 id 1nRJki-00073s-P7
 for qemu-arm@nongnu.org; Mon, 07 Mar 2022 15:14:45 -0500
Received: by mail-ot1-x349.google.com with SMTP id
 w21-20020a056830061500b005adc1eb0013so13939627oti.0
 for <qemu-arm@nongnu.org>; Mon, 07 Mar 2022 12:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=C1QU/XG0WjYMmOuB0Sr7RgGJYPpVOPbbX4rLSKFUlSI=;
 b=dTbZYyaBO0lInfSz39p94rFrVu7K3EIittObjn0BlWf0jJg9rmlvsIOVyuPm0Gj9c2
 I0VS7ybCGUSWfOkOqjehQZsg+JkKMLsA4nEkVmBoJCebSYVKTqk/sFQVgaZJ3KVdIFAt
 pZuIM9tM6kHpZiDjA+/jeG0ddEM2Ot32+N1JRIR6OJ0hCc39u/sGjYh1nBCYabWjMRyj
 NFHF8gTw32ZgQK6cV/UJUPbbcS/sXN2JzAf2I9sx3hbMeSM1dfpubgmSTAdhR/9ev3jG
 NDSv4Sfuwv4ftgsrzmq/raDDBDL5FdgtIYBrJ6dcMiqB6T/jWzeBqduEdvX/+qXFCiIe
 Hrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=C1QU/XG0WjYMmOuB0Sr7RgGJYPpVOPbbX4rLSKFUlSI=;
 b=M5IonXYffmdfgK8E81zzQtqJItN1Up2QSnzQytGLKdJDA1XZ4f/OroifT0Bv/VHmKO
 y7HOxEn9OposGJTPNz9n93Glt/SkwUnyJGFSa9ct5zbttoXivyaTa81aet+Y06gHpJAX
 JaV2ZleDuxh1TvNWi7CS/wp+CA1k8cmXnAy7evR6Qwsh1bU2P7qtryPhiuAEEPFsDA/D
 b4CkRtQwEBPRryENlkBtz7yOsZKx+Mjzhzcgix2NVvsMl7tyziUdCsYN9pd40OzdPg9z
 vIKjK3VjvrKkhIJ23GYrs9iJkZqRstxRe3gUKO6k4UddYvXeCMh/RqxggL2qXfUTxnVY
 mjuQ==
X-Gm-Message-State: AOAM531eshjOBGKaWJxFrw06GkDn2WazJkXvN4xNOpDmGja02gp6bdj+
 4XOtsu5lVJZ1nz0fek5YJHuEfQi8e08=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3c4a:fc8b:1418:53ce])
 (user=titusr job=sendgmr) by 2002:a25:2c86:0:b0:629:1915:3bbe with SMTP id
 s128-20020a252c86000000b0062919153bbemr8540178ybs.49.1646683612671; Mon, 07
 Mar 2022 12:06:52 -0800 (PST)
Date: Mon,  7 Mar 2022 12:05:59 -0800
In-Reply-To: <20220307200605.4001451-1-titusr@google.com>
Message-Id: <20220307200605.4001451-4-titusr@google.com>
Mime-Version: 1.0
References: <20220307200605.4001451-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v4 3/9] hw/i2c: pmbus: add PEC unsupported warning
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <f4bug@amsat.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::349
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::349;
 envelope-from=33GUmYgYKCFkK9KLJI7FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--titusr.bounces.google.com;
 helo=mail-ot1-x349.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
X-TUID: 7AwOwi9aZ3Oq

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index c7ec8e5499..ff644c1d4a 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -307,6 +307,11 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
 
     case PMBUS_CAPABILITY:
         pmbus_send8(pmdev, pmdev->capability);
+        if (pmdev->capability & BIT(7)) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: PEC is enabled but not yet supported.\n",
+                          __func__);
+        }
         break;
 
     case PMBUS_VOUT_MODE:                 /* R/W byte */
-- 
2.35.1.616.g0bdcbb4464-goog

