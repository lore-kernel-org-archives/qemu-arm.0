Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp296637ejb;
        Tue, 10 Oct 2023 00:39:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFknITs+yrBkHErFDEXnohRf/LXErAEw5hQ163ZW4oaI4BTYe+YS/iFYZtJbKrh4dsV/fIU
X-Received: by 2002:ac8:5b0d:0:b0:406:948b:1b29 with SMTP id m13-20020ac85b0d000000b00406948b1b29mr22965436qtw.17.1696923560893;
        Tue, 10 Oct 2023 00:39:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696923560; cv=none;
        d=google.com; s=arc-20160816;
        b=djELrTTmgrrufnjm82dy3VcS+7E6puyqgX98Dfo+MfKnJfEvA9P+YOyg3MpMDs36pH
         JMr1A0FNyfY77NbL09pUtUe0VoN+IZYUtNmmQlvdt7KhDJDrJ7uz43FTcbF5Audg7sPm
         imKriqkiQwMB6eA7U63BFpRsLSKRWuZCCxmBZZfrhRtjlI/vakyNpFmOxrbFCdAeux9X
         fN0XsFbPVliMTdTBG84JqkzweXEVMCnkr6YswLzAOFUug1AhRpOE7pVpr5hqoiwdq4X4
         issLr/aOm6LTgY8r6TV8hhWVQU0r+1nQg26oLhuQMygpoAg2fdt7BHLqoTVELqf6NZdh
         sQiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Hc2QZ4nBETh7OVuaqnBgC4zCwlBNWGsCzCg39ebpqu8=;
        fh=46wv1No7OOLuZCRbeGSaV31Ktmo6cwaISz6jgi4/xrY=;
        b=IXlt6BllIAF6pDS6F7jdoPgrXW4Gqsfn36HqUFPjixQmadsCQEOJtJei8v08gaq1GU
         jQy9ahbNnAeENfXgJCc3uf9Dthpwx7HUz2D2ruKAkLHbtyCasWp2qQ67handahTg9WjD
         3KqxM8yB57i2Bcl4YBDIzmSpkfEm1Heo3FoV933rdGShjG2O2dQcXrxxsq01Y5FGG7sK
         VcDI/wVbVk+2lm7QfF1lYSbo1Ytn47MpzZU5pw55oUpfHilm4cTtg/N5GTUOB1KWCyZT
         yds8BsWIeby40+6dYM9+xcxiaz0G2rK7LFWEWuqYCCprxb1XGUGQDptor9PkSVuW27SS
         cUPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ArB+A9Fc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5-20020ac85a45000000b00410a9ddbcf7si7344208qta.163.2023.10.10.00.39.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 00:39:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ArB+A9Fc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qq7KJ-0000E0-RH; Tue, 10 Oct 2023 03:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7KI-0000Cp-9F
 for qemu-devel@nongnu.org; Tue, 10 Oct 2023 03:38:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.145.221.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7KG-0001bZ-GY
 for qemu-devel@nongnu.org; Tue, 10 Oct 2023 03:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696923523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hc2QZ4nBETh7OVuaqnBgC4zCwlBNWGsCzCg39ebpqu8=;
 b=ArB+A9Fc2qu5OZyujIqkxAHMa82N3S9JhY0eZBpn+Q/uBC025VjTFN4dRCzkhtLENFurUy
 H+XR4EU0YfMJ5xK7ga+jhZxJK/sI1mayiwN1Qj+gfICUZaif5cYsmM5yKwlcfYzcDx+QIJ
 FibJS1uDiwTigA+BUYArgdOw2mA+8Ko=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-HSwQyOjEOLyqJTV1JgG2nw-1; Tue, 10 Oct 2023 03:38:39 -0400
X-MC-Unique: HSwQyOjEOLyqJTV1JgG2nw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4580780349A;
 Tue, 10 Oct 2023 07:38:39 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5D8840C6EBF;
 Tue, 10 Oct 2023 07:38:37 +0000 (UTC)
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
Subject: [PATCH v3 01/18] build-sys: add a "pixman" feature
Date: Tue, 10 Oct 2023 11:38:13 +0400
Message-ID: <20231010073830.606570-2-marcandre.lureau@redhat.com>
In-Reply-To: <20231010073830.606570-1-marcandre.lureau@redhat.com>
References: <20231010073830.606570-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=216.145.221.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: jST5VHGuXYUQ

From: Marc-André Lureau <marcandre.lureau@redhat.com>

For now, pixman is mandatory, but we set config_host.h and Kconfig.
Once compilation is fixed, "pixman" will become actually optional.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build                   | 10 ++++++++--
 include/ui/qemu-pixman.h      |  2 ++
 Kconfig.host                  |  3 +++
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 5 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 79aef19bdc..c30da15ce6 100644
--- a/meson.build
+++ b/meson.build
@@ -813,10 +813,14 @@ if 'ust' in get_option('trace_backends')
                      method: 'pkg-config')
 endif
 pixman = not_found
-if have_system or have_tools
-  pixman = dependency('pixman-1', required: have_system, version:'>=0.21.8',
+if not get_option('pixman').auto() or have_system or have_tools
+  pixman = dependency('pixman-1', required: get_option('pixman'), version:'>=0.21.8',
                       method: 'pkg-config')
 endif
+if not pixman.found() and (have_system or have_tools)
+  error('FIXME: pixman is currently required')
+endif
+
 zlib = dependency('zlib', required: true)
 
 libaio = not_found
@@ -2118,6 +2122,7 @@ config_host_data.set('CONFIG_SECCOMP', seccomp.found())
 if seccomp.found()
   config_host_data.set('CONFIG_SECCOMP_SYSRAWRC', seccomp_has_sysrawrc)
 endif
+config_host_data.set('CONFIG_PIXMAN', pixman.found())
 config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_SOLARIS', targetos == 'sunos')
 if get_option('tcg').allowed()
@@ -2836,6 +2841,7 @@ have_ivshmem = config_host_data.get('CONFIG_EVENTFD')
 host_kconfig = \
   (get_option('fuzzing') ? ['CONFIG_FUZZ=y'] : []) + \
   (have_tpm ? ['CONFIG_TPM=y'] : []) + \
+  (pixman.found() ? ['CONFIG_PIXMAN=y'] : []) + \
   (spice.found() ? ['CONFIG_SPICE=y'] : []) + \
   (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
   (opengl.found() ? ['CONFIG_OPENGL=y'] : []) + \
diff --git a/include/ui/qemu-pixman.h b/include/ui/qemu-pixman.h
index e587c48b1f..d37feb5e3c 100644
--- a/include/ui/qemu-pixman.h
+++ b/include/ui/qemu-pixman.h
@@ -6,11 +6,13 @@
 #ifndef QEMU_PIXMAN_H
 #define QEMU_PIXMAN_H
 
+#ifdef CONFIG_PIXMAN
 /* pixman-0.16.0 headers have a redundant declaration */
 #pragma GCC diagnostic push
 #pragma GCC diagnostic ignored "-Wredundant-decls"
 #include <pixman.h>
 #pragma GCC diagnostic pop
+#endif
 
 /*
  * pixman image formats are defined to be native endian,
diff --git a/Kconfig.host b/Kconfig.host
index d763d89269..b6ac2b9316 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -11,6 +11,9 @@ config OPENGL
 config X11
     bool
 
+config PIXMAN
+    bool
+
 config SPICE
     bool
 
diff --git a/meson_options.txt b/meson_options.txt
index 6a17b90968..0bc886f2dc 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -222,6 +222,8 @@ option('l2tpv3', type : 'feature', value : 'auto',
        description: 'l2tpv3 network backend support')
 option('netmap', type : 'feature', value : 'auto',
        description: 'netmap network backend support')
+option('pixman', type : 'feature', value : 'auto',
+       description: 'pixman support')
 option('slirp', type: 'feature', value: 'auto',
        description: 'libslirp user mode network backend support')
 option('vde', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 2a74b0275b..2dda295236 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -148,6 +148,7 @@ meson_options_help() {
   printf "%s\n" '  pa              PulseAudio sound support'
   printf "%s\n" '  parallels       parallels image format support'
   printf "%s\n" '  pipewire        PipeWire sound support'
+  printf "%s\n" '  pixman          pixman support'
   printf "%s\n" '  png             PNG support with libpng'
   printf "%s\n" '  pvrdma          Enable PVRDMA support'
   printf "%s\n" '  qcow1           qcow1 image format support'
@@ -401,6 +402,8 @@ _meson_option_parse() {
     --disable-parallels) printf "%s" -Dparallels=disabled ;;
     --enable-pipewire) printf "%s" -Dpipewire=enabled ;;
     --disable-pipewire) printf "%s" -Dpipewire=disabled ;;
+    --enable-pixman) printf "%s" -Dpixman=enabled ;;
+    --disable-pixman) printf "%s" -Dpixman=disabled ;;
     --with-pkgversion=*) quote_sh "-Dpkgversion=$2" ;;
     --enable-plugins) printf "%s" -Dplugins=true ;;
     --disable-plugins) printf "%s" -Dplugins=false ;;
-- 
2.41.0

