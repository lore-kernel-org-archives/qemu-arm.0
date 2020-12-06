Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2497196lfb;
        Sun, 6 Dec 2020 10:55:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOb95apva60YqQJ05v0mVcWcfhVwPBjDLv1Mlu7ogoDGQkPQsK1L9qAMJlZX6Jz4MtfO67
X-Received: by 2002:a25:397:: with SMTP id 145mr17279460ybd.6.1607280937543;
        Sun, 06 Dec 2020 10:55:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607280937; cv=none;
        d=google.com; s=arc-20160816;
        b=eH6web6BqMajjtXky26rDywLdD53F4zcYZ8k5YoXbnLM++hBcGoBgNEHz+GJ8t/svV
         ArRYW3tKYk+22jE4minZWwdserwLIqXeLG6tky9o8z1clz/SNhAWF0GZ+cOYmBnNl4G7
         uzv3tmlIdV+w8e4+Tn8uYEok/++O3ZbpuJSaqQcxkumFjT45Cm97CEx4W/KzY+heVue5
         zBy1fCtVquVojzE5sYm7f+Fbs+uKA5ShLDo9LssnlIZUPyqt4fYhwgL0uzkPj+Hl7Mei
         i4fVQ0wGg9QWOO99TaVW2YVEZOhZaDcjFyApovhJmZMXge3HuUHDdeJCoVwvec6SOkTN
         U3aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Vxt3MEZXS260piBfvrRF2LPibTg2rLk2j2FgrTceEtE=;
        b=uoleHxAjTT4GdR4ZX0Gshjk0LZYp7CT/NCPBQNe78Nxw6MyQDo7sYTxgiZ73iUb9un
         7xTyOFvFDctMkX9bRIKKrJWMQmWmPMG1Aj+c0utwibaGVzTZZ3KWcVwBZbjgE9EbC0rk
         al5eBrVEGMhx45vkwsy1TLJeOmVuGPw05dYOll/R9aX/rCiQfBxo0zPCTr7e8t3nEr0H
         yr/XNafAo/D3HVton+9a+K1I1+IPL1747Z5A4N3gdfRur1uEEl1d+p7NKejWk5M0XTxI
         IWo1knsw99JBFzMjWdgJbKiqBNwBsb10Oab1RTB3rSzJbgZHnYhW9rXDNV0Tbh2md5Vw
         th7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T1jvEwq7;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id d31si8660741ybi.260.2020.12.06.10.55.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Dec 2020 10:55:37 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T1jvEwq7;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607280937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vxt3MEZXS260piBfvrRF2LPibTg2rLk2j2FgrTceEtE=;
	b=T1jvEwq7Em4yW6lMzfI7oJLiCIkSa8+/UyCu9k+LsvbEN9LhiFDZzIWacmQfXrWwIrR+yx
	j6YbvI6AwHBhUZ0jhKYwD5FPkUQoWlDhSTI0LpO2OnmFUolxyRKTDPm0m93DzbAKiUVy0P
	TVqRflLAPBnWrRF0McAk9zEiMGy3FSo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-WmWkJ2UrMge5814nouofDw-1; Sun, 06 Dec 2020 13:55:35 -0500
X-MC-Unique: WmWkJ2UrMge5814nouofDw-1
Received: by mail-wm1-f70.google.com with SMTP id r1so4334057wmn.8
        for <alex.bennee@linaro.org>; Sun, 06 Dec 2020 10:55:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vxt3MEZXS260piBfvrRF2LPibTg2rLk2j2FgrTceEtE=;
        b=s6IPFc7SvVfTy1YbzGd1wtEE0U1WNEjvvz8iYoAmnSC641tQIfe/4eEylkeXorDkuc
         jiHf/mW22PH75/+IKJ/aXnRBdAVh9+JltK7o2Aw8ynyiAqlRF/RF0RUCxDAvKjk+lofZ
         PrgnIvQcsVbCcNTMauUn/hIPvtR6rdoXp7kqAANluKVmzj7+O1cYPJfws85flwCyGUMQ
         eZT1gIt9fvNXD6C6RbAsHdYzQozkK0yOPyQblNm4FSIxcG21dQCzXv8vdiF5csXW3VJX
         sAxXNVxdNHB39eF1p7P9Cqkct0LdSCZg0wk0jDSCYlJdNAD5aYNPo78GpwFWWLXSuwqj
         nmGA==
X-Gm-Message-State: AOAM532fWgeVd12BB4PgPWDiGCjjnRM7vngW/GaYcPCPHBD1PdpDH4Hc
	JZjG6Ab24KrVJvmz+6G4Qg5+h4SMyeYLPz331xZV0+ZwM/8OQAEaW+3o6FTrlWVcQzxMycGsEGP
	oNqeOnrcuO8L50rWe
X-Received: by 2002:a1c:48d:: with SMTP id 135mr14975802wme.147.1607280934466;
        Sun, 06 Dec 2020 10:55:34 -0800 (PST)
X-Received: by 2002:a1c:48d:: with SMTP id 135mr14975772wme.147.1607280934329;
        Sun, 06 Dec 2020 10:55:34 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net. [88.21.206.101])
        by smtp.gmail.com with ESMTPSA id l8sm12023533wmf.35.2020.12.06.10.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 10:55:33 -0800 (PST)
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
Subject: [PATCH 4/8] gitlab-ci: Add KVM ARM cross-build jobs
Date: Sun,  6 Dec 2020 19:55:04 +0100
Message-Id: <20201206185508.3545711-5-philmd@redhat.com>
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
X-TUID: /YPP1ZZnvPT+

Cross-build ARM aarch64 target with KVM and TCG accelerators enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
later this job will build KVM-only.
---
 .gitlab-ci.d/crossbuilds-kvm-arm.yml | 5 +++++
 .gitlab-ci.yml                       | 1 +
 MAINTAINERS                          | 1 +
 3 files changed, 7 insertions(+)
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-arm.yml

diff --git a/.gitlab-ci.d/crossbuilds-kvm-arm.yml b/.gitlab-ci.d/crossbuilds-kvm-arm.yml
new file mode 100644
index 00000000000..c74c6fdc9fb
--- /dev/null
+++ b/.gitlab-ci.d/crossbuilds-kvm-arm.yml
@@ -0,0 +1,5 @@
+cross-arm64-kvm:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-arm64-cross
+    TARGETS: aarch64-softmmu
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index cdfa1f82a3d..573afceb3c7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -13,6 +13,7 @@ include:
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
+  - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
 
 .native_build_job_template: &native_build_job_definition
   stage: build
diff --git a/MAINTAINERS b/MAINTAINERS
index 8d7e2fdb7e2..40271eba592 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -386,6 +386,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: target/arm/kvm.c
+F: .gitlab-ci.d/crossbuilds-kvm-arm.yml
 
 MIPS KVM CPUs
 M: Huacai Chen <chenhc@lemote.com>
-- 
2.26.2
