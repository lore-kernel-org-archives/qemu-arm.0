Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1216538ejb;
        Mon, 30 Jan 2023 12:26:50 -0800 (PST)
X-Google-Smtp-Source: AK7set9jRcGHNpzEyp4w9eIEGVAtHQV1aCgUI7inPxh1QH3zecWfvGmtxGC503UPBOTnhau4jujt
X-Received: by 2002:a05:622a:1303:b0:3a5:24ac:a175 with SMTP id v3-20020a05622a130300b003a524aca175mr14794093qtk.56.1675110410566;
        Mon, 30 Jan 2023 12:26:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675110410; cv=none;
        d=google.com; s=arc-20160816;
        b=OBOibOunoqAiYKnOanYirLNNLKiSypAUlE1QAsEpiFc9lk96BUXIgHEl5oz3eUQJxz
         jc92jrFXBRHZnBLqUMpXKuyGNeTGs83yANlJ3REA6ALMs9w049RstsXciQ6BTFSxg6+h
         HHBWKJy0Rik8RHpBF7xrY9ULY9ceKV9xAJPTpdcrYGLr3lcJiUrEp91tlLHOUjmlb/fx
         zKgZFacRVeHA9VZwJXuHRFcexdCiYJAVaeNqOeEM7O04lp6ZWRJi4AyC7SOpJyi+nCSi
         3JjO3FWCj/wEzsdqpDVxQBWaKqNVOZWplDK5KW4TC2tudqhWCtSWCB6MKQfyiZmjtx0f
         ATcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=r+Cb3vXl1fpQEI2y2/OxkPT/k9MpHs9866vAhPGYmTs=;
        b=woaRVxGblSl0KBBDLb7VW/inhQWBnuHp4Mf3iXFllwpzupkn6yrEasKqxZY+el3xwl
         BgseG2IVE26mejfidncrxVBc2I3nmRCR7/ccBqX7rKgQZ4PUfcIkGLf+uLeBs/HGDuDp
         7JpwhY+vpaXgEHRNuQjqegtc+2fNq9GFDQGWsKikYlAPvGwyZectLo0gSDHyQnR7b2tY
         iucUn/4UfawJxwnTs5SwlFlRE83E8ZesfyTj1n7Dl71Kztrzt0V9C7kjFQq0HtvbTDe9
         rbHry/V71145DyF3hzmwuhOXhUk7cHOul7K1lMod8kJhO/zNnmQXlFKI6kvHenRtkNWk
         XV+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SuSep1MG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15-20020ac8584f000000b003b82e360fecsi4540552qth.183.2023.01.30.12.26.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 12:26:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SuSep1MG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMahr-00025S-A9; Mon, 30 Jan 2023 15:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaeu-0007KU-TM
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 15:21:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaep-0007TJ-Ar
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 15:21:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+Cb3vXl1fpQEI2y2/OxkPT/k9MpHs9866vAhPGYmTs=;
 b=SuSep1MGcuTjJCV8ZBw65jpT5XHKoWRC9/WrNKq/48PaSaKKrCKWPiBU0a4JD6xaeuLaAv
 7iUzyqmASEUa5A0Sjjl5+JmIY8N/R5GEULUySX7gla47cFe41nJ7RYKrgqLfQ1zQ6T5Jrv
 Lma0pfrlAEQOo/p2qudqs+/O4Nozgdg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-192-GhAWMSKjOy2UiRP_jBWsxw-1; Mon, 30 Jan 2023 15:21:37 -0500
X-MC-Unique: GhAWMSKjOy2UiRP_jBWsxw-1
Received: by mail-ej1-f71.google.com with SMTP id
 wz4-20020a170906fe4400b0084c7e7eb6d0so8157031ejb.19
 for <qemu-arm@nongnu.org>; Mon, 30 Jan 2023 12:21:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r+Cb3vXl1fpQEI2y2/OxkPT/k9MpHs9866vAhPGYmTs=;
 b=S6zn4sYrN6bVWW+HiPfLL1cacas4G859yo42FqmUJO1JcXxaArtlNUsZigB7I9DYg4
 TmaAWUN+vVu/5lrdOQv94d747hLjd0uNwIsYtP3SPXxyKyZKcpu6TOZgSwc+RzRYVduF
 G9Hs5COgnGNJ6NAjefZGrvjogUSSCnaB5MuGLAuV39XUkp22egfNUSPSPKLcKg3hrR/H
 VvQC9ey7okXmZoM2hjy/qx3HJYr+9sF7nrxp0dumRIPg6L6xXkq0D5+8+/KLVPV85xUh
 Pv0Jx2U++kSQNS0uc0I4JX/MDIzIC9J3GbfNG8ePR4ez3tHNXaoyIYkbOYp0DmmvBay+
 Aq1A==
X-Gm-Message-State: AO0yUKXEzzq4LSu91VNC4zvpKXCJs6dx7P+M6+p0XI14K3avKP8Pi3IQ
 tmv2Rz1rr3+Q3bdcvi2rHD6GvIiFLGdH9+YJHaKCje0pRiIYiFqw3FhKgNy07+glKVgvE1R80nD
 YU6wnD8GoCuq2
X-Received: by 2002:a17:906:c350:b0:888:33a:e359 with SMTP id
 ci16-20020a170906c35000b00888033ae359mr5793580ejb.38.1675110096219; 
 Mon, 30 Jan 2023 12:21:36 -0800 (PST)
X-Received: by 2002:a17:906:c350:b0:888:33a:e359 with SMTP id
 ci16-20020a170906c35000b00888033ae359mr5793570ejb.38.1675110096025; 
 Mon, 30 Jan 2023 12:21:36 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 v18-20020a1709064e9200b0084c7f96d023sm7408399eju.147.2023.01.30.12.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:21:35 -0800 (PST)
Date: Mon, 30 Jan 2023 15:21:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL 52/56] hw: Use TYPE_PCI_BUS definition where appropriate
Message-ID: <20230130201810.11518-53-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: tUJGBFtgGjuX

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Use the proper QOM type definition instead of magic string.
This also helps during eventual refactor while using git-grep.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230117193014.83502-1-philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmu-common.c     | 3 ++-
 hw/virtio/virtio-iommu.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 54186f31cb..733c964778 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -535,7 +535,8 @@ static void smmu_base_reset_hold(Object *obj)
 
 static Property smmu_dev_properties[] = {
     DEFINE_PROP_UINT8("bus_num", SMMUState, bus_num, 0),
-    DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus, "PCI", PCIBus *),
+    DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus,
+                     TYPE_PCI_BUS, PCIBus *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 23c470977e..1cd258135d 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1366,7 +1366,8 @@ static const VMStateDescription vmstate_virtio_iommu = {
 };
 
 static Property virtio_iommu_properties[] = {
-    DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus, "PCI", PCIBus *),
+    DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
+                     TYPE_PCI_BUS, PCIBus *),
     DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
MST

