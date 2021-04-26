Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4121097lfb;
        Mon, 26 Apr 2021 12:37:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeWbGbtQY5K2f6cTZkvyscRrLjESvPnGpL8lmgFcTq6OJzSPc/jCr23NFThGRwqbV/P4si
X-Received: by 2002:a92:c90d:: with SMTP id t13mr3285723ilp.246.1619465854819;
        Mon, 26 Apr 2021 12:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619465854; cv=none;
        d=google.com; s=arc-20160816;
        b=iQ9CKru2wiF6RPJwYVEpVRRpBP1F4Y084srVl8GtsQvhbYJIdhXkyGnzNXzY28dK/M
         0YE0MGPYBMeNK5P+ygpnBQPJws6e9LsLZh7jF8RMuqjsueh5DZKjAZcluSEE/tmUeDK4
         YisKDasvVuJ4aVP1uRBvWBAmQ2o2Oh1rZtRf7+HdUErWzGdp9joPRCVj3L4WLXwuoWqI
         CJg9eCk+RWxF715SGeEkZjqy08YOO9o6aazZBNGbZGaD4BNQyr5/NESmUObK8fu6KLZw
         e3qS7ESoDzCdq2YkE6JMA6gIOWdLgvOeWJ0KuO9hFEItCBqxBCblcWOxKEKhHUn+Evz/
         le+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eMSZjv63DbKN4jYT+FhVyP0Dhkg/kXBNBsFuwQnf2tE=;
        b=0LFBTxqhXXjZ7XdAk8eic8a/BQZpvsvFqUDJq0hgFAjknxbGcZUfhMqCTQ/qP2jHap
         VH8oD4nZRwC++lHukMK55DlGo4/RoSzQ3WAUNAmltcPJdoyd06xUq85xbQisRxERPDIT
         67iyN3Tnb80vQgAVC0SKCpCMxNMYijCZqvC1+qhNC6t8v+vMs9WSk/FrWWYl0puSC/QS
         X8Sj/E2L5jRPoiGj8I6SlX25VYbxENP6kGJVzJj/uxg8AXzEcr84efl/FADyxwc1XFSZ
         H8LI26V/Z/6mfhKpiw5QNCg8WT1UXpZpXhvStVzAzpI1DXVXo5CY+63b4HMHlqk9RoQs
         gx5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Ri1FPl/Z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11si800569jap.34.2021.04.26.12.37.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Apr 2021 12:37:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Ri1FPl/Z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lb730-0001U9-1W
	for alex.bennee@linaro.org; Mon, 26 Apr 2021 15:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71C-0008SP-32
 for qemu-arm@nongnu.org; Mon, 26 Apr 2021 15:35:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71A-0008Uo-8c
 for qemu-arm@nongnu.org; Mon, 26 Apr 2021 15:35:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619465739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eMSZjv63DbKN4jYT+FhVyP0Dhkg/kXBNBsFuwQnf2tE=;
 b=Ri1FPl/Z+NZ6urhbFkRe/krdWGo+JEaw+o6LKCo3mZDI3M4V71JAZkkaCOIv9anbXQmbXe
 E9FVpJpldHg54M2B0UxwyoOZcHFN2gKJk+VsMdhusuDjuWI36w4/xvHjmIbiPA/592k6kH
 adVM2HY2tfKwTgitvquEgX0vkADVBJk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-NHflhjXmM2aCXqnYxqKA3w-1; Mon, 26 Apr 2021 15:35:37 -0400
X-MC-Unique: NHflhjXmM2aCXqnYxqKA3w-1
Received: by mail-wr1-f69.google.com with SMTP id
 j72-20020adf914e0000b02901073cdd9d65so9966922wrj.0
 for <qemu-arm@nongnu.org>; Mon, 26 Apr 2021 12:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eMSZjv63DbKN4jYT+FhVyP0Dhkg/kXBNBsFuwQnf2tE=;
 b=nV/6a80Nh/V3VB/3bx/tIHRdEBbqLVxby3/FsEpKJK8y5NyRaexVEIAKoid+2PkacW
 1Yfm0UhVRSScoU46alq7EVLeBX/s45eJm8XSDXPyLLtcgBLJLEdhmfE97kTxyy//wzFB
 aFu5M9A6XfMxqGd5Ek4ZVazOeT1e6hFqhWq+Navl/solad6+Z7hqfrVL1aWB/GYywzuX
 03uFINt8yqnr6FeBAtWgBzGK3wYXNIaPQSZZTrkQSkPXiCwDYyv/BwnQjU16drzZapoQ
 /ZSTKp6U1RXoMxoLVWIbHZkq7QqgoHvcv8dNcBFfvvD0KImrBVfX1YkuPSNaI8v4SfYN
 hC2g==
X-Gm-Message-State: AOAM531aUAVB26e/G2FHTPIuYnKSz6J1OYCojrBR15yuLl2K/lg7XPWc
 JtM02wJOyLXcDC8EhAeLwU1KrrW/aZFOz5x89qTXr/rxaucrGP+AG2WIufGTbIQ2bVGcPixAl87
 vDBYpdg16HQaG
X-Received: by 2002:adf:e60e:: with SMTP id p14mr24413109wrm.427.1619465736736; 
 Mon, 26 Apr 2021 12:35:36 -0700 (PDT)
X-Received: by 2002:adf:e60e:: with SMTP id p14mr24413088wrm.427.1619465736601; 
 Mon, 26 Apr 2021 12:35:36 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g6sm1548706wrr.63.2021.04.26.12.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:35:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] hw/nvram: Declare FW_CFG_DMA Kconfig symbol in hw/nvram/
Date: Mon, 26 Apr 2021 21:35:16 +0200
Message-Id: <20210426193520.4115528-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210426193520.4115528-1-philmd@redhat.com>
References: <20210426193520.4115528-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gIic/ii8ENcp

fw_cfg related files are maintained in hw/nvram/, so it makes
sense to declare the FW_CFG_DMA Kconfig symbol there, along
with the FW_CFG one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/Kconfig | 3 ---
 hw/nvram/Kconfig   | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index ca46b5830e7..0e4bb596c43 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -6,9 +6,6 @@ config DDC
 config EDID
     bool
 
-config FW_CFG_DMA
-    bool
-
 config VGA_CIRRUS
     bool
     default y if PCI_DEVICES
diff --git a/hw/nvram/Kconfig b/hw/nvram/Kconfig
index cab1070375f..59fac45c315 100644
--- a/hw/nvram/Kconfig
+++ b/hw/nvram/Kconfig
@@ -1,6 +1,10 @@
 config FW_CFG
     bool
 
+config FW_CFG_DMA
+    bool
+    select FW_CFG
+
 config DS1225Y
     bool
 
-- 
2.26.3

