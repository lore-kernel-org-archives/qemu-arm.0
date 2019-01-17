Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1605810wrt;
        Thu, 17 Jan 2019 01:35:17 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6X4kcDPr5ANwRmgQ72T2KixwbPY173bHK7DrgzrHMc+TVvwn2NbXYZqxY0ItCbrSemF/08
X-Received: by 2002:adf:eec9:: with SMTP id a9mr10904363wrp.242.1547717717229;
        Thu, 17 Jan 2019 01:35:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547717717; cv=none;
        d=google.com; s=arc-20160816;
        b=i2lO9fM1vC9ekVPZyglM1amFx9UWfe6ZH4+oUpz6TQi9b9d0OiEphvekmHZDKSw3oc
         rc5i3o+mo66LMnaKzvqNWFn9ZNGzwQ0sJdrFtCVVh0qT23KDgmsbzLygsbput1Af4oMa
         UTVeaeqpDHsrvIXeTzwNd30zf5iBp3i3vw6PQ1CijQ5TIsCLSbKoVMrNAn1thaj5TiJC
         GPj5yDSZ+9jeV7uRBzJmpmp7f8T2eTk1EK/V/sW2Atuy9NdEKbyZjw4bfd1nW8K8dXW6
         leI+42vs28c+Bok97W3ehiFbmyxf/apH/M0v8hMJ0lTz4JVfbvnq3Rv7BsBV5U3eweOc
         FJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=SPSTiRHj5NJ3Q+M5oV7FDrTfrI/FFlwvqHvXo/cuvmQ=;
        b=gTVZZmaxkKrSMBL+zgTQXp//+J8S6ilzh8LT4UVIL6RRqN/HWjJC69vakt4R53ekWv
         mMzsZs2AdOWjXhMWIdsWxJlMJ8sWTs6sjSywI6QbphaulTfEB7O7nRCrjURPFxKNmsQO
         mYaVTnhSdW3oUGXRs6ByxJJ8th/ZsGm6aBWUOQQ+Jx0h2MoR+4FpjqLuNU0pCWrNbHAI
         KG4kA+k/TPdLD4o3mAUVfawn5rfCihXkWyTqegYuFNpChTpI/258mGaZeArfv9r2+DR3
         iMuUyznB5xfBOeoN48SWwtLBRbNwhL8/WQkc5gZ41Fu32DmhRnhvoElRf+RQ3HvGpvY2
         updQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u83si25664403wmb.83.2019.01.17.01.35.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Jan 2019 01:35:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40295 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gk44y-0003CQ-Bl
	for alex.bennee@linaro.org; Thu, 17 Jan 2019 04:35:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gk44p-0003Bk-Jf
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 04:35:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gk44j-0006EY-PR
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 04:35:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42022)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gk44j-0006Bw-HY; Thu, 17 Jan 2019 04:35:01 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B6CF1C0D18AD;
	Thu, 17 Jan 2019 09:26:01 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-179.brq.redhat.com [10.40.204.179])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DC9F1048117;
	Thu, 17 Jan 2019 09:26:00 +0000 (UTC)
Date: Thu, 17 Jan 2019 10:25:57 +0100
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <shannon.zhaosl@gmail.com>
Message-ID: <20190117092557.ivmyrym7gtyuubky@hawk.localdomain>
References: <20190117030917.18844-1-shannon.zhaosl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190117030917.18844-1-shannon.zhaosl@gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 17 Jan 2019 09:26:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] ARM: GIC: error out early when
 creating VGICv2 failed
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SDWUgd3pZ8no

On Thu, Jan 17, 2019 at 11:09:17AM +0800, Shannon Zhao wrote:
> Currently if creating a gicv2 VM on the platform without
> VGICv2 support, it failed in kvm_arm_pmu_set_irq while
> trying to set the interrupt number for PMU with below
> error message.
> KVM_SET_DEVICE_ATTR failed: Invalid argument
> 
> This error log is a little confused. Also it should error
> out in kvm_arm_gic_realize early.
> 
> Signed-off-by: Shannon Zhao <shannon.zhaosl@gmail.com>
> ---
>  hw/intc/arm_gic_kvm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
> index a611e8e..b4f2133 100644
> --- a/hw/intc/arm_gic_kvm.c
> +++ b/hw/intc/arm_gic_kvm.c
> @@ -554,8 +554,9 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
>                                KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true,
>                                &error_abort);
>          }
> -    } else if (ret != -ENODEV && ret != -ENOTSUP) {
> -        error_setg_errno(errp, -ret, "error creating in-kernel VGIC");
> +    } else if (ret != -ENOTSUP) {
> +        error_setg_errno(errp, -ret, "error creating in-kernel VGIC, maybe "
> +                                     "vGICv2 not support on this platform");

vGICv2 is not supported on this platform

>          return;
>      }
>  
> -- 
> 1.8.3.1
> 
> 

With the error message change

Reviewed-by: Andrew Jones <drjones@redhat.com>
