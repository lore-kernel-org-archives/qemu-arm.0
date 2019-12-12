Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1011698lff;
        Thu, 12 Dec 2019 10:22:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqwfMMAkrmJzaWspUKVB0qdRa8zh36nJo417xfbAMOt3rpsmPHij0Lxa8aHey1xCq16B8fgj
X-Received: by 2002:a37:6352:: with SMTP id x79mr9698728qkb.349.1576174949431;
        Thu, 12 Dec 2019 10:22:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576174949; cv=none;
        d=google.com; s=arc-20160816;
        b=ygEqplOzR/SmGnj2qxSjhHNKX1RKyZVpWPD6ZVSGHqdcOiuhvMjSrW/cffrUK/V7n3
         d+y/otYVw/6ZvZs81GOFyfVwYIduV+Wc5Cu23Py+0hnUJf7RYZZJrKhv2bmNIsaEw0j2
         9yShV46+odKcKkB82ZNSGvZSh3g/M8WNFDJU284JTyYs1y5atXMRqFZECvO34MUGm5Kn
         n02m7CPUEiBUqTvE1Sgjk0Jpxhzw391VAnDm03qFu5JNykOtzLj3UXqLF9VQDRiYWAb5
         mymq2/lw3X55iz0XWWXNOQ0U7twnEBFwhiDzRco4W1zDhDSMnVrNtqf55/DU5GjQxU8M
         VeiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=r69RStoSm0rMO8wwtIxPtrqT52+0T861lC3busDYwak=;
        b=naIieOA22EuLUq6Tx6T+Ea5HgXOYJApFeVHyruZGxpS7x3RQ7sEb6Mqh2C0FFLFsIN
         CuzHyHynmCE9PLXp1YKFVq3fMf7T2zJXSrpWBwookJYWA0Kznr2YxmWfcY4KlGZi2ha8
         bRCGcDWJsxAyzrvGizT63xezjxKo6+62D8mRXrLaj3QzO9TZwMO6qP/mP+VMY+2yUmsL
         NuJZ6pDERDaOcU8CykA3BCiFissSEzvbkpASYIfVAcYwAIsYm/OV9aFlUOOBAD33B5ZJ
         rqz61jKK5+h1U4WMWONTsp99aeNuBtZbXapepbXSI2pqlLNgji0Lhn6wlieB/Rft0trv
         /D0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Wtcl+Le6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9si2984870qtp.76.2019.12.12.10.22.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Dec 2019 10:22:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Wtcl+Le6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ifT6a-0008GR-8I
	for alex.bennee@linaro.org; Thu, 12 Dec 2019 13:22:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45326)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1ifSLQ-0002Jm-VE
 for qemu-arm@nongnu.org; Thu, 12 Dec 2019 12:33:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1ifSLO-0002vv-Rs
 for qemu-arm@nongnu.org; Thu, 12 Dec 2019 12:33:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25152
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1ifSLO-0002rw-If
 for qemu-arm@nongnu.org; Thu, 12 Dec 2019 12:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576172020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r69RStoSm0rMO8wwtIxPtrqT52+0T861lC3busDYwak=;
 b=Wtcl+Le6v0hhSRxyATrCtT8df+xLyJB0vS+Bnkx+nkxUKxSLjofZbTKR86yl3VMEX9Avb7
 A0/7IYgTVr+aBNESmy6y0qk7vWmC2hUixEpbkuQ09TRocAPgBsB7qf3/ZBwwknaGR4Z2uH
 f7RtG+4MMslpRUfRi/O89xEw+nPnp/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-ByIa6DMzPIaUClIcA_SxXw-1; Thu, 12 Dec 2019 12:33:37 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 954F218543A1;
 Thu, 12 Dec 2019 17:33:35 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6A2419C4F;
 Thu, 12 Dec 2019 17:33:33 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [RFC PATCH v2 2/5] target/arm/kvm64: kvm64 cpus have timer registers
Date: Thu, 12 Dec 2019 18:33:17 +0100
Message-Id: <20191212173320.11610-3-drjones@redhat.com>
In-Reply-To: <20191212173320.11610-1-drjones@redhat.com>
References: <20191212173320.11610-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: ByIa6DMzPIaUClIcA_SxXw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: peter.maydell@linaro.org, bijan.mottahedeh@oracle.com, maz@kernel.org,
 richard.henderson@linaro.org, guoheyi@huawei.com, msys.mizuma@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1U7oJAoWIfrM

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
2.21.0

