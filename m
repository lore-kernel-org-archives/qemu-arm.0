Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2064047lfq;
        Fri, 25 Feb 2022 13:04:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9HIuUHjQtVuOAFQo/dk+szbffcr5nIGxtAY0Oa5p3gMlsWTNI64iJW6N/++RhLMF+nLLt
X-Received: by 2002:a37:6593:0:b0:47b:a835:728a with SMTP id z141-20020a376593000000b0047ba835728amr6187932qkb.657.1645823056536;
        Fri, 25 Feb 2022 13:04:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645823056; cv=none;
        d=google.com; s=arc-20160816;
        b=L9ErzNe9YHD3VYJk7TvzatxR75FHgaylxC6o3C6IeFdeLL3wP5DXRZF8e5MjFvFMkV
         Wsizy47jpxOu7VXcYDz4eBlfJIJBJqb0K+KQMKHd6Jd9vP/di4CquY8trBuSV3Gr/uea
         6Fcya0KWLw2ffYdfgC0gSSfsMJrZTTEs106J5iXF1e/00gwjW82DqjruR6OeGyloxhoC
         Ebe5Hx+Mfng7bsgSsOOlme0UQnz5KDq3aStJMmNqRJziey9+IBt7snv11Tyibf5Qg04D
         pvT5xmT0yOoZNykfd0fTDm681W+/W+fciOlM9dowsqqCi2tzylRZuqLiavR+oTjHlbYG
         oi8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MoydFIZVPXLceF+79GqvC17wuIzXC3f1mBDdDJIeMu8=;
        b=K56wtJSOOsEzHENhcloLh+cgXn+SnAZYJ5CgdmCMGKlJVZ6gjS5h86KTNMhutzFz0q
         iYJH1kgV+ZPvPSAciGpl621JnRYAag7CvzU+tLeK+/zCCPdNzJNx8gCr0F8ee8WTK35j
         EoZ1h277gtEV+WXPto5m3EDLw1LD3ibNyVytkKAF+T39B/U3/rKF3G4A09egQ6AD+r+U
         YXribQQ7v2N8Cg4i8FzuAYqCYLqywvS9RFBYroYGwkRhLIS9wwtfRw5o+JE9BKvMYQAa
         gNEU92A2hwnwOqo92YX9LtYoyGWqVrAQMFs6jrJryHSf6LAbxD+S3bMZbVAi524Bzmtu
         giaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VNLnjRt6;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id h78-20020a379e51000000b0046ce672ff70si1814231qke.553.2022.02.25.13.04.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Feb 2022 13:04:16 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VNLnjRt6;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645823056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MoydFIZVPXLceF+79GqvC17wuIzXC3f1mBDdDJIeMu8=;
	b=VNLnjRt6BXGqyBt14hqgFVLOp3iIWoCgAkbcFzaa6tsZjJDhH6CgHKg6K9lNwiWDaCPT4G
	BJ6whNPNl2Bx4Wv6gaRro1HALlKN/pNv1ef8G0ubUcwEmkO7KC3S8JPGwxQI/22ikRr8o9
	UxZNKAiGV1azUYvJrXOICgLjmRtMC8A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149--GjeVpj0PL6AL7Qo8Zn3LA-1; Fri, 25 Feb 2022 16:04:13 -0500
X-MC-Unique: -GjeVpj0PL6AL7Qo8Zn3LA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC0C4801AAD;
	Fri, 25 Feb 2022 21:04:09 +0000 (UTC)
Received: from p50.localhost.localdomain.com (unknown [10.22.16.50])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C7302ED81;
	Fri, 25 Feb 2022 21:04:02 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Fabien Chouteau <chouteau@adacore.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	David Gibson <david@gibson.dropbear.id.au>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Eric Farman <farman@linux.ibm.com>
Subject: [PATCH 7/9] Avocado tests: improve documentation on tag filtering
Date: Fri, 25 Feb 2022 16:01:54 -0500
Message-Id: <20220225210156.2032055-8-crosa@redhat.com>
In-Reply-To: <20220225210156.2032055-1-crosa@redhat.com>
References: <20220225210156.2032055-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: BX8LvUPP8nlc

It's possible to filter based on a combination of criteria.  This adds
examples to the documentation.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 docs/devel/testing.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 92d40cdd19..f5b6e07b5c 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -936,6 +936,28 @@ in the current directory, tagged as "quick", run:
 
   avocado run -t quick .
 
+To run tests with a given value for a given tag, such as having the
+``accel`` tag set to ``kvm``, run:
+
+.. code::
+
+  avocado run -t accel:kvm .
+
+Multiple mandatory conditions can also be given.  To run only tests
+with ``arch`` set to ``x86_64`` and ``accell`` set to ``kvm``, run:
+
+.. code::
+
+  avocado run -t arch:x86_64,accel:kvm .
+
+It's also possible to exclude tests that contain a given value for a
+tag.  To list all tests that do *not* have ``arch`` set to ``x86_64``,
+run:
+
+.. code::
+
+  avocado run -t arch:-x86_64 .
+
 The ``avocado_qemu.Test`` base test class
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.35.1
