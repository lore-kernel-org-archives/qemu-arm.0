Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp13298lfp;
        Mon, 20 Jan 2020 02:13:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqw3pc4kblELkU7CbN+bbzRdKKptp7aUnGaYEYu2wfOh/Dq/a4/o6zGiT8y2anT/qNiE0ryg
X-Received: by 2002:a17:906:3590:: with SMTP id o16mr20036629ejb.34.1579515190741;
        Mon, 20 Jan 2020 02:13:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579515190; cv=none;
        d=google.com; s=arc-20160816;
        b=prwJvqzG+Syk1CcCP2y0AcWlptZTXdbUDt8/eCdmOVLAPOw6RpRy2+S3lx8RLms0C1
         Y7pMWjeoJoHDllXUYsN4VyZPJNG3r1Be7qoZFWxqYbDc3wOBNcLPZeIILH7bBA+ydmgU
         9upIhzR0+LExqorXp11qWzy1peeknp9/KGxWfYRxgLo+xwBRNpGhKBwD0Kcm2OMaSxbJ
         XwPGK6y5hYO4j7LAbtOKplGWJQFlEWcgJkngFrrpC6o6l//aDMyu8J0Ud0WUgPG64Hvy
         VHSbfeeniympgXKXYATTPAX8ahC6yS+4V/bu8e7YLvUlyxCCDZUxdkmI/D4jceEATVou
         phpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VOp4CaztOIhv+HMDdHjauCvxMi8MTlQzoljvJnJvG6A=;
        b=dligKyEsNp4694U+UguYM0MDYqtPSRYcdswBifvWYcXLKAJXVP4NuewHNzO0VF1sUY
         e+PyXn/Yw0i/2bMZmKi/AJkj3QabYD/BjHjUhjyXIwNR5wkkkWNvqjKZphsbW8ZnWE8w
         EE3jw+xYcZuH76VDzamMAO5pKEwJ8akrjuqE+zzCyrMNEn0GiwgLoCPU7L5vT+WWgNc5
         2K4wLYcWVzTTrjHiGxdC2nBBf3ySiAPwB+QMrkia30B8iW48Tv9kIXWxua+jHqbM1YKV
         aJHvnqf4Zv0dtjIqxTmiF77ubwwxO/j6nzMfbUoDDzboNuz++9EzZJ7Q7IjWg+ScyHp6
         4vBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IYfWTlbE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7si18834901eja.469.2020.01.20.02.13.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 02:13:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IYfWTlbE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itU3R-000870-Ir
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 05:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34010)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1itU14-0005UN-OA
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:10:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1itU10-00035W-Ib
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:10:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53913
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1itU10-00035G-Ff
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579515038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VOp4CaztOIhv+HMDdHjauCvxMi8MTlQzoljvJnJvG6A=;
 b=IYfWTlbEWdNG6hLAK4L9m1/ZGD2fdtIJ/uklMe4JKFxfKGKc3nFZzbK30ud2pkY6Zqx5tl
 tp9A+y2SukqgfKeIuypuP57IOEmvYHIjBolFuS00aU+kPTzNydIBqYnAeL+HWJrBz5MOA1
 YP8aMlRovXcI0xBW7HXe7SgkmYxTWlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-S2V9ni4FM-CHL4TY8kSaeA-1; Mon, 20 Jan 2020 05:10:34 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19A69107ACC4;
 Mon, 20 Jan 2020 10:10:33 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BDD248;
 Mon, 20 Jan 2020 10:10:31 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [RFC PATCH v3 3/6] target/arm/kvm64: kvm64 cpus have timer registers
Date: Mon, 20 Jan 2020 11:10:20 +0100
Message-Id: <20200120101023.16030-4-drjones@redhat.com>
In-Reply-To: <20200120101023.16030-1-drjones@redhat.com>
References: <20200120101023.16030-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: S2V9ni4FM-CHL4TY8kSaeA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, bijan.mottahedeh@oracle.com, maz@kernel.org,
 richard.henderson@linaro.org, guoheyi@huawei.com, msys.mizuma@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5Q0uwTjvCHvu

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
index 876184b8fe4d..5cafcb7d36dd 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -605,6 +605,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *=
ahcf)
     set_feature(&features, ARM_FEATURE_NEON);
     set_feature(&features, ARM_FEATURE_AARCH64);
     set_feature(&features, ARM_FEATURE_PMU);
+    set_feature(&features, ARM_FEATURE_GENERIC_TIMER);
=20
     ahcf->features =3D features;
=20
--=20
2.21.1

