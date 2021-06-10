Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp293656lfa;
        Thu, 10 Jun 2021 01:45:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRhmVAoVjZDGj1kdidaV0EvyDKbSvFlKojKo3Duye/yt0mIoqq7UTzZHsK6C20mdFjQKWg
X-Received: by 2002:a05:600c:22d7:: with SMTP id 23mr13495310wmg.119.1623314738129;
        Thu, 10 Jun 2021 01:45:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623314738; cv=none;
        d=google.com; s=arc-20160816;
        b=aI5SMRU6BVUsBTh87cb9JQlJDL/re1pbMq75ACrF2KKZTnm/jEyjyDp+e1ibuiXRa3
         9Z5BLGNv27EBqrxRSlwvxlGcH9vf7/hCx5xdTKM1x17xK/KTUy482ZOArnjjo5Bycmo9
         UVhjiLsJJw/ro6Fi4cWjrW+oIO77QDYUDGuLjs/VX6kEnjlSkJUhIOY8GXyJAwKt9XQ4
         14VizlQ7UVFnoPr2ICh8W8kLRT5bSsi64Fib9zQ0gNPukDs8PrTovcn+HwFid1O64IEV
         h1R2zo6yuNuLXcCnsCKuEHrUE1Jf+PAv3ZNdbhyFM4O0fADlaehgbtk84RrWSda91tHs
         lbkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:dkim-signature:dkim-signature:dkim-signature;
        bh=FpsiTI52aiOKU/L8m5fxuw/FXDNR0B1dQwtJon8UWwo=;
        b=Kx8lsZEb6hKX8WLJ9ZdBpuuvYG/h1xMY35afOYTOfmGRQ21DJY6+OXK2FVTmmp4T1K
         F3gBgBKBZ27taCVQk2xtDLFVFnTljwCp98jd1u69AueDXh03KDaJbHPwdVben7YZswYs
         m11R4q3W/gzKEVn/nBJUHbRUIuNkypjbOi8+dkmUEN8fLjvpg5B38+mmItkyEljeuJT7
         Yh1viu1N4THXfkOCPscfK3Pg79wY+7/DWP/EbUj2cYNEw0xd50ervSUhn3y25CVQGfmL
         G24vtIFhZFAF6QVLnqREVgCmuX7ojuKGPVL8SZR3iFuzMbCPmpY7Y1QBovucCKmxUo8P
         NJeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=SsrNhZnJ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=LFWlMQkQ;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=SsrNhZnJ;
       dkim=neutral (no key) header.i=@suse.de header.b=LFWlMQkQ;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=cfontana@suse.de
Return-Path: <cfontana@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id z14si2370877wro.17.2021.06.10.01.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 01:45:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=SsrNhZnJ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=LFWlMQkQ;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=SsrNhZnJ;
       dkim=neutral (no key) header.i=@suse.de header.b=LFWlMQkQ;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=cfontana@suse.de
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8EC9C1FD60;
	Thu, 10 Jun 2021 08:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1623314737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FpsiTI52aiOKU/L8m5fxuw/FXDNR0B1dQwtJon8UWwo=;
	b=SsrNhZnJXkEcLCwzZSKIGk/bnMvOmzNKGBXm//n5R5MbXejxl6qRT384bML5s860+b+lHa
	ndYv5cpPNq1CSD107jtQ4SS4zYaal5v4HmyVYBSlAnOdrbQXlZUhVNk7ozlToEwFbIGqMa
	kYPdcVJuiiCnSPhhY7gATLsiQxuO2+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1623314737;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FpsiTI52aiOKU/L8m5fxuw/FXDNR0B1dQwtJon8UWwo=;
	b=LFWlMQkQ4kKJ3gIww5FvtBR6bDo+PCwoYPxGkcbeTZ0Jrvg2LTTTAfSzQ7CdSSRa8zzJjR
	91AScBel19Vak/Dg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
	by imap.suse.de (Postfix) with ESMTP id 593BF11A98;
	Thu, 10 Jun 2021 08:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1623314737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FpsiTI52aiOKU/L8m5fxuw/FXDNR0B1dQwtJon8UWwo=;
	b=SsrNhZnJXkEcLCwzZSKIGk/bnMvOmzNKGBXm//n5R5MbXejxl6qRT384bML5s860+b+lHa
	ndYv5cpPNq1CSD107jtQ4SS4zYaal5v4HmyVYBSlAnOdrbQXlZUhVNk7ozlToEwFbIGqMa
	kYPdcVJuiiCnSPhhY7gATLsiQxuO2+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1623314737;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FpsiTI52aiOKU/L8m5fxuw/FXDNR0B1dQwtJon8UWwo=;
	b=LFWlMQkQ4kKJ3gIww5FvtBR6bDo+PCwoYPxGkcbeTZ0Jrvg2LTTTAfSzQ7CdSSRa8zzJjR
	91AScBel19Vak/Dg==
Received: from director2.suse.de ([192.168.254.72])
	by imap3-int with ESMTPSA
	id XbBUFDHRwWALIgAALh3uQQ
	(envelope-from <cfontana@suse.de>); Thu, 10 Jun 2021 08:45:37 +0000
Subject: Re: [PATCH v16 78/99] target/arm: cpu-exceptions,
 cpu-exceptions-aa64: new modules
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-79-alex.bennee@linaro.org>
 <d0865350-88f9-0f91-f984-25832c0f289b@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <d62d06c3-5b14-56bc-c5a5-d5e960a9d7d7@suse.de>
Date: Thu, 10 Jun 2021 10:45:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d0865350-88f9-0f91-f984-25832c0f289b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: x+XL9lDDc4rW

On 6/5/21 10:50 PM, Richard Henderson wrote:
> On 6/4/21 8:52 AM, Alex Bennée wrote:
>> diff --git a/target/arm/cpu-exceptions-aa64.h b/target/arm/cpu-exceptions-aa64.h
>> new file mode 100644
>> index 0000000000..64f800a15d
>> --- /dev/null
>> +++ b/target/arm/cpu-exceptions-aa64.h
>> @@ -0,0 +1,28 @@
>> +/*
>> + * QEMU AArch64 CPU Exceptions Sysemu code
>> + *
>> + * Copyright (c) 2012 SUSE LINUX Products GmbH
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * as published by the Free Software Foundation; either version 2
>> + * of the License, or (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, see
>> + *<http://www.gnu.org/licenses/gpl-2.0.html>
>> + */
>> +
>> +#ifndef CPU_EXCEPTIONS_AA64_H
>> +#define CPU_EXCEPTIONS_AA64_H
>> +
>> +#include "cpu.h"
>> +
>> +void arm_cpu_do_interrupt_aarch64(CPUState *cs);
>> +
>> +#endif /* CPU_EXCEPTIONS_AA64_H */
> 
> I don't see the point in the excessive replication of header files, for exactly 
> one declaration.  This is not the first example.
> 
> What's wrong with internal.h? 

Doesn't mean anything and leads to a mess of unrelated code.
I think we should be better at creating meaningful modules, instead of collections of unrelated functions.

Not defending this particular change, just answering your specific question.

Thanks,

C


> Or some other header that collects sysemu 
> specific declarations?
> 
> Also, "cpu.h" is not required by this declaration, as I've pointed out before.
> 
> 
> r~
> 
