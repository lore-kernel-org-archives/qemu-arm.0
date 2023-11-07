Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp137882ejv;
        Mon, 6 Nov 2023 23:21:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrTI5T/9AkuD9ROHyqNTXnuNLvqKRzZFMdsofa6xIEfbOwPDNFXUd8j3j04z2ytr0kJoqN
X-Received: by 2002:a05:620a:2990:b0:773:e488:320a with SMTP id r16-20020a05620a299000b00773e488320amr40051934qkp.59.1699341673894;
        Mon, 06 Nov 2023 23:21:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699341673; cv=none;
        d=google.com; s=arc-20160816;
        b=WcVGHIEGkV9Rp0lRjZAbc509ScPsDYa78m6JyJVPax9WSlQvsLWoA46GgO1K/0QG8S
         NRrzVMVr4LOT1kK80Pf8mRAHTN6HBfYwniT+7uWLSI6vcR0vry+2PSGqmRE+zK1ASLat
         mOS/aj/zEblgc+mkNx10Yp2laApuyKM7oS+N0PayoBT8rz1loAd9UdoWcvybihv9D5tG
         f4F17P+nN3Fmrp0SDAnqxtC6t6klEPWbD6CpWRv4Wp53bpeDgWyR1bdHnX2aOjhX7CaU
         R5FzwVtttUITJV/fZpDByLZSiCuaQ1OYPzYDVRkDaJ+e3hC+zjrMVYk3+p0V8VRrrbhe
         R2cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2dTeKlsF2I7zQAqovNNgVB/FgoobsTX2dh4aN4tFqx4=;
        fh=fkYrzFR+QvNq3uPu1byjUAfopd9LdPZUaTg0badJd3A=;
        b=pw5ZOy8IJEtC6BLNWQ2ImE9wRzgd0Amm7NeKSVk/kP+S9Lpq4lnQp1cCsi0Bv/fiR4
         k+rc4Iiy2v5NFfC+0Fyqxfybfsb5nqc64Mx1U3BdXhY566z8PupOzL80oh1AVIWF65Xq
         QYD1WaaIw5xcC9MAchJyDzCBnsGgBhP6/YM1N9UyRELh5nivQlLK2luXE/dq07yZmn3Z
         tiQ/FesoZcXNDB27oItm3oSxk+02TM6vwmv0ghl5XKcAC6Y4l7G8K+OezLp0fUYyWZR6
         tKaliRiag2ILpcIpEPbEjuU4rDHy5gpRNfW7lUZ9P52wwgmsLDi9FEBRn3GK4GED/tid
         76Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MUg2UTbd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qr20-20020a05620a391400b00775808a3365si6610729qkn.0.2023.11.06.23.21.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Nov 2023 23:21:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MUg2UTbd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r0GOa-00029R-Kw; Tue, 07 Nov 2023 02:21:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1r0GON-0001e9-SW
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 02:21:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1r0GOK-00038N-1g
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 02:20:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699341651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2dTeKlsF2I7zQAqovNNgVB/FgoobsTX2dh4aN4tFqx4=;
 b=MUg2UTbdqueKP3lXdGrfM4/8xRTKC2n8ha7YYYWoq4kc9vz1Imh2A2LLQ+BcYXRSAnYXx8
 QIu2UcTdZGg285VckWer0aJ/0gLVjKyo/lW8dSLmCW12VkTkoInrZaB3vz+RUYB+NVwNH0
 kgCKUltEDGeUd1v7l/ba5hnVH2oAo+k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-jA2LgMtcOeuZp8InmMIcAQ-1; Tue, 07 Nov 2023 02:20:48 -0500
X-MC-Unique: jA2LgMtcOeuZp8InmMIcAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4C26811004;
 Tue,  7 Nov 2023 07:20:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB23A2166B26;
 Tue,  7 Nov 2023 07:20:46 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 stefanha@gmail.com, Gerd Hoffmann <kraxel@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v8 20/24] arm/kconfig: XLNX_ZYNQMP_ARM depends on PIXMAN
Date: Tue,  7 Nov 2023 11:19:10 +0400
Message-ID: <20231107071915.2459115-21-marcandre.lureau@redhat.com>
In-Reply-To: <20231107071915.2459115-1-marcandre.lureau@redhat.com>
References: <20231107071915.2459115-1-marcandre.lureau@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: EK218vvUxUJs

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
index e35007ed41..8ce288a40c 100644
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

