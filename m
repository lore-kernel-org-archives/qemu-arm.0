Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp202038lfp;
        Wed, 12 Feb 2020 21:39:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqzDqz47Vr0JZlSemliqi7Uef+KeQ2H1YhCJPw6qf95J7lXs+hrWoHMkkEo7g4atGZdadb4u
X-Received: by 2002:a37:dd8:: with SMTP id 207mr13921519qkn.292.1581572369898;
        Wed, 12 Feb 2020 21:39:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581572369; cv=none;
        d=google.com; s=arc-20160816;
        b=DMx/6EiD7TN2q+2FA3IqRJY4wW88GPWd3cUhNy21Z2YEBytB5Wh2QT7YOeYQSwZ/gx
         eeeS8YGfr4FcrmwuX8n8IRD4MlKv89Cx+Wo9oHaUxC/rpaFDdNaxfdJ1njF9LAjm0CwI
         vC13GPwxhnXuMs+vQjWzJJtRbxSNMaeJEENNzOmdsD5g0nFk/SpArf71Ipht+RsBlqoF
         1Z+zElllgrmalEOb0v7iZU8xtcoCmlPL0EBi+zyMLWVRZ5Gxh2CEYj1uyDtg8q6wth7R
         5kDuiVyfMgF7FjZU5ojGkq4hD0OZ1hqYV/MP3GyKOSbcZWYnNGpK5EDhKZxUNDrdGJzZ
         QGmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lDCVuErHQJjOmhI7dDFKkfqmlT2bJoLE7QQMKQfbVfY=;
        b=DuPAXdQZDetLzKrIdy6mmm9VOGzgjB9IMJC495GekTJSveca2Ri4TPYb2mG5EyK3ww
         MIvoyaaO9OpXkBBGCkFpJebxFOKNudW+pGf5Z6biNSh55eiK/vIrASHdalhtm5Mkq5fJ
         gKLeeT0PbFTvxO4lObg/3E7jQ8PxXxX6b+psAJoum3Vjp6QpY5Ns0HBDhZsWAN8DSQhc
         0m6ML1rRqO7O8d+pytmszS9n0Tlzp9Lt+XFpNBKm7xxbSSekU6c3717xBJVDzEwx4IbB
         WR0GVdGgSGKka//35gPn/6SIzAHzkMZvOTEpQqcs5n9/0goMcVkUUvIBv/nRUteux7P2
         1xvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ni9V8NTf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15si692236qkj.329.2020.02.12.21.39.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2020 21:39:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ni9V8NTf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j27Dl-00056B-Bt
	for alex.bennee@linaro.org; Thu, 13 Feb 2020 00:39:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44746)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j27Dd-000560-Nc
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 00:39:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j27Dc-0006f1-Fn
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 00:39:21 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36635)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j27Dc-0006ea-8i
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 00:39:20 -0500
Received: by mail-pl1-x643.google.com with SMTP id a6so1888944plm.3
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2020 21:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lDCVuErHQJjOmhI7dDFKkfqmlT2bJoLE7QQMKQfbVfY=;
 b=Ni9V8NTfEAOdi1Z5NnbynC5Gz8fFGrMdxg4zVfCaNj1njZxPToICMcCG2hzK13Nbni
 1cyC0f9+62AhsLhcjvDfPEADicinKZChrJNcDb5JKomdcT65SzQoxQp71lMA/YAS76Ja
 bceStlBd3K1Jx8y3UPBLLtIhIojnaMEoamJL0Akfi1Ch1KryJJT5Lr3E605wrlSQIHka
 mouCZEb+YHTBU3ygLl9Sfh/JaJ3Gc7fDokblSJ55UPh1EzlENs9MSOLzRz+BTWj1IyAO
 X7r+zpv09q3zXysazShJmI6D3GjAJ5TNKFpTSfJ8jyT7agmZh8AaJBw8luc+yuGW3SR9
 a4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lDCVuErHQJjOmhI7dDFKkfqmlT2bJoLE7QQMKQfbVfY=;
 b=SFrrNYnQKI3bbuQqof8NwohyIXgKhaXzGtRgfGFiqcl4XDcnuyyXc+GQ/yl+HFvonQ
 buPj0nyn90USrTAkrCDwgF366jxHFdSMh0aSEuu9k3ZfCa6IaxGHe7mr41EPGAb3677T
 qSW5zbeGseTQDCbTUfqSL4XOShY3KI8kaKdko4Y0wxHh8p3Z0W8giUIJ/PkAg7mZIjYh
 mK1EJ32WWcpu47nNKVnE5j1azO8q6b9hhkEYT2T9/OF6o17LSZjEHvZ1wMphyT5RzJvN
 PPEBjct2UoHY7mpwfmeJIrt/LochR+04Lj8HUhN59eyEZXfsQk1gXIo6xz2WMa3JscAj
 KHTA==
X-Gm-Message-State: APjAAAUuaOv/whY9iuEBrq+wzycswd85C9HVGkU/BqqZvZKreCBce3+S
 3uL2X+PUs6XmWoI0k7tTlyvB/w==
X-Received: by 2002:a17:90b:14a:: with SMTP id
 em10mr3196018pjb.4.1581572358870; 
 Wed, 12 Feb 2020 21:39:18 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 84sm1035165pgg.90.2020.02.12.21.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2020 21:39:18 -0800 (PST)
Subject: Re: [RESEND RFC PATCH v2 1/2] target/arm: Allow to inject SError
 interrupt
To: Gavin Shan <gshan@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20200205110541.37811-2-gshan@redhat.com>
 <8dce7dbe-c6c1-122a-f960-0fc29257dd1c@redhat.com>
 <CAFEAcA-RiVfrFFkxppB=z8x76rjorF-5onyGwVAdsHY7W1U88g@mail.gmail.com>
 <21e4051a-4d06-03cb-6d8e-5331b5b570c4@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a0ff5b47-876d-533f-ea18-e53ee371ceba@linaro.org>
Date: Wed, 12 Feb 2020 21:39:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <21e4051a-4d06-03cb-6d8e-5331b5b570c4@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, jthierry@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Marc Zyngier <maz@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 719L003OUjtT

On 2/12/20 7:49 PM, Gavin Shan wrote:
> On 2/12/20 10:34 PM, Peter Maydell wrote:
>> Yeah, this is on my list to look at; Richard Henderson also could
>> have a look at it. From a quick scan I suspect you may be missing
>> handling for AArch32.
>>
> 
> [Thanks for copying Richard Henderson]
> 
> Yes, the functionality is only supported on aarch64 currently by intention
> because the next patch enables it on "max" and "host" CPU models and both
> of them are running in aarch64 mode.

We shouldn't leave the aarch32 exception entry paths unimplemented though.  C.f.

AArch32.TakePhysicalSErrorException()
AArch32.TakeVirtualSErrorException()

It really shouldn't be more than a couple of lines, just like
arm_cpu_do_interrupt_aarch64.  Remember both arm_cpu_do_interrupt_aarch32 and
arm_cpu_do_interrupt_aarch32_hyp.

> However, it seems there is a long list of aarch32 CPU models, defined
> in target/arm/cpu.c::arm_cpus. so which CPU models you prefer to see with
> this supported? I think we might choose one or two popular CPU models if
> you agree.

Even qemu-system-aarch64 -cpu max can exercise this path when EL1 is running in
aarch32 mode.  Admittedly it would be easier if we had the rest of the plumbing
so that -cpu max,aarch64=off worked.

FWIW, the rest of the patch looks good.


r~
