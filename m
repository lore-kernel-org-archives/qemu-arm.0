Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp8272932ejc;
        Thu, 2 Mar 2023 06:09:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+sXHOO50HYKlUJw3Unq6JwpKoXz2S9lWrtaPJPMtM2LcmQazd3QxIvD42ZtvsRRT7+tETJ
X-Received: by 2002:ad4:5e8d:0:b0:571:f87:a665 with SMTP id jl13-20020ad45e8d000000b005710f87a665mr19673090qvb.35.1677766191150;
        Thu, 02 Mar 2023 06:09:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677766191; cv=none;
        d=google.com; s=arc-20160816;
        b=CN82BPGWXqcQKlbYSvscGYKSCQjRVaqbmpU1jVdWcTzAX9gL2ryX1lLbK1bMETsehH
         c5MQP/4MnrP/KJWRGFxuVhd8Jz65r93KD1Eq3aRImi3V2qp2hJNoOp6TyANu50YXgz9u
         gOikMnZ0qnRo6jXGJANA4y6QfA0aFxik65I7sncs54yMMLGDbDG/SPihbOu+NcdqUZW2
         sc71nhifu6TVC4lmgeKriHE/Sp0WvIeAmWcTlehNqqWj//e+robiyEJaPLcZe4SeSkfD
         v/FulKVmfc2WU8KIZbgd51aXR7qcbmTjdtQlG+jRPszUKKXyzq1m94Y4/p+K6ikNb1zO
         V7YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=mG+yRUgys0wekSu+yTWFS79wgh7VNnUc4l/qBnVpGiE=;
        b=eFKJ/tpwHQQVtvgRXqrFfB9TYNEdQUkRb631N6pOmKBSnLoJABpuUC/f7bnsfBXg2o
         BIgCIKnQTNQ5dvO1TZWBiodZmqY6ZAvwbYy8DU0ZNEIfPKMaA0DDRBp1uuLGI2e/+kPX
         G8wEKH+OA8ikvOuajQJdBekhPx+fSQGPOeZcvoKTsmztRi+rbecqkAKKHkaBgRC55G80
         +JSYIcTBlQ3/zDfj1STdKvOz6g3O62+ZdW3fiO62+zwofTWrJKZA64ssbmqfKz8mksKX
         MeCZotXmX5oY4VJxS30lj1h768+xZjKNzEwDd7NXSubsOOMV5Zw0LGo9XJkfEIJCc5aR
         Qcqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SrHk4z5O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18-20020a0cdf12000000b00569480deb50si14241570qvl.205.2023.03.02.06.09.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Mar 2023 06:09:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SrHk4z5O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXjcf-0007UQ-D5; Thu, 02 Mar 2023 09:09:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pXjcd-0007Tr-Oh
 for qemu-arm@nongnu.org; Thu, 02 Mar 2023 09:09:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pXjcX-0008Ml-KX
 for qemu-arm@nongnu.org; Thu, 02 Mar 2023 09:09:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677766159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mG+yRUgys0wekSu+yTWFS79wgh7VNnUc4l/qBnVpGiE=;
 b=SrHk4z5OV8n46Yy8wgRxBa2oneZ9VilEuqaoIa+cRaiSb2PTE/vv8p3n/IkkYucWPt4IZZ
 2AoTUM4LJ4S11CP4E6CxgEf1Gv2Iuzs73ufLB87S0OgYEVubCygiRQ6NKFBjJk/rYaE79E
 ivgGFAmq2sZWq94I5XHqK6xKsE2+6f4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-T7QxzZBcMG6fjNlD3uXCwg-1; Thu, 02 Mar 2023 09:09:18 -0500
X-MC-Unique: T7QxzZBcMG6fjNlD3uXCwg-1
Received: by mail-ed1-f71.google.com with SMTP id
 i42-20020a0564020f2a00b004c10b218caaso1834002eda.10
 for <qemu-arm@nongnu.org>; Thu, 02 Mar 2023 06:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mG+yRUgys0wekSu+yTWFS79wgh7VNnUc4l/qBnVpGiE=;
 b=RcHQo3QONue1R0ijubq3j3q9M6zyRK1DP1L2HqIC+WSb/ECMAcl61KQMleo+Kgrthy
 4T2YtQB89ihQhDJ8IMCEMOlDRCzAU2lFYS5al4repaElthRb+rStSaF2fQ3YwHh1jSjf
 wp2x61LpAOVnd/7nCNNLnIcRzGzOhPXH+qCgUSJ4pmTw4qPJx9aAor4pfFILzQ3dpF9u
 7Kbq4OIWwj0wYcc6jKMeQvysA8sMzyIEtqXL/ZxsGUKlf/QObMkxTX1VfTQ7eb1moxRc
 3CrFIHbCpFRcUh+h2LWlyh08fhJnGvywY+ersmHsqiOFVUim3BaRwDSoaoKAUgRHDQuh
 OZgA==
X-Gm-Message-State: AO0yUKUOZgZnMhsI1Q78LAHAtHDm3YX9pIt6JORPUdBPf1t8Rryxiyk2
 KfMnSfZGm5YJCr21RCoGw+bAu0zBgESv+IBMDl8t6cIqXpFH9ZzPxmgju8J7zVKXP/6baCa2ICj
 P5qOT/xARyXXja8amXCcVJhWxxa8i
X-Received: by 2002:a50:d64e:0:b0:4bc:bea1:d0fe with SMTP id
 c14-20020a50d64e000000b004bcbea1d0femr2862942edj.8.1677766157129; 
 Thu, 02 Mar 2023 06:09:17 -0800 (PST)
X-Received: by 2002:a50:d64e:0:b0:4bc:bea1:d0fe with SMTP id
 c14-20020a50d64e000000b004bcbea1d0femr2862919edj.8.1677766156791; Thu, 02 Mar
 2023 06:09:16 -0800 (PST)
MIME-Version: 1.0
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
In-Reply-To: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 2 Mar 2023 18:09:05 +0400
Message-ID: <CAMxuvawu4EWKpw_8sHGU-hVKeX_wZzpWqaRJo6kjbkYB45VWjw@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] win32: do not mix SOCKET and fd space
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-arm@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, armbru@redhat.com, 
 Peter Maydell <peter.maydell@linaro.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>, 
 Hanna Reitz <hreitz@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000cac4ea05f5eb5f8f"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: xj44FWZZaEPv

--000000000000cac4ea05f5eb5f8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Feb 21, 2023 at 4:48=E2=80=AFPM <marcandre.lureau@redhat.com> wrote=
:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> A win32 SOCKET handle is often cast to an int file descriptor, as this is
> what
> other OS use for sockets. When necessary, QEMU eventually queries whether
> it's a
> socket with the help of fd_is_socket(). However, there is no guarantee of
> conflict between the fd and SOCKET space. Such conflict would have
> surprising
> consequences. We can fix this by using FDs only.
>
> After fixing a few missed closesocket(), this patch series makes the win3=
2
> socket API wrappers take FDs. It finally get rid of closesocket() usage b=
y
> using
> a close() wrapper instead. (note that fdopen/fclose would not be enough
> either
> to close the underlying socket appropriately)
>
> v3:
> - fix closesocket() to prevent CloseHandle() from close()
> - fix direct closesocket() usage (#undef closesocket before)
> - add a test for &error_warn
> - add r-b tags
>
>
ping  (I am missing reviews, thanks)


> v2:
> - add clean up patch "util: drop qemu_fork()"
> - add a "&error_warn", to help with basic error reporting
> - fix errno handling after _get_osfhandle()
> - introduce qemu_socket_(un)select() helpers
> - add patch "aio_set_fd_handler() only supports SOCKET"
> - add meson slirp.wrap RFC
> - various misc cleanups
> - add r-b tags
>
> Marc-Andr=C3=A9 Lureau (16):
>   util: drop qemu_fork()
>   tests: use closesocket()
>   io: use closesocket()
>   tests: add test-error-report
>   error: add global &error_warn destination
>   win32/socket: introduce qemu_socket_select() helper
>   win32/socket: introduce qemu_socket_unselect() helper
>   aio: make aio_set_fd_poll() static to aio-posix.c
>   aio/win32: aio_set_fd_handler() only supports SOCKET
>   RFC: build-sys: add slirp.wrap
>   main-loop: remove qemu_fd_register(), win32/slirp/socket specific
>   slirp: unregister the win32 SOCKET
>   slirp: open-code qemu_socket_(un)select()
>   win32: avoid mixing SOCKET and file descriptor space
>   os-posix: remove useless ioctlsocket() define
>   win32: replace closesocket() with close() wrapper
>
>  include/block/aio.h            |   8 --
>  include/qapi/error.h           |   6 +
>  include/qemu/main-loop.h       |   2 -
>  include/qemu/osdep.h           |  14 --
>  include/sysemu/os-posix.h      |   3 -
>  include/sysemu/os-win32.h      |  15 ++-
>  backends/tpm/tpm_emulator.c    |   6 +-
>  crypto/afalg.c                 |   6 +-
>  hw/hyperv/syndbg.c             |   4 +-
>  io/channel-socket.c            |   8 +-
>  io/channel-watch.c             |  10 +-
>  net/dgram.c                    |  14 +-
>  net/slirp.c                    |  16 ++-
>  net/socket.c                   |  22 +--
>  tests/qtest/libqtest.c         |   8 +-
>  tests/qtest/microbit-test.c    |   2 +-
>  tests/qtest/netdev-socket.c    |  10 +-
>  tests/unit/socket-helpers.c    |   2 +-
>  tests/unit/test-error-report.c | 139 +++++++++++++++++++
>  util/aio-posix.c               |   6 +-
>  util/aio-win32.c               |  23 ++--
>  util/error.c                   |  10 +-
>  util/main-loop.c               |  11 --
>  util/oslib-posix.c             |  70 ----------
>  util/oslib-win32.c             | 240 ++++++++++++++++++++++++++++-----
>  util/qemu-sockets.c            |  22 +--
>  .gitignore                     |   2 +
>  subprojects/slirp.wrap         |   6 +
>  tests/unit/meson.build         |   1 +
>  29 files changed, 461 insertions(+), 225 deletions(-)
>  create mode 100644 tests/unit/test-error-report.c
>  create mode 100644 subprojects/slirp.wrap
>
> --
> 2.39.2
>
>

--000000000000cac4ea05f5eb5f8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 21, 2023 at 4:48=E2=80=
=AFPM &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@r=
edhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Hi,<br>
<br>
A win32 SOCKET handle is often cast to an int file descriptor, as this is w=
hat<br>
other OS use for sockets. When necessary, QEMU eventually queries whether i=
t&#39;s a<br>
socket with the help of fd_is_socket(). However, there is no guarantee of<b=
r>
conflict between the fd and SOCKET space. Such conflict would have surprisi=
ng<br>
consequences. We can fix this by using FDs only.<br>
<br>
After fixing a few missed closesocket(), this patch series makes the win32<=
br>
socket API wrappers take FDs. It finally get rid of closesocket() usage by =
using<br>
a close() wrapper instead. (note that fdopen/fclose would not be enough eit=
her<br>
to close the underlying socket appropriately)<br>
<br>
v3:<br>
- fix closesocket() to prevent CloseHandle() from close()<br>
- fix direct closesocket() usage (#undef closesocket before)<br>
- add a test for &amp;error_warn<br>
- add r-b tags<br>
<br></blockquote><div>=C2=A0</div><div>ping=C2=A0 (I am missing reviews, th=
anks)<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
v2:<br>
- add clean up patch &quot;util: drop qemu_fork()&quot;<br>
- add a &quot;&amp;error_warn&quot;, to help with basic error reporting<br>
- fix errno handling after _get_osfhandle()<br>
- introduce qemu_socket_(un)select() helpers<br>
- add patch &quot;aio_set_fd_handler() only supports SOCKET&quot;<br>
- add meson slirp.wrap RFC<br>
- various misc cleanups<br>
- add r-b tags<br>
<br>
Marc-Andr=C3=A9 Lureau (16):<br>
=C2=A0 util: drop qemu_fork()<br>
=C2=A0 tests: use closesocket()<br>
=C2=A0 io: use closesocket()<br>
=C2=A0 tests: add test-error-report<br>
=C2=A0 error: add global &amp;error_warn destination<br>
=C2=A0 win32/socket: introduce qemu_socket_select() helper<br>
=C2=A0 win32/socket: introduce qemu_socket_unselect() helper<br>
=C2=A0 aio: make aio_set_fd_poll() static to aio-posix.c<br>
=C2=A0 aio/win32: aio_set_fd_handler() only supports SOCKET<br>
=C2=A0 RFC: build-sys: add slirp.wrap<br>
=C2=A0 main-loop: remove qemu_fd_register(), win32/slirp/socket specific<br=
>
=C2=A0 slirp: unregister the win32 SOCKET<br>
=C2=A0 slirp: open-code qemu_socket_(un)select()<br>
=C2=A0 win32: avoid mixing SOCKET and file descriptor space<br>
=C2=A0 os-posix: remove useless ioctlsocket() define<br>
=C2=A0 win32: replace closesocket() with close() wrapper<br>
<br>
=C2=A0include/block/aio.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A08 --<br>
=C2=A0include/qapi/error.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A06 +<br>
=C2=A0include/qemu/main-loop.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 -<=
br>
=C2=A0include/qemu/osdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
14 --<br>
=C2=A0include/sysemu/os-posix.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 -<br>
=C2=A0include/sysemu/os-win32.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 15 ++-<br>
=C2=A0backends/tpm/tpm_emulator.c=C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0crypto/afalg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0hw/hyperv/syndbg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +-<br>
=C2=A0io/channel-socket.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A08 +-<br>
=C2=A0io/channel-watch.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 10 +-<br>
=C2=A0net/dgram.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 14 +-<br>
=C2=A0net/slirp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 16 ++-<br>
=C2=A0net/socket.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 22 +--<br>
=C2=A0tests/qtest/libqtest.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A08 +-<br>
=C2=A0tests/qtest/microbit-test.c=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0tests/qtest/netdev-socket.c=C2=A0 =C2=A0 |=C2=A0 10 +-<br>
=C2=A0tests/unit/socket-helpers.c=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0tests/unit/test-error-report.c | 139 +++++++++++++++++++<br>
=C2=A0util/aio-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0util/aio-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 23 ++--<br>
=C2=A0util/error.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 10 +-<br>
=C2=A0util/main-loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 11 --<br>
=C2=A0util/oslib-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 70 ----------<br>
=C2=A0util/oslib-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
40 ++++++++++++++++++++++++++++-----<br>
=C2=A0util/qemu-sockets.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
22 +--<br>
=C2=A0.gitignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0subprojects/slirp.wrap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A06 +<br>
=C2=A0tests/unit/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A029 files changed, 461 insertions(+), 225 deletions(-)<br>
=C2=A0create mode 100644 tests/unit/test-error-report.c<br>
=C2=A0create mode 100644 subprojects/slirp.wrap<br>
<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div></div>

--000000000000cac4ea05f5eb5f8f--

