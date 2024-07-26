Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp475375njb;
        Fri, 26 Jul 2024 06:46:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzfyXfuOoOrbaprIo7uvekRGe29LTmqem96DDsnM1ow5soqDKTGJ9SvWnWe1XI4G66sx4NhZFj9qlYbnd0D2wqZzbs6i0u
X-Google-Smtp-Source: AGHT+IFP/IyOe0mGphUThuNVbl6nzGDYWgdj1jIpJuFUX5qaOaX0OsYX7z26xIp+6G3WBM+LSWR0
X-Received: by 2002:ac8:594a:0:b0:44f:e9df:2a22 with SMTP id d75a77b69052e-44fe9df2bffmr92996801cf.16.1722001563666;
        Fri, 26 Jul 2024 06:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722001563; cv=none;
        d=google.com; s=arc-20160816;
        b=z2M8qmoxRMeB00YDoPCVaK9PEYtXcdwvzDEvkZuMtUzajO04GFBkdDaQMkzfPGQeVh
         Tm7GgHSJuqICydvdRyuEGj6qMHFh75pNSuTYp7upqR6PZaBelzpMXOYulLOz2SyEkdsY
         zUeuauIoQIEfYj6UlOsfBB1UAQnpcS8PzYbLAPd+Cw6hqNlqNECUAE6XPXaWbToJ/lND
         RHZQr6grJmVhMyV5iaUoeSFrgHscrTdbYhVbfnOzqmdRu1Fp5zEHuxsBGz0g3j667MIq
         5hp9OJ3MnTV/Yx+PXm2qHtfjPuHFZox/WbRFSEV/TGXrRb+pV82emp+FO/rXaeQSc0su
         WcUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EIz6GUKRiMrJ4ToqmN6PNK35L1sSA8CzTEn9Mn2ZcHQ=;
        fh=+JUQlqeb+WOWoY8tr4tplfLgDiP2lWYvcRFLGxWHojE=;
        b=lgINtEfLfUlpvtvy03iLQrZhPgCEhTLnf6AoterKpFc8K7WSRVZQOSFpcG1zpZxMBs
         ektQ5rkmPcL68xIWuhAbXHPbhQhkvaeOOOgoITDs73Ac6/GHR7EshhneW+CiIE3Ol4VF
         vP6CtLUT7Yp2CIOpSc7uoxBD+kO7XjR3ATiFF9dAxoGCIP81fmyPcJkisSwkn2EEt059
         KYrGpV7Pk36DStMJzof61rceSb5+VaD8lS+ba/Pb5a6Xpu8/asQXhnveycDfGGM6pa1S
         bTrLLE45nIYj0zzDNi+1uPtTsFaiBfU8GcH7YujB/z90T9UzDf8ZI/Sjnzr5rlJG961f
         UNHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HlHP68dZ;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe84240c1si40678611cf.633.2024.07.26.06.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 06:46:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HlHP68dZ;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722001563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EIz6GUKRiMrJ4ToqmN6PNK35L1sSA8CzTEn9Mn2ZcHQ=;
	b=HlHP68dZbfL6pybj5VGb0kahdW13tWTdVJJ9UwIK6pDpnwtasi6YHh1RwK2M1EYMMg6fxe
	zDjJ/OpnjCczP+0dJKXTozuWKht02TZEuO2l0bw8S9w7uRofovdizLLRKyJPFgviXsKfUA
	lemJaZxXCmK7z4M1nP1DXjVvN3nR/Ts=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-192-S669IZyENCGJsElLcUAWWw-1; Fri,
 26 Jul 2024 09:45:57 -0400
X-MC-Unique: S669IZyENCGJsElLcUAWWw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CE5FB1918E4D;
	Fri, 26 Jul 2024 13:45:42 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.22.17.77])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8A2331955D52;
	Fri, 26 Jul 2024 13:45:38 +0000 (UTC)
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
Subject: [PATCH 12/13] Bump avocado to 103.0
Date: Fri, 26 Jul 2024 09:44:37 -0400
Message-ID: <20240726134438.14720-13-crosa@redhat.com>
In-Reply-To: <20240726134438.14720-1-crosa@redhat.com>
References: <20240726134438.14720-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: cVOSyqdOeOAO

This bumps Avocado to latest the LTS release.

An LTS release is one that can receive bugfixes and guarantees
stability for a much longer period and has incremental minor releases
made.

Even though the 103.0 LTS release is pretty a rewrite of Avocado when
compared to 88.1, the behavior of all existing tests under
tests/avocado has been extensively tested no regression in behavior
was found.

Reference: https://avocado-framework.readthedocs.io/en/103.0/releases/lts/103_0.html
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 pythondeps.toml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.45.2
