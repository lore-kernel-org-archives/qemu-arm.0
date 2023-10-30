Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1772972ejc;
        Mon, 30 Oct 2023 03:48:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2AJi3mn9qixTZwsPn6ybz7qSXOxSPIEy9qSnYDlEMPYiJsvxGX0YQpgkQuJEiCXj6GTuM
X-Received: by 2002:a05:620a:2445:b0:767:c572:ab10 with SMTP id h5-20020a05620a244500b00767c572ab10mr11676303qkn.35.1698662921514;
        Mon, 30 Oct 2023 03:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698662921; cv=none;
        d=google.com; s=arc-20160816;
        b=ywoBHERn0oWXZzr+bGnFQCMDKeKX7XaaLPNAOx0zjTzRtrc0ClWkuVH7hjSBowPby7
         2I/MsZjWqzqLtzxgxxOI4x9rpnr7o6tVx1qQ7lFQnpIib9mUGn/nAnMnys57GcZyqhZJ
         QDPUcfBRClxAx3+QKWik4BGsZv2cGDjnXlvM7w8ku6/uavkbfi3tCIseOS32fHtYPgJ5
         5nwlvcHiIsUZt34MBSRxZdzAYOwctjd4/IBWkBJ5GnFXHqlojxtnleN1ZU0VPuC27ytk
         CUVTlPqCjlnj+diJ2dYz7jE2Q7yIigyw9Seu++ZJFfs7JgHyCmX8LqUSO6LeuHcBlMuy
         SFRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ftE2QToSA8QkGQbWLVf87T942sM4Z5tDKhKOeXFidoE=;
        fh=Ci9wK9l4xitOqL9yuxnV9ynOTs+kWb6MxTZujaeFoew=;
        b=rsstgSl+etforABP1unBnbFG8kr6x/3vRrqvV06lghh3/WVwVHVmVnXGXgFwE1FEYD
         LS7ZdC+UDxiDm2eZjsbVIeah2wixiEf7jKQHXRaQmeq4oVPgSe6qoVPWg5jA0xy2oPVc
         yNXyJHYTW0UYkm3yQUYHlFdn32j2QK3BA5y/ewa5ERWM4dEP8b7ad+FtaFSASRk2KUna
         0GtjQ8YlKgEyKt28Qw6BZe8TZ2mWn3TRfB0WVIr7PIGJBQdwiE6nTPM6EglpSda6ftIY
         4a+jeXAOvDj71sbgL5XHSupwrW1KcE/Q5x6fBsxP8DBtXj2Y+aVEAGnY9N4lMEpi8Ult
         Gjvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UoPboFJf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11-20020a05620a0c4b00b00779f2fca0f5si5494116qki.695.2023.10.30.03.48.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 03:48:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UoPboFJf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qxPoX-0001TT-LH; Mon, 30 Oct 2023 06:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPoV-0001Sn-1o
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 06:48:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPoS-0002SY-Rd
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 06:48:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698662883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ftE2QToSA8QkGQbWLVf87T942sM4Z5tDKhKOeXFidoE=;
 b=UoPboFJf6rkAQ08fKUHbVDIPU+NynfQwdPXwz2sGulcHkerQqchHNUAmcJRSBaPz6RQymU
 cVBqwyUFHx5GNIc9SErXk89g46np4xHlUSKkFSwJijtwsdsaltpqsHANA22CGCaN4GrcYr
 MSd6f3e1DVkJ1quyiP7a3eUKhLTP9WA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-X_38ek9iOMuB5PNbS_194g-1; Mon, 30 Oct 2023 06:48:00 -0400
X-MC-Unique: X_38ek9iOMuB5PNbS_194g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F648101A529;
 Mon, 30 Oct 2023 10:47:59 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DBDE1C060AE;
 Mon, 30 Oct 2023 10:47:57 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v7 00/23] Make Pixman an optional dependency
Date: Mon, 30 Oct 2023 14:47:31 +0400
Message-ID: <20231030104755.124188-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.478,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: NXefpv/DuWIu

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

v7:
- make FULOONG depend on ATI_VGA
- various r-b/a-b

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

 configs/devices/mips64el-softmmu/default.mak |   3 +-
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
 hw/display/Kconfig                           |  10 +-
 hw/display/meson.build                       |   4 +-
 hw/mips/Kconfig                              |   2 +
 meson_options.txt                            |   2 +
 qemu-options.hx                              |   2 +
 scripts/meson-buildoptions.sh                |   3 +
 ui/meson.build                               |  22 +--
 28 files changed, 542 insertions(+), 139 deletions(-)
 create mode 100644 include/ui/pixman-minimal.h
 create mode 100644 include/ui/rect.h
 create mode 100644 ui/console-vc-stubs.c

-- 
2.41.0

