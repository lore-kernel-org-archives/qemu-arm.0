Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48713C79F82
	for <qemu-arm@archiver.kernel.org>; Fri,  4 Sep 2026 16:25:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2Wij-00089j-Hd; Fri, 04 Sep 2026 12:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2WiY-000852-5h
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 12:24:42 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2WiU-0002r4-Om
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 12:24:41 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-84fa3b14ee1so1002413b3a.0
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2026 09:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788539077; x=1789143877; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vUW7zAhH9a6+Eq1CxsZDjyjXnk3sjjEG4PIOkiEC1b4=;
 b=WFktCP2TWsjtGk//JDr3vjJyVg8U5CGUQBKliyUmbSyBtDZkX+Kk4ciO7fmwLbeHt6
 xbWP4a/AJstx5ljrW9EUYnNesm4BAU+zm4kamLIuVI/GuvhIGQnibc1fzey1tAyATKyw
 n+PMvO9BVulJzESVWrzbhOIAFTSqvdNG5Cxu8VfyWP+/Et++9rTnafg9FNlCojq4iL17
 ZYINNFEs+EsHalZwaHS4jbItlFEoRSmd0ZxaPBStvrnS5W6pnmtiNjWEjd3n0S/U6SPe
 IQSPcafIN/ez8a0i5td5MyQV/DmMqviASD3tfwxv2zssE0PsISQS88L6dxlvt5gwGrG1
 2tZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788539077; x=1789143877;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vUW7zAhH9a6+Eq1CxsZDjyjXnk3sjjEG4PIOkiEC1b4=;
 b=jvhrZ+fj9U2hC9LDnN/oTSzbrZTWXxqfmF1NQQINbbqcszcAIgz+kcXvlH2fExiUpE
 uX/5tGprh+SUkVhPoPwOdYsBAaeiGJzxgraoFWYCUjExb7Gq068rkFtaqUdPxzl+ogWW
 roASCZTTYE2msoKXYTPjwTYYlxehSERMbU/pMMqKu1xZcUwZuTDdOK/bl/QxPtA8PjuF
 1/A7g219ihPA0ruEG+R1FfKtZ3WCGT0Ill+qCSSs0/nn2Ex9pztPcods2m/oad9pNkRP
 j67FLZDTLhn2SzGnOkZ/gOWeDesF4Bt6Vzkp33Aa8SoTzKhBvn54i3hHK/g57Jg2KZDn
 bO9g==
X-Forwarded-Encrypted: i=1;
 AKwUvBy1iFK9dO89/Dp6JXgfLV+0rR/Qbs2Ry7FYLdPT5p6cp/3NYVOEf4wm3oAptsIbbeKhAFlPVV/OTA==@nongnu.org
X-Gm-Message-State: AFuF++lGqLnYAwSqeNi/NUPs86UEe+Ra7zHIb30J0tD0r33Wx0aNb8Sv
 XboBMrLkDzg3Wz1zSd1idawYykNLAg6PXOWCbgJcTU7Ml6itNLowVZ9P35XtbR/X7nc=
X-Gm-Gg: AYBFou1NUSyqvfSvyRnme7kO72eLAjiSxf9YlsTP46w0vTGN7Aoveofzmy7AlDp6L7m
 +RJWmdPxgsSYRKDyTMijWWgPoKqDt8tLnOuAGgaORH15j0m9hI/daf2INYQ9dmCl9phq8oydG3X
 +Ed5f1HdOIkOS7S3XtkSKa84A5kJm6VLBAmsBoIAFBmIR5qICA0rMJyXjehp94adEkPWpJbgbEw
 GzR2kdd1CP7PJK/pHX3NbVxNMleit2G+nJ0D+bx/EApvYMuJlhmeFUSgaBzkAYj7+PYiQwYjUcd
 rZ2Fw6tIk2BzqFAw7dcCSryuevRVvrv+RowL8L+TpPG9Ps8Zkx0ZmYZqDacpFFayIbNm8F5JDQY
 gU65Kphyevv+Gb4TiKie/ruXAZAvrji4xxfqx7AwQesW5RQrwDhBFq+8FVroWACwL9Io//SaRL2
 FIgDqtpbZZ4W7/Y7p85FVdbLJz5u9S+0BLpawMP9MlZxMbYpxLfEjFfKJbDdn9I5cswQtvHv1Cz
 B4=
X-Received: by 2002:a05:6a00:3ccd:b0:847:9015:e68c with SMTP id
 d2e1a72fcca58-8616ad5265dmr10153169b3a.17.1788539076507; 
 Fri, 04 Sep 2026 09:24:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:f95f:75de:b3f0:3bf5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-86152045f74sm1375802b3a.10.2026.09.04.09.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 09:24:35 -0700 (PDT)
Date: Fri, 4 Sep 2026 10:24:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Gavin Shan <gshan@redhat.com>
Cc: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, lorenzo.pieralisi@linaro.org,
 enju.kohei@fujitsu.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvm@vger.kernel.org
Subject: Re: [RFC v4 01/24] linux-headers: Add RME related definitions
Message-ID: <aprwwdhwkaDn9xo1@p14s>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
 <20260903193611.1058589-2-mathieu.poirier@linaro.org>
 <b06c933e-b8fd-4e03-8f50-9a9086542ccf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b06c933e-b8fd-4e03-8f50-9a9086542ccf@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x435.google.com
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

On Fri, Sep 04, 2026 at 04:07:49PM +1000, Gavin Shan wrote:
> Hi Mathieu,
> 
> On 9/4/26 5:35 AM, Mathieu Poirier wrote:
> > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > 
> > This is a temporary patch intended for testing purposes only. It provides
> > definitions related to supporting Realms by the QEMU-VMM.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >   linux-headers/asm-arm64/kvm.h |  9 +++++++++
> >   linux-headers/linux/kvm.h     | 10 +++++++++-
> >   2 files changed, 18 insertions(+), 1 deletion(-)
> > 
> > diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
> > index 6aefe7973814..4c08631ec7d2 100644
> > --- a/linux-headers/asm-arm64/kvm.h
> > +++ b/linux-headers/asm-arm64/kvm.h
> > @@ -208,6 +208,15 @@ struct kvm_arm_counter_offset {
> >   	__u64 reserved;
> >   };
> > +#define KVM_ARM_RMI_POPULATE_FLAGS_MEASURE     (1 << 0)
> > +struct kvm_arm_rmi_populate {
> > +	__u64 base;
> > +	__u64 size;
> > +	__u64 source_uaddr;
> > +	__u32 flags;
> > +	__u32 reserved;
> > +};
> > +
> >   #define KVM_ARM_TAGS_TO_GUEST		0
> >   #define KVM_ARM_TAGS_FROM_GUEST		1
> > diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> > index 29f81c05aca2..8b7627f11447 100644
> > --- a/linux-headers/linux/kvm.h
> > +++ b/linux-headers/linux/kvm.h
> > @@ -689,14 +689,19 @@ struct kvm_enable_cap {
> >    * address size for the VM. Bits[7-0] are reserved for the guest
> >    * PA size shift (i.e, log2(PA_Size)). For backward compatibility,
> >    * value 0 implies the default IPA size, 40bits.
> > + *
> > + * Bits[30-31] are reserved for the VM type
> >    */
> >   #define KVM_VM_TYPE_ARM_IPA_SIZE_MASK	0xffULL
> >   #define KVM_VM_TYPE_ARM_IPA_SIZE(x)		\
> >   	((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
> > +#define KVM_VM_TYPE_ARM_NORMAL		0
> > +#define KVM_VM_TYPE_ARM_REALM		(1UL << 30)
> >   #define KVM_VM_TYPE_ARM_PROTECTED	(1UL << 31)
> >   #define KVM_VM_TYPE_ARM_MASK		(KVM_VM_TYPE_ARM_IPA_SIZE_MASK | \
> > -					 KVM_VM_TYPE_ARM_PROTECTED)
> > +					 KVM_VM_TYPE_ARM_PROTECTED | \
> > +					 KVM_VM_TYPE_ARM_REALM)
> >   /*
> >    * ioctls for /dev/kvm fds:
> > @@ -719,6 +724,8 @@ struct kvm_enable_cap {
> >   #define KVM_GET_EMULATED_CPUID	  _IOWR(KVMIO, 0x09, struct kvm_cpuid2)
> >   #define KVM_GET_MSR_FEATURE_INDEX_LIST    _IOWR(KVMIO, 0x0a, struct kvm_msr_list)
> > +#define KVM_ARM_RMI_POPULATE	  _IOWR(KVMIO, 0xd7, struct kvm_arm_rmi_populate)
> > +
> >   /*
> >    * Extension capability list.
> >    */
> > @@ -988,6 +995,7 @@ struct kvm_enable_cap {
> >   #define KVM_CAP_S390_HPAGE_2G 249
> >   #define KVM_CAP_PPC_COMPAT_CAPS 250
> >   #define KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES 251
> > +#define KVM_CAP_ARM_RMI 252
> 
> Both KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES and KVM_CAP_ARM_RMI aren't consistent to
> the definitions in Steven Price's (v16) host series [1]. They need corrections as
> below. Otherwise, realm VM can't be started and the following errors are raised by
> qemu.

The changelog is clear - numbers for those defines have been bumped up to keep
pace with the definitions in the QEMU master branch.  RFC v3 had defines that
were similar to Steven's v16 and as such used an older QEMU baseline, but Markus
said it wasn't appropriate.     

> 
> [1] https://lore.kernel.org/kvm/20260803134403.80630-14-steven.price@arm.com/
> 
> root@host:~# qemu-system-aarch64 -enable-kvm                  \
> -object rme-guest,id=rme0,convert-in-place=on                 \
> -machine virt,gic-version=3,confidential-guest-support=rme0   \
> -m 2G -cpu host                                               \
> -smp maxcpus=4,cpus=4,sockets=1,clusters=1,cores=2,threads=2  \
> -object memory-backend-guest-memfd,id=mem0,size=2G,share=on   \
> -numa node,nodeid=0,cpus=0-3,memdev=mem0                      \
> -serial mon:stdio -monitor none -nographic -nodefaults        \
> -kernel /mnt/linux/arch/arm64/boot/Image                      \
> -initrd /mnt/buildroot/output/images/rootfs.cpio.xz           \
> -append earlycon=pl011,mmio,0x10009000000
>     :
> qemu-system-aarch64: VM doesn't support Realms
> qemu-system-aarch64: failed to initialize kvm: No such device
> 
> 
> -#define KVM_CAP_PPC_COMPAT_CAPS 250
> -#define KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES 251
> -#define KVM_CAP_ARM_RMI 252
> +#define KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES 250
> +#define KVM_CAP_ARM_RMI 251
> 
> >   struct kvm_irq_routing_irqchip {
> >   	__u32 irqchip;
> 
> Thanks,
> Gavin
> 

