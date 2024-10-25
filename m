Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp940436njx;
        Fri, 25 Oct 2024 03:22:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhq10DO7lJGSSxKML8p/r9fiLtKFA/1G9beprU9il8qw07RABSn7y90BU7UwfPnshpcgJPWQRTG0RZag==@linaro.org
X-Google-Smtp-Source: AGHT+IFc0Aoznys5w/pJVtqAcBTYOfrFwRLq0yz8XA7Y3NRkAlEhzUJCGb7dHa8d38nr48uMNTKl
X-Received: by 2002:a05:6902:2309:b0:e29:1630:785c with SMTP id 3f1490d57ef6-e2f22f1f918mr4590868276.10.1729851741781;
        Fri, 25 Oct 2024 03:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729851741; cv=none;
        d=google.com; s=arc-20240605;
        b=foz5b3uF3AvOmUwIVxx51EH2ksLr0vRTITIIiGWvq57idFG2FsvawY4Vb9TNmSMJDn
         BSh4hM6tpukGOA2KebnazKK/Q1QMBIQY8zBTOgxJUXAngw4j+eJni+ULLJUop0wj+fqy
         PJg8r8c4MIeX1fknoy1mH+YoUIxOK+H7a6uc8UrteYMl3YwdiMf+FsJp6V09UsEZGLlH
         5cyf0jclJ4KmG1TkphOJ4Nizg6o8h4rQ86foWiBRpMHF2/JIigef2LG6SjHfnIKCIXOn
         pL0uEjXJCBM1qVdpdhT+KB0VYPStHiKIQAqR7pCxyXfz2kZV4kfmmC4Iz/cfTTd2oCqI
         z2ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oe6BKi/vAtAI+FnjeShPy/q5uBG++u0rJX+QId15yp8=;
        fh=g9Vpjz63mVuJw8UctUd3g7QIg2gWmZ7/W2EH3lsjMnE=;
        b=PlAlM9nW7WyyCc1zYFnWa+kXMBA3d1yrOaKu+obW9iakfOFpfA8uHR3UhKXWGfZwkA
         tIjpdf93UEpGOs1OzyfVCrv7gNTNsQFE2ycLKB8OFrlQEdcgWrWjfH+7IQfKus+b3gZ/
         9T/lFFwTTyVXe5rWHIWkeQ7qHX056r4D9NITQzGZl9FV1mZIQEcuRSgyDj5K0xdQ8NPN
         U5Lmxz1I7pgrqYjhFvhhMs8aS/Y/d7oOwqWag9TjPrGgpyUCUx1cPj40H4Zl+9BUwERb
         7B21CXTV5Vun1cgCsMS9y4xsbCVHOjVNg1p+gY+CgdF1Mj3Y2D/4aTtPD13vkNUJb5zX
         es9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YJ1V1jS9;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4613240da66si10604441cf.766.2024.10.25.03.22.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:22:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YJ1V1jS9;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729851741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oe6BKi/vAtAI+FnjeShPy/q5uBG++u0rJX+QId15yp8=;
	b=YJ1V1jS9913B8cr0anFvNzAhTi6DRirhFLxFivGaj8AbctSTjBPiuCBphJa54ZAfoAYDPv
	yGk1doR1/1mcArrNz0dIj6x3uW/XmY3t95B0qvhB2X7a6t3x3IZ3FN4BHRpzoE0ZbHYH+G
	42HQJZUB8qfCdwKb4RbxcD21UEf6MKE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-684--TImg_t-Ofqy92fVKxNUJA-1; Fri,
 25 Oct 2024 06:22:18 -0400
X-MC-Unique: -TImg_t-Ofqy92fVKxNUJA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5E842195609E;
	Fri, 25 Oct 2024 10:22:16 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.5])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 013E2196BB7E;
	Fri, 25 Oct 2024 10:22:10 +0000 (UTC)
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
Subject: [RFC 19/21] virt: Allow custom vcpu model in arm virt
Date: Fri, 25 Oct 2024 12:17:38 +0200
Message-ID: <20241025101959.601048-20-eric.auger@redhat.com>
In-Reply-To: <20241025101959.601048-1-eric.auger@redhat.com>
References: <20241025101959.601048-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: wPFTmf95GOs2

From: Cornelia Huck <cohuck@redhat.com>

Allowing the use of the custom vcpu model in ARM virt.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/arm/virt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b0c68d66a3..edde4b5007 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3052,6 +3052,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
         ARM_CPU_TYPE_NAME("host"),
 #endif /* CONFIG_KVM || CONFIG_HVF */
+#ifdef CONFIG_KVM
+        ARM_CPU_TYPE_NAME("custom"),
+#endif /* CONFIG_KVM */
 #endif /* TARGET_AARCH64 */
         ARM_CPU_TYPE_NAME("max"),
         NULL
-- 
2.41.0
