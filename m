Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4648547ejc;
        Wed, 18 Oct 2023 06:44:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd5NjrZFylyeGNl2975xPxps3YpP2Ik/RE79sO8OxajCJoimssMUFKsambKyMP0YXKV8B2
X-Received: by 2002:ac8:58c5:0:b0:418:12d4:c096 with SMTP id u5-20020ac858c5000000b0041812d4c096mr7100724qta.2.1697636686307;
        Wed, 18 Oct 2023 06:44:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697636686; cv=none;
        d=google.com; s=arc-20160816;
        b=uOMwEuCMo+QMUkRvF8Shl7kbvj8LPq/nNRXY5gVWt/bqjmBiVv727c8KvPmPZphKqO
         RlCTTeiPRYll/2swwXe1OEyq7W9qdFeUOYzqrwa57QyI2+4MMzPYooZnKuBfCNx8R7d+
         TG6oPpwh0/4yy9gDWREKwXNFER6H5CioeTSjIsOmW3FkmwPIjqHE9d40s8ohUm5MR30l
         JX8TODDVWima8OUIfeHNoMH9wcpRscAlVlrfyS/oZIb4BWcsbNY45F0n3MhosyGrk+sL
         fpNbMwfjAxaoo1bP/mz6GixwFz2j349YcBLlg4NE0ZL5KgzEm3uhO9f5szzX2ivqcZKv
         tdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Jm7z9T8PI3TaN5Ibcu8ZAR34M0vHVjaqargdypAD7v0=;
        fh=Szf62vI2mdRKxFE/n72kPzB8VnojR8p9hbcglhPNB2o=;
        b=l9DxFbSCZV0V179pnfbPwr0x9O2SBa0RISSW4tvvS6UzK23tHnvTzc/AayEDox2CCk
         94C+mOIIvPjVZfaXO22c3DKbiN7bVIkmaeCcou7mcoa4IpfCXvnBJztRcrIA93rOu2F0
         R5SYLl5U6fB5o9B3YK7t7gcIBtMVcYe3Mq1ttnPgagftId9Ghkd0I3ulW8xh5cRoavEp
         HHI5Ojp0xmpMvsUaBCmYPSjIcPLk+kd7/xqvTOd1IpJNjASV+L7YOkL3OX9rHgV0fwOS
         U0x0TfvdTFxi8KLr1q9HZQN39586cU/xbUcSWcl2ZuesPpQ4sDu/LTKF1OzYDqu3oHqO
         9X2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B9SKyDc2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3-20020ac85f83000000b0041987badccasi2661344qta.233.2023.10.18.06.44.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:44:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B9SKyDc2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt6mE-0002XV-Qv; Wed, 18 Oct 2023 09:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6m6-00022f-Pc
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:39:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6m5-0006Mb-0p
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:39:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697636388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jm7z9T8PI3TaN5Ibcu8ZAR34M0vHVjaqargdypAD7v0=;
 b=B9SKyDc2WahwG2UnK0LDbUxJ8VnvU8PpW7U4SqDOTPTswsWE24KWGUeIioTAqPWEiWs2pn
 MyAqnkgsa9pEaEfIMrXZffTGdbK+uvr0fuoUW5jH8f7plNmfVLt4bikCHu3HQo5MNh4j1j
 s21WqpdUOzPlX9aV9WG14wUZo8Nk2VQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-LXUBcsCwNY6KCFjeFIe6UA-1; Wed, 18 Oct 2023 09:39:44 -0400
X-MC-Unique: LXUBcsCwNY6KCFjeFIe6UA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63F163822555;
 Wed, 18 Oct 2023 13:39:43 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1743C15BB8;
 Wed, 18 Oct 2023 13:39:42 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v4 18/19] hw/display: make ATI_VGA depend on PIXMAN
Date: Wed, 18 Oct 2023 17:38:19 +0400
Message-ID: <20231018133820.1556962-19-marcandre.lureau@redhat.com>
In-Reply-To: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
References: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: woSNZzfSYvf0

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 configs/devices/mips64el-softmmu/default.mak | 2 +-
 hw/display/Kconfig                           | 2 +-
 hw/display/meson.build                       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/devices/mips64el-softmmu/default.mak b/configs/devices/mips64el-softmmu/default.mak
index d5188f7ea5..8d85607571 100644
--- a/configs/devices/mips64el-softmmu/default.mak
+++ b/configs/devices/mips64el-softmmu/default.mak
@@ -3,7 +3,7 @@
 include ../mips-softmmu/common.mak
 CONFIG_FULOONG=y
 CONFIG_LOONGSON3V=y
-CONFIG_ATI_VGA=y
+# CONFIG_ATI_VGA=n
 CONFIG_RTL8139_PCI=y
 CONFIG_JAZZ=y
 CONFIG_VT82C686=y
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index 1aafe1923d..4d8a6c4af8 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -125,7 +125,7 @@ config DPCD
 config ATI_VGA
     bool
     default y if PCI_DEVICES
-    depends on PCI
+    depends on PCI && PIXMAN
     select VGA
     select BITBANG_I2C
     select DDC
diff --git a/hw/display/meson.build b/hw/display/meson.build
index 9c06aaee20..344dfe3d8c 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -62,7 +62,7 @@ system_ss.add(when: 'CONFIG_XLNX_DISPLAYPORT', if_true: files('xlnx_dp.c'))
 
 system_ss.add(when: 'CONFIG_ARTIST', if_true: files('artist.c'))
 
-system_ss.add(when: [pixman, 'CONFIG_ATI_VGA'], if_true: files('ati.c', 'ati_2d.c', 'ati_dbg.c'))
+system_ss.add(when: 'CONFIG_ATI_VGA', if_true: [files('ati.c', 'ati_2d.c', 'ati_dbg.c'), pixman])
 
 
 if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
-- 
2.41.0

