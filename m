Received: by 10.28.91.67 with SMTP id p64csp4892560wmb;
        Wed, 7 Mar 2018 04:48:20 -0800 (PST)
X-Google-Smtp-Source: AG47ELtgOALteLP8+baHnT+MdADGNlFTKezihkU8JUvO/I6Wpe2uPhf6bXvxYDFjJsIS1wKDEwUf
X-Received: by 10.13.237.129 with SMTP id w123mr679116ywe.475.1520426900224;
        Wed, 07 Mar 2018 04:48:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520426900; cv=none;
        d=google.com; s=arc-20160816;
        b=v8MCDlJSdHDDm71IXrW/fBhJcqN8qa4XeiaLnTEHicVTsKlAhL3k2sdhqD5aTgwNlG
         N3Hcugxo6ecpyslsbO4RAlgg1K047O+Bm0YgAkXoTH2z2A8xOoEq+87Al+iPuzCHM47I
         5wDilBGYe0I1zwAzRWFdUh9FHVkYDQ9WdkzIaVI6F9kO6VmwI4OL7hPJAaJQ8JoCw0fF
         +ELh2T0MpJwBNEdxvVOk8VIhHsQGjUmH2TDhknlCRS7W0aSI8kHludk6Cx/row4/0wrF
         6IdbsRGu2Mzw66iz3KE6zfQkv9rg6JYdSxlRUkHdGi4o2rIbUEHzG4xa3GVruwdkLPFD
         2OKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to
         :arc-authentication-results;
        bh=33ePGMlftlrWzh2e5KICWqTK9P4MPSlxmt5XyUZBYjI=;
        b=M5kufmaCUAIDFuFUQdd5F8Uuu4kUCXP16rnLJ/Ahk26Ep6cBXKvRK3d6HwYwL5GFV+
         y9G7/K6s7wNV6713CGdhkByF/g57MjTNnJEqP77KMID9iI/XFipUTKxa4msHU2LzN4fr
         lDdOxx80Xa8siF4HdGsgplnh3HeJuykDSP3PFxE0b6Q3+6UqbyVFHCZzTQu8/1iGFxPU
         JDvpZXonZLfhyR79odEh/ZhppaYVyRL4ktlCR+J3hGH+21o4aicdVxT14wuuQciu7PxI
         8/st+3rF+OkqR2ZzzFYpRgMf2GpNiEffvo1FjXcSscU058Xu43BVXKPLB8AFEvVgVU7b
         OHcg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 136si2987987ywr.267.2018.03.07.04.48.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Mar 2018 04:48:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33014 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etYUV-0001cE-Kh
	for alex.bennee@linaro.org; Wed, 07 Mar 2018 07:48:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marc.zyngier@arm.com>) id 1etYU2-0001Ng-4d
	for qemu-arm@nongnu.org; Wed, 07 Mar 2018 07:47:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marc.zyngier@arm.com>) id 1etYTx-0006fm-8w
	for qemu-arm@nongnu.org; Wed, 07 Mar 2018 07:47:50 -0500
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:57600
	helo=foss.arm.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marc.zyngier@arm.com>)
	id 1etYTx-0006fa-1I; Wed, 07 Mar 2018 07:47:45 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2FF01435;
	Wed,  7 Mar 2018 04:47:42 -0800 (PST)
Received: from [10.1.207.62] (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
	6C47A3F487; Wed,  7 Mar 2018 04:47:41 -0800 (PST)
To: David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>
References: <000e01d3afad$b9a13830$2ce3a890$@codeaurora.org>
	<20180227104708.GA11391@cbox>
	<ac329e1b1f5265a805916ab4f8708f9d@codeaurora.org>
	<20180227124604.GA2373@cbox>
	<20180227132131.fipafmnb56a7fj76@kamzik.brq.redhat.com>
	<20180301105030.2b716e68@redhat.com>
	<CAFEAcA9yaU745Asy--jM0nu8FDJ62CEXSH_TKa-ZZfC16qye6w@mail.gmail.com>
	<b049a501-cd5e-8c22-9c62-88c950e01b1b@redhat.com>
From: Marc Zyngier <marc.zyngier@arm.com>
Organization: ARM Ltd
Message-ID: <acd04e77-33c9-71f1-c140-1f9c20da8022@arm.com>
Date: Wed, 7 Mar 2018 12:47:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <b049a501-cd5e-8c22-9c62-88c950e01b1b@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [Qemu-devel]  VCPU hotplug on KVM/ARM
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
Cc: Christoffer Dall <cdall@cs.columbia.edu>,
	Christoffer Dall <christofferdall@christofferdall.dk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DYN1pYWM7qZn

On 01/03/18 13:32, David Hildenbrand wrote:
> On 01.03.2018 11:05, Peter Maydell wrote:
>> On 1 March 2018 at 09:50, Igor Mammedov <imammedo@redhat.com> wrote:
>>> In QEMU on x86 (and I think ppc, s390 as well), we create vCPUs on demand.>>
>>> It would be nice if ARM would be able to do that too,
>>> so that it could take advantage of the same code.
>>
>> It's not clear to me how that would work, given that for
>> instance the interrupt controller wants to know up-front
>> how many CPUs it has to deal with.
>>
> 
> So how is cpu hotplug handled in HW? Or doesn't it even exist there?

I don't know of any physical system offering that facility.

> (we have max_cpus for the interrupt controller, but not sure if that is
> what we want)
We'd need something along those lines. Each CPU has a notional point to
point link to the interrupt controller (to the redistributor, to be
precise), and this entity must pre-exist.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
