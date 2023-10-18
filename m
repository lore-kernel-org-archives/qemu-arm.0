Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4645716ejc;
        Wed, 18 Oct 2023 06:40:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcmaB6SVK6qffy4EnQyz4K3sUjjArH1FioX7GjjFW3nan0fkzbx84FE2SAjEj7yTjleQLu
X-Received: by 2002:a81:9255:0:b0:5a7:c8a9:79e8 with SMTP id j82-20020a819255000000b005a7c8a979e8mr5625702ywg.4.1697636426629;
        Wed, 18 Oct 2023 06:40:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697636426; cv=none;
        d=google.com; s=arc-20160816;
        b=w5rwhjEKK7pBEuzeX3QWjMYa44tSSr5xsU3YAm5xycxMbxec+UnEBPVbPWfdsqdqwz
         GGvWl95KEfXFlPmChZn23KIxfDTxlrFbf91bI489oniGSjwk92SrM/OSp8ktOjHU+z2U
         f7oTPCde64vhdFWEhVoOr5q6iAys7kpSW1oqhM1RDi9EHp+yO7Kdr+glndOM0AyZNgRb
         +OvqFgguVUA8iRwRNrZZjqtsjsmpjb60pr5NhIkVnB9bOrWyhU9QHzj8MJH3kGAGMHXg
         jlmMzS5QfE0FQismBSP/GExMwasPkSYvwPcb8j/9IWjmnkTYMGW8Lbzoj/DHozPmsxwS
         bM/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=hg0biFB7vETvgcvc8KpZ1Cbgo5SlKmszX0I8iHxn70Y=;
        fh=Szf62vI2mdRKxFE/n72kPzB8VnojR8p9hbcglhPNB2o=;
        b=WZWzoI+VPa+2bl9YHE/RtFNLRHdMxB9J81WdnXEfoy34Hch6bxt2P/xEx6OdRdpxzM
         L5ORy59yhzoTzwFwxKTTkDQDPdx47joRynruhgDAEBgJzv1bOh2nzvgV0FHSy7n83CTn
         CeKey6r1JCwUKZlyzY+m5URoZ/K1ya9Mz0tWLmBbWs6kPq96NQKKndQxkk7xEdyE8H0F
         ROGAqCpPaO420Pr0uT7YbqjI78ONHUeox7gC+OgwtG42eiQ0YoALaF/76Bnj0I7SdKJn
         zql+il2LF4pCEmJkk3ajl3+XMcSpUj8tLb2sXyeQHgu7PN4hU3X2QHlGL02Kdps2l5D4
         8WSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QeBrSoJ2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13-20020a05620a414d00b00773bf6a6260si2792869qko.724.2023.10.18.06.40.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:40:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QeBrSoJ2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qt6l6-00081h-Mj; Wed, 18 Oct 2023 09:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6l4-0007va-Kh
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 09:38:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6l2-00069l-L4
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 09:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697636324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hg0biFB7vETvgcvc8KpZ1Cbgo5SlKmszX0I8iHxn70Y=;
 b=QeBrSoJ2XsuK2PJMh2xtBomes8NWWJ6mNj8u/VUTW50E+ipaLR6KiXbT5QRXVMlWrI+AN+
 28BwP/sOHeT7gLPjsHKjicUuEDLBleGzkUIEVwITyUnWeky0cbIL/NuofBHsD9Zw16f0zh
 FEWKfuekfhV/J2NV+SI9sFVxMs/3jJ0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-8HYfpNMbPPCObeGRaVOSIg-1; Wed, 18 Oct 2023 09:38:26 -0400
X-MC-Unique: 8HYfpNMbPPCObeGRaVOSIg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14C13185A7B5;
 Wed, 18 Oct 2023 13:38:25 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A00F492BFA;
 Wed, 18 Oct 2023 13:38:23 +0000 (UTC)
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
Subject: [PATCH v4 00/19] Make Pixman an optional dependency
Date: Wed, 18 Oct 2023 17:38:01 +0400
Message-ID: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
X-TUID: bfQcIp9Fobh1

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
 system/vl.c                                  |  64 +++---
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
 25 files changed, 537 insertions(+), 117 deletions(-)
 create mode 100644 include/ui/pixman-compat.h
 create mode 100644 include/ui/rect.h
 create mode 100644 ui/console-vc-stubs.c

-- 
2.41.0

