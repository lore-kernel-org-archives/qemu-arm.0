Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp420029wrg;
        Sat, 15 Jun 2019 03:26:31 -0700 (PDT)
X-Received: by 2002:a5d:4a8d:: with SMTP id o13mr33861985wrq.350.1560594391092;
        Sat, 15 Jun 2019 03:26:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560594391; cv=none;
        d=google.com; s=arc-20160816;
        b=vjLU5V4hU4I0QU+DCU0Cxvnwq6eIrLQNXIKD7SIRYb8tZndqokAibdETZ0hp61MUcL
         rZzF26AUB5CmAFNezVl9H30cDL7IwXoHEU7k+x1QrvKpA+WC7h2XSvBXP3pFe9/N1jKO
         wsbAzCJBLLQKKgwDiIR957WxXCxgTnWHoFIkHlKFufS/3k4x3XIUnmAY7dHvoXSW8t/p
         X5cpMzCuvUtI2gYhVpxepORWKIDnvZnvsb09NhSEGybGc/5LA6e/M4IrvcDm3YCUbXG8
         4nqnPm6UxJ4LG6cEmSLgymebVM9Z2pQci1JHuxxM3G7zcd8oYwgrah+zcxHzc1HRNW+V
         Mbbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=we76Cor5YuNEJsNdw3qAWVmIkcWTsQUYt8rM5dM4Acw=;
        b=TCSAKqjhFs6+OO2tqqjo8LRTkUjFLv7IEx6X45LSdMgJjbW/DX77j97YPXnoWVWlHF
         gJPg5fdNJ+codWE5HEJHFNFOZSpKre3T4Mv/qMPXQ3wTF19yizVB56bDl6ImwBs5VmzC
         nD8LMdBkevY+0yloC99ThJVY4pHtQq8vwg0SFRBudd8l16ts+xldfOCQTKgNw4Jrx+co
         idzLhfK2qfN7YCqv8dtV6FzTBbQsk6YsvSzVSPCycGpCs8dAXRzxOs5w7tPukBME0gMa
         LvlEC1lVzX4I8iVLS/usw+iocSGrONaoz1g8TmkJ6HqW1+JDl7+qNeheRe/NZ401TooL
         kSAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x186sor3164087wmg.25.2019.06.15.03.26.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 15 Jun 2019 03:26:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=we76Cor5YuNEJsNdw3qAWVmIkcWTsQUYt8rM5dM4Acw=;
        b=Omv3bhnAJRz0q63GR9hrT203vCQ+OzTcFvfqp+vrlQxuGucmxfJyYr3VlzxiViWNZ5
         tnGtftXGA1r3GnxIXg8CDaDCqTMbpPoafBCBuWqx2OjuowmaI0EmLZ093FYNiTwuH/eM
         lsDGJYa1um7RB3HhQ/DUSm8zAVS2UWfVgeCE0S+HHkxjC016zGURnThL2j9fSnqmL/kS
         bWaij4VPtNP3OEkuPDvMlrwTo4FGw0uT2itwbAjcxKtct4Wq3sP8J+4yzQzwyXgC67X1
         /NF8tkVK/aROu38UeWSP8IKCTFCoq3nVZLUyUsHCiTXSTwTvDSAA8i4qI4k46swCjykJ
         xfug==
X-Gm-Message-State: APjAAAUm29vUZXsD1EdyCLCxccvnF+TBb/bX48w9Iuk5npkOnU1y1gcU
	U09d5KH/GRfUuRgzBm7FJSQGig==
X-Google-Smtp-Source: APXvYqwKpZmX8MudhG4BDlV03CX4LTq2IKA84cHfqXUrXyPYqw+RL08yak3gqaCV2zhgQw5mNzZovA==
X-Received: by 2002:a1c:a7ca:: with SMTP id q193mr12136363wme.150.1560594390840;
        Sat, 15 Jun 2019 03:26:30 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net. [88.21.202.183])
        by smtp.gmail.com with ESMTPSA id z5sm3856110wmf.48.2019.06.15.03.26.29
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Jun 2019 03:26:29 -0700 (PDT)
Subject: Re: [RFC PATCH 0/2] target: Build with CONFIG_SEMIHOSTING disabled
To: Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-arm <qemu-arm@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>,
 Rob Bradford <robert.bradford@intel.com>
References: <20190531154735.20809-1-philmd@redhat.com>
 <CAFEAcA9TJGq-8fMv2amQEEGz9QKCNWYwJxCXrjqSh=Yc87yTww@mail.gmail.com>
 <947e851b-4b95-3126-2eaf-d5d16f8b831b@redhat.com>
 <431872249.25606899.1559321648368.JavaMail.zimbra@redhat.com>
 <a3cbd83c-a942-25f4-d424-bbbc0013acec@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c81017d4-0ea0-99f3-854d-6ab4b514a15c@redhat.com>
Date: Sat, 15 Jun 2019 12:26:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a3cbd83c-a942-25f4-d424-bbbc0013acec@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: WIFr3OA4Z1Jn

On 6/3/19 10:11 AM, Paolo Bonzini wrote:
> On 31/05/19 18:54, Miroslav Rezanina wrote:
>> What about CONFIG_ARM_VIRT - can we use it to introduce dependency on
>> CONFIG_SEMIHOSTING or is there valid scenario of qemu build with CONFIG_ARM_VIRT
>> enabled and CONFIG_SEMIHOSTING disabled?
> 
> If you are not really going to use TCG, disabling SEMIHOSTING makes sense.
> 
> I think Philippe's patch are the right way to do it.
> 
> Perhaps CONFIG_SEMIHOSTING should be made "default y" and added as
> "#CONFIG_SEMIHOSTING=n" to default-configs/, but that's just cosmetic.

But then it is compiled/linked on target that don't care...

Oh, but this is also true currently:

$ fgrep -r qemu_semihosting_log_out
Binary file ppc-softmmu/qemu-system-ppc matches
...

What about:

  config SEMIHOSTING
      bool
      default n
      depends on !KVM

and keep specific targets using SEMIHOSTING=y

Using "default y" or "default y if !KVM" we have to add SEMIHOSTING=n on
all targets that don't care, which seems an incorrect use of Kconfig.

Aleksandar: Can we use SEMIHOSTING on KVM MIPS?

For ARM Peter said:

"semihosting hooks either SVC or HLT instructions, and inside
 KVM both of those go to EL1, ie to the guest, and can't be
 trapped to KVM."

Thanks,

Phil.
