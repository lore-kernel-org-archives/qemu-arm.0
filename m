Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5632439wre;
        Thu, 31 May 2018 00:54:57 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLE2NxbDxLfPz5vOER2573iIrmB9M7fI/tdTEgsjVwfjkBt8f4BfhQn0R1xibO9ERBtxeZm
X-Received: by 2002:a37:7943:: with SMTP id u64-v6mr5439075qkc.13.1527753297138;
        Thu, 31 May 2018 00:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527753297; cv=none;
        d=google.com; s=arc-20160816;
        b=KqPvV8ARmrnZHN3FQg1MMyQbQu+b0WQmeZOg7psmlz4kmWxATk0PN4TrKZ9hW4Og7a
         967A1gBg2Pwq19pRdscXaYvwF8ViDrVxawbOTYgl/IMHsVzBU0UjHTr0b3PUmjJXf7Zw
         +wKCGXU4XDeVi/ivr5RTBRlEQzN1jozus0uSJDV1Z6tXCibb/xuofiiQfFGhmOCTS714
         kYQLolWvCrrc4QipDDAnk5YneS33chY41Tu7MZ9D4rJXD+WqOGZwqJK1+i7tDvU9rBME
         J3aw5jnMOUC10QG4FFnijAa9UmL89NAryAT44SO6Xm63UsKk0zKQ3HOy0OYs303BaX1v
         YvpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=m0VSDFnireTQzr062QXNHeSjShrF+frmQHSinfrGKp8=;
        b=vQczxWJSFrwOLhVMysEXk/cBbmvMSVyqXDLKiVxyFJ4sVEqCwP+JNLlyWaYB8E2+CM
         gXPIb3gxQohM/VpIJU9ExfiRA+FBXTip0ePZGnkCMuwA6zHhVpxNhmudyGWrK8Z5BTjR
         OgecJvFwg+V5sl7T8ztHcILGeedAqyj8YmicebWvnaBecZMD5aubZovE4SBLL5rEcc8b
         BgrJe4FKs1bMhdigjOSlkqI6hgYSKwlZzA1C3t0e79NpbMTHPo1Rj4Q0792+QVTBR7Jk
         HPtUjWTTblPIKQ45urKE1OpNck7X1cvotoVAPkpSO4syiOp8BIrasJimTPzJWMDJ4BlF
         4pXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s17-v6si1203972qvl.172.2018.05.31.00.54.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 00:54:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOIQC-0005Jx-Mw
	for alex.bennee@linaro.org; Thu, 31 May 2018 03:54:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fOIQ6-0005Jk-8m
	for qemu-arm@nongnu.org; Thu, 31 May 2018 03:54:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fOIQ1-0003Ja-Kh
	for qemu-arm@nongnu.org; Thu, 31 May 2018 03:54:50 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53782 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fOIQ1-0003Ia-FD; Thu, 31 May 2018 03:54:45 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91197401EF10;
	Thu, 31 May 2018 07:54:44 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 954CA2026DEF;
	Thu, 31 May 2018 07:54:43 +0000 (UTC)
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org
References: <1527750994-14360-1-git-send-email-zhaoshenglong@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <84171c12-e281-8de5-ec3d-ac0aaf3c3dbb@redhat.com>
Date: Thu, 31 May 2018 09:54:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1527750994-14360-1-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 31 May 2018 07:54:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 31 May 2018 07:54:44 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] KVM: GIC: Fix memory leak due
 to calling kvm_init_irq_routing twice
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 64BmgUM2egZE

Hi Shannon,

On 05/31/2018 09:16 AM, Shannon Zhao wrote:
> kvm_irqchip_create called by kvm_init will call kvm_init_irq_routing to
> initialize global capability variables. If we call kvm_init_irq_routing in
> GIC realize function, previous allocated memory will leak.
> 
> Fix this by deleting the unnecessary call.
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
openpic_kvm seems to suffer the same leak. Don't you want to fix it as
well?

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/intc/arm_gic_kvm.c   | 1 -
>  hw/intc/arm_gicv3_kvm.c | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
> index 6f467e6..204369d 100644
> --- a/hw/intc/arm_gic_kvm.c
> +++ b/hw/intc/arm_gic_kvm.c
> @@ -572,7 +572,6 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
>  
>      if (kvm_has_gsi_routing()) {
>          /* set up irq routing */
> -        kvm_init_irq_routing(kvm_state);
>          for (i = 0; i < s->num_irq - GIC_INTERNAL; ++i) {
>              kvm_irqchip_add_irq_route(kvm_state, i, 0, i);
>          }
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 001d82b..aa4c7c5 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -813,7 +813,6 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>  
>      if (kvm_has_gsi_routing()) {
>          /* set up irq routing */
> -        kvm_init_irq_routing(kvm_state);
>          for (i = 0; i < s->num_irq - GIC_INTERNAL; ++i) {
>              kvm_irqchip_add_irq_route(kvm_state, i, 0, i);
>          }
> 
