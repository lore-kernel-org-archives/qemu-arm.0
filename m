Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp7233902wrm;
        Wed, 16 Oct 2019 07:34:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwRz07O5afk2YDhrYIyetpP6/cnM1SUBZmQh+CVJnJ0jdCUTMf6JDXWZUXNHOtH7vqMyd6H
X-Received: by 2002:ac8:29e8:: with SMTP id 37mr43772703qtt.21.1571236481636;
        Wed, 16 Oct 2019 07:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571236481; cv=none;
        d=google.com; s=arc-20160816;
        b=xKYJ6ZZAWsPAm1NeAQA/3RwGOaLk7hFSUDkJi0KKCymP6Zo3yH4gfn/K7dy48zIovg
         0JuIwvduWu5TP1dbc2ajyshCVPSRAUSMnK/IlUDwItteYTIzGvJAe6dK1J3j9eca58pb
         x5z8Oytsy7M7QdkWgj7f6xlzfs4RNI4SV195OwH3iT9SB0MfaHtnp+UTVa9bkd079B39
         CKH39bJH4zG7H2+5Cq01VBsiOpJWfxcYoaLmBzkhceSVjikfZuu4U2/n4OJOuUMTPeJv
         P30hAAgPDbkNVTIVL4ifaMjSWkGyo00nvIYvuDmCKThMMACPM/fF8mnQG8Y+jHBgFko8
         sHow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=p4iRMbNEfedD7vuLrZQ6mkQOb2XKWV+YJUjhyFcS/HE=;
        b=Mw/2zqUyJUF/SjoDxOr+Gqz5AlwVjYSebC91qorMqxSqedCV7B3Qs2jo5c4qFQJzsu
         oSgmLroxQ0oM9UbGmQtOqOY1potPYFJUYw1RkX1Kfezdna07+1MT02HbZCz7Ybt/492H
         Gum7jipLXEhCm5/hqSMkBZal1oL3PJkwEGzptof8KJzqJwciDr/yok4ShXahThDzQH/l
         +Apu3e7Kae3eYaayxjLOAWSTjeZ/qu9F6Oypr6J2F3YNeU3kZqiOA7s2ui/rjXbNX5OU
         fpn/R9oNNJwIiX9h0eqwlVMU8I9eAUiWYudzMIzyBIw1KgO0cVBDSbA45bufQO4TeZ2U
         Ia1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12si22812375qvc.116.2019.10.16.07.34.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 07:34:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKkNt-00054Y-2p
	for alex.bennee@linaro.org; Wed, 16 Oct 2019 10:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41667)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iKkNW-00053t-DB
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 10:34:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iKkNU-0000gt-Lu
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 10:34:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49500)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1iKkNU-0000gc-GP; Wed, 16 Oct 2019 10:34:16 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9E8043086E20;
 Wed, 16 Oct 2019 14:34:15 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F01C19C68;
 Wed, 16 Oct 2019 14:34:14 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v1 1/5] target/arm/kvm64: kvm64 cpus have timer registers
Date: Wed, 16 Oct 2019 16:34:06 +0200
Message-Id: <20191016143410.5023-2-drjones@redhat.com>
In-Reply-To: <20191016143410.5023-1-drjones@redhat.com>
References: <20191016143410.5023-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 16 Oct 2019 14:34:15 +0000 (UTC)
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 bijan.mottahedeh@oracle.com, maz@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +/WCJSGcC9io

Add the missing GENERIC_TIMER feature to kvm64 cpus.

We don't currently use these registers when KVM is enabled, but it's
probably best we add the feature flag for consistency and potential
future use. There's also precedent, as we add the PMU feature flag to
KVM enabled guests, even though we don't use those registers either.

This change was originally posted as a hunk of a different, never
merged patch from Bijan Mottahedeh.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index e2da756e65ed..666a81a5ce6f 100644
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
2.21.0

