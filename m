Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp771201njb;
        Fri, 6 Dec 2024 03:24:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVlNQ8HlLOTx1gAGqprISLL4HsoioWoD3ZY9Ze/zEYgCymO7VarRvY6lzZaM1IPlYUgFFtJLMqEXLZ01A==@linaro.org
X-Google-Smtp-Source: AGHT+IGAfJgl9F26Y6bgzPHt5JXAcFhJc7R7VpZ43HEFVkSsR+BeV0Zpkx+NdLV7XMwJHefrA/Zz
X-Received: by 2002:a05:620a:4111:b0:7b6:742d:c01b with SMTP id af79cd13be357-7b6bcaef25fmr391530885a.29.1733484272341;
        Fri, 06 Dec 2024 03:24:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733484272; cv=none;
        d=google.com; s=arc-20240605;
        b=DozMnMEEb8kUUSINBZcF0On0azBU0g5gM8o9VHFYep1B8mhY5eKC942vBYOT6iEQiq
         N79axkvnaYAOxvR4RiQL9TqeWltLnRSJAsRVEN+fgzs7MwazeEhJyHSlfqknsEPnWkdc
         wEIVYc8z3kcn9LrVhO6Fzmk40n2CRFUSbPJisRIpQODgQ3gNzVBsJs8hg27SQLUfcIpc
         sJ4wR9b5glEkYVaykC/FxaP+JePaam4Sqn0+qF3n/y/1uE4eMNgmQLzZm9elUudm2Il7
         aJYZ3HRmtelD1XIh1OJJAI3fG1TkfY8+G1HYUzJwxjCjaEtpXnYluQYX4ufI0v4mBjYe
         6B1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yDPI0FNvuxRIcqe79Cz2m4+AUlQ+TVRDgePd4RU/FL4=;
        fh=ou9WwAWkFbBDtrYluijzdFLlSJKncehGww8dMC2w/x0=;
        b=O/alQAW80N5xpZcZg4644PIpLSGIShAlxzfwZYUFeBFV/3vNbykV5txCazV0tuj2L8
         wZ3DuKYJpAW6pHA0y2j3CMlmDG7gMQU2cKqrb9kD3qr8DuDE782FR4kHdKRFoXmZvcsK
         50OWZOslfThC08mC71aIsqbanixkz/78ju+xq0YGhDwJEwYifBDkH9tGMoTZXWg1kDP3
         Y/MdYCv2WJfT3E20djrAFGZC2AEfVChqEkGwpOVjFvWK2t8aLAmeY1tiNA5ZMuiJ/EaW
         XE3fNiLJTYEvy+cEmlSOITS2CnJp2UAooOnWXXUEFr6xQB7kbVxnZYael15DPcldtSwk
         yAxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IcIqYy5I;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a48165si420429885a.84.2024.12.06.03.24.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:24:32 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IcIqYy5I;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733484272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yDPI0FNvuxRIcqe79Cz2m4+AUlQ+TVRDgePd4RU/FL4=;
	b=IcIqYy5I5ad+dl3qTRnjx+xiNIRc6tk5BTM+iJzgvkkvFnB4HLSbSEq9Ie3xChx2Jn5Cg2
	5FzxeQSEYg+gCdz/ySGjZrM3Tm6Qvm9M1WMjz2Adlo6JVPaaYpe7zYMmDqfXOacJTqZkhu
	qCKUxXYOz1jnOH6nL1QtM/Mjq+MySAc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-673-puU1VYBdM1WMhEgf2abGGw-1; Fri,
 06 Dec 2024 06:24:28 -0500
X-MC-Unique: puU1VYBdM1WMhEgf2abGGw-1
X-Mimecast-MFC-AGG-ID: puU1VYBdM1WMhEgf2abGGw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 30E2A1955D42;
	Fri,  6 Dec 2024 11:24:27 +0000 (UTC)
Received: from gondolin.str.redhat.com (dhcp-192-244.str.redhat.com [10.33.192.244])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A407119560A2;
	Fri,  6 Dec 2024 11:24:21 +0000 (UTC)
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
Cc: shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH RFCv2 20/20] arm/cpu-features: document ID reg properties
Date: Fri,  6 Dec 2024 12:22:13 +0100
Message-ID: <20241206112213.88394-21-cohuck@redhat.com>
In-Reply-To: <20241206112213.88394-1-cohuck@redhat.com>
References: <20241206112213.88394-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: ipfrj2igrRQC

Add some documentation for how individual ID registers can be
configured with the host cpu model.

[CH: adapt to removal of the 'custom' model]
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 docs/system/arm/cpu-features.rst | 47 ++++++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 8 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index a5fb929243c5..abee557d7b6e 100644
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
+properties for each write ID register fields. Those options are named
+SYSREG_<IDREG>_<FIELD>. IDREG and FIELD names are those used in the
+ARM ARM Reference Manual. They can also be found in the linux
+arch/arm64/tool/sysreg file which is used to automatically generate the
+description for those registers and fields. This currently only has been
+implemented for KVM.
+
 CPU Feature Probing
 ===================
 
@@ -106,6 +119,10 @@ As expected they are now all ``false``.
 
 Only the ``pmu`` CPU feature is available.
 
+Probing for the ``custom`` CPU model is working differently. CPU model
+expansion will return the list of available SYSREG properties (matching
+writable ID register fields)
+
 A note about CPU feature dependencies
 -------------------------------------
 
@@ -124,13 +141,20 @@ A note about CPU models and KVM
 
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
@@ -167,6 +191,13 @@ disabling many SVE vector lengths would be quite verbose, the ``sve<N>`` CPU
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
 
-- 
2.47.0
