Received: by 10.25.15.197 with SMTP id 66csp1220409lfp;
        Sun, 25 Jun 2017 22:30:09 -0700 (PDT)
X-Received: by 10.55.221.77 with SMTP id n74mr15643340qki.173.1498455008922;
        Sun, 25 Jun 2017 22:30:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498455008; cv=none;
        d=google.com; s=arc-20160816;
        b=hViGhmTud60PV26lQ1AfsqkuVbhLw4CQ42wEYwl6kadyWDUssT0ubM5TZ1a4bPfiGq
         RG2XlN1ni64HF/azLEmdN4pw4oUhaED4Uqol//hpfgccv8xUkFgsfwYEP3x9fmqBbbPK
         LUFwTAaXkrFihq08EANidykgs3NaEVDsFpnIoOevPxI6e1gYJsTrErR3pWNwz5OF5+cw
         vdUNQF/zEGvilBeqx+pqLTAkwM6SH4zL9tOCm89YWGAWgQEcM0JMxfmZ9qbeKeEm8eRG
         kdYJnBoU50L19FHMdCznQ3nlY3ocT6frvF4tBWVfH5AYc0PZVjDEoMkFnKe40NPWhYOk
         5aWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=wnqruYCyIoLF7NxirOGZACCe2sgEZF8SG8hj+EWf8EM=;
        b=AITttIKRruKmFJSF6WFFv3pCnfESVpEgB+G9rrlzejZbpH5+8x4Eg9PEDT/d7LYPFZ
         bTPIZCz58P4ifoRE8teE/GgqMCQUeA6iDg/edsi6EVAXZPo7gjwg7K+vqVPdAPDjBtL9
         j5OgW5br5UGvqO5r3SdSMKB8dcxtOiqjN/LTk7UZ8lP670Yf8L2okPRfgmDdtwS5iiIi
         cgzdF8otyyYGDKG4riZV/Lbgq+z1prvG2GbPTwewp/BqoRI4nRb4Qe3SChPqFDG5AyWq
         Ntn87jYmItyCvAzZZlooBJbPaSKw6ZWBS39oA+pSu/Hq1luNjS7taijvYeLjYUHiJQb+
         csXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f30si10685118qta.14.2017.06.25.22.30.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 25 Jun 2017 22:30:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44763 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dPMb8-00011U-Ag
	for alex.bennee@linaro.org; Mon, 26 Jun 2017 01:30:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dPMb2-000111-Js
	for qemu-arm@nongnu.org; Mon, 26 Jun 2017 01:30:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dPMay-0000KM-Kl
	for qemu-arm@nongnu.org; Mon, 26 Jun 2017 01:30:00 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3952)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1dPMay-0000Hv-15; Mon, 26 Jun 2017 01:29:56 -0400
Received: from 172.30.72.54 (EHLO dggeml405-hub.china.huawei.com)
	([172.30.72.54])
	by dggrg02-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id APZ86254; Mon, 26 Jun 2017 13:23:02 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by dggeml405-hub.china.huawei.com
	(10.3.17.49) with Microsoft SMTP Server id 14.3.301.0; Mon, 26 Jun 2017
	13:22:52 +0800
To: James Morse <james.morse@arm.com>
References: <1493530677-4919-1-git-send-email-gengdongjiu@huawei.com>
	<5908A5BC.1060202@arm.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <9e94c06f-f438-7106-ac96-67e021dcf729@huawei.com>
Date: Mon, 26 Jun 2017 13:22:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <5908A5BC.1060202@arm.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.59509A39.0108, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 29ff11dbc02fc2cfc505e5889d3955c1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.188
Subject: Re: [Qemu-arm] [PATCH v3 1/3] arm64: kvm: support kvmtool to detect
 RAS extension feature
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
X-TUID: /cAXTjp3A/Fj

Hi James,

   I have changed the SEA/SEI injection method according you suggestion, but I think this patch may also be needed.
Now for the  SEI, the virtual ESR value is specified by the userspace. only RAS extension support to set the virtual ESR value. so user space will check it to decide whether pass the virtual ESR value.
At the same time, reserve this interface for other possible usage by user space. what do you think about this patch?



On 2017/5/2 23:29, James Morse wrote:
> Hi Dongjiu Geng,
> 
> On 30/04/17 06:37, Dongjiu Geng wrote:
>> Handle kvmtool's detection for RAS extension, because sometimes
>> the APP needs to know the CPU's capacity
> 
>> diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
>> index d9e9697..1004039 100644
>> --- a/arch/arm64/kvm/reset.c
>> +++ b/arch/arm64/kvm/reset.c
>> @@ -64,6 +64,14 @@ static bool cpu_has_32bit_el1(void)
>>  	return !!(pfr0 & 0x20);
>>  }
>>  
>> +static bool kvm_arm_support_ras_extension(void)
>> +{
>> +	u64 pfr0;
>> +
>> +	pfr0 = read_system_reg(SYS_ID_AA64PFR0_EL1);
>> +	return !!(pfr0 & 0x10000000);
>> +}
> 
> Why are we telling user-space that the CPU has RAS extensions? EL0 can't do
> anything with this and the guest EL1 can detect it from the id registers.
> 
> 
> Are you using this to decide whether or not to generate a HEST for the guest?
> 
> If Qemu/kvmtool supports handling memory-failure notifications from signals you
> should always generate a HEST. The GHES notification method could be anything
> Qemu can deliver to the guest using the KVM APIs. Notifications from Qemu to the
> guest don't depend on the RAS extensions. KVM has APIs for IRQ and SEA (you can
> use KVM_SET_ONE_REG).
> 
> 
> I think we need a new API for injecting SError for SEI from Qemu/kvmtool, but it
> shouldn't be related to the RAS extensions. All v8.0 CPUs have HCR_EL2.VSE, so
> we need to know KVM supports this API.
> 
> Your later patch adds code to set VSESR to make virtual RAS SErrors work, I
> think we need to expose that to user-space.
> 
> 
> Thanks,
> 
> James
> .
> 

