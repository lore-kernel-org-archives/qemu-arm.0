Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp74506wru;
        Wed, 26 Jun 2019 06:40:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwS3AACnzjkUFCd0u55afMtrYWi0Yc/4TncehecwlkSshE4BEvcrSuzFnLXBS3ZOpQcANvY
X-Received: by 2002:ac8:829:: with SMTP id u38mr3754538qth.79.1561556421820;
        Wed, 26 Jun 2019 06:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561556421; cv=none;
        d=google.com; s=arc-20160816;
        b=k3XUbTXXJukfQh2MMOE1MPidJM9+WP/wJx78WVOc4n4gbVdeNwOzUx9SL7UEAuPWTL
         0H4hxoLh/sec8zm/ImMWA9JYIUTJIgGFrePtqPMe2/Mo7KzbuMOVXUPFmK1HSM8SyMwI
         hNJxHHShq9zXL3J9vIbR1JwdKevg4PHJ1XVQ1RG8fpRaR3cXiJvA9WIxlf1xHq3xeLDh
         0NIGBavtkYzNvcCk3BT9/j0V4RLyCmj7UThcLMO3MhbMNudwvGsdPIW1LnezgW30GrIr
         aqnoV7vGIqdwckQZagphX9YdKIdp+vKCZT77henEqVl8Z+s2aciNDZk5tH9T3Bd9oe7E
         kWZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=Bz8haD1WhSgr6sljY7c2CWaz+W9B13vC2IskkCkDXMo=;
        b=tnkO318B51cyFnXheKQK38ADTOFpmF39A2Zl9OFX2WYYhU/HOFb7nZXmSA5o8cOILS
         bljv18U9rtnzZE28dBMdPSxDwKw/MQ255VH4fprJCZ/FgupDXlt1zhHvKIYnvm44SZbI
         gsL8/tvVefg36ab2T7NLKQCBZk4KFo0dV8vMUF1qkImQ5VBFcr+vsn4bydTr82XukxqJ
         jholzWnAc4K//mwSs619u5Kr0iqZ+8MkHHppAKc3iF1Nsjb7GPN6QkW5Ms9gJ4qAAM0E
         KN4SgUTzvkgRF8IpOFJ2acRBtfMvTqaGOuwi2rf1kNuNWX6u8EQ815TdVV5Hr0mzN18D
         XwWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id e64si11647633qtb.388.2019.06.26.06.40.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 06:40:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F10AD307D925;
	Wed, 26 Jun 2019 13:40:15 +0000 (UTC)
Received: from [10.36.116.89] (ovpn-116-89.ams2.redhat.com [10.36.116.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 008155D717;
	Wed, 26 Jun 2019 13:40:12 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2 05/14] target/arm/helper: zcr: Add build
 bug next to value range assumption
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, armbru@redhat.com, imammedo@redhat.com,
 alex.bennee@linaro.org, Dave.Martin@arm.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-6-drjones@redhat.com>
 <3c24d706-4ee5-336d-8f74-adae672c450d@redhat.com>
 <20190626132846.lj62nu4orn3nhnug@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <4c96ac11-1195-81d5-79d9-ee3d5e92210e@redhat.com>
Date: Wed, 26 Jun 2019 15:40:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190626132846.lj62nu4orn3nhnug@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 26 Jun 2019 13:40:21 +0000 (UTC)
X-TUID: MQ4Q/m7pP5Ky

Hi,

On 6/26/19 3:28 PM, Andrew Jones wrote:
> On Wed, Jun 26, 2019 at 12:01:10PM +0200, Auger Eric wrote:
>> Hi Drew,
>>
>> On 6/21/19 6:34 PM, Andrew Jones wrote:
>>> Suggested-by: Dave Martin <Dave.Martin@arm.com>
>>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>>> ---
>>>  target/arm/helper.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>> index df4276f5f6ca..edba94004e0b 100644
>>> --- a/target/arm/helper.c
>>> +++ b/target/arm/helper.c
>>> @@ -5319,6 +5319,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>>>      int new_len;
>>>  
>>>      /* Bits other than [3:0] are RAZ/WI.  */
>>> +    QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
>> Can you document in the commit message why this check is critical?
> 
> Sure. I can copy+paste the email subject into the commit message :-)
Well that's not what I asked for. Are you enforcing an architectural
maximum of 2048 bits or is the limitation due to some data structs in
the existing code, ... For a non expert reviewer as I am it is not
totally obvious.

Thanks

Eric
> 
> drew
> 
>>
>> Thanks
>>
>> Eric
>>>      raw_write(env, ri, value & 0xf);
>>>  
>>>      /*
>>>
>>
