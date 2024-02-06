Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1944639ejb;
        Tue, 6 Feb 2024 09:13:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtJn5Xw3ctKhHs3gZxfl7/uCC4QM+mVprxNNHCxvxm0DpVrZXgs+npTd9QhN+AJNAu8WC2
X-Received: by 2002:ac8:5784:0:b0:42c:75c:6b63 with SMTP id v4-20020ac85784000000b0042c075c6b63mr3504866qta.51.1707239620262;
        Tue, 06 Feb 2024 09:13:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707239620; cv=none;
        d=google.com; s=arc-20160816;
        b=rD4EOk+Xbm2blalcaIWqYxayksg4hCU99Hn/LLFJhakztYc/ITvDkKbq5i1LFqPkd0
         3jlFTOQRkRR58EflB4FW6FAT5w3dsruckbLFEtkIdcNFV1e1ZyYjHz0wnPAYeQhQHDcT
         rNoj/S9nlRM8o0pT71NJCjXsP2Sq33UW6bC26bQSKkkMEx0UfqHnBSIEeqlcBWODyiZA
         HUtofodIed5g4Vv1WCizCRNjhmcdzOMjoJNYaiHVhhb3SPDnhiJwGrwfn+/ndjVAiwun
         UH2rzhGyLhuT8iUJ2PMO2oP1hojLXH9mYLfF64L82MwM2ThY7GLvkoj3EPnsrqnc05uP
         JsKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PrRJ5d76QadE8MBCkQGSm2LWsORcf86H/9Nb7qmGBtc=;
        fh=Ib15d1Lt4m7nWUJQXpAhfhsYO6quO5T0/FGhSd7za9o=;
        b=d3UsIhAdzoYLue8AIAUYcaO2Xnr0jdBINaYtNeplOFQ521dlQYV1GzdNCDsuhYs6SD
         43pyTgIbZByMjNY0rGmND3Z+ct3Z4khgK+Tat82v+PC75sSOuHzdN1AOw+HM57QanCdg
         umKGDvZmLxnLCshKrgNM5Oy3nQP0fVmmqbI7jCWjE/gp+W3jNW7r+bSyuvzPvEuOqJQR
         L08L8j9VltP0SZPnPJPzVN0eGiH93wYRYEwmpFpvyaAjylMANmIX4SsTwudutdcD6wDX
         HseWrNME29PNLAsoIYzxM7SDT1fIau49zo5mBwBdzEgqTMSRm93YdaMVxh3r6NRsKQ1H
         0rAA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ojx3gydl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCWA9Ugr+xLJ8iqcmcxkchkKtgocJUIwrlXh3TNVXbHcxuALHSd3xBgi4ZrEGxnouYZhnTwgP7y7X/Sd3EpZNMX7jSZ9pMXZ
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020ac87dca000000b0042c29a9ba91si2779467qte.604.2024.02.06.09.13.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 09:13:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ojx3gydl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXOzv-0003pv-Jo; Tue, 06 Feb 2024 12:12:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXOzt-0003op-Lv
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 12:12:37 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXOzr-0003XX-M4
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 12:12:37 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40fe59b22dbso5906005e9.3
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 09:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707239553; x=1707844353; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PrRJ5d76QadE8MBCkQGSm2LWsORcf86H/9Nb7qmGBtc=;
 b=ojx3gydlZ84j1rkyFXhGxr2oYHB73q3gjJeAEjmLek46Mgz3kLbhPbq87jObFmfxzA
 2IIeWYw3oLQHNS927OusX48HhIZEGHIixzP4s5DLm9CXboxSCztFT8hgRn4Epz8CBst9
 2AIqDRzqEOuGgCeYJTg/v4q+KtWHkSHwPmZyiv4Uzmmm+0TgxRak51c9G26n6zCKTI0K
 6L0ag67z24xV+vo0hlCrXW3cV+3IMjDi9SoaCwuG7oCCx8Ab022sNF9DHFAfrjLRcVZF
 5XObIFUvaWsMyi9ZA+TgTVRmMTQSsLJSW7Z02pkkWdSCMlNiLe7UjNVvCbavmFstULXx
 +MMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707239553; x=1707844353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PrRJ5d76QadE8MBCkQGSm2LWsORcf86H/9Nb7qmGBtc=;
 b=V9QlvOBaLX4oe8KuCkYOEwuT8farq2MYxntH7lLdOlJHipTd/H/5ByOM5GMbixmbSi
 8M6zxH2xrShnmTDmyhP+hd8sfPBy4qWlaQMbqVbT7R3TpqkK6fbRshgM8/DJza4ZjfqV
 6IYX7MKyPK6C20hxk8N1HtxNEvsHyazM8f6pIOxa93ItGj2Hdo6VRYGARoEN/1dDr0nq
 LjtsTtCS2XXURQd77n39sJDs+HtPpvrh+NG8OuS4Y6Gy0P6y7543W3K5ckdb5+jHdCv6
 XPPP916Qh+yjPpmrRNr0lPJaPAIFIHn+EemJH97L/PvZvj8S1hZ5TGBcrwAijvXum3uj
 lOnQ==
X-Gm-Message-State: AOJu0Yx+BEmetGPnCQBDyht5gMIiBhC+Tp5em+F0UMenTHyARV63dIf1
 /vk9MmsWWItzH+e3gqTH+Cxaojr3GborTpAVEw+PrzdJWMDvMJrPIzC0mNtPJJspfiyqaOZ4B9D
 c
X-Received: by 2002:adf:cc8d:0:b0:336:76de:c171 with SMTP id
 p13-20020adfcc8d000000b0033676dec171mr1726208wrj.62.1707239553103; 
 Tue, 06 Feb 2024 09:12:33 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWrtJt+URG6QvNQSw7sNjxDtAWWtLTan3pIGQKX7+MclM8g4YZyfgLNZ5F+SWfrzDbMwfhwMa/rRzwieUPjjca8A0Wqq8BpyJ7/W+cltLz8HuyQHB2DGK5Io2WagPOeL7sCqZKSivf6rS6PgT/DZBlxxmGg
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a5d4bcc000000b0033905a60689sm2561284wrt.45.2024.02.06.09.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 09:12:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
 Nabih Estefan <nabihestefan@google.com>, Hao Wu <wuhaotsh@google.com>
Subject: [PATCH 1/2] hw/arm/npcm7xx: Call qemu_configure_nic_device() for GMAC
 modules
Date: Tue,  6 Feb 2024 17:12:30 +0000
Message-Id: <20240206171231.396392-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206171231.396392-1-peter.maydell@linaro.org>
References: <20240206171231.396392-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: MaRJ3HJH9RyT

The patchset adding the GMAC ethernet to this SoC crossed in the
mail with the patchset cleaning up the NIC handling. When we
create the GMAC modules we must call qemu_configure_nic_device()
so that the user has the opportunity to use the -nic commandline
option to create a network backend and connect it to the GMACs.

Add the missing call.

Fixes: 21e5326a7c ("hw/arm: Add GMAC devices to NPCM7XX SoC")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index ff3ecde9043..cc68b5d8f12 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -710,6 +710,7 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < ARRAY_SIZE(s->gmac); i++) {
         SysBusDevice *sbd = SYS_BUS_DEVICE(&s->gmac[i]);
 
+        qemu_configure_nic_device(DEVICE(sbd), false, NULL);
         /*
          * The device exists regardless of whether it's connected to a QEMU
          * netdev backend. So always instantiate it even if there is no
-- 
2.34.1

