Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1294241ejb;
        Mon, 23 Oct 2023 04:37:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYokCgHo0ocj8IlRGLF4xOvkzqI98bQoVIiQmBCSf5qtCpsmdKpElkNPQgPweaczoxlpHd
X-Received: by 2002:ac8:5886:0:b0:412:2c24:f497 with SMTP id t6-20020ac85886000000b004122c24f497mr13148079qta.26.1698061036633;
        Mon, 23 Oct 2023 04:37:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698061036; cv=none;
        d=google.com; s=arc-20160816;
        b=xJ7zFAUCp7+FY9nibOQf12Czsy8ksPswohbI22dvDwCJb0jTXO7ehEU5CqD7VkZIeZ
         cpLUQTHwuifFHtqJhO+w6ae+9D85V52BczG2L1/PMgHTNKZJ1CHLEL0fh7ewZEYJvOJ9
         9OHIwWN/w8vZqPCbUxaPqm9DI+Zt/zVS2mcbnc34i+Zts3qRlKwQDyoUXz8HgTvQjCUZ
         q7GxAoA/ALoLNGdDUEduuWAWzRyUpzu5Yyp7aF7fS2VIhs0fDyDUhixQ7ujPNKVY7IKq
         +tg0f5ASN92ws7cDgdTOHUsRv2n0DtwIGioIS1iRwBKAPQQ1BlZK5Bj0f3zIocFplauD
         mL8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Jm7z9T8PI3TaN5Ibcu8ZAR34M0vHVjaqargdypAD7v0=;
        fh=r4fz3Foqx0ggjO5oI8v2vjNw5kzcdWLA6oCTkzfSTUk=;
        b=aiCeIRX1Rj/iENavL/BVCBCBz1yLrpmVgELVIxfKG7LzyfMVMRiaOH08a48I3Fy5Nu
         GEYMSj/hvfsMAbC0H7vSepRm3oCrVYbTk9dZ/3425XCsV99gxCE0qXlSZ/mt3eSa4ND3
         RsYRkzv1MmZLy7kpHEMn0Vo9oNm9iD1Tm5Ncm7f84MGKuj4bsmAbpEACkWzOirA6fbT0
         J0dY56m0zbzHtb0EBKAADoMwFqqLfYNeOYHu8kXBbPt7fvDqdZ0armr8eHq8w8nOAanN
         TX91E9aw4KHCvDPFsIAYjI5+/PJ/8XFicxZVGK3UVwP2Gu4kBy1wqmmsECXpCXekuC7W
         Z5wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="i4b/cP85";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19-20020a05622a019300b00417dc02ee2fsi5345742qtw.462.2023.10.23.04.37.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 04:37:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="i4b/cP85";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qutAg-0001PM-6j; Mon, 23 Oct 2023 07:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qutAQ-00011m-SQ
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 07:32:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qutAO-0003kT-O6
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 07:32:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698060734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jm7z9T8PI3TaN5Ibcu8ZAR34M0vHVjaqargdypAD7v0=;
 b=i4b/cP85pjMf9xQQ0DrcCSQAZqWDZO2z1gUNdZ9mxO1zPqFm+wvsnw7p/AOFScW/y2cFPw
 xliQV72oLJA4vnGNGRxFeMJXToPicn0XV53hA6JA504102MNYkTB1HTOPtO3qof7AIaNUm
 HV291ahX08dtGGWkAuL6/nTWQQN1p+c=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-412-i4dTLrFOO4ujsBGWEBIO3g-1; Mon,
 23 Oct 2023 07:32:12 -0400
X-MC-Unique: i4dTLrFOO4ujsBGWEBIO3g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2889280604C;
 Mon, 23 Oct 2023 11:32:11 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C5581C060AE;
 Mon, 23 Oct 2023 11:32:10 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v5 18/19] hw/display: make ATI_VGA depend on PIXMAN
Date: Mon, 23 Oct 2023 15:30:45 +0400
Message-ID: <20231023113047.2572137-19-marcandre.lureau@redhat.com>
In-Reply-To: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
References: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: xnlpCaihfoxX

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

