Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp474892njb;
        Fri, 26 Jul 2024 06:45:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmD7frn1XbVhKAdRK8PU0Aq8GxPdQiBaL6nhelpIjccwk/Jq5C8+YkFGrZBnWV7mFMVwQ0SfPoanR7nkmByNrDcIQ+KTBG
X-Google-Smtp-Source: AGHT+IHxfrn9FDInykhfspNWMfsj9mFVLpqJwM4sSt7wsqc8EXv+lSHNVmBi/m/4bOZezCPGhK9u
X-Received: by 2002:a05:6359:a399:b0:1aa:b7d7:220a with SMTP id e5c5f4694b2df-1acf888b978mr829475355d.13.1722001511668;
        Fri, 26 Jul 2024 06:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722001511; cv=none;
        d=google.com; s=arc-20160816;
        b=sD/7V9LWkeNCQPB9ZXVkczNzmkSxKF9TqAl5jFlLCpNa9Hj7QPp+pxVzjbpKg8VQBr
         X4l92ZJjmJ0GBOp7CePZqREvY4hWb2lI8+g1ql1Hu1uQkxZdjAMbahZiXeWQNTpdrDrA
         AR5d0zaaxUVBm4Xrruk4S0dJm+X6UsFOSL+vJ0fgRTIQciZpoAmw3jm6sz0gTKxDcPJA
         beKeitz3AOBJxvMDDKJSCD1ll1Hs3CdOpzrkpiTkzaX8fdNthwJVTH0x2pIjg/DzGH1F
         6oy8Jl+8MdlpJBdXAZVgmCkQ8ubKMepALqLTyUK3l2W1C6odlqUnIEUiFq/MHyMDwWpt
         gDQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=E3IWYfQZY9Vtpyu9w1tUYKrkYYnY1w3NcI8rW4hxkqc=;
        fh=+JUQlqeb+WOWoY8tr4tplfLgDiP2lWYvcRFLGxWHojE=;
        b=PsyNeidbW6R/Jx5IjgPW+e0Q7riVzdq8phoMKd8/reTFa1MyNESLmUVWMRA3rUgPsn
         zFU2Nvm8t1DbHvsZ8gduhGw2B+2ggA87ibt99XB5/GgX3GhEUKycB44Q/nK3ZyGptFAv
         H33ENsg9iBMGCXHtq71FhAASHVEloT50wm3NaJyaX2w78TvjHWldBBixDxvfuqaIJKBY
         P4G/UL67rGAapRiOv6m/AVUfITW9Dbs5tZf88Zu8S1JymlXNaMCV9QXc6gXQdqt+Fydk
         1FYN4Zq38E7Dx7hW9au3zUMMgWvsAciUek6uWeqsu0V/qK4WkPT3Izlz2mHKqI1G7F9l
         n4rQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DwmO7VlZ;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3f8cc44fsi42505566d6.116.2024.07.26.06.45.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 06:45:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DwmO7VlZ;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722001511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E3IWYfQZY9Vtpyu9w1tUYKrkYYnY1w3NcI8rW4hxkqc=;
	b=DwmO7VlZSb/HCR30ofuSavtCHajiCyjdnWs0z0oLGHNSY2tlhOhOCgzslS19LCVQPBSeoA
	If1MNUZNGwlAEiD+LuWuIGWVwLFLo7Wc/9eBgSivwdbjklSQExrBE4B/Luld+NYnjQP8k5
	VnZ00IhYHzdNGI+1i26J9oel0RnCm6g=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-670-PAgA_eesNUeDe2ihR7jBMg-1; Fri,
 26 Jul 2024 09:45:05 -0400
X-MC-Unique: PAgA_eesNUeDe2ihR7jBMg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2D3B11955D4E;
	Fri, 26 Jul 2024 13:45:03 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.22.17.77])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 102E31955D42;
	Fri, 26 Jul 2024 13:44:57 +0000 (UTC)
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
Subject: [PATCH 03/13] tests/avocado/intel_iommu.py: increase timeout
Date: Fri, 26 Jul 2024 09:44:28 -0400
Message-ID: <20240726134438.14720-4-crosa@redhat.com>
In-Reply-To: <20240726134438.14720-1-crosa@redhat.com>
References: <20240726134438.14720-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: QK8qROQDKgwi

Based on many runs, the average run time for these 4 tests is around
250 seconds, with 320 seconds being the ceiling.  In any way, the
default 120 seconds timeout is inappropriate in my experience.

Let's increase the timeout so these tests get a chance to completion.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/intel_iommu.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/avocado/intel_iommu.py b/tests/avocado/intel_iommu.py
index 008f214397..9e7965c5df 100644
--- a/tests/avocado/intel_iommu.py
+++ b/tests/avocado/intel_iommu.py
@@ -25,6 +25,8 @@ class IntelIOMMU(LinuxTest):
     :avocado: tags=flaky
     """
 
+    timeout = 360
+
     IOMMU_ADDON = ',iommu_platform=on,disable-modern=off,disable-legacy=on'
     kernel_path = None
     initrd_path = None
-- 
2.45.2
