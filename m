Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1994510ejb;
        Tue, 24 Oct 2023 05:03:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1ejnrHx2+xEv4VjYUnMfuxsGtxDhU7E9jDhXIE3LW8SR8nAtwO4x+xkzk6c0Y559yiaH7
X-Received: by 2002:a05:620a:424a:b0:774:3147:4274 with SMTP id w10-20020a05620a424a00b0077431474274mr13187276qko.14.1698148979896;
        Tue, 24 Oct 2023 05:02:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698148979; cv=none;
        d=google.com; s=arc-20160816;
        b=Ry4C2TR0KxI+veAq3IPz2JUjNdMuLOl+DEnkO4jDROqO7zki6+l7lWRhIL7Mb46uUg
         2RQrbKlqMsjITT5bDU4THLSFFWIHgKpxJ0Yuor3amG+UxSwjsepo319/QHUlbJ1KLh5y
         s0O/wkE/DOsOl5AhSay3Yfq1L/nvdLsbBAOO0m94OVTrceKjd3TApcEgsnhkVXQL1iTN
         TIZzoLXy+xJqGTjhL52bYA8dVEfZYnL97Gfg+hUVLcylpuBUr1uJNdXy6q0JBsTvY6sN
         L8tNtIZ6C4I82AYG/UfuN9wfWixvqEvjFWMq1oSL9J3KLSxvVNDMSz1vUG/C/6CIljpU
         0BZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=fUkM+YbmdxeqIeFgISxxIygx7+76lTGJgfGWgTfyCB0=;
        fh=QNIclum8GsucSyBGxFiGC6znXbjiGybaU3PlJzsh8o8=;
        b=ZIzq+dM5sAtF078UlW3S/xitE8k+4QEEPsuacVPT4BtM1kbjteVfKdG7o4s1lpM8/m
         6pEKZsOoeogxlsj3UaG8K8kbbc9ozGMNzMayj9d0r5cc6m1fZQo3pRlzFp5Vty9IP33+
         PoVexQ0m9IIbvmtDGk7P+ZVc99SENlkO7rlRUohJcKnDQ7nXxMRO4uxZQZqoEedheQui
         m2XLXPRG1i2Hrjx+wls0aX72mr+3N5XXMWd882ptYKPiagqkmhBcmyk3EAQHi7OC5lh/
         JuQRhy6Ff3yl8Qw9UTqkw3NiBpK4/yJzWEOAdAVQAQ8L6nps7A6RCv9zfWz/sXW/DM//
         +3Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=JJVW2I2h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s25-20020ae9f719000000b007770d8ed700si6760448qkg.460.2023.10.24.05.02.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 05:02:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=JJVW2I2h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvG7S-0003hQ-Fp; Tue, 24 Oct 2023 08:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1qvG6r-0003Nd-Tt; Tue, 24 Oct 2023 08:02:11 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1qvG6p-0001IY-B1; Tue, 24 Oct 2023 08:02:09 -0400
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-41cda69486eso27437591cf.3; 
 Tue, 24 Oct 2023 05:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698148925; x=1698753725; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fUkM+YbmdxeqIeFgISxxIygx7+76lTGJgfGWgTfyCB0=;
 b=JJVW2I2h2jxYeig5LCuv6sWmRZTgY0VMs5xk7vh1vSliVNuX5X++dAb2UcToC4niyv
 KHWqJ5oVU+rmwXNB7jtnbDwNsfjb9AYSwXJlmstcL+fNVniDht3DpkPlbLtdHmLht9n/
 atXyY05B+/6pPEq2Twoh1YAwwUuqpryVa3MsaQejvfReCMX2Eiob63GTe/X662Fon973
 /yh8djFDt9ocZ6sXx68aC2rGnTS2UnANMzLQc4ydQLNclLQiDvD045ITIlv6to4/bUjC
 oWkoh5ZjR59Dp0ER+oPdahzTPpZXF8JMDxOUs3nwIgZ6P6PY0mFOsERPmZkDVjQV2qhy
 s7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698148925; x=1698753725;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fUkM+YbmdxeqIeFgISxxIygx7+76lTGJgfGWgTfyCB0=;
 b=t6IEFbLJvuldy66dZOp6ePVEZy2Wh5ZSyn0/RCUHosjZ7s+0LdWCA0R0ZntfJoADVz
 6dSwkkLWnjgpnWuyO6br4G6ICf5fjVICDA5lIsUyguxDaVoMBVBihixLUwoQyFuh23Wu
 T4SLwXRqYxQRBVg21ZaOFGXfZJjnasFfGN/aYEBfnYOc2KaDL86pM8WS8P3zT/qjcuzD
 Zj0hdU3qkVX4db+66s5piywLxlRF60tPaXyqE13oBhx70tcHgwR/BKs4gb1XLrMtSEcw
 BkSJQxSVkNzdvEGT/cmQDkeF6s9DUicFk4ooCPBlfoK3zfPaQMpRrlwwaoG0GuNLgTCc
 jCRw==
X-Gm-Message-State: AOJu0YyB9ltu4MilDZp4jfxyUqNPB+w4dQth/EwVPSaM0LFhzfqDcl6f
 J2lM184Tn4SCMvTH2aF+l2JkOVhVJkQr300i57Yg5l1n2ak=
X-Received: by 2002:ac8:5a43:0:b0:40f:ce6d:775e with SMTP id
 o3-20020ac85a43000000b0040fce6d775emr14388476qta.42.1698148924392; Tue, 24
 Oct 2023 05:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
In-Reply-To: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 24 Oct 2023 16:01:52 +0400
Message-ID: <CAJ+F1CJsjOriKc0kiW7+Omw=Mvm8t1xwDqeZPicgo6ahabhxCQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/19] Make Pixman an optional dependency
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-ppc@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Dr. David Alan Gilbert" <dave@treblig.org>, Eric Blake <eblake@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ut49v7Rg2Jf0

Hi

On Mon, Oct 23, 2023 at 5:49=E2=80=AFPM <marcandre.lureau@redhat.com> wrote=
:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> QEMU system emulators can be made to compile and work without Pixman.
>
> Only a few devices and options actually require it (VNC, Gtk, Spice for e=
x) and
> will have to be compiled out.
>
> However, most of QEMU graphics-related code is based on pixman_image_t an=
d
> format. If we want to provide mostly compatible QEMU machines with or wit=
hout
> Pixman, all we need to do is to have a small compatibility header with ju=
st the
> bare minimum for those types (see "ui: add pixman-compat.h"). There are a
> limited number of operations related to geometry that are slightly better
> implemented in QEMU (without Pixman, see "virtio-gpu: replace PIXMAN for
> region/rect test").
>
> Without this simple compatibility header approach, QEMU at runtime become=
s a
> very different emulator (without graphics device/board, display etc) and =
full of
> "if PIXMAN" conditions in the code. This is a much worse outcome imho, co=
mpared
> to this small header maintainance and compatibility story.
>
> Fixes:
> https://gitlab.com/qemu-project/qemu/-/issues/1172

Before I send v6 with minor changes, do we have a consensus on the
approach using the small pixman-compat.h header to keep 99%
compatibility with a qemu compiled with pixman and minimal changes?

thanks

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
> Marc-Andr=C3=A9 Lureau (19):
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
>
>


--=20
Marc-Andr=C3=A9 Lureau
