Received: by 10.25.0.198 with SMTP id 189csp674165lfa;
        Thu, 4 May 2017 09:45:24 -0700 (PDT)
X-Received: by 10.176.80.38 with SMTP id b35mr11825967uaa.103.1493916324836;
        Thu, 04 May 2017 09:45:24 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f186si1216579vkd.99.2017.05.04.09.45.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 May 2017 09:45:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43055 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6Jsa-0004si-9a
	for alex.bennee@linaro.org; Thu, 04 May 2017 12:45:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdj.1984@gmail.com>) id 1d6Jro-0004Wt-6M
	for qemu-devel@nongnu.org; Thu, 04 May 2017 12:44:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdj.1984@gmail.com>) id 1d6Jrm-0004EW-M3
	for qemu-devel@nongnu.org; Thu, 04 May 2017 12:44:36 -0400
Received: from mail-yw0-x231.google.com ([2607:f8b0:4002:c05::231]:35234)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <gengdj.1984@gmail.com>)
	id 1d6Jrm-0004Ce-Fp; Thu, 04 May 2017 12:44:34 -0400
Received: by mail-yw0-x231.google.com with SMTP id l135so9484806ywb.2;
	Thu, 04 May 2017 09:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=cKMLpvp0F8eSA+L5liE8hJ1hr4FVvs6VVyl5NL/2myY=;
	b=TydTe2bIRs+K4Q+kmMvqtKeaOYSXd7i1esV34ETXjxkfjx0xYLCGendYIuKgQsx11q
	L6GsZ1jzLW9oJbpDOmjEzh1OyqcCwrmbslnvmgxMtWBWgNCu16OZpiTQAhkS+FaYYunk
	QrDob1jDZf/DBBEZoUt5MhMsMZ8nIvPYDlBZwCp3nLaN3fIii+cIN7H/mZYH4OO/SMNs
	yF1+ee4Lqd12dRl0jysMr0LSsqJMrgF8pis1HUhd/MzGEThI9Ufs8OPCDPjxD8G9vktU
	Zi4tv1fveeyBW3icBZvHXNecmmFRoAz+5uBJGn0+QQF65kwu4/+Ox9e4ePXE7PAwRfS/
	5r5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=cKMLpvp0F8eSA+L5liE8hJ1hr4FVvs6VVyl5NL/2myY=;
	b=IiRp+F1+bL8Slw2QhEWaI+xmEMXuXSPWSvWR2OK2TkLpS4DtS3DiirlQ2Bh9vVlW5s
	5vkrsirwsVtYS7AcJdAKohYdeHJESwHO6Bmc5A+leY4QheHnirdBzrflr+68t/WO7dWY
	MUAZvKo5bYqbPV6qsBcd/iXiDHRbzNUYQhBuIz7di4H9dbVzV5X9847VlBG4u93n6xvv
	COA+P0eTZKdIH4x4s886A8WEWws5O8x7rDU+PGTa2gmd8miDXk7j+wOLg6IqLVKII2tb
	7jrWUUEbS1k6G1xZ5DjuxI5sELVkUg9LbHUWI8H4W/hTxnhVgv8Cy3sBsen4bCze+Wvg
	NAsg==
X-Gm-Message-State: AN3rC/718Nk5jb4RWEa/8YmKw5L9Ahw3GLwVbrhXNG9xsj6T9FZSByMW
	d9LR7ZcHX/B7BdKpKQZa7xvcX8NzgQ==
X-Received: by 10.13.193.131 with SMTP id c125mr34804074ywd.213.1493916273395; 
	Thu, 04 May 2017 09:44:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.172.99 with HTTP; Thu, 4 May 2017 09:44:33 -0700 (PDT)
In-Reply-To: <CAMj-D2DO_CfvD77izsGfggoKP45HSC9aD6auUPAYC9Yeq_aX7w@mail.gmail.com>
References: <CAMj-D2DO_CfvD77izsGfggoKP45HSC9aD6auUPAYC9Yeq_aX7w@mail.gmail.com>
From: gengdongjiu <gengdj.1984@gmail.com>
Date: Fri, 5 May 2017 00:44:33 +0800
Message-ID: <CAMj-D2BVerutQXg0AArBvWrB04x9jYF+ACMQCZu3FT92kReZBg@mail.gmail.com>
To: mtsirkin@redhat.com, kvm@vger.kernel.org, 
	Tyler Baicar <tbaicar@codeaurora.org>, qemu-devel@nongnu.org, 
	Xiongfeng Wang <wangxiongfeng2@huawei.com>, ben@skyportsystems.com,
	linux@armlinux.org.uk, 
	kvmarm@lists.cs.columbia.edu, huangshaoyu@huawei.com, lersek@redhat.com,
	songwenjun@huawei.com, wuquanming@huawei.com, 
	Marc Zyngier <marc.zyngier@arm.com>, qemu-arm@nongnu.org,
	imammedo@redhat.com, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, pbonzini@redhat.com, 
	James Morse <james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::231
Subject: Re: [Qemu-devel] (no subject)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X9l6AVtL+Z5P
Message-ID: <20170504164433.-R4MwdHUh-JsguFdWx3wiBEj8zSUKYNg82YUHWq73Pg@z>

Dear James,
   Thanks a lot for your review and comments. I am very sorry for the
late response.


2017-05-04 23:42 GMT+08:00 gengdongjiu <gengdj.1984@gmail.com>:
>  Hi Dongjiu Geng,
>
> On 30/04/17 06:37, Dongjiu Geng wrote:
>> when happen SEA, deliver signal bus and handle the ioctl that
>> inject SEA abort to guest, so that guest can handle the SEA error.
>
>> diff --git a/arch/arm/kvm/mmu.c b/arch/arm/kvm/mmu.c
>> index 105b6ab..a96594f 100644
>> --- a/arch/arm/kvm/mmu.c
>> +++ b/arch/arm/kvm/mmu.c
>> @@ -20,8 +20,10 @@
>> @@ -1238,6 +1240,36 @@ static void coherent_cache_guest_page(struct kvm_=
vcpu *vcpu, kvm_pfn_t pfn,
>>   __coherent_cache_guest_page(vcpu, pfn, size);
>>  }
>>
>> +static void kvm_send_signal(unsigned long address, bool hugetlb, bool h=
wpoison)
>> +{
>> + siginfo_t info;
>> +
>> + info.si_signo   =3D SIGBUS;
>> + info.si_errno   =3D 0;
>> + if (hwpoison)
>> + info.si_code    =3D BUS_MCEERR_AR;
>> + else
>> + info.si_code    =3D 0;
>> +
>> + info.si_addr    =3D (void __user *)address;
>> + if (hugetlb)
>> + info.si_addr_lsb =3D PMD_SHIFT;
>> + else
>> + info.si_addr_lsb =3D PAGE_SHIFT;
>> +
>> + send_sig_info(SIGBUS, &info, current);
>> +}
>> +
> =C2=AB  [hide part of quote]
>
> Punit reviewed the other version of this patch, this PMD_SHIFT is not the=
 right
> thing to do, it needs a more accurate set of calls and shifts as there ma=
y be
> hugetlbfs pages other than PMD_SIZE.
>
> https://www.spinics.net/lists/arm-kernel/msg568919.html
>
> I haven't posted a new version of that patch because I was still hunting =
a bug
> in the hugepage/hwpoison code, even with Punit's fixes series I see -EFAU=
LT
> returned to userspace instead of this hwpoison code being invoked.

  Ok, got it, thanks for your information.
>
> Please avoid duplicating functionality between patches, it wastes reviewe=
rs
> time, especially when we know there are problems with this approach.
>
>
>> +static void kvm_handle_bad_page(unsigned long address,
>> + bool hugetlb, bool hwpoison)
>> +{
>> + /* handle both hwpoison and other synchronous external Abort */
>> + if (hwpoison)
>> + kvm_send_signal(address, hugetlb, true);
>> + else
>> + kvm_send_signal(address, hugetlb, false);
>> +}
>
> Why the extra level of indirection? We only want to signal userspace like=
 this
> from KVM for hwpoison. Signals for RAS related reasons should come from t=
he bits
> of the kernel that decoded the error.

For the SEA, the are maily two types:
0b010000 Synchronous External Abort on memory access.
0b0101xx Synchronous External Abort on page table walk. DFSC[1:0]
encode the level.

hwpoison should belong to the  "Synchronous External Abort on memory access=
"
if the SEA type is not hwpoison, such as page table walk, do you mean
KVM do not deliver the SIGBUS?
If so, how the KVM handle the SEA type other than hwpoison?

>
> (hwpoison for KVM is a corner case as Qemu's memory effectively has two u=
sers,
> Qemu and KVM. This isn't the example of how user-space gets signalled.)
>
>
>> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
>> index b37446a..780e3c4 100644
>> --- a/arch/arm64/kvm/guest.c
>> +++ b/arch/arm64/kvm/guest.c
>> @@ -277,6 +277,13 @@ int kvm_arch_vcpu_ioctl_set_sregs(struct kvm_vcpu *=
vcpu,
>>   return -EINVAL;
>>  }
>>
>> +int kvm_vcpu_ioctl_sea(struct kvm_vcpu *vcpu)
>> +{
>> + kvm_inject_dabt(vcpu, kvm_vcpu_get_hfar(vcpu));
>> +
>> + return 0;
>> +}
>
>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>> index bb02909..1d2e2e7 100644
>> --- a/include/uapi/linux/kvm.h
>> +++ b/include/uapi/linux/kvm.h
>> @@ -1306,6 +1306,7 @@ struct kvm_s390_ucas_mapping {
>>  #define KVM_S390_GET_IRQ_STATE  _IOW(KVMIO, 0xb6, struct kvm_s390_irq_s=
tate)
>>  /* Available with KVM_CAP_X86_SMM */
>>  #define KVM_SMI                   _IO(KVMIO,   0xb7)
>> +#define KVM_ARM_SEA               _IO(KVMIO,   0xb8)
>>
>>  #define KVM_DEV_ASSIGN_ENABLE_IOMMU (1 << 0)
>>  #define KVM_DEV_ASSIGN_PCI_2_3 (1 << 1)
>>
>
> Why do we need a userspace API for SEA? It can also be done by using
> KVM_{G,S}ET_ONE_REG to change the vcpu registers. The advantage of doing =
it this
> way is you can choose which ESR value to use.
>
> Adding a new API call to do something you could do with an old one doesn'=
t look
> right.

James, I considered your suggestion before that use the
KVM_{G,S}ET_ONE_REG to change the vcpu registers. but I found it does
not have difference to use the alread existed KVM API.  so may be
changing the vcpu registers in qemu will duplicate with the KVM APIs.

injection a SEA is no more than setting some registers: elr_el1, PC,
PSTATE, SPSR_el1, far_el1, esr_el1
I seen this KVM API do the same thing as Qemu.  do you found call this
API will have issue and necessary to choose another ESR value?

I pasted the alread existed KVM API code:

static void inject_abt64(struct kvm_vcpu *vcpu, bool is_iabt, unsigned
long addr)
{
 unsigned long cpsr =3D *vcpu_cpsr(vcpu);
 bool is_aarch32 =3D vcpu_mode_is_32bit(vcpu);
 u32 esr =3D 0;
 *vcpu_elr_el1(vcpu) =3D *vcpu_pc(vcpu);
 *vcpu_pc(vcpu) =3D get_except_vector(vcpu, except_type_sync);
 *vcpu_cpsr(vcpu) =3D PSTATE_FAULT_BITS_64;
 *vcpu_spsr(vcpu) =3D cpsr;
 vcpu_sys_reg(vcpu, FAR_EL1) =3D addr;
 /*
  * Build an {i,d}abort, depending on the level and the
  * instruction set. Report an external synchronous abort.
  */
 if (kvm_vcpu_trap_il_is32bit(vcpu))
  esr |=3D ESR_ELx_IL;
 /*
  * Here, the guest runs in AArch64 mode when in EL1. If we get
  * an AArch32 fault, it means we managed to trap an EL0 fault.
  */
 if (is_aarch32 || (cpsr & PSR_MODE_MASK) =3D=3D PSR_MODE_EL0t)
  esr |=3D (ESR_ELx_EC_IABT_LOW << ESR_ELx_EC_SHIFT);
 else
  esr |=3D (ESR_ELx_EC_IABT_CUR << ESR_ELx_EC_SHIFT);
 if (!is_iabt)
  esr |=3D ESR_ELx_EC_DABT_LOW << ESR_ELx_EC_SHIFT;
 vcpu_sys_reg(vcpu, ESR_EL1) =3D esr | ESR_ELx_FSC_EXTABT;
}

static void inject_abt32(struct kvm_vcpu *vcpu, bool is_pabt,
    unsigned long addr)
{
 u32 vect_offset;
 u32 *far, *fsr;
 bool is_lpae;
 if (is_pabt) {
  vect_offset =3D 12;
  far =3D &vcpu_cp15(vcpu, c6_IFAR);
  fsr =3D &vcpu_cp15(vcpu, c5_IFSR);
 } else { /* !iabt */
  vect_offset =3D 16;
  far =3D &vcpu_cp15(vcpu, c6_DFAR);
  fsr =3D &vcpu_cp15(vcpu, c5_DFSR);
 }
 prepare_fault32(vcpu, COMPAT_PSR_MODE_ABT | COMPAT_PSR_A_BIT, vect_offset)=
;
 *far =3D addr;
 /* Give the guest an IMPLEMENTATION DEFINED exception */
 is_lpae =3D (vcpu_cp15(vcpu, c2_TTBCR) >> 31);
 if (is_lpae)
  *fsr =3D 1 << 9 | 0x34;
 else
  *fsr =3D 0x14;
}


/**
 * kvm_inject_dabt - inject a data abort into the guest
 * @vcpu: The VCPU to receive the undefined exception
 * @addr: The address to report in the DFAR
 *
 * It is assumed that this code is called from the VCPU thread and that the
 * VCPU therefore is not currently executing guest code.
 */
void kvm_inject_dabt(struct kvm_vcpu *vcpu, unsigned long addr)
{
 if (!(vcpu->arch.hcr_el2 & HCR_RW))
  inject_abt32(vcpu, false, addr);
 else
  inject_abt64(vcpu, false, addr);
}


>
>
> Thanks,
>
> James
