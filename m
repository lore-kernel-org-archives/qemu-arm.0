Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp1380585lfv;
        Thu, 4 Nov 2021 14:03:06 -0700 (PDT)
X-Received: by 2002:a05:6214:c42:: with SMTP id r2mr10679825qvj.53.1636059786396;
        Thu, 04 Nov 2021 14:03:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636059786; cv=none;
        d=google.com; s=arc-20160816;
        b=0iMqYIPFyUvsjjAW6PUVi4WmW6Un8+MNYpQLZnX8YVsY9CQnCp2iWNQEyikaDqckJl
         NK47URLo3598rMI8Lq1yO/YiTqu86lWmSyap6CvBN/qeRO7ghpcLcqoRGNGUojzD8oTB
         uPPiC6Z3jQy6DLYmW6aDRsVniquGNIB84hlksShZVwYIMBR0Aikm3M1WtQ6qU1RP/9yY
         IagmtI+DBwS0NQmqaeRpCeok4U+8zM81eVEks6tkwbYOifDpPQ6dG8c2LIqx0b8e+cfo
         ONOcIqhPoPixUISwl4MrORGSuAS7bwh/K8tRGV8klnqdBzJKvBqexewGZABWRV9IxD79
         OvZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=mrY7XYsshlWINi/ntqPQWdODsirNvwgmcp8qH3+fM8A=;
        b=pjydBvDyXbAdJDjrq7QqWTVbC5AiQookv7+XJE42hbN90tQEpVBN9jqqRe+78da4cU
         UCgk58webhcYnfY4FOJkIZ8GJyJMDTEqpwqG2LFrLRso4XN0aCJb56K2ukOcli/QINr0
         64Num1FGjbPiV/v2FSZ+U+tohnuo4feZx/sxyw3DmJs6//w3YhhUEy34RP5pRlKqlpNx
         gCfM0mHj9iNurka8LtM9JIPI1yhXz6nt4vMBU4b47wgbAVlxZwowfjNgn9b+c2opqBuC
         M10/saFAquDyFdsXDua3O1EVEFwnDiVZC6t2qH3e+g/hrFoGSPlvj8H8ABWFMj6lwKpW
         6HNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DkHHN7YZ;
       spf=pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=luis.machado@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <luis.machado@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j20sor3377919qta.19.2021.11.04.14.03.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Nov 2021 14:03:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DkHHN7YZ;
       spf=pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=luis.machado@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mrY7XYsshlWINi/ntqPQWdODsirNvwgmcp8qH3+fM8A=;
        b=DkHHN7YZKMI0PCyvRTq9Kz9g2r5EWBEz9rHfjiua/PNSLxpo0HWPgAIVENMzdRYFIf
         S8ANHLhOqt/3EBEwlJN1QViy2CVhImMzMwjlkKrwvARkbs43DhBVPlJrb4lpMbt9Iz5g
         uVNSioO91zUvgC9l94BRp94+1Qej2KpMoe0AlFY8mGVppB+dlUqCzdflTKzOV+pHIkCT
         3aTJ0LLlHu//tt77h4soDToI4jymL59FHJmMaMnzFqq/5O7qpvF+CXpx9UniUiFoyDMb
         cGrtUEk+nMe+n0Qj670sEq/d+aZWsP7JT0T25oEvFtSxbsOQ7YCe9uF/s7fYMtTfaI4/
         qfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mrY7XYsshlWINi/ntqPQWdODsirNvwgmcp8qH3+fM8A=;
        b=Z8FMUMIt/3uPqV/sW6VMv/6MFBzyaUMhVA51kqBM5lrihjbTUXlJewV8XzFB5JHccA
         lWNUuqg/8mwPvYBIKzmfjE/7w2Um+nIFCY6/Is4dpUuANO8FddRc5AcvSvME8Oy3LEbw
         l3610L2txhNFUlRgFeYK3L1/JvGOwpHtoimNDPXz3eGWRi0oX5Zpi3+JhykL6XUFm2WI
         queegbup6hCneWMiQXXBdIKrvVv0sLzz3yLDG0+Wh0Iof4LzGhh6uTiFFy+8kxUX7evi
         ELF/3A4ooLDyvIa89gJX1uWyoLiNXbnkIxruIlUkCU/jOU6bEHUmtnf6Xzypd2Tlkqp/
         aT/Q==
X-Gm-Message-State: AOAM530tnMM+WpyDNF0U9WYx43tD3iwBbTAm85jXuQWEXd5QV2bviBv0
	QNgJBK7GHptQcSA/3Cdsa8l29ero
X-Google-Smtp-Source: ABdhPJwHuMCGjVDmVFBVDKiv11mcd4S6NMuV9esUYoHAh08ruWHHFXaqlCokLHixUSvUV14/8/mRfA==
X-Received: by 2002:ac8:5745:: with SMTP id 5mr32618366qtx.37.1636059785949;
        Thu, 04 Nov 2021 14:03:05 -0700 (PDT)
Return-Path: <luis.machado@linaro.org>
Received: from ?IPv6:2804:7f0:4841:487c:e9de:2240:b4c1:9cfa? ([2804:7f0:4841:487c:e9de:2240:b4c1:9cfa])
        by smtp.gmail.com with ESMTPSA id v22sm4888886qta.74.2021.11.04.14.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Nov 2021 14:03:05 -0700 (PDT)
Subject: Re: [PULL 21/30] target/arm: use official org.gnu.gdb.aarch64.sve
 layout for registers
From: Luis Machado <luis.machado@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Claudio Fontana <cfontana@suse.de>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-22-alex.bennee@linaro.org>
 <540354a8-bcba-aa82-814d-7f11dc75f5bf@suse.de> <874kjdugip.fsf@linaro.org>
 <8cb88b76-caa3-ba26-b288-4d87b06f56ec@suse.de> <871regvs0w.fsf@linaro.org>
 <CAFEAcA9FKA9k3ePEVALXnRcfd4ygybMrmpD=ZjV1A==at+w9Uw@mail.gmail.com>
 <3c1521e5-5182-18f3-b5bf-9340745ec92f@linaro.org>
Message-ID: <e7c11bc8-e7ba-8192-e4ba-887c38f27b15@linaro.org>
Date: Thu, 4 Nov 2021 18:03:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3c1521e5-5182-18f3-b5bf-9340745ec92f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: VHQH1WI061Ga

On 10/4/21 3:44 PM, Luis Machado wrote:
> Hi,
> 
> On 9/21/21 10:55 AM, Peter Maydell wrote:
>> On Tue, 19 Jan 2021 at 15:57, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>
>>>
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>>> On 1/19/21 3:50 PM, Alex Bennée wrote:
>>>>>
>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>> qemu-system-aarch64: -gdb 
>>>>>> unix:path=/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server: 
>>>>>> info: QEMU waiting for connection on: 
>>>>>> disconnected:unix:/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server
>>>>>> warning: while parsing target description (at line 47): Vector 
>>>>>> "svevhf" references undefined type "ieee_half"
>>>>>> warning: Could not load XML target description; ignoring
>>>>>> qemu-system-aarch64: QEMU: Terminated via GDBstub
>>>>>>
>>>>>> Seems to indicate it is "ieee_half" -related?
>>
>>> So it looks like TDESC_TYPE_IEEE_HALF was only implemented in GDB 9.1
>>> and there is no probing possible during the gdbstub connection. I guess
>>> I can either go back to stubbing it out (which would break gdb's SVE
>>> understanding) or up our minimum GDB version check for running tests.
>>> That would mean less people test GDB (or at least until the distros
>>> catch up) but considering it was zero people not too long ago maybe
>>> that's acceptable?
>>
>> I just ran into this trying to connect qemu-aarch64 to the
>> Ubuntu gdb-multiarch. I don't care about SVE at all in this
>> case, but the 'max' CPU includes SVE by default, so we report
>> it to gdb even if the guest program being run doesn't use SVE at all.
>> This effectively means that usecases that used to work no longer do :-(
>>
>> Luis: do we really have to report to gdb all the possible
>> data types that might be in SVE vector registers? Won't
>> gdb autogenerate pseudoregisters the way it does with
>> Neon d0..d31 ?
>>
>> thanks
>> -- PMM
>>
> 
> I'll check what can be done here.

Apologies. I got sidetracked with a few other things. I'm getting back 
to this one.

I'm guessing the less painful solution would be for QEMU to report a 
more compact XML description for SVE, supported by the oldest GDB we 
would like to validate things on, and leave it to GDB (newer releases) 
to add whatever pseudo-registers it deems appropriate.
