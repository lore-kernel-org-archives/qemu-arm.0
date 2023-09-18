Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp2923826ejb;
        Mon, 18 Sep 2023 06:55:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmdRSt5LJHUD5DS04x0MlPcGKQpQaq/fOKd9TZJiTZaog9DDusGuLXLT70ABFrN3Lt5/dm
X-Received: by 2002:a05:6214:4b07:b0:655:f3a8:a461 with SMTP id pj7-20020a0562144b0700b00655f3a8a461mr9658557qvb.65.1695045343241;
        Mon, 18 Sep 2023 06:55:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695045343; cv=none;
        d=google.com; s=arc-20160816;
        b=cXHB5e7gpTO22KvCCY0OjhrLVQ9hodK+XVizJpFnNAZ723iHQzMVqlAdGC7ppVa8f8
         eSIwcxjhfnHIrdFt0VayUIV94i5M/l84yo5WRf9IoGRoFnC2+m4pkbcEmvU0nC55Anod
         XpceofszEDvdz7gVW7Bc2PikizsC6bzKx5ZFN1v1EbVhLOIu9BeoFMgY6bpXEKS1wfjJ
         81oz9eFkQLOUZsdGumYpRP8ec8ti6QXuF/O97Ppz8gUOJM9Jn/0EvXiJr9q6fKlqjVAI
         ngR9MdtYR8XP4z3ZtW9vQOhnCtVRjB4/Bq9bMQf+I/5RvP8cEZq3KjVQwb/gbGmgEn6T
         BbyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hqA84g3Q6bwesCoYv84+27Pj9t+dAThTuHxGb8k+LrE=;
        fh=aZ1f44tgfuuA1VfUpjOiETUXN1ugwoPhmxqbTU6+134=;
        b=hOUVexnpNkPagr+UwDtWpWrbZD64SGMInM8HfIhDlGqHfQCdgPIqlQ2MhPqBNSmC2c
         ohS+RxSL77jlQ02rgPyNSWaK8w9c+7tPGMfmWcwDWifZbsddHQku07N9RgJiShDKYIgs
         nC+AxaFG0EdS3LXsdlysuG1BfjHuveCGrJbGTa2cypz5aqqg0eYNdqqct70p/UOIsKO2
         IaW8hZqc31P2g8N8FkyceZwiEYkK/0j1v+nT2ao0s2TdI+iVxKF/gR/I1vhrIphSD5I8
         lFUzYKyfZszPLNaOoZKh0fDqyt/Vyu0UPV9uq3HNuEWAQfqN2pO6GkVgFWXj1JRgu3o3
         PaXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g8B0ezKb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p19-20020a0ce193000000b0064f3f53bca5si3707263qvl.119.2023.09.18.06.55.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Sep 2023 06:55:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g8B0ezKb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qiEhW-00076G-Ig; Mon, 18 Sep 2023 09:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qiEh1-0006OH-4O
 for qemu-devel@nongnu.org; Mon, 18 Sep 2023 09:53:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qiEgh-0000hD-DJ
 for qemu-devel@nongnu.org; Mon, 18 Sep 2023 09:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695045197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hqA84g3Q6bwesCoYv84+27Pj9t+dAThTuHxGb8k+LrE=;
 b=g8B0ezKbBUdLQ5CKffg7HGi42BhEYEm4DvbHfTaQR1ST6qt/5Rgao3nfygJufFRXfOpKri
 t5RPp82K6AyWBB8Othcjfs+2eVmj/P3TW3UOGItnD3Jkha0qRieGTYh6+XsiWCEYuZ3UaL
 cVdaVWpFQ74lM4PBC2rWHpbAUHKKRRI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-co3bmy3JMM2IGM_o7m86sQ-1; Mon, 18 Sep 2023 09:53:16 -0400
X-MC-Unique: co3bmy3JMM2IGM_o7m86sQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9A6E945923;
 Mon, 18 Sep 2023 13:53:15 +0000 (UTC)
Received: from localhost (unknown [10.39.208.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C059C10EE859;
 Mon, 18 Sep 2023 13:53:14 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v2 15/18] arm/kconfig: XLNX_ZYNQMP_ARM depends on PIXMAN
Date: Mon, 18 Sep 2023 17:52:02 +0400
Message-ID: <20230918135206.2739222-16-marcandre.lureau@redhat.com>
In-Reply-To: <20230918135206.2739222-1-marcandre.lureau@redhat.com>
References: <20230918135206.2739222-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: vBE6wKJULzj0

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The Display Port has some strong PIXMAN dependency.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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
index 413ba4ab24..a7166b29d5 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -57,7 +57,7 @@ if config_all_devices.has_key('CONFIG_QXL')
 endif
 
 system_ss.add(when: 'CONFIG_DPCD', if_true: files('dpcd.c'))
-system_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx_dp.c'))
+system_ss.add(when: 'CONFIG_XLNX_DISPLAYPORT', if_true: files('xlnx_dp.c'))
 
 system_ss.add(when: 'CONFIG_ARTIST', if_true: files('artist.c'))
 
-- 
2.41.0

