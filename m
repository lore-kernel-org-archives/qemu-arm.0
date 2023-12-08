Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2537105ejb;
        Fri, 8 Dec 2023 11:09:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuM4ZdU1kfMUvXK5NNuqx+FjFg75Rf6608Sa17uY8Aa10GuM6asqhiQ0WkCgI/iDbX634Y
X-Received: by 2002:a0c:f746:0:b0:67a:a721:b1b1 with SMTP id e6-20020a0cf746000000b0067aa721b1b1mr483521qvo.108.1702062591209;
        Fri, 08 Dec 2023 11:09:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702062591; cv=none;
        d=google.com; s=arc-20160816;
        b=kmXbQHiOUyWlJyMIWV+lprPdPytTHcpYXwGJbnYRwJre0kpfkdUowozQoxRrqU3e5y
         iIM99EHkTsVookLOHDKCaqKkMB9H37CD7/sZ77OPuhaiYT7h7v+Z0uplHe2y3N8onHrd
         Dv33Q0yhYeJ+y6QxasQbuRfqOieiMih2FT+AdFpiGfQOyBw+TvjNbq9cFPyBRIwtF6Jg
         ODDbwEdNYB4yLTlGZ59iikaAlsXvaEjK8S54aN4xag/fodZf8HIcoHOz0+Xlx7FNvMm2
         w+mbUPOQ+1wG74GDd2abfMbswRFQCcPFQ92C9/u3c2OJX0i5X5IflctGZ0XLdY7k/cPu
         Y60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AmGLkTWwFQFYqZRcdZPvYJBBBCt8tOcHxSrPZZ9IGpU=;
        fh=1DyVogfZItUndw0AQLC0GXn3EIhIcJypmHHdywm+J34=;
        b=RclAWlaohG8p/F9FxbeHz+JgdFqIrvzvbXaYHJaSa9mQg6FpjmhttmSuyNfQrhzIES
         1ltJ8KQ6w5Bp4DpjOAwKujvRg/l3C2zkeXlUdD54aI5xk1EjSf5JF7X5TVDXY2yyrgwL
         /cwoVXsaYv/Cj352hcxeWTTZNbdy1Zm8As+WwHRuOLP30IwDLjjW28wqHl4NHbDKFxVM
         GqA8jfk/imQX/N8iBK24LXzJ6Orixppi+AY3hw+QsreovRbhsK0/epns8GPvTBRiM4YG
         LiOwbal8xTYDYpBDyzTL8b/OjR53bBzjSlkZQ/ewYBhDq4Sx7L9pguIyjlkeNYHiwzcZ
         xcFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dWXDTN1K;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id c13-20020a056214004d00b0067cc92d5957si2709305qvr.260.2023.12.08.11.09.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 11:09:51 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dWXDTN1K;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702062590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AmGLkTWwFQFYqZRcdZPvYJBBBCt8tOcHxSrPZZ9IGpU=;
	b=dWXDTN1KsazEzXcNGR/cQ0JR2+pfSvxJqdeLmsWQgvg3aQTJbpDBhWixMev+11qBZOLlr7
	0CHlIlHgfGyxgOxplWSXzcum6/ii2UPL5erVmQVPfL19TOzJai93aIg2I0ZOTzb3jdu9Gn
	wXl+1ZrBOuW7OpuGYFGKKgUACHfn4/8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-BBdazSDrOnOS10C4y7b7oQ-1; Fri, 08 Dec 2023 14:09:45 -0500
X-MC-Unique: BBdazSDrOnOS10C4y7b7oQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76559102F220;
	Fri,  8 Dec 2023 19:09:44 +0000 (UTC)
Received: from p1.localdomain.com (ovpn-114-104.gru2.redhat.com [10.97.114.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7169B111E404;
	Fri,  8 Dec 2023 19:09:41 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Paul Durrant <paul@xen.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 07/10] testa/avocado: test_arm_emcraft_sf2: handle RW requirements for asset
Date: Fri,  8 Dec 2023 14:09:08 -0500
Message-ID: <20231208190911.102879-8-crosa@redhat.com>
In-Reply-To: <20231208190911.102879-1-crosa@redhat.com>
References: <20231208190911.102879-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-TUID: MLY0RaMb6RK2

The asset used in the mentioned test gets truncated before it's used
in the test.  This means that the file gets modified, and thus the
asset's expected hash doesn't match anymore.  This causes cache misses
and re-downloads every time the test is re-run.

Let's make a copy of the asset so that the one in the cache is
preserved and the cache sees a hit on re-runs.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/boot_linux_console.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index f5c5d647a4..e2e928e703 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -414,14 +414,16 @@ def test_arm_emcraft_sf2(self):
                    'fe371d32e50ca682391e1e70ab98c2942aeffb01/spi.bin')
         spi_hash = '65523a1835949b6f4553be96dec1b6a38fb05501'
         spi_path = self.fetch_asset(spi_url, asset_hash=spi_hash)
+        spi_path_rw = os.path.join(self.workdir, os.path.basename(spi_path))
+        shutil.copy(spi_path, spi_path_rw)
 
-        file_truncate(spi_path, 16 << 20) # Spansion S25FL128SDPBHICO is 16 MiB
+        file_truncate(spi_path_rw, 16 << 20) # Spansion S25FL128SDPBHICO is 16 MiB
 
         self.vm.set_console()
         kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE
         self.vm.add_args('-kernel', uboot_path,
                          '-append', kernel_command_line,
-                         '-drive', 'file=' + spi_path + ',if=mtd,format=raw',
+                         '-drive', 'file=' + spi_path_rw + ',if=mtd,format=raw',
                          '-no-reboot')
         self.vm.launch()
         self.wait_for_console_pattern('Enter \'help\' for a list')
-- 
2.43.0
