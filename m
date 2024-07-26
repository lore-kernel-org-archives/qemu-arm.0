Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp474730njb;
        Fri, 26 Jul 2024 06:44:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXCnV17O6LceQmFpUrPZeps3nfVi0YjF6LGv16KSQ0pfIwoo8Kvd3YvmXAsUhGVqrVjQJIlssVLiCPv6w4vBuSy+ZQ1LYMx
X-Google-Smtp-Source: AGHT+IEodC2YqZ/AiiwJfEltEzsYOzfOG+JOZm4+1l7bYlncnJOyWoiRGYq6dhM49J9BTYxWzv91
X-Received: by 2002:a05:620a:2807:b0:79e:ff0d:1f49 with SMTP id af79cd13be357-7a1d7e87218mr573644885a.34.1722001495240;
        Fri, 26 Jul 2024 06:44:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722001495; cv=none;
        d=google.com; s=arc-20160816;
        b=hdz5IzEge7uK0R0eVxLPFKsF+nxfTuO7Lqq0r6FqYqdRbx4PZKZE7IunKhVU0lcCUe
         Rf+jQDAnDhY/vJha6W8hPAhjotg4V+0J+StOxWr333cznqLiHsHiM14UWuKfQ/tv+iQo
         /cJfa7hTwXi1JzbbiL6/Sn/POE/fk9n4iC/peaINHY3OW4gqhERqkeWotH/6hAuJHnWb
         sB++SYZcFLdvGMq0NePmGUnGVjnH9W8HtNb/50eu6GEtFFh/R6hpBTHrDH7v6sPMnRsC
         zINPmdBUGQTpDEQegyMHDeIRthKYuG7Fl6H9vKa94OjFPT+21C6XDDqr2+S92atZgBnl
         uh2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=xjpHnfhfIk1q7ufJ0zYLvewcXRU+o6xX79PPBGuUDmE=;
        fh=+JUQlqeb+WOWoY8tr4tplfLgDiP2lWYvcRFLGxWHojE=;
        b=Gi2O1R3/piTElP2mOSCkjWekUCuAQW7Em1pT2dAvXvZXxex2YCmp+YCNr5/8xJG9bj
         fKsFCPsZvLqxdAxfio4ZaU91btacWnt0bwG0+F7cNvW990dkJXPpFq5N7UOVYslNWDZf
         VD8VWIWP9tg/r142uFGfDmw6AnsVZ00eVGTGBuCD1whbNwA/uj0KTuHz9HuBtNHWM/bJ
         jc1Pn8rENIs0kDtkPMA4TvZVXGux0HGrGVpkRWo7zdCpEb81xlf0cYpvyOZTsMm7JJy0
         7UVPuUjwI4BZZ+I5tBx/lKWP1j5BdokZytLtzD/fBQP/0mS4v696E4mIe9IYsXhpRKgu
         fweg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gc1iZZaq;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d739b689si416933585a.118.2024.07.26.06.44.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 06:44:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gc1iZZaq;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722001494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xjpHnfhfIk1q7ufJ0zYLvewcXRU+o6xX79PPBGuUDmE=;
	b=gc1iZZaqo1UUqMbCL1MbCBvOCc3Xvw7Ppmg0ap950Y3NvnZI5mKGgFODgo+UdvNfLeIjNy
	cFWHIBbaICe5yUptkOa6LFhk/Ha7CUn6UlH1tNKDSk1elOKlzBAEHgZ4ZSTXBBVHmlLllo
	ksE0+szMvfyiOrozW8YthpMJJhssLnc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-509-tYbBeg7aOjSrkvpqgfEtzw-1; Fri,
 26 Jul 2024 09:44:51 -0400
X-MC-Unique: tYbBeg7aOjSrkvpqgfEtzw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 874FB1955BF7;
	Fri, 26 Jul 2024 13:44:48 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.22.17.77])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6FC711955D42;
	Fri, 26 Jul 2024 13:44:43 +0000 (UTC)
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
Subject: [PATCH 00/13] Bump Avocado to 103.0 LTS and update tests for compatibility and new features
Date: Fri, 26 Jul 2024 09:44:25 -0400
Message-ID: <20240726134438.14720-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: /DTE62Gb4O+J

This is a *long* overdue update of the Avocado version used in QEMU.
It comes a time where the role of the runner and the libraries are
being discussed and questioned.

These exact commits have been staging on my side for over 30 days now,
and I was exceeding what I should in terms of testing before posting.
I apologize for the miscalculation.

Nevertheless, as pointed out, on the ML, these changes are needed NOW.

Some examples of runs in the CI can be seen below:

* Serial with 103.0 LTS (https://gitlab.com/cleber.gnu/qemu/-/jobs/7074346143#L220):
   RESULTS    : PASS 46 | ERROR 0 | FAIL 0 | SKIP 2 | WARN 0 | INTERRUPT 0 | CANCEL 0
   JOB TIME   : 432.63 s

* Parallel with 103.0 LTS (https://gitlab.com/cleber.gnu/qemu/-/jobs/7085879478#L222)
   RESULTS    : PASS 46 | ERROR 0 | FAIL 0 | SKIP 2 | WARN 0 | INTERRUPT 0 | CANCEL 0
   JOB TIME   : 148.99 s

Cleber Rosa (13):
  tests/avocado: mips: fallback to HTTP given certificate expiration
  tests/avocado: mips: add hint for fetchasset plugin
  tests/avocado/intel_iommu.py: increase timeout
  tests/avocado: add cdrom permission related tests
  tests/avocado: machine aarch64: standardize location and RO access
  tests/avocado: use more distinct names for assets
  tests/avocado/kvm_xen_guest.py: cope with asset RW requirements
  testa/avocado: test_arm_emcraft_sf2: handle RW requirements for asset
  tests/avocado/boot_xen.py: fetch kernel during test setUp()
  tests/avocado/tuxrun_baselines.py: use Avocado's zstd support
  tests/avocado/machine_aarch64_sbsaref.py: allow for rw usage of image
  Bump avocado to 103.0
  Avocado tests: allow for parallel execution of tests

 docs/devel/testing.rst                   | 12 +++++++
 pythondeps.toml                          |  2 +-
 tests/Makefile.include                   |  6 +++-
 tests/avocado/boot_linux_console.py      | 24 ++++++++------
 tests/avocado/boot_xen.py                | 13 ++++----
 tests/avocado/cdrom.py                   | 41 ++++++++++++++++++++++++
 tests/avocado/intel_iommu.py             |  2 ++
 tests/avocado/kvm_xen_guest.py           | 30 +++++++++++------
 tests/avocado/machine_aarch64_sbsaref.py | 11 +++++--
 tests/avocado/machine_aarch64_virt.py    | 14 ++++----
 tests/avocado/netdev-ethtool.py          |  3 +-
 tests/avocado/tuxrun_baselines.py        | 16 ++++-----
 12 files changed, 125 insertions(+), 49 deletions(-)
 create mode 100644 tests/avocado/cdrom.py

-- 
2.45.2
