Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp101806wru;
        Wed, 26 Jun 2019 07:06:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqynr6k0Q8XJ4q4AKLSiLW+Q1P1k9bVa5pK4QqopztD0ElGh04hoDWmEzn/qxboeMNwzMDDA
X-Received: by 2002:a05:620a:1285:: with SMTP id w5mr3804158qki.302.1561558007620;
        Wed, 26 Jun 2019 07:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561558007; cv=none;
        d=google.com; s=arc-20160816;
        b=EpT4c1rMBrRLNndK77v8m/fNTH9a+mrCtR57pByF3NqEuf51JDb7Pk8zu3f86OXS7r
         J+VWf2RkHvVe+J/G/N/GrmqS2ezqS2VVE+9fca0MXG7pFdBfOhAR3k2buKjVEodZhelk
         t9fNsRpPRKXRw9WVF4vOyaO6lA/knOY71d8qDbCpZytZedllQbDxLiqKQRPJ2Aajop/r
         FOYz4rykr6RvJcfoD42kWFfPJ5U/qBc9BOY+bL9Qc4fmww9x2Nq24aTmh7nln2xCTO7y
         wd/i+nuj+Cn/W7YLYXCDQ93vVTtP/UTsiujAOmQp6f9WdxDXwGZzrmqvW+znPshZSPe8
         +cFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=xY2qChJZ9UD3sg0kfZEvKvNaQuZCRcbWz1sBxQsENlA=;
        b=P/LXYiwjKG98Nv7P582rZ2pnURyk/jKlMO/2Ug+2OiK8pNGU9v/Hq5EYdHjEHqv9iL
         GK4RMML51O973X3Gqah37Y3ay8eSen2qy94Hm/eODWoZYS7DTODb7SdxqiIG4BuHNIAc
         dsxdgt0UJmb89eC/UDiX2sdh0SdSsomOq5vlTpLT2Lcuq7tT/QA7eqcLuePocYdY+8UH
         ZIj3sTkcMRQ1I1IWd8ZM/3QiiODtwJP5qfLgFithHIkA/xb5yE0tePUdbYW8LjnwEXkR
         o4nc+gFsERyumUfqHgClwRFq7KUSqKqNUx0zcXlbJn9MfIVunIzU1or0YDiKOgWR8N1U
         uz/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id m38si11908922qtb.297.2019.06.26.07.06.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 07:06:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6FE942F8BD3;
	Wed, 26 Jun 2019 14:06:34 +0000 (UTC)
Received: from [10.36.116.89] (ovpn-116-89.ams2.redhat.com [10.36.116.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F13A60852;
	Wed, 26 Jun 2019 14:06:27 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2 05/14] target/arm/helper: zcr: Add build
 bug next to value range assumption
To: Andrew Jones <drjones@redhat.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, armbru@redhat.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-6-drjones@redhat.com>
 <3c24d706-4ee5-336d-8f74-adae672c450d@redhat.com>
 <20190626132846.lj62nu4orn3nhnug@kamzik.brq.redhat.com>
 <4c96ac11-1195-81d5-79d9-ee3d5e92210e@redhat.com>
 <20190626135806.l6mna6swbdncbb2a@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <02271858-b1c3-26aa-c62d-14518d46616a@redhat.com>
Date: Wed, 26 Jun 2019 16:06:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190626135806.l6mna6swbdncbb2a@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Wed, 26 Jun 2019 14:06:46 +0000 (UTC)
X-TUID: I3YNirfrjLvz

Hi,

On 6/26/19 3:58 PM, Andrew Jones wrote:
> On Wed, Jun 26, 2019 at 03:40:11PM +0200, Auger Eric wrote:
>> Hi,
>>
>> On 6/26/19 3:28 PM, Andrew Jones wrote:
>>> On Wed, Jun 26, 2019 at 12:01:10PM +0200, Auger Eric wrote:
>>>> Hi Drew,
>>>>
>>>> On 6/21/19 6:34 PM, Andrew Jones wrote:
>>>>> Suggested-by: Dave Martin <Dave.Martin@arm.com>
>>>>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>>>>> ---
>>>>>  target/arm/helper.c | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>>>> index df4276f5f6ca..edba94004e0b 100644
>>>>> --- a/target/arm/helper.c
>>>>> +++ b/target/arm/helper.c
>>>>> @@ -5319,6 +5319,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>>>>>      int new_len;
>>>>>  
>>>>>      /* Bits other than [3:0] are RAZ/WI.  */
>>>>> +    QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
>>>> Can you document in the commit message why this check is critical?
>>>
>>> Sure. I can copy+paste the email subject into the commit message :-)
>> Well that's not what I asked for. Are you enforcing an architectural
>> maximum of 2048 bits or is the limitation due to some data structs in
>> the existing code, ... For a non expert reviewer as I am it is not
>> totally obvious.
> 
> How's this for the commit message
> 
>     The current implementation of ZCR_ELx matches the architecture, only
>     implementing the lower four bits, with the rest RAZ/WI. This puts
>     a strict limit on ARM_MAX_VQ of 16. Make sure we don't let ARM_MAX_VQ
>     grow without a corresponding update here.
Yep perfect. Thanks

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> 
> Thanks,
> drew
> 
>>
>> Thanks
>>
>> Eric
>>>
>>> drew
>>>
>>>>
>>>> Thanks
>>>>
>>>> Eric
>>>>>      raw_write(env, ri, value & 0xf);
>>>>>  
>>>>>      /*
>>>>>
>>>>
> 
