Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp940544njx;
        Fri, 25 Oct 2024 03:22:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURPOZMHsSUP7KIutWjQWVPjdsYOR7hOsUPsvjrGOt+fq28H9tBPOIZlfqlqzO9f1KtPCw67QocDoCR8Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEH3UuJ2zBWGEtejUGqzaSMa4cpL9qwL2fN5cLaxMutE+zLRfHGjm8iheHdFpWESRoTeA+x
X-Received: by 2002:a05:620a:4153:b0:7a9:aba6:d024 with SMTP id af79cd13be357-7b186cfc5bdmr560272685a.43.1729851754901;
        Fri, 25 Oct 2024 03:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729851754; cv=none;
        d=google.com; s=arc-20240605;
        b=OtHaws0jzF3vLiWl39ImyqHqN3WzQ512vrMtiEl/MuDjNfbV+8ZoR16nzVSRyKMoT4
         nTb4S6iTjT9QVwT9+7ef29MmY27TtzUutfXOakrHkreDKsEYWceEHs15N0ofjbZ2csSk
         LKr13LolMeJSCild+YuGP8IGI2cI1mqJ9YcHvbVYuJOQ6U2lB96J0cMLSMXwwBwurTCh
         ukYiNd/GyXAq3zJa3aIXtI8C9Fs0NaBzpANZslQPaZKQnWfrfbmo3Ji95Cosp5KREwW9
         6QyOopG0E/droS/+cqX1NKYBWd/HHuGqDV0EH7RoXDQp+rH8r2xmUoSaaMNimbD+9D/H
         TAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=na/5decBOfjXjNm65+tQgO51fwBCM0ftC2cvCUNK2FU=;
        fh=g9Vpjz63mVuJw8UctUd3g7QIg2gWmZ7/W2EH3lsjMnE=;
        b=DpmS8A66qBC4gJBoprN9uF9lgTgQ496u3apOhPxSyNKNb3zElP1EvvfXoKHYPSPUSV
         f1QK3b0NGXdeNQ4U91D6ChuJ1jV1tSIKbRx41FpUgg2oHNRSk4zUqykbdiowXGPO4jng
         YPkjMh5L5XKk/eckC2GNKIP3fruAmeggY7tKQ3hZken1pqtwJC3xKld//jzPgHl+Y9b+
         HUAfo1D5wyJMJYf+4MC+XHLxvpNeY4ouWsfSP1u0dbmiaabk52sH2ey0bMAy6BYLicNF
         gEKSSpKKB0rG42iu5QpOsKLwSQMGWW0oLs9tW44KtXCTNaE7svFAglJFNGtRO1xdqeOE
         R4/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MSq4ddAt;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b18d3443c6si110985485a.437.2024.10.25.03.22.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:22:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MSq4ddAt;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729851754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=na/5decBOfjXjNm65+tQgO51fwBCM0ftC2cvCUNK2FU=;
	b=MSq4ddAt9nr4en8DNlAY5G/Eg4aybTvpmc5alPxvkfilgwHie9dBRX87FsfIRMOlvly/V3
	elBbVfpm5agAqGfoXarDChVjc1fJX8xJljU6FdVdx78GQ2WcN1x+w2DAP+QpPIhKmEYXy4
	9EduQ6+oYCqf0AXA/GCCJMiOwTNNtZw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-332-V0zDiV5xMXC1QMg13lrBzg-1; Fri,
 25 Oct 2024 06:22:30 -0400
X-MC-Unique: V0zDiV5xMXC1QMg13lrBzg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5872A195608A;
	Fri, 25 Oct 2024 10:22:28 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.5])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CABCE196BB7D;
	Fri, 25 Oct 2024 10:22:22 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	cohuck@redhat.com,
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
	pbonzini@redhat.com
Subject: [RFC 21/21] arm/cpu-features: Document custom vcpu model
Date: Fri, 25 Oct 2024 12:17:40 +0200
Message-ID: <20241025101959.601048-22-eric.auger@redhat.com>
In-Reply-To: <20241025101959.601048-1-eric.auger@redhat.com>
References: <20241025101959.601048-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: 3y7thf8PvwPN

From: Cornelia Huck <cohuck@redhat.com>

Add some documentation for the custom model.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 docs/system/arm/cpu-features.rst | 55 +++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 8 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index a5fb929243..962a2c6c26 100644
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
 
+2. Alternatively, the ``custom`` CPU model allows to configure optional
+CPU features via the corresponding ID registers. The host kernel allows
+to write a subset of ID register fields. The custom model exposes
+properties for each write ID register fields. Those options are named
+SYSREG_<IDREG>_<FIELD>. IDREG and FIELD names are those used in the
+ARM ARM Reference Manual. They can also be found in the linux
+arch/arm64/tool/sysreg file which is used to automatically generate the
+description for those registers and fields. The custom model is currently
+only implemented for KVM.
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
 
@@ -119,18 +136,30 @@ independently without error.  For these reasons callers should always
 attempt to make their desired changes all at once in order to ensure the
 collection is valid.
 
+When using the ``custom`` CPU model, the provided set of ID registers
+is always evaluated as a whole.
+
 A note about CPU models and KVM
 -------------------------------
 
 Named CPU models generally do not work with KVM.  There are a few cases
 that do work, e.g. using the named CPU model ``cortex-a57`` with KVM on a
-seattle host, but mostly if KVM is enabled the ``host`` CPU type must be
-used.  This means the guest is provided all the same CPU features as the
-host CPU type has.  And, for this reason, the ``host`` CPU type should
-enable all CPU features that the host has by default.  Indeed it's even
-a bit strange to allow disabling CPU features that the host has when using
-the ``host`` CPU type, but in the absence of CPU models it's the best we can
-do if we want to launch guests without all the host's CPU features enabled.
+seattle host, but mostly if KVM is enabled, either the ``host`` or the
+``custom`` CPU types must be used.
+
+Using the ``host`` type means the guest is provided all the same CPU
+features as the host CPU type has.  And, for this reason, the ``host``
+CPU type should enable all CPU features that the host has by default.
+
+In case some features need to be hidden to the guest, ``custom`` model
+shall be used instead. This is especially useful for migration purpose.
+
+The ``custom`` CPU model generally is the better choice if you want more
+flexibility or stability across different machines or with different kernel
+versions. However, even the ``custom`` CPU model will not allow configuring
+an arbitrary set of features; the ID registers must describe a subset of the
+host's features, and all differences to the host's configuration must actually
+be supported by the kernel to be deconfigured.
 
 Enabling KVM also affects the ``query-cpu-model-expansion`` QMP command.  The
 affect is not only limited to specific features, as pointed out in example
@@ -167,6 +196,16 @@ disabling many SVE vector lengths would be quite verbose, the ``sve<N>`` CPU
 properties have special semantics (see "SVE CPU Property Parsing
 Semantics").
 
+The ``custom`` CPU model needs to be configured via individual ID register
+field properties, for example::
+
+  $ qemu-system-aarch64 -M virt -cpu custom,SYSREG_ID_AA64ISAR0_EL1_DP=0x0
+
+This forces ID_AA64ISAR0_EL1 DP field to 0.
+
+Note that the other CPU feature properties are not supported when using
+this model.
+
 KVM VCPU Features
 =================
 
-- 
2.41.0
