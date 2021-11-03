Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp116982lfv;
        Wed, 3 Nov 2021 15:05:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKEqvYXK0A99cCQRJ6C+nyLbtma6QGyS5d5xxqpavXvNNrujSpNzJBk5R+K9FiuBNO9U9C
X-Received: by 2002:a05:6808:1cc:: with SMTP id x12mr12519465oic.88.1635977116803;
        Wed, 03 Nov 2021 15:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635977116; cv=none;
        d=google.com; s=arc-20160816;
        b=ogYanMYxtqRd98q6u7yyjmWjQ2pKj2CirA0cLnCCboShAeB15MEQ21upoY9VeCTWjs
         YYXW5xqOcDs89TjLAeNmTxO7pLzDWUIKpJex6/2sgzu8ULG7CBgRC6j32rHkeU4crzKo
         aGq9wXeqc1Fln2YIXm1pPj6L/ta8RDRXxy9Rua+38o0L/EBo29QF6pL1qKqciNkX2Vy0
         fIjk3Qnq1UfYdvIBHoaC7ZgWToTcldMBsoJjqN3rJg1RRq8MTafVoi6NwuA1JbGrOo1k
         yX/n7MZALKiCHVOFZbF8nhTmUpw9k2SLoxWvh7Xoysw5XCd4rkZy/xU0XmKRDEfAH/r9
         W6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=pXfgJHvome9hq7DD3kgavdSisX+d0Zxf80aI+vn8Zlk=;
        b=XJih5UWYnOuHrqWCmgmIPsJCks5gXcakz7+da8n1VUZ3okgAjtF78D2ZpGtO8KIW8B
         TC5Qa2HsRCYwtwXzMYrA6RXY4Vv6wlbKIYelJqmaUpdfzZ180RDKW5JT+cuKJf5GiUk0
         8FwvhWM3a8+Dqq67SrTywHWV/iitHA+JTYfaHiFEVkKsxpMzivk6rADebQTtxBMO9F6F
         0mStDq0b+oeH1sDnzzpaSThsxzxB0Ph1DN7AY73NR4iNqRWmDZ11Nh/6c9r3XZJwk1cn
         Kk3NSl/HphKf/6xtV+bIgG4l+CnqydrXU5H7bS2O3a7kUX/BIF2YioUKCjG+IoAFP22N
         5BrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=N57HLd44;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8si3658196oia.49.2021.11.03.15.05.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Nov 2021 15:05:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=N57HLd44;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:60620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1miONg-0000cf-31
	for alex.bennee@linaro.org; Wed, 03 Nov 2021 18:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3bwaDYQgKCpoQOB4INMBAIIAF8.6IGK8GO-78P8FHIHAHO.ILA@flex--wuhaotsh.bounces.google.com>)
 id 1miOIt-0000ur-9Q
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 18:00:19 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:44932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3bwaDYQgKCpoQOB4INMBAIIAF8.6IGK8GO-78P8FHIHAHO.ILA@flex--wuhaotsh.bounces.google.com>)
 id 1miOIr-0001K6-Hc
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 18:00:18 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 m5-20020a170902bb8500b0013a2b785187so1745292pls.11
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 15:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=pXfgJHvome9hq7DD3kgavdSisX+d0Zxf80aI+vn8Zlk=;
 b=N57HLd44e2ihGy27+ZU+s8olg+tWgamGXaZRP4whEIS7iU7CZJTK5A9yKHoYNKxoFT
 KPotifQO8vEn8MfrEVSK5HoqOKBahNHgJxqLTepu8nLlWTvwzggbLGQ+917U/6WvNzuv
 lYb+Ahepg+8Z6uxy6hTAocSGZJHL6DmVURV+FpHYzDkJnNqtHhCW8C0lkkuu1FJwOCPZ
 Vvyocg/dY5XyiB56oRaSs7uLatdY03MixQ8A9AR6n1qpSRjnUIgJvZMreezmlmGCX18Q
 EMAKvPPQkfBFztttdSaPmu8lbeZkIE+yqjdA5CVOGVD8HV36OUWtIVvtRoUi3CSEgM7t
 UchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=pXfgJHvome9hq7DD3kgavdSisX+d0Zxf80aI+vn8Zlk=;
 b=4HK9eriuVgUBJuXoHSk0tjSp/lEOB6ZUQ1EZaS7Do+CkqnBv6wW+R/H1Nuqx3Qu0AD
 bMCKCgoKvQH7W7nU+KjQDHnXuC4TOrbpCvZJvHHbTHdrvbc2gobmSTWORzTorTlUf2lp
 nixEjBtpUDikINWdwJQ2cbpTjn3I25T6o0WTzCSGdYEMQtaHd4oWVWGKiluXoPbJejJr
 j/ZvDHHpw9s9LK/bGwjuAFSVJXoWTBxbHGKSSUdj8grCORLu9tlLnq1p6EmRK7LSCfG6
 KJ7GeJNCL1R+/cVDJgHRR0XJ8pGnFKCbd0McrinUHUncUTGF7OzQk785OO/VfpXhIkuc
 A+rA==
X-Gm-Message-State: AOAM531jOx6Jd1gOCHaHNfn6Ld+3c2fDV1U7viXptQCz1saCqeD9E0od
 EQyu0C0JkdJLRxVu6NwAvCjtnTAPNNe/Ag==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a63:5f56:: with SMTP id
 t83mr4504327pgb.432.1635976815259; Wed, 03 Nov 2021 15:00:15 -0700 (PDT)
Date: Wed,  3 Nov 2021 14:59:49 -0700
In-Reply-To: <20211103215954.1401805-1-wuhaotsh@google.com>
Message-Id: <20211103215954.1401805-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211103215954.1401805-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v4 2/7] hw/i2c: Read FIFO during RXF_CTL change in NPCM7XX
 SMBus
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com, Titus Rwantare <titusr@google.com>,
 Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3bwaDYQgKCpoQOB4INMBAIIAF8.6IGK8GO-78P8FHIHAHO.ILA@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: foTyMoecTTnF

Originally we read in from SMBus when RXF_STS is cleared. However,
the driver clears RXF_STS before setting RXF_CTL, causing the SM bus
module to read incorrect amount of bytes in FIFO mode when the number
of bytes read changed. This patch fixes this issue.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
---
 hw/i2c/npcm7xx_smbus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
index f18e311556..1435daea94 100644
--- a/hw/i2c/npcm7xx_smbus.c
+++ b/hw/i2c/npcm7xx_smbus.c
@@ -637,9 +637,6 @@ static void npcm7xx_smbus_write_rxf_sts(NPCM7xxSMBusState *s, uint8_t value)
 {
     if (value & NPCM7XX_SMBRXF_STS_RX_THST) {
         s->rxf_sts &= ~NPCM7XX_SMBRXF_STS_RX_THST;
-        if (s->status == NPCM7XX_SMBUS_STATUS_RECEIVING) {
-            npcm7xx_smbus_recv_fifo(s);
-        }
     }
 }
 
@@ -651,6 +648,9 @@ static void npcm7xx_smbus_write_rxf_ctl(NPCM7xxSMBusState *s, uint8_t value)
         new_ctl = KEEP_OLD_BIT(s->rxf_ctl, new_ctl, NPCM7XX_SMBRXF_CTL_LAST);
     }
     s->rxf_ctl = new_ctl;
+    if (s->status == NPCM7XX_SMBUS_STATUS_RECEIVING) {
+        npcm7xx_smbus_recv_fifo(s);
+    }
 }
 
 static uint64_t npcm7xx_smbus_read(void *opaque, hwaddr offset, unsigned size)
-- 
2.33.1.1089.g2158813163f-goog

