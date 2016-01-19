Received: by 10.25.159.19 with SMTP id i19csp2608666lfe;
        Tue, 19 Jan 2016 08:58:20 -0800 (PST)
X-Received: by 10.31.141.10 with SMTP id p10mr21571073vkd.93.1453222699945;
        Tue, 19 Jan 2016 08:58:19 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x231.google.com (mail-vk0-x231.google.com. [2607:f8b0:400c:c05::231])
        by mx.google.com with ESMTPS id s131si29882197vke.181.2016.01.19.08.58.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jan 2016 08:58:19 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::231 as permitted sender) client-ip=2607:f8b0:400c:c05::231;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::231 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x231.google.com with SMTP id e64so15509296vkg.0
        for <alex.bennee@linaro.org>; Tue, 19 Jan 2016 08:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=0jCd9IfyflNbq9WrFDMiSK/E/kS0JSpWVPLUochZVRE=;
        b=DTbs52NI4TBSeXyCH0w9CMTuhNtuoXJvl6udcg/rlxCl9TWWZD/FArl3m1S9Gm+xcb
         ZK3duPB3wsltJyZ0DsNKuUNgFnzgq4C25hKQtl1i61PhYuIsr+EALU1/tb6Ta2KDDnEL
         RVYyADw4MgoDpfP8BkUZoCpVX6oUL/hkAqLZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=0jCd9IfyflNbq9WrFDMiSK/E/kS0JSpWVPLUochZVRE=;
        b=Co9HfLDeYz7MG+OHXWCq1f6aZXII5OatrhglWGhZBiAydCYoch3eorxxtoamCGZ+WB
         w2M28yXTc7zav//3VsXO9vt09f9P+z19tvI7NXtyDCwPUWCMyCGx2TSRMlt54DE0onyz
         RcI2+wxEgxHi0lb4XisdAckqZmpoalBYHuyzryXOEayKN42ROh9QFhOWpZVfIKRi4cgu
         9OTic2LErQVbnaoCi24B5fcQvimyrU8+yxjYAvitK1EayrvKoTWZJ1KzLKHZ84yQ3v4F
         0oZmLl5b437ow1OhkZyqjBEmkWJrKKtPr2veU2lZ2gl0Zqqj5iNRZqzsKuS6VhCbcMZX
         h6dQ==
X-Gm-Message-State: ALoCoQlfLGAoQ/cnJZ2bfxv7keucXkFD848LQ/+kiQRikC63lFbuBA5lk6K8iUX7RSDXyQBvXSe1NGwJ/c8jhckllKqFhC93toSUcun0BXdgsgasDa64VGE=
X-Received: by 10.31.180.145 with SMTP id d139mr18590056vkf.83.1453222699690;
 Tue, 19 Jan 2016 08:58:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 19 Jan 2016 08:58:00 -0800 (PST)
In-Reply-To: <20160119165331.GQ29396@toto>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
 <1452796451-2946-8-git-send-email-peter.maydell@linaro.org> <20160119165331.GQ29396@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2016 16:58:00 +0000
Message-ID: <CAFEAcA_zdZAGuP_unX+b_3F6gzA4ttM1X+c-zcxOfCYPPArNfw@mail.gmail.com>
Subject: Re: [PATCH 7/8] target-arm: Implement remaining illegal return event checks
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-TUID: XWS67Fty5qD/

On 19 January 2016 at 16:53, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> On Thu, Jan 14, 2016 at 06:34:10PM +0000, Peter Maydell wrote:
>> We already implement almost all the checks for the illegal
>> return events from AArch64 state described in the ARM ARM section
>> D1.11.2. Add the two missing ones:
>>  * return to EL2 when EL3 is implemented and SCR_EL3.NS is 0
>>  * return to Non-secure EL1 when EL2 is implemented and HCR_EL2.TGE is 1
>>
>> (We don't implement external debug, so the case of "debug state exit
>> from EL0 using AArch64 state to EL0 using AArch32 state" doesn't apply
>> for QEMU.)
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  target-arm/op_helper.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
>> index 38d46d8..5789ccb 100644
>> --- a/target-arm/op_helper.c
>> +++ b/target-arm/op_helper.c
>> @@ -718,6 +718,17 @@ void HELPER(exception_return)(CPUARMState *env)
>>          goto illegal_return;
>>      }
>>
>> +    if (new_el == 2 && arm_is_secure_below_el3(env)) {
>> +        /* Return to the non-existent secure-EL2 */
>> +        goto illegal_return;
>> +    }
>> +
>> +    if (new_el == 1 &&
>> +        arm_feature(env, ARM_FEATURE_EL2) && (env->cp15.hcr_el2 & HCR_TGE)
>
> I'm not sure you need to check for EL2 as hcr_el2.tge cannot be reached/set otherwise.

Mmm. I think we have existing code that takes both approaches here
but mostly we're going for the "no explicit EL2 feature check".
I'll take that bit of the condition out (but won't bother resending
the patchset unless there's something else that needs fixing).

> Anyway:
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

thanks
-- PMM
