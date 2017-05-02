Received: by 10.25.0.198 with SMTP id 189csp181672lfa;
        Tue, 2 May 2017 00:56:37 -0700 (PDT)
X-Received: by 10.98.216.134 with SMTP id e128mr30030937pfg.79.1493711797122;
        Tue, 02 May 2017 00:56:37 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s74si16440103pfs.386.2017.05.02.00.56.36;
        Tue, 02 May 2017 00:56:37 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750983AbdEBH4e (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Tue, 2 May 2017 03:56:34 -0400
Received: from mail-wm0-f53.google.com ([74.125.82.53]:38085 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750792AbdEBH4d (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 2 May 2017 03:56:33 -0400
Received: by mail-wm0-f53.google.com with SMTP id r190so10114178wme.1
        for <kvm@vger.kernel.org>; Tue, 02 May 2017 00:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a2A4mA7jo5rLnG+ihoy5Z/b0LRFHzbcp9pbdBmcqQtI=;
        b=VS1B6H+4uZ0aIZgPWoZTqNnp+4uA2q2Dwkdzhs0ELv9U4bB5rU3G32y7Lsti1UIIDa
         oapcipYQ6x/IJYofP1hYMdKjIsEwbuuWcs0htPSY+UvNXG3UmzaurCf38QPqPw4P1WVz
         yJFfN4TDsYOz6P3i99h8E6pcHAbeSVO67d7ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a2A4mA7jo5rLnG+ihoy5Z/b0LRFHzbcp9pbdBmcqQtI=;
        b=Q/kF7vdcoqSYuO+srsFHV5Z8mHa1e+hKk7nADsLNhUeDgSu8/D9Bz+cm1Td3/cvpkS
         9bJ6oE5qUcr+5mq1+MJLRJSnxwgZkLm7xTAaZa8UEWhsrnz9uL7ddI+mJxgSkLyI/nOy
         PYq4H34Z69BlBDwGbG7QdYOdfN93AY8RhT5ygOR4WV6epbDLdM1in6OkdTeqLuqZucim
         BKe8In2oZxCEPHv1i9uIwr7V3q+SL9+4bJd6Sg2u6LRcH9kIdud0uFUPQLU4n+KeHIjx
         LCvDLG7JM35So9R3Ka/uieatTfiSW9Lp66NQqlJBmflaCIOQGYiPI7f5NTz+sCVHl4/h
         UG4w==
X-Gm-Message-State: AN3rC/7StfKMGd+s1xJBB8UK5PRzXLszZJKOPOVrMy5GZz0t+VPJFrYa
        ltvnLl1xRHNvzAQx
X-Received: by 10.80.159.3 with SMTP id b3mr36699edf.5.1493711792402;
        Tue, 02 May 2017 00:56:32 -0700 (PDT)
Received: from localhost (xd93ddc2d.cust.hiper.dk. [217.61.220.45])
        by smtp.gmail.com with ESMTPSA id k17sm8311750eda.61.2017.05.02.00.56.31
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 02 May 2017 00:56:31 -0700 (PDT)
Date:   Tue, 2 May 2017 09:56:31 +0200
From:   Christoffer Dall <cdall@linaro.org>
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     james.morse@arm.com, marc.zyngier@arm.com,
        christoffer.dall@linaro.org, rkrcmar@redhat.com,
        linux@armlinux.org.uk, tbaicar@codeaurora.org, imammedo@redhat.com,
        zhaoshenglong@huawei.com, peter.maydell@linaro.org,
        pbonzini@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
        lersek@redhat.com, ard.biesheuvel@linaro.org, mtsirkin@redhat.com,
        drjones@redhat.com, ben@skyportsystems.com, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        xiexiuqi@huawei.com, wangxiongfeng2@huawei.com,
        songwenjun@huawei.com, wuquanming@huawei.com,
        huangshaoyu@huawei.com
Subject: Re: [PATCH v3 1/3] arm64: kvm: support kvmtool to detect RAS
 extension feature
Message-ID: <20170502075631.GE16940@cbox>
References: <1493530677-4919-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493530677-4919-1-git-send-email-gengdongjiu@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: oKAot0ygicIC

Hi Dongjiu,

Please send a cover letter for patch series with more than a single
patch.

The subject and description of these patches are also misleading.
Hopefully this is in no way tied to kvmtool, but to userspace
generically, for example also to be used by QEMU?

On Sun, Apr 30, 2017 at 01:37:55PM +0800, Dongjiu Geng wrote:
> Handle kvmtool's detection for RAS extension, because sometimes
> the APP needs to know the CPU's capacity

the APP ?

the CPU's capacity?

> 
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
>  arch/arm64/kvm/reset.c   | 11 +++++++++++
>  include/uapi/linux/kvm.h |  1 +
>  2 files changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> index d9e9697..1004039 100644
> --- a/arch/arm64/kvm/reset.c
> +++ b/arch/arm64/kvm/reset.c
> @@ -64,6 +64,14 @@ static bool cpu_has_32bit_el1(void)
>  	return !!(pfr0 & 0x20);
>  }
>  
> +static bool kvm_arm_support_ras_extension(void)
> +{
> +	u64 pfr0;
> +
> +	pfr0 = read_system_reg(SYS_ID_AA64PFR0_EL1);
> +	return !!(pfr0 & 0x10000000);
> +}
> +
>  /**
>   * kvm_arch_dev_ioctl_check_extension
>   *
> @@ -87,6 +95,9 @@ int kvm_arch_dev_ioctl_check_extension(struct kvm *kvm, long ext)
>  	case KVM_CAP_ARM_PMU_V3:
>  		r = kvm_arm_support_pmu_v3();
>  		break;
> +	case KVM_CAP_ARM_RAS_EXTENSION:
> +		r = kvm_arm_support_ras_extension();
> +		break;

You need to document this capability and API in
Documentation/virtual/kvm/api.txt and explain how this works.



>  	case KVM_CAP_SET_GUEST_DEBUG:
>  	case KVM_CAP_VCPU_ATTRIBUTES:
>  		r = 1;
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index f51d508..27fe556 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -883,6 +883,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_PPC_MMU_RADIX 134
>  #define KVM_CAP_PPC_MMU_HASH_V3 135
>  #define KVM_CAP_IMMEDIATE_EXIT 136
> +#define KVM_CAP_ARM_RAS_EXTENSION 137
>  
>  #ifdef KVM_CAP_IRQ_ROUTING
>  
> -- 
> 2.10.1
> 

Thanks,
-Christoffer
