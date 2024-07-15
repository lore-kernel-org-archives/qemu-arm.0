Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2391524nji;
        Mon, 15 Jul 2024 10:32:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWa1DQTke06xAyNT9lqIoqpl2lGtDWPkC+KxHlouv1CzY3QzD/3fY0HJavjtBz6jQ8roF6iDgUccBcT2L4XgITzGolmA/aW
X-Google-Smtp-Source: AGHT+IH7ykhD0FVwV0xObbvPefFlnbSHZFvuR0fSFOsg7EyFCiC85oTQvMAh0vUwFh9z5eo1Hw/g
X-Received: by 2002:a05:6214:240d:b0:6b5:de3b:dc10 with SMTP id 6a1803df08f44-6b77de9d977mr3550906d6.35.1721064779419;
        Mon, 15 Jul 2024 10:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721064779; cv=none;
        d=google.com; s=arc-20160816;
        b=TvS+88fwZUJ9S8gXrQUnDjarKtQ3MIiFowotaS4/zpFSkwpJDr3x/ghbDh0eEKQiVi
         H8paP55RTRc8TlxqSRw74KtHChL3ZbleeeR/A/vEnDu3aDsDNZnnnbvngwXQCw/LnzQz
         0XtzMAWKW6gb2sRzCSgEf2gJSMv26WCYgBPvinhvaQ/0JlkHvK65kF7BQR2B3lv6zT1z
         AsprkoE9hK+KxuJmJxBGLJgZ0MiZUBat+yv/tvvTWqcB7kaIlYjg/+3m5UJC8hIN0jba
         0EvsgfHhvTZPMxpAtx1SGn5pq+3nWK0jpPNjuAVKRTWxXTveGXgNfkbOxPlVvh6afaCe
         2MGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=hAvh22Zdw4wu95Be5PIC3lsJUebu8ON8TPVZflTCXws=;
        fh=Vh4aLTjuyylyycFlCkrZ7Ouz37ZrS6wbH/qgUthxXT8=;
        b=JI2mUnGbW019a4MRxsOAWs59N3aujbJX9DtCPc2H5448p+fnsh7puG7GwqzMqzxIEy
         r7YxJkwnO360DECXhRU6cASyfntiQNvbgRwWxl//3+dX4s8PnJXost6oS1Ko6giA1dSj
         zAdyIOIgJswmYcMgIwQpCiBKTQPk2TE8nyfLjrMWyKxnjhFJ4txx+X9vAFLBRaeXRQSU
         61+ThsAWg78nwcJ7w7UIQJSPGPZxmFvfpQNLJ8OwhHtw15WdUCv6vde1K2h1afCsCHgE
         4T/edulyKs8g+sWUviradJRmjzsgWUWJg8odpwE9onwW9Q9MrOHEhkcIOEZ/gLwV+Don
         70tA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bqmmlxes;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b77d695si55321381cf.67.2024.07.15.10.32.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 10:32:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bqmmlxes;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721064779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hAvh22Zdw4wu95Be5PIC3lsJUebu8ON8TPVZflTCXws=;
	b=bqmmlxesu+ax6reMDw9hR7R0l4VJPO0vDPrQ5s3IIssVlaxjXJCbjtLSpttgZX8e3xuYzr
	VKdkAdErMbGqJeuFFFrbZ/59ioU9PqJ63/xyvGzo2ME8ZhpSLTWcV+yzt5HC9bJUCdAV5W
	Ycw6hMtos59i/xCTdfrwEMWHrSqMQak=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-207-WGLn17MGNXmd4VGJWn4O3w-1; Mon,
 15 Jul 2024 13:32:55 -0400
X-MC-Unique: WGLn17MGNXmd4VGJWn4O3w-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 328011955D5C;
	Mon, 15 Jul 2024 17:32:51 +0000 (UTC)
Received: from scv.localdomain (unknown [10.22.65.127])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8FE131955D42;
	Mon, 15 Jul 2024 17:32:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Leonardo Bras <leobras@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-arm@nongnu.org,
	Fabiano Rosas <farosas@suse.de>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Michael Roth <michael.roth@amd.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Andrew Jeffery <andrew@aj.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Xu <peterx@redhat.com>
Subject: [PULL 0/6] Python patches
Date: Mon, 15 Jul 2024 13:32:35 -0400
Message-ID: <20240715173241.572048-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: WMiU7aJbn1cs

The following changes since commit 4469bee2c529832d762af4a2f89468c926f02fe4=
:=0D
=0D
  Merge tag 'nvme-next-pull-request' of https://gitlab.com/birkelund/qemu i=
nto staging (2024-07-11 14:32:51 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/python-pull-request=0D
=0D
for you to fetch changes up to dd23f9ec519db9c424223cff8767715de5532718:=0D
=0D
  docs: remove Sphinx 1.x compatibility code (2024-07-12 16:46:21 -0400)=0D
=0D
----------------------------------------------------------------=0D
Python: 3.13 compat & sphinx minver bump=0D
=0D
----------------------------------------------------------------=0D
=0D
John Snow (6):=0D
  python: linter changes for pylint 3.x=0D
  python: Do not use pylint 3.2.4 with python 3.8=0D
  iotests: Change imports for Python 3.13=0D
  python: enable testing for 3.13=0D
  Python: bump minimum sphinx version to 3.4.3=0D
  docs: remove Sphinx 1.x compatibility code=0D
=0D
 docs/conf.py                           |  7 ++---=0D
 docs/sphinx/hxtool.py                  | 21 +++-----------=0D
 docs/sphinx/kerneldoc.py               | 38 ++++++++------------------=0D
 docs/sphinx/kernellog.py               | 28 -------------------=0D
 docs/sphinx/qapidoc.py                 | 33 ++--------------------=0D
 python/qemu/machine/machine.py         |  1 +=0D
 python/qemu/utils/qemu_ga_client.py    |  2 +-=0D
 python/setup.cfg                       |  4 ++-=0D
 pythondeps.toml                        |  2 +-=0D
 tests/docker/dockerfiles/python.docker |  1 +=0D
 tests/qemu-iotests/testenv.py          |  7 ++++-=0D
 tests/qemu-iotests/testrunner.py       |  9 ++++--=0D
 12 files changed, 41 insertions(+), 112 deletions(-)=0D
 delete mode 100644 docs/sphinx/kernellog.py=0D
=0D
-- =0D
2.45.0=0D
=0D
