Received: by 10.25.205.13 with SMTP id d13csp5936839lfg;
        Tue, 27 Dec 2016 07:27:28 -0800 (PST)
X-Received: by 10.84.194.37 with SMTP id g34mr67740347pld.36.1482852448800;
        Tue, 27 Dec 2016 07:27:28 -0800 (PST)
Return-Path: <cov@codeaurora.org>
Received: from smtp.codeaurora.org (smtp.codeaurora.org. [198.145.29.96])
        by mx.google.com with ESMTPS id t4si21839874pgo.14.2016.12.27.07.27.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Dec 2016 07:27:28 -0800 (PST)
Received-SPF: pass (google.com: domain of cov@codeaurora.org designates 198.145.29.96 as permitted sender) client-ip=198.145.29.96;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeaurora.org;
       dkim=pass header.i=@codeaurora.org;
       spf=pass (google.com: domain of cov@codeaurora.org designates 198.145.29.96 as permitted sender) smtp.mailfrom=cov@codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 37290611C3; Tue, 27 Dec 2016 15:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1482852448;
	bh=PgekIzEpT9PdB7JKbpdnUjWaOfY4kRquKJn1DyUS63s=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
	b=na+ZAlFfhHlydaWngRjQtli4f2nFwE7Y+AnKn/EosE1KGB4mZLp7Xw1dGmd+sDYmB
	 eihzgVyOuP9qPToJCjziVhjlPkYEQ/BGUvrrB0qgwT1bkp6C+V6ZoRmiP4HMX43Es0
	 aQ/4m9uZ/EojSMHa/kYChJ95117iL/MnEugwfnxk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,SPF_PASS,T_DKIM_INVALID autolearn=no autolearn_force=no
	version=3.4.0
Received: from [10.228.68.87] (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: cov@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id BC0816115B;
	Tue, 27 Dec 2016 15:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1482852447;
	bh=PgekIzEpT9PdB7JKbpdnUjWaOfY4kRquKJn1DyUS63s=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
	b=l1FtZclqcU6r+3yczAhFP2oSF4AZauwJL1i3R+30VV3ZSACWeJlICmd5ybFR2+ZNn
	 EZw+2cMyi6bSaiFTYVRnV+xTaACBSFRW2NqyrUUKGuX125yU8HNVNWsUqLguMdq/FN
	 DfZriFyCcPaZdveYVWXb5HxfD/NiEPzGQoGsSY6A=
DMARC-Filter: OpenDMARC Filter v1.3.1 smtp.codeaurora.org BC0816115B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=pass smtp.mailfrom=cov@codeaurora.org
Subject: Re: [Qemu-devel] [PATCH kvm-unit-tests v8 03/10] arm/arm64: add some
 delay routines
To: Andrew Jones <drjones@redhat.com>, Andre Przywara <andre.przywara@arm.com>
References: <20161208175030.12269-1-drjones@redhat.com>
 <20161208175030.12269-4-drjones@redhat.com>
 <dfb48863-82a7-3bd2-d2dc-498570325970@arm.com>
 <20161209121541.i3advgnpbu5gvoft@hawk.localdomain>
Cc: peter.maydell@linaro.org, kvm@vger.kernel.org, marc.zyngier@arm.com,
 qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, kvmarm@lists.cs.columbia.edu,
 christoffer.dall@linaro.org
From: Christopher Covington <cov@codeaurora.org>
Message-ID: <cd3f8a17-f080-5ac8-9398-cddee4d23521@codeaurora.org>
Date: Tue, 27 Dec 2016 10:27:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2
MIME-Version: 1.0
In-Reply-To: <20161209121541.i3advgnpbu5gvoft@hawk.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: fv4F6CHMepon

On 12/09/2016 07:15 AM, Andrew Jones wrote:
> On Fri, Dec 09, 2016 at 11:41:06AM +0000, Andre Przywara wrote:
>> Hi,
>>
>> On 08/12/16 17:50, Andrew Jones wrote:
>>> Allow a thread to wait some specified amount of time. Can
>>> specify in cycles, usecs, and msecs.

>>> +++ b/lib/arm/asm/delay.h
>>> @@ -0,0 +1,14 @@
>>> +#ifndef _ASMARM_DELAY_H_
>>> +#define _ASMARM_DELAY_H_
>>> +/*
>>> + * Copyright (C) 2016, Red Hat Inc, Andrew Jones <drjones@redhat.com>
>>> + *
>>> + * This work is licensed under the terms of the GNU LGPL, version 2.
>>> + */
>>> +#include <libcflat.h>
>>> +
>>> +extern void delay(u64 cycles);
>>
>> Nit: Shouldn't this parameter be called "ticks"? Cycles might be a bit
>> misleading, especially since this prototype is the only documentation on
>> this. You might just want to fix this when applying the patches.
> 
> Right or wrong the kernel uses 'cycles' for this function, named
> __timer_delay for arm and __delay for arm64. I guess I prefer
> consistency here.

I too expect timers to tick and CPUs to cycle. The benefit of
parameter-name-precise consistency with the Linux source is not
obvious to me.

Cov

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc. Qualcomm Technologies, Inc. is a member of the Code
Aurora Forum, a Linux Foundation Collaborative Project.
