Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp474743njb;
        Fri, 26 Jul 2024 06:44:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXb4m6f8FdXbUbshOYTpjRRpgfTSj9vyNZSxx16YoVT4RnDbr0gQJIlORzbwyD8njkitb7tw2Wf2yyFnmBClxwKsnkoCbfu
X-Google-Smtp-Source: AGHT+IExh8LaZwMePSIMp0ASYFOqrlNeUAs8n4WAMOLqX3ZeUjX2k4ujZbCX8SW22/qBpPiR9nTe
X-Received: by 2002:a05:620a:3949:b0:79f:16df:a69f with SMTP id af79cd13be357-7a1d44a69b9mr688225585a.2.1722001497446;
        Fri, 26 Jul 2024 06:44:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722001497; cv=none;
        d=google.com; s=arc-20160816;
        b=ctOVNFjW10Im2uP/WQhmc2bJekm4Yg4z3JJcddeEG3Bfav/CnpIGqKcZi40u0QmuH/
         Gjzes+L04Gmle1fuwhULidEGQ6kF8XnKhn17uFxJUR52c/eAb/NAYFI3XrITggTANheJ
         AilJcTeML76dwhOghBI8SfwO7ia4tAojeXUjIgXMhuml5eNJhZQZJlzOkxmZTOzYcHZY
         TEf26zOHetDR5YqtV3XzphDHcSynT4xbfoNcJPpKQmlqbJZAel2XKiNw3bsslHfLwqO6
         UcYnkNcrPa8yWOr78535DjNAKDVN+Eiu7hhox5SqtgwYb2pe7heTn9am1wLakqlkyDVn
         bexA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=P7FQv58StIJYRSxNKiflwjN+bDbno3sTr5DQJiQhOCs=;
        fh=+JUQlqeb+WOWoY8tr4tplfLgDiP2lWYvcRFLGxWHojE=;
        b=q5cVmWlKY/dI6EVr7DjHc1P77J9fOaxW1kY7TRuERogmnzuVj49jsNWNARsC7KFbyV
         +YzmikW7O32A4+sv1ZBMUMcSCfwG8FWMRCyFUHnEjEGDgVE0e7Cs5UFZjlMGsI7r3Uc6
         w1hRn8Rj8S6FM7BA0aA9Y0jCwSUW70XtZAW/AD7ofLfpwVFmMmQkg3ozIf7lJxQ8Lgbt
         irOJBERMHK7xlCj6ptZ3SNpqf8gapTgpNuJ99JpqVGRM78dnLZu7RT8iC0wNd7X3GZKk
         5Aojm2l4eHPYqJhSZKCl/N4U6HYtuhgkkdsV4CNjUhHe2LFmTlRognLSW4ciLz1kn5lJ
         oLFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QfKQPjPw;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d73b87besi403918485a.181.2024.07.26.06.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 06:44:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QfKQPjPw;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722001497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P7FQv58StIJYRSxNKiflwjN+bDbno3sTr5DQJiQhOCs=;
	b=QfKQPjPw8gTvQ+r9L8uE5va4oJ48FsPQAgkh5GSzBpXwI22gVEqSw+AaDfg3kPpGDCU1f5
	lojtpwmpSryPw1yIKIfsW4grql8izKEWoJ2ao+TBVdR5NSlxnAnt7/Xs1MpObA3qvFNyn7
	X20YI/9oY5zFWZkcb5lmmSwd3X2n9PE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-336-kMaxmtupO6SdmFdhmEXmeg-1; Fri,
 26 Jul 2024 09:44:55 -0400
X-MC-Unique: kMaxmtupO6SdmFdhmEXmeg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CF8C21956046;
	Fri, 26 Jul 2024 13:44:52 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.22.17.77])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A97441955D45;
	Fri, 26 Jul 2024 13:44:48 +0000 (UTC)
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
Subject: [PATCH 01/13] tests/avocado: mips: fallback to HTTP given certificate expiration
Date: Fri, 26 Jul 2024 09:44:26 -0400
Message-ID: <20240726134438.14720-2-crosa@redhat.com>
In-Reply-To: <20240726134438.14720-1-crosa@redhat.com>
References: <20240726134438.14720-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: 8oIZ9XCFJgqj

The SSL certificate installed at mipsdistros.mips.com has expired:

 0 s:CN = mipsdistros.mips.com
 i:C = US, O = Amazon, OU = Server CA 1B, CN = Amazon
 a:PKEY: rsaEncryption, 2048 (bit); sigalg: RSA-SHA256
 v:NotBefore: Dec 23 00:00:00 2019 GMT; NotAfter: Jan 23 12:00:00 2021 GMT

Because this project has no control over that certificate and host,
this falls back to plain HTTP instead.  The integrity of the
downloaded files can be guaranteed by the existing hashes for those
files (which are not modified here).

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/boot_linux_console.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index c35fc5e9ba..450d67be6a 100644
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
2.45.2
