Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4395549wrg;
        Tue, 14 May 2019 13:14:58 -0700 (PDT)
X-Received: by 2002:a63:e550:: with SMTP id z16mr40237692pgj.329.1557864898847;
        Tue, 14 May 2019 13:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557864898; cv=none;
        d=google.com; s=arc-20160816;
        b=gxTzFhua9HRnpWiJOlAN8Av/9yCOZYYInNcELYQ2OW74gWehIrGv9WSo9I/AL5HtRl
         UMwCH+K0KZoQDyraXAZna+o8FlpFQ+EXJInBBKpxMSUmvFMVmPnVaG/JaxJ39Qg4Fm3Y
         IZ9k8oIAaqemy4hz0L1o8Qg1AjDT24IBSoSnZ67EqYrD2wfeIGPA53Bkk4B/c7I0AOcI
         jxSi5DS9piMGS0j+pFX4hZgNte99B+E6g+X/nBDrEhEnHwZsXhZRhqg7I2vcrNWQp/0v
         xiy3dyfoC8tzVFcsvN0gT4amKVYxb6mjIGkFNlAE/l9X0+aeULNNGvp1/CsTm/uFrD4I
         wFZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=LUOl7Aa8oTxi3OWMpOoCWP+3n8pVS5vMOJqGBVgPMS4=;
        b=vZzqPY88NSsoVz5TT1lIQIRJfnM9UlQqKSmX2oxOV3rk5Nc27I8Eu32JxaN8jXJYSU
         kGoq+IIGelcgy1B2hXq0incjwSZXaitLr9ssNAMrc1s6aMk1Dx0VC83zEN5ONvzJhqdC
         oexsAFeR1nXOa3gDVez06CGQsLQihY5MXeOvV68tWsI/xmVMixGex9az++cdN5Rb8BH5
         TjQQD59Be09oQMYm98qYYdLErqv3cGnWiWoe1D+bua7Pm4Ewwvf67YtvrtD0GvJIhLSE
         wVrwOJD4jKn5mP69+w2/SXg3LZ0jV0aHY0nwh4KJ5s/XJlYHQoL6+im8P+X+190Q5r91
         M/RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ougrnLSG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u12sor18979897pgo.62.2019.05.14.13.14.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 May 2019 13:14:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ougrnLSG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LUOl7Aa8oTxi3OWMpOoCWP+3n8pVS5vMOJqGBVgPMS4=;
        b=ougrnLSG3PyQRkAX8A4JaGP7yc2Km4TL474VywuvtZuGk1+AaO4q9O63GDUQ90IhOs
         FRsaFVWtoRLFRwHq5Qy6q0MrLll/nh0kALOdKiYd/UqFxlNx2K0DMhTDG3wtlOVuv3NG
         QRGHlBaAS7G9tG7Sc9SozB1JoSsOFOJvoYwEp9U1WKYvgOJHVmN8KTliV4MYc4MLP8AN
         ERFQ/G/fDqrv++1cgavRNL+xVGEcyS3oY2gr/FHtoWdGDwQKC8kjiJ9/5A+sQK+zJH6B
         EgSVQc134fT5MeuIaj3CcRYgdMVi1URubl9FK8EUoNE0Dy90l4iwpi/eVoYTtiYmPdww
         h89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LUOl7Aa8oTxi3OWMpOoCWP+3n8pVS5vMOJqGBVgPMS4=;
        b=TQ/OakQd5QztfuKaCA4rlXqk/UTU47POWO6rlswoFHC2ygpHoGBa79d/fCO02tnCW8
         rmDLInpDia41/CVYjvWZvgryQdD6MYPB7AnfZRfRicig/fq8bp3AEiif3dlakVYqOsYk
         FlUq2I+PIKeBMhBs6rr03pfLePJ7zeD/o2QAIydfGH+phSnIgArJBGDljNLOdsf1SwZS
         U+B0Ob6QCK1hcs6wj3F/IkRPORx+Fz/AZ/tfQQ1aEI0VT7sZ40sPkzuVsRmRUB+W79LP
         +oM2Q4cVfmeemuCDOswjE6pbj7EwlHOAja7TQRNZ9QUswOTu+SXcqjyksoRyya5hxoKs
         iq8Q==
X-Gm-Message-State: APjAAAULPdM/kgicCnQv6BX3K79tinxFufl/KR8lE0RAGYNn3Ddhtxs5
	pERFNfITHieqhQLUiV/lvhV2zqjV
X-Google-Smtp-Source: APXvYqwlWY0f/6uOfFGLZRJxSRd2xpO5gsjvQ7kbAU4M0+MEKc8QhdrPsEZqnLOLK9MzUpCT8TfKPQ==
X-Received: by 2002:a63:db10:: with SMTP id e16mr39990150pgg.142.1557864898126;
        Tue, 14 May 2019 13:14:58 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
        by smtp.gmail.com with ESMTPSA id n9sm2540875pfq.53.2019.05.14.13.14.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 13:14:57 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 00/13] target/arm/kvm: enable SVE in guests
To: Andrea Bolognani <abologna@redhat.com>, Andrew Jones <drjones@redhat.com>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 qemu-arm@nongnu.org, alex.bennee@linaro.org, Dave.Martin@arm.com
References: <20190512083624.8916-1-drjones@redhat.com>
 <9f57bfa56715b3128c1823150457ddb866e6054c.camel@redhat.com>
 <20190513123656.6iu7ebu7zucn5mxt@kamzik.brq.redhat.com>
 <e38aac8cb33c5782499b4ca0356c43267f05dc5e.camel@redhat.com>
 <20190514125329.mi7ctaoujirwm6gs@kamzik.brq.redhat.com>
 <1857a74ef586a4e41d93b184498cfcf6c2927cec.camel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1cd94ba6-2bfa-645e-1034-dd05e8a77000@linaro.org>
Date: Tue, 14 May 2019 13:14:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1857a74ef586a4e41d93b184498cfcf6c2927cec.camel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: vxtNeqiug3En

On 5/14/19 9:03 AM, Andrea Bolognani wrote:
> On Tue, 2019-05-14 at 14:53 +0200, Andrew Jones wrote:
>> We already have sve-max-vq, so I'm not sure we want to rename it.
> 
> Oh, I didn't realize that was the case. And of course it already
> takes a number of quadwords as argument, I suppose? That's pretty
> unfortunate :(
> 
> Perhaps we could consider deprecating it in favor of a user-friendly
> variant that's actually suitable for regular humans, like the one I
> suggest above?

Why is =4 less user-friendly than =512?

I don't actually see "total bits in vector" as more user-friendly than "number
of quadwords" when it comes to non-powers-of-2 like =7 vs =896 or =13 vs =1664.


r~
