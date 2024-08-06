Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp1302861njb;
        Tue, 6 Aug 2024 10:32:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMqWptR3ABYFLPt2bYg5ceqW1uxRaAX0dLxrNSMJ6IB8YtzhuvElZOptRvaqd691gFx7oAzVDo86VtCYYySjLOC9bofvnM
X-Google-Smtp-Source: AGHT+IEUUEYfeayIR5P76cG2Mb3MWYf3hUEop8MeXIk3lnj1fXVLinETY4dPxScyXoAdENLNREQj
X-Received: by 2002:a05:620a:2941:b0:79f:4c8:d873 with SMTP id af79cd13be357-7a34efde5e3mr2495110585a.28.1722965553475;
        Tue, 06 Aug 2024 10:32:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722965553; cv=none;
        d=google.com; s=arc-20160816;
        b=rqo7Nf+gM0O5sEvGFYoQl0PlVZpgJxv/VQHFRvvbsbrR6eR4jT88KiFVghOOx9SJ5/
         NyTHn7ieD+HJJnfse30UKEAYMHPs9pXas9nsOa/ivrTW4YeQWs4lgY5tnAQez6z9iDTs
         lkO88IJyS+pu8ppcPy53aKMVTucqJYrQNgWho36mzwALVeZ68hTI5L2LndzYbRo2yVmn
         NUYqJoHD/gT/fVrVGemJjj3FSrI81laoIwNdRsmtqVVweSITMyV84wsYQmX02W4KDrRJ
         N+SQwiQHd1oOz7C1/DxZThurpvgAeaLiXge+KrJYyg1h1EJYOfVkxOfo1xnUm73AsbXf
         IftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KL0H1z5/pg3dizYMSsFK6oSLNICej54wUK//KBAoyq8=;
        fh=pOdCxWa9rQJU0vaikvZDwOcgRIEwREE3jBY9GdQlMoI=;
        b=JmkpC4nrOpNccoTA5QF3Y64gMXaJP+QtBEp2LIIkZ5iFa6NkP0fjA3JaNyP8pADkKP
         T7FbaeZJy/iapYbUIdVMj6MGtymAqySd8R6++uLCbXHgnAGzPUGqA6FZlgW54Xdsrq/9
         5fvsT11J7VBgholNwyHvPrCneLqL7SRGUQtgPiPvwmFC3odfOlnJaxWXRY+3vpBn+4z5
         xVBkO0gdEOWgevV8NxY0UTtwVa2JU/Eb/eqP957PaZsVBhoKGu2smSG3cITDXMG2FIuc
         OXGrvcShZHRX0+d9qLYNpUl2Gj+2K8SZWOSL/N/7R4YohfbWO0OO0z+jWrxJeIohnA8O
         0zmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EacumavA;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a34f74ec58si1291778385a.325.2024.08.06.10.32.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 10:32:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EacumavA;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722965553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KL0H1z5/pg3dizYMSsFK6oSLNICej54wUK//KBAoyq8=;
	b=EacumavArqJQAHHLIAZVw/W0V/2RCdX+a+L73LJ51kTYeLe+amc0sbupXqzMOJ7dsdyc/R
	qakByiJtJ+Kzc39ist11KgWQ0h/5Qyscyg5jmLxzfpJ1rDTuJRnwZ4/TUXWDQUoznfBdts
	pLqeD542CC5eJaHL9qQ7RDrUosk3Mws=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-459-9eWeJM_pNJ6UG27hhqXTPg-1; Tue,
 06 Aug 2024 13:32:29 -0400
X-MC-Unique: 9eWeJM_pNJ6UG27hhqXTPg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 76C5C1955BED;
	Tue,  6 Aug 2024 17:32:26 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.39.192.15])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7B3E21956046;
	Tue,  6 Aug 2024 17:32:14 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Troy Lee <leetroy@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Beraldo Leal <bleal@redhat.com>,
	kvm@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paul Durrant <paul@xen.org>,
	Eric Auger <eric.auger@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	qemu-arm@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>
Subject: [PATCH v2 4/9] tests/avocado: machine aarch64: standardize location and RO access
Date: Tue,  6 Aug 2024 13:31:14 -0400
Message-ID: <20240806173119.582857-5-crosa@redhat.com>
In-Reply-To: <20240806173119.582857-1-crosa@redhat.com>
References: <20240806173119.582857-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: YVZjHSanoPYI

The tests under machine_aarch64_virt.py and machine_aarch64_sbsaref.py
should not be writing to the ISO files.  By adding "media=cdrom" the
"ro" is autmatically set.

While at it, let's use a single code style and hash for the ISO url.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/machine_aarch64_sbsaref.py |  2 +-
 tests/avocado/machine_aarch64_virt.py    | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index e920bbf08c..756f316ac9 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -129,7 +129,7 @@ def boot_alpine_linux(self, cpu):
             "-cpu",
             cpu,
             "-drive",
-            f"file={iso_path},format=raw",
+            f"file={iso_path},media=cdrom,format=raw",
         )
 
         self.vm.launch()
diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/avocado/machine_aarch64_virt.py
index a90dc6ff4b..6831d2c0ed 100644
--- a/tests/avocado/machine_aarch64_virt.py
+++ b/tests/avocado/machine_aarch64_virt.py
@@ -37,13 +37,13 @@ def test_alpine_virt_tcg_gic_max(self):
         :avocado: tags=machine:virt
         :avocado: tags=accel:tcg
         """
-        iso_url = ('https://dl-cdn.alpinelinux.org/'
-                   'alpine/v3.17/releases/aarch64/'
-                   'alpine-standard-3.17.2-aarch64.iso')
+        iso_url = (
+            "https://dl-cdn.alpinelinux.org/"
+            "alpine/v3.17/releases/aarch64/alpine-standard-3.17.2-aarch64.iso"
+        )
 
-        # Alpine use sha256 so I recalculated this myself
-        iso_sha1 = '76284fcd7b41fe899b0c2375ceb8470803eea839'
-        iso_path = self.fetch_asset(iso_url, asset_hash=iso_sha1)
+        iso_hash = "5a36304ecf039292082d92b48152a9ec21009d3a62f459de623e19c4bd9dc027"
+        iso_path = self.fetch_asset(iso_url, algorithm="sha256", asset_hash=iso_hash)
 
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -60,7 +60,7 @@ def test_alpine_virt_tcg_gic_max(self):
         self.vm.add_args("-smp", "2", "-m", "1024")
         self.vm.add_args('-bios', os.path.join(BUILD_DIR, 'pc-bios',
                                                'edk2-aarch64-code.fd'))
-        self.vm.add_args("-drive", f"file={iso_path},format=raw")
+        self.vm.add_args("-drive", f"file={iso_path},media=cdrom,format=raw")
         self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
         self.vm.add_args('-object', 'rng-random,id=rng0,filename=/dev/urandom')
 
-- 
2.45.2
