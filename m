Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1027106qvs;
        Tue, 13 Jul 2021 14:21:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhXF80jTqOkbbYZIwMU39RTOuZMYQXqIlE+WL8gQxq06yd3zUGgKxot4aoZQfcKRW82mxs
X-Received: by 2002:a17:906:17c4:: with SMTP id u4mr8210207eje.481.1626211263126;
        Tue, 13 Jul 2021 14:21:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211263; cv=none;
        d=google.com; s=arc-20160816;
        b=ik7vcCnwdL9Vasw+/l1owZtDnkADh31l7v5WGmQf3L/XS8kh6F02AKkLW+3/clhwEI
         mhq4zGen2A6JPV3E35Tj81AAE30OFPn1gpvpjsvTOO2MSl09hXnrjAa5SJv94zMoKIdu
         KE5tIHUWpUZph4QFyY86j6cMseVqc5caZI3Pg5ljpotEOX/ttBKmstytDDPDi2tpDMJ2
         APaY11C0J0hxdnQS2AuOGJ3QjO/1Ar/1M0LPAzTFIGaGBsJh3aa+Tbv3fUzJTvSybeB4
         jkivOwAjy6pCI4e4GS3w7u7ykW1YDwtgLES6YJio9WwfmlPj8QRODdw658QiESSvT0ht
         Z/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=S5dZ8DclsjkpdzCUuxjcyTgqtpLFUVUhRxkTUrExvOw=;
        b=CerZGYwMzoZv0D0uUmtyTxi3onpTKrFqsn48bXFzFutziWuTHM6leYzkJR4kIjwoRv
         ph9+heUoFGuk9+a3bxHRHyf7+2QJLM1am+UwTwkZnTaPWGu24g3pXtvKZaBPA2npcoNW
         H4zBXdQZxZNd1sWZhWtQbJsojfCbAegyye8G0Gfu+GAUc30zlEfQEdgTgDjQFBP4n7hT
         GRA42+Kk5YKFDdAHTikVmv+ROonYQ8+EMshxsfRILO+RehhE4H+jTkL4Xxkk1cnKqRVW
         6zwJvDhTCqcCIEHS/ktD0f7iM7O4Uoaifk2jT3Z392jci/RW292JNdopoOyVPluRBPdY
         /m9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gy9WwOH2;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id cd8si4755852ejb.12.2021.07.13.14.21.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:21:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gy9WwOH2;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S5dZ8DclsjkpdzCUuxjcyTgqtpLFUVUhRxkTUrExvOw=;
	b=gy9WwOH2Fs0IYWuuIIG8Kjt9VzjlFQl433kHQ3IyEUXLbF3v2JdOjQeX2T50bUb/5mim1a
	5agT7mmSxTSe95vOd/VUs0v7XnUVCo0iE1RkqILYzaklSctLDDLMnUUzJSteVuDEiwr/Sl
	1LUjN1reZEMV7kl44OD9S8xlqDK+d8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-zWyC23B-PMCR7cZ374EWgg-1; Tue, 13 Jul 2021 17:20:59 -0400
X-MC-Unique: zWyC23B-PMCR7cZ374EWgg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02FE8100B3AC;
	Tue, 13 Jul 2021 21:20:57 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B158519C59;
	Tue, 13 Jul 2021 21:20:54 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Ryo ONODERA <ryoon@netbsd.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Willian Rampazzo <willianr@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	John Snow <jsnow@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Cleber Rosa <crosa@redhat.com>
Subject: [PULL 09/23] Acceptance Tests: Add default kernel params and pxeboot url to the KNOWN_DISTROS collection
Date: Tue, 13 Jul 2021 17:19:09 -0400
Message-Id: <20210713211923.3809241-10-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
References: <20210713211923.3809241-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: U07SwvbjEFAo

From: Willian Rampazzo <willianr@redhat.com>

When running LinuxTests we may need to run the guest with
custom params. It is practical to store the pxeboot URL
and the default kernel params so that the
tests just need to fetch those and augment the kernel params.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210706131729.30749-3-eric.auger@redhat.com>
[CR: split long lines]
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 58 +++++++++++++++++++++--
 1 file changed, 55 insertions(+), 3 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 256befafc4..1de1edce0d 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -317,17 +317,59 @@ class LinuxDistro:
             '31': {
                 'x86_64':
                 {'checksum': ('e3c1b309d9203604922d6e255c2c5d09'
-                              '8a309c2d46215d8fc026954f3c5c27a0')},
+                              '8a309c2d46215d8fc026954f3c5c27a0'),
+                 'pxeboot_url': ('https://archives.fedoraproject.org/'
+                                 'pub/archive/fedora/linux/releases/31/'
+                                 'Everything/x86_64/os/images/pxeboot/'),
+                 'kernel_params': ('root=UUID=b1438b9b-2cab-4065-a99a-'
+                                   '08a96687f73c ro no_timer_check '
+                                   'net.ifnames=0 console=tty1 '
+                                   'console=ttyS0,115200n8'),
+                },
                 'aarch64':
                 {'checksum': ('1e18d9c0cf734940c4b5d5ec592facae'
-                              'd2af0ad0329383d5639c997fdf16fe49')},
+                              'd2af0ad0329383d5639c997fdf16fe49'),
+                'pxeboot_url': 'https://archives.fedoraproject.org/'
+                               'pub/archive/fedora/linux/releases/31/'
+                               'Everything/aarch64/os/images/pxeboot/',
+                'kernel_params': ('root=UUID=b6950a44-9f3c-4076-a9c2-'
+                                  '355e8475b0a7 ro earlyprintk=pl011,0x9000000'
+                                  ' ignore_loglevel no_timer_check'
+                                  ' printk.time=1 rd_NO_PLYMOUTH'
+                                  ' console=ttyAMA0'),
+                },
                 'ppc64':
                 {'checksum': ('7c3528b85a3df4b2306e892199a9e1e4'
                               '3f991c506f2cc390dc4efa2026ad2f58')},
                 's390x':
                 {'checksum': ('4caaab5a434fd4d1079149a072fdc789'
                               '1e354f834d355069ca982fdcaf5a122d')},
-            }
+            },
+            '32': {
+                'aarch64':
+                {'checksum': ('b367755c664a2d7a26955bbfff985855'
+                              'adfa2ca15e908baf15b4b176d68d3967'),
+                'pxeboot_url': ('http://dl.fedoraproject.org/pub/fedora/linux/'
+                                'releases/32/Server/aarch64/os/images/'
+                                'pxeboot/'),
+                'kernel_params': ('root=UUID=3df75b65-be8d-4db4-8655-'
+                                  '14d95c0e90c5 ro no_timer_check net.ifnames=0'
+                                  ' console=tty1 console=ttyS0,115200n8'),
+                },
+            },
+            '33': {
+                'aarch64':
+                {'checksum': ('e7f75cdfd523fe5ac2ca9eeece68edc1'
+                              'a81f386a17f969c1d1c7c87031008a6b'),
+                'pxeboot_url': ('http://dl.fedoraproject.org/pub/fedora/linux/'
+                                'releases/33/Server/aarch64/os/images/'
+                                'pxeboot/'),
+                'kernel_params': ('root=UUID=d20b3ffa-6397-4a63-a734-'
+                                  '1126a0208f8a ro no_timer_check net.ifnames=0'
+                                  ' console=tty1 console=ttyS0,115200n8'
+                                  ' console=tty0'),
+                 },
+            },
         }
     }
 
@@ -351,6 +393,16 @@ def checksum(self):
     def checksum(self, value):
         self._info['checksum'] = value
 
+    @property
+    def pxeboot_url(self):
+        """Gets the repository url where pxeboot files can be found"""
+        return self._info.get('pxeboot_url', None)
+
+    @property
+    def default_kernel_params(self):
+        """Gets the default kernel parameters"""
+        return self._info.get('kernel_params', None)
+
 
 class LinuxTest(Test, LinuxSSHMixIn):
     """Facilitates having a cloud-image Linux based available.
-- 
2.31.1
