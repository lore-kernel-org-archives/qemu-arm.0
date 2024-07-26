Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp475256njb;
        Fri, 26 Jul 2024 06:45:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXuZjLTkf98rF9le643buczNO3eg0Bz9izl76bJ8tczARqA2dZcyg8AS5Tf+9eu+i0fKq9jA8fhabO1Mwm87osMsPZFooSR
X-Google-Smtp-Source: AGHT+IEMO2Ri7kSpnZe+3XDcWAzT9M8jvIe0EmrT22jKAte2E8nguplW7VKxkzwe/QmEbuaaFIUn
X-Received: by 2002:a05:6214:21e2:b0:6b5:44c:24ea with SMTP id 6a1803df08f44-6bb40720f41mr64999966d6.16.1722001549742;
        Fri, 26 Jul 2024 06:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722001549; cv=none;
        d=google.com; s=arc-20160816;
        b=iUV73J3RI6qSZrhjozxXB38FHrliFggvPUvrWj0UbDJjePQ98MqGnqnDD5v1Pa4VNf
         P/cZQkZlinoVt+CbuXu7gc+cBDxJbPSyqfigFd5elxKmc1daeGoAGy5Y+vi+CbKj5c6I
         sSYrreiXQgtTHojzh2XNt3IedSgHEm2cHRgcjDIJtvvdRBQrOH7fSNFuLg8i5KClTQAQ
         ETP0hH38ndXJnQT5Wp91dogwa0e1LHUd+iyUt50rbiaH66a7KGq8AT4f1yKNbhA3B/Km
         x9IXBZqAtM5WsOE2kruk3vKF0R742fdTiEs6Kq3tXIQcU6Dv7/lltAxFQP56ZOyS/bvS
         u/Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=22aK5G9Gu9BLJGucdCy0aPoPQpR5xm/lyRWYWqyAjJA=;
        fh=+JUQlqeb+WOWoY8tr4tplfLgDiP2lWYvcRFLGxWHojE=;
        b=ILaxd1mrfoQP2jpM4FbyN4qHX7oe8oT/4oSrYbxVUAfkrnTEZjUv/IACLIM3ixFrG9
         8bB1BjXck3KW91OIVEBKFPtSh/MiyhF0332HxscK7tulndkXdHXw357nnczL30cIqj1Q
         f2dgYZN9elH0Ocl2h6/PMQVRZnvwmRnE+EKd7xDUkwYZVt5mte+AhZyzoTkx1btkiJ6/
         K/Nk+91S+w0Ccs32JI6Z8l1jm1PAGOFkADqVCfazTQl5bS93oL7rb2BZ5Yngi7Y/Tdzo
         iFm52GM/Qqd5X2yfrG5x6ipFJzuw+H4drRqg25R1JbbZf1mNJhl3ZbwaySX5neOeg8BG
         4i9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jN1wgmon;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3fa87275si40986386d6.241.2024.07.26.06.45.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 06:45:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jN1wgmon;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722001549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=22aK5G9Gu9BLJGucdCy0aPoPQpR5xm/lyRWYWqyAjJA=;
	b=jN1wgmon9cPb5i+f9/vzA8nlXJYIumD3eaHXFqH7s2/QPoZLD4Xmy4Kepv9W13BC1cbuLn
	mTkayTjgV9+YfgGMh8BBVdH1UBrDNaHPzkxYhwSlt18+Rfv3pYXlwObElfRe6ksfbZ3b79
	QJf/B7Z7U8890JqBrjvI/15gEC0bTOs=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-80-1NnmSBVsP8KgRivKXZD1fA-1; Fri,
 26 Jul 2024 09:45:46 -0400
X-MC-Unique: 1NnmSBVsP8KgRivKXZD1fA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 97E1718EB20E;
	Fri, 26 Jul 2024 13:45:38 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.22.17.77])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B7C961955D42;
	Fri, 26 Jul 2024 13:45:33 +0000 (UTC)
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
Subject: [PATCH 11/13] tests/avocado/machine_aarch64_sbsaref.py: allow for rw usage of image
Date: Fri, 26 Jul 2024 09:44:36 -0400
Message-ID: <20240726134438.14720-12-crosa@redhat.com>
In-Reply-To: <20240726134438.14720-1-crosa@redhat.com>
References: <20240726134438.14720-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: 9aFChd2dDKvb

When the OpenBSD based tests are run in parallel, the previously
single instance of the image would become corrupt.  Let's give each
test its own copy.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/machine_aarch64_sbsaref.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index 1275f24532..8816308b86 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -7,6 +7,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 
 import os
+import shutil
 
 from avocado import skipUnless
 from avocado.utils import archive
@@ -187,7 +188,9 @@ def boot_openbsd73(self, cpu):
         )
 
         img_hash = "7fc2c75401d6f01fbfa25f4953f72ad7d7c18650056d30755c44b9c129b707e5"
-        img_path = self.fetch_asset(img_url, algorithm="sha256", asset_hash=img_hash)
+        cached_img_path = self.fetch_asset(img_url, algorithm="sha256", asset_hash=img_hash)
+        img_path = os.path.join(self.workdir, os.path.basename(cached_img_path))
+        shutil.copy(cached_img_path, img_path)
 
         self.vm.set_console()
         self.vm.add_args(
-- 
2.45.2
