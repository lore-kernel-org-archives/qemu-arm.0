Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp810796wrt;
        Wed, 9 Jan 2019 08:19:47 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5Kt4gdRWP9GyeLUw2UeRRciCQxVThnL79Z2RS/b0LWDlM7pRJejV/H6aEoKjB6zt0IovNE
X-Received: by 2002:a50:94f4:: with SMTP id t49mr6643743eda.24.1547050787396;
        Wed, 09 Jan 2019 08:19:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547050787; cv=none;
        d=google.com; s=arc-20160816;
        b=wgLsgGT9jqxKMBTS1DqbvpJcy9aE39BYnNIQmN1RvJh2jf81C0cOj+FSzSeOvAlBXs
         9cMW44NyjlpuDNkjUGRqTOnB8CLDcPKJo8k1xzRkTvL0uiUlGambgLmieyKj/i5AC0zt
         YU5pg+yoJ35Q8/7eGb5pOT+PiHHpDeu1idoHjC9qySdATA/qttFZ/Ar3PoyWjFoZVYVV
         tuz0zAHduumvMb1YVzoIDPw58BF5qiQqNnNHGKSI2qcrIgczaBD3uwLMibU2q7t+3dcK
         ZC67EWig5yMcBQTMuRKQl63yWYCMYfwE3iYvmSs4sxIycfrAmb3eZxNFL/dOcWU98RlX
         gCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=BtxEDhEMZQ2M0axEghCGtSAr0M5IqG2fD8CXAPBXLPE=;
        b=YGPjAhwuArXecVAo+XUglCDZpOa/oFyg1e9a7knPbRzDQxUIt9GyfQ6yXl/9EM0piU
         jV/dSNPn8IHdWFTwXJdC8yuhEz+aenujLyGo3DYQp1m3eq1vxyuhCRw1Q7khtOiOMYRk
         8qEjPObSxJOU+JQ9ujDCxLXRefUXJdvOX9qYusLHfyitNVhu4ceH6RrMgZ8kg9xWxNQO
         tEwJLKLnhIURBdF9DC0rsVpwT6K/YNAVZHlvA97xm4NWegeSFYU/MLBGbYmmx2LhLOKG
         /M/+bco5Ca5hUTwRDgOz6hcghWyoXvsEJMmQ3UrRgo5KvlpTm3KdaDD6incKIUM1X5cF
         DCjg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of agraf@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=agraf@suse.de
Return-Path: <agraf@suse.de>
Received: from mx1.suse.de (mx2.suse.de. [195.135.220.15])
        by mx.google.com with ESMTPS id k7si1626561edb.132.2019.01.09.08.19.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Jan 2019 08:19:47 -0800 (PST)
Received-SPF: pass (google.com: domain of agraf@suse.de designates 195.135.220.15 as permitted sender) client-ip=195.135.220.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of agraf@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=agraf@suse.de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 6DB84AEE1;
	Wed,  9 Jan 2019 16:19:46 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH] target/arm: Allow to switch from MON->HYP on
 AArch32
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Tom Rini <trini@konsulko.com>, qemu-arm@nongnu.org,
 Michal Simek <michal.simek@xilinx.com>,
 Stephen Warren <swarren@wwwdotorg.org>
References: <20190109152430.32359-1-agraf@suse.de> <871s5lx14y.fsf@linaro.org>
From: Alexander Graf <agraf@suse.de>
Message-ID: <36959924-c384-5850-9bea-0060fe744f2e@suse.de>
Date: Wed, 9 Jan 2019 17:19:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <871s5lx14y.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: TFgsonw2h7WW

On 01/09/2019 05:10 PM, Alex Bennée wrote:
> Alexander Graf <agraf@suse.de> writes:
>
>> In U-boot, we switch from S-SVC -> MON -> HYP when we want to enter
>> HYP mode. This dance seems to work ok (hence it's there in the code
>> base), but breaks with current QEMU.
> What EL is MON in this case? EL3? In which case I'm confused by the
> terminology as the ARM ARM states:
>
>    The principles of the ARMv8-A security model are:
>    • If the implementation includes EL3, then it has two Security states, Secure and Non-secure, and:
>      — EL3 exists only in Secure state.
>      — A change from Non-secure state to Secure state can only occur on taking an exception to EL3.
>      — A change from Secure state to Non-secure state can only occur on an exception return from EL3.
>
> We don't currently implement ARMv8.4-SecEL2 but that adds secure EL2 but
> as you can only switch security state in in/out of EL3 you have to be go
> to the secure monitor before you enter it.

Right - and exactly that switch seems to be prohibited here.

>
>> The reason seems to be that we try to see whether we are entering
>> HYP mode from the NS side. However, MON is always considered secure,
>> so we always fall into an error case when going MON->HYP and never
>> manage to actually do the switch.
>>
>> Fix this by not using a different helper function that does not bork
>> when we're in MON state, as that switch is supposed to work.
>>
>> Signed-off-by: Alexander Graf <agraf@suse.de>
>> ---
>>   target/arm/helper.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index f00c141ef9..9bf8fbd8f9 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -6297,7 +6297,7 @@ static int bad_mode_switch(CPUARMState *env, int mode, CPSRWriteType write_type)
>>           return 0;
>>       case ARM_CPU_MODE_HYP:
>>           return !arm_feature(env, ARM_FEATURE_EL2)
>> -            || arm_current_el(env) < 2 || arm_is_secure(env);
>> +            || arm_current_el(env) < 2 ||
>> arm_is_secure_below_el3(env);
> This seems to violate the rule that you can enter a NS state from
> anything other than EL3.

How so? This statement basically says "Only return to HYP from NS-HYP or 
EL3" now. Before it said "Only return to HYP from HYP".

Alex

>
>>       case ARM_CPU_MODE_MON:
>>           return arm_current_el(env) < 3;
>>       default:
>
> --
> Alex Bennée
>
