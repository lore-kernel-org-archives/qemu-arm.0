Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2891636ejb;
        Wed, 4 Oct 2023 12:46:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRTo2eQt2FZk7P551YEUw8lr/W5bid3cqUkpjpuumQs/ZSiATNtS64dTc9IXFrmBp9Rgqb
X-Received: by 2002:ac8:5e4f:0:b0:40f:f9c8:1b98 with SMTP id i15-20020ac85e4f000000b0040ff9c81b98mr3645992qtx.10.1696448780292;
        Wed, 04 Oct 2023 12:46:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696448780; cv=none;
        d=google.com; s=arc-20160816;
        b=zExk6CWl7i3Rbds3lX0FlXKtHfclB7poPwIKon7d1BvsYFMvNbrUkDZ26PYDuE68gK
         Da1CIYzWYGwUUI7VMgZ7sfHEi6oGvfdaGLnX1Yh0CnlXP4vPgoGIsN/mYU2NXVTP5nvJ
         YfNfcSlPO5HKRj8lTzFs/N7j7/RaYMUE81w1/0j5/EpM2HdzsKbLMfgnjqgvlOxywc5+
         QjI/vpKJh36VZ462j2HPyjvSArFRIbdOMh+Rc2vYUipn5H524TBNxYcRRXYDVLiziiQE
         6/MTdhr5oiJIBLnpA/bNBTLJnZT6GzOCFhXQQJDYMSUg4v/+32KtAbE73196MNKdNenV
         CDpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=TX7kKZmBtJZ5PBGYSWB5p9gNJO/hUqyWgAymBZ2GhF0=;
        fh=T+SSTeAxrZ+7RtL9oY8pymA8+lHV6k3OjFi4ur0eRDs=;
        b=BY2wfPH5KjkoPZG05fK0kK7HkEe1dn0eyyfVXP+YeRGy1UhURTVMk87O7qSXqHm0BF
         F0gVkP/XJOPHW2Dqin2oo3Npymb58VEkanWG+KJtv6oIGckGPiKUpsoe4X6J0hxsRuSz
         jB8+EuG+BbAjthy8Kbk7aKFa/EpjBAAvfzGQEyqh5NxjmWmKoz85VKFoY1ENjX7/L7Bg
         HJSv0bbuusuOO5H2wOYqQ/T/Q8GdpyzSb/IfVvnXlyPUmFx5lZax2qCIzkwsEsV2fyKp
         PTjBR+uVgM/KqX4Ne7RYPWo8Fb1r4niQc30qU/rEj1sthfF1TR9LZDn63lAA42Lpo4LP
         tYKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TTekZrTq;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id m7-20020ac85b07000000b0041821adfb01si1773956qtw.632.2023.10.04.12.46.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 12:46:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TTekZrTq;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696448779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TX7kKZmBtJZ5PBGYSWB5p9gNJO/hUqyWgAymBZ2GhF0=;
	b=TTekZrTq/ztHm0PlN0K5WnDLy0XWzCVvBieqjkAzmNA48GwftYarwuHl1xMrTICXI/CyKk
	6E3VsKL4s7nTXb77rP8MINjFuIty50H+O8G5AkZOiz+yKWVcDGYeKd9P0NAobTe4vjfuyh
	f3yD+HwbGjrW7Cu+gqLHKGo3fNPnx/s=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-phOAvBEzOEylcy3t1q5R3A-1; Wed, 04 Oct 2023 15:46:16 -0400
X-MC-Unique: phOAvBEzOEylcy3t1q5R3A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85F271C05AA7;
	Wed,  4 Oct 2023 19:46:15 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9CA4B1054FC2;
	Wed,  4 Oct 2023 19:46:13 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	qemu-block@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Hanna Reitz <hreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
	Thomas Huth <thuth@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Markus Armbruster <armbru@redhat.com>
Subject: [PULL 0/9] Python patches
Date: Wed,  4 Oct 2023 15:46:04 -0400
Message-ID: <20231004194613.2900323-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-TUID: 9APJYeadrbXq

The following changes since commit da1034094d375afe9e3d8ec8980550ea0f06f7e0=
:=0D
=0D
  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging =
(2023-10-03 07:43:44 -0400)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/python-pull-request=0D
=0D
for you to fetch changes up to 4d7a663cbe8343e884b88e44bd88d37dd0a470e5:=0D
=0D
  Python: test Python 3.12 (2023-10-04 15:19:00 -0400)=0D
=0D
----------------------------------------------------------------=0D
Python pullreq=0D
=0D
Buffering improvements for qemu machine, minor changes to support the=0D
newly released Python 3.12=0D
=0D
----------------------------------------------------------------=0D
=0D
John Snow (9):=0D
  Python/iotests: Add type hint for nbd module=0D
  python/machine: move socket setup out of _base_args property=0D
  python/machine: close sock_pair in cleanup path=0D
  python/console_socket: accept existing FD in initializer=0D
  python/machine: use socketpair() for console connections=0D
  python/machine: use socketpair() for qtest connection=0D
  python/machine: remove unused sock_dir argument=0D
  python/qmp: remove Server.wait_closed() call for Python 3.12=0D
  Python: test Python 3.12=0D
=0D
 python/qemu/machine/console_socket.py      | 29 ++++++++---=0D
 python/qemu/machine/machine.py             | 58 +++++++++++++---------=0D
 python/qemu/machine/qtest.py               | 54 +++++++++++++++-----=0D
 python/qemu/qmp/protocol.py                |  1 -=0D
 python/setup.cfg                           |  3 +-=0D
 tests/avocado/acpi-bits.py                 |  5 +-=0D
 tests/avocado/avocado_qemu/__init__.py     |  2 +-=0D
 tests/avocado/machine_aspeed.py            |  5 +-=0D
 tests/docker/dockerfiles/python.docker     |  6 ++-=0D
 tests/qemu-iotests/iotests.py              |  2 +-=0D
 tests/qemu-iotests/tests/copy-before-write |  3 +-=0D
 tests/qemu-iotests/tests/nbd-multiconn     |  4 +-=0D
 12 files changed, 114 insertions(+), 58 deletions(-)=0D
=0D
-- =0D
2.41.0=0D
=0D
