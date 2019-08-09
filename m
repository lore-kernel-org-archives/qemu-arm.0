Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9303074wrv;
        Fri, 9 Aug 2019 07:55:27 -0700 (PDT)
X-Received: by 2002:a62:754d:: with SMTP id q74mr21273586pfc.211.1565362527666;
        Fri, 09 Aug 2019 07:55:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565362527; cv=none;
        d=google.com; s=arc-20160816;
        b=gFiUNhvqWTaa2SYMCU+9d+deT8IsaaR7BFEktHc/MhD6HoRprbQPXKSf1P0MScX1Dm
         2nU4RmCGf5rrt9Z7YVcpQul1cs1h9SlDXpdH++nqNWHgNjgfpDR29fNrqugxIfJ3w8NX
         Vv5u9tUeDM3Mk7L9KCnKJr+tyjJt4CHX5FKgsXIN5V1zqzRojCHmiqPRvcg39qJEYcyw
         nO8kP35Lhd0uEwqFOEunrbc9w4HaMucPSBE/WJVpyJlQt4bTRhelyC4U+9XbBKE4QITi
         m+MPviSwZfkVck2sKRsKXF88d923PgwnZ+M9CC0Bfp2C+Stl2eq6if8KEDcrn/M7eW16
         FYAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=PWPVVDThU0nmtKU2IIgFUotz4Rs66obF2GGJu8gYVwo=;
        b=NPLMHGYiQ9PXzUnOr0O8momRSYJh1ZoyQsbmWHvcQqEQd+LWWYdkiWt6fQiQonIC74
         kob11KvVEza7j5G9FyOj4ZXuvU1Z3xfsMZ/6K+i8c/I7gcikW3i/C4uy1xLOVn3bvUfz
         hlj9/To9GxraCgikBfcV2NVKB+h6bE64z0PgvNwJshJgTR311SQqLDv5kAfW7moPegjH
         CnEXpZQzLYCuStzVhUw1BFS1I1YsArXFmTao39ZPT5y2Fuegz5vdiaW0pu/VkmXIh6y2
         jJlR/GeSFf51Sl+E4wuKGl4QkvePJNTIwEg3iTKJsncIT+ukLGym8Y7wyrpx2UyrZDGy
         1VPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VmqlEyRT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q1sor78983158pfb.34.2019.08.09.07.55.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Aug 2019 07:55:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VmqlEyRT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PWPVVDThU0nmtKU2IIgFUotz4Rs66obF2GGJu8gYVwo=;
        b=VmqlEyRT7YAE11NjNjlF9MlXe5TwYyOvLEOXW5bFzlB/pw6DEmcii1eRhXCoUqJQwO
         AEp4WWvl0C1XmO++1W1MhaFKpus3yDc5NUamWbHFro8ynuP/5p4LnhxGuq1EHQei7QN0
         35wPnjafj+uBQnJnNQlGDSBRMcyGnrWdhSWfbQpXBrVEzvDz5WTpaWuFx9XMLk+YALuq
         Qu7O16A08ZFLjjgq4QTV+fWjMCNx1zem5jBKw4haETF2MwsfmC/dpLOX0JKMtv8aBq/x
         wf3LaVYEbPi27++RDK2T8hM/4vHkr2leMtRQnx4/GO7B9hB3/RHRfTBOF8GEcn0jfyX+
         LTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PWPVVDThU0nmtKU2IIgFUotz4Rs66obF2GGJu8gYVwo=;
        b=GsfIIBq+1nlm2GkNDsTrDnnc1//YrRPi5igwRLA7bLcAjBtvPc5okXtIt7H9KKrMjC
         hIx7K5iFXJf7SOuEm9ExGdrKEmSBNVkLaU0pL9kRNzasOMBNZ8A0tHd6b2OvRWAgJFa8
         nnnm9rFFWRVzgUI/lq6MRZVRpwFpW4TxmWRSAihjc4YAdzqvYV8xcdJTilTFYjR91iRc
         5Xmy1j5zk0e06xLrngzPqgfXkEfBoyy/GmmoFKuUA9eCURHJdohNrGSH6erRJcUcOK4D
         NHaeIuqAaQcn5ZuazrBeD+ai8nUGfcIA4QuPS4rW6WTmoWbbNx83qKabk+6LChPgc5CT
         rJbA==
X-Gm-Message-State: APjAAAVnIpVb2h1lI4Z3Ra+IDVmdU3IAPhl0u5pnY0qr5rd64POcBhOk
	KBo4cWqUOWXTxx/m/rgEqO2msu/WM5oJJw==
X-Google-Smtp-Source: APXvYqxWc6Af9XIn36KXzp+yo/Kp8sg6Oifk7UhtBk8ZtOiwXdqeP7YIxwpVWhfFRexCytODbvWekg==
X-Received: by 2002:a65:5043:: with SMTP id k3mr18388880pgo.406.1565362526523;
        Fri, 09 Aug 2019 07:55:26 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id o14sm5007235pjp.29.2019.08.09.07.55.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2019 07:55:25 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 11/67] target/arm: Add stubs for aa32
 decodetree
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Stellaris" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-12-richard.henderson@linaro.org>
 <CAL1e-=gwyGB4ibo_B5W1MpFy-9bB7=5juqTJVBdD9N6XFOOsSQ@mail.gmail.com>
 <0f37edc5-2fb6-c92d-fb47-a381af649072@linaro.org>
 <CAL1e-=hWVfYVYySkMCF4NUkHbe=47qUTuAA0vK23TGMBzuA+PQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0b6556a5-7db8-bedf-89f3-7ead8e9b19e6@linaro.org>
Date: Fri, 9 Aug 2019 07:55:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL1e-=hWVfYVYySkMCF4NUkHbe=47qUTuAA0vK23TGMBzuA+PQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: JJelW7Qpw4ZM

On 8/9/19 3:31 AM, Aleksandar Markovic wrote:
> 
> 
> On Thu, Aug 8, 2019 at 5:43 PM Richard Henderson <richard.henderson@linaro.org
> <mailto:richard.henderson@linaro.org>> wrote:
> 
>     On 8/8/19 4:41 AM, Aleksandar Markovic wrote:
>     >     +/*
>     >     + * Include the generated decoders.
>     >     + * Note that the T32 decoder reuses some of the trans_* functions
>     >     + * initially declared by the A32 decoder, which results in duplicate
>     >     + * declaration warnings.  Suppress them.
>     >     + */
>     >     +
>     >     +#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
>     >     +# pragma GCC diagnostic push
>     >     +# pragma GCC diagnostic ignored "-Wredundant-decls"
>     >     +# ifdef __clang__
>     >     +#  pragma GCC diagnostic ignored "-Wtypedef-redefinition"
>     >     +# endif
>     >     +#endif
>     >     +
>     >
>     >
>     > This looks more like a "band aid" solution rather than the right one.
> 
>     What would the "right" solution be, would you say?
> 
> 
> The right (without quotation marks) solution is not to generate the code that
> generates compiler complaints.

That would be impossible with the information supplied.

Emitting zero declarations will result in invalid C.  We ensure that each
individual decodetree file does not emit duplicates.  However, there is no
knowledge across separate decodetree files about which declarations are duplicate.

In this particular case, I do not even agree that the warnings themselves are
useful.  I suppose it's not impossible that they could diagnose some weirdness
in a code base, where a function is declared in multiple headers or a patch
application has gone awry leaving multiple sequential declarations, but
honestly how often does that happen?

I suppose with some work, we could not invoke decodetree multiple times, but
give it all of the input files at once, producing a single output file.


> Obviously, in this case, decodetree-generated code shows that it is
> inferior to human-generated code.

That is not obvious at all.  Moreover, I disagree strongly.


r~
