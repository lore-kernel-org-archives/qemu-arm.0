Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2645505ejb;
        Mon, 20 Feb 2023 13:50:26 -0800 (PST)
X-Google-Smtp-Source: AK7set/ZecKU7NEhgfVqh6PgPDsntc9O+FYENz7WJnZzccPE9oTvxRiGZPPOK5VSYHUKO+VBHgOL
X-Received: by 2002:a05:622a:548:b0:3bd:16cf:2f10 with SMTP id m8-20020a05622a054800b003bd16cf2f10mr23436197qtx.35.1676929826787;
        Mon, 20 Feb 2023 13:50:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676929826; cv=none;
        d=google.com; s=arc-20160816;
        b=cn7MkXyjVGtqzaJo32fkkFNfGvckcewxDWjfsr9Gqamxg/f8B1pWNxMJIHxUngR3fc
         Zs0G7klekfJmPxE3oV6QrxvJwEL2ji5n8PVhoqH3sAMIutSncTIjDOAl/lffkXwiIPU8
         3tDF5VNTJ7auQFlnaXRQGCLC1T6o7NYSPM8RfHpLZu+CNDUM4rW06YOLMWs0g9IBFNFw
         6qNl7O/mmO9o7LCHoDONP0knxKDmGk4T9B5ba8yD/cnyn4ruaF3mvTHfmw3qiaFq4Im8
         OoRL4bK61zubm7k7br+f1dcUh2WEoMkFAqqcCwfIDSMBFhNJGiF647WArv14/amS7xe9
         SNsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=8XBtvi3wPEbn04OfSm75RT2PhGLFcN17qJlhJD1pomg=;
        b=iwfUhTLSEY0S12dBVm+HdlxmzV7b3V+nqUdUfrjx7AKodn9DNGEpde3HEyrKQM+T+H
         C0+chPDDXTIzRP/8S8Ip9mC7y1uPKOOmeJJZvrXijOGccWS51/zDaE1U3PVLMmncdyYZ
         VmyikqyXWJAZHr8kCLOEWQDBi4+HvdKXBide+urvDJv9Hp3Xj+rU4woTyDcDMPPiHqoi
         YATuXrwkcwgixyXrHqvNfljjgIan15S63GZfQuONj5XpWxoeiE7fa+CrGXGyP/HB+w63
         lXtRE3kFeQtPxBx8CuQuWkKqE1vqBA/5+FJf3l0OyFDoYGxbwqbi1NblP+bPYzmKi+FW
         Rm9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SxYYX4CQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18-20020a05620a409200b0073b6a31f0e0si10923703qko.160.2023.02.20.13.50.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 13:50:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SxYYX4CQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUE2A-0003Ow-7Q; Mon, 20 Feb 2023 16:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE27-0003OL-Dh
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 16:49:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE23-0007vg-Hg
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 16:49:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676929750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8XBtvi3wPEbn04OfSm75RT2PhGLFcN17qJlhJD1pomg=;
 b=SxYYX4CQY9gg/InAXQeAgGdD0wNoG0SfkLA3cxkA/NWYXBchtnTOm4EQy1S/dkr9yCjHKG
 FQ0KKhAfdoKmE5WVF5y3FP4hBaskVe5BOv5IrvxuEOOzM7Kx73CjhZfKNG9zX7IpZkfNkq
 mwu+iENcYrrt+0m+8qSVRPW4fYWz3GQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-erBcdkLyPaignqBUXDOQ2Q-1; Mon, 20 Feb 2023 16:49:04 -0500
X-MC-Unique: erBcdkLyPaignqBUXDOQ2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B02B42A5956F;
 Mon, 20 Feb 2023 21:49:03 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C87040B40D7;
 Mon, 20 Feb 2023 21:49:02 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Jason Wang <jasowang@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 00/15] win32: do not mix SOCKET and fd space
Date: Tue, 21 Feb 2023 01:48:44 +0400
Message-Id: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Gi7eEbWL3ad7

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hi,

A win32 SOCKET handle is often cast to an int file descriptor, as this is what
other OS use for sockets. When necessary, QEMU eventually queries whether it's a
socket with the help of fd_is_socket(). However, there is no guarantee of
conflict between the fd and SOCKET space. Such conflict would have surprising
consequences. We can fix this by using FDs only.

After fixing a few missed closesocket(), this patch series makes the win32
socket API wrappers take FDs. It finally get rid of closesocket() usage by using
a close() wrapper instead. (note that fdopen/fclose would not be enough either
to close the underlying socket appropriately)

v2:
- add clean up patch "util: drop qemu_fork()"
- add a "&error_warn", to help with basic error reporting
- fix errno handling after _get_osfhandle()
- introduce qemu_socket_(un)select() helpers
- add patch "aio_set_fd_handler() only supports SOCKET"
- add meson slirp.wrap RFC
- various misc cleanups
- add r-b tags

Marc-André Lureau (15):
  util: drop qemu_fork()
  tests: use closesocket()
  io: use closesocket()
  error: add global &error_warn destination
  win32/socket: introduce qemu_socket_select() helper
  win32/socket: introduce qemu_socket_unselect() helper
  aio: make aio_set_fd_poll() static to aio-posix.c
  aio/win32: aio_set_fd_handler() only supports SOCKET
  RFC: build-sys: add slirp.wrap
  main-loop: remove qemu_fd_register(), win32/slirp/socket specific
  slirp: unregister the win32 SOCKET
  slirp: open-code qemu_socket_(un)select()
  win32: avoid mixing SOCKET and file descriptor space
  os-posix: remove useless ioctlsocket() define
  win32: replace closesocket() with close() wrapper

 include/block/aio.h         |   8 --
 include/qapi/error.h        |   6 ++
 include/qemu/main-loop.h    |   2 -
 include/qemu/osdep.h        |  14 ---
 include/sysemu/os-posix.h   |   3 -
 include/sysemu/os-win32.h   |  15 ++-
 backends/tpm/tpm_emulator.c |   6 +-
 crypto/afalg.c              |   6 +-
 hw/hyperv/syndbg.c          |   4 +-
 io/channel-socket.c         |   8 +-
 io/channel-watch.c          |  10 +-
 net/dgram.c                 |  14 +--
 net/slirp.c                 |  16 ++-
 net/socket.c                |  22 ++--
 tests/qtest/libqtest.c      |   8 +-
 tests/qtest/microbit-test.c |   2 +-
 tests/qtest/netdev-socket.c |  10 +-
 tests/unit/socket-helpers.c |   2 +-
 util/aio-posix.c            |   6 +-
 util/aio-win32.c            |  23 ++--
 util/error.c                |  10 +-
 util/main-loop.c            |  11 --
 util/oslib-posix.c          |  70 -------------
 util/oslib-win32.c          | 202 ++++++++++++++++++++++++++++++------
 util/qemu-sockets.c         |  22 ++--
 .gitignore                  |   2 +
 subprojects/slirp.wrap      |   6 ++
 27 files changed, 289 insertions(+), 219 deletions(-)
 create mode 100644 subprojects/slirp.wrap

-- 
2.39.1

