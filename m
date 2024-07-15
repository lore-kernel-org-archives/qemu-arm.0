Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2391646nji;
        Mon, 15 Jul 2024 10:33:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXCGI9c0HXtg3J2cKlkxhdrj8h7HknVls6tyO56PYhx11+mV3uRb5F4LAnoyWQcF0tQpaNuodUJ+UBoFbQuWxkWNgvSjB+E
X-Google-Smtp-Source: AGHT+IFcdyVCG6wwenb0r/JztJ2iFTgDkTGlYGwroxZlPc8J1oNY9Hpsz+0WzpVb45BpVVKJktHP
X-Received: by 2002:a05:622a:198b:b0:447:efdf:6907 with SMTP id d75a77b69052e-44e56ad4caamr212455281cf.15.1721064791446;
        Mon, 15 Jul 2024 10:33:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721064791; cv=none;
        d=google.com; s=arc-20160816;
        b=H/goVSr3mqEX5UzjJTuNELgyUXVma1grCXqmViVT9pW6uPjsdFhwyDSpA/ZJadkiUG
         wikCcHJvWFEcBg3sKDpbg8NuFYbia8loX7bnrFYYxrPsk6WfMPEwGtBqsUhxkYjxjnFE
         7eYCp55amiwg+rDit9PJmxXWxlilvQjGeJYtXGbjlhfDg+ygSnQCUIm5G+3/jI0DmCiw
         QWwfrwikP2ln+/GJYy2ajce87+AcnFrfS+OIdXddiBeOLtdVX/Y/WF9/H1ZCSLNpMNF0
         p7X6kM9XYOhsICzupkEYLf3Q3yWYX7Hnkd1R8+CjgTV3rvM5WON/1RrEXXD9w0xFkiZP
         DRxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vGWP2zIahwQibHpt/HvdPxGYAzCOyIC9FyRoPqRkhLc=;
        fh=Vh4aLTjuyylyycFlCkrZ7Ouz37ZrS6wbH/qgUthxXT8=;
        b=MCYrW5tgHqS2BZdp8i+k7cGrXf79d0Zi29H5dGnMGY667BaIi8m8LLmyYXHZpscMsH
         vMEtMCBJRJ/lAlHIpps2S/DG8cKLB9jgckQkHZ/eTD+Em4jokrCpJee6VG6pzfNloGtX
         NzwBhWQJNvrsDpSyixuDVToyIDteNgBeF3HOwue39FqEzSczdkb2nnXODhd/PfMUT3uW
         cOr1F+MJiqeKywx4oi0N6PiPvli0hBCR86htCfDWy7gy3r+L0ZAqvPIfc0BAPqGcm6lZ
         9wWvEQRRoHMAPog8PQxEMp7n1jyxqmVUuxkvLe8DkhwKic/6SDM6DB0SnjakBIoLFi4N
         zEoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PYRWqjJO;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b82007dsi56420471cf.619.2024.07.15.10.33.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 10:33:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PYRWqjJO;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721064791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vGWP2zIahwQibHpt/HvdPxGYAzCOyIC9FyRoPqRkhLc=;
	b=PYRWqjJOqpoHBEMcWdQBEDqxnxrePhlJktY1m6ywJH0lPgp6K9SsVrEGXwGF6R4nlMctQr
	Wxj61VlZ19vWYJ924v2k9h68ZBywUZTLKa6mWf05mMlzz8iWr/9/KwhPzH/86l0VYjvDBp
	W4OgFqvanTMUpI0HyBTXyy9fJ2mIifs=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-542-788L8aESNySOGhGJm2p-MA-1; Mon,
 15 Jul 2024 13:33:08 -0400
X-MC-Unique: 788L8aESNySOGhGJm2p-MA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 53DF91956088;
	Mon, 15 Jul 2024 17:33:05 +0000 (UTC)
Received: from scv.localdomain (unknown [10.22.65.127])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 851141955D42;
	Mon, 15 Jul 2024 17:32:58 +0000 (UTC)
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
Subject: [PULL 2/6] python: Do not use pylint 3.2.4 with python 3.8
Date: Mon, 15 Jul 2024 13:32:37 -0400
Message-ID: <20240715173241.572048-3-jsnow@redhat.com>
In-Reply-To: <20240715173241.572048-1-jsnow@redhat.com>
References: <20240715173241.572048-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: 8L542nnBUdRw

There is a bug in this version,
see: https://github.com/pylint-dev/pylint/issues/9751

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20240626232230.408004-3-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/setup.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/python/setup.cfg b/python/setup.cfg
index 48668609d3e..8ebd345d7ed 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -41,6 +41,7 @@ devel =
     isort >= 5.1.2
     mypy >= 1.4.0
     pylint >= 2.17.3
+    pylint != 3.2.4; python_version<"3.9"
     tox >= 3.18.0
     urwid >= 2.1.2
     urwid-readline >= 0.13
-- 
2.45.0
