Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp176004ejb;
        Mon, 13 Mar 2023 04:53:28 -0700 (PDT)
X-Received: by 2002:ac2:55af:0:b0:4dd:a785:83b1 with SMTP id y15-20020ac255af000000b004dda78583b1mr9926346lfg.6.1678708408251;
        Mon, 13 Mar 2023 04:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708408; cv=none;
        d=google.com; s=arc-20160816;
        b=in6ACoFK3s4+fdAgmtNkiwZirX7tz6eRWWzpiWrbh3LadBLUi0yn6bGEOPfWnfECNL
         ZBf/Xsm1RgGo29hbEb8gUwbFCxyPb+A/vPkVF4cdjZaCoVArICAF6/3dWqY6KyOxELbZ
         cAbB3MDElZ9+xkGbp5bxWUxspgjBlJeSEvaTnJ/ewZVDZZXqn9r61ccj7D4+EnsRKl6D
         ItHAVpE0+lqpzWng6bumBq6I2A6pZqw3C/9ut3ImLJEp1olOxZ2peuUtBcpqey87Y24X
         RD66KFPSHSG6gBwdu21HrsZpvzmhFSg58ozhu5be6LxV74rnMI6izpWysao+dO73Vsw4
         tEuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DVOTUgNQxA7EoFWG2pPkiRykgEZXo/ib18XDRJSY/YE=;
        b=zvkp/MJ49CC9Aursqle8dmCHyB4nLktH9EpD5SvULCqEkLVRrNoXg6Qn7Kn1LEB81R
         E7OF/cloKGclGM8dWGgZbBOn3B0+X6ta5fA+DtJ7gGv8vP4PAgkSP6r0zeb4SJVF7ESu
         OjqcqClLQ5x6JT4U/Jv7eD9VZKFmQARhdBxCNN/pLSl722Tf2qvdPNshryGjLGapv06T
         hv1+n6t2xQhAgXdIJ20etr12fahSLvNmamu75TvourSXA2j+ut+fzHtN6iaH7WSfwGuu
         kNZfEAt9NTdjGKDjVPz0ylQkVr4EuP7MCuVds5TPKYAV/l5NZdF1R9cN5GSjp8OE0Pmq
         Evjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=QF6GrP3f;
       spf=pass (google.com: domain of marcandre.lureau@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcandre.lureau@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <marcandre.lureau@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q6-20020ac25fc6000000b004db1b004c45sor1082884lfg.140.2023.03.13.04.53.28
        (Google Transport Security);
        Mon, 13 Mar 2023 04:53:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=QF6GrP3f;
       spf=pass (google.com: domain of marcandre.lureau@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcandre.lureau@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678708408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVOTUgNQxA7EoFWG2pPkiRykgEZXo/ib18XDRJSY/YE=;
        b=QF6GrP3fSHFuKbSye5zV1pZrAXyBoNj3i2B1UEfcMgk1o2ZbrIZVr1spyN/9IpN7c3
         GkjlQ4eQzeAHMNKuBXbbKK3AmaNfwdghwQGbTRe/70ECqy0IZObgBz6hB3Y94H2XMVZ0
         Cl99TZalFuFivSU+i4ZiS0AeBgnywEQIVslpnEsrplZ6nxZtR6l1MKtFOtjYtoKYVna5
         DlfwSg7w4A1DRK/k8/wWSdILGzcXjTHfW1bepYYkkTE35ho0RuJtSvSEW1MxqP0J7T9h
         vdf+H1r7HC2zYaAV5TxqbsqUWKJlPabK8tkT5mcQpX5mNbmtpVf/U/oGLvacB5M5Qk9E
         bSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678708408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVOTUgNQxA7EoFWG2pPkiRykgEZXo/ib18XDRJSY/YE=;
        b=UWnwv6FdPk2VKspe3CKXA0e6cLqucU/N34WW94SEhwkJS8jsp34wEhHwS14PILrONW
         K0ubUKs7BuqTprmABJUcuR7HAOnMplJFxDL+3RfrOTwpM1kLS1HLGFR6Di+RhIcmOIHJ
         eHpo3CiRgTvGxpJ4sA3gJXI3whaZ30Maviza3OKVyALUfmKhQ33dGWZVZlQKt6DKT5GA
         GaLeVjlS+JFEhKJUdFIeUh/N6pzQXiWQxyiMfzPajj1CixhrmB42javcJEijrx59m04+
         JKe1Nj2jAl6ww6W7jDtryIdJdUVEeQwzTO3gNmhyoMUy8GZa8z/bP4iAnxSoiGLr+kx1
         elJg==
X-Gm-Message-State: AO0yUKVNc7hsM2A19eU+4FPGYOMxS9xIwg5YXmRgTfSzSazGXzqsJQbY
	abhOvHjWMxr4GX98MErua1xRIneKCM/3tTsA0aA=
X-Google-Smtp-Source: AK7set/r2z3L5RG0ihZYa2r388souYp+2/BvaauQrIDkbRfrisW0mGqpm5UpurCostDQU8u8uRG+/EEjBVRBxMUMSrg=
X-Received: by 2002:ac2:4884:0:b0:4db:4604:6328 with SMTP id
 x4-20020ac24884000000b004db46046328mr10242426lfc.11.1678708407573; Mon, 13
 Mar 2023 04:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 13 Mar 2023 15:53:16 +0400
Message-ID: <CAJ+F1CLAacXirNOmhxrbuCZDCAwArdTyicVSkFHFwofcncSe2Q@mail.gmail.com>
Subject: Re: [PULL 00/25] Win socket patches
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
	Samuel Thibault <samuel.thibault@ens-lyon.org>, Stefan Weil <sw@weilnetz.de>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Joel Stanley <joel@jms.id.au>, 
	Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Eric Blake <eblake@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Michael Roth <michael.roth@amd.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Beraldo Leal <bleal@redhat.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, 
	Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Markus Armbruster <armbru@redhat.com>, 
	Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: CjtEiiBgEZK2

Hi

On Mon, Mar 13, 2023 at 3:44=E2=80=AFPM <marcandre.lureau@redhat.com> wrote=
:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit 29c8a9e31a982874ce4e2c15f2bf82d5f8dc35=
17:
>
>   Merge tag 'linux-user-for-8.0-pull-request' of https://gitlab.com/laure=
nt_vivier/qemu into staging (2023-03-12 10:57:00 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/marcandre.lureau/qemu.git tags/win-socket-pull-reque=
st
>
> for you to fetch changes up to 0006c18362cbe1e93587ac1e8ee965c08e6970f2:
>
>   QMP/HMP: only actually implement getfd on CONFIG_POSIX (2023-03-13 15:4=
1:32 +0400)
>
> ----------------------------------------------------------------
> QMP command to import win32 sockets
>
> ----------------------------------------------------------------
>
> Marc-Andr=C3=A9 Lureau (25):
>   util: drop qemu_fork()
>   tests: use closesocket()
>   io: use closesocket()
>   tests: add test-error-report
>   error: add global &error_warn destination
>   win32/socket: introduce qemu_socket_select() helper
>   win32/socket: introduce qemu_socket_unselect() helper
>   aio: make aio_set_fd_poll() static to aio-posix.c
>   aio/win32: aio_set_fd_handler() only supports SOCKET
>   main-loop: remove qemu_fd_register(), win32/slirp/socket specific
>   slirp: unregister the win32 SOCKET
>   slirp: open-code qemu_socket_(un)select()
>   win32: avoid mixing SOCKET and file descriptor space
>   os-posix: remove useless ioctlsocket() define
>   win32: replace closesocket() with close() wrapper
>   tests: fix path separator, use g_build_filename()
>   char: do not double-close fd when failing to add client
>   tests/docker: fix a win32 error due to portability
>   osdep: implement qemu_socketpair() for win32
>   qmp: 'add_client' actually expects sockets
>   monitor: release the lock before calling close()
>   qmp: add 'get-win32-socket'
>   libqtest: make qtest_qmp_add_client work on win32
>   qtest: enable vnc-display test on win32

Would you consider those 3 patches as "features"? Is it too late to
include before hard-feature freeze? The patches were ready for the
soft-freeze deadline (I was expecting Paolo to send a PR last week, so
I could quickly follow up with those patches in a PR)

>   QMP/HMP: only actually implement getfd on CONFIG_POSIX
>
>  qapi/misc.json                       |  36 ++-
>  include/block/aio.h                  |   8 -
>  include/qapi/error.h                 |   6 +
>  include/qemu/main-loop.h             |   2 -
>  include/qemu/osdep.h                 |  14 --
>  include/qemu/sockets.h               |   2 -
>  include/sysemu/os-posix.h            |   3 -
>  include/sysemu/os-win32.h            |  15 +-
>  tests/qtest/libqtest.h               |   5 +-
>  backends/tpm/tpm_emulator.c          |   6 +-
>  chardev/char.c                       |   2 -
>  crypto/afalg.c                       |   6 +-
>  hw/hyperv/syndbg.c                   |   4 +-
>  io/channel-socket.c                  |   8 +-
>  io/channel-watch.c                   |  10 +-
>  monitor/fds.c                        |  77 ++++--
>  monitor/hmp-cmds.c                   |   2 +
>  monitor/qmp-cmds.c                   |   7 +
>  net/dgram.c                          |  14 +-
>  net/slirp.c                          |  16 +-
>  net/socket.c                         |  22 +-
>  tests/qtest/libqtest.c               |  26 +-
>  tests/qtest/microbit-test.c          |   2 +-
>  tests/qtest/netdev-socket.c          |  10 +-
>  tests/qtest/vnc-display-test.c       |  12 +-
>  tests/unit/socket-helpers.c          |   2 +-
>  tests/unit/test-error-report.c       | 139 +++++++++++
>  tests/unit/test-io-channel-command.c |   2 +-
>  util/aio-posix.c                     |   6 +-
>  util/aio-win32.c                     |  23 +-
>  util/error.c                         |  10 +-
>  util/main-loop.c                     |  11 -
>  util/oslib-posix.c                   |  70 ------
>  util/oslib-win32.c                   | 350 ++++++++++++++++++++++++---
>  util/qemu-sockets.c                  |  22 +-
>  hmp-commands.hx                      |   2 +
>  tests/docker/docker.py               |   6 +-
>  tests/unit/meson.build               |   1 +
>  38 files changed, 701 insertions(+), 258 deletions(-)
>  create mode 100644 tests/unit/test-error-report.c
>
> --
> 2.39.2
>
>


--=20
Marc-Andr=C3=A9 Lureau
