Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp171412ejb;
        Mon, 13 Mar 2023 04:46:56 -0700 (PDT)
X-Google-Smtp-Source: AK7set89NihhZiO5BLvUeNJRJN64Jrpxpg6B/3XGaouneDJg+79CgIwVoNYh9I7M6//3SfEh6+u2
X-Received: by 2002:a05:6214:e62:b0:56c:1581:41a7 with SMTP id jz2-20020a0562140e6200b0056c158141a7mr13210960qvb.38.1678708016613;
        Mon, 13 Mar 2023 04:46:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708016; cv=none;
        d=google.com; s=arc-20160816;
        b=ckwInOshcjwaTdFUCrpBqejTxjRrAo6hUSxrJi3/Q//Izgo1UDGTu9dmjuzrDIOJHZ
         PQQth0tmwGkn76Y8ggATJKNSobF5mpbOBwA7WxG/T2WJejzcrxZAPIJ0KV1szNsRUMRR
         ftvUY89oZcIuNdS2c+Y0NwJj7PFOgAnCcwomL8+58aPJImKSCSOQ900jYGY+85qky+M5
         wMXiKXF0zA3dnL908B52iNc7l2nHkh7InPY9g6ipX4/6BZLRnnyE82YdTHBG2zF6SsSo
         Y41TYSKbgDfwMXbx9F+44LAsRU333aExb3Wki0qR94e8u/Ug+ZTjWBKSrosa7QnM7+d6
         jCjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=mYVaCfDmSVdAQhS4caD8YWYja+G2AIglwDi8TYDOGe8=;
        b=ZQUG/ULkN030lOVxXcX97SKg7xgACwX4i2z4Xkv0sWZTctbTSyFs6HKb3D5CO18fes
         8d2Tnip+KAFWVDJwOdz2jF+qvgyprFvggcVdLJrIpymfPJdvoSsZISKCg3vKh29GdiO3
         uyAGsut54fcYt/gXYv3hNRqJEZPkpmHRJpi5HRpkBrPYxQekKWl5FypIhCNr4YsxHVA2
         K/czZPsmtAF9wATI+f9iTR3aJvAnCJU42EghZ2kgYSXSAXVNFSdwsBzdNrB90Otmshf2
         Idu0R15/eUra+Dm9/wOFTlroeYnJX6Hgs5i8valo6qinhQXyB5A3cPwShM0n5Qk144cm
         ECig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hl2v3Jec;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id b19-20020a0cc993000000b00570bc9840e7si4967636qvk.236.2023.03.13.04.46.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:46:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hl2v3Jec;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mYVaCfDmSVdAQhS4caD8YWYja+G2AIglwDi8TYDOGe8=;
	b=Hl2v3JecTMzTV8VCG0URZnCAyAcidgGTfaApWyHelbTgfjWMj8DD938N46j6OPVkqnJur0
	EYJsyjfcwn2Ijr6xxnFwyFhIFqZQm4bzhkxRC4L2URJ3aIpAhX9jbARrJX48Vv5OscecQU
	YvGMpc5s0FcatR4qdxbxzUGDC87Bi0I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-bEWGCRv5OgWjODrLU0oFwA-1; Mon, 13 Mar 2023 07:46:53 -0400
X-MC-Unique: bEWGCRv5OgWjODrLU0oFwA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20B8A1C04182;
	Mon, 13 Mar 2023 11:46:52 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B6EA047507A;
	Mon, 13 Mar 2023 11:46:50 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	Thomas Huth <thuth@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Beraldo Leal <bleal@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PULL v2 00/25] Win socket patches
Date: Mon, 13 Mar 2023 15:46:23 +0400
Message-Id: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-TUID: nNyiaYEi/yUB

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following changes since commit 29c8a9e31a982874ce4e2c15f2bf82d5f8dc3517:

  Merge tag 'linux-user-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-03-12 10:57:00 +0000)

are available in the Git repository at:

  https://gitlab.com/marcandre.lureau/qemu.git tags/win-socket-pull-request

for you to fetch changes up to 4bf21c7f748bee42b6f4692f8c37a11d1033b2d1:

  monitor: restrict command getfd to POSIX hosts (2023-03-13 15:46:09 +0400)

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
  monitor: restrict command getfd to POSIX hosts

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
