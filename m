Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2723749lfo;
        Sun, 31 Jan 2021 07:36:00 -0800 (PST)
X-Received: by 2002:a5d:51c8:: with SMTP id n8mr14285655wrv.18.1612107360188;
        Sun, 31 Jan 2021 07:36:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612107360; cv=none;
        d=google.com; s=arc-20160816;
        b=kUXk6TWstfPfWueInPtH02bSfQM/Pgc2Mhxmd4yAL2MOS63S8xywYJBP7G62HzeSZG
         VmTVbMhskpuXATjlOT6fUWJ7RNW8PTMcZtN3tZwkKKi+8JORhj5OoCFDggRv+2rOjYNs
         nZ699C+2kWM94DzMMAcft8ei6y09d+WoSQxo6dNxhf4CumWTErkOzrtrYtBWSnba9MZe
         IOs9s6voeOpBhy1+3yZeO26s+OWVmbAT1+EU8EeiszzYWHYrU2R4hJATl+Ja6yx0VbzM
         vXXqPZwh6FQK4sW1t4CRK6juTnopHdPIa9e5gvp39XT6ET1iC+CVFRrJgGMm3yNsDMx6
         1bfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=Tj9ynb2vRPFjqtE44EpTjMkFQtoIUjhfjhxMTiCpavE=;
        b=SoRHyy6ysldb0sJaUsS01NWQ0mrPaDYXSq4uOBRwmOnOdnnPjrukHYgAVm4fC8mmMn
         FWoQzFNxqTi3OzLPEq1G2RiQjVgwqoz4wJjKrfTK+iEY+T7As1RS3iyBUYX+CZ7qUlS7
         /fssEQlisMxuUxivcYThD2OaT2tnybR+VVIdnqgpuju//WpQGjUz+EnI2Rf0WEK9wQhM
         Z7nfKj1fhH/Zj7LQ1x1KgKprzlLytjex8efVSucs8dt0qlaH83hYV7TuqdCIveE9+d8X
         RvbszAG+SzoH0pj2QZengiJsSXXLEtHr3F5/aEwaQNkIzPs0uCpJLy1xhut/qbIBp3gw
         B4fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bKISEXIL;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r10sor7818743wrx.6.2021.01.31.07.36.00
        (Google Transport Security);
        Sun, 31 Jan 2021 07:36:00 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bKISEXIL;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Tj9ynb2vRPFjqtE44EpTjMkFQtoIUjhfjhxMTiCpavE=;
        b=bKISEXILOqbBKSyWxvRZTuqbFnMi0zbFX7AD4hLA5WBrs5OH0WAyfczzJO+CNwqZsH
         Px6aqJnUVVzUonDQ10/D4g69YH1ddYR09nffJI/ZWFikuSfuVxu3j6deINIQFetTavz5
         7CB+cq5ySm37Y8rJ8MwxUmhoZdKCfu36fgGzfloOWPaLi22Cp9ygPjj8aGlQIaaQHq8p
         2IHzfac/aVBfZIQQtBiotSnheZvuijwqcKpFhuI1E5CjikLGMbyONtbX/FkkDI2N54ec
         G0A6Ytwl9tirRcjmpbOsSElN5Jz/07qnnKLQNXGICM/tyABc8/kd8gkD8S3sorOVk8M9
         9RCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Tj9ynb2vRPFjqtE44EpTjMkFQtoIUjhfjhxMTiCpavE=;
        b=DG5PMS22Ch7hM3cfKY/DhZEoh9Y4UxhiMW5Z7pyRFWSHFN+ZqlsY0/GYFRxIcUTbBG
         7F32t8azRxMTzIlxLYKKNDkj8gCGDHVo/0PWcznR7sk/Zh2i72LE9zeIilNLIKVWtDxe
         IH9HNmEIGJ7EssMFXaZAf4OrT/CwJotbN/aALwHikXMfa0A8KkvCyqoStJSpDfmcvn4r
         qMgjTyVPgYXtTXuXN3puVmUwN4PeG9QnMiH2qvgdZb0/kcdvcM8BrqzXJxgaXd0FHddi
         YxoVI52mTPWfYCN04VY/6HhvZB2uUu82TBD+jbSfWhMra/ojTaiIsBRAjSw9VY1GBdkD
         tX1g==
X-Gm-Message-State: AOAM531rUZylN3BS8M48ywrU6SGEtx0DBbv7PdvCyCNuovXpzDwY9Rwb
	eimVGp+8LCrLk+Ff9soJ9Ak=
X-Google-Smtp-Source: ABdhPJwxwfwJ1O3wZnQXDc1ZmYatUowqBlUM5eDlN14YoQfKfNZKRQ03jZH9GWmo0RCtIQi/fXcy0A==
X-Received: by 2002:adf:ecc5:: with SMTP id s5mr13603929wro.423.1612107359885;
        Sun, 31 Jan 2021 07:35:59 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id f4sm23839332wrs.34.2021.01.31.07.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Jan 2021 07:35:59 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v5 03/11] target/arm: Restrict ARMv4 cpus to TCG accel
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 kvm-devel <kvm@vger.kernel.org>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
 <20210130015227.4071332-4-f4bug@amsat.org>
 <CAFEAcA8UCFghGDb4oMujek_W_wsyYz+duiQ-d8JyN09NYoff-g@mail.gmail.com>
 <2871f7db-fe0a-51d6-312d-6d05ffa281a3@amsat.org>
 <CAFEAcA-W1tcRREaPTfMw98cNsHs7JHk4gjaJWaJNLpxZoVnKaw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <40ca4720-7adf-8469-2593-6e6689d03fd6@amsat.org>
Date: Sun, 31 Jan 2021 16:35:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-W1tcRREaPTfMw98cNsHs7JHk4gjaJWaJNLpxZoVnKaw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: DjYtBOYomPkB

On 1/30/21 7:54 PM, Peter Maydell wrote:
> On Sat, 30 Jan 2021 at 18:36, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Peter,
>>
>> On 1/30/21 4:37 PM, Peter Maydell wrote:
>>> On Sat, 30 Jan 2021 at 01:52, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>
>>>> KVM requires a cpu based on (at least) the ARMv7 architecture.
>>>
>>> These days it requires ARMv8, because we dropped 32-bit host
>>> support, and all 64-bit host CPUs are v8.
>>
>> Oh, this comment is about the target, to justify it is pointless to
>> include pre-v7 target cpus/machines in a KVM-only binary.
>>
>> I'll update as:
>>
>> "KVM requires the target cpu based on (at least) the ARMv7
>> architecture."
> 
> KVM requires the target CPU to be at least ARMv8, because
> we only support the "host" cpu type, and all KVM host CPUs
> are v8, which means you can't pass a v7 CPU as the target CPU.
> (This used to not be true when we still supported running
> KVM on a v7 CPU like the Cortex-A15, in which case you could
> pass it to the guest.)

Indeed:

$ qemu-system-aarch64 -M xilinx-zynq-a9
qemu-system-aarch64: KVM is not supported for this guest CPU type
qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0):
Invalid argument
