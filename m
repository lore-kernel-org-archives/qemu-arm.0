Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1708298njb;
        Thu, 6 Feb 2025 09:55:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUS2EKWbYhT273WbvyB+3M5pzEun9dAbvXJQNZAsZk54R4mT0YYd2phaoroL2lXbFcp9a24pPBWgwynew==@linaro.org
X-Google-Smtp-Source: AGHT+IHXGuBxOJZT4oZ4XBwftV0gyAKUHMtj+z09W29OhEPa8A/Yf6hiTdPGN7SWr048V+gp4Eld
X-Received: by 2002:a05:620a:bcc:b0:7b6:f024:3ca with SMTP id af79cd13be357-7c047c9b512mr3663385a.58.1738864532516;
        Thu, 06 Feb 2025 09:55:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738864532; cv=none;
        d=google.com; s=arc-20240605;
        b=Axz3qOSLZMwSk3O26qH4KbsK5o8km2XC6yZNiZ2PccnEUvfJbqSz13cxZN1CNxcshP
         3NQFqaPHgHCbsH2FPSBqw8JanI2vuCantF/zMucm50bl55c6du5qkWyR1MXZe7hTVtoO
         Vs/QK/KuOAe3RInWEt21LgsrIOBeDQlUtPIa8egH5fpWodRoD3LMdLqLtA2zK6JkBlZt
         kgggqyKMbUa+HzX8EnvojoJSGeF/czt1gBw+XGXYLY2kCt3AhTU77v6WQVK4alUpYIOb
         QpZhr7hR33Rmro/b8rkIkVO5OCrg5sMxLEdIvIYREuvzrSgV9w11lEuxPD9dVa8Txbqj
         tumw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=I/K7XUTm51Bc6uwWefHjUcuVMKnO/Rpe+Q1nuqTiPdo=;
        fh=SM/55c4tu8kbdFn3L58O4WD3COoDgdKdTY71VD60UoI=;
        b=WL5vHbOTsn2tyvrtTlkMIldWS7VtpE1XtycfbqX9YFC9c3VviyvJNnBNElfgnHFpKm
         tPHsN1V9OxmvE9U3VTkuqHAYulJzFICPKD7Sn8SwJmbVCI/KbYGLlgpi6dco/WqRAERi
         VvhYfpyPU19Rd068hB1G0lVqjHH+Sjnw5LG44aosdZ3fYZvwIGVTWT54RT6TjJ6vLT3J
         yyP+kl90UtIuszLCFFvy1w28ELH4utRfiYrKONn7SmTIb7Ezbj9FDxIMwEtIQVo5Gxyn
         W5eQhL6W419nat7L/KA5KDTLzaNPb5frZzWJVy4svaWFGA9QjTKdZ9SR+mwei6SXQlxt
         ejSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FGB5/oH3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041ed5447si154261885a.559.2025.02.06.09.55.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 09:55:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FGB5/oH3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg65t-0003TM-8A; Thu, 06 Feb 2025 12:55:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tg65r-0003Sb-Hf
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 12:55:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tg65p-0000T9-TG
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 12:55:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738864512;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I/K7XUTm51Bc6uwWefHjUcuVMKnO/Rpe+Q1nuqTiPdo=;
 b=FGB5/oH3tPz8ufJBBB0qOtnB6vtNMlt3aFMbMJwVN8LHgzf61oI4iVuB29AQUZJDTbGWsB
 uy9CCy4haBluisJFiM/JeFlPO/vA8x39c9fx/QjubC+of8jbYHCZEh8Vmw4NsUrvSinpjQ
 aOar8fXy8WFZrPzyU+fNGrp42MFFNyQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-111-Z22qD3ogPO-3e0UCC7kqAg-1; Thu,
 06 Feb 2025 12:55:08 -0500
X-MC-Unique: Z22qD3ogPO-3e0UCC7kqAg-1
X-Mimecast-MFC-AGG-ID: Z22qD3ogPO-3e0UCC7kqAg
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 10FE91800873; Thu,  6 Feb 2025 17:55:06 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.33])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 92CDE180056F; Thu,  6 Feb 2025 17:55:00 +0000 (UTC)
Date: Thu, 6 Feb 2025 17:54:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Message-ID: <Z6T3cX_fM-aeYbMI@redhat.com>
References: <7ecabe74e0514367baf28d67675e5db8@huawei.com>
 <Z51DmtP83741RAsb@redhat.com>
 <47d2c2556d794d87abf440263b2f7cd8@huawei.com>
 <Z6SQ3_5bcqseyzVa@redhat.com>
 <f898b6de4a664fe8810b06b7741e3120@huawei.com>
 <Z6TLSdwgajmHVmGH@redhat.com>
 <71116749d1234ab48a205fd2588151ec@huawei.com>
 <20250206170238.GG2960738@nvidia.com> <Z6TtCLQ35UI12T77@redhat.com>
 <20250206174647.GA3480821@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250206174647.GA3480821@nvidia.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7luJkIA1qyb5

On Thu, Feb 06, 2025 at 01:46:47PM -0400, Jason Gunthorpe wrote:
> On Thu, Feb 06, 2025 at 05:10:32PM +0000, Daniel P. Berrangé wrote:
> > On Thu, Feb 06, 2025 at 01:02:38PM -0400, Jason Gunthorpe wrote:
> > > On Thu, Feb 06, 2025 at 03:07:06PM +0000, Shameerali Kolothum Thodi wrote:
> > > > > If we set the physical/guest SMMU relationship directly, then at the
> > > > > time the VFIO device is plugged, we can diagnose the incorrectly
> > > > > placed VFIO device, and better reason about behaviour.
> > > > 
> > > > Agree.
> > > 
> > > Can you just take in a VFIO cdev FD reference on this command line:
> > > 
> > >  -device arm-smmuv3-accel,id=smmuv2,bus=pcie.2
> > > 
> > > And that will lock the pSMMU/vSMMU relationship?
> > 
> > We shouldn't assume any VFIO device exists in the QEMU cnofig at the time
> > we realize the virtual ssmu. I expect the SMMU may be cold plugged, while
> > the VFIO devices may be hot plugged arbitrarly later, and we should have
> > the association initialized the SMMU is realized.
> 
> This is not supported kernel side, you can't instantiate a vIOMMU
> without a VFIO device that uses it. For security.

What are the security concerns here ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

