Received: by 10.28.71.27 with SMTP id u27csp5095838wma;
        Tue, 27 Feb 2018 09:57:51 -0800 (PST)
X-Received: by 10.157.85.156 with SMTP id m28mr10347405oth.72.1519754271559;
        Tue, 27 Feb 2018 09:57:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519754271; cv=none;
        d=google.com; s=arc-20160816;
        b=kL4dK7sAfdxq7Yavkc9NsEsV2ncHITFWO6p4RtnVDa3iou1hrDoPH20KpQHpO9C5gB
         eiFvvkvsA+RdIWSbeFPxj2FJiaUlkDD9dtKS6pHNDOxYTF+bNnBQ0pgh4s6kMt1DqvOv
         QLRDGrpb16qFVMhxLorA6bAu6d/I3qgHimmVDQLkG5823eZCZCDhhjNoC3DtzuwRFg3C
         yy7AFuCk1eKPDh1vPIABaxJyYxVAYJIUIDNdoTdipaRngCxH+n/t+x+9fcL81op3QE1B
         kTVG5Z5OBYnOSGA7s+B7f/dcnD5b21Alff+pMLzEvR5TCpccKH+xoPtXa7KnL/2ty0zO
         1nzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=5NwGOq+D2ZfeXJGdip8aZYilH+9bTpZv5C05jKOzLLE=;
        b=HVZGAL8Gb0oNjG9vuJ8g6VKwzptmdR/hDtRmwA+W9XZkI/EgZA7rmgKrI8EKLJRiza
         Rr/OS89xD964gfacIr4qEQF5NZbSlM4zRedn8xbWn/pBrT9hNcbYJVmByCTCXIhK0Rrf
         2rWS5D6XDfbAwlO5j6psnMocyHcKMEOJQ8JGVEnLs91RgJ4lDNbww3QQEIa481KQSWOo
         iXAIaDHleaxgs+6gBKAKmV4R5qZB00AT6xyf2Ti3UDmhGZveBOrtqnYOsmbDzWfdTNn7
         yeY4M8fOHsW4EgV6bCSpiGk/Le8GFKe7PWAXc6KazOcZG42/77Zlp7Yyk5Cma+HyOLN8
         FPXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g03l2c2N;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x39sor2311023otx.200.2018.02.27.09.57.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 Feb 2018 09:57:51 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g03l2c2N;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5NwGOq+D2ZfeXJGdip8aZYilH+9bTpZv5C05jKOzLLE=;
        b=g03l2c2NooVtbU/CXQM+qeDSQIIqehq4TRB5Es/PPp+5AiFXeahE8yvPsXFWqlN8ul
         06l0sZlsaiJGKKnuxD3HTPwWRD+3kUlQNdqbaTE7qPYCrePUgbC3RbGAX9WHvcft2Xvv
         8lVa5bMB7sgcxf5v+EwBTNwy7IlVn983emEaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5NwGOq+D2ZfeXJGdip8aZYilH+9bTpZv5C05jKOzLLE=;
        b=hzpx3MpaC/2Fskv4Bot0IwccFcCfOTZKU+1PS2IGFSzz8CaQEg3G0yGxOAQWP9v3/m
         ICCfdYJf8yjrnOmY4wx7nrpj7tYcMMhH28NuC++QK9fPJTx8f8nwS/GwA939YudGwgkM
         dodO9fvYbDvGb3cXEsEZ2cN/VIKsVCKE+aSojYYKnpxw7OLMfZMUyH8ksibRI4zOyXcG
         RuVZtcdhgH/MVeCIrIyl/5IjpvImNmGf+E/3Nl3KdBtkSr316N2icsr2Mhwie52D1aKD
         5YFuFXIjjWJRlK2G0m9CppB1z7PHgWEr6FPHW8I32LZpHMO6V6uBxCNpmZAr5mSlROTa
         5LcQ==
X-Gm-Message-State: APf1xPBJfPdENcTNrxvzHYp0Is++8osDNMODKgL/yGT6hMNmbF/p3Jxg
	m404KLAHhEY3HnUeHvnVbd1nSJ58CoZnjUiQPIi/w10yPLA=
X-Google-Smtp-Source: AG47ELvgLZ/zkMJgj5vsYaWwO3fZJtmVBBH7pC5wHqd+fPeXNWgYdPIgbE9BSozGwZEm9i0GoGblD5vGKifOTrIu9aM=
X-Received: by 10.157.23.34 with SMTP id i34mr11617882ota.210.1519754271137;
 Tue, 27 Feb 2018 09:57:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 09:57:30 -0800 (PST)
In-Reply-To: <87zi3uuxpx.fsf@linaro.org>
References: <20180227143852.11175-1-alex.bennee@linaro.org>
 <20180227143852.11175-15-alex.bennee@linaro.org> <19852743-3c93-9d0f-5ef6-8bf351a98ce7@linaro.org>
 <87zi3uuxpx.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 17:57:30 +0000
Message-ID: <CAFEAcA8zVbZkzLtB+L3x9WQ6Sgh+i_gzVxYdaLJfENYDyApAAA@mail.gmail.com>
Subject: Re: [PATCH v4 14/31] arm/translate-a64: add FP16 FMULX/MLS/FMLA to simd_indexed
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: X3bs3dDdNuBw

On 27 February 2018 at 17:52, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Richard Henderson <richard.henderson@linaro.org> writes:
>
>> On 02/27/2018 06:38 AM, Alex Benn=C3=A9e wrote:
>>> @@ -11244,7 +11245,7 @@ static void disas_simd_indexed(DisasContext *s,=
 uint32_t insn)
>>>          }
>>>          /* fall through */
>>>      case 0x9: /* FMUL, FMULX */
>>> -        if (!extract32(size, 1, 1)) {
>>> +        if (size =3D=3D 1) {
>>>              unallocated_encoding(s);
>>>              return;
>>>          }
>>
>> This is still redundant, since size =3D=3D 1 is handled...
>
> doh!
>
> will fix.

I'd prefer it if you didn't, because I'm in the process of putting
this version of the patchset into target-arm.next...

thanks
-- PMM
