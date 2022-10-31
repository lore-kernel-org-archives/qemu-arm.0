Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp930447ejc;
        Mon, 31 Oct 2022 05:35:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6QT/AnQD+YdR8DBqz9+6EP5P3TP1LRSGML9NnNSm7DXnEoBy60GfOXBRDzTlHHEHlRZihm
X-Received: by 2002:a05:622a:50d:b0:3a5:b02:fe2f with SMTP id l13-20020a05622a050d00b003a50b02fe2fmr10140531qtx.284.1667219723203;
        Mon, 31 Oct 2022 05:35:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667219723; cv=none;
        d=google.com; s=arc-20160816;
        b=mSdHrNKqHGba4rcteniJ/eZcKAG2Voir5FwId533IthuOUkBViOHJ3PbemRlRkMd1d
         ghDa8i4YHLOL0FAHL8vUvobLBM6UUArpUMj306azxrMfgM17s/UvB38nwTqXghcIJOar
         jSS6L/C2AGWkPOr/fAvcxfTXJ3yR5gs3TEyfeKEaOxfUkeqJMmwnaUn7q6UFsdoX344s
         KN3qEJq/zGfXN3Tldy4VVjTNxAvYhQkm4exeOES4evYiEjfcRy2otDg4raUqb8RCRshh
         X9omIUCTnPrYEP5UgSefVZNHxutrd9bYoV5G5ZSSs8ovIXnIDf6aqvy/azmYJWM5/T4c
         X/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Vn8QAsjO7gtbZVeE7QQx9COaGQRw61V/sT24VvnuPKo=;
        b=SBiylNVLfoOcRWZWordwJDggeIfrFjkNoHPEDZv2tU1XLUHM6FIRvX8G9jJ9EaAENa
         4+xcgCbIkBgoCvQFrOdhVdVtgjIm7psyyRvlJ/PAdAMb+S9YcbfobEtcFG3c6p3phUR5
         SCSU7e7vkIoc50YW97yEzR30xSQ6CzAN0mmGTpJ+JfD94N7/K3Aj9TfVuzFQBOUAN6R2
         CcD6GK59jccvVHy+9CoL28INEg4c6LDxNCPJOasEw8NVmZAYtvw6JwTJ4tGadDC+4VFQ
         j3ryqyJzaElZott1CHf8qB4iWwDTzyXpZpjOLDqRXC9+7sQQqpGgxkkbFddKi9VMDg2r
         tDww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=BikZutB2;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9-20020a05621421a900b004bb76d5a430si3787834qvc.474.2022.10.31.05.35.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 05:35:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=BikZutB2;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opU0M-0004ze-OG; Mon, 31 Oct 2022 08:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTzP-0003Mw-B9
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:34:14 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTzM-0004Mo-KR
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:34:02 -0400
Received: by mail-pf1-x430.google.com with SMTP id d10so10550321pfh.6
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 05:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vn8QAsjO7gtbZVeE7QQx9COaGQRw61V/sT24VvnuPKo=;
 b=BikZutB21mbzsJSwEx8B/Ylzp5DWUwdu1CtS3tZ0Kp3H3CwDuZcl9eSt2peEzCSfKM
 oMYMKP5yePV53nrS7rvz6gTrue1KNHnXguv+O1sRMdEh+j1ZGELqs8CtDjP94+MFs9iu
 H1h4XeutaFj93oxmrCyCg5zrjOP2Z9nEumpc2AGEL3pj890zHw0nX1p/KZ/X9VfGE50K
 EGF5e4TgAiYbwCRBAGuNXVGkl1xVLWnhLAUb5FsGnfKNnlzat8CRKpHuUO5u0DyGgiBx
 ig5o7VhWz3ajCZJ6Hx13pdSzJySKip+KJjNBDhhriGiAQwKYeiKLbL3HIPL5jud3ZeWq
 GDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vn8QAsjO7gtbZVeE7QQx9COaGQRw61V/sT24VvnuPKo=;
 b=0C9esfPaA5Cjk0otFt6JPwwFdOEFdGGN82Q3tsYdJgRUyJy3+3fJbFbJN3GwB3KcY1
 Dc+MJO5XzB9GpvauSyt2g9KqPORFM4b0AVLAhqYKYNtlKZu0Z1vXmT+ms5+zH6f5Znhb
 salyeM9+tgO7/fi/qRgvc7XZ6RNV3bdbt/36voD5v/mYRzADvDqp56jmM3ozpLTzZJl9
 h1BFVjkewCzsjHp5PigYoqE5h9pKb9oZAnt8Ikwl8aHp23u/uI+CVj90US2D8af2Cazh
 bARb047i25rchsb0FQYbGGDOPEChApnXV1hr6jRjqCwijuyOZSuZ0ZFUA9mwSJR+e1Bs
 DyKA==
X-Gm-Message-State: ACrzQf1h8aQF/9RT3YgfJy0uSHgQr8Jz7EIVeue1rYSPnymCeVpNxdne
 2hpXdTDUFad2dDbEPAnMMIXMzg==
X-Received: by 2002:aa7:9629:0:b0:56c:8c22:6d70 with SMTP id
 r9-20020aa79629000000b0056c8c226d70mr14267144pfg.8.1667219639192; 
 Mon, 31 Oct 2022 05:33:59 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a6545ca000000b0042b5095b7b4sm4093810pgr.5.2022.10.31.05.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:33:58 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
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
Subject: [PATCH v6 06/17] eepro100: Omit errp for pci_add_capability
Date: Mon, 31 Oct 2022 21:33:08 +0900
Message-Id: <20221031123319.21532-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031123319.21532-1-akihiko.odaki@daynix.com>
References: <20221031123319.21532-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::430;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x430.google.com
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
Errors-To: qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: xI+wmfgXkR7+

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate here because all of
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
2.38.1

