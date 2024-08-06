Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp1302696njb;
        Tue, 6 Aug 2024 10:32:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVIXV0bCe7DGh5jC2Ku+U3xtawZ1hv+XhtuuKPIiqg/Gp6ZvOqig3xZSaVx35HoQdDQiHQsLP/dx4gPnrMg2ELXa6+G61q2
X-Google-Smtp-Source: AGHT+IEcOHoPe6s1FAPUVogzyd+LCcJG/9VWVaWVUgMBf70aaAtfu4/v68Jo3u1bQvkR7E5IOEEV
X-Received: by 2002:a05:622a:3ce:b0:447:f0d5:ee57 with SMTP id d75a77b69052e-45189253e80mr211959351cf.4.1722965522470;
        Tue, 06 Aug 2024 10:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722965522; cv=none;
        d=google.com; s=arc-20160816;
        b=tNktgVbTqlT6rBvStcY4Tw049iZw3fxC1kV2UCVOwHAxvtYj2jS6s/vBRyaWaPrsT2
         ArAkCOYUUtcXOtf+NQg0Lvb26uta2wJZR+O4e9z4LCifhPwSihpXnLVR33Gj7BQA9VAW
         55CF19RTZ/ahHWb9AkumFSrfWZIXl4JlJnNGyhmfQajRu6dnz3PT5RvupsIRW1GjXMLq
         B99/ySakBsBOT6HkJ3xx9++7mZdT9wmcqKdNgEU4Ml47IuDrJebSEo9Ebxbcd2wgUyrK
         ESeUf7v21FItR4SzT7R65PtxqATs67GEHTwUEEt5iPkdHgdw02+Rr+V0I3UdIUsmh1ri
         AlAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3d6XMb3rg8qagy9L556QHcs1su9m4o4U8evvKQPrw1o=;
        fh=pOdCxWa9rQJU0vaikvZDwOcgRIEwREE3jBY9GdQlMoI=;
        b=GeeETCYy/Ev/tW7cXlv7Ly56ylg3rzEg3SanNioeW5TtwzpRyezz1BpMHcAq3HDRiZ
         4sTjH6QlAZ8I4TcqngbiOjwFhb1gpD9R0HGWNUqTcytJ+x2Qsi3pZnH14z0lLLXkOLzT
         O72iASzSUP8mv03Sil1O0ESzE+ZTYEJkbbOJAdb4FP9kycE9TFU2dobS/0Q5gOTywu6d
         OHgL1v/BPAxvhiDAnQRky6iPfhSRO6jZME0FDk9F3lQNWIWpAoHQGpfhe1BgFS43/yhQ
         vWnuLw6PdOFWIbzZMEQfCuRwP8IuYTCNJzD6vF0TrHFc5aI26zob0kudAHoQXzjmVlM+
         7ekQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ko3DRNpS;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4518a6bb819si123480611cf.129.2024.08.06.10.32.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 10:32:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ko3DRNpS;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722965522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3d6XMb3rg8qagy9L556QHcs1su9m4o4U8evvKQPrw1o=;
	b=Ko3DRNpSEP1I0RJ168fJAll3QtTxjBvo2dHgGSw5+Yt/L/jaGQDuWuHx8ohTCW9VpcNkvc
	+AurnBr3xU4riL19r3pamZTPcROSii5fAJ2t0Do24rCT8HMbfs2ooufHU0nmmlaFR9zBKH
	FQIuUzcD7RwwvSrr2gvGB97OncZebH4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-78-HCMI_sXsMvKtkbo1ab6cCw-1; Tue,
 06 Aug 2024 13:31:58 -0400
X-MC-Unique: HCMI_sXsMvKtkbo1ab6cCw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 71A2E195422B;
	Tue,  6 Aug 2024 17:31:49 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.39.192.15])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A23AC19560AE;
	Tue,  6 Aug 2024 17:31:38 +0000 (UTC)
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
Subject: [PATCH v2 1/9] Bump avocado to 103.0
Date: Tue,  6 Aug 2024 13:31:11 -0400
Message-ID: <20240806173119.582857-2-crosa@redhat.com>
In-Reply-To: <20240806173119.582857-1-crosa@redhat.com>
References: <20240806173119.582857-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 6C7HHXFSahJ2

This bumps Avocado to latest the LTS release.

An LTS release is one that can receive bugfixes and guarantees
stability for a much longer period and has incremental minor releases
made.

Even though the 103.0 LTS release is pretty a rewrite of Avocado when
compared to 88.1, the behavior of all existing tests under
tests/avocado has been extensively tested no regression in behavior
was found.

To keep behavior of jobs as close as possible with previous version,
this version bump keeps the execution serial (maximum of one task at a
time being run).

Reference: https://avocado-framework.readthedocs.io/en/103.0/releases/lts/103_0.html
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 pythondeps.toml        | 2 +-
 tests/Makefile.include | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/pythondeps.toml b/pythondeps.toml
index f6e590fdd8..175cf99241 100644
--- a/pythondeps.toml
+++ b/pythondeps.toml
@@ -30,5 +30,5 @@ sphinx_rtd_theme = { accepted = ">=0.5", installed = "1.1.1" }
 # Note that qemu.git/python/ is always implicitly installed.
 # Prefer an LTS version when updating the accepted versions of
 # avocado-framework, for example right now the limit is 92.x.
-avocado-framework = { accepted = "(>=88.1, <93.0)", installed = "88.1", canary = "avocado" }
+avocado-framework = { accepted = "(>=103.0, <104.0)", installed = "103.0", canary = "avocado" }
 pycdlib = { accepted = ">=1.11.0" }
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 6618bfed70..537804d101 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -141,7 +141,7 @@ check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
             --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
             $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
 			--filter-by-tags-include-empty-key) \
-            $(AVOCADO_CMDLINE_TAGS) \
+            $(AVOCADO_CMDLINE_TAGS) --max-parallel-tasks=1 \
             $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
             "AVOCADO", "tests/avocado")
 
-- 
2.45.2
