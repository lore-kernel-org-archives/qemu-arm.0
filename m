Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2966926ejb;
        Wed, 25 Oct 2023 12:08:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHy/C6So6VOvK5cdLVxh+BkkoWekej+nogT2LnJYjHUIiS1QLbCi+8mKqgfIjTh96PbmZu2
X-Received: by 2002:a05:600c:358c:b0:406:44fc:65c9 with SMTP id p12-20020a05600c358c00b0040644fc65c9mr701851wmq.8.1698260930421;
        Wed, 25 Oct 2023 12:08:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698260930; cv=none;
        d=google.com; s=arc-20160816;
        b=TKTBYhg52fpN5aRU5su+hrjKE+pWHVhDDxW8yax4H56gqv0/uYoRoaTNPbT6ATiBlX
         GZRLP0OCDpp5IP29YwFIsYKOvOornoVy/wpHt53b7L5/3tRylPXZAvEj2Qewd99I0Ik9
         GfUm2W6SLYF0C6tCXq2pH306TpjDBalDMInN+rA8yHc6azH+dbfvuG6V+b4dPCZxRycC
         BCyItCi2trz3twsXtUbVMJPk9rFrLkprn/PyEnqKOCJ4ZTU37pT4hT5QQeKcEYgrOpSW
         gEdRBBTUvtlwWsg6+SwqIHaBh64bj0NNa10/STRIjCzcy4wBzcT3K+smAqSXBy65fHlQ
         dilQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=QqyxiUTZ+G6FoOyUMECgfwkhmPDpbQpdWr8HVHcua/c=;
        fh=xhblChOHn/9ohxmBdExAv8vV4InD5nB0dX6yBSUq53Q=;
        b=S52Ipp8l5WRpliGHZGgh/MGz3DYVSH9Xi+Z753Ykca8ZVGK9UrWZNdHpEZjf4rq8IL
         x52LKgGMBno3sDNFboEqSyrPOhjicFmdfbKky2em6VJEKwqfmOQzuiJlKrtZsjMSk1aw
         nIZ6/tWefTX4jf8wyHCadvi1I8jcP4ZJzugLcPk8v4J/O2BfXGqQhlcnVpSaOjNy66XF
         QIM9H7O1gns9MwCtPj2co13tCzHjYkVzAFKP295MgN1IXJIJmKqimHk51nladK+XIOuo
         1aVKf7A+spyR4GRUv2ajLABXkCx8SE1dWCo1wn8oaaG7M+nkZrvdUHVVUH2ARHIF82NJ
         NZ6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HJLj6NUI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k35-20020a05600c1ca300b004063af37ef3si393289wms.137.2023.10.25.12.08.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 12:08:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HJLj6NUI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvjF4-0004Sn-8n; Wed, 25 Oct 2023 15:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjF3-0004SP-0q
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 15:08:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjF0-0000Ci-IO
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 15:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698260906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QqyxiUTZ+G6FoOyUMECgfwkhmPDpbQpdWr8HVHcua/c=;
 b=HJLj6NUIKcrgoUaeUZJ2rc7qHnfRZ7UacacSq5tx66vRdy8ZiBjHPBHm6vkvp1amwME7UQ
 G5ovW81/0Y/QIq8fk+H9sKk9qC/Q9hQuVUWmDn/FseF03Bmf4OQzSbEZ+PTf3qODO0f5EG
 V7sKPwCAXV/CSt92Sj3Pg+MOrMzF/6U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-_EsrvhkdO6SxJfHLE0yrzQ-1; Wed, 25 Oct 2023 15:08:23 -0400
X-MC-Unique: _EsrvhkdO6SxJfHLE0yrzQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E510E185A781;
 Wed, 25 Oct 2023 19:08:22 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36430502C;
 Wed, 25 Oct 2023 19:08:20 +0000 (UTC)
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
Subject: [PATCH v6 00/23] Make Pixman an optional dependency
Date: Wed, 25 Oct 2023 23:07:54 +0400
Message-ID: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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
X-TUID: LrEb2Xc1Lm/h

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hi,

QEMU system emulators can be made to compile and work without Pixman.

Only a few devices and options actually require it (VNC, Gtk, Spice for ex) and
will have to be compiled out.

However, most of QEMU graphics-related code is based on pixman_image_t and
format. If we want to provide mostly compatible QEMU machines with or without
Pixman, all we need to do is to have a small compatibility header with just the
bare minimum for those types (see "ui: add pixman-compat.h"). There are a
limited number of operations related to geometry that are slightly better
implemented in QEMU (without Pixman, see "virtio-gpu: replace PIXMAN for
region/rect test").

Without this simple compatibility header approach, QEMU at runtime becomes a
very different emulator (without graphics device/board, display etc) and full of
"if PIXMAN" conditions in the code. This is a much worse outcome imho, compared
to this small header maintainance and compatibility story.

Fixes:
https://gitlab.com/qemu-project/qemu/-/issues/1172

v6:
- add "build-sys: drop needless warning pragmas for old pixman"
- rename pixman-compat.h -> pixman-minimal.h
- add "vl: drop needless -spice checks"
- add "qemu-options: define -vnc only #ifdef CONFIG_VNC"
- add "vl: simplify display_remote logic"
- in "vl: move display early init before default devices", rename the introduced
  function qemu_setup_display()
- adapt "hw/sm501: allow compiling without PIXMAN" following Zoltan review,
  using warn_report(), droping Error argument
- various r-b/a-b

v5:
- fixed "vl: move display early init before default devices" patch

v4:
- added "vl: move display early init before default devices" patch
- code style fixes
- a-b from Zoltan

v3:
- improve transient meson condition in first patch (Paolo)
- use muxed console as fallback by default (Paolo)
- make pixman-compat.h closer to original API
- keep "x-pixman" property for sm501 (Zoltan)

Marc-André Lureau (23):
  build-sys: add a "pixman" feature
  build-sys: drop needless warning pragmas for old pixman
  ui: compile out some qemu-pixman functions when !PIXMAN
  ui: add pixman-minimal.h
  vl: drop needless -spice checks
  qemu-options: define -vnc only #ifdef CONFIG_VNC
  vl: simplify display_remote logic
  vl: move display early init before default devices
  ui/console: allow to override the default VC
  ui/vc: console-vc requires PIXMAN
  qmp/hmp: disable screendump if PIXMAN is missing
  virtio-gpu: replace PIXMAN for region/rect test
  ui/console: when PIXMAN is unavailable, don't draw placeholder msg
  vhost-user-gpu: skip VHOST_USER_GPU_UPDATE when !PIXMAN
  ui/gl: opengl doesn't require PIXMAN
  ui/vnc: VNC requires PIXMAN
  ui/spice: SPICE/QXL requires PIXMAN
  ui/gtk: -display gtk requires PIXMAN
  ui/dbus: do not require PIXMAN
  arm/kconfig: XLNX_ZYNQMP_ARM depends on PIXMAN
  hw/sm501: allow compiling without PIXMAN
  hw/display: make ATI_VGA depend on PIXMAN
  build-sys: make pixman actually optional

 configs/devices/mips64el-softmmu/default.mak |   2 +-
 meson.build                                  |  25 ++-
 qapi/ui.json                                 |   3 +-
 include/ui/console.h                         |   2 +
 include/ui/pixman-minimal.h                  | 195 +++++++++++++++++++
 include/ui/qemu-pixman.h                     |  15 +-
 include/ui/rect.h                            |  59 ++++++
 hw/display/sm501.c                           |  46 +++--
 hw/display/vhost-user-gpu.c                  |   2 +
 hw/display/virtio-gpu.c                      |  30 ++-
 system/vl.c                                  |  84 ++++----
 ui/console-vc-stubs.c                        |  33 ++++
 ui/console.c                                 |  19 ++
 ui/dbus-listener.c                           |  90 ++++++---
 ui/qemu-pixman.c                             |   6 +
 ui/ui-hmp-cmds.c                             |   2 +
 ui/ui-qmp-cmds.c                             |   2 +
 ui/vnc-stubs.c                               |  12 --
 Kconfig.host                                 |   3 +
 hmp-commands.hx                              |   2 +
 hw/arm/Kconfig                               |   3 +-
 hw/display/Kconfig                           |   9 +-
 hw/display/meson.build                       |   4 +-
 meson_options.txt                            |   2 +
 qemu-options.hx                              |   2 +
 scripts/meson-buildoptions.sh                |   3 +
 ui/meson.build                               |  22 +--
 27 files changed, 539 insertions(+), 138 deletions(-)
 create mode 100644 include/ui/pixman-minimal.h
 create mode 100644 include/ui/rect.h
 create mode 100644 ui/console-vc-stubs.c

-- 
2.41.0

