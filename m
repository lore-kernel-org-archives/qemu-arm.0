Received: by 10.28.71.27 with SMTP id u27csp803231wma;
        Fri, 23 Feb 2018 08:42:54 -0800 (PST)
X-Received: by 2002:a17:902:7614:: with SMTP id k20-v6mr2245070pll.343.1519404174328;
        Fri, 23 Feb 2018 08:42:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519404174; cv=none;
        d=google.com; s=arc-20160816;
        b=Jhay9cGpJuaDryAVXBQn1Ggyg5NZ5fLexza+ncVHxJCto6N3fukVfw0fyj8VqUHcD7
         EVEeTi+0DFBKopXN+EVctKbClfdVkjhmbcxuEJ19d9Z9TQ5Rr+SMRqu+Us6lYrJwBV1Y
         0e3nBcsvd7Z0471O/JTMvfeGW4Gfa/q+0epU+L3jcn0cl0hF/hw0iM/+tmo8nyZSY/1R
         v2OQNCMe0Hk2WpSZXzGYyhhJYEHX/SvyeOIK1HvztrW+eBbwWc9iSyi6rVKH5GCC59Pq
         HJVOvQTSVahy/CamxurRnc5Qmm/Qi1NHdINUbKRb/E0M/NxAdXbplb973r64IpRQX9GW
         wXQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Q8p2ZhQZ56fXqwWusgM0qwk690zbwPa0AtgKQAlzJ/Y=;
        b=Cy04rct6AsVnQZiBdo+SZRrJ53lpor0tkOVs0EMLbVciij4Bx229sqClUEHQgN5ORk
         Ys6coUo20ve8AGAZWI5s4KXfFpFHrpOd2v5Kv4tHpw8m/K9cp5hhELPHgJBk1t0grl1D
         LKL19CutBNh+06KuxuuefuiQj8ldWd1w66HMk1FmkY/E488yTOFWYFJyYhKxk3YOIii5
         kj6y+i/w4srrVq8b8wCMvMqWjlgERCtyBTNFzc2ayEQnFOLVU6DMDMxJFxqZ39w+RXWH
         Xvgfdy7Yd6aPQzVnii613IAGLfhCGY0e8FQwIJow5MCP0i01BxXgtUrph14K+XIi9j01
         mA5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T1B0+DaD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v1-v6sor881038plb.4.2018.02.23.08.42.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Feb 2018 08:42:54 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T1B0+DaD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Q8p2ZhQZ56fXqwWusgM0qwk690zbwPa0AtgKQAlzJ/Y=;
        b=T1B0+DaD2Fjxkibap0qdhhqR5Im9pUTsdf70fBonoDOXKg5j89KZBP0nzDQG2RPpHJ
         VQ8LY5WgHYKOnKubizTA6XXJXaPYaiGppNluBGt6RagN9piobTH1SgxRyzX1gPm1iPjk
         KVCL9RY/29kfLGaEkohbGRmRL7el6jZK56Mmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Q8p2ZhQZ56fXqwWusgM0qwk690zbwPa0AtgKQAlzJ/Y=;
        b=exMYYg6P0bL3tg0lcEGQpjGmAi9+w2R1lsB3rhySTo6pbo4Sap0dk9QxFMMrtpCXAt
         /jSEuw8OlMXwUcTZTvx+JPc2wQ18cr8zrnPMhoobAXlinVX3PsU4Ua0uZhPI9jWNFi6w
         ex/Ys8RoQ9IV+nrkiuPSFSlqnCYCbLs3SleMBCqOoJMKHj20nFA4EaaehgPXF+S/VF2s
         O8yux3wj/oZfZCTe1xAE0oxYIHvR4XUeg/3R3zGZ1HGwPbdl8O0OKyASBwENaQjP++qn
         yPLwo4u4In5WA756CjvsJit2cuyxTv4eaDzPGsmPKUSoyIUtI/+AR4GCCKdyv3NyRHM8
         Hq5w==
X-Gm-Message-State: APf1xPCjQSxs5gaITtMvifFylGFJ4U1Do4I4o9lULsIq3szWlYUT4Py7
	C8xtnnT+Ymwa/FGAkdLRauBaKb4WwPRAoGkVVjoX5sxM8JI=
X-Google-Smtp-Source: AH8x227bzqiuPYqixs5J36B0OZR6W3MXCb5hNzKQrSRj4eGM+GZIWPmJL4R5fM+ZkdRwUTov51ub8GL3hcHzz+QPTxE=
X-Received: by 2002:a17:902:bc41:: with SMTP id t1-v6mr2301166plz.436.1519404173984;
 Fri, 23 Feb 2018 08:42:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 08:42:18 -0800 (PST)
In-Reply-To: <20180223161723.GF31076@redhat.com>
References: <20180223154613.2096-1-alex.bennee@linaro.org> <20180223154613.2096-5-alex.bennee@linaro.org>
 <20180223161723.GF31076@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 16:42:18 +0000
Message-ID: <CAFEAcA_NS2cod8=ymayZCca2KYaAJhV=mtujrQcfVn--YyWygA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v1 4/8] new contrib/generate_all.sh: batch
 risugen script
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: aDqm+IZcxnpk

On 23 February 2018 at 16:17, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> On Fri, Feb 23, 2018 at 03:46:09PM +0000, Alex Benn=C3=A9e wrote:
>> This is a simple script for generating all instructions in a given
>> RISU file. You can split up the batch size by passing a -n N command
>> line options. For example:
>>
>>   ./contrib/generate_all.sh -n 2 hp.risu testcases.armv8.2_hp
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  contrib/generate_all.sh | 96 ++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 96 insertions(+)
>>  create mode 100755 contrib/generate_all.sh
>>
>> diff --git a/contrib/generate_all.sh b/contrib/generate_all.sh
>> new file mode 100755
>> index 0000000..1e6b847
>> --- /dev/null
>> +++ b/contrib/generate_all.sh
>> @@ -0,0 +1,96 @@
>> +#!/bin/bash
>> +#
>> +# Generate all patterns in a given RISU file
>> +#
>> +# Copyright (c) 2017 Linaro Limited
>> +# All rights reserved. This program and the accompanying materials
>> +# are made available under the terms of the Eclipse Public License v1.0
>> +# which accompanies this distribution, and is available at
>> +# http://www.eclipse.org/legal/epl-v10.html
>
> Really ? Why this license not our standard GPLv2+, or BSD if it is wanted
> to be a public-domain-ish license ?

It's the stock risu license (for historical reasons). Alex forgot
to mark this patchset as being a risu patchset not a qemu one...

thanks
-- PMM
