Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2497147lfb;
        Sun, 6 Dec 2020 10:55:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwn/AlKSA/0SXwPTlWSWh6rYRUvh6mxcPw4UW5X5Jvmu3w7dVrWbaOb8XCtr153DQU3x62f
X-Received: by 2002:a25:ce50:: with SMTP id x77mr19758266ybe.38.1607280932294;
        Sun, 06 Dec 2020 10:55:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607280932; cv=none;
        d=google.com; s=arc-20160816;
        b=BviZMdIV7fC/KUevtszCT+gnXoiivDz4z7Uz7Uz5ohEoysQUzqAWG/29+Zq0o4oa86
         2LT5E8aCB+QCijOWNp5/9yCHTRiBS368SdhnQ0xJx2MhgTsfLnYIi9UodLO/AdPHAEeG
         +iK1u/cDWodo9Uj1iBEfBYDPWPUbPiYeKMHMcwilsv5jQHSSV2eAKOpsNLaANbxdfvi2
         gIWl1Lq5uTky6r7yghsNC96O8B+qoN1+1JovlFGui6Sp/SiDSjpZ2ohKhk/BudZCGPrn
         CjI/+kwDbNi3nsy3iWgOaeR7uzQVNzvH1jUgLZIjzSddO5HfMKNvo9XCXOB0fnuw+tCA
         wmRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zj+VAsR2ZoGWNnB8pF1RFhJWmR0T2bfs3Brc/xrE4Jk=;
        b=g7TV5JCF048uDmMix2XZCArgRCXn4IcoqHZNWam+gsUchqU09lCCAzUdwdmszPJoxI
         DqPKZUv/vGCChQXMVT5MshuPbop94u1ov1CC0+jpmQpoTaiDlMeGJzVTFRCWN5S3RzhO
         UJy32Cbuutqlhdzt0egTgg7fJnqtD7LzozmCHiWv74HCRcVs9IfVTP0xwnW0LHM4CfFR
         1/uLwOuJEqTrVmq9UMVVJwWC1m6sm8lDoH7o4B92Arc1KOnFn3q4r6DlGId/fgI6BwyW
         j/EPZX1G/2UHNWqWlWSk2D6cP2uGWmD2LFRdcW8IiIfuhEieU5N08ltF6DGTEkNByXV1
         QGUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eOjZ2gvY;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id w75si10223214ybg.315.2020.12.06.10.55.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Dec 2020 10:55:32 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eOjZ2gvY;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607280931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zj+VAsR2ZoGWNnB8pF1RFhJWmR0T2bfs3Brc/xrE4Jk=;
	b=eOjZ2gvY9aHksYNUJDp52FT47A5P6K4RubxOFKoEd9HpdjDLpHaWtEioazmo8xDuzBtTI+
	Yr1kKKbRgBovNZ4Qfi8Zd0MoI94kziJAyqLrHfDD1jrNKm9zs8d/k/kUpOx7zwlMr+MK12
	Je077ACTFDNQmt35UwBDGJaLxibUXQA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-zvJi9KwUPdmSNHJ9GkBXsQ-1; Sun, 06 Dec 2020 13:55:30 -0500
X-MC-Unique: zvJi9KwUPdmSNHJ9GkBXsQ-1
Received: by mail-wm1-f69.google.com with SMTP id v5so4349322wmj.0
        for <alex.bennee@linaro.org>; Sun, 06 Dec 2020 10:55:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zj+VAsR2ZoGWNnB8pF1RFhJWmR0T2bfs3Brc/xrE4Jk=;
        b=axoAIX/y3A1ne0CANQ0JLhstSociy07Pga/xmjjC1Q5hEGoAORpsumdFwbX7Wj2EQx
         CkclKZ3RI6kzAwj0628spMDqGIRj9LPU3O6WwS/CEpwMUphV/UpGFBNls712mdH7Uf/1
         9CG7r7cdenKtl6ayBIVFbw+VGyCegUQBxTsQJSNffTbcciBvX4nV5ruRRGKqZHnsBA89
         5ynXZTpmHuTUirJRlPba6bCQM0iXURvCJs8zKKjGycVt1nqCe+8dmO/Gc0gYmuyLUtG5
         5W6p09iKykBYn0CwvYMBrd1bK0QSlW2H9G2eLCb1PfZ10EOvmsBAu5U/w7KzVRMdzJ4U
         IjYg==
X-Gm-Message-State: AOAM532X7xF3stm6vsunTH/XvuCkKhCCttUqIiJK3zMn/U2vQstR9lPY
	rQzRFKZxMjBUKe4wBZC+D8YoTIbAtmG17J6ZziY6Dpy+PCXbOtZ9lxGC1FNNTq2z5Y4RVaLncSj
	SWLYS9FhnDaQE/obH
X-Received: by 2002:a1c:a501:: with SMTP id o1mr9847444wme.44.1607280928821;
        Sun, 06 Dec 2020 10:55:28 -0800 (PST)
X-Received: by 2002:a1c:a501:: with SMTP id o1mr9847417wme.44.1607280928628;
        Sun, 06 Dec 2020 10:55:28 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net. [88.21.206.101])
        by smtp.gmail.com with ESMTPSA id i5sm12530329wrw.45.2020.12.06.10.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 10:55:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Huacai Chen <chenhc@lemote.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Claudio Fontana <cfontana@suse.de>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-s390x@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-arm@nongnu.org
Subject: [PATCH 3/8] gitlab-ci: Add KVM X86 cross-build jobs
Date: Sun,  6 Dec 2020 19:55:03 +0100
Message-Id: <20201206185508.3545711-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206185508.3545711-1-philmd@redhat.com>
References: <20201206185508.3545711-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DEUMJKRNLM6I

Cross-build x86 target with only KVM accelerator enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds-kvm-x86.yml | 6 ++++++
 .gitlab-ci.yml                       | 1 +
 MAINTAINERS                          | 1 +
 3 files changed, 8 insertions(+)
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-x86.yml

diff --git a/.gitlab-ci.d/crossbuilds-kvm-x86.yml b/.gitlab-ci.d/crossbuilds-kvm-x86.yml
new file mode 100644
index 00000000000..9719a19d143
--- /dev/null
+++ b/.gitlab-ci.d/crossbuilds-kvm-x86.yml
@@ -0,0 +1,6 @@
+cross-amd64-kvm:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-amd64-cross
+    TARGETS: i386-softmmu,x86_64-softmmu
+    ACCEL_CONFIGURE_OPTS: --disable-tcg
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d0173e82b16..cdfa1f82a3d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -12,6 +12,7 @@ include:
   - local: '/.gitlab-ci.d/opensbi.yml'
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
+  - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
 
 .native_build_job_template: &native_build_job_definition
   stage: build
diff --git a/MAINTAINERS b/MAINTAINERS
index 68bc160f41b..8d7e2fdb7e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -427,6 +427,7 @@ L: kvm@vger.kernel.org
 S: Supported
 F: target/i386/kvm.c
 F: scripts/kvm/vmxcap
+F: .gitlab-ci.d/crossbuilds-kvm-x86.yml
 
 Guest CPU Cores (other accelerators)
 ------------------------------------
-- 
2.26.2
