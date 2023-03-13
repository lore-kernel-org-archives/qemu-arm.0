Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp168982ejb;
        Mon, 13 Mar 2023 04:43:44 -0700 (PDT)
X-Google-Smtp-Source: AK7set9gMYq+5Ro7h+8HJl4PcyPWdE5isRKUcLAFp+KV2fohdsbVi3J3nzlsziMrXFTqTwBhzFnW
X-Received: by 2002:a05:622a:1b8a:b0:3bf:aa39:982b with SMTP id bp10-20020a05622a1b8a00b003bfaa39982bmr57363955qtb.32.1678707824225;
        Mon, 13 Mar 2023 04:43:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707824; cv=none;
        d=google.com; s=arc-20160816;
        b=lA1Z5zl0lXiJNbvipY4Mub/d1AFUvEXNO0WZ0b8n3ashtfJdGjnCvX3sfWT+TXZXk0
         zZ2E9BF3+Q8tgKu8YVhDQpzqKVwgHIm0VzxBYBxNNi8E1zx4DnskZqjidFRGbbyTgsEK
         mJWm82oPsge9/j+vvjRYOmXtifVeMDzBYKXVfAkKWKug82M9ghYFexu8QLlebVvhnkWT
         wZVT9M4HWJJmC3rjXZ8hGty8lsqwncAdfm+5CzQputhhbZlQdG2NlVYJ9Po9oU7lc5Ha
         0m/r1cdVNvU6ff/M3Jvlg6i4kJjqOSxIj2iBYmp+3pz0sqttpDStegcOBIrg51YzH955
         vR9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=zEHY5fnzvQmt3R1XuFup6PFWBC11REmjrkGHOjS6ass=;
        b=R8ZUAjKdwbxVytP4vfGAsx0RhKAUls3pdVTAYl2DFxnSWS5YvpN1m7bhfTpZ7jpcrx
         6qOyFKW0NU10Br/HUnSyjJfZ/LPIJjvoz+odzpK/wW+tRrb+1tN3IeCSgen4OConc53Q
         UZUv4/rut7ai3zSv4XrLCwYXj2GvyJctb7uqMENuRTMswtX2L9XxfYiup7p8YGqTsbQI
         OnvjZOOz3ZD+Rv9U1Qzrv787lBcKzoqgIh+F8LlqEkOR1Y5IYCMIQBtsd+3jY9lFCald
         GbI0uhTc2/Ow9eyVM8fyiYO39tng+TaStNK0JvpH9/3W5EtvbsJch8iL802sMFMXp30l
         SANA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AGzNKCs3;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id z3-20020a05622a028300b003bd1c0508a0si5157282qtw.104.2023.03.13.04.43.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:43:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AGzNKCs3;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zEHY5fnzvQmt3R1XuFup6PFWBC11REmjrkGHOjS6ass=;
	b=AGzNKCs3nFHp3Y+o7a54nesWSbAu0kIPX613Ajza+1KuzoX4wXdO9PPy0G7VMF4sI+TwjT
	8SkctfuDF8Ovnqs6ulSWucMXd+nlndeEN+o4gRXNrxxnAM700L/pEHDzZxtRcOsJSwUeFo
	6zAYoVnn9Xv7ZfHWzYEIBns+y5WyqLg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-Jt3shYR-OfuNFT4yf8NpSA-1; Mon, 13 Mar 2023 07:43:40 -0400
X-MC-Unique: Jt3shYR-OfuNFT4yf8NpSA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3117B811E6E;
	Mon, 13 Mar 2023 11:43:40 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA769C164E7;
	Mon, 13 Mar 2023 11:43:37 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	Hanna Reitz <hreitz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [PULL 00/25] Win socket patches
Date: Mon, 13 Mar 2023 15:43:10 +0400
Message-Id: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-TUID: vKts30/noigE

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following changes since commit 29c8a9e31a982874ce4e2c15f2bf82d5f8dc3517:

  Merge tag 'linux-user-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-03-12 10:57:00 +0000)

are available in the Git repository at:

  https://gitlab.com/marcandre.lureau/qemu.git tags/win-socket-pull-request

for you to fetch changes up to 0006c18362cbe1e93587ac1e8ee965c08e6970f2:

  QMP/HMP: only actually implement getfd on CONFIG_POSIX (2023-03-13 15:41:32 +0400)

----------------------------------------------------------------
QMP command to import win32 sockets

----------------------------------------------------------------

Marc-André Lureau (25):
  util: drop qemu_fork()
  tests: use closesocket()
  io: use closesocket()
  tests: add test-error-report
  error: add global &error_warn destination
  win32/socket: introduce qemu_socket_select() helper
  win32/socket: introduce qemu_socket_unselect() helper
  aio: make aio_set_fd_poll() static to aio-posix.c
  aio/win32: aio_set_fd_handler() only supports SOCKET
  main-loop: remove qemu_fd_register(), win32/slirp/socket specific
  slirp: unregister the win32 SOCKET
  slirp: open-code qemu_socket_(un)select()
  win32: avoid mixing SOCKET and file descriptor space
  os-posix: remove useless ioctlsocket() define
  win32: replace closesocket() with close() wrapper
  tests: fix path separator, use g_build_filename()
  char: do not double-close fd when failing to add client
  tests/docker: fix a win32 error due to portability
  osdep: implement qemu_socketpair() for win32
  qmp: 'add_client' actually expects sockets
  monitor: release the lock before calling close()
  qmp: add 'get-win32-socket'
  libqtest: make qtest_qmp_add_client work on win32
  qtest: enable vnc-display test on win32
  QMP/HMP: only actually implement getfd on CONFIG_POSIX

 qapi/misc.json                       |  36 ++-
 include/block/aio.h                  |   8 -
 include/qapi/error.h                 |   6 +
 include/qemu/main-loop.h             |   2 -
 include/qemu/osdep.h                 |  14 --
 include/qemu/sockets.h               |   2 -
 include/sysemu/os-posix.h            |   3 -
 include/sysemu/os-win32.h            |  15 +-
 tests/qtest/libqtest.h               |   5 +-
 backends/tpm/tpm_emulator.c          |   6 +-
 chardev/char.c                       |   2 -
 crypto/afalg.c                       |   6 +-
 hw/hyperv/syndbg.c                   |   4 +-
 io/channel-socket.c                  |   8 +-
 io/channel-watch.c                   |  10 +-
 monitor/fds.c                        |  77 ++++--
 monitor/hmp-cmds.c                   |   2 +
 monitor/qmp-cmds.c                   |   7 +
 net/dgram.c                          |  14 +-
 net/slirp.c                          |  16 +-
 net/socket.c                         |  22 +-
 tests/qtest/libqtest.c               |  26 +-
 tests/qtest/microbit-test.c          |   2 +-
 tests/qtest/netdev-socket.c          |  10 +-
 tests/qtest/vnc-display-test.c       |  12 +-
 tests/unit/socket-helpers.c          |   2 +-
 tests/unit/test-error-report.c       | 139 +++++++++++
 tests/unit/test-io-channel-command.c |   2 +-
 util/aio-posix.c                     |   6 +-
 util/aio-win32.c                     |  23 +-
 util/error.c                         |  10 +-
 util/main-loop.c                     |  11 -
 util/oslib-posix.c                   |  70 ------
 util/oslib-win32.c                   | 350 ++++++++++++++++++++++++---
 util/qemu-sockets.c                  |  22 +-
 hmp-commands.hx                      |   2 +
 tests/docker/docker.py               |   6 +-
 tests/unit/meson.build               |   1 +
 38 files changed, 701 insertions(+), 258 deletions(-)
 create mode 100644 tests/unit/test-error-report.c

-- 
2.39.2
