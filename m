Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2126952njc;
        Mon, 14 Apr 2025 09:42:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXRMjmTIo/xL3JaAioohCn51Zw7K9ict39Qf4G4m3b2QUDL/CrTudLKFzfReC8P+S9x8Ot0J2qOAxBhJg==@linaro.org
X-Google-Smtp-Source: AGHT+IH1ycARznxfWpaU1qRd40RAf0GmM/u4JQ9xrN8g2UJGKmwqz2mdaDjPV3Ve6fWmddPE1FZJ
X-Received: by 2002:a05:620a:2585:b0:7c5:3df0:48cf with SMTP id af79cd13be357-7c7af0c00e6mr1929010885a.3.1744648922579;
        Mon, 14 Apr 2025 09:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744648922; cv=none;
        d=google.com; s=arc-20240605;
        b=SWMfmZDFJJApkAO47Ngr5J1n8xPIHUD9nNna/f6SRUdGR3yeonde+mIvlftcUkex05
         xlAH93acjctWbQxDU26ZTXcAlTZO0csjvSdglQJCgNU1sZJvrLXynBnMi4lVcjBlnpNm
         3uMXCrFCDqNFKJc4PusLjRAn0GLoudeWe2fxoFCD4zCRnD4ns7s1nrygvuSGuIFTOEtb
         RUPEXjFRaJp0chJPreFNz8HXpeatn/H92Nt0veF1NAe8MPvVR6LgrT2tb5L3SZS7TROm
         ZfyCI+gaWsl6N6fyaaMUwH2xMqCiYtihxuj/Y/vjyi2oz7A2pNolxRRutCx30biiKYHO
         kefw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=B390/sGiKUxxsqMQTUSnAN+dnFWQp38rkY2hDGVFNa8=;
        fh=6xsxbRFvSPtT8TG3B9HOEDad133GF2zMAz688Nd5+nE=;
        b=EkbtGCLG8gtpzPtj+H5MqA0KzbsoRtn4CRkeK2IGDOrzQOSSCKsBoeUGg2+q7GvQX3
         MCuP/ITfoEBFO09sHo0EclOoeRJsx3Vn3kSkauKEEETYKmFJEPqM7Bicx9foNnZyWrFX
         ZxGAoGJvHRbGWmkgM8cVQFVicb8Ro1H/9F+hUBIT0KpxeCu529zsZTlNMy4s2nufbdj6
         ib8i++L7d9hfwN9ndBbOlJjLRC0q6egNuwve6TQXIEHVL8pk3HPbrMmmA8GrNmumImAK
         8z+hGtF9OlGOQP9mUNUjgJEQ2C/8pnNw6CWl7UtzSRgLRrEU9zZknZ9GVvqZDd8AIg3o
         uvJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LfXWzWFh;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c7a894c80bsi840353885a.9.2025.04.14.09.42.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 09:42:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LfXWzWFh;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744648922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B390/sGiKUxxsqMQTUSnAN+dnFWQp38rkY2hDGVFNa8=;
	b=LfXWzWFh3yNpHfyFspof/NajuoynUhUkpZDN1RVfAoTZg/dca7X5t/Ps0bVGaJJ9Zn9uq2
	tvbubOhm9RqpezAb5Xwg0b9MccM1CbBs+Ml++La/4/rLyV/u79dR6aNqdvavYAGpzf3AON
	kNMuo29LHtvgT3DuzqNkib9e3k3UJ2I=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-JlfXRx6QO9WJYC8MlAVe0g-1; Mon,
 14 Apr 2025 12:41:59 -0400
X-MC-Unique: JlfXRx6QO9WJYC8MlAVe0g-1
X-Mimecast-MFC-AGG-ID: JlfXRx6QO9WJYC8MlAVe0g_1744648917
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 34C011954B33;
	Mon, 14 Apr 2025 16:41:57 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.14])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6910D180AF7C;
	Mon, 14 Apr 2025 16:41:41 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com,
	berrange@redhat.com,
	abologna@redhat.com,
	jdenemar@redhat.com
Cc: agraf@csgraf.de,
	shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 10/10] arm/cpu-features: document ID reg properties
Date: Mon, 14 Apr 2025 18:38:49 +0200
Message-ID: <20250414163849.321857-11-cohuck@redhat.com>
In-Reply-To: <20250414163849.321857-1-cohuck@redhat.com>
References: <20250414163849.321857-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: +IWB/922rPMp

Add some documentation for how individual ID registers can be
configured with the host cpu model.

[CH: adapt to removal of the 'custom' model, added some more
 explanations about using the ID register props]
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 docs/system/arm/cpu-features.rst | 104 ++++++++++++++++++++++++++++---
 1 file changed, 96 insertions(+), 8 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 37d5dfd15b34..22faefd76edd 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -2,7 +2,10 @@ Arm CPU Features
 ================
 
 CPU features are optional features that a CPU of supporting type may
-choose to implement or not.  In QEMU, optional CPU features have
+choose to implement or not.  QEMU provides two different mechanisms
+to configure those features:
+
+1. For most CPU models, optional CPU features may have
 corresponding boolean CPU proprieties that, when enabled, indicate
 that the feature is implemented, and, conversely, when disabled,
 indicate that it is not implemented. An example of an Arm CPU feature
@@ -29,6 +32,16 @@ supports the feature.  While ``aarch64`` currently only works with KVM,
 it could work with TCG.  CPU features that are specific to KVM are
 prefixed with "kvm-" and are described in "KVM VCPU Features".
 
+2. Additionally, the ``host`` CPU model on KVM allows to configure optional
+CPU features via the corresponding ID registers. The host kernel allows
+to write a subset of ID register fields. The host model exposes
+properties for each writable ID register field. Those options are named
+SYSREG_<IDREG>_<FIELD>. IDREG and FIELD names are those used in the
+ARM ARM Reference Manual. They can also be found in the Linux
+arch/arm64/tool/sysreg file which is used to automatically generate the
+description for those registers and fields. This currently only has been
+implemented for KVM.
+
 CPU Feature Probing
 ===================
 
@@ -124,13 +137,20 @@ A note about CPU models and KVM
 
 Named CPU models generally do not work with KVM.  There are a few cases
 that do work, e.g. using the named CPU model ``cortex-a57`` with KVM on a
-seattle host, but mostly if KVM is enabled the ``host`` CPU type must be
-used.  This means the guest is provided all the same CPU features as the
-host CPU type has.  And, for this reason, the ``host`` CPU type should
-enable all CPU features that the host has by default.  Indeed it's even
-a bit strange to allow disabling CPU features that the host has when using
-the ``host`` CPU type, but in the absence of CPU models it's the best we can
-do if we want to launch guests without all the host's CPU features enabled.
+seattle host, but mostly if KVM is enabled, the ``host`` CPU model must be
+used.
+
+Using the ``host`` type means the guest is provided all the same CPU
+features as the host CPU type has.  And, for this reason, the ``host``
+CPU type should enable all CPU features that the host has by default.
+
+In case some features need to be hidden to the guest, and the host kernel
+supports it, the ``host`` model can be instructed to disable individual
+ID register values. This is especially useful for migration purposes.
+However, this interface will not allow configuring an arbitrary set of
+features; the ID registers must describe a subset of the host's features,
+and all differences to the host's configuration must actually be supported
+by the kernel to be deconfigured.
 
 Enabling KVM also affects the ``query-cpu-model-expansion`` QMP command.  The
 affect is not only limited to specific features, as pointed out in example
@@ -167,6 +187,13 @@ disabling many SVE vector lengths would be quite verbose, the ``sve<N>`` CPU
 properties have special semantics (see "SVE CPU Property Parsing
 Semantics").
 
+Additionally, if supported by KVM on the host kernel, the ``host`` CPU model
+may be configured via individual ID register field properties, for example::
+
+  $ qemu-system-aarch64 -M virt -cpu host,SYSREG_ID_AA64ISAR0_EL1_DP=0x0
+
+This forces ID_AA64ISAR0_EL1 DP field to 0.
+
 KVM VCPU Features
 =================
 
@@ -466,3 +493,64 @@ Legal values for ``S`` are 30, 34, 36, and 39; the default is 30.
 
 As with ``x-rme``, the ``x-l0gptsz`` property may be renamed or
 removed in some future QEMU release.
+
+Configuring CPU features via ID register fields
+===============================================
+
+Note that this is currently only supported under KVM, and with the
+``host`` CPU model.
+
+Querying available ID register fields
+-------------------------------------
+
+QEMU will create properties for all ID register fields that are
+reported as being writable by the kernel, and that are known to the
+QEMU instance. Therefore, the same QEMU binary may expose different
+properties when run under a different kernel.
+
+To find out all available writable ID register fields, use the
+``query-cpu-model-expansion`` QMP command::
+
+  (QEMU) query-cpu-model-expansion type=full model={"name":"host"}
+  {"return": {
+   "model": {"name": "host", "props": {
+   "SYSREG_ID_AA64PFR0_EL1_EL3": 1, "SYSREG_ID_AA64ISAR2_EL1_CLRBHB": 0,
+   "SYSREG_CTR_EL0_L1Ip": 3, "SYSREG_CTR_EL0_DminLine": 4,
+   "SYSREG_ID_AA64MMFR0_EL1_BIGEND": 1, "SYSREG_ID_AA64MMFR1_EL1_ECBHB": 0,
+   "SYSREG_ID_AA64MMFR2_EL1_CnP": 1, "SYSREG_ID_DFR0_EL1_PerfMon": 4,
+   "SYSREG_ID_AA64PFR0_EL1_DIT": 0, "SYSREG_ID_AA64MMFR1_EL1_HAFDBS": 2,
+   "SYSREG_ID_AA64ISAR0_EL1_FHM": 0, "SYSREG_ID_AA64ISAR2_EL1_CSSC": 0,
+   "SYSREG_ID_AA64ISAR0_EL1_DP": 1, (...)
+   }}}}
+
+If a certain field in an ID register does not show up in this list, it
+is not writable with the specific host kernel.
+
+A note on compatibility
+-----------------------
+
+A common use case for providing a defined set of ID register values is
+to be able to present a fixed set of features to a guest, often referred
+to as "stable guest ABI". This may take the form of ironing out differences
+between two similar CPUs with the intention of being able to migrate
+between machines with those CPUs, or providing the same CPU across Linux
+kernel updates on the host.
+
+Over the course of time, the Linux kernel is changing the set of ID register
+fields that are writable by userspace. Newly introduced writable ID
+registers should be initialized to 0 to ensure compatibility. However, ID
+registers that have already been introduced that undergo a change as to
+which fields are writable may introduce incompatibities that need to be
+addressed on a case-by-case basis for the systems that you wish to migrate
+inbetween.
+
+A note on Arm CPU features (FEAT_xxx)
+-------------------------------------
+
+Configuring CPUs is done on a feature level on other architectures, and this
+would imply configuring FEAT_xxx values on Arm. However, differences between
+CPUs may not map to FEAT_xxx, but to differences in other registers in the
+ID register range; for example, differences in the cache architecture exposed
+via ``CTR_EL0``. We therefore cannot rely on configuration via FEAT_xxx. A
+feature-based interface more similar to other architectures may be implemented
+on top of the ID register interface in the future.
-- 
2.49.0
