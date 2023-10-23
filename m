Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1293333ejb;
        Mon, 23 Oct 2023 04:35:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdjJEkR0erqc/T2YGV1r2zCbWhvQ5LTNzhDN/gReeygWCOq4N/IdfCFw+Plv25Ze6+rC3v
X-Received: by 2002:ad4:5aaf:0:b0:66d:9bb7:3026 with SMTP id u15-20020ad45aaf000000b0066d9bb73026mr11383714qvg.25.1698060927169;
        Mon, 23 Oct 2023 04:35:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698060927; cv=none;
        d=google.com; s=arc-20160816;
        b=mJkk/0WtXdTY0FDNy6fwpgQlxSOCIJMddu8UbPJx1lmS5v4Az5Bk2kWGHFuBUHpu8i
         0lB9NZjeBhyOX5rUpqYXhRCbkRClpXcSp7fZMxqMPVM2hlwDYn/9lTeqLQK/yAjnQXTC
         d39Q/RFc/K/SkB7nRFzQMiBAQX8ysoth01gcmXEijWagWPJiWE4RZMyRXIXZDGudB0I/
         qYoQEW3ay2BWQ0Ocl0iG9HY3z9QZXd7C5ycFuI9qp1xG3e9/Qk/mKUkR5GwXlNmRuzzH
         6FqNp+9rkCQH22/D6w66RGn75m+nDDAuZSLxj/XR7P/3eyj1u7qZjprMvrq0hc/UusBF
         Fnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=n/q/NO/pRi9jMkrVRFBS0odAr+jRA/bi/yczeynV3uU=;
        fh=kSFBNBGc1VuCap3+9eP1lUR6Ome5weLOKXGXmZFNKKM=;
        b=Ax7G9p3xr+89XwLPS9GRBp0NYUyeFb6gzs2j7hyKIDiYETxaDIKVDxfJsvk1n1A3Bs
         nRppEc2bjxSsAw1eKrAFVpuzhKych2w27Nf0m8oJ8+0GfyYG90M5NPFpLW01CwVmdGLn
         5bkipA9mRvnkwcGrFwEVG3K9aE79GbULECSUe+YKoUsJL5lW4ZJBr4hzuUAY3tZbie9a
         vVh9VSikAJTjMqYCCqGNDmbmrw/PjrrP5Luxyj7OTgxZCeD3pf/yavgfwokkiPfeWlh9
         +cRdMtFDhlO2FFwOae2MdMmAjQ79zbsuBBOLCwRg2fUsW9hq+/6Jp7a9l/QAnrNOUfej
         uDOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RYlUVhZR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ud4-20020a05620a6a8400b00778b6a412basi2957332qkn.640.2023.10.23.04.35.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 04:35:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RYlUVhZR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qutDF-0006fi-Bj; Mon, 23 Oct 2023 07:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qutD6-0006cI-IW
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 07:35:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qutD4-0004Eq-Id
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 07:35:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698060901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/q/NO/pRi9jMkrVRFBS0odAr+jRA/bi/yczeynV3uU=;
 b=RYlUVhZRcIpWPUo0kpKxdkT1DngH3DuW/wHUGvA6n7YWenvnGTwfHKY/F0gkQPQYuWqviE
 omycfcau0XO/PEFWnTIYWeEP6vW3sTjVcLrxKdzem4ejd7eCkQUFvzPXxCc3ygZdsqkx/P
 dzMLeEM2F9aWBS+mUe4kkgS0CaWIBnc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-uPbIZ7w8PnSSbw68mOKIwg-1; Mon, 23 Oct 2023 07:34:54 -0400
X-MC-Unique: uPbIZ7w8PnSSbw68mOKIwg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3172a94b274so1506239f8f.0
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 04:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698060893; x=1698665693;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n/q/NO/pRi9jMkrVRFBS0odAr+jRA/bi/yczeynV3uU=;
 b=vQrINVyIDn/ewWKyr1bqofnP2jAjelN5cBhtXikuOMD44/kDu6078ovQR3u6fYZpFq
 jeOrY58R2kTn1TaomFI9AP0tkaUzm3s+lGgKoFzaj2dpQtVy25LMurBo8Q4Kuhi/Syvf
 W7k/QJBOOU9rqJsxjeRmgr0ZJb9XpswDEdXKoEBNTX2b/ocF/kJTLkcO0aRu4Y7sw/Ud
 XLC8okvTLqmnHopHMSlZRtxkG+Ma7Vl3OAc8i6sF/Mf+iTCgLAybhzy1D2DoeBIISp7R
 YJPB3W1VkDQOzhd48Psf+ynCdv8yqFsd8NMY4/K1dI7R7NjNKHe5UXP4zHGKTPaaEsK+
 jO0A==
X-Gm-Message-State: AOJu0YzxBFPqONsowkNgTQUr9TvYCOnb989r0k66Mpfw6EXkgsSsXVVy
 lsivcGM9G7hE2gCFDQWs1A+BERgdSw5CmLiIXMZvJjdEkLJcnGACS4uhBUdaEcDEL3FNWjCwk2z
 4NOUyuDRJEo6L
X-Received: by 2002:a5d:590c:0:b0:32d:c09d:6ec9 with SMTP id
 v12-20020a5d590c000000b0032dc09d6ec9mr6970642wrd.7.1698060892987; 
 Mon, 23 Oct 2023 04:34:52 -0700 (PDT)
X-Received: by 2002:a5d:590c:0:b0:32d:c09d:6ec9 with SMTP id
 v12-20020a5d590c000000b0032dc09d6ec9mr6970621wrd.7.1698060892605; 
 Mon, 23 Oct 2023 04:34:52 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f2:e88f:2c2c:db43:583d:d30e])
 by smtp.gmail.com with ESMTPSA id
 n11-20020adffe0b000000b0032dbf26e7aesm7550729wrr.65.2023.10.23.04.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 04:34:52 -0700 (PDT)
Date: Mon, 23 Oct 2023 07:34:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5 00/19] Make Pixman an optional dependency
Message-ID: <20231023073430-mutt-send-email-mst@kernel.org>
References: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 6n29igVCXwOy

On Mon, Oct 23, 2023 at 03:30:27PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Hi,
> 
> QEMU system emulators can be made to compile and work without Pixman.
> 
> Only a few devices and options actually require it (VNC, Gtk, Spice for ex) and
> will have to be compiled out.
> 
> However, most of QEMU graphics-related code is based on pixman_image_t and
> format. If we want to provide mostly compatible QEMU machines with or without
> Pixman, all we need to do is to have a small compatibility header with just the
> bare minimum for those types (see "ui: add pixman-compat.h"). There are a
> limited number of operations related to geometry that are slightly better
> implemented in QEMU (without Pixman, see "virtio-gpu: replace PIXMAN for
> region/rect test").
> 
> Without this simple compatibility header approach, QEMU at runtime becomes a
> very different emulator (without graphics device/board, display etc) and full of
> "if PIXMAN" conditions in the code. This is a much worse outcome imho, compared
> to this small header maintainance and compatibility story.
> 
> Fixes:
> https://gitlab.com/qemu-project/qemu/-/issues/1172


virtio things:

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> v5:
> - fixed "vl: move display early init before default devices" patch
> 
> v4:
> - added "vl: move display early init before default devices" patch
> - code style fixes
> - a-b from Zoltan
> 
> v3:
> - improve transient meson condition in first patch (Paolo)
> - use muxed console as fallback by default (Paolo)
> - make pixman-compat.h closer to original API
> - keep "x-pixman" property for sm501 (Zoltan)
> 
> Marc-André Lureau (19):
>   build-sys: add a "pixman" feature
>   ui: compile out some qemu-pixman functions when !PIXMAN
>   ui: add pixman-compat.h
>   vl: move display early init before default devices
>   ui/console: allow to override the default VC
>   ui/vc: console-vc requires PIXMAN
>   qmp/hmp: disable screendump if PIXMAN is missing
>   virtio-gpu: replace PIXMAN for region/rect test
>   ui/console: when PIXMAN is unavailable, don't draw placeholder msg
>   vhost-user-gpu: skip VHOST_USER_GPU_UPDATE when !PIXMAN
>   ui/gl: opengl doesn't require PIXMAN
>   ui/vnc: VNC requires PIXMAN
>   ui/spice: SPICE/QXL requires PIXMAN
>   ui/gtk: -display gtk requires PIXMAN
>   ui/dbus: do not require PIXMAN
>   arm/kconfig: XLNX_ZYNQMP_ARM depends on PIXMAN
>   hw/sm501: allow compiling without PIXMAN
>   hw/display: make ATI_VGA depend on PIXMAN
>   build-sys: make pixman actually optional
> 
>  configs/devices/mips64el-softmmu/default.mak |   2 +-
>  meson.build                                  |  25 ++-
>  qapi/ui.json                                 |   3 +-
>  include/ui/console.h                         |   2 +
>  include/ui/pixman-compat.h                   | 195 +++++++++++++++++++
>  include/ui/qemu-pixman.h                     |  11 +-
>  include/ui/rect.h                            |  59 ++++++
>  hw/display/sm501.c                           |  59 ++++--
>  hw/display/vhost-user-gpu.c                  |   2 +
>  hw/display/virtio-gpu.c                      |  30 ++-
>  system/vl.c                                  |  68 ++++---
>  ui/console-vc-stubs.c                        |  33 ++++
>  ui/console.c                                 |  19 ++
>  ui/dbus-listener.c                           |  90 ++++++---
>  ui/qemu-pixman.c                             |   6 +
>  ui/ui-hmp-cmds.c                             |   2 +
>  ui/ui-qmp-cmds.c                             |   2 +
>  Kconfig.host                                 |   3 +
>  hmp-commands.hx                              |   2 +
>  hw/arm/Kconfig                               |   3 +-
>  hw/display/Kconfig                           |   9 +-
>  hw/display/meson.build                       |   4 +-
>  meson_options.txt                            |   2 +
>  scripts/meson-buildoptions.sh                |   3 +
>  ui/meson.build                               |  24 +--
>  25 files changed, 541 insertions(+), 117 deletions(-)
>  create mode 100644 include/ui/pixman-compat.h
>  create mode 100644 include/ui/rect.h
>  create mode 100644 ui/console-vc-stubs.c
> 
> -- 
> 2.41.0

