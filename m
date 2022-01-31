Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2341156lfk;
        Mon, 31 Jan 2022 08:03:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwiSfZ20Fbv7R49h2YzfybDUnBRwR6FyqAb5nwXDpJUgph8+geXMBYuTMCVVYI/D63dQAb8
X-Received: by 2002:a4a:cb98:: with SMTP id y24mr10499462ooq.24.1643645013437;
        Mon, 31 Jan 2022 08:03:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643645013; cv=none;
        d=google.com; s=arc-20160816;
        b=R6zFQZvAdXnyzC3/9Dstlu4SLlQXToc8CrrvCYcV0HZF6/ALsHxST7RQtd3BacyAtS
         HgDv22p5Dz5ZERI5ScOj2il41WzKJtKmDaN2RgigMN2Chh2Ln6nP/6pTHwWQvir2EZ61
         BF/0zSzzplnIev6y+alO7cwAH/BIJXxvyp8IwbrtVa2hewD0Y4gsOhOvtUQz/jZe2tGk
         Nu7IyPaIyIs9VehXgLCVdoMOsN7GwCUvxJrlglHmcyj5C/64MgvxJH0RpAiCCK+QVUmG
         iVFEEvWxAM5GUZfyORe+I1Df7WGTjxkg26xqdcSYbjpJVNrttbUiMOtFYej9VnxwOmAy
         wVmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=NZU1iHaiSTkaMqH8QBAwfDGqj3RCD8y2Zin05CM4oys=;
        b=S3rYi9Douf21S0jTj/chsO2IIynpQH5BoHKPw2gwLLefmzU4gbEXP9ZhFbRTy8YEDh
         xMhLqEfQLVaUIGqrAiD4zQvFPF1Il/d4uLeOdyspLA3Dnlg07fGMxsFBLQq/M0OB6QQi
         MS+sdZVFfZddLvSRzwHFkuvsoPPoLhgFEXf64qeveFHMM3iZkuqjOilzF8PVtEFpaDCk
         lLLQo7gZDM7CPTH2/idzhVIirDPm8pCMCi2QVQw3hRmqiVHhd9glAN4mx9Gl7e2LKApp
         Ep6Jf0Eu+8VTDenEmq3NUWHxNf0MzqVnyUQvAaPsQf83uqXgtbFBZ6AYtc1XCVVA3z3X
         NtRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AMwJLs1o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q20si1340241vsl.219.2022.01.31.08.03.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jan 2022 08:03:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AMwJLs1o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nEZ9Q-0006yZ-Ki
	for alex.bennee@linaro.org; Mon, 31 Jan 2022 11:03:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nEYzU-0006we-Ar
 for qemu-arm@nongnu.org; Mon, 31 Jan 2022 10:53:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nEYzS-0003Gx-Bg
 for qemu-arm@nongnu.org; Mon, 31 Jan 2022 10:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643644393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NZU1iHaiSTkaMqH8QBAwfDGqj3RCD8y2Zin05CM4oys=;
 b=AMwJLs1o2+Dr49VSJquOnyvCzHdWZgbrYsPwTIsYvJyIn98tRJzlGCkEzvHunhczJzw3vT
 XRioIHV8CA5X8K0lt+gvuA4mFa1CEZqzx1culoN3aFaZ5/NyO/LuVKuPa7S71rCNQBTZAZ
 l4V1pVzd7JMKx3Etk3PZ7UXULjhB7C0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-6G0h9B6CPx2C_qfv6j39tQ-1; Mon, 31 Jan 2022 10:53:06 -0500
X-MC-Unique: 6G0h9B6CPx2C_qfv6j39tQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 l16-20020aa7c3d0000000b004070ea10e7fso7120178edr.3
 for <qemu-arm@nongnu.org>; Mon, 31 Jan 2022 07:53:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NZU1iHaiSTkaMqH8QBAwfDGqj3RCD8y2Zin05CM4oys=;
 b=nakCVDMqW+rTc4cQFtrQ5dEAWdxatLuJYyg878ac5O9y6+x/80gNOal52oqOLMtEyC
 sSPYYWiZCfe5GSW6xnJCVreLKoBZ36GLFJ9GtdCX7DYt+7nS1RGv5Q8wVzvmhSS6/79+
 3M9B834C+TOcKNCF37BbfX7c0kh2zXSILwqGd5BlmTV9escIyQFH4MFoydaFVJygJRk3
 ACBOch0D6fKLO6gERTXPBzyAc2/hGJ1lPb1EmVREPBfVwyfNyQMbiVAyrEGSJPO4suCX
 x+iGZdD5thP7dBeSo45CSjTmgIES8K3MyK3sp80wKOXLwZx8Tzl6OdnVop6eAIlwtPsv
 PuqQ==
X-Gm-Message-State: AOAM531zqQWimtje9w8pFM4sD9Q0HKmllwBU+g39OiJ0FNnY06Gyj2Kg
 v9YE7kEKNp6+xZyUrkNEhdRZLo4W5srzcRf5azBsJhmLeLrQxqENQaZTFeox4U2K4FdfSo5kt/x
 uTJt2s8A9JLTy
X-Received: by 2002:a05:6402:440c:: with SMTP id
 y12mr21166595eda.75.1643644385211; 
 Mon, 31 Jan 2022 07:53:05 -0800 (PST)
X-Received: by 2002:a05:6402:440c:: with SMTP id
 y12mr21166572eda.75.1643644385013; 
 Mon, 31 Jan 2022 07:53:05 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id d3sm7694772edq.13.2022.01.31.07.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 07:53:04 -0800 (PST)
Date: Mon, 31 Jan 2022 16:53:02 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 1/2] hw/arm/virt: Fix gic-version=max when
 CONFIG_ARM_GIC_TCG is unset
Message-ID: <20220131155302.ud4kzxxi27zky4jn@gator>
References: <20220131154531.429533-1-eric.auger@redhat.com>
 <20220131154531.429533-2-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220131154531.429533-2-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 f4bug@amsat.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 pbonzini@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 70Qy1tya+XQs

On Mon, Jan 31, 2022 at 04:45:30PM +0100, Eric Auger wrote:
> In TCG mode, if gic-version=max we always select GICv3 even if
> CONFIG_ARM_GIC_TCG is unset. We shall rather select GICv2.
> This also brings the benefit of fixing qos tests errors for tests
> using gic-version=max with CONFIG_ARM_GIC_TCG unset.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Fixes: a8a5546798c3 ("hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig selector")
> ---
>  hw/arm/virt.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 141350bf21..2f1d4d0230 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1852,7 +1852,11 @@ static void finalize_gic_version(VirtMachineState *vms)
>          vms->gic_version = VIRT_GIC_VERSION_2;
>          break;
>      case VIRT_GIC_VERSION_MAX:
> +#ifdef CONFIG_ARM_GIC_TCG
>          vms->gic_version = VIRT_GIC_VERSION_3;
> +#else
> +        vms->gic_version = VIRT_GIC_VERSION_2;
> +#endif
>          break;
>      case VIRT_GIC_VERSION_HOST:
>          error_report("gic-version=host requires KVM");
> -- 
> 2.26.3
>

Why is the config generically named "ARM_GIC_TCG" when it only controls
Arm GICV3 TCG?

Otherwise,

Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew

