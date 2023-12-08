Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2537155ejb;
        Fri, 8 Dec 2023 11:09:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+xcH9NMoylVti39ytYxQf+wjigo0LbWfklGiyVCD+G9Vey7S7solmHLUBbE2kxRhGCf5J
X-Received: by 2002:a05:620a:1006:b0:77f:408d:1bad with SMTP id z6-20020a05620a100600b0077f408d1badmr566081qkj.38.1702062595684;
        Fri, 08 Dec 2023 11:09:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702062595; cv=none;
        d=google.com; s=arc-20160816;
        b=BjKZPKHLdyIJx0QGvNXs/4fIAT0yGHwt4iepCAWSdIXB5JItX7f/SR9OFWjgn35h1O
         snct6QHH9Bp6I613wTy5IKQ1S5DIMD3Zr97ugR8Bfg9fGj5xR0A0OfYkGNkdUDvbSANY
         nM8BnaCyY+ABYyQiJv9MGnBOJFrxdX4TdIzIO8MLpEZGfn4ad3aIZjpV94BDKEhn9aq6
         6rPDfa1CIa4dJE8yNYRtYVuoQBX9CbpZqzeoYjw3zaU+tA4flRexG5c0jPEbMY26aWqh
         sSLwMxftl8+kAQcmtO/ekp6HJkSCu/3Ix0BlMK6P8z461pRb+qulFaM3AWB0ND8TwkCb
         dGuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aONzR2W5AGaoRzocN4fiH9lBklHZJB74jzBc5TX6OPU=;
        fh=1DyVogfZItUndw0AQLC0GXn3EIhIcJypmHHdywm+J34=;
        b=wJW/KTtnvmXXN/MLmoWfICBQh4BAe+2T/H56nISicQuZD70xYIRKWXYAmkb47xRmEM
         nK6dacrYRArvhMFJlRdzxdw+99J8YqQTAxJIWin7blujV2QLwoJU2tbVH8yQ3d3VFQ2y
         lbqNkhkFWLbHSq5oQrzwPu0owNiocTqqro7EmukbwF1MLXRC+ELTfNgnwuWLO1NsFiYE
         Wf/apt8Ay2cMDGj5/6osQkAupP6FqKsyLQp1gU09zd+j1llYqerMJCUUnklNicPGL6L4
         LnpcPNLQtsxVehP/MR+y0E0W/xOgbf7cwddQ3qiR21FVzpA9Ff15wCLmy1vTNooiXL9U
         bgqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="DnGqK/30";
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id y13-20020a05620a0e0d00b0077f04e58e77si2367413qkm.205.2023.12.08.11.09.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 11:09:55 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="DnGqK/30";
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702062595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aONzR2W5AGaoRzocN4fiH9lBklHZJB74jzBc5TX6OPU=;
	b=DnGqK/30YVEzorERHKaVw1tNfrgqjCy4xOJLHMA+1r9Fz/HybEs+CnOR7+HDX0Ph/Ek1Jk
	LkHaoKA9pfszLN/dweXvKnWeKB2qHTQ8TaED4vW74HM6WUC22fNFvoEO5cSYUdsXHa1rvY
	1zG2zyZX1jiuMF8Ptp0JxtbL5ESPmgQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-JwBPCelKNQqVsZnDr9QaLA-1; Fri, 08 Dec 2023 14:09:52 -0500
X-MC-Unique: JwBPCelKNQqVsZnDr9QaLA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18824185A781;
	Fri,  8 Dec 2023 19:09:51 +0000 (UTC)
Received: from p1.localdomain.com (ovpn-114-104.gru2.redhat.com [10.97.114.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14AD0112131D;
	Fri,  8 Dec 2023 19:09:47 +0000 (UTC)
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
Subject: [PATCH 09/10] tests/avocado/boot_xen.py: unify tags
Date: Fri,  8 Dec 2023 14:09:10 -0500
Message-ID: <20231208190911.102879-10-crosa@redhat.com>
In-Reply-To: <20231208190911.102879-1-crosa@redhat.com>
References: <20231208190911.102879-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-TUID: 0Fua8HLAO4sM

Because all tests share the same tags, it's possible to have all of
them at the class level.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/boot_xen.py | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/tests/avocado/boot_xen.py b/tests/avocado/boot_xen.py
index f80cbcb8fb..f4b63c1ef2 100644
--- a/tests/avocado/boot_xen.py
+++ b/tests/avocado/boot_xen.py
@@ -20,6 +20,11 @@
 class BootXen(LinuxKernelTest):
     """
     Boots a Xen hypervisor with a Linux DomU kernel.
+
+    :avocado: tags=arch:aarch64
+    :avocado: tags=accel:tcg
+    :avocado: tags=cpu:cortex-a57
+    :avocado: tags=machine:virt
     """
 
     timeout = 90
@@ -60,13 +65,6 @@ def launch_xen(self, xen_path):
         wait_for_console_pattern(self, console_pattern, "Panic on CPU 0:")
 
     def test_arm64_xen_411_and_dom0(self):
-        """
-        :avocado: tags=arch:aarch64
-        :avocado: tags=accel:tcg
-        :avocado: tags=cpu:cortex-a57
-        :avocado: tags=machine:virt
-        """
-
         # archive of file from https://deb.debian.org/debian/pool/main/x/xen/
         xen_url = ('https://fileserver.linaro.org/s/JSsewXGZ6mqxPr5/'
                    'download?path=%2F&files='
@@ -78,13 +76,6 @@ def test_arm64_xen_411_and_dom0(self):
         self.launch_xen(xen_path)
 
     def test_arm64_xen_414_and_dom0(self):
-        """
-        :avocado: tags=arch:aarch64
-        :avocado: tags=accel:tcg
-        :avocado: tags=cpu:cortex-a57
-        :avocado: tags=machine:virt
-        """
-
         # archive of file from https://deb.debian.org/debian/pool/main/x/xen/
         xen_url = ('https://fileserver.linaro.org/s/JSsewXGZ6mqxPr5/'
                    'download?path=%2F&files='
@@ -96,13 +87,6 @@ def test_arm64_xen_414_and_dom0(self):
         self.launch_xen(xen_path)
 
     def test_arm64_xen_415_and_dom0(self):
-        """
-        :avocado: tags=arch:aarch64
-        :avocado: tags=accel:tcg
-        :avocado: tags=cpu:cortex-a57
-        :avocado: tags=machine:virt
-        """
-
         xen_url = ('https://fileserver.linaro.org/'
                    's/JSsewXGZ6mqxPr5/download'
                    '?path=%2F&files=xen-upstream-4.15-unstable.deb')
-- 
2.43.0
