Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp491181lfb;
        Wed, 11 Nov 2020 07:06:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCQQv/4wCQjQT+9lqezs85ssZwHEdgKLjS27ZPW0/C2exRcQCmtRsU3ME71DvTnxr2n8q3
X-Received: by 2002:a5b:4c2:: with SMTP id u2mr26037617ybp.39.1605107207596;
        Wed, 11 Nov 2020 07:06:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605107207; cv=none;
        d=google.com; s=arc-20160816;
        b=Z02kLSzijsU45L+ynKAhfols5dT0oMiJrNCMdA3WYCfO1RDHhuYW3q/jy67MoqGEuz
         ti66VgicFHJaFETdI6cn7GfX6rwW3gOEyXl0+HT7yDdQ4QfXc89fHBfB+EBO6pX/Euj2
         1aI+Q4sh7YW+pXyOkyW/teHCnEcxNNVtiGqI8SJ2M76AiTAeub4l0BGvT8cLHm1O/VaZ
         6yy1cMKSyP8lCTnKn2OXgidmy/hb3ZzOot1Qicdj6i+bUf/I+55ZE+tR3Z10GF37CzMU
         FkwRrxJw4Rk1Hk3jvQNEkss+PGqjtdgB+xWOcCXrvovnB+3CGQgz6GR3q/EvbMig8aP2
         DcRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :thread-index:thread-topic:mime-version:subject:references
         :in-reply-to:message-id:to:from:date:dkim-signature;
        bh=YFGgGHziEt4AmBZM7aYh7Cp620vy9zCDQSjSYRXHluo=;
        b=y/spTKh8ok7M5zRm1NrG7i4mGfkNrUV1L9+gqza6Zi67nt+6pA0SdPViIbTzZ9VYff
         ZUFDabXjFSnPDZo7QsaNcjwV6cq8o31WdqwrgM0RliyFmUH4EzhVDXt/+/l6M7CL0uzk
         ho/vRDQf3hMScwIhDlm9WW0WMMAhly1WMAasImIrVJr+/bIwcwfECU5sf5RJk2g/iRm0
         0We+nyRfntAhQWA9EDiGy2JkXeBHQXcYlxGcBvZE+MK+EYZ5BOcBKSLdO9suLcivWprl
         VqCFYECqzbITBhAQJLUNm6yogm1srV/gt2ZqGi1IrlyKsC0NgouxJOyM0qXHRHqpCoeM
         lvwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YEtwXAtG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 197si2126464ybc.33.2020.11.11.07.06.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Nov 2020 07:06:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YEtwXAtG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcrhv-0007TD-0N
	for alex.bennee@linaro.org; Wed, 11 Nov 2020 10:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kcrho-0007Ra-2A
 for qemu-arm@nongnu.org; Wed, 11 Nov 2020 10:06:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kcrhm-0007mW-Cw
 for qemu-arm@nongnu.org; Wed, 11 Nov 2020 10:06:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605107197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YFGgGHziEt4AmBZM7aYh7Cp620vy9zCDQSjSYRXHluo=;
 b=YEtwXAtGPmGm77kmhQWqIJqrzX1GT4pprU4nr8EDp3eJPClTFas8M324CvLRI1lFPkGmKq
 DLpPDYfKz+A+tzNNkySb8ea94kS6CNJG743uw1yjW1+fRa+oUC3MP2TMjA8zzMLwUwQ+Fp
 tZJR//+TV7JqSV9weA/lVwoHf80DFDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-ELv4Wna7PMq-HjZPi8yAnQ-1; Wed, 11 Nov 2020 10:05:26 -0500
X-MC-Unique: ELv4Wna7PMq-HjZPi8yAnQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E00951E5C82;
 Wed, 11 Nov 2020 15:05:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6C9227BAE;
 Wed, 11 Nov 2020 15:05:25 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id B6A9958100;
 Wed, 11 Nov 2020 15:05:25 +0000 (UTC)
Date: Wed, 11 Nov 2020 10:05:25 -0500 (EST)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1888391810.22919498.1605107125694.JavaMail.zimbra@redhat.com>
In-Reply-To: <20201111143440.112763-1-drjones@redhat.com>
References: <20201111143440.112763-1-drjones@redhat.com>
Subject: Re: [PATCH] hw/arm/virt: ARM_VIRT must select ARM_GIC
MIME-Version: 1.0
X-Originating-IP: [10.40.192.178, 10.4.195.27]
Thread-Topic: hw/arm/virt: ARM_VIRT must select ARM_GIC
Thread-Index: JuozD2lwYiGtkrz8S11rhaXPScxz3A==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fmOgl7cODdfM

----- Original Message -----
> From: "Andrew Jones" <drjones@redhat.com>
> To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
> Cc: "peter maydell" <peter.maydell@linaro.org>, philmd@redhat.com, "Miroslav Rezanina" <mrezanin@redhat.com>
> Sent: Wednesday, November 11, 2020 3:34:40 PM
> Subject: [PATCH] hw/arm/virt: ARM_VIRT must select ARM_GIC
> 
> The removal of the selection of A15MPCORE from ARM_VIRT also
> removed what A15MPCORE selects, ARM_GIC. We still need ARM_GIC.
> 
> Fixes: bec3c97e0cf9 ("hw/arm/virt: Remove dependency on Cortex-A15 MPCore
> peripherals")
> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 7d022eeefdbc..e69a9009cf0a 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -6,6 +6,7 @@ config ARM_VIRT
>      imply VFIO_PLATFORM
>      imply VFIO_XGMAC
>      imply TPM_TIS_SYSBUS
> +    select ARM_GIC
>      select ACPI
>      select ARM_SMMUV3
>      select GPIO_KEY
> --
> 2.26.2
> 
> 

Problems with missing dependencies solved by this patch.

Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>

-- 
Miroslav Rezanina
Software Engineer - Virtualization Team Maintainer

