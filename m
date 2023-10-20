Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1205739ejb;
        Fri, 20 Oct 2023 06:05:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhjc8sXhq3KpfGbxNZHDZYoDqbdi2oIug8oXFGvnJV3IczZNdH+7fKlzmSCkme9nq90BdV
X-Received: by 2002:a05:6214:404:b0:626:f3d:9e46 with SMTP id z4-20020a056214040400b006260f3d9e46mr1989571qvx.18.1697807113862;
        Fri, 20 Oct 2023 06:05:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697807113; cv=none;
        d=google.com; s=arc-20160816;
        b=GRnwT33WZBouO/bDIsV9B7GkrjNPWC2J3Q6f1IQ4ZzhT2hagfMFdkHWRce1Gq/VAcb
         f1NQZonAiaGC82UEeTGIC4O42TLJBur7DGWORPXywjAeqnYyY4yk+4aC8yg2azik/khD
         mvSICmLlMj2qYW2cHhzSRN7ca8qgOxcXNlUbWij18Ba1PhQp7nCypG9AsMVok1xpFG6t
         hmVPT8NWakpG9kYeCa21WmIOGSJpVjPHxp6onwxh2gtB5R/WVh5gN3VjPFaFMmUewmGE
         WwhKFd1/AK6TsRvED43AuoWMCwvlPcwfT6BhjWzojhGnq/bBzsq7CQL51YT5zv2jf6po
         anDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VvkfRXdPjwZ/XLZmVrV6N6IqteNQI6rI35LT6QBMgTk=;
        fh=QWGggua+3ufs1S3QlzhTWcDhlhc7bBCtXi/Y+/UuB8A=;
        b=KJKpAZNoevfxQGmvAzifrfsBSBpd5ot/rapyiQHHyjwBFzcVzSxwufQNV7++dyXAln
         TI5K6AxczPfoNgvDIOssmMB1uJ/YLfMsUOTEQ1cybBl5XLsCJ81PWcMwEVkqqFX6jDgK
         KKECNQRZTmaEfMpiF7W2GxgQnyKNx84Tie6hfzn1XN19hajjwv2LP0Baxe3LNhMA6B8A
         KVr+iya8JGL0sR7K1/QDUh7k+OVxaOLLfQ6ZOxMsDdIXbHv9VTWyxHmz6bp8Lk6xc2/l
         IMYQVgAqwkk//L/rZzbWL71myyGB+kUFxb7DxW/+JDEER0mYVqgVs+nqi0C+xa3SevJL
         4IcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yDVvaO3D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2-20020a0cd682000000b0064c6b7d96e1si1361032qvi.372.2023.10.20.06.05.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 06:05:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yDVvaO3D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtpAs-0000uQ-4K; Fri, 20 Oct 2023 09:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtpAV-0000gr-Pv
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 09:04:05 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtpAP-0005Iw-MI
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 09:03:58 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9be02fcf268so120804766b.3
 for <qemu-devel@nongnu.org>; Fri, 20 Oct 2023 06:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697807032; x=1698411832; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VvkfRXdPjwZ/XLZmVrV6N6IqteNQI6rI35LT6QBMgTk=;
 b=yDVvaO3DVY4OzZlGv3c9ePTIEw+jlkjRZBltkcoxAWrV3Lfl0jp9MYTk91cDFNww45
 a/vOljD97KW3biVxE1EHabSBZspZEO0ZT/2CzOpOs9JgUJAjrXnnwNiZpGFo7oWwowvG
 IO6oi49jYb39w6KfFlRS2Rodlr573boO3f453PYz6gFINSdfzCsXXl0ZGT2X5EYennmS
 pl6sGRAKVvDA1hY9YlsgQ3c7Uczu4h1fI+DbbtrprVvYoEE8Srp0DXjA3bwj8GkxC8mA
 XPOCsTbDBM3CUZ6+WASRi7n7z5PVt5rm6W52HkGgZ7V2pPHDTcdmn4qJvW+gn2SyZ8Ur
 mnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697807032; x=1698411832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VvkfRXdPjwZ/XLZmVrV6N6IqteNQI6rI35LT6QBMgTk=;
 b=pE+7dGOQFIfiW3kimSDAM4t6y/yBbbMnSHM2gqcFEZeGcVZn4rzl/BYBCxSFkmDAyy
 9sQjHLLOGZFQ8doZBcz2eYa86QIPDymK0dWSZwJRXP58d9fXUp+1PBAMUKroP3BOel56
 yOHheO/SyN8lnLJs2rtWKymBJgzeJrW/XqIjKuGc1lV9j7qjni2HpOelV7EobrzyPcr8
 I8ArldCkAXuSlxlKJ6OoHuAdRBSGjCNJ5QPk10YYvztP3VMyx9cCthPHzyGpdrDsQcLM
 IfA0OuUwlY/tuQ2WFgVuVdME9ifre0y8ja6mhvI6QC6syE9g2K85ctfs/VP9nx4uOzDP
 WS2A==
X-Gm-Message-State: AOJu0YxazWkhPvkcjnPtyLvpDuWv6FAmTsAKA+rXYH3gCDjlU1tE94F0
 V4z4e1b4cXd9sCtQdZNfcM4PvvjZbTMQrD5BVLE=
X-Received: by 2002:a17:907:d19:b0:9b6:550c:71cb with SMTP id
 gn25-20020a1709070d1900b009b6550c71cbmr1132082ejc.52.1697807031911; 
 Fri, 20 Oct 2023 06:03:51 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 j12-20020a170906050c00b00977eec7b7e8sm1474283eja.68.2023.10.20.06.03.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 06:03:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 3/9] hw/pcmcia/pxa2xx: Realize sysbus device before
 accessing it
Date: Fri, 20 Oct 2023 15:03:24 +0200
Message-ID: <20231020130331.50048-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020130331.50048-1-philmd@linaro.org>
References: <20231020130331.50048-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 56m7Xr/NjHUB

sysbus_mmio_map() should not be called on unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/pcmcia/pxa2xx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/pcmcia/pxa2xx.c b/hw/pcmcia/pxa2xx.c
index fcca7e571b..e7264feb45 100644
--- a/hw/pcmcia/pxa2xx.c
+++ b/hw/pcmcia/pxa2xx.c
@@ -142,15 +142,12 @@ PXA2xxPCMCIAState *pxa2xx_pcmcia_init(MemoryRegion *sysmem,
                                       hwaddr base)
 {
     DeviceState *dev;
-    PXA2xxPCMCIAState *s;
 
     dev = qdev_new(TYPE_PXA2XX_PCMCIA);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-    s = PXA2XX_PCMCIA(dev);
-
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
 
-    return s;
+    return PXA2XX_PCMCIA(dev);
 }
 
 static void pxa2xx_pcmcia_initfn(Object *obj)
-- 
2.41.0

