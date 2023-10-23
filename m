Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1291229ejb;
        Mon, 23 Oct 2023 04:31:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwTNGtaBEoOfui2G8tlsngLWgHByyrj3PWY2TFECb/9lHZeQOHyiY3A0yHsB1h74yiaylL
X-Received: by 2002:a05:620a:40c7:b0:779:e19b:64f5 with SMTP id g7-20020a05620a40c700b00779e19b64f5mr1115345qko.21.1698060697183;
        Mon, 23 Oct 2023 04:31:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698060697; cv=none;
        d=google.com; s=arc-20160816;
        b=nPaBrneEGUjnT4CI+QQW5KlJdwkAkaWihXFfoiCFZ88EIfz9IR/4U5pbupaMHHZ3/o
         4aUhkjNAl8GWUHPnu+VBpe/wjGs/QJ6NmOJyMWBgJUrIp///UzUUTuFHDm3uTbr1Rojg
         Fqyw2QcRiVcEKaPUjGRfF6Byxcsn2smiYjCUmCP48d6u1ugNGbiJj/CUSCBrpfhA2LCp
         NcRLilehuqpgPXQbOXEnXt9YJ7JSP7dmuIZSxZlunbcppJSmJkH/uwuV6lp/kHcSibXF
         +PU7t3A0c8N2BmLJ+hp+ebdC1U3XSxiZEKC6TzRaolq7UrJWp5xXKyWlr4p8C0ixkeLY
         ZRBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=LfReCdHjhmuPQQHFVsxjOnnqROLONk4FSPW5c1U3mIc=;
        fh=r4fz3Foqx0ggjO5oI8v2vjNw5kzcdWLA6oCTkzfSTUk=;
        b=aZgIv/Z7gK0lJJRCS9OcxHqqu4ncHEtH0OugOdVR9HKBcjnOe+pnURduRSnJvLjxqE
         NdbQuQNeKX0OSInhCQLKSgZiYQ7LU0Bc2/uCmJFWC4Y2hXcb88NdwY6AQ0qhfk/osxQe
         jEoYDh80P0YoeNzP4QTbilTnLh//s6TlBTJbRrHLjxqYzLjIrRa4zgKZY6sFihY24bmZ
         su2y/h2jhvH+OJJ6K2uwTpZHLcngkbvfOXLkoMnF2XgIZYR7VCbj5a8Vs8LO8kvZbsIt
         bbl5ZjaX1dDo14elQl6LpM+BBdzrJrafoYhY7grzJQx5WfThO8jcMJfCYhA8C7htVEJD
         flAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JbPukcAM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20-20020ad44434000000b0065b14ff72a4si5476479qvt.419.2023.10.23.04.31.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 04:31:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JbPukcAM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qut9B-0007C5-4D; Mon, 23 Oct 2023 07:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qut99-0007Bf-P3
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 07:30:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qut97-0003Qh-5k
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 07:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698060656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LfReCdHjhmuPQQHFVsxjOnnqROLONk4FSPW5c1U3mIc=;
 b=JbPukcAMsxqQRmvYUsEXSjxlHfgVNtZikhXMDcSGmqfmjeFWvn+KYhbRzVmNBvu+aznvvY
 LWdbhnBbQHGV+lrd0DcEe1VFbTIa2Jo53YwaDbFX8/gZsYhVAZlTgdT1uyoTrZcfo6LKm+
 FMlkeRKy5UT1nsUmxd883Jn2CUhHslc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-5_3YDeHbNVCQcAP0xI4ptw-1; Mon, 23 Oct 2023 07:30:52 -0400
X-MC-Unique: 5_3YDeHbNVCQcAP0xI4ptw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 203EE3C14912;
 Mon, 23 Oct 2023 11:30:52 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7453225C0;
 Mon, 23 Oct 2023 11:30:49 +0000 (UTC)
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
Subject: [PATCH v5 00/19] Make Pixman an optional dependency
Date: Mon, 23 Oct 2023 15:30:27 +0400
Message-ID: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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
X-TUID: 6bv9Wdbv1uLB

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

Marc-André Lureau (19):
  build-sys: add a "pixman" feature
  ui: compile out some qemu-pixman functions when !PIXMAN
  ui: add pixman-compat.h
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
 include/ui/pixman-compat.h                   | 195 +++++++++++++++++++
 include/ui/qemu-pixman.h                     |  11 +-
 include/ui/rect.h                            |  59 ++++++
 hw/display/sm501.c                           |  59 ++++--
 hw/display/vhost-user-gpu.c                  |   2 +
 hw/display/virtio-gpu.c                      |  30 ++-
 system/vl.c                                  |  68 ++++---
 ui/console-vc-stubs.c                        |  33 ++++
 ui/console.c                                 |  19 ++
 ui/dbus-listener.c                           |  90 ++++++---
 ui/qemu-pixman.c                             |   6 +
 ui/ui-hmp-cmds.c                             |   2 +
 ui/ui-qmp-cmds.c                             |   2 +
 Kconfig.host                                 |   3 +
 hmp-commands.hx                              |   2 +
 hw/arm/Kconfig                               |   3 +-
 hw/display/Kconfig                           |   9 +-
 hw/display/meson.build                       |   4 +-
 meson_options.txt                            |   2 +
 scripts/meson-buildoptions.sh                |   3 +
 ui/meson.build                               |  24 +--
 25 files changed, 541 insertions(+), 117 deletions(-)
 create mode 100644 include/ui/pixman-compat.h
 create mode 100644 include/ui/rect.h
 create mode 100644 ui/console-vc-stubs.c

-- 
2.41.0

