Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2969556ejb;
        Wed, 25 Oct 2023 12:13:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWbf3CweQ6BJUNiaw1NkH59jQzN7kYtrHcdZ9ser2IDbi/pTAfjm2ECAVUrewMZUxwFzok
X-Received: by 2002:ac8:7d01:0:b0:41c:bb5e:52a6 with SMTP id g1-20020ac87d01000000b0041cbb5e52a6mr18898346qtb.45.1698261197282;
        Wed, 25 Oct 2023 12:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698261197; cv=none;
        d=google.com; s=arc-20160816;
        b=tE6R3/SUFObtPClIpJhVX5j23Uap6DEH5J3fXlPAtITrY1F0p/320LOX0MA8q/ZcFP
         qZQ80rnhoc+jxSj5L60toPNwXZs/j9Tt91oYctXDDoPGAZq+qqv8OqHJouerRjFd0okB
         cg23ofYhXDKo2UATQZxPSAcZM5PUgxoKn4dCxzMq1rb73OYetijeSLioAf9IHcxS2FmF
         B+J3S5WcQ8zP7NTEIjKzoFBg/Lof2ODfkpC1FYtvS2rzhSDcQ/PTdTPuYXP2q9w3PGQf
         GlYsYKQ8a8tc/qTujTtqWZnmzKE5dfz1mbQ1XjaFpBqYrydy7dtNcIuz2V3bizIsTCel
         G0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mB1ujEtWUOmOeJwT57HbXRVHFW4v0Dxs3+X0YxZJ+mw=;
        fh=xhblChOHn/9ohxmBdExAv8vV4InD5nB0dX6yBSUq53Q=;
        b=fOvhtQ/aR+4ZGlU0lTL6McPntpzxAMjq0X4FhpsFwp2AYslH9//XhfesF19iAZg+zL
         mB4K+1caMpr2dMu/yhC1x92GhfBDRXVSW7lWhZmNutEo+7Bdmv2SpAi7g3ecTjdwpiD0
         7Kw5EIPRQFZrpYMVBq2xroEwWc9b8JnVnc1ZYxvOTdANSWyHCiO+8pMwlJfxQfOdEjys
         5VEEWS/KmJEFgFUFes/qVDkj5wi/F+r7LeoSkCOt4SBtHG8QXmPnFH9G8jUp8LIMBc+E
         srbCknUWDeYTYUGm+3ee68/D1iDwleh8xe7WLuVHFj+rrqMMY1HFlCrPd2MN0j6cKdk0
         0aQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Ah6/gAs6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19-20020ac859d3000000b00417f76c422fsi8569165qtf.380.2023.10.25.12.13.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 12:13:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Ah6/gAs6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvjGc-00076G-G0; Wed, 25 Oct 2023 15:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjGa-00074t-Ca
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 15:10:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjGX-0000ua-1y
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 15:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698261004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mB1ujEtWUOmOeJwT57HbXRVHFW4v0Dxs3+X0YxZJ+mw=;
 b=Ah6/gAs6D9WFdlasPGlsZHo6NwFIdGGJzEcfS+n5NxDZd+Ig/25+Ma3Dk4sz9mOadth52Q
 rTZY33ldZJPUEvTbFxbgRBtevb6o+6nMRsMhYfV2877wS2D6mtsTBSlSNB26O60x6ewiuj
 N61UvpMz8p+pr/OFVRqmGJN67GSwBi4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-Nrk6G0ZyOh-mgDcuhu8_OA-1; Wed, 25 Oct 2023 15:09:48 -0400
X-MC-Unique: Nrk6G0ZyOh-mgDcuhu8_OA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66E3F857CE9;
 Wed, 25 Oct 2023 19:09:48 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95D542166B26;
 Wed, 25 Oct 2023 19:09:47 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v6 20/23] arm/kconfig: XLNX_ZYNQMP_ARM depends on PIXMAN
Date: Wed, 25 Oct 2023 23:08:14 +0400
Message-ID: <20231025190818.3278423-21-marcandre.lureau@redhat.com>
In-Reply-To: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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
X-TUID: B0GtwGI7+n9G

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The Display Port has some strong PIXMAN dependency.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig         | 3 ++-
 hw/display/Kconfig     | 5 +++++
 hw/display/meson.build | 2 +-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 7e68348440..57178bc299 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -451,7 +451,7 @@ config STM32F405_SOC
 config XLNX_ZYNQMP_ARM
     bool
     default y
-    depends on TCG && AARCH64
+    depends on TCG && AARCH64 && PIXMAN
     select AHCI
     select ARM_GIC
     select CADENCE
@@ -463,6 +463,7 @@ config XLNX_ZYNQMP_ARM
     select XILINX_AXI
     select XILINX_SPIPS
     select XLNX_CSU_DMA
+    select XLNX_DISPLAYPORT
     select XLNX_ZYNQMP
     select XLNX_ZDMA
     select USB_DWC3
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index 4d8b0cec40..1aafe1923d 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -134,3 +134,8 @@ config MACFB
     bool
     select FRAMEBUFFER
     depends on NUBUS
+
+config XLNX_DISPLAYPORT
+    bool
+    # defaults to "N", enabled by specific boards
+    depends on PIXMAN
diff --git a/hw/display/meson.build b/hw/display/meson.build
index 2b64fd9f9d..9c06aaee20 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -58,7 +58,7 @@ if config_all_devices.has_key('CONFIG_QXL')
 endif
 
 system_ss.add(when: 'CONFIG_DPCD', if_true: files('dpcd.c'))
-system_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx_dp.c'))
+system_ss.add(when: 'CONFIG_XLNX_DISPLAYPORT', if_true: files('xlnx_dp.c'))
 
 system_ss.add(when: 'CONFIG_ARTIST', if_true: files('artist.c'))
 
-- 
2.41.0

