Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1401007lfp;
        Thu, 6 Feb 2020 04:53:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqxUzKhUJIXEmClOH6B1PO09in9OUg3jfpcnzeSaKi1311T2shetrQE7bPEunxsS8srBynID
X-Received: by 2002:a0c:f513:: with SMTP id j19mr2144234qvm.206.1580993623224;
        Thu, 06 Feb 2020 04:53:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580993623; cv=none;
        d=google.com; s=arc-20160816;
        b=ns+Ba1hskJXkj2UZzBRZRZdcxt7vHCFXcl+IOjQ4bzujHmYxAAFt+O2CEEB9od0DAj
         d2Vvi93DUBTkvKwEXDXarnWZ8Ie1EoPDikEK/dsoojM0cfR9CrNRdWmFgVLFtMDkUGmV
         v9LMrUAOnJmlShDaYu5d4i30BuY+NNS6W6B6pwmVfgUibDV27f5FKEMlfVtQT01LWnT6
         GkfBv9hKbtfMWSgN+K2w4UxFeV2eOAD/px9n5Fri2qfeXoUcfN0EE9ZqOwcUJPesPTAD
         ExcSRq+2LDKJS5oSIpp7OSS5ZtxqZfJttEmVrGw3m2AqqPKHsCw5qufXA8qTQIJSzIxJ
         bY/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Iav+ozSGlJZyt5njPyWljCZcPOCkQqqHlnoTko2GfJc=;
        b=V+bLSIEj5b1ljHjipsttU/rcrHyskYZKZHdffipaUIbGASvrHC5WUaQz07eJ2/lYCz
         KUAIgkhFoZ8rKBqaGlXDY77vmVF2kFTqp9Moj7FcyebNyQ1LZplS25lI9rKiMjAaCDlF
         /m2OP3qmIxWad21xQhqlKDMoEMhqEyi1duz9bL8xb3g4Fo//gAb9vQFUlSejy/KUljkc
         CDGSAxlwL96YhivNRyCfeliNuKoEQvjRl35h183SL6U/9XXdrcq+RcTJTIrdjVXmYKAS
         vDaOcE0Cpnm0gFwq+WSEOWqLWENzEjcuawI+gqkA6PHQjo7AAghjZTO2lsrSss2EBm5V
         X/lg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3si1453779qtq.169.2020.02.06.04.53.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 04:53:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izgf8-0007bP-L5
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 07:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56560)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1izgcd-0001Gk-ME
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 07:51:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1izgcc-0006Hb-FR
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 07:51:07 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:46301)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1izgcc-0006CW-1X; Thu, 06 Feb 2020 07:51:06 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MA7X0-1ipGDL3NvO-00BbCn; Thu, 06 Feb 2020 13:50:50 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/12] hw/pci/pci_bridge: Fix typo in comment
Date: Thu,  6 Feb 2020 13:50:25 +0100
Message-Id: <20200206125027.1926263-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200206125027.1926263-1-laurent@vivier.eu>
References: <20200206125027.1926263-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dvrfDhR6DTOhirCpblgtkyZOsXurCpz2lUT8+BgCe+AC302dNr2
 TyTDGbePLn0u7x5scTLfwu/wap6ChKmf2n0vqw96mki9X/o3feJJ5Y0l1hDbqKRO05j85by
 1g4poy999FyyG/2D42fHg2IJ4lb30AIljABO/cgq5EUyRJ/P6/bcboeX/ut9XT55vJqosWs
 BMcJrxnflp0kyKKMrHv4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0amfNGgEKrE=:JOnQLYNPdK2mG5x28jln3w
 VsLmBCqKzffy5h7CkXAOj0ZVUC0naVXBxP7yGWak5OrUYvIEdrM5oUDW2M9hIac26F+4D/TaB
 bsI29F3s9gmitrELcHjKTausehV8xLpPfUBIiZRMv1yKT7KaS7PCP9q6WTXbWNC3Je+jgjrMy
 4tLcomWUZCi/urFYVwcQy0xK7aNwX8rdaeyaPjFP/3VciYglnLOwo1++I5f/4aRZ1RIl+nmnT
 U8P200T0BGyC70gj2Ea9/13sBs5H5YRUs7FYKASoyyLsRif1QK7QjJwKTl3Gu56O1uSFuUBAQ
 afNOc3Wyn9HlcoqO7l6j8swpqa6aaonT97EVGFcCFmHklraML/IYK3xg54LznX2Z26FC/OEv+
 oSiS4xDb7Qf1zWkJst4HL9cOKI9QBNRLzj3KyvEYIRZGBkxqGtPg4R1kzO9r31IuOKr12mfyY
 KN+6HhgKc2S4VNOMxqOOKYmMMcX3pJfNEaEwKA6Sga7TBeUMQYOvbOL+dmpFQ4FYTvfdCW0/1
 VrV8unbKGzrIfInCnI0pO65gXprSSnv/4+AgM7xx5B4/cuEtgY5JGoskCkhrpBEBLb1wZUfvw
 xhTAlvEVl+44/l9B+sejwUAVZiEgl0ipsbHmpXsUuqrpFOgLlPhzRT2GdWY7zZnxwBnOP53Kw
 Iq/WBBFf+4/gvZosN5RoYEWF2lmblmlTAPSAydV9iL9u92LnedX9QP76WrMZJoDZiST2ymR8m
 ruskjq0RgzpnhV62v9eBaBjE2OMfs0T+p9Y+aKsvo/KqMC7sJdYFYPaGrojK6PHePOzgQJduS
 l1BY0WsscTAUMQKvx2tHerAxLaJpUBcP6IPaA/ATKEHfhoYkOfzQgWKvmYbh3MXXLvCzFzR
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-trivial@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-arm@nongnu.org, Julia Suvorova <jusual@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N2lItKE3CJfx

From: Julia Suvorova <jusual@redhat.com>

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20200205185123.210209-1-jusual@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/pci/pci_bridge.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index ba488818d292..99c674e94954 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -108,7 +108,7 @@ void pci_bridge_dev_unplug_request_cb(HotplugHandler *hotplug_dev,
 
 /*
  * before qdev initialization(qdev_init()), this function sets bus_name and
- * map_irq callback which are necessry for pci_bridge_initfn() to
+ * map_irq callback which are necessary for pci_bridge_initfn() to
  * initialize bus.
  */
 void pci_bridge_map_irq(PCIBridge *br, const char* bus_name,
-- 
2.24.1

