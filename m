Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp960664wru;
        Thu, 27 Jun 2019 00:31:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxWFio1KDUvkJfzsHNS0aOflJy44vYxMHYBZlJI9kzOxZXKbXLbp9aGOIn7hqCE1gkCJv7x
X-Received: by 2002:a05:620a:10bc:: with SMTP id h28mr1961179qkk.289.1561620671839;
        Thu, 27 Jun 2019 00:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561620671; cv=none;
        d=google.com; s=arc-20160816;
        b=icHPC9haJioG2NPWJjGYRia1lvSf34MLSaJwBicI9Synt9KrOGkxDTQaOBY5NYYOCw
         /UR5m/Vhog9IgIPwUgnLEfHa05MjEBhXRg3HjXGt40++6mpZPmKtjTjYs7gRAnGTQnM+
         q6cOf/kKpuh9xdeUGe1PdfvE3bMO4gd/RJHYDIjMPDMNXdt3EdCx9CwN3K45Of1VYtSH
         zSROoajFsLYHAozwZCaVMZfJ5aDLEEmrXaCjMRjGegklvgoPVYc5q2LRKBKOD2WrrBSn
         u6rhbCxGVbWq4yopH6CFCgNOrYKVDale1ZdE/UG9tx2b52kheMnZ/XOT3/idW0qQRUtJ
         DFqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=nFK/xyBhQInt4y1PLgF09Qw2cILHE1+rIsVE0x2TSmk=;
        b=xPqJhCGfKWMJiU1LQOkN4usaBknHwkzcNYgZVTeh2xIjk8BH57f6gGo9eSAyn1Xp97
         HvqMjEe5DRVTZx6CwWk+PLk/zWXtGifBL63ZmV2BrXb5pMCDIU/6llh7HaE/PJt5f56Y
         sGmNib13rxlPuN80wWj8kIIGIDyGW9/aEdpc+AB4bIqZzPS9dJg3EqCW9dY02rZXS6Cl
         SmKc/gH9KqLkWCOI8lXqgf/RlxFqGlv/VxXqdA8qiIZg65HKJqq5LtZ6/+EgSbjLJU4H
         qtWIrYoZERcD5Hyf0GHUTBPPSWkfASdabUCk9aFPUFVIDSK/XDw77DLzW4P5RQI61kfg
         1ifA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id n36si1111418qtb.332.2019.06.27.00.31.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 00:31:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CB4C73082E64;
	Thu, 27 Jun 2019 07:31:03 +0000 (UTC)
Received: from [10.36.116.89] (ovpn-116-89.ams2.redhat.com [10.36.116.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2428319C68;
	Thu, 27 Jun 2019 07:30:58 +0000 (UTC)
Subject: Re: [PATCH v2 12/14] target/arm/kvm: scratch vcpu: Preserve input
 kvm_vcpu_init features
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, armbru@redhat.com, eblake@redhat.com,
 Dave.Martin@arm.com, imammedo@redhat.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-13-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <40326319-4f1a-019e-1cb7-840a011ed8b4@redhat.com>
Date: Thu, 27 Jun 2019 09:30:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-13-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 27 Jun 2019 07:31:10 +0000 (UTC)
X-TUID: povVLIznkHDW

Hi Drew,

On 6/21/19 6:34 PM, Andrew Jones wrote:
> kvm_arm_create_scratch_host_vcpu() takes a struct kvm_vcpu_init
> parameter. Rather than just using it as an output parameter to
> pass back the preferred target, use it also as an input parameter,
> allowing a caller to pass a selected target if they wish and to
> also pass cpu features. If the caller doesn't want to select a
> target they can pass -1 for the target which indicates they want
> to use the preferred target and have it passed back like before.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/kvm.c   | 20 +++++++++++++++-----
>  target/arm/kvm32.c |  6 +++++-
>  target/arm/kvm64.c |  6 +++++-
>  3 files changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 60645a196d3d..66c0c198604a 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -64,7 +64,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>                                        int *fdarray,
>                                        struct kvm_vcpu_init *init)
>  {
> -    int ret, kvmfd = -1, vmfd = -1, cpufd = -1;
> +    int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
>  
>      kvmfd = qemu_open("/dev/kvm", O_RDWR);
>      if (kvmfd < 0) {
> @@ -84,7 +84,14 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>          goto finish;
>      }
>  
> -    ret = ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, init);
> +    if (init->target == -1) {
> +        struct kvm_vcpu_init preferred;
> +
> +        ret = ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, &preferred);
> +        if (!ret) {
> +            init->target = preferred.target;
wouldn't it be safe to copy the whole struct. Kernel code says:
        /*
         * For now, we don't return any features.
         * In future, we might use features to return target
         * specific features available for the preferred
         * target type.
         */

> +        }
> +    }
>      if (ret >= 0) {
>          ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
>          if (ret < 0) {
> @@ -96,10 +103,12 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>           * creating one kind of guest CPU which is its preferred
>           * CPU type.
>           */
> +        struct kvm_vcpu_init try;
> +
>          while (*cpus_to_try != QEMU_KVM_ARM_TARGET_NONE) {
> -            init->target = *cpus_to_try++;
> -            memset(init->features, 0, sizeof(init->features));
> -            ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
> +            try.target = *cpus_to_try++;
> +            memcpy(try.features, init->features, sizeof(init->features));
> +            ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, &try);
>              if (ret >= 0) {
>                  break;
>              }
> @@ -107,6 +116,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>          if (ret < 0) {
>              goto err;
>          }
> +        init->target = try.target;
>      } else {
>          /* Treat a NULL cpus_to_try argument the same as an empty
>           * list, which means we will fail the call since this must
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index 51f78f722b18..d007f6bd34d7 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -54,7 +54,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          QEMU_KVM_ARM_TARGET_CORTEX_A15,
>          QEMU_KVM_ARM_TARGET_NONE
>      };
> -    struct kvm_vcpu_init init;
> +    /*
> +     * target = -1 informs kvm_arm_create_scratch_host_vcpu()
> +     * to use the preferred target
> +     */
> +    struct kvm_vcpu_init init = { .target = -1, };
>  
>      if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
>          return false;
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 9fc7f078cf68..2821135a4d0e 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -502,7 +502,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          KVM_ARM_TARGET_CORTEX_A57,
>          QEMU_KVM_ARM_TARGET_NONE
>      };
> -    struct kvm_vcpu_init init;
> +    /*
> +     * target = -1 informs kvm_arm_create_scratch_host_vcpu()
> +     * to use the preferred target
> +     */
> +    struct kvm_vcpu_init init = { .target = -1, };
>  
>      if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
>          return false;
> 

Besides

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
