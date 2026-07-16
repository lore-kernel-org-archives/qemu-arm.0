Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11C0C44514
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Jul 2026 20:55:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkT6W-0002t7-AB; Thu, 16 Jul 2026 16:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wkT6T-0002qZ-P7
 for qemu-arm@nongnu.org; Thu, 16 Jul 2026 16:54:45 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wkT6R-0000Mc-Sz
 for qemu-arm@nongnu.org; Thu, 16 Jul 2026 16:54:45 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-84a652535dcso1694899b3a.3
 for <qemu-arm@nongnu.org>; Thu, 16 Jul 2026 13:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784235282; x=1784840082; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=HhLYnr/qR2b4y0zZ+sDHUxX9VDtn3ie68FSiMVa5FBY=;
 b=h/Vd7Vdu6m7B/C3FnzmX1sDbHAPaBJZi+03GXPvPX+gLwCYhbxigmNDSO+7NB+dGio
 qVoTcuQERb15WPdzbXUn4Mg24If3lWVhfyfTfaiHGhWKY2eCAVwPbi+BdqIX643/8kD/
 HaGMEZL21hUtDrLlIrE5YciSCwp+Y7g87F+K8nTe+suUA6GBU6O1SUUlwU7oO7ThIbS3
 IeidHPZiMTMEcbsjaCftYLqRmRvnd6VuEuHsICdZr60i8ySYZhNsOUke6YpC9rLw09rg
 YbtLcTM+7MddhPa8prsdTaWqBZjY1528bgfZpl8FpZxsFDsA3I14PquuI122wBLXSFrj
 8dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784235282; x=1784840082;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=HhLYnr/qR2b4y0zZ+sDHUxX9VDtn3ie68FSiMVa5FBY=;
 b=jKKbtQkFE3IpQSLwaOSVgBUHfaai5/JzKMpS7HPqgUm9jwLfI2bI3xW0Z6ZXzZ13uH
 2CO8fGZpWqXvd8huia8c/SyP9nkBLYZ9117f4Ke22wHXMcOofZJFrAjHWF6KbobmC2dP
 bUmppCoyptEVJ9sqCOTPrgzV1i1wtpyQ0RQaJHO6pfcGQgbYpEJNZPb9qqRhaIuSPcTR
 Js0/npQ0SGvm3fW25UuYS7M7b1G9H+4blpwp+YtodK6BCOq8iBGuRca6fiwq3hSApwui
 Llcd4GGbuNl6ySHAldAK3nuNLd1GI+nr1TTajg1aCdYOtiip1qZuLcXScG62GZdyjf/P
 uR6g==
X-Forwarded-Encrypted: i=1;
 AHgh+RqhmkvScMjA1Ky5HJpz/Jf1Dm0uCJ6QVUjlG+RpP7TM7yxQkdagGlUZl5riBZ1iBg9v42cxn9wadQ==@nongnu.org
X-Gm-Message-State: AOJu0YzMN2+xba7XGzQZ9C7G5czrm18YrXiepguURypEjZpy2ePe4zIP
 jB5nJLvibYkrtJSSezGMb848kITVg10q/SoPte7N2Z7LHl9PZuQkGNR3w43RUGmqZes=
X-Gm-Gg: AfdE7cn+UoMGIYRxEDGKbCy3KsgT4SPti7KuvgJBl33XdPuYLMy7nUreedMNG0NsYzy
 MpSIUBdBSCmCMyUrbE3gfLcwpmxzqPp8I9kMPaVzfjlhXEeR6QlpZPQ9whNrqZTAicVME8Yklhs
 OXbPm0cmRaT3F4Agt8JGtZD2yRz80UIRreYuMsNOqZO1J/1qFH/WSEhUYqQ1VY42z4E5XJZQ9pr
 4CWmI70ug/elkJrUVDh8segJ/Cx6rl/UUYhnLnpMG7tom5cekPql5J8myAbiQuY6O8w0z+8ri8Q
 R9LvkwdcVVzCWPbJAue27UQ6AQ4z3ll6Fn9ZXPExeANpK9dSLLe/9xBcst+xvMQSWS3ni80ceV/
 luqL7Y8gw7+5kFREnGryGV9upKLspXv9zHo6m+hUUI5/ZXAiz3Ch/WmTHUQqsDwG9EPmlT0thPH
 fD8uRzTg==
X-Received: by 2002:a05:6a00:3a01:b0:848:75a1:a0fa with SMTP id
 d2e1a72fcca58-84a6738bde1mr8608393b3a.67.1784235282318; 
 Thu, 16 Jul 2026 13:54:42 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:bc13:5578:20b0:9bee])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84a4f7dc8e7sm5302307b3a.47.2026.07.16.13.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 13:54:41 -0700 (PDT)
Date: Thu, 16 Jul 2026 14:54:39 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Gavin Shan <gshan@redhat.com>
Cc: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, jpb@kernel.org,
 lorenzo.pieralisi@linaro.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: Re: [RFC v1 07/25] target/arm/kvm: Create scratch Realm VM when
 requested
Message-ID: <allFD6P0162v4Dcp@p14s>
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
 <20260707224306.1202330-8-mathieu.poirier@linaro.org>
 <ac26ac91-6809-4429-9750-e7d671e952bc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac26ac91-6809-4429-9750-e7d671e952bc@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, Jul 13, 2026 at 03:30:31PM +1000, Gavin Shan wrote:
> On 7/8/26 8:42 AM, Mathieu Poirier wrote:
> > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > 
> > When a Realm is requested, create a scratch Realm VM by setting bit 8
> > of the argument given to the KVM_CREATE_VM ioctl().  Bit 7-0 are reserved
> > for the guest PA size.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >   target/arm/kvm-rme.c  | 8 ++++++++
> >   target/arm/kvm-stub.c | 5 +++++
> >   target/arm/kvm.c      | 4 +++-
> >   target/arm/kvm_arm.h  | 8 ++++++++
> >   4 files changed, 24 insertions(+), 1 deletion(-)
> > 
> > diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> > index 90c1d30ba24c..f763d5ed6199 100644
> > --- a/target/arm/kvm-rme.c
> > +++ b/target/arm/kvm-rme.c
> > @@ -99,3 +99,11 @@ void kvm_arm_rme_vcpu_init(ARMCPU *cpu)
> >       cpu->kvm_rme = true;
> >   }
> > +
> > +int kvm_arm_rme_vm_type(void)
> > +{
> > +    if (rme_guest) {
> > +        return KVM_VM_TYPE_ARM_REALM;
> > +    }
> > +    return 0;
> > +}
> 
> We had official name for 0, which is KVM_VM_TYPE_ARM_NORMAL. Another question if
> it's worthwhile to have this helper since it's equivalent to something as below,
> which can be directly applied to the caller.
> 
> 
>     int vm_type = (current_machine && current_machine->cgs) ? KVM_VM_TYPE_ARM_REALM :
>                                                               KVM_VM_TYPE_ARM_NORMAL;
>

Addressed.
 
> 
> > diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
> > index 4ab6f08637d1..6d52f172c5df 100644
> > --- a/target/arm/kvm-stub.c
> > +++ b/target/arm/kvm-stub.c
> > @@ -129,3 +129,8 @@ void kvm_arm_rme_vcpu_init(ARMCPU *cpu)
> >   {
> >       g_assert_not_reached();
> >   }
> > +
> > +int kvm_arm_rme_vm_type(void)
> > +{
> > +    g_assert_not_reached();
> > +}
> > diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> > index 4c212ed0c337..6aa1cd04e484 100644
> > --- a/target/arm/kvm.c
> > +++ b/target/arm/kvm.c
> > @@ -108,6 +108,7 @@ bool kvm_arm_create_scratch_host_vcpu(int *fdarray,
> >   {
> >       int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
> >       int max_vm_pa_size;
> > +    int vm_type;
> >       kvmfd = qemu_open_old("/dev/kvm", O_RDWR);
> >       if (kvmfd < 0) {
> > @@ -117,8 +118,9 @@ bool kvm_arm_create_scratch_host_vcpu(int *fdarray,
> >       if (max_vm_pa_size < 0) {
> >           max_vm_pa_size = 0;
> >       }
> > +    vm_type = kvm_arm_rme_vm_type();
> >       do {
> > -        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> > +        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size | vm_type);
> >       } while (vmfd == -1 && errno == EINTR);
> >       if (vmfd < 0) {
> >           goto err;
> > diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> > index 12ed1eee18b4..65ec1b970606 100644
> > --- a/target/arm/kvm_arm.h
> > +++ b/target/arm/kvm_arm.h
> > @@ -259,4 +259,12 @@ int kvm_arm_rme_init(MachineState *ms, KVMState *s);
> >    */
> >   void kvm_arm_rme_vcpu_init(ARMCPU *cpu);
> > +/**
> > + * kvm_arm_rme_vm_type
> > + * @ms: the machine state
> > + *
> > + * Returns the Realm KVM VM type if the user requested a Realm, 0 otherwise.
> > + */
> > +int kvm_arm_rme_vm_type(void);
> > +
> >   #endif
> 
> Thanks,
> Gavin
> 

