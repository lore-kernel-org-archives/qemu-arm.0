Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1147189wru;
        Thu, 27 Jun 2019 04:00:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzuWh3xKy/9HsUV55550u4yR6EGTwAyJQ9dnKh+Kd1ybglEqvDvGl/w3AI0+ajIVx6lf/a7
X-Received: by 2002:a0c:b7a8:: with SMTP id l40mr2523076qve.142.1561633248518;
        Thu, 27 Jun 2019 04:00:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561633248; cv=none;
        d=google.com; s=arc-20160816;
        b=wkiWB/UQEUOFl/ProFu8bofcwIzFyJ+50ZYoZcpqtSFkd3FB6Qq1233arBsqcuvBGh
         aOmTCSZqqPrw7oNvoxjK9NLNRgNFwHfSloe0BbYigNFRV2v1oISag5/v6RB+/sRz3Ybs
         O9r4P19OIqXM3jcA/BMF74hWzHvH8S1dvM4Tc75YGtrHLTs/qEXsWPuuDKDiuPmC2tDF
         TBiizjBfSxNC/JDtFFla0DOAcYsngl+Lskr/vpyg1BlDhGJRERO4BnLoET1KiYKCDJFe
         Q/SM5i07DrMUc2nbkyMoqXooPfV/usXA1puaugPtkcwraY+DAIo6TeXIdWiIqb8BuGMP
         kDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=NM0YQfIBHrBwWLj3e9KyWBiLsj//XGrNJHdux+1ONz0=;
        b=CVM7afMjna8lZ3wEZ7BoVBtwXlWP1Ka5bZGk/G0wD5r/cz4K4j6+/HRX9B4Zv5voDt
         MYzfJpWrWpqEoKrMBtPp+Buu3gndilR3MeihmoRM5NYVfaQEE8xS93+QEB5XIjDBfjIW
         4oTRmP2Z45ImWUUkw2Y/+C/ruRzFkSkkL4qgm24UBPw46rCwaAvWOSNdQbGEQ8qY5DBH
         nKFFrC6oOGRwlT81PhiQqX4iKAKrIjgM14/UV/fuL3Kuz0DiLrMz4kYzX1URKApz3hwC
         dEi4Gnjz2I7LMHL0N4VNE8hxsBXqRzrdic+CFqjKIcxE8u5EJnWjMZ/FwJHvjY5D8LtW
         ADOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id i22si1288063qvh.223.2019.06.27.04.00.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 04:00:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7895A31628EC;
	Thu, 27 Jun 2019 11:00:46 +0000 (UTC)
Received: from [10.36.116.89] (ovpn-116-89.ams2.redhat.com [10.36.116.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B18F60C62;
	Thu, 27 Jun 2019 11:00:28 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2 07/14] target/arm/cpu64: max cpu:
 Introduce sve<vl-bits> properties
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, armbru@redhat.com, imammedo@redhat.com,
 alex.bennee@linaro.org, Dave.Martin@arm.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-8-drjones@redhat.com>
 <ee8ce4a6-09fd-47ab-ef7e-a231df1e9c1b@redhat.com>
 <20190627104638.x4gxsmv7vpww3mra@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ae98bf94-6826-1f2b-2f2e-a11a3f75cb92@redhat.com>
Date: Thu, 27 Jun 2019 13:00:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190627104638.x4gxsmv7vpww3mra@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Thu, 27 Jun 2019 11:00:46 +0000 (UTC)
X-TUID: 6yXpn4RKzAq1

Hi,

On 6/27/19 12:46 PM, Andrew Jones wrote:
> On Wed, Jun 26, 2019 at 06:56:54PM +0200, Auger Eric wrote:
>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>> index f500ccb6d31b..b7b719dba57f 100644
>>> --- a/target/arm/helper.c
>>> +++ b/target/arm/helper.c
>>> @@ -5324,7 +5324,16 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>>>  
>>>      /* Bits other than [3:0] are RAZ/WI.  */
>>>      QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
>>> -    raw_write(env, ri, value & 0xf);
>>> +    value &= 0xf;
>>> +
>>> +    if (value) {
>>> +        /* get next vq that is smaller than or equal to value's vq */
>>> +        uint32_t vq = value + 1;
>>> +        vq = arm_cpu_vq_map_next_smaller(cpu, vq + 1);
>>> +        value = vq - 1;
>> spec says:
>>
>> "if an unsupported vector length is requested in ZCR_ELx, the
>> implementation is required to select the largest
>> supported vector length that is less than the requested length. This
>> does not alter the value of ZCR_ELx.LEN.
>> "
>>
>> So I understand the value written in the reg should not be unmodified.
>>
> 
> Sorry, I can't parse what you're trying to tell me here. Here we have
> to write 'value', because that's what the guest is trying to do. As the
> spec says in your quote, we have to pick the length the guest wants, or
> the next smaller valid one, so that's what the code above does. So are
> you just stating that you agree with this hunk of the code?
What we are writing into the reg is arm_cpu_vq_map_next_smaller(cpu, vq
+ 1) -1. Maybe I misunderstand the whole wording but I would have
expected the original unmodified value to be written in the reg instead?

Thanks

Eric
> 
> Thanks,
> drew
> 
