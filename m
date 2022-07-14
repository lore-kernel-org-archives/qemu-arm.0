Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp795026lfp;
        Thu, 14 Jul 2022 11:40:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tHgSZWEVmLxgW9Vz/Qz55cYaqdsX7PRSFDboW4E0KnI4uTHslloUlOBliArHfWRadl25Z6
X-Received: by 2002:ad4:5dea:0:b0:473:8378:ab8c with SMTP id jn10-20020ad45dea000000b004738378ab8cmr8967433qvb.75.1657824022019;
        Thu, 14 Jul 2022 11:40:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657824022; cv=none;
        d=google.com; s=arc-20160816;
        b=1J2DSTbtXn+QfmBcoqAGgh8XMKswDlndV+4WGZoqwmSD7m2N+hzlj7I70WbFgaZjJs
         cFKVsNuJ0DNVTEB3DFUkw/cI1siKMFjpzcWgc3SvFoPWCSlfS5TgOEB6RzBYMjbocb/W
         +xSv0qLW/VvpHjAv3UhWEShzOIo9Sg7JQO/zEgoHcytE+oHnpenX+NoHOGa4w3h359J/
         zqtzRkGzMMkpbOgt9Sizp+acBn4A9CrPaBWN8OnWDs0Cfb3mqKdLErky/U+rtD1EKzal
         DrAJKNngRia5IrDEORBfpoQqt1keQK7ssJNp3w9l5CjZUHWFgrpgcw2utXSGynx2AgA5
         kIew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=TM8Kh0gGU2hIWoEk51Qm6WG9lPFo5JxHmzkWdY1yzZE=;
        b=kC6HHk+eTPUSSslndyuW7orqZjRiV4cBGnn2Axit/iqFlZtaKkemqw7Jst1/v3ikBX
         MdOwGrgkybNWVdJix4SZ4hSJlvTdYkISJrxMvTtnzTEl3Mdm4ZVmhfvSznv5m4zQviwk
         370K5g5vT83p3PtG8T5oVntHAZnp/z3wM8aKDZMSGKdlvmQdSYfQg3DPhagEEaDBcilU
         nJoqmUBsGzV377662CY8frxuh5R3EhwsaEmvluqIf6wJqrmJAVxpOhhtksZEM2Zc+ZF3
         oygYS4IL+cLysp/OpfFG3FpI+ug+g4qt+2K1aYI2LWgzoInrwKWuoOrpuQHoWyIcLJ2P
         Ewzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=MLn3dePo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1-20020ac85901000000b0031ed2d83240si1392356qty.515.2022.07.14.11.40.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 11:40:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=MLn3dePo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:36776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC3l6-0002B5-HS
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 14:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3WmDQYggKCHktreXlqpedlldib.Zljnbjr-Xojklkdkr.lod@flex--wuhaotsh.bounces.google.com>)
 id 1oC3Zv-0005cn-Nz
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:28:47 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:43873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3WmDQYggKCHktreXlqpedlldib.Zljnbjr-Xojklkdkr.lod@flex--wuhaotsh.bounces.google.com>)
 id 1oC3Zt-00082m-SW
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 14:28:47 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 r133-20020a632b8b000000b004197b8c4843so1597889pgr.10
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 11:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=TM8Kh0gGU2hIWoEk51Qm6WG9lPFo5JxHmzkWdY1yzZE=;
 b=MLn3dePojaqOfuYboTRLKZVoCwOEvHwBDCuU+uURDISko1txFuo8ogiJvFR0qzgTDJ
 hi5njeMpS6Y2RJ2VZcxZKs1Qi6kaRpb/H4wImmuk/7FSekY6ofs+nlhhuKKWTAdt7XdY
 CZs60l9OutALiiRm98T2m2Cxoy1oCcOY+I38anILmozB8mwAzpVckdFnwU+tXDrbo7cS
 nDELiHm5l5Ptjhyqio6sRjUnh8TE6ycdrmas2dtkG9XPM1NPDFwxzOQeIk/pIsOFl1DB
 eXqdqKocyr+FCUtN0ru4CfIqKJneNVNvvnSiu/Txcvd2pWbdUZu1QIuWL6/ok9mjf9tr
 6SOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=TM8Kh0gGU2hIWoEk51Qm6WG9lPFo5JxHmzkWdY1yzZE=;
 b=29TD0U9gEO6I0saYyboBLJubtTIT1RmHBlx7U0LWTka5sMEiKw4DoTumPamebNFbk6
 mwzrm9B4GD5dbCNTpyxtg+ASyqAgiergXWLL/VnXCvxeukN7WFn6t9f1HsPfj471K4MU
 /JM7TBkMQjzYaUUMpd0KNZa2tOtZX+ByWRR/2SR6tifwGGgoTJbRUDzNpDtgcNl2j0lN
 J4OM9KOqNUwaIsFo9uAn9dxOsfR2NBmp1T8qmzAcwCzCs1v6IeWRO34RHZDJgZa02Kql
 dzO93U/rE5ryE0L+GRK2xm2LoIaAnGZW4mToQhI/sfU4Iy84iw2N5y3N2oJEWw50RxJV
 ocxQ==
X-Gm-Message-State: AJIora8JNYLE+w27Kh5vHq/0/HUhZCO4jNOT4+PWXZ1ayLhyUyGIeve1
 j2F8xVkCqv7ZZeRwvwmvFQluSf2FWA9fIg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:249:b0:1e0:a8a3:3c6c with SMTP id
 t9-20020a17090a024900b001e0a8a33c6cmr627282pje.0.1657823322905; Thu, 14 Jul
 2022 11:28:42 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:28:30 -0700
In-Reply-To: <20220714182836.89602-1-wuhaotsh@google.com>
Message-Id: <20220714182836.89602-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714182836.89602-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH v5 2/8] hw/i2c: Read FIFO during RXF_CTL change in NPCM7XX
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3WmDQYggKCHktreXlqpedlldib.Zljnbjr-Xojklkdkr.lod@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: 3LgXjceT+Jt9

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
2.37.0.170.g444d1eabd0-goog

