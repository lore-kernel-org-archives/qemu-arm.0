Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C217ACC6B38
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 20:31:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHS6e-0002mt-NK; Thu, 15 Oct 2026 16:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xHS6b-0002ig-Pi
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 16:31:14 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xHS6Z-0005ka-KD
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 16:31:13 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-887a58523e6so1810313b3a.3
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 13:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792096270; x=1792701070; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pBnzENG+hypG+KwtFE6xg5OmepbVILPhdpggt/oBR/M=;
 b=lymahZPFUWgJZTVLlO2BwxEvqdjEENPg4whIMny273n8oXW93r24P4ffSi8+gwo6Ai
 +9od8EomPusAeuqLz+3Yc6ffBHfq05jiyyMhPftFJIiL2+PD8B4kPWQwYQ4g3lfxzKwj
 qMe+YACUpmooz3Nl0uutnkBiLMobqQ2zeEHxCiRmiBtViNs3ZZtwW8WvqsK2wSAR5pdQ
 s4C6L/14hK5Go7m+Zz4YiMxZh7riMKO4qBEwC42b5leUyKTsgmd1ht8vlsFjCfrofeRx
 LHzLxQoScVTVzIqrMNfriJkclSpZy2aPer9EYdvSDzRlbQU3fZ2Dcd0tOe8vtFc2aRGX
 f77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792096270; x=1792701070;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pBnzENG+hypG+KwtFE6xg5OmepbVILPhdpggt/oBR/M=;
 b=1neJiBov18PkoHLXcGzxfVfM4FahoRmI9r3xzSNbnUVLVgRUvyCMm+VCq27BAp3F9/
 jkJ5XySaYe8yp9u+NTqg23tgxrNlg7/f0ZJENSbCJMWiu6/tiP5Cdp5EjG+jEuzjoHJw
 YyaTSMcMsS+EMEp7TEiW456wu0xA4wVOMXP4Ywnxv6OGAbTo9grywOjcQZ6u9KYCe2Ps
 8q0fiU9YuQV7Jr7J3qRGQT5rFkxOMdD+ruvxIrs8p/GEA4mOyhrcdp08ChYPimhJaMHA
 oidUNKNbhoGyrMkDCkplLWIa/x7Aq3wctESn6JXzkAL/MYzoHLTJdqTAm6xU57VeYrY7
 mzRg==
X-Forwarded-Encrypted: i=1;
 AKwUvBx9Zr64wEkJuhnO8DiK/GPPvIznpPe4RmPyVW4O8bw9xD+3/EE6m260qn3YfC9VBy8EhuHn9sdeGw==@nongnu.org
X-Gm-Message-State: AFq9FYKKeY7It9NrGMly+MXCyV2kbEma4XKHvfHN137rAX+Y8RFN3NC1
 EPic2YV5aGg/ASNfsyp/f0+Z1u92WiW18lwjq9sO60gTp1VTjAwa9BsHWWj6N5wcSko=
X-Gm-Gg: AYBFou3KncMNRPrCRZh5XqSDSYADYrVun88IsJJJWpEXPQ831VOcHp9MH2AZ2ovCZj1
 m67DKDJWSzgxLkUoaB/P8CRjcr+8owIQ8yE4GfSZRlK6nEKO6cBtM2O330i+h0YsQcymHiA0x0I
 uh5pyTydRif+emZHka7pKiT68Bqgxe1adhbPFYQUikzEYZ7wQRoG75ADClxPTpIVPzrHVOD5sMe
 6puSfPKA7AOI5uhy9adtekjnPw4lgNZvCTfDJJIASNhrEjmg1HQ5vRCTchp+qIcK2S9RdZ7uHEx
 lIRn+zCi4tPEVws5iRv/z+c7yyc3/Hgo0cLp8ViidIVV6tszhlj1ajL13t4ztkgtxAK4djqYa6A
 AY3kg0RE35r2fHR+bwhjGatTX8R0mxTbhjmoptS9HjqeEBAhP5X0g7Q9XAPPMSUThSAFnhV7TT/
 O+sBwMRznutSw6YPw7WASEJstUJza/OxnpHpUUhsvuPUcJFJepBCyyV9qx7d/n1DnStbfZGA0zl
 Q==
X-Received: by 2002:a05:6a21:9018:b0:3e0:e542:4ca6 with SMTP id
 adf61e73a8af0-3e1d0c3d35dmr6352907637.19.1792096269809; 
 Thu, 15 Oct 2026 13:31:09 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:48ff:8de9:17ca:1542])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cd6549eea48sm78394a12.19.2026.10.15.13.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 13:31:08 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:31:05 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Gavin Shan <gshan@redhat.com>
Cc: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, lorenzo.pieralisi@linaro.org,
 enju.kohei@fujitsu.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvm@vger.kernel.org
Subject: Re: [RFC v4 07/24] target/arm/kvm: Create scratch Realm VM when
 requested
Message-ID: <atE4CS3P4n5o3n3w@p14s>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
 <20260903193611.1058589-8-mathieu.poirier@linaro.org>
 <d04fe4a6-4418-48b9-b2ed-cce6278e0081@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d04fe4a6-4418-48b9-b2ed-cce6278e0081@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Oct 02, 2026 at 11:05:09AM +1000, Gavin Shan wrote:
> On 9/4/26 5:35 AM, Mathieu Poirier wrote:
> > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > 
> > When a Realm is requested, create a scratch Realm VM by setting bit 8
> > of the argument given to the KVM_CREATE_VM ioctl().  Bit 7-0 are reserved
> > for the guest PA size.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >   target/arm/kvm.c | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> > index b4c6da1fb9f3..d86e66e056b9 100644
> > --- a/target/arm/kvm.c
> > +++ b/target/arm/kvm.c
> > @@ -108,7 +108,9 @@ bool kvm_arm_create_scratch_host_vcpu(int *fdarray,
> >                                         struct kvm_vcpu_init *init)
> >   {
> >       int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
> > +    MachineState *ms = MACHINE(qdev_get_machine());
> >       int max_vm_pa_size;
> > +    int vm_type;
> > 
> 
> @vm_type can be initialized when it's declared.
> 
>        MachineState *ms = MACHINE(qdev_get_machine());
>        int vm_type = ms->cgs ? KVM_VM_TYPE_ARM_REALM : KVM_VM_TYPE_ARM_NORMAL;
>        int max_vm_pa_size;
> 
> >       kvmfd = qemu_open_old("/dev/kvm", O_RDWR);
> >       if (kvmfd < 0) {
> > @@ -118,8 +120,10 @@ bool kvm_arm_create_scratch_host_vcpu(int *fdarray,
> >       if (max_vm_pa_size < 0) {
> >           max_vm_pa_size = 0;
> >       }
> > +
> > +    vm_type = (ms->cgs ? KVM_VM_TYPE_ARM_REALM : KVM_VM_TYPE_ARM_NORMAL);
> 
> () aren't needed.
>

All fixed.
 
> >       do {
> > -        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> > +        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size | vm_type);
> >       } while (vmfd == -1 && errno == EINTR);
> >       if (vmfd < 0) {
> >           goto err;
> 
> Thanks,
> Gavin
> 

