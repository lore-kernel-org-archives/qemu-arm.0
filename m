Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2078240wrt;
        Fri, 14 Dec 2018 05:53:12 -0800 (PST)
X-Received: by 2002:aca:fd91:: with SMTP id b139mr1834573oii.83.1544795592114;
        Fri, 14 Dec 2018 05:53:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544795592; cv=none;
        d=google.com; s=arc-20160816;
        b=fePU0uYb7xOSZQLgN2aSFcWWKN6ACiH0B5eaowbe6GoZpNX27PGK5iJYm4EJNZd4iE
         Fijjpr84WxR39+6YjNLGDSWZWdhYGs5ZeIxSsM4OW+t6sMyQD8hco3+wgwKs04M28h9F
         HAqmffUJfN29HxsFR+FJO9C8kSyzddAajT8OotxLnPuPFHejJY7oNOup3x9myvcVFTlw
         h+IbrAASJRd+i9rEk+elzX2tUWT5II9XreiHWoyVL4pDmY733veSX8qP7YImUjEXPBQ6
         1u4e5YjZV4dHhFJRYijQzpO2OpxxeCSFckDEanKjbV9qTjgVWq2upz8Nz9C8JeCLRqEM
         itkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=MHebJVeMNpj8hj0gszJYyLZg/4Qay7+51DAUKEP2IzI=;
        b=OaGUgbBwRzr9NeUQGELvt57XzifdD+6+US6j9M80cy6wPjQIYbe5dCoPvKJypR/Rxe
         ePIn5KwWDddCNdmDo2KkB4OkTm2W7En0w6yf2mLnn+GOAhiHc+HvyZeuWEcrCPIsnQhu
         SRavLK+tqSpIVNp6PX1agcOW1KQkuvV0UJRuBJ086Daa6yIHGxJ5ifd/IFk70Wj7jiTT
         m7Gil1UmFADwvKlQmOl0xvO3FaRc7FizxYGKvr3wlDduvUgzZbPc7T7l3A/MvpcyHp72
         xXdH+gBL+zLuYEf3coMMUNGt2udve60fYN7Uy7N+DTJPnRcvZ8mobMz0UWQE4e7pGlm2
         1Haw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TsEpvsBR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z34sor2954379otb.117.2018.12.14.05.53.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 14 Dec 2018 05:53:12 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TsEpvsBR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MHebJVeMNpj8hj0gszJYyLZg/4Qay7+51DAUKEP2IzI=;
        b=TsEpvsBR0f5A2cWPf8Do6C7p4qlrHqmhBztKjkfzza6MOE+GU/+/a3xfNZqoe3yKpT
         BjPE3E2cKdQVcHYngE5E/xtIMZqLAWbiLjz25TQtiCEaS8Orq2OwCT1fKcaoAIJgZHRb
         WcI7MImoqJVbJE4xnQmU1aRXrX4RTMJK6ALq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MHebJVeMNpj8hj0gszJYyLZg/4Qay7+51DAUKEP2IzI=;
        b=U0m26jnWd0CYqtD0J9+W+5YBJVv1Faj3RkTUlopj+Xxwh6uxfn2luuuHXlsxmbB6Ug
         nvdJSgNtZySiecw5n30mv4QgppK4BQ3y7S1Re8PtzD8i3cYs5c1QfRzOnXP0GctpR6Ws
         l43K3CMiYk9Cyw0GlKRD1/otR9T6zEw416PNV/lkz3j6hSjGYgOyj89yCj629XGXcP6r
         cjU9Ynu25evOsoLnS5zkhZhi4pXbgH58+ELTPysBAgdCCf5m+A9ej/Kho/sxPZg2HT9b
         /Rb01PN0BJ3HjRBJn7ehdIV2xJpMsY/ZSRynDhSlnCF0LuABT4EOfFjUEZQkpDvDGonn
         AOCg==
X-Gm-Message-State: AA+aEWbg864oor1z1cEMSQV+kVwacBfYf07m5CXMepOv85VjcM3mWLBM
	KKZUE6Emf6EUM3GDYzA3xCbifJQ+
X-Google-Smtp-Source: AFSGD/UDKmwlQQhrM+Q4Al79l8C125o2Q6epS8ggHfEWZIZGMiO8Vg1nebUzBW/QSKKkkmGK3s+YbA==
X-Received: by 2002:a9d:1ef:: with SMTP id e102mr2242376ote.100.1544795591663;
        Fri, 14 Dec 2018 05:53:11 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net ([187.217.227.243])
        by smtp.gmail.com with ESMTPSA id s13sm2624137otc.40.2018.12.14.05.53.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 05:53:10 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v1 1/2] target/arm: kvm64 make guest debug
 AA32 break point aware
To: Omair Javaid <omair.javaid@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: mark.rutland@arm.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, ard.biesheuvel@linaro.org
References: <20181213115503.24188-1-alex.bennee@linaro.org>
 <20181213115503.24188-2-alex.bennee@linaro.org>
 <CANW4E-1UmZOGHya4jHxj10O2Ki7MPGMqme7wT0jaCO8Ufrii6g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d82faf0e-87d4-984a-0db8-558d4e8bda13@linaro.org>
Date: Fri, 14 Dec 2018 07:53:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <CANW4E-1UmZOGHya4jHxj10O2Ki7MPGMqme7wT0jaCO8Ufrii6g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: qGp+J5PsaxS5

On 12/14/18 2:37 AM, Omair Javaid wrote:
> Are you expecting GDB to switch targets (from AArch64 to AArch32 or
> vice versa) when there is mode switch for example a AArch64 binary
> calling a AArch32 library function.

Mode changes happen only at privilege level changes.  E.g. AArch32 binary makes
a system call to an AArch64 kernel, or an AArch32 guest kernel takes an i/o
emulation trap to an AArch64 hypervisor.

But for this sort of system debugging, it would be nice to be able to
single-step through the whole operation.


r~
