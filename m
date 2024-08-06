Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp1303012njb;
        Tue, 6 Aug 2024 10:33:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9c+78azD2kCwOFpotR0IdiQt0HDamctomoVVbnMccJVfno96a+QTh9SOXfDtsDo1QpqAXRTJB+7V7Ndw1nTl27qnDF5cN
X-Google-Smtp-Source: AGHT+IEWbP3pyYTENvMW2NRSaqDzMH08xrW+vZ3dYAmXnbjPeI3y8KSXcktmWuwR4Lvc7FsUJLZG
X-Received: by 2002:a05:622a:1823:b0:447:e796:26bf with SMTP id d75a77b69052e-451892c551cmr199285821cf.62.1722965583232;
        Tue, 06 Aug 2024 10:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722965583; cv=none;
        d=google.com; s=arc-20160816;
        b=aDDJIIL2bVh14bVlcUmOVNwGnGPuHOD7rayurjjcrlSe4Fw6tvn0qY3xQwT8L3BVi0
         u0ye8/28lpmubz38XKm9CnsTEEV1DZlaMEiZRKs4pSF3PNkl4Bmxe+wI7BiZV2aVSXcw
         8o9JHuohLXszb/NvvyCvgafAhtqpG/63rJNK82eQE960/H4Di/YxC6pem1yQ5aOxz3U1
         xxRCjoIbMPW28+xc9yT15emGsoO0C8UDE5uDeW8htKTRrrdbUIylStulaI4KfMJ9bEoT
         +b+xAwb23YM0pU6fikjqF7mEBDj5OJTuzlYqxGgtN1rf3yna0EG4xysLrikl5/PLs/EO
         LITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/43rvxiHluDKPSD2ULvPBKTQ4qhQty2OCaQvduh/gz8=;
        fh=pOdCxWa9rQJU0vaikvZDwOcgRIEwREE3jBY9GdQlMoI=;
        b=SKxfw7mpxMOMJUgzgyvu8SWjRme5lzHkJlOIFNNxF2+PBscBGyivsniK7G5AXCMQQ6
         28jGmy+ZXMV+TLTbQDqOwmMYPl/eAld2/4nzZHLaFljCjF9wi1aSX2JbOCNTUGV3tiEW
         RVEWqB5d73xMF+sP+7MSUfmGE/s0gjXTiUvMxtQgwWux9nyRfEK3eeZ1nQnyDmnZanIX
         bDy7cRkPSto50qeg7TR02p4wxElBZzPJdZZwFa9ns6WvruqdUHnbSvDGRiTyvkoULPHJ
         tjKg0K+8zhveKoHMEO7XEnN9+vUmi3IkuQhwG3uI/98U+7PCFqJlq4GvhIIsuLI8z3jc
         gc6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BkiH922e;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4518a77a85fsi123538371cf.427.2024.08.06.10.33.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 10:33:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BkiH922e;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722965582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/43rvxiHluDKPSD2ULvPBKTQ4qhQty2OCaQvduh/gz8=;
	b=BkiH922eGaWFwZ4kTYO2cLw556lHlTuQw0Rm9HposltInCgsBLAv+NbZ0gAra8QsqPto7I
	SBsceTOWIUUEQMVAiA4hkj8m4RP4BxDAiFTBFKJ5dgWTD12RX4JOMgOqiAuWR/NnHpW4Br
	F/WyowjiCGds30jrnyTvog7DifQ96uI=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-615-PKl5JxhrOmm8bMkomHdUyg-1; Tue,
 06 Aug 2024 13:32:59 -0400
X-MC-Unique: PKl5JxhrOmm8bMkomHdUyg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E0DA1955F0D;
	Tue,  6 Aug 2024 17:32:56 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.39.192.15])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C7EB91956046;
	Tue,  6 Aug 2024 17:32:46 +0000 (UTC)
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
Subject: [PATCH v2 7/9] tests/avocado/tuxrun_baselines.py: use Avocado's zstd support
Date: Tue,  6 Aug 2024 13:31:17 -0400
Message-ID: <20240806173119.582857-8-crosa@redhat.com>
In-Reply-To: <20240806173119.582857-1-crosa@redhat.com>
References: <20240806173119.582857-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: hrwuqcgG+zSl

This makes use of the avocado.utils.archive support for zstd.

In order to not duplicate code, the skip condition uses a private
utility from the module which is going to become public in Avocado
versions 103.1 LTS (and also in versions >= 107.0).

Reference: https://github.com/avocado-framework/avocado/pull/5996
Reference: https://github.com/avocado-framework/avocado/pull/5953
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/tuxrun_baselines.py | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index 736e4aa289..bd02e88ed6 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -17,6 +17,7 @@
 from avocado_qemu import QemuSystemTest
 from avocado_qemu import exec_command, exec_command_and_wait_for_pattern
 from avocado_qemu import wait_for_console_pattern
+from avocado.utils import archive
 from avocado.utils import process
 from avocado.utils.path import find_command
 
@@ -40,17 +41,12 @@ def get_tag(self, tagname, default=None):
 
         return default
 
+    @skipUnless(archive._probe_zstd_cmd(),
+                'Could not find "zstd", or it is not able to properly '
+                'decompress decompress the rootfs')
     def setUp(self):
         super().setUp()
 
-        # We need zstd for all the tuxrun tests
-        # See https://github.com/avocado-framework/avocado/issues/5609
-        zstd = find_command('zstd', False)
-        if zstd is False:
-            self.cancel('Could not find "zstd", which is required to '
-                        'decompress rootfs')
-        self.zstd = zstd
-
         # Process the TuxRun specific tags, most machines work with
         # reasonable defaults but we sometimes need to tweak the
         # config. To avoid open coding everything we store all these
@@ -99,8 +95,8 @@ def fetch_tuxrun_assets(self, csums=None, dt=None):
                                          asset_hash = isum,
                                          algorithm = "sha256")
 
-        cmd = f"{self.zstd} -d {disk_image_zst} -o {self.workdir}/rootfs.ext4"
-        process.run(cmd)
+        archive.extract(disk_image_zst, os.path.join(self.workdir,
+                                                     "rootfs.ext4"))
 
         if dt:
             dsum = csums.get(dt, None)
-- 
2.45.2
