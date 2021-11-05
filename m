Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2231330lfv;
        Fri, 5 Nov 2021 06:35:33 -0700 (PDT)
X-Received: by 2002:a9d:6e8:: with SMTP id 95mr16468013otx.35.1636119333101;
        Fri, 05 Nov 2021 06:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636119333; cv=none;
        d=google.com; s=arc-20160816;
        b=FefvN3MYltuDhrp9PnjAbygKG10RkZ0q3GscfLoPE+KwUh6f68pcjqMU1rkR7iMVAE
         AH2AwBRnH4trpWy9LcMNOggGmlShL90TTZ+pEveBJzxqMicGz9Oaza/LfJu2eEzYzgSc
         G/sBK9pVZPW+AMkTCrk4bkC99UIFBIRnFt2kihRy+Ll/AuVFsR3TAlga4no5fgnQWsbR
         PnzhVphfTNhyVHsFFNXx0VINugz7/RnZzZJuSViPE55mY1kQ3nzaG5YKT59onUTIAZIJ
         x9uu3ynAvSbHN8IW23reOIdHAMrThMM1drz9ptX/n/GK3B7bfj/6rNTzdV+NEpiJaswo
         MoXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=2IwfNa/a6/UL5nRTIBeHB/zXygWLK0fdNTUwqG1u4sg=;
        b=Ob7YXT1W9rJxbZqCyhcUvOKmyNlA4FwqzhYF/ufqSK1Z1C7GEU1yNjkBVx3Jn6z6oq
         3/lAUWw/ZABtuXrABQMP4S7RP9EfsN1uQNeR2hCyDGEzCxxhZvXIERdSL6h319YPYh1m
         4cXDKtdLJcelNZA384YF1eaEjIzujJ59bhPl9u8Ly7F5AKeaJf+7FPCSLck3LQhO6Tp9
         YB6WretWFuC+uxD1hFnW415qEbAU7Iz6Ulevn+nu6c6bC6b4hWdiTa+vM4VCFma65nih
         Ht3VBHHJVNrMNXxETNd/7qyt+oI5j2fkV8V8HjGeE/+Blu8ayq+qsOj2nw1maBpFy97K
         lXiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JhJkMWU6;
       spf=pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=luis.machado@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <luis.machado@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f26sor1873373oti.98.2021.11.05.06.35.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Nov 2021 06:35:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JhJkMWU6;
       spf=pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=luis.machado@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2IwfNa/a6/UL5nRTIBeHB/zXygWLK0fdNTUwqG1u4sg=;
        b=JhJkMWU6FmPRqcl1E7KroiCE74D0tIy5jXsYS4AbEivb/7UGAhzbIoTkurjnlnllsG
         xIBut4h0ssM/RiB5vMQ0jY7BVAbVIZ3w4CiYHUPTm2MGuVcNx0Mvjp3uguoeEYXp1tS+
         cm8+WeTxZwLc98VjnqAgHrAliobTlkXQeTN5ufd4Fbiw2IbTVbbA9BKQxHaAeoL3kALx
         AUGNeKp6nYIj7NN8YyhmiWPGuAFbIngOp93JvYIVB+2Ko65OaZqPL5K9a1idCZQAhqTk
         //pwjrLSBnn5ejVV7hpJqeg7qtYe0ld8H3Cxc5xj7GhDn4q0bOaMbCd4OYDJz8fFuhUc
         sBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2IwfNa/a6/UL5nRTIBeHB/zXygWLK0fdNTUwqG1u4sg=;
        b=nAM7CVyovpyBe3QUmGH5rNh/AhZm1gZIQs2h5ZmwUt7sQ9jzn2R1fbbPIcus1CsrCA
         JRePc8xKbM16DhZmeVRDeL+7E5NdFcw/UF+IQkOBYQsDEUFi5xf4aKysHOwpZl7fjil4
         JrK/dJrvVVE6jB9fFezl4o7R28dh59ZmhZq3ROMpSAY83gd4e+0/vTWu5VWHJdYfbCeg
         msDLHr7lrwVPC5fNmijKMfg173u7cwEy2NwcxYx0NbOADQiSSoiqBbtpaC3YspgzYM87
         q4KAZPfoBc42jPCdWrivJWQ4zpCBB46LH2nV/2RbrxM9gtWFPZua5NnBWB/MFn6eXW4d
         u8hw==
X-Gm-Message-State: AOAM531mUBGnGAX7T1NjIUVoQeHrvQiddDjCZ3LVUWhDLTKFq5o4suKY
	drvREE5OqIsTT0KgdHKdc/G9goTA
X-Google-Smtp-Source: ABdhPJzQQsmgkAGmyAVEEKilRwYNEtmt3bzcLTEDzAiz93ylP0nHEnu/rlrHJqbkT+KweaxfPlbFXA==
X-Received: by 2002:a9d:3634:: with SMTP id w49mr37118160otb.84.1636119331203;
        Fri, 05 Nov 2021 06:35:31 -0700 (PDT)
Return-Path: <luis.machado@linaro.org>
Received: from ?IPv6:2804:7f0:4841:487c:5509:2e45:5dfe:a087? ([2804:7f0:4841:487c:5509:2e45:5dfe:a087])
        by smtp.gmail.com with ESMTPSA id h3sm2425269oih.23.2021.11.05.06.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 06:35:30 -0700 (PDT)
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
 <e7c11bc8-e7ba-8192-e4ba-887c38f27b15@linaro.org>
Message-ID: <1b2ee804-6360-c77f-45f2-8fe39e39f9d9@linaro.org>
Date: Fri, 5 Nov 2021 10:35:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e7c11bc8-e7ba-8192-e4ba-887c38f27b15@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: pYvIxbmIQ7re

On 11/4/21 6:03 PM, Luis Machado wrote:
> On 10/4/21 3:44 PM, Luis Machado wrote:
>> Hi,
>>
>> On 9/21/21 10:55 AM, Peter Maydell wrote:
>>> On Tue, 19 Jan 2021 at 15:57, Alex Bennée <alex.bennee@linaro.org> 
>>> wrote:
>>>>
>>>>
>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>
>>>>> On 1/19/21 3:50 PM, Alex Bennée wrote:
>>>>>>
>>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>>> qemu-system-aarch64: -gdb 
>>>>>>> unix:path=/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server: 
>>>>>>> info: QEMU waiting for connection on: 
>>>>>>> disconnected:unix:/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server
>>>>>>> warning: while parsing target description (at line 47): Vector 
>>>>>>> "svevhf" references undefined type "ieee_half"
>>>>>>> warning: Could not load XML target description; ignoring
>>>>>>> qemu-system-aarch64: QEMU: Terminated via GDBstub
>>>>>>>
>>>>>>> Seems to indicate it is "ieee_half" -related?
>>>
>>>> So it looks like TDESC_TYPE_IEEE_HALF was only implemented in GDB 9.1
>>>> and there is no probing possible during the gdbstub connection. I guess
>>>> I can either go back to stubbing it out (which would break gdb's SVE
>>>> understanding) or up our minimum GDB version check for running tests.
>>>> That would mean less people test GDB (or at least until the distros
>>>> catch up) but considering it was zero people not too long ago maybe
>>>> that's acceptable?
>>>
>>> I just ran into this trying to connect qemu-aarch64 to the
>>> Ubuntu gdb-multiarch. I don't care about SVE at all in this
>>> case, but the 'max' CPU includes SVE by default, so we report
>>> it to gdb even if the guest program being run doesn't use SVE at all.
>>> This effectively means that usecases that used to work no longer do :-(
>>>
>>> Luis: do we really have to report to gdb all the possible
>>> data types that might be in SVE vector registers? Won't
>>> gdb autogenerate pseudoregisters the way it does with
>>> Neon d0..d31 ?
>>>
>>> thanks
>>> -- PMM
>>>
>>
>> I'll check what can be done here.
> 
> Apologies. I got sidetracked with a few other things. I'm getting back 
> to this one.
> 
> I'm guessing the less painful solution would be for QEMU to report a 
> more compact XML description for SVE, supported by the oldest GDB we 
> would like to validate things on, and leave it to GDB (newer releases) 
> to add whatever pseudo-registers it deems appropriate.

Is it only the ieee_half type that is causing issues here? Or are there 
other types?
