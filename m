Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2536879ejb;
        Fri, 8 Dec 2023 11:09:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsQuvmfE78ckjiRIw4FTzZMQvZDbaRzUi+qBoweoSC8isdvXakl+MtdCwNnJmkPWFZBkpl
X-Received: by 2002:a9d:7349:0:b0:6d8:4e1d:7723 with SMTP id l9-20020a9d7349000000b006d84e1d7723mr486884otk.20.1702062570312;
        Fri, 08 Dec 2023 11:09:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702062570; cv=none;
        d=google.com; s=arc-20160816;
        b=sYrDU67WMoTuVjBBZYlXKNVNWISnp8LVkAtvngG/yGyCuKTqqaNRlypdyn2sDiOYdy
         PcLvGEKfuc6x1GVvpwg10mCPqxl6B4yo90crccxUT0aAiDrkk5gYgEzvIDJbSOZJFUMT
         OdjmiZ5+E2u63HmgjT4TGfj1ZGKsSULFa1puxHUoNPMdGkpdfvQhkICF/nlyiwZOfwU3
         1wNGI0G7kVEiR4CtKh1xTAValQSfbbBqhZ+WWOHILWjfZrpmQoBBu0ONLE0D8GL0uHg/
         heNK4y8YMnQ5CEUf36RR1BoemtkOw134IBhomkrpOrPU2oXQiIb3kCUeYotJDF9wrbZO
         PLVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wdEEnBD47cr/C4n0H9WjVscK7jQsS6lAH6ka4UUOD5A=;
        fh=1DyVogfZItUndw0AQLC0GXn3EIhIcJypmHHdywm+J34=;
        b=lFCjSYgFm4+eHq8AShOR7ajGhYfvcXoLR/btSzWAWcNf2JuTB0AVgezwk9FaDirSNB
         ictrh6GX4OXw9ZGGMh/pMi3xahCWPYUhxulCefRxkhZryYUiqApJOqtKVK06sc32vmOI
         RihvOSpu6yc41TJrPIYE+A+x2QKTuRO7w8JQq0dGUDvIYCSk+VkcL0pYKMn41Z9Gv/uq
         z/zZBlA28/K1DCrD6tSrpeaGIoVGnjwPhma4OArXYe3W+Y10ICdIGZThHApTAN4j4kdZ
         yA9d19ENLCAGKnQD76Iii1+8en12UtTRs1FroYDLgYKYNvItIk0bfseuqvmkjoL6pVhT
         jz/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G4SmeM2x;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id t25-20020a67f159000000b004648252343fsi701333vsm.119.2023.12.08.11.09.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 11:09:30 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G4SmeM2x;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702062569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wdEEnBD47cr/C4n0H9WjVscK7jQsS6lAH6ka4UUOD5A=;
	b=G4SmeM2xXxaSojzm9OXGlfp6z3eNuWJ8DedtvIBR/IEGs50ukLADp+AH99U8ZfSNrE79ax
	GGFJWiBHVOnvT5dFPyzYhmAmtLfWxJw8KnAjsq1uux9hcqYIUEOMe3a4lMFZbmCQKFUa/L
	1D2WoMlnGdWwxCc34XXlhVi4C3chHKU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-t1mhqpHFPUmoqQ8JkaKWHA-1; Fri, 08 Dec 2023 14:09:25 -0500
X-MC-Unique: t1mhqpHFPUmoqQ8JkaKWHA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A4AC8352A0;
	Fri,  8 Dec 2023 19:09:24 +0000 (UTC)
Received: from p1.localdomain.com (ovpn-114-104.gru2.redhat.com [10.97.114.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 855D1112131D;
	Fri,  8 Dec 2023 19:09:21 +0000 (UTC)
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
Subject: [PATCH 01/10] tests/avocado: mips: fallback to HTTP given certificate expiration
Date: Fri,  8 Dec 2023 14:09:02 -0500
Message-ID: <20231208190911.102879-2-crosa@redhat.com>
In-Reply-To: <20231208190911.102879-1-crosa@redhat.com>
References: <20231208190911.102879-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-TUID: yf58cMUcupHb

The SSL certificate installed at mipsdistros.mips.com has expired:

 0 s:CN = mipsdistros.mips.com
 i:C = US, O = Amazon, OU = Server CA 1B, CN = Amazon
 a:PKEY: rsaEncryption, 2048 (bit); sigalg: RSA-SHA256
 v:NotBefore: Dec 23 00:00:00 2019 GMT; NotAfter: Jan 23 12:00:00 2021 GMT

Because this project has no control over that certificate and host,
this falls back to plain HTTP instead.  The integrity of the
downloaded files can be guaranteed by the existing hashes for those
files (which are not modified here).

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/boot_linux_console.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 3f0180e1f8..8066861c17 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -299,7 +299,7 @@ def test_mips_malta32el_nanomips_4k(self):
         :avocado: tags=endian:little
         :avocado: tags=cpu:I7200
         """
-        kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
+        kernel_url = ('http://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
                       'generic_nano32r6el_page4k.xz')
         kernel_hash = '477456aafd2a0f1ddc9482727f20fe9575565dd6'
@@ -312,7 +312,7 @@ def test_mips_malta32el_nanomips_16k_up(self):
         :avocado: tags=endian:little
         :avocado: tags=cpu:I7200
         """
-        kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
+        kernel_url = ('http://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
                       'generic_nano32r6el_page16k_up.xz')
         kernel_hash = 'e882868f944c71c816e832e2303b7874d044a7bc'
@@ -325,7 +325,7 @@ def test_mips_malta32el_nanomips_64k_dbg(self):
         :avocado: tags=endian:little
         :avocado: tags=cpu:I7200
         """
-        kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
+        kernel_url = ('http://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
                       'generic_nano32r6el_page64k_dbg.xz')
         kernel_hash = '18d1c68f2e23429e266ca39ba5349ccd0aeb7180'
-- 
2.43.0
