Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp475091njb;
        Fri, 26 Jul 2024 06:45:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVncfjVGgBh8YZUZK5LfKktlnzkS10JP1d+tjoxD3kL9XLeQMPaaWU5OrvKQC6sYeUYp/EP++2odW+pabVB6CeTuwG4jbOM
X-Google-Smtp-Source: AGHT+IHngkGtpZ7dW99C5tyA/YkVCGbX57N33iULCjVFkqbEzWiOvNdCuFQfdhKNXgaKipBGVsQG
X-Received: by 2002:a05:622a:614:b0:44f:f140:cec6 with SMTP id d75a77b69052e-44ff140d92emr55772191cf.43.1722001531551;
        Fri, 26 Jul 2024 06:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722001531; cv=none;
        d=google.com; s=arc-20160816;
        b=g8Xzoqak++4+wXXswtrHha54zE4/OI9m6Lc8I0acJXZrBJ0Z6X3n+2zKv1K65kFu41
         c/IxDkQ6V4SG+Q27fCYzZiNnAlKWXWbVdMHMdgoZuMYckvCdD8aoURXk5q/+VlwncZmk
         yDblutZ1DR3MpyTsbWz8qqHjNQIMMmtuDvendd+uviZwpDTIjdIIpH7kH8JlJY209BYH
         3fC+0cIuvaj4Hreim0qhF/inTTwTOG9tvjN+BkfWm0kJbduepC9hqd1SY6nMmyewXCHB
         b4baviVPxiLtXtppQJAKjDnAgVFNeB3z1qXjpCsDd7zBtqgx78QHd+5e7INB3kQmje+c
         uPQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CfbZVGkAr1tSkWl9/QjabXB/PTPT9K6rU+mi0TPjxrc=;
        fh=+JUQlqeb+WOWoY8tr4tplfLgDiP2lWYvcRFLGxWHojE=;
        b=ok0w9vO1faZP1ONdLeHuL/xgGW4Wd4FGGQhWULMnmO07EGR0rB75OAy+InNXfLqpir
         D80+saJ0acIzCJD+Tgn+KBA4KhD5ejc02xcwRTM/dFCSUru5/7pl61JwDGIZTky7XEBJ
         x382atYQ+b+Q9VelCz4DdWktzcaWyNJrzvKZqmeft+u8moVO5qNon1+tdD+VR2EE3NTM
         Dlmtg3vqttwNzIlt2qTXLaPabzJTZu/nhX7KdpjxHjdCzhJHRdEOOV3LaPGLF/jURT4C
         mB/JMD4Xj4vmFxXSFYWHS5Jp8nC4g8MeJ5F9SG/SoQorXr1Zqtt9zLnmycdCF9WxkFOV
         B73A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KzYEvm5f;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe813670esi38620741cf.155.2024.07.26.06.45.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 06:45:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KzYEvm5f;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722001531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CfbZVGkAr1tSkWl9/QjabXB/PTPT9K6rU+mi0TPjxrc=;
	b=KzYEvm5fIf+OUp4CaI62M/yKPjbgSnN1W5h0DdS9PyhP5nTZJjYQbsYgkS0WsovkSdXt7I
	UxZcb0BXoiBSFzy0/ZItvfXT+gnrEUfz1mn8uE4MlR3tC9hRK5gPcetZhR/xExSVIFm43/
	M9EXmPXZI5JBai/23vj0zEmI3+rkzt0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-265-33CqhGQePNa5PVJ-dZS0Yg-1; Fri,
 26 Jul 2024 09:45:26 -0400
X-MC-Unique: 33CqhGQePNa5PVJ-dZS0Yg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C48F11944B2C;
	Fri, 26 Jul 2024 13:45:24 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.22.17.77])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 264501955D42;
	Fri, 26 Jul 2024 13:45:20 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	David Woodhouse <dwmw2@infradead.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Radoslaw Biernacki <rad@semihalf.com>,
	Cleber Rosa <crosa@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 08/13] testa/avocado: test_arm_emcraft_sf2: handle RW requirements for asset
Date: Fri, 26 Jul 2024 09:44:33 -0400
Message-ID: <20240726134438.14720-9-crosa@redhat.com>
In-Reply-To: <20240726134438.14720-1-crosa@redhat.com>
References: <20240726134438.14720-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: BlaGVheNJFdm

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
index b8b0a4df10..2929aa042d 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -401,14 +401,16 @@ def test_arm_emcraft_sf2(self):
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
2.45.2
