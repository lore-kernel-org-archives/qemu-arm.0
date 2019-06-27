Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1141257wru;
        Thu, 27 Jun 2019 03:53:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwvIUiFVKLh1N3EjRee8/scNfFff5sqzAD9iYaXFF2dE67h3X9mxxiwBp5rHGrbJ/Q1W9Hc
X-Received: by 2002:ac8:3f81:: with SMTP id d1mr2484931qtk.5.1561632809810;
        Thu, 27 Jun 2019 03:53:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561632809; cv=none;
        d=google.com; s=arc-20160816;
        b=tHeDwVI84xDvcpaJalj6GHpoJkV0jq9LswuGcbrSXhHFHaa4am2r1qG3xPqPCpWmzs
         PMI3nnMjEuSNT6um35hrQn4CRYh1FAAnOBzbjCdKn3g+pGqQXX3F6L/h0MREpKQ5xuE1
         1MpqJ6A346Aw4EEkiRVfTQLY+1dOWp6ade/lW0utNWAZoluYntKUsM/qM5lpNpYpbGXj
         Hsswx7aicvfLTIb7Xx1B2hRM5km9vLrkYpFloo/5dZg5PAooblDxJQjCuTlg7eNwO1zF
         4cTazddOgygnfCkdf+8nU5l7HaUBIe4z+jHmB0KxY6ZlQCLHz87HR5I5xR86NlKDIY8W
         XUXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=sW+hUnc9XrcuWeoINy5XAW2td/DWiJ0T+ECDVHrY1qo=;
        b=KWOzce5DN1nxi4wu/KibpGjMyAY2Jys/at05YzZ4cmkkhXt4hdsmkJ1scUmsWUVvRV
         vaaCVErRhLISWpchkCvmUx8QRah4TBcB8apliM49WKV5cyyJIkAqkPbRfKlGlbCO/GA+
         0IpDeoMmCs/rdg9AuiIHV7++Xv6oKznBM3RJFnCS1/rOTqSKP6+G6a3xffnJAUE6OWAj
         7Zha+rc8hsUjR2jFDTT80uV/3IQo39p7LvOxFQdFBm1P2A9iSotdS8a0oaudkxNWsdo1
         HHDOs5l3OEix/Hza9cxKz56Ya8ZI7uU0lwl12rXGgRn+JKJqDj7TT+udDAe0v5KodCY+
         NcKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id b4si1195810qvv.160.2019.06.27.03.53.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 03:53:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A30E30BDE4B;
	Thu, 27 Jun 2019 10:53:22 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60F195C241;
	Thu, 27 Jun 2019 10:53:17 +0000 (UTC)
Date: Thu, 27 Jun 2019 12:53:15 +0200
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, armbru@redhat.com,
	imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v2 12/14] target/arm/kvm: scratch vcpu:
 Preserve input kvm_vcpu_init features
Message-ID: <20190627105315.j56kc4uqc765lf36@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-13-drjones@redhat.com>
 <40326319-4f1a-019e-1cb7-840a011ed8b4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40326319-4f1a-019e-1cb7-840a011ed8b4@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Thu, 27 Jun 2019 10:53:29 +0000 (UTC)
X-TUID: tdl1S+KGzLI9

On Thu, Jun 27, 2019 at 09:30:57AM +0200, Auger Eric wrote:
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

Indeed, we could copy the features into 'preferred', in case KVM starts to
do something with them. Based on that KVM comment, though, it looks like
we'd need to make other changes as well to QEMU at that time. Some sort
of feature matching/filtering code. It probably makes sense to do all that
at once, when/if that time comes.

> 
> > +        }
> > +    }
> >      if (ret >= 0) {
> >          ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
> >          if (ret < 0) {
> > @@ -96,10 +103,12 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
> >           * creating one kind of guest CPU which is its preferred
> >           * CPU type.
> >           */
> > +        struct kvm_vcpu_init try;
> > +
> >          while (*cpus_to_try != QEMU_KVM_ARM_TARGET_NONE) {
> > -            init->target = *cpus_to_try++;
> > -            memset(init->features, 0, sizeof(init->features));
> > -            ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
> > +            try.target = *cpus_to_try++;
> > +            memcpy(try.features, init->features, sizeof(init->features));
> > +            ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, &try);
> >              if (ret >= 0) {
> >                  break;
> >              }
> > @@ -107,6 +116,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
> >          if (ret < 0) {
> >              goto err;
> >          }
> > +        init->target = try.target;
> >      } else {
> >          /* Treat a NULL cpus_to_try argument the same as an empty
> >           * list, which means we will fail the call since this must
> > diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> > index 51f78f722b18..d007f6bd34d7 100644
> > --- a/target/arm/kvm32.c
> > +++ b/target/arm/kvm32.c
> > @@ -54,7 +54,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
> >          QEMU_KVM_ARM_TARGET_CORTEX_A15,
> >          QEMU_KVM_ARM_TARGET_NONE
> >      };
> > -    struct kvm_vcpu_init init;
> > +    /*
> > +     * target = -1 informs kvm_arm_create_scratch_host_vcpu()
> > +     * to use the preferred target
> > +     */
> > +    struct kvm_vcpu_init init = { .target = -1, };
> >  
> >      if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
> >          return false;
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index 9fc7f078cf68..2821135a4d0e 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -502,7 +502,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
> >          KVM_ARM_TARGET_CORTEX_A57,
> >          QEMU_KVM_ARM_TARGET_NONE
> >      };
> > -    struct kvm_vcpu_init init;
> > +    /*
> > +     * target = -1 informs kvm_arm_create_scratch_host_vcpu()
> > +     * to use the preferred target
> > +     */
> > +    struct kvm_vcpu_init init = { .target = -1, };
> >  
> >      if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
> >          return false;
> > 
> 
> Besides
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>

Thanks,
drew 
