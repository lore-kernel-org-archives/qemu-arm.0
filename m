Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp932993njf;
        Thu, 15 Aug 2024 10:11:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0YczsA3pAPQA2OzcnNWmaHJuHeZKkO2clBZqNVmx2dbLHm+vvyVkWheHfANZntOG+H+5jPGBloB4OYAnml0bq4+ssdB0C
X-Received: by 2002:a17:907:72ca:b0:a80:f6f1:b7f1 with SMTP id a640c23a62f3a-a83929558d3mr16743666b.36.1723741861711;
        Thu, 15 Aug 2024 10:11:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723741861; cv=none;
        d=google.com; s=arc-20160816;
        b=DBptFyZwumCre4b8DPCa4RZHHGgxo17EByxMnky1icr3pmpSBIsp7wuaNmpMye7Dxr
         wntj22R+9XQYOE0xYCPDAiA/kup0oNwuREgJW3GJaRx9lqftfRJYws3zT/YoQZfcJf6l
         5IrzjYQ3I20Se10EqFLQGBf3Vzuvd3ATrSo0heZVkOmSDRsgVoOJn1HSOKX5eRkVE+tL
         iuI+RQUSXDuwg4HTQvF6kUka/vtRyaks1aWBJ6/CmxHivWbC9iAqAqKuo3yEiaEY7fsb
         8S+l37RbttVmm2QGIUfVMypbF9imz1LOFejZoqIFOcvimYBGnaTgllnMYRp56ClaFcoI
         IESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OHpC/wISg7fXHkMWSZi8PZo82atmWJMxlsoGxe09h4Y=;
        fh=6Ggsx9f3WWeqRO27CGcoido9Felbc72SIR1qLRyo0eI=;
        b=UdkFXCv6UVSfKu1fE1r0xfqIUp4LUZ9gKzxLA950Egjl74aL6Xa1tZb60fIafH7IwE
         yaeuRnBh2165UNfnJ/zyUzOAiy+aDeTbP93dcXP64ZQP0sv/vIKwmyoblYrVv3ear5lG
         +1vWXmEKI+83BoO9Dj5+sB/SOx4CzB/iu7tgcz9IGuM98AjmloudpMMJ25ephf7rVlhA
         aFdNptSZnJrEsD+sQKSdx2fQCZvwDl5A7VC4Ufr8QNZhtAZoFpLrr7hjGTzURiWRugSo
         Mkp+mp3zNKs0pkkKYUH3arzKwtEzOOU/X76WtPrGwkN7dylwmVprgmSqAwBm7+I2YYcL
         zW8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eYytzFZS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a83838cf145sor51002466b.8.2024.08.15.10.11.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Aug 2024 10:11:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eYytzFZS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723741861; x=1724346661; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OHpC/wISg7fXHkMWSZi8PZo82atmWJMxlsoGxe09h4Y=;
        b=eYytzFZSkYglvtlmhr5nmCRZABO9RXOdz7SuuhJDrHoVhL1mzqVSlwIVUuAZp/2UxW
         EJgsT8o0CrNAbqE18zXZ4YickEJjw0Igc4pegO+58esdt/Z0boZTNrLntDTd49a2r2eK
         tNJFlN4ZXABk4QoJYoB6mtAXsftjmIgQM4m8d9MkBrKJfXmst2PLiHmyoTyFkziKvZ3W
         s4gLVyci4J7h+RqzkkiJOaAZ1UBP2VzPpqmmaR2/fUfE15ZVTGYqp1ZT6broaiSU6C1z
         iKdX7xtGv8op0lU6DSY3ugZEuWMbZMsW55SyWi/iiCKt5hl6XHsDykpBO2MYuv7ua/+f
         EzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723741861; x=1724346661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHpC/wISg7fXHkMWSZi8PZo82atmWJMxlsoGxe09h4Y=;
        b=fu9F34XgZB4slpUIkEMjAhn4C8dzXP+S9eSvZZ1iF2vlcBC6ipmQ2Wxsyu18yiKxrj
         zHSMoJZOy4deN4lXXLzvGRiZ5VJFRy6XU/fx0KJS/0mNOt86FDG1uBPrK559afd/3JWF
         k29wVhrFhvfXAhF1XXJ/M1xO85erL9kCek13rjQvz/CVQiXvIWpzRk8S3AlKOXCSFeJG
         vv+f2HDMZl6fU+LUjNPJvcUe0c0xorUQ8wDDtV9bfodj2toU4Ksihf6OWwwQ6tErp5lF
         AQUrTj45jCW3HACiPYEGwXZjm0tsf90tDPBJ+3krzgORqnZF3wdE6Ub9jsm7hbJVEYzE
         95Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUNHQWj47amRkWgpVGk6SwytUkRrbTD9rTTgwRBjkKImnbs+d39l7vpqT9p494Biz04iiV9lxQ2Tk1V47I+NUTPIkZcvzuK
X-Gm-Message-State: AOJu0YyDJiEtyBNMerccQa7YYdPvgtQyt/4ftHss47dzjfCHJ/F8Nqgz
	PTdpyxIjBlkJU/SLhRjsLggb3LQk7KTkvOpDCiHtV8EkOofDFeSRz4JyVHO1hYE2PgbBcLYBOhM
	a8JAqiR/ZzrcLEBPzexcHSI+i2stDmnh3csf+sY7M
X-Google-Smtp-Source: AGHT+IE41STyMRSD0RB62mfL0YGV9Zc8KuY9gIiuBsK0/W1rnyGZQ3t2Rqd/73X4D1+0fmjyioax0pQsGs6+Ps8xpOQ=
X-Received: by 2002:a05:6402:51c9:b0:5a2:ec88:de7a with SMTP id
 4fb4d7f45d1cf-5beca7a93f8mr60524a12.33.1723741861012; Thu, 15 Aug 2024
 10:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240815-rust-pl011-v7-0-975135e98831@linaro.org>
In-Reply-To: <20240815-rust-pl011-v7-0-975135e98831@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Aug 2024 18:10:49 +0100
Message-ID: <CAFEAcA9qfNRuuDJbwwGZVzkBeW04Q6Wk5w5ySraQBkxvV9=Fbw@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] Add Rust build support, ARM PL011 device impl
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Zhao Liu <zhao1.liu@intel.com>, 
	ARM TCG CPUs <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Junjie Mao <junjie.mao@intel.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>, 
	rowan.hart@intel.com, Mads Ynddal <mads@ynddal.dk>, 
	Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: iy0S4oe8lhs2

On Thu, 15 Aug 2024 at 12:42, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
> Outstanding issues that are not blocking for merge are:
>
> - Cross-compilation for aarch64 is not possible out-of-the-box because of this bug:
>   <https://github.com/rust-lang/rust/issues/125619> in llvm which when
>   fixed, must be ported to upstream rust's llvm fork. Since the problem
>   is an extraneous symbol we could strip it with objcopy -N|--strip-symbol

I asked around internally and found somebody willing to do
code review on the proposed LLVM compiler-rt pullreq that fixes
the root of this bug, so hopefully we can get that fixed (though
presumably we might want the workaround anyway given it'll take a
while to percolate through to a rust release).

-- PMM
