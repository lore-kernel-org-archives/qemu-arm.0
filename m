Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp829624ejn;
        Wed, 26 Oct 2022 13:23:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM57slAi0jt1NsV9ENwUZY4M3AM2Keu+SCTuuHfVYGe6gwX2cQFT+lcZfu7IExUkTzld+or+
X-Received: by 2002:ad4:4ee6:0:b0:4b1:80a5:49e3 with SMTP id dv6-20020ad44ee6000000b004b180a549e3mr38522792qvb.67.1666815790579;
        Wed, 26 Oct 2022 13:23:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666815790; cv=none;
        d=google.com; s=arc-20160816;
        b=vDZKdSdzbN7lwpV/gAZpLZXVwvy7nbN2ogc0havTxIzVajmf1P/UMJDukn5W9GGzZ9
         bs7ZulM7JHeOg0OpnrpI82WL8MwmSNN4zz7SjyFZcfQH+mfWGPhxqJXncXqoc6OaOLvB
         AFQX4cYzewQ0zFzZ1hBZJg1w6Dw/BSf4OcO/DKwKtlCCvUXLQ3yux342KmgVNEjz8BLq
         dFKR/aFL2aeOIXEFOVT2+cZV0I/CFIeoAdmTTBtqPi4mtRUk2LkcZ7X/U6Y8/PsaT7/1
         7HAEPYOIp8Nk1S0o0VcUYb0ZFI3Jbm2utM96wZXWPmnhZDMWyhDxtEPL9BbFFmNeVXkG
         0Prg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MZ0hVa8YtJYr6wiX8WDzq4IS/4ZL7pxBfATieBVFI+M=;
        b=B+IiA9xJsLZzAP56dPBEqMqCTBuqopR22vphRGgkTW6GwjwEK3/VurV070YfIAYD3S
         J/iabvcRiOtVapb+6OQMKsIwQzvTfobn2OKlKTzxOnti+pchXwgMEhvzKXgjiv0megK7
         5JNDDJFUtjjKaKleL6BqjaU7nB22xRxNMS6Y6BswQ7bvdjZ8AE98mD7hxx4R9sr14bRd
         +NYidl08Z1ZfdqD2spE5wtdUxZaQ14aDuiQ3Bm8E9VHuIEzAjW2z7KuD+0P5zPgRr/nw
         zwdvaBhyCVne/XrUSR6gu8vSbpm83Q4xwEoAdueKzee8iQ+K7CEpFzkXzoo9smL6eK6I
         xqCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=MA+9RUiQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16-20020a05622a02d000b0039c04a1a0e7si4888446qtx.703.2022.10.26.13.23.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 13:23:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=MA+9RUiQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onmpz-0002bD-35; Wed, 26 Oct 2022 16:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmox-0001Zd-AB
 for qemu-arm@nongnu.org; Wed, 26 Oct 2022 16:16:16 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmoq-0003A9-Ep
 for qemu-arm@nongnu.org; Wed, 26 Oct 2022 16:16:12 -0400
Received: by mail-pf1-x436.google.com with SMTP id g62so12556702pfb.10
 for <qemu-arm@nongnu.org>; Wed, 26 Oct 2022 13:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MZ0hVa8YtJYr6wiX8WDzq4IS/4ZL7pxBfATieBVFI+M=;
 b=MA+9RUiQydqT4Ib0KZ98vOFSDziOeoEgNqGx7PAt8EwttVRRCC+rRjydRz+peoYu0A
 26fR0PJayLkNBVWcuYa9m7SjBoVWsU07/8ykBZMgurEegOJ1VYoC+QoJYI3Z88bzmKVz
 LK5ebZj5FlgwZGrOQKkrEJux1ZX7uKX7vrAwfDgURHxEfBAZnOKOT/z9fL6yWsSvPSZI
 OiO/P85iMZyNGfUzmip1sJ//XmG4mc3kssabC2P6O5J+SRYXK9jcMkYwlSu5ibSCZRzb
 KMZtEHak+KHTgO1TI2ayQnbhfdIvMvoduhCfbsWJW+aUhAhL19UQw4aWPC/izDhzKIVs
 +D+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MZ0hVa8YtJYr6wiX8WDzq4IS/4ZL7pxBfATieBVFI+M=;
 b=DWy1WS6ca0VPCddSSm0vl2ZOPqldbfAtoUYTU/3XcrWGrLfv8K6niJNDIIRBO5OhNP
 pHPM/jgEEWsFM7qELjEuQAd8Od6wGswRUDz4tqMEKB4D0d4rxrwCaduUzuVhsLlOmzPU
 Kb/QtZkqOLu9kgO73bgNv0F0/4Z14Q+3xIATOH5BMcWWvTZqAXjPB4wclFyhi8LHT5jU
 ee7CVupwsQp8yEcvNfTY9GK2DRisbG3F+K4iUAG7qP0Akv+sJqwk8IlKnLCLQKlWTJp3
 eCc8SPim5GLq599BIbc+uL340f6hSDkv+phEkP7ywBVLyToUtPFWe5w0Gg/0pgCxFIiX
 NUQQ==
X-Gm-Message-State: ACrzQf0Eue7LFxwH4t1eQf8NTibivTsDXsl5wloWj9CY3edRVKpIY9LV
 +qxXr4kU1liX70ufFsNx1uKaYQ==
X-Received: by 2002:a65:5ac8:0:b0:463:9c77:285a with SMTP id
 d8-20020a655ac8000000b004639c77285amr38797068pgt.517.1666815366079; 
 Wed, 26 Oct 2022 13:16:06 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa78f25000000b00541c68a0689sm3375770pfr.7.2022.10.26.13.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:16:05 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 05/16] eepro100: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 05:15:16 +0900
Message-Id: <20221026201527.24063-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026201527.24063-1-akihiko.odaki@daynix.com>
References: <20221026201527.24063-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::436;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AyW0sGml02gl

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate heare because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/eepro100.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 679f52f80f..bf2ecdded9 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -549,12 +549,7 @@ static void e100_pci_reset(EEPRO100State *s, Error **errp)
     if (info->power_management) {
         /* Power Management Capabilities */
         int cfg_offset = 0xdc;
-        int r = pci_add_capability(&s->dev, PCI_CAP_ID_PM,
-                                   cfg_offset, PCI_PM_SIZEOF,
-                                   errp);
-        if (r < 0) {
-            return;
-        }
+        pci_add_capability(&s->dev, PCI_CAP_ID_PM, cfg_offset, PCI_PM_SIZEOF);
 
         pci_set_word(pci_conf + cfg_offset + PCI_PM_PMC, 0x7e21);
 #if 0 /* TODO: replace dummy code for power management emulation. */
-- 
2.37.3

