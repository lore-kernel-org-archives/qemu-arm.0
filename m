Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp1303140njb;
        Tue, 6 Aug 2024 10:33:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUcXg/w3JYq0trMpdT1zP571Fh0bvuFS90zpASOjfXszfwYSM5ORUAIMXFK6e0O8/6+eqWlu1fQyDS3Tf3dGpz3mQ5LKaV2
X-Google-Smtp-Source: AGHT+IELCQhjsGN0amLFQUV959uSzkWVNkfUWNdETBY5vDCvo4L1J/EFKdLcvLtBvPyIX5Ywx/e/
X-Received: by 2002:a05:6808:1904:b0:3d6:2b42:82ff with SMTP id 5614622812f47-3db558327f3mr21935268b6e.37.1722965608254;
        Tue, 06 Aug 2024 10:33:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722965608; cv=none;
        d=google.com; s=arc-20160816;
        b=iHi0clP1262FCnIXzaF7h5lbVj7J0LKejUvFXrxmdSfjszjWw8YLKuk1A3Q7YMCAG5
         TFNYb4q1/WMKUXpStyg/8B0rBjrGKgS0snbiuk4BDNCSJa2qd5zpKi7zd3VFIGX63FvY
         QxtKL6t2eomLJA2deyZNUX+Q/WWtodrIYI0FVUa7ivgFAOpls/8D1nqv+hepNAOuSoYJ
         q6Hb58anLUMGQk4hNxpFjQ64rZj5bQZOvBW9MngEbW6GFDELcg8yF0oHFH5aoCkryJkh
         VSTj3MtsnR5aJenCqc7zaLKAU8Z2/8MB6Px6Ay7PpjZo7V+MJz5vf4dIlIY2hrxDxyLQ
         jSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nf0S6+2UWAoiK8QJhCNo+DMvi4LJgeUAgWrNmgWlrjc=;
        fh=pOdCxWa9rQJU0vaikvZDwOcgRIEwREE3jBY9GdQlMoI=;
        b=feY/QBUkxg23cwzVqaX9KsgLcpzi4Fmnb6nXfmJwAfUzkJg3xZxagywbCotp+Q/Xc2
         MHIonnLw/J8yiNUyNn6+zxy//rCuXJSWtc1qKwsfLm8cOhY9aU4yyETYM6/hyO+1Z5Ak
         LKYOC04h5V8ul0nHPvkWHxnT3qpbMGmsRAsKQAK95vQTZmfWLLfGQZ7A6ZFer7hBp/cH
         QXQTr8gS+3I5A6ClcL/RG12McMjSSU6hEDWOCPMpl+/ah4EjPIUjCBet3H7v95Re+pYQ
         6vFe2pIZHAl8TRGwQX7oUSuAxgzZUqX70QggQQLPT45DK9n2UI51KZ/tIJJG7Hv+D1pO
         Vfeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TdHNX1PE;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a34f78b6aesi1274948085a.645.2024.08.06.10.33.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 10:33:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TdHNX1PE;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722965607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nf0S6+2UWAoiK8QJhCNo+DMvi4LJgeUAgWrNmgWlrjc=;
	b=TdHNX1PEAVq0gxeOzr7g/JzB+uhrkp0i7LnUFNcy8nkMxut0MQCBhl4CeXs+Eb38UGFLrW
	1y/Rl5CK6wAv1htku+WRmTVoX3ewVYIbfY1aob5UTEznyHj1Wqjfshfu8JVfV85lHoPsr1
	K0c1fZDOAQ65ueQTAqQpE0dLdHayM1g=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-678-z6V6pmDHM0m4MjOMBls8sg-1; Tue,
 06 Aug 2024 13:33:22 -0400
X-MC-Unique: z6V6pmDHM0m4MjOMBls8sg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A773F1955D42;
	Tue,  6 Aug 2024 17:33:15 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.39.192.15])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 809E819560AE;
	Tue,  6 Aug 2024 17:33:06 +0000 (UTC)
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
Subject: [PATCH v2 9/9] Avocado tests: allow for parallel execution of tests
Date: Tue,  6 Aug 2024 13:31:19 -0400
Message-ID: <20240806173119.582857-10-crosa@redhat.com>
In-Reply-To: <20240806173119.582857-1-crosa@redhat.com>
References: <20240806173119.582857-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: dkXWuxoo0aXW

The updated Avocado version allows for the execution of tests in
parallel.

While on a CI environment it may not be a good idea to increase the
parallelization level in a single runner, developers may leverage that
on specific CI runners or on their development environments.

This also multiplies the timeout for each test accordingly.  The
reason is that more concurrency can lead to less resources, and less
resources can lead to some specific tests taking longer to complete
and then time out.  The timeout factor being used here is very
conservative (being equal to the amount of parallel tasks).  The worst
this possibly oversized timeout value can do is making users wait a
bit longer for the job to finish if a test hangs.

Overall, users can expect a much quicker turnaround on most systems
with a value such as 8 on a 12 core machine.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 docs/devel/testing.rst | 12 ++++++++++++
 tests/Makefile.include |  6 +++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index af73d3d64f..97ebc8211f 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -998,6 +998,18 @@ of Avocado or ``make check-avocado``, and can also be queried using:
 
   pyvenv/bin/avocado list tests/avocado
 
+To run tests in parallel, the ``AVOCADO_PARALLEL`` environment
+variable can be defined with a value different than ``1`` (its default
+value).  Example:
+
+ .. code::
+
+  make check-avocado AVOCADO_PARALLEL=4
+
+Please exercise care when using parallel execution with the QEMU
+Avocado tests as a higher system load can cause time sensitive tests
+to timeout and be interrupted.
+
 Manual Installation
 ~~~~~~~~~~~~~~~~~~~
 
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 537804d101..545b5155f9 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -94,6 +94,9 @@ TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
 ifndef AVOCADO_TESTS
 	AVOCADO_TESTS=tests/avocado
 endif
+ifndef AVOCADO_PARALLEL
+	AVOCADO_PARALLEL=1
+endif
 # Controls the output generated by Avocado when running tests.
 # Any number of command separated loggers are accepted.  For more
 # information please refer to "avocado --help".
@@ -141,7 +144,8 @@ check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
             --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
             $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
 			--filter-by-tags-include-empty-key) \
-            $(AVOCADO_CMDLINE_TAGS) --max-parallel-tasks=1 \
+            $(AVOCADO_CMDLINE_TAGS) --max-parallel-tasks=$(AVOCADO_PARALLEL) \
+			-p timeout_factor=$(AVOCADO_PARALLEL) \
             $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
             "AVOCADO", "tests/avocado")
 
-- 
2.45.2
