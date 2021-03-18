Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp202514lfg;
        Thu, 18 Mar 2021 02:56:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGxPjhUWrKHWn/4DT3jpTHSXeLC9VUtg1eovEgCQ15xBOQGkHbLardC2jZTMCQn48w9Iyl
X-Received: by 2002:a7b:c776:: with SMTP id x22mr2789558wmk.98.1616061411604;
        Thu, 18 Mar 2021 02:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616061411; cv=none;
        d=google.com; s=arc-20160816;
        b=vft7s3jVcObaju9VH6mZMkuGHOAJD1tXIQKCI6KkGHtZ6+GKdStUSjZeZNjl2hYfgu
         uq9FjjwMhzHQy1YxMOCgz0/29i2r9eJX9vIbP4HKIh8ULG5mksN+Zrbu7Nor0/dxzMaU
         RBQ1GZUHHDwoP0SAz1ZtHlLIadC/sFQbvpTFLXWTnR5fyguxUHAHSwd46FzSBohfE7z3
         7oqH0sYCiOJzQiBLAekRCvrJJhqSE5Qj9Bm+Olv+H5k1D3nhSrSOO2x1MdE9f0KYfqfd
         dhlGcH0qLZG/7Z62X7h6IrLm7lsB0j4c/h79wsG6LybZY7NBNKYqbIlWl57mXJ0O6jNy
         h/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=GWpjQaQhIDFjJrEmZDZjhbWc2FWc+vDVjaU5f7gLTPE=;
        b=M8dFldrSKqRTg2bzSfHkI/qxY+BB4V8TXB+TtdZU3YqpFWgmhNmBj8pSNbOcrn44o/
         Wl3hI0/Z3wqBI/UrNHvfT5/n58TBacYLyRgubnt9c7QEO58AyqRoGR3QZBP+HbqEznOk
         pRcZ1EVK3m5qBpCY+8MvRibpiKo3j/qqHtZ7K9PDdyxM9/2n5DiNokLzcwrIyoojLXei
         CQ0yofyn6XFOycZBZWUf9tFtVBCs5XTk4BdEesj9b+nXnzDJodtl/R5V6R3rhjAcRE5k
         MUV1G3YWKb/01v3nwRN0QeS9kjRksVigbZxSWkKA7Nvwc76P9qJNG85g8tGxKkZsCjCV
         qzEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
Return-Path: <cfontana@suse.de>
Received: from mx2.suse.de (mx2.suse.de. [195.135.220.15])
        by mx.google.com with ESMTPS id p8si1695340wmi.50.2021.03.18.02.56.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Mar 2021 02:56:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) client-ip=195.135.220.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 00064AC75;
	Thu, 18 Mar 2021 09:56:50 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] target/arm: Restrict v7A TCG cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Andrew Jones <drjones@redhat.com>
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-4-f4bug@amsat.org>
 <c395479b-d2e0-a862-3446-4afef601ca1f@suse.de>
 <8a302c84-b69c-b0c2-de45-607dd1f686a6@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <e0d11b2c-7b1c-c968-feb2-675a8c98c7a4@suse.de>
Date: Thu, 18 Mar 2021 10:56:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8a302c84-b69c-b0c2-de45-607dd1f686a6@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: AI1cVJZfV8MP

On 3/18/21 10:47 AM, Philippe Mathieu-Daudé wrote:
> Hi Peter,
> 
> On 3/11/21 11:43 AM, Claudio Fontana wrote:
>> On 2/21/21 11:26 PM, Philippe Mathieu-Daudé wrote:
>>> KVM requires the target cpu to be at least ARMv8 architecture
>>> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
>>> "target/arm: Remove KVM support for 32-bit Arm hosts").
>>>
>>> A KVM-only build won't be able to run TCG cpus, move the
>>> v7A CPU definitions to cpu_tcg.c.
>>>
>>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>>
>> Here I think it's better to keep the "a15" cpu around,
>> until we fix the board configuration situation.
>>
>> I added a patch that does that into my KVM-only build series, to avoid the resulting breakages.
> 
> Actually I got a downstream report that this break migration from QEMU
> 5.2 to QEMU 6.0.
> 
> I first thought it was on an old kernel (with 32-bit KVM enabled),
> but not, it is for Aarch64 VMs on recent KVM (without 32-bit support)
> but the 'virt' machines were started with default Cortex-A15 CPU...
> 
>     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
> 
> I'm not sure upstream should care about this case, but I though
> maybe you could give me hints about the best way to keep old VMs
> working, as this likely affects any distribution. Obviously not
> upgrading QEMU is not a solution :)
> 
> The simplest seems to revert 82bf7ae84ce and this patch, but I
> doubt this will be enough.
> 
> Maybe there is some clever thing to do before reverting 82bf7ae84ce,
> that could also benefit upstream, by doing something with versioned
> machines? I have no idea (yet) how that work and if it could work.

Does just applying my series fix it?

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg06463.html

Ie, I have resurrected specifically the a15 to keep things working for "virt".

Patch 22/50. Maybe I am missing something though?

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg06494.html

Ciao,

Claudio
