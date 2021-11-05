Received: by 2002:a0c:e741:0:0:0:0:0 with SMTP id g1csp1863323qvn;
        Fri, 5 Nov 2021 09:29:24 -0700 (PDT)
X-Received: by 2002:a05:6830:2714:: with SMTP id j20mr31502909otu.104.1636129764294;
        Fri, 05 Nov 2021 09:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636129764; cv=none;
        d=google.com; s=arc-20160816;
        b=Go+4XxQbVDnk4Svg7EKIWqHXSQh+/w8OuSHp6k/0pmbsTVph6h+2hi/U5Ghu9u+DTG
         FXqoXGuxAWIJich1oLssT9Asq0Ytnst5tn1kjyAOPJvkWLOWu8s9kAuLIQIWu9TnSUdm
         ODLZtH6/CRRzFbJ/zVsoL6d94jcMe2g9pyCsGzHOrGSBRT5ZSBH6Oc24gJzzTVL84KjN
         e+MGpBBOPSuPLALcHdU/ppCi1gpVjsqWVxyDKcsRc7soY7VyrDQ8Dqlm9qX+RNg2oWSD
         6tF/bwNkdYcASZrvPxL7GD9lc4ODvNd9RMSTVVYn/p2oBnSmRbuZyHy1XI/uUdIw4P2b
         bRNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=mfjAIJbhKDA/sTBSPUr6RQoDjgmSlvzr65p+yJK5Wrc=;
        b=YentfE6/6U+WA67RrzHN429e0Vjdx3NESeoBMp9O6fVlBCcE8XHxmbYobA4GqgaGkR
         3ms4H6px+mIXBddYXSHda7AC2aHQ/x9jS75MnktY7cIqL3HJCLYBnPMKU3bzrk5yXpRr
         0M6x8WI0Pi8In79H6cLKrBIhh5/94phJqn/4IiU7p9rV+dB4ir+9IZMv1Z1Tc7W5K8Vv
         ZzXafTlZgytq8Xe/aXCT5RD02uySe2+GjwSYFgZZJrbCH/7c6P1+T1EwtAbVl1TklB2t
         Lee9GrgPhaPs1e4rx0wHAKRmT1Zu/8wO3bLdEBEpEVf/PpsL1KcO8A/RY1QGA2dfe5K+
         63NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O6qBvOB5;
       spf=pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=luis.machado@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <luis.machado@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k18sor1176703oij.41.2021.11.05.09.29.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Nov 2021 09:29:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O6qBvOB5;
       spf=pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=luis.machado@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mfjAIJbhKDA/sTBSPUr6RQoDjgmSlvzr65p+yJK5Wrc=;
        b=O6qBvOB5aCCsVk47Y8KnjY+GXAM0szYcls1YTEMd+2aXJwrI3gNWCF7peLR8yVG6uC
         R4RmvKNw6IzwgatZ1BAcaP2qvAOsRJjrZC/KxrLdXl8NxmtwKNNw8GwwRF1GE+JRnndU
         NUIFqe23yqp8+VA4qzjdM2srhHZ+aH7Z1Mk1a7J/q5sf59ygrTo+7ZqypI9xfIsec6uH
         lk2Lxw6K5qzO5KLSiuA4ORuQchbikVpu9Exb0tf9bwnOiH1mcuDblbhCloYE2iIC7zPV
         8SGMQXzARQyhtbkJn2I0NguJG1UpkEbJVjvr0oWkNIf+dkyMfnuzlaOykUsGS1FRt4I1
         6ePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mfjAIJbhKDA/sTBSPUr6RQoDjgmSlvzr65p+yJK5Wrc=;
        b=uIgCIjjLcJj2084kSsIomfx+LdjlmHADYEUo4uhVm71QXuJ00DVGTEAvQeQz170oGm
         xQiGlu5TeAlmzM08cpzq+wJFZtYnlB4fxcoIp2T7N6Mjf1fR855dqxBoUhAKB+UegXo5
         ZGF6/JxKDwtKtfHI6sWM/c50FATa7xAQwa+ITmHv8ICtQWuc9LclICHZH8kBauolTnYe
         7S9Be4gprbH2Tsk7t3P4/7KKHT8LBaR/3xtThhIf/QZoePaBxGjRs6XbpLRt5mW+cBRM
         bKgsjB2oAwDPkwsjew8uEq5N0Zjuf+Q6Tj7wbHQkcQFjZ6drIjvWpnwWD90ex/pP+pEx
         1Wvg==
X-Gm-Message-State: AOAM533ymp4ZKDmu6uDvU+7iKrAECo9faXr23YQy+rz8kyTgBquiJu4i
	S8oVsnJplkAHAR5DduivLd9ZJhVx
X-Google-Smtp-Source: ABdhPJyf3BlSvJnJHAhATbRIw/X6YNwgSS8ssg9QzCiBjvgxwKU7K0Z1OdYLxnumkq3kMPucZfaPMQ==
X-Received: by 2002:a05:6808:1444:: with SMTP id x4mr22735887oiv.79.1636129763855;
        Fri, 05 Nov 2021 09:29:23 -0700 (PDT)
Return-Path: <luis.machado@linaro.org>
Received: from ?IPv6:2804:7f0:4841:487c:5509:2e45:5dfe:a087? ([2804:7f0:4841:487c:5509:2e45:5dfe:a087])
        by smtp.gmail.com with ESMTPSA id a13sm2633510oiy.9.2021.11.05.09.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 09:29:23 -0700 (PDT)
Subject: Re: [PULL 21/30] target/arm: use official org.gnu.gdb.aarch64.sve
 layout for registers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-22-alex.bennee@linaro.org>
 <540354a8-bcba-aa82-814d-7f11dc75f5bf@suse.de> <874kjdugip.fsf@linaro.org>
 <8cb88b76-caa3-ba26-b288-4d87b06f56ec@suse.de> <871regvs0w.fsf@linaro.org>
 <CAFEAcA9FKA9k3ePEVALXnRcfd4ygybMrmpD=ZjV1A==at+w9Uw@mail.gmail.com>
 <3c1521e5-5182-18f3-b5bf-9340745ec92f@linaro.org>
 <e7c11bc8-e7ba-8192-e4ba-887c38f27b15@linaro.org>
 <1b2ee804-6360-c77f-45f2-8fe39e39f9d9@linaro.org> <87v916h937.fsf@linaro.org>
From: Luis Machado <luis.machado@linaro.org>
Message-ID: <71c392eb-f333-89cf-d5e0-313d564dce4a@linaro.org>
Date: Fri, 5 Nov 2021 13:29:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87v916h937.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: aiWVbwA+s4mT

On 11/5/21 1:15 PM, Alex Bennée wrote:
> 
> Luis Machado <luis.machado@linaro.org> writes:
> 
>> On 11/4/21 6:03 PM, Luis Machado wrote:
>>> On 10/4/21 3:44 PM, Luis Machado wrote:
>>>> Hi,
>>>>
>>>> On 9/21/21 10:55 AM, Peter Maydell wrote:
>>>>> On Tue, 19 Jan 2021 at 15:57, Alex Bennée <alex.bennee@linaro.org>
>>>>> wrote:
>>>>>>
>>>>>>
>>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>>
>>>>>>> On 1/19/21 3:50 PM, Alex Bennée wrote:
>>>>>>>>
>>>>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>>>>> qemu-system-aarch64: -gdb
>>>>>>>>> unix:path=/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server:
>>>>>>>>> info: QEMU waiting for connection on:
>>>>>>>>> disconnected:unix:/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server
>>>>>>>>> warning: while parsing target description (at line 47): Vector
>>>>>>>>> "svevhf" references undefined type "ieee_half"
>>>>>>>>> warning: Could not load XML target description; ignoring
>>>>>>>>> qemu-system-aarch64: QEMU: Terminated via GDBstub
>>>>>>>>>
>>>>>>>>> Seems to indicate it is "ieee_half" -related?
>>>>>
>>>>>> So it looks like TDESC_TYPE_IEEE_HALF was only implemented in GDB 9.1
>>>>>> and there is no probing possible during the gdbstub connection. I guess
>>>>>> I can either go back to stubbing it out (which would break gdb's SVE
>>>>>> understanding) or up our minimum GDB version check for running tests.
>>>>>> That would mean less people test GDB (or at least until the distros
>>>>>> catch up) but considering it was zero people not too long ago maybe
>>>>>> that's acceptable?
>>>>>
>>>>> I just ran into this trying to connect qemu-aarch64 to the
>>>>> Ubuntu gdb-multiarch. I don't care about SVE at all in this
>>>>> case, but the 'max' CPU includes SVE by default, so we report
>>>>> it to gdb even if the guest program being run doesn't use SVE at all.
>>>>> This effectively means that usecases that used to work no longer do :-(
>>>>>
>>>>> Luis: do we really have to report to gdb all the possible
>>>>> data types that might be in SVE vector registers? Won't
>>>>> gdb autogenerate pseudoregisters the way it does with
>>>>> Neon d0..d31 ?
>>>>>
>>>>> thanks
>>>>> -- PMM
>>>>>
>>>>
>>>> I'll check what can be done here.
>>> Apologies. I got sidetracked with a few other things. I'm getting
>>> back to this one.
>>> I'm guessing the less painful solution would be for QEMU to report a
>>> more compact XML description for SVE, supported by the oldest GDB we
>>> would like to validate things on, and leave it to GDB (newer
>>> releases) to add whatever pseudo-registers it deems appropriate.
>>
>> Is it only the ieee_half type that is causing issues here? Or are
>> there other types?
> 
> That was the only one I noticed - which makes sense as it's a fairly new
> type.
> 
> 

Ok. I'm considering dialing down the number of subtypes for SVE Z 
registers, which would greatly simplify the generation of the XML for 
SVE features. But I still need to do some more investigation.
