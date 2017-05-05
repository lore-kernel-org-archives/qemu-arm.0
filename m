Received: by 10.25.0.198 with SMTP id 189csp179993lfa;
        Fri, 5 May 2017 06:20:37 -0700 (PDT)
X-Received: by 10.237.35.53 with SMTP id h50mr44249297qtc.193.1493990437077;
        Fri, 05 May 2017 06:20:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z32si4586342qtg.73.2017.05.05.06.20.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 May 2017 06:20:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6d9u-00044P-AO
	for alex.bennee@linaro.org; Fri, 05 May 2017 09:20:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1d6d9n-000448-Ea
	for qemu-arm@nongnu.org; Fri, 05 May 2017 09:20:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1d6d9h-00010V-8t
	for qemu-arm@nongnu.org; Fri, 05 May 2017 09:20:27 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3921)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1d6d9g-0000vC-8T; Fri, 05 May 2017 09:20:21 -0400
Received: from 172.30.72.54 (EHLO DGGEML404-HUB.china.huawei.com)
	([172.30.72.54])
	by dggrg02-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id AMZ38403; Fri, 05 May 2017 21:19:24 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEML404-HUB.china.huawei.com
	(10.3.17.39) with Microsoft SMTP Server id 14.3.301.0; Fri, 5 May 2017
	21:19:13 +0800
To: James Morse <james.morse@arm.com>
References: <1493530677-4919-1-git-send-email-gengdongjiu@huawei.com>
	<1493530677-4919-2-git-send-email-gengdongjiu@huawei.com>
	<5908A7CE.7030008@arm.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <bbceff7a-1ebf-e6de-abc6-e35b71c939f1@huawei.com>
Date: Fri, 5 May 2017 21:19:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <5908A7CE.7030008@arm.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.590C7BE1.003B, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 0ad4bfb9d90b1793275acd3b1107ca1d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.188
Subject: Re: [Qemu-arm] [PATCH v3 2/3] arm64: kvm: inject SError with
 virtual syndrome
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mtsirkin@redhat.com, kvm@vger.kernel.org,
	rkrcmar@redhat.com, tbaicar@codeaurora.org,
	qemu-devel@nongnu.org, wangxiongfeng2@huawei.com,
	ben@skyportsystems.com, linux@armlinux.org.uk,
	kvmarm@lists.cs.columbia.edu, huangshaoyu@huawei.com,
	zhaoshenglong@huawei.com, lersek@redhat.com,
	songwenjun@huawei.com, drjones@redhat.com, wuquanming@huawei.com,
	xiexiuqi@huawei.com, marc.zyngier@arm.com, qemu-arm@nongnu.org,
	imammedo@redhat.com, linux-arm-kernel@lists.infradead.org,
	ard.biesheuvel@linaro.org, pbonzini@redhat.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lx6xJIAiGYUf

Hi james,

   Thanks for your detailed suggestion.

On 2017/5/2 23:37, James Morse wrote:
> Hi Dongjiu Geng,
> 
> On 30/04/17 06:37, Dongjiu Geng wrote:
>> when SError happen, kvm notifies kvmtool to generate GHES table
>> to record the error, then kvmtools inject the SError with specified
>> virtual syndrome. when switch to guest, a virtual SError will happen with
>> this specified syndrome.
> 
> GHES records in the HEST (T)able have to be generated before the OS starts as
> these are read at boot. Did you mean generate CPER records?
 you are quite right that should generate CPER records.


> 
> 
> It looks like this is based on the earlier SEI series, please work together and
> post a combined series when there are changes. (It also good to summarise the
> changes in the cover letter.)
Ok.

> 
> This patch is modifying the world-switch to save/restore VSESR. You should
> explain that VSESR is the Virtual SError Syndrome, it becomes the ESR value when
> HCR_EL2.VSE injects an SError. This register was added by the RAS Extensions and
> needs patching in or guarding.
yes, you are right.

> 
> 
>> diff --git a/arch/arm64/kvm/hyp/switch.c b/arch/arm64/kvm/hyp/switch.c
>> index aede165..ded6211 100644
>> --- a/arch/arm64/kvm/hyp/switch.c
>> +++ b/arch/arm64/kvm/hyp/switch.c
>> @@ -86,6 +86,13 @@ static void __hyp_text __activate_traps(struct kvm_vcpu *vcpu)
>>  		isb();
>>  	}
>>  	write_sysreg(val, hcr_el2);
>> +    /* If virtual System Error or Asynchronous Abort is pending. set
>> +     * the virtual exception syndrome information
>> +     */
>> +	if (cpus_have_cap(ARM64_HAS_RAS_EXTN) &&
> 
> Is cpus_have_cap() safe to use at EL2?
> This would be the first user, and it accesses cpu_hwcaps. You probably want
> something like the static_branch_unlikely()s in the vgic code elsewhere in this
> file.
> 
> 
>> +			(vcpu->arch.hcr_el2 & HCR_VSE))
>> +		write_sysreg_s(vcpu->arch.fault.vsesr_el2, VSESR_EL2);
>> +
> 
> I think this would be clearer if you took this out to a helper method called
> something like restore_vsesr() and did the if(cap|VSE) stuff there.
  good suggestion.

> 
> (Nit: comment style)
 OK.

> 
> 
>>  	/* Trap on AArch32 cp15 c15 accesses (EL1 or EL0) */
>>  	write_sysreg(1 << 15, hstr_el2);
>>  	/*
>> @@ -139,9 +146,15 @@ static void __hyp_text __deactivate_traps(struct kvm_vcpu *vcpu)
>>  	 * the crucial bit is "On taking a vSError interrupt,
>>  	 * HCR_EL2.VSE is cleared to 0."
>>  	 */
>> -	if (vcpu->arch.hcr_el2 & HCR_VSE)
>> +	if (vcpu->arch.hcr_el2 & HCR_VSE) {
>>  		vcpu->arch.hcr_el2 = read_sysreg(hcr_el2);
>>  
>> +		if (cpus_have_cap(ARM64_HAS_RAS_EXTN)) {
>> +			/* set vsesr_el2[24:0] with esr_el2[24:0] */
>> +			kvm_vcpu_set_vsesr(vcpu, read_sysreg_el2(esr)
>> +					& VSESR_ELx_IDS_ISS_MASK);
> 
> There is no need for KVM to save the VSESR. It is copied to ESR_EL1 when
> HCR_EL2.VSE delivers the SError, after this we don't care what the register
> value is. When we switch to a guest we should set the value from KVM whenever
> the VSE bit is set. We should never read back the value in hardware.
  I think you are right. Thanks for your points out.

> 
> Why read ESR_EL2? This will give you a completely unrelated value. If EL2 takes
> an IRQ or a page fault between pending the SError and delivering it, we
> overwrite the value set by KVM or user-space with a stray EL2 value.
> 
> 
> ... I think you expect an SError to arrive at EL2 and have its ESR recorded in
> vcpu->arch.fault.vsesr_el2. Some time later KVM decides to inject an SError into
> the guest, and this ESR is reused...
> 
> We shouldn't do this. Qemu/kvmtool may want to inject a virtual-SError that
> never started as a physical-SError. Qemu/kvmtool may choose to notify the guest
> of RAS events via another mechanism, or not at all.
> 
> KVM should not give the guest an ESR value of its choice. For SError the ESR
> describes whether the error is corrected, correctable or fatal. Qemu/kvmtool
> must choose this.

Below is my previous solution:
For the SError, CPU will firstly trap to EL3 firmware and records the syndrome to ESR_EL3.
Before jumping to El2 hypervisors, it will copy the esr_el3 to esr_el2.
so in order to pass this syndrome to vsesr_el2, using the esr_el2 value to assign it.


If Qemu/kvmtool chooses the ESR value and ESR only describes whether the error is corrected/correctable/fatal,
whether the information is not enough for the guest?


>
> I think we need an API that allows Qemu/kvmtool to inject SError into a guest,
> but that isn't quite what you have here.

KVM provides APIs to inject the SError, Qemu/kvmtool call the API though IOCTL, may be OK?


> 
> The VSESR value should always come from user space. The only exception are
> SErrors that we know weren't due to RAS: for these we should set the VSESR to
> zero to keep the existing behaviour.
> 
> 
> Thanks,
> 
> James
> .
> 

