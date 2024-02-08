Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp197356ejb;
        Thu, 8 Feb 2024 07:59:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFj1Q2LVRQK+7xxPcxMAmAMhah7AddhoS+fwaGR8FqgOmTor0ksslGheE95L0UJW+9h/D0r
X-Received: by 2002:a05:6214:e4f:b0:68c:be10:2757 with SMTP id o15-20020a0562140e4f00b0068cbe102757mr6252966qvc.13.1707407969038;
        Thu, 08 Feb 2024 07:59:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707407968; cv=none;
        d=google.com; s=arc-20160816;
        b=N1ccqNT6VM+Jz8skfkRYHef+EMm+EbWI5eFWNZAi/en1rBU/tnm3jiHb6lSRZm3152
         fo9yvTaX4tshRqFFiFlDgRSKkxGWsN7yVRpqkXqeGFV+GWj+pypasVpfTDLBS6jzf3qO
         c96BbFxkKdj4Z56B0uBMDHYislmz5pQVAhUdpLoGuX2nDi5d6JqXex2B8IDxIpLE4L+V
         anYS25Co5d5DsdmL5pG+4HKjGSXxbN5odQUr3qbbVPAI+5v5ALYtdB8YswtTgfOmKKQs
         trwBQMRXw7pSEfkugUyOM9bQs9pBsQQz4c2cHI2WdIUgtxLB5uJISiyR0wrFn9j5Gvcm
         +L5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sXucZMZe7hl40nSg1CcN1NrI3v5ZhVFGAwd7swoQONI=;
        fh=kyZeJfFidA6oMpBwdMaQ7v3U+osfwj7c8ZZ+hju9zKg=;
        b=iJET9Vcy5MFP1L51o9FHjD5pZY0l4053vUXd565qWvlKG0xz2CbxAq1sSRLm2Xn+aB
         PAAhU04SNpjmFWvsBh6tT2R50OIDSdVRppRJYbgCx49UfLx0lhKRDCOwuMhqqm6LxJJe
         v/cvFaGfKWLT5F9Qpu5ApqZio4I8H0V3ygRMdt1Z6fP7rQPyls+7RP7KxIGu4HZcL07i
         3ZMg1ifAS5tZMi4ZU+FS/GJMHrXL15CyHzYadCChCrR3jU2ntMe8++3FzBjGeQ0Iltb9
         F4gvW3QpWIq8mfgACzBTogsPFBCgegE1q6M/s2iO62OSOKkBjwlybiqbT2RMP4LTrCQf
         4AeA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xRPVNVis;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCUf4whPO07zzy4fOxnOs1JhnxGeVd+r9o2GQKoP8z3ib02mq25pXMYAmbKNmm8rbAUAmdBYiaLuJnGXu5t1JD+hEVMMNwSo
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12-20020a0562141d2c00b0068cb1e55ce3si250007qvd.505.2024.02.08.07.59.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 07:59:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xRPVNVis;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY6nz-0002oP-BW; Thu, 08 Feb 2024 10:59:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rY6ny-0002nR-3O
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 10:59:14 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rY6nv-0007go-J8
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 10:59:13 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41059577fc1so102425e9.1
 for <qemu-arm@nongnu.org>; Thu, 08 Feb 2024 07:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707407949; x=1708012749; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sXucZMZe7hl40nSg1CcN1NrI3v5ZhVFGAwd7swoQONI=;
 b=xRPVNVis68mwoI5sCII8XB7y9jJZ1BFlmsDsCX3pVCAH+3USBKD5LExtlzu5c5LBq+
 0CFX8WIPtCNQgWeXQxdAymgYR//x+JiMXrl5zw4pJk/TklmR8L3TnbbOr6ufe6eEyrDj
 2Ad8ZC9/7KsuvXDv/rxs7NZjJKKNmnJv8lPvIb7qa3o/VvYgXveUFuCXf7NpwleJdhp1
 3IqMt1hLAe6UdNQmF/R8oUgv8sZNK2l6scM2xKuTX/pe3QPReDB34kBxbG5Quqqjbm2x
 CcBd/1MqH2OQGq30dNEaM7NWLcmot1vfLAN9OxoLXGVBVs7roQCyb2xf1LiVPhm9B7m2
 Yo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707407949; x=1708012749;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sXucZMZe7hl40nSg1CcN1NrI3v5ZhVFGAwd7swoQONI=;
 b=iN3VmyKf8m77wSfdXxl6keom00/U5rQAyGXqHQQOnCuJFTia1xymfirizBzBfrXTgC
 PpEsSz45vCiDx+RxU1Fe4FunSjl7BKbQ1nOLN7zHmahKSt3DuwaC6c7BmiPk1geLIP0Y
 E+Se9+4BS0fDqSHGEaJGJHYdUHQyRbY8WRMiW/BFATKQuY/1/lov+vVT8rGhgHrhxVEb
 900fKMkerC3/ei6VcO/O20a/GrAqp9gFINyJFaw/O67x+STGAoLNqnmQ3myYXiFffGkR
 Behs+KgsmjRVpfKdrRtsf912aA7plj1RtLnBByTM2rG6Lj+s4+2HuWxkKHuITmz24i4B
 g10w==
X-Gm-Message-State: AOJu0YwvnIZdEtaMea/zdxhg+oshOS0oT2HvxLVEbK3EYN9c8BkREieR
 8bli1AIyR83PsjWe5tizF9ADgXx4B9XB2oud9ILZAs2SnY/s/xUcVX4TZCqeDzny2FpPE2ui2zK
 VD10=
X-Received: by 2002:adf:e788:0:b0:33a:ff92:6e2b with SMTP id
 n8-20020adfe788000000b0033aff926e2bmr6687160wrm.4.1707407948979; 
 Thu, 08 Feb 2024 07:59:08 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW30dbgPKMM0DreYsPGkl1+DWVy0rV4adgSTneF53/q7zSY7bHfx7dD0xwYJNFedA1O88Ir98UnmTo+14mXu52pJKPwjgJpzBqcCIpwd+sETT7KA9CeMMB/b5NRFqIzgZk2/DvVv4SmII9LVFA8IB+8DsIRdjrSRWRr2J75NbbBSWa6jA==
Received: from [192.168.69.100] ([176.187.218.105])
 by smtp.gmail.com with ESMTPSA id
 bw11-20020a0560001f8b00b0033b541e987csm2139736wrb.33.2024.02.08.07.59.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 07:59:08 -0800 (PST)
Message-ID: <ddf3be9c-7cbe-462c-95b9-8e11f31e03c5@linaro.org>
Date: Thu, 8 Feb 2024 16:59:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iothread: Simplify expression in qemu_in_iothread()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>
References: <20240208101657.15962-1-kwolf@redhat.com>
 <ffe07fee-0cda-4517-a64b-031cb922d806@linaro.org>
 <ZcTjlNeibKUnIDcL@redhat.com>
 <CAFEAcA_qnVdTh96KsxPRguy--SLD1-xD=Uxp6MzE6dK6e98Cew@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_qnVdTh96KsxPRguy--SLD1-xD=Uxp6MzE6dK6e98Cew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4PFHgGeSiJ1b

On 8/2/24 15:28, Peter Maydell wrote:
> On Thu, 8 Feb 2024 at 14:22, Kevin Wolf <kwolf@redhat.com> wrote:
>>
>> Am 08.02.2024 um 11:48 hat Philippe Mathieu-Daudé geschrieben:
>>> BTW using the same pattern:
>>>
>>> -- >8 --
>>> diff --git a/hw/nvram/xlnx-zynqmp-efuse.c b/hw/nvram/xlnx-zynqmp-efuse.c
>>> index ec98456e5d..d074762a25 100644
>>> --- a/hw/nvram/xlnx-zynqmp-efuse.c
>>> +++ b/hw/nvram/xlnx-zynqmp-efuse.c
>>> @@ -582,7 +582,7 @@ static uint64_t
>>> zynqmp_efuse_cache_load_prew(RegisterInfo *reg,
>>>
>>>   static uint64_t zynqmp_efuse_wr_lock_prew(RegisterInfo *reg, uint64_t val)
>>>   {
>>> -    return val == 0xDF0D ? 0 : 1;
>>> +    return val != 0xDF0D;
>>>   }
>>
>> Maybe. I would have to know that device to tell if this is really meant
>> as boolean. Or maybe it should be written 0x0 and 0x1 to signify that
>> it's a register value or something.
> 
> This is a RegisterAccessinfo pre_write hook. The docs say:
>   * @pre_write: Pre write callback. Passed the value that's to be written,
>   * immediately before the actual write. The returned value is what is written,
>   * giving the handler a chance to modify the written value.
> 
> So it is indeed returning a register value, not a boolean flag
> masquerading as a uint64_t.
> 
>>> diff --git a/tests/tcg/aarch64/sysregs.c b/tests/tcg/aarch64/sysregs.c
>>> index 301e61d0dd..bdd73bd181 100644
>>> --- a/tests/tcg/aarch64/sysregs.c
>>> +++ b/tests/tcg/aarch64/sysregs.c
>>> @@ -183,5 +183,5 @@ int main(void)
>>>           return 1;
>>>       }
>>>
>>> -    return should_fail_count == 6 ? 0 : 1;
>>> +    return should_fail_count != 6;
>>>   }
>>
>> This one isn't unclear to me, though. This is EXIT_SUCCESS and
>> EXIT_FAILURE, just open-coded. I think making your change would make it
>> only more confusing.
> 
> I agree on this one.

Thanks for both analysis and sorry for my confusion,
I was just looking at the pattern without interpreting
each proper use case.
