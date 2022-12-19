Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3459264ejb;
        Mon, 19 Dec 2022 05:02:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtAhjDxexJlAbAGBeCAlyXgiZ4YJGaAZGMgpojJBYuidac7IJUM8Ki0R+b45+osZC401SvK
X-Received: by 2002:a05:6808:1ab2:b0:355:1de9:3914 with SMTP id bm50-20020a0568081ab200b003551de93914mr3668872oib.26.1671454936569;
        Mon, 19 Dec 2022 05:02:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671454936; cv=none;
        d=google.com; s=arc-20160816;
        b=PjRHowkVa/M+770Kn+gnGUTiCbns/Z3NzeTZLxQ+4Mmv3a3bgy7u9AA4z4Xp6W0jE8
         utYMZnmFRtc6+YoNyq5NJjM3SXuYz1Le929ydT61EPHjItUoXZBtbyQlXewcYYtDHYO7
         Gx7FT3cH1/q9SvuembBlP5A276CoVAiaJt0RMAGXAcbzFbmJRfXK30hqnJoeuKlRKPqw
         121LHqws7gUm7R2eXwWV9Sq1PEBiOvUqlCa//O3HZa6tnkXdnc4J2cTKiYo1MVc3inAP
         Gez7TOH571wQCH8i8DUUOwS1/p/c2XHSQHwgRQRyI9VBr17EwWNeNEBY/TnW7vEJ2v4l
         tMmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=QVqSB9wB2qrALRQPMZT6ihrQ0/2mf+IxHI35zGJFZFg=;
        b=YrgvZn40HK6DinZLL/jsny3OAvvdsA8vr71kGxAWROEHOUxJZOFbgb3IekEPSdQTbQ
         J6qsN3/RtTTxRJ56Eg0AfJbu2r52GZi3l10QU5R0F33o569H2BSDGpT/zNpvPUgilLct
         DtDu0nH7tjtxUNJztY6Qwc9dWvsx1ZBQj9mMLEPyoxj/dtk8sEiR3yFUISq8/jjg9WPM
         U7qhPW0DilBpXUriT/wRy4R+DnuZm9Bs3AEx0qkBMkBcikmdJgnvMMj6pE//Dx+MMTUQ
         pc3wIcc0GGRlct/jefSeLF3F/Be3TySNXd/J942460xyPRgCarJl4IMoG9bmJWc8zjXt
         E9Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T4ruOhgm;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 62-20020a370741000000b006fa190bdc52si3928621qkh.64.2022.12.19.05.02.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 05:02:16 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T4ruOhgm;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671454936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QVqSB9wB2qrALRQPMZT6ihrQ0/2mf+IxHI35zGJFZFg=;
	b=T4ruOhgmikspA6fNzhRnGuC6m3y/3IPffjK92bu1TItOIjEru7MjIp7hn5v9LDeFdbKxFJ
	tMlATZDVGs+uLlCXnusqS7OI2GdNNbdIs/HPfhkm+w6kKGD68gF6Qh7AM4EFpbEVq8zYuQ
	IDVINJBQz4YLMnepnzIHpM0tT7DAyGc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-8JV0muoNMwyA4rcqg3b1mQ-1; Mon, 19 Dec 2022 08:02:07 -0500
X-MC-Unique: 8JV0muoNMwyA4rcqg3b1mQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F26F7810BD2;
	Mon, 19 Dec 2022 13:02:06 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1FEE114152F6;
	Mon, 19 Dec 2022 13:02:06 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	Laurent Vivier <lvivier@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	virtio-fs@redhat.com,
	Michael Roth <michael.roth@amd.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-block@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	John Snow <jsnow@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 0/6] enforce use of G_GNUC_PRINTF annotations
Date: Mon, 19 Dec 2022 08:01:59 -0500
Message-Id: <20221219130205.687815-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: WDz1u6G4KaZm

We've been very gradually adding G_GNUC_PRINTF annotations
to functions over years. This has been useful in detecting
certain malformed printf strings, or cases where we pass
user data as the printf format which is a potential security
flaw.

Given the inherant memory corruption danger in use of format
strings vs mis-matched variadic arguments, it is worth applying
G_GNUC_PRINTF to all functions using printf, even if we know
they are safe.

The compilers can reasonably reliably identify such places
with the -Wsuggest-attribute=format / -Wmissing-format-attribute
flags.

This series adds G_GNUC_PRINTF / G_GNUC_SCANF to allow the code
locations that the compilers highlight. Then it adds the above
warning flags to the build flags, to catch any future additions
of functions that take printf/scanf format strings.

Daniel P. Berrangé (6):
  disas: add G_GNUC_PRINTF to gstring_printf
  hw/xen: use G_GNUC_PRINTF/SCANF for various functions
  tools/virtiofsd: add G_GNUC_PRINTF for logging functions
  util/error: add G_GNUC_PRINTF for various functions
  tests: add G_GNUC_PRINTF for various functions
  enforce use of G_GNUC_PRINTF attributes

 configure                         |  2 ++
 disas.c                           |  1 +
 hw/xen/xen-bus.c                  |  1 +
 hw/xen/xen_pvdev.c                |  1 +
 include/hw/xen/xen-bus-helper.h   |  6 ++++--
 include/hw/xen/xen-bus.h          |  3 ++-
 tests/qtest/ahci-test.c           |  3 +++
 tests/qtest/arm-cpu-features.c    |  1 +
 tests/qtest/erst-test.c           |  2 +-
 tests/qtest/ide-test.c            |  3 ++-
 tests/qtest/ivshmem-test.c        |  4 ++--
 tests/qtest/libqmp.c              |  2 +-
 tests/qtest/libqos/libqos-pc.h    |  6 ++++--
 tests/qtest/libqos/libqos-spapr.h |  6 ++++--
 tests/qtest/libqos/libqos.h       |  6 ++++--
 tests/qtest/libqos/virtio-9p.c    |  1 +
 tests/qtest/migration-helpers.h   |  1 +
 tests/qtest/rtas-test.c           |  2 +-
 tests/qtest/usb-hcd-uhci-test.c   |  4 ++--
 tests/unit/test-qmp-cmds.c        | 13 +++++++++----
 tools/virtiofsd/fuse_log.c        |  1 +
 tools/virtiofsd/fuse_log.h        |  6 ++++--
 tools/virtiofsd/passthrough_ll.c  |  1 +
 util/error-report.c               |  1 +
 util/error.c                      |  1 +
 25 files changed, 55 insertions(+), 23 deletions(-)

-- 
2.38.1
