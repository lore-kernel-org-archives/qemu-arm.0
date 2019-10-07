Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4054824wrm;
        Mon, 7 Oct 2019 10:06:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy5GGNe5FzSTZxN7s+bIYRmoUqFciATTfvEiJuLOIsDaW1tNkAjLdzHudtycny4OUYISTT6
X-Received: by 2002:a50:9eee:: with SMTP id a101mr29607448edf.128.1570468009754;
        Mon, 07 Oct 2019 10:06:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570468009; cv=none;
        d=google.com; s=arc-20160816;
        b=hCOC2MQy/nUI4M2EVk1pINfc5DR8cvxB6ZiP/0tjzgzXTqTXdMFvwtR3f8QnkB8M09
         O3w9Of9/dFm0JdmIk1+SrxnQA2l7ddS7wX3kkHfficb1S4mM19lgvHHXec2Wupa678eZ
         clzq36gA6Fls01sMxK7AP1HRpN+aEp8OFXdozTTzVLABAFgWq/s7YYBPA1btITeFfMOC
         L/6jmtjkyCMKdUISHrxi2Fa2Q9eTY851JBnBkaoH8+3+O2qkLLjcLbOrXftH5geLrL/N
         CFp+OF0KrsgeTjpISQJl4DzTvv7X3ndUDJdxbfN2N1A94Iu0zhudPsBVK5sCP2zFAAwR
         K8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=owW2GUOgtujxM+kOKkANYoglOzLyvGqyH6gw3+cEcaU=;
        b=RK8XXIGSC2wo8ViwMm//AKVmlpi9QdoXIWzy68blnaJenPGLpHybvd6ggKxO84av7g
         dzItjYYvrVr2CSABl44o3xXC1MOoacekYJVdIqMAGcp1iP6SMl+apGrN4hI10lZjFcrj
         0RIbZG44u7G/G6PR2Bz1ehzxaPGsNYcJaLwBQiv3Ek3YvyRCCnBIRTeM5VOcDSMd1ARF
         +fxhy3ftXYCqFZ477FWLi05eBM9dj8WTOUY7J0cV8RfDBygQnzJ3CO3xBFZxavm+eQuc
         EuJalKSe1NNj+9TbGgg9ao/ztJfVZyxo3iuVy2sn74yobP3VjWjvonbkWjhgsP7Xj6eI
         6/Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b4si10119163edk.331.2019.10.07.10.06.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2019 10:06:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHWTA-0006GW-9F
	for alex.bennee@linaro.org; Mon, 07 Oct 2019 13:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36836)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iHWSt-0006F2-L8
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 13:06:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iHWSr-0004oI-My
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 13:06:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36512)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1iHWSr-0004o4-GY; Mon, 07 Oct 2019 13:06:29 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B375FC0568FA;
 Mon,  7 Oct 2019 17:06:28 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDF3E5D9CD;
 Mon,  7 Oct 2019 17:06:25 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [RFC PATCH 1/5] target/arm/kvm64: kvm64 cpus have timer registers
Date: Mon,  7 Oct 2019 19:06:18 +0200
Message-Id: <20191007170622.1814-2-drjones@redhat.com>
In-Reply-To: <20191007170622.1814-1-drjones@redhat.com>
References: <20191007170622.1814-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Mon, 07 Oct 2019 17:06:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, bijan.mottahedeh@oracle.com, maz@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sMXfbakX4ThN

Add the missing GENERIC_TIMER feature to kvm64 cpus.

We don't currently use these registers when KVM is enabled, but it's
probably best we add the feature flag for consistency and potential
future use. There's also precedent, as we add the PMU feature flag to
KVM enabled guests, even though we don't use those registers either.

This change was originally posted as a hunk of a different, never
merged patch from Bijan Mottahedeh.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/kvm64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 876184b8fe4d..5cafcb7d36dd 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -605,6 +605,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures=
 *ahcf)
     set_feature(&features, ARM_FEATURE_NEON);
     set_feature(&features, ARM_FEATURE_AARCH64);
     set_feature(&features, ARM_FEATURE_PMU);
+    set_feature(&features, ARM_FEATURE_GENERIC_TIMER);
=20
     ahcf->features =3D features;
=20
--=20
2.20.1

