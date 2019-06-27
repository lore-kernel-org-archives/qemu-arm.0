Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1148667wru;
        Thu, 27 Jun 2019 04:01:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwj67jvVmClWxb7hn4b7QUr6UGA6n/hqVtQMU5EWhuX2N2VsF5peCcdUfVwWnI629Nlu2uC
X-Received: by 2002:a17:906:4555:: with SMTP id s21mr2493958ejq.199.1561633318245;
        Thu, 27 Jun 2019 04:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561633318; cv=none;
        d=google.com; s=arc-20160816;
        b=pISciC4w5cEMZyLaGXNcuOsICoa4MEF1r3f5C5uh4DWOPnGRZhzRr3vWCL28RX6HDm
         HIYMeFc5TO7cWqMkGefaXvECo3F92XBwKhBEfwhhjCz0P7Mu3pSSsibF1BFi7oQ5ImBm
         g93Y+kaC6zEzyoY9v04LJ/bn0i3YBRgYUyqlIsMHs3X5BUGngoCuNotcikDHYNyNl9we
         hlCY/JkAa2o86sRmGxYoab8l0MtFgkXwiYOPIbaiiDvCQlIZu0eCj+3XM5A07ZBVOBMb
         wAbmNk8VZlgcKQVKUdn2b95h6S4P+YYORKGd2KAEccYv8OueY4tHNGpErVfhkPBgvprf
         wHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=lc6dwqaRVQSHgMkAaTtxOcsE6t5E0bodVEQicfO2gKA=;
        b=vM6PHh3rsZuolzRgNBhQ8vmaHCkks2xPplRWASPnKrgRES5+nGQF6rQ0Ki/0Gjh36a
         4HjBVaGk/gSMDah1f3fkPJtYY/YBVXjlaMUJ2d5OtA6zwFqFaPdskPsdzA9XLQNoYvU0
         Rp7DkWpqYb/xjGfjYvdjTo4E22Dv4wkBUstd/BdxNZXDqesU+qHXL1TO8T9iu5hnJpHo
         ZaiVWMUtXAXKj0tQJY9udD4cZ1KEkxNtOr0ITTCYj27fFP/bXS2+6NuR2XE2bUeOhfG1
         IkKVK6ftmJOupeFx+gewirE9zurEgmi/UpNhosL5w9PWc3rJO6lTJ8DycV4EhqKdmiWM
         pH/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.110.172])
        by mx.google.com with ESMTP id b33si1481700eda.75.2019.06.27.04.01.57;
        Thu, 27 Jun 2019 04:01:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) client-ip=217.140.110.172;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54E6A2B;
	Thu, 27 Jun 2019 04:01:57 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E9B3C3F718;
	Thu, 27 Jun 2019 04:01:55 -0700 (PDT)
Date: Thu, 27 Jun 2019 12:01:53 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Auger Eric <eric.auger@redhat.com>
Cc: Andrew Jones <drjones@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"eblake@redhat.com" <eblake@redhat.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Subject: Re: [PATCH v2 12/14] target/arm/kvm: scratch vcpu: Preserve input
 kvm_vcpu_init features
Message-ID: <20190627110153.GE2790@e103592.cambridge.arm.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-13-drjones@redhat.com>
 <40326319-4f1a-019e-1cb7-840a011ed8b4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40326319-4f1a-019e-1cb7-840a011ed8b4@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: +xLMnS9Cmjsf

On Thu, Jun 27, 2019 at 08:30:57AM +0100, Auger Eric wrote:
> Hi Drew,
> 
> On 6/21/19 6:34 PM, Andrew Jones wrote:
> > kvm_arm_create_scratch_host_vcpu() takes a struct kvm_vcpu_init
> > parameter. Rather than just using it as an output parameter to
> > pass back the preferred target, use it also as an input parameter,
> > allowing a caller to pass a selected target if they wish and to
> > also pass cpu features. If the caller doesn't want to select a
> > target they can pass -1 for the target which indicates they want
> > to use the preferred target and have it passed back like before.
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  target/arm/kvm.c   | 20 +++++++++++++++-----
> >  target/arm/kvm32.c |  6 +++++-
> >  target/arm/kvm64.c |  6 +++++-
> >  3 files changed, 25 insertions(+), 7 deletions(-)
> > 
> > diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> > index 60645a196d3d..66c0c198604a 100644
> > --- a/target/arm/kvm.c
> > +++ b/target/arm/kvm.c
> > @@ -64,7 +64,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
> >                                        int *fdarray,
> >                                        struct kvm_vcpu_init *init)
> >  {
> > -    int ret, kvmfd = -1, vmfd = -1, cpufd = -1;
> > +    int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
> >  
> >      kvmfd = qemu_open("/dev/kvm", O_RDWR);
> >      if (kvmfd < 0) {
> > @@ -84,7 +84,14 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
> >          goto finish;
> >      }
> >  
> > -    ret = ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, init);
> > +    if (init->target == -1) {
> > +        struct kvm_vcpu_init preferred;
> > +
> > +        ret = ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, &preferred);
> > +        if (!ret) {
> > +            init->target = preferred.target;
> wouldn't it be safe to copy the whole struct. Kernel code says:
>         /*
>          * For now, we don't return any features.
>          * In future, we might use features to return target
>          * specific features available for the preferred
>          * target type.
>          */

Marc or Christoffer should preferably comment on this.

I think the spirit of the ABI is that can use the whole return of
KVM_ARM_PREFERRED_TARGET as a reasonable template for KVM_VCPU_INIT
without it blowing up in your face.

I initially tried to report SVE as available through this route,
but we decided against it precisely because userspace might be doing
the above.

[...]

Cheers
---Dave
