Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2761128ejq;
        Tue, 9 May 2023 07:27:32 -0700 (PDT)
X-Received: by 2002:a05:600c:2047:b0:3f4:2452:9675 with SMTP id p7-20020a05600c204700b003f424529675mr5245897wmg.0.1683642452433;
        Tue, 09 May 2023 07:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683642452; cv=none;
        d=google.com; s=arc-20160816;
        b=HGsDad6des7J4n5p+iSXj1Vv70+ZhHo5oy+gJCNSbyqT37dI0YRUvtVDXOA5xgMJmy
         d090JORsDt6hIMaH2NsRIRQI2fSZ9GC7//z8F1syPXF7Vp2oZ6d5NPsjzb94o4FXdPML
         2RVMzjVkcK3WoHR6Rc0DWv88V1u0yOu08zYac2NNWMS3YEI3MDgFbUpn+egDdXYPlhpv
         TKhsNoLjutyEe27X8XcOeGNMKnSRGYfi4ycJj9IKmo67VTP9HmwTO1pDJzxdy/wzvFDk
         4Tbs8XYI2ngmgWcGgtScdWXCbf5qkUhN7N+Ilu10ukCVfDZBIYFNrQTB3aKs9qg+XQ+n
         OTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=LDw842N9IVAzvk5WKvAz0t27656eTx36pLXrPoti6vI=;
        b=m4OzG/yV8J804Yih17lwzZNMyBgDL5NYfutHQD0ujc8GPQXZMsLFwZctL+FR9Nt0Nl
         9Efva8nOaMuf0A/DACHsiSdiEYUg3SlOUuQhzmYrB80JYg48KQOWvt37MR2Be7lp8mzz
         h+aNGeLecHV9qJZN371Eed0FaS0nXu5lxj0590DIVewcyPRMxksUdQUCMMIJI+utwpxI
         yfpKJAMpx6BPF6dpt2JQsk4zT/b1pXI/27S/6ANDMF+HKiu5ifuGjdY/os8Q0Hwv4DfG
         qmaSnL2/I1f9YrLjlxQlO/6/3CbLknuLlDHsVZ+xGzOlKCgWWys0SllIou4uI0/kcRKl
         yQLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r9820mfH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l4-20020a7bc444000000b003f17329f800sor3171515wmi.1.2023.05.09.07.27.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 May 2023 07:27:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r9820mfH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683642452; x=1686234452;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LDw842N9IVAzvk5WKvAz0t27656eTx36pLXrPoti6vI=;
        b=r9820mfHh+U5PuapOy8GaZ3lAAIP+Q4Ms2U9isosentJcF5qAhSE+jMaSDz5RbDEsK
         8bn04eHb4B7anRwaqSht96YBwMFJuYbj9Jo21lnEsbLowen1r10JIzRbQWpMGVb/qpQB
         Tk0GWJgdTkGwGFIpmTwFDHoPb9pm4J1Qx0+spNlQFqhbAoVu9bAQBr11gg/LRX+7b/Hw
         3ikp+2vUQGIRti2L98hJLxnEpXaXsSnHfg+UgbV8Tg5n9TOHp/4TcwziWXDQMqBmA0eO
         xN9/HGYjfn6ILO/nagQjid0sZD6ZK9JH8Cv+cWadihYSFZu2tvoyNLwJI3FnvEqODeld
         HPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683642452; x=1686234452;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LDw842N9IVAzvk5WKvAz0t27656eTx36pLXrPoti6vI=;
        b=lHi+fwDoTq9wWltAHPc1+BPZZzy2IoP6de4EjmnVkl6rsYhaXfMiPj3GP3fZEL8FFO
         9yVrEk8At9yIiIYEYmy8AkebPKA6BQMYl5Z2ftbuDJYP5z6+3n7XTOzBftHLehjFYL6s
         Nk5OO7Z9IpPUyQdsn/x/J2W2SK4IBSXEudKgb64LFMPcXrzlD2y6E403wT7+qeMIsqNJ
         LhxelRGc/nuAmK720a3twXNb6efqcoUM05IxGB0ye5odE+8O6qpCjwfoFWNxLzFUqUSO
         yvV5emAVFXWJV4vnOVcqprwmt56vxLAmC5Ey0UtbsGn8ARQ4Fz0tN6Fo+czoMGcjZ2vr
         jodg==
X-Gm-Message-State: AC+VfDyetFiSHXw6Bt7169jyDehbcCcwHlYnZeaVa2PIwAOli1jiyXZt
	dd662oC8qht6jeYnSfWGlKBlotw8
X-Google-Smtp-Source: ACHHUZ797yAlaUnBpbNovTMI6Aqo/5pgzJOrwspnErR74LVYVmpkmwwMDOA7b8pkoGUcNtoy10SWVg==
X-Received: by 2002:a7b:cd89:0:b0:3f4:2610:5cc7 with SMTP id y9-20020a7bcd89000000b003f426105cc7mr4271874wmj.9.1683642452046;
        Tue, 09 May 2023 07:27:32 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.11.23] ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id k9-20020a05600c1c8900b003f4283f5c1bsm3570673wms.2.2023.05.09.07.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 07:27:31 -0700 (PDT)
Message-ID: <434236ad-8348-1e42-23e6-3ed7d6c21366@linaro.org>
Date: Tue, 9 May 2023 15:27:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 06/57] accel/tcg: Honor atomicity of loads
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-7-richard.henderson@linaro.org>
 <CAFEAcA8muJ84GMqSBuU0P2YhfERM-kftfq07N8BVO2yG9p6jBw@mail.gmail.com>
 <8988fc6b-8f07-1ab7-663d-3392ca19f7f8@linaro.org>
 <CAFEAcA-79iL8=+143w1jxTG1WM-8NODqqgF4droY=avopm4a7g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-79iL8=+143w1jxTG1WM-8NODqqgF4droY=avopm4a7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: G24777EvJcl9

On 5/9/23 13:04, Peter Maydell wrote:
>> If the LDP is aligned mod 8, but not aligned mod 16, then both 8-byte operations must be
>> (separately) atomic, and we return MO_64.
> 
> So there's an implicit "at most 2 atomic sub-operations
> inside a WITHIN16 load" restriction? i.e. you can't
> use WITHIN16 to say "do this 8 byte load atomically but
> if it's not in a 16-byte region do it with 4 2-byte loads",
> even though in theory MO_ATOM_WITHIN16 | MO_ATMAX_2 | MO_8
> would describe that ?

Correct on both counts.  While you're right that this is a valid generalization, it's not 
something for which I've found a use case.


r~
