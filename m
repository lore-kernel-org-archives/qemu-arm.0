Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1010048wrp;
        Wed, 2 Oct 2019 08:16:49 -0700 (PDT)
X-Received: by 2002:a63:1101:: with SMTP id g1mr4276936pgl.320.1570029409004;
        Wed, 02 Oct 2019 08:16:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570029409; cv=none;
        d=google.com; s=arc-20160816;
        b=0DQHiN+UFvxw7O3kVAjaWIBwyUZw1q6KjRBbsKCfNFnIM4wUAc0Qogl2Q6TthbQgpx
         UgqOS/MB6irDaXIRacKX3OdIzreL8FitIlmAUKfnZKxewBkZwbqzZ8MthGp+de3JS4U7
         BO52WRS+tf5avKnnh+zv8gc/xfrOopLQzgqmql0kIBew67e9N1uvMErVgat95XR/rIqA
         FYhXD4oFfjm/bb+7GF+soyUYJT0fiWFHp3I7C7wihThfm0tFh7f0H/qVq13fggIygLVM
         gWUOiSnrjRV+m8ypu1MBeUIFwX76S8hw2CrCWsbcc12/K7Z0mGAPPx9e4OjZ1MN2qRtD
         byZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=05tls94euaalL4DwohLqpfyv0VHo5flj8PcM2IO60Ik=;
        b=nGyTNhs7UwwV+k4Xp2POwe+KUhuPYzFJZPdhxeXh+v0HgHd7wonTBd3n+SZpxcuVQV
         Q8vHC0fvSnHpsmDd8aJtNNmrLMXsXC4PrcCWHaqgTVodE/FqeVbv+MwJJHgDhOkMgCIf
         H+GiFckBxCbLH4h3jfdmX/2NB4fXc0TUAnfY2GHrhozEYpWnEHC5lO/+RzKCXuqv3BBl
         PCXGPzY+KKfm5SuOMmQ9+9DmP/9fZtgw/rVfCj2EFj+jJ5rMgA7pe0+ear+Bp1p92llU
         MkU7S/rrv+LYI3vKBhB8YkOP88SXfqnCJLSrc+gR1rZn/8we2FKLlszeYQ3N0mkwgG3t
         O3XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q423oyDi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w4sor8730596plq.4.2019.10.02.08.16.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Oct 2019 08:16:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q423oyDi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=05tls94euaalL4DwohLqpfyv0VHo5flj8PcM2IO60Ik=;
        b=q423oyDiT1KR2aho2xzaMLiIjYNyGqCROKCvVRItQ7JOG4MqK3YU/jUoxyBJp70onE
         k2qvpCR4Kr5saIB4hratTKb26cl9ycVpxQiLpR3lFzSoR0M3hBjN87aev4+jMRtUX86z
         nDtPvAeugJd+7FsL81O+iFXObZHRtrTe3uWW/yXJZ25TQ1k4nWiXSeWs/o1zisoUqhcG
         fZWe18a+jZf+jePdWFaCDpnd0x99WxW59WDgUpWMry6vDbpsaeIflCMY+FeRNIYqPLzw
         3uCvsPY7qiQtt4ygHCjCnzmer8Kx8SZkZQlm/zULkDbc2HNCsokgd+MsPjZZA0jFlYv+
         GXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=05tls94euaalL4DwohLqpfyv0VHo5flj8PcM2IO60Ik=;
        b=oB38bv5LbHrFWcJwIllHh596L1oXZH3yNIJtraYpAt8MfxxEbQjb4Rh4Y/R7uNXWKP
         u9OW51mhTcdcHLfqzEklGf/QjQ8/Q84TkU8ZurEBFkkvFq/3Oy302R/c5/1uID4TqUht
         wmw69Iyg26dhyDQO2bOFAcfgDkXXCibk52d00BOrrfpt+qr7pgBqHN+kjtVmOciG8av+
         9Skz8ymwF1ICz/a1lkx0ws4E9lfPRn52ucxTBIlzWueKazWnSH80J8nPA4oBE726IJDW
         FJz7e75JJjDb38HrW4+8h8gHjl1xXuE6YVjmjIbYB8Dbn7lDsIMchQ1z+sObCXgB6IvX
         9zeg==
X-Gm-Message-State: APjAAAUZyK0EtwYbI6vuX8nhnwv8xFUwZR9ML3npv1NgfsILEooXR0jP
	GL1WQgDP223PutQiYUfUnrdThHt/
X-Google-Smtp-Source: APXvYqyzthjqsqkvxmm+IrtXCYCzcpPeP8xDiW+fZlh1RnHyiaYN8gIuom3PwnMnad2t8X20LSvxxw==
X-Received: by 2002:a17:902:326:: with SMTP id 35mr4352618pld.128.1570029408349;
        Wed, 02 Oct 2019 08:16:48 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id s17sm30893669pgg.77.2019.10.02.08.16.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 08:16:47 -0700 (PDT)
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>,
 qemu-s390x <qemu-s390x@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
 <4512b61a-ed82-e628-88e5-f44ef87c2b50@linaro.org>
 <20190930092519.GB11996@redhat.com> <87impakrky.fsf@linaro.org>
 <CAFEAcA8_Zt+4RuXh8ww3Xm5=fQT+e_XcjZ6VC2N9k5mzLy0bnw@mail.gmail.com>
 <ddf455e3-742e-81ce-c51a-d783e8d2ad55@ilande.co.uk>
 <58da7aa4-877b-2c85-71f5-e703a841e6d4@linaro.org>
 <20191002091037.GB607@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <02ab8cdf-1011-2bbb-c720-731c2b68537e@linaro.org>
Date: Wed, 2 Oct 2019 08:16:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002091037.GB607@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: bwJ/uHCjx46s

On 10/2/19 2:10 AM, Daniel P. Berrangé wrote:
>> GCC only implements int128_t for 64-bit targets.
> 
> QEMU probes for that during configure  and sets CONFIG_INT128
> 
> If I'm reading correctly include/qemu/int128.h then provides a
> fallback type based on a struct with two int64s.
> 
> This has some inconvenience though as you have to use the the (inline)
> function calls for all the basic operands and will be less efficient
> when using the fallback.
> 
> Presumably this is not viable for TCG ?

A structure (for some ABIs) may be passed and returned by invisible reference.
 It's not impossible (nothing's impossible), but it adds previously unnecessary
complexity to allocate that storage on the jit stack.

Actually manipulating one 128-bit value consumes 4/6 of the i386 registers,
which I can well imagine could wind up causing problems.  Certainly
manipulating two values at once is out of the question.  That's less of a
problem for arm and mips.

Anyway, all of the pain points go away if we assume 64-bit.


r~
