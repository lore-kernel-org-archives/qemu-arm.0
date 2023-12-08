Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2536948ejb;
        Fri, 8 Dec 2023 11:09:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyZ5J6+KGr5oiVh/L/5w2vlSpSqHDlysQHKqDogxx0v+Tj9qtE+cXdGq3A/QNCQhgxcN9b
X-Received: by 2002:a05:6358:2919:b0:170:17eb:2fab with SMTP id y25-20020a056358291900b0017017eb2fabmr384043rwb.36.1702062576458;
        Fri, 08 Dec 2023 11:09:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702062576; cv=none;
        d=google.com; s=arc-20160816;
        b=vkCyzmpiCAOJCw+Mig6gPSkjVQrVtbiRktaAU1NEYtbgopIBSCLuDeO+O+s2LJ/ewz
         z9OEpnhuszmdprjhO70El8XsZv6vMBpmKJSWd41Do8ojuYmwQHdH4Hmfj+sgYi+mkdHA
         HmCsLEHMx0YhAlBCq/6D6i3bw2AtUXVd37F3Q57TfKivPEDaV/FsPiJn/7TPo4xSbCos
         AQNpAIdw/POrUg/XxVXpsJJdDJ2Y/CJm2ogQbp3vw8Imc1iaOciGkzht7ikKRgmYBtfS
         +MUi5X3XoXknFOgPIBWktmfVqom6MgqIWxT2eBV7JVBbeER55Wsj/8kmi8eUTOLFQpnW
         PQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RtZ362NiJGxvbeWbael3pXl8UQtexWlIoEdoihDgXIM=;
        fh=1DyVogfZItUndw0AQLC0GXn3EIhIcJypmHHdywm+J34=;
        b=su9+IwxrBz4ZO8rz3+2d5hnP9BF/fYNjKf6y/DSfLnKHTyIBuA73hSotq2RvDB7wfP
         q5fl0pOVSGcWGj3lBopOi8ZgQK9cnVwFB4qDtB0Mo2ZBloWv6DGp4HS6pIGmgfUdr83q
         2hFqBK1/x5jzFNTJUS8GkZmkFrIkrYfmJNvfTcQnfVkIqrcwfGcZKHz6G2ytggNjX5Av
         WF7LxVz2OPZVuE6aNgVjOLRO450wkvy9WrWtTJJpctsjD/ln7TSzwdxxHz8bSab+IGIg
         HtjIXZ+G254TFylfT+o+M/LX1G4goNYN9iFkgbo9N1FIl1PxBx5dQkX/P94QNO/NNqfV
         mtMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zb41lZ+H;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id jy7-20020a0562142b4700b0067aa6a9fb43si2692510qvb.421.2023.12.08.11.09.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 11:09:36 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zb41lZ+H;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702062576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RtZ362NiJGxvbeWbael3pXl8UQtexWlIoEdoihDgXIM=;
	b=Zb41lZ+Hq+txoMwSlczF7mB8NhzHM0jjahZFJmGhwwla2QDXPIOVFVueGCqjanbF6kAlbN
	s9m63TUAxvIP6QohIdimLxvUza6J6TYtjww3mqGeFfG5VbAvEbRh3G4lnoSBr5UsPfDSyH
	Icfi4xx3ew7maDIOnnI45OYjF5A0xBI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-625-FVcO3bX4Nqmuzkc0Zr7RvQ-1; Fri,
 08 Dec 2023 14:09:32 -0500
X-MC-Unique: FVcO3bX4Nqmuzkc0Zr7RvQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32A5A1C05195;
	Fri,  8 Dec 2023 19:09:31 +0000 (UTC)
Received: from p1.localdomain.com (ovpn-114-104.gru2.redhat.com [10.97.114.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DA75112131D;
	Fri,  8 Dec 2023 19:09:28 +0000 (UTC)
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
Subject: [PATCH 03/10] tests/avocado/intel_iommu.py: increase timeout
Date: Fri,  8 Dec 2023 14:09:04 -0500
Message-ID: <20231208190911.102879-4-crosa@redhat.com>
In-Reply-To: <20231208190911.102879-1-crosa@redhat.com>
References: <20231208190911.102879-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-TUID: jrX+p/73YMsq

Based on many runs, the average run time for these 4 tests is around
250 seconds, with 320 seconds being the ceiling.  In any way, the
default 120 seconds timeout is inappropriate in my experience.

Let's increase the timeout so these tests get a chance to completion.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/intel_iommu.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/avocado/intel_iommu.py b/tests/avocado/intel_iommu.py
index f04ee1cf9d..24bfad0756 100644
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
2.43.0
