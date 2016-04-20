Received: by 10.25.208.194 with SMTP id h185csp2373095lfg;
        Wed, 20 Apr 2016 08:08:51 -0700 (PDT)
X-Received: by 10.13.252.67 with SMTP id m64mr6243196ywf.67.1461164931658;
        Wed, 20 Apr 2016 08:08:51 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com. [2607:f8b0:400d:c09::244])
        by mx.google.com with ESMTPS id 65si1731159ybk.48.2016.04.20.08.08.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Apr 2016 08:08:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) client-ip=2607:f8b0:400d:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x244.google.com with SMTP id i7so2459022qkd.1;
        Wed, 20 Apr 2016 08:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=sI6XM54fZOvPaVhjGVGy3cOUIPI5G/ADaP3BRaLrCbQ=;
        b=mqEwwqQLc/Kx6PqNxoLYJNi2B5Qj6EbNqMiRXN51G9xiiMHiAlB/dxLpVprI1OXtlR
         AYJ5y6rqV9XDT21P+EP0VQaiF4PzhZuxgCFCe3UZoqLK3p6ruzIoJGt4wMo+AjQGnJqA
         HVsR9PulryAapWSETmhVUKWEvqyZS3j4F3YGjqeg9UC3feS0apS7oERM3ppXkQNge+ox
         t5UPabZSQ0tqp24V/sJrtUMPVbvO/HQwSKiRlEk25flupXP/YggXIkK09xfGMfedBbUm
         03ZucQcrmWH8BuQ0udkKU3Edp2eDEFHLg48EJUD8f/nlBJxITj9xQ3V25LXiVDEE0ShJ
         WtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=sI6XM54fZOvPaVhjGVGy3cOUIPI5G/ADaP3BRaLrCbQ=;
        b=kdY2FYDOHgItK0Tmem5hx5z6Sy+PXKv/RURQMbk3mG1mmqXYsfFrKnr2fzoQtm5vuK
         ahkEL2ypFW/cvQ9f/RyvQvDk0kv+PXlZvlAZNk8HocVxSGuABv0SMhWbse55b3OZdnC8
         TySFfnU9y0uoFOsyhWT94NLeGgmm6pE7ON01WvmAdz6YvwPkTBaIREs2STt21t8w+9Cn
         FLlKUZLeyfu4wk0NaQDN8iI2DXMSTGv/PFK6xMl28UtwdcTpivGmORrJSYspTCYKEmAo
         cqi6ek7GdSdpIFwKkTWkpOEPcaEXgyTWn9LeYS4WZq6a/F2+P107i9HdY+dob+S3GkGT
         16vA==
X-Gm-Message-State: AOPr4FUGNEGlJmGAKiXolCUW89l0jj40Me6/RWsmtWD1hxBdc4jt3ps+Uua2aMCVj5Leyg==
X-Received: by 10.55.82.6 with SMTP id g6mr12094020qkb.40.1461164930627;
        Wed, 20 Apr 2016 08:08:50 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (nat-pool-bos-u.redhat.com. [66.187.233.207])
        by smtp.googlemail.com with ESMTPSA id t193sm9136011qke.21.2016.04.20.08.08.49
        (version=TLSv1/SSLv3 cipher=OTHER);
        Wed, 20 Apr 2016 08:08:50 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 08/11] tcg/aarch64: Make direct jump patching thread-safe
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Sergey Fedorov <sergey.fedorov@linaro.org>
References: <1460044433-19282-1-git-send-email-sergey.fedorov@linaro.org>
 <1460044433-19282-9-git-send-email-sergey.fedorov@linaro.org>
 <87k2jsv0pv.fsf@linaro.org>
Cc: qemu-devel@nongnu.org, Sergey Fedorov <serge.fdrv@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Claudio Fontana <claudio.fontana@huawei.com>, qemu-arm@nongnu.org
From: Richard Henderson <rth@twiddle.net>
Message-ID: <57179B80.9050800@twiddle.net>
Date: Wed, 20 Apr 2016 08:08:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <87k2jsv0pv.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: EhfPLJTZvD02

On 04/20/2016 07:01 AM, Alex Bennée wrote:
>
> Sergey Fedorov <sergey.fedorov@linaro.org> writes:
>
>> From: Sergey Fedorov <serge.fdrv@gmail.com>
>>
>> Ensure direct jump patching in AArch64 is atomic by using
>> atomic_read()/atomic_set() for code patching.
>>
>> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
>> Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
>> ---
>>   tcg/aarch64/tcg-target.inc.c | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
>> index 0ed10a974121..15fdebec921f 100644
>> --- a/tcg/aarch64/tcg-target.inc.c
>> +++ b/tcg/aarch64/tcg-target.inc.c
>> @@ -73,6 +73,18 @@ static inline void reloc_pc26(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
>>       *code_ptr = deposit32(*code_ptr, 0, 26, offset);
>>   }
>>
>> +static inline void reloc_pc26_atomic(tcg_insn_unit *code_ptr,
>> +                                     tcg_insn_unit *target)
>> +{
>> +    ptrdiff_t offset = target - code_ptr;
>> +    tcg_insn_unit insn;
>> +    assert(offset == sextract64(offset, 0, 26));
>> +    /* read instruction, mask away previous PC_REL26 parameter contents,
>> +       set the proper offset, then write back the instruction. */
>
> This comment could be moved from here and reloc_pc26 and made common for
> the two following functions.

There's a significant amount of cleanup that ought to happen here, now that 
we're not re-translating TBs.  I don't know if Sergey should be gated on that.


r~
