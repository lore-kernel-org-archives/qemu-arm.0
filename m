Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp297263ejb;
        Tue, 10 Oct 2023 00:40:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGqVdVzMqMxaoVOBYFo8q+BNImmKtVR+4WEKWfZZaDtB65tVFRHqrQBsA4DrT/gFxIAJgH
X-Received: by 2002:a05:620a:1a86:b0:773:ae67:4b96 with SMTP id bl6-20020a05620a1a8600b00773ae674b96mr19998444qkb.53.1696923657865;
        Tue, 10 Oct 2023 00:40:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696923657; cv=none;
        d=google.com; s=arc-20160816;
        b=LnFz3bnR6b2+VCvTpfOw9M7ZOByHg85OBcbBYpjxy1eBJ15w7sec4TPiFXsohOF0Ko
         HA0m/vFJQzcvOEAbZ9Ulf+IUzAuArAlSixBbY4VNIIRDLzQU3W6J5EKXIr4avmGYPUaF
         ZoKkcxOGhPeQV+rM3ajybB0DWNL/7jlAkwOxT0o4fJbbw3zlaVAv2inSWQgA0yR0Xok7
         QMcES59jvN3N3qq2SA6wUnuMN+tF8DplfkJHdjHPUQvMCljTueorYUREjuJ8MzZ6ReEz
         fRqNLZvI31YcTY8DptA5peitaW29V2mlj8LEUUYOhcjFvFk1+lUahVYSgit+B0vqImwJ
         lMrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XC4NKm1yRTXryw6yI2hxLbWJMT7Ux98nMCEoj70d+Mw=;
        fh=46wv1No7OOLuZCRbeGSaV31Ktmo6cwaISz6jgi4/xrY=;
        b=o6jL4hV9dlIiNsBVARfLdjhYGR6SdWMB8j1cvgKo20czOQJL1KmM1flRDk2r8FLvgY
         Ka6P+9ozGM4T9WOqi8SU766T2fCPxES6m7fTaAprcW5hIQk1i/bcC5iMsZQ3vsZ9+vte
         U7/NKgj7U2Ahbz3Y21N3myeowClfbHgok1sJyxwuB3rrIIXTjEZjK/WA8ZT0gVi1S29e
         q/n2yP5nQzQfWG3Jmr7HXH0VDwZbCyYQCDWUD8v8VKguHIhlGKpXN4bOJfWGga278oLq
         AvM2q9ndDqmkDnZj0TWO3P+yyVdknVuyfhlZTphl4q3r5C/3fr1GD89mp1af6FQOXfzZ
         CqQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YPj97T09;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pq4-20020a05620a84c400b0076ca993da9bsi7192846qkn.613.2023.10.10.00.40.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 00:40:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YPj97T09;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qq7Lo-0003FN-T1; Tue, 10 Oct 2023 03:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7LT-0002Rn-HL
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 03:39:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7LQ-0001uM-FK
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 03:39:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696923595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XC4NKm1yRTXryw6yI2hxLbWJMT7Ux98nMCEoj70d+Mw=;
 b=YPj97T09EVOwB16eqo2lqddzeFoR073xmZAkWt8kNbLXNzDEleze4HuOIl7EcRRR2jEzMs
 +eLWNQdwNy35Bzt4k9ls6/Dfdk9iPSJfKre3qBOBE9Z4kCc1gZUOsmP7A5liHqtsllOaBD
 5uAuy9ZOrlc4YfhmHWSbD7vx7kI0s0g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-grfV2L7iPsiBYXtkFN13Vg-1; Tue, 10 Oct 2023 03:39:47 -0400
X-MC-Unique: grfV2L7iPsiBYXtkFN13Vg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FA7B810BDA;
 Tue, 10 Oct 2023 07:39:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E56D1B9C;
 Tue, 10 Oct 2023 07:39:45 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 17/18] hw/display: make ATI_VGA depend on PIXMAN
Date: Tue, 10 Oct 2023 11:38:29 +0400
Message-ID: <20231010073830.606570-18-marcandre.lureau@redhat.com>
In-Reply-To: <20231010073830.606570-1-marcandre.lureau@redhat.com>
References: <20231010073830.606570-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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
X-TUID: Fj8tqX7plRId

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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
index 14a57703d3..4a10040c19 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -62,7 +62,7 @@ system_ss.add(when: 'CONFIG_XLNX_DISPLAYPORT', if_true: files('xlnx_dp.c'))
 
 system_ss.add(when: 'CONFIG_ARTIST', if_true: files('artist.c'))
 
-system_ss.add(when: [pixman, 'CONFIG_ATI_VGA'], if_true: files('ati.c', 'ati_2d.c', 'ati_dbg.c'))
+system_ss.add(when: 'CONFIG_ATI_VGA', if_true: [files('ati.c', 'ati_2d.c', 'ati_dbg.c'), pixman])
 
 
 if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
-- 
2.41.0

