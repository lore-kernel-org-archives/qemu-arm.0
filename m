Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2537127ejb;
        Fri, 8 Dec 2023 11:09:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4kwRpBNI5pdTu8eHadtpvTlikdqqFHpLa1kpK2ip/KRm6qPFzqG8QVegcsTk7/1O/y81u
X-Received: by 2002:a05:622a:1792:b0:425:4043:5f43 with SMTP id s18-20020a05622a179200b0042540435f43mr641766qtk.129.1702062593417;
        Fri, 08 Dec 2023 11:09:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702062593; cv=none;
        d=google.com; s=arc-20160816;
        b=0m/iQ2N7rM2mEXsobUz2JMxH2A6H2Ke7fO95EtzdHh88nV2UXGMTUcRH63aetUF5cB
         wnN+UH54uxqGBJZag+MKi28OwmHvKzSWzsKGQ0eOoYWU2E6ZKA4JojCQZz7ZbNizxofk
         uuR2l+J+R5RSg9DQwkEpd14AOVcO0u6YGp7e7A9Y0i8jM/tYSD1/kprbUBUnfzxrqVvj
         7jXAzUtGEY5BgjEDWroTDNcysPBPS0rI27M7m3u1Dtp0H8ZtRw8/f3UcRL8s4zjllYzX
         iWJLWT0e9R5IzSIuAlQhow5huoR0hdM1B5F0mO3tvvfjotWQT8nwkZ9rwrw63YmEjewA
         LX2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6KemJUkWyU9r+J/jwN6os/ZXFpgsYC5/aEWfNA4odDs=;
        fh=1DyVogfZItUndw0AQLC0GXn3EIhIcJypmHHdywm+J34=;
        b=LAwimBVMby+Elnwf5bG4U5CHrOxR5nBUpq4hA1Zp7p2+OLWNTCtfM2yOH55SBxPIXw
         FhHsHx9o5ZqvAS76wAoVVSiVotQNQvFYgn4KXvBVJHHO3aTvBkW+ePHs9JJZ+yZvMuL+
         +IoWH5n0t9HMdNrEenWY/Rv+fCS+0Nt0bkxxlXZRJ0dO7CIoztRdlVkBXkykmHai6smR
         qfj5ocE4BuIETCOGUVpc18Onp2vGviQXQSV5vsGcSh12z93GQ1l+/8RQLTSA/ZiL37/E
         wggngkRW+IaqGWbjSX1EoOWjAqxhXWBEajCNcK+l/8uAxoYzyBKOniKnY7Ealkcz+BcV
         aWPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hmr7cIrV;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id eh15-20020a05622a578f00b00423751a51edsi3021476qtb.284.2023.12.08.11.09.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 11:09:53 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hmr7cIrV;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702062593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6KemJUkWyU9r+J/jwN6os/ZXFpgsYC5/aEWfNA4odDs=;
	b=hmr7cIrVoycPzPT/dksuocK8bejCYcg4ydr2XrKkVJJCA/lhzkytXic1vG0JDimnWHsJhs
	yV4vi5zZgzZSUoafglQmooc0HzPM8yke0ZEKpaXH3Fr9N/Yievcib+7MeT0+mGW1FFzBIC
	mK35c1OUku4oFbTjavfsAefsf+taCiY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-620-blH1v5GyMemL3aM-9qkpaw-1; Fri,
 08 Dec 2023 14:09:48 -0500
X-MC-Unique: blH1v5GyMemL3aM-9qkpaw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C15A11C05AD8;
	Fri,  8 Dec 2023 19:09:47 +0000 (UTC)
Received: from p1.localdomain.com (ovpn-114-104.gru2.redhat.com [10.97.114.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD471111E406;
	Fri,  8 Dec 2023 19:09:44 +0000 (UTC)
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
Subject: [PATCH 08/10] tests/avocado/boot_xen.py: merge base classes
Date: Fri,  8 Dec 2023 14:09:09 -0500
Message-ID: <20231208190911.102879-9-crosa@redhat.com>
In-Reply-To: <20231208190911.102879-1-crosa@redhat.com>
References: <20231208190911.102879-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-TUID: ZITYrTCfhXWs

While it's a good practice to have reusable base classes, in this
specific case there's no other user of the BootXenBase class.

By unifying the class used in this test, we can improve readability
and have the opportunity to add some future improvements in a clearer
fashion.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/boot_xen.py | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/avocado/boot_xen.py b/tests/avocado/boot_xen.py
index fc2faeedb5..f80cbcb8fb 100644
--- a/tests/avocado/boot_xen.py
+++ b/tests/avocado/boot_xen.py
@@ -17,7 +17,7 @@
 from boot_linux_console import LinuxKernelTest
 
 
-class BootXenBase(LinuxKernelTest):
+class BootXen(LinuxKernelTest):
     """
     Boots a Xen hypervisor with a Linux DomU kernel.
     """
@@ -59,9 +59,6 @@ def launch_xen(self, xen_path):
         console_pattern = 'VFS: Cannot open root device'
         wait_for_console_pattern(self, console_pattern, "Panic on CPU 0:")
 
-
-class BootXen(BootXenBase):
-
     def test_arm64_xen_411_and_dom0(self):
         """
         :avocado: tags=arch:aarch64
-- 
2.43.0
