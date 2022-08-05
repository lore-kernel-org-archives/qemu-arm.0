Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp1106735lfg;
        Fri, 5 Aug 2022 08:20:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR53Agz0c+9gYPHPpvtyLXukWXVjTzJMt9vMiyw/f38Wn6bAyyru8aWRrgHAtaD6eliU+16K
X-Received: by 2002:a17:907:2c41:b0:730:a07d:c720 with SMTP id hf1-20020a1709072c4100b00730a07dc720mr5672632ejc.102.1659712826885;
        Fri, 05 Aug 2022 08:20:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659712826; cv=none;
        d=google.com; s=arc-20160816;
        b=v1GogY8WV58Z8pgM/MmQ6Mq8dCHFQ+YFd9vZg4FJHnbBhl8iXJAz4+etK66m/99SUZ
         9XBvNIve55tUkSIwJZTojBJ2az3X0oaJvzCd5PTGxzRY1cRYMIw9MZ0KluX/c93tE72d
         49YY2p59U2hOYUgX7ibV/qDNcpres/lxGK8mouSFvOI0U05maja4LEcY5mcjS69BB5tz
         uwqUM1h3+z3hQX9Nax+1MN3+6nF3gU0vQSipEt9M3fDqvjOciZ5Ck6aVrpbP1va1cfvE
         A5wu3ES3st7YPpImqBJeWtrVodB42jW9y0Mk34LJoa3gY/VMyXoTGzF5GJKttpbkkyjM
         cFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=L2Qk/T5pDEpCliz/Xg2eicSxsZkuhsTGbYJsBsWi2cE=;
        b=HWqe33QJm0UF/R4oizKhWpfp/nPPqp/iJjSfvMcULUoM48GSA4a7VrnyNruvXB0wOt
         Nx5Z4F0q9MyGEfb+Iqivp3vggJCB824IdBsR6ubWbEuRc5twHB/EfW7tF5Smvwhe10+b
         dTEHH88CIW/9RanT9hDxg6A92QMy1xDz1fyBmnpZaqU5iQyVHrWiBD22LWFBqUUkKl2c
         gEbwCva/NBCU6QS8fFXl3H+o+xGuVN+/CCkPhp0JEM84Y6IOj00gDBnBuq+VI3RTUVVz
         8scI5lN6QW/YJwIoqLkVSvhsk59b0HRljivIRSlNg6qJTsm6g1tCajEH4CQ5ff6VoxLz
         7Lyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L+gLsbYz;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id o19-20020a170906975300b00730e93aa2ddsi2376497ejy.903.2022.08.05.08.20.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Aug 2022 08:20:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L+gLsbYz;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659712825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L2Qk/T5pDEpCliz/Xg2eicSxsZkuhsTGbYJsBsWi2cE=;
	b=L+gLsbYzEixqsRjhk3yp2D9fkPyU228EI8cTzmP+4Ol1oJGo7hJPforZ6hefgwCuQvtEiZ
	l63QfWcghO8USTkjAVVRfHTALhBfuYv4C7xaIP+eqPyzFcC897Sde7WdT/74b7n4Cfc6VI
	kWWUHY2jQmiK0/FvocThJhZk6ZI3sAU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-mgVc0uUAP7S7s4-olnTXaw-1; Fri, 05 Aug 2022 11:20:22 -0400
X-MC-Unique: mgVc0uUAP7S7s4-olnTXaw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72D883C0E236;
	Fri,  5 Aug 2022 15:20:21 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B1A0F2026D4C;
	Fri,  5 Aug 2022 15:20:16 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: libvir-list@redhat.com,
	Beraldo Leal <bleal@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PULL 0/6] Misc next patches
Date: Fri,  5 Aug 2022 16:20:08 +0100
Message-Id: <20220805152014.135768-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-TUID: omIsVl1OpHcJ

The following changes since commit 09ed077d7fae5f825e18ff9a2004dcdd1b165edb:

  Merge tag 'trivial-branch-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-08-04 17:21:13 -0700)

are available in the Git repository at:

  https://gitlab.com/berrange/qemu tags/misc-next-pull-request

for you to fetch changes up to e3fdb13e8851be570db41a50589ce82d11d61c12:

  util/qemu-sockets: Replace the call to close a socket with closesocket() (2022-08-05 16:18:15 +0100)

----------------------------------------------------------------
Merge misc patches

 * Display deprecation warnings in -cpu help
 * Fix zerocopy IPv6 handling
 * Clarify platform support policy on minor release/backports
 * Fix closesocket call in error path

----------------------------------------------------------------

Andrea Bolognani (1):
  docs: build-platforms: Clarify stance on minor releases and backports

Bin Meng (1):
  util/qemu-sockets: Replace the call to close a socket with
    closesocket()

Daniel P. Berrangé (3):
  target/i386: display deprecation status in '-cpu help'
  target/s390x: display deprecation status in '-cpu help'
  target/arm: display deprecation status in '-cpu help'

Leonardo Bras (1):
  QIOChannelSocket: Add support for MSG_ZEROCOPY + IPV6

 docs/about/build-platforms.rst |  5 ++++-
 io/channel-socket.c            |  4 ++--
 target/arm/helper.c            |  7 ++++++-
 target/i386/cpu.c              |  5 +++++
 target/s390x/cpu_models.c      | 23 ++++++++++++++++++-----
 util/qemu-sockets.c            |  4 ++--
 6 files changed, 37 insertions(+), 11 deletions(-)

-- 
2.37.1
