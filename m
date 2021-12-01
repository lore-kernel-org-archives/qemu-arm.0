Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp6157652lfk;
        Wed, 1 Dec 2021 07:40:44 -0800 (PST)
X-Received: by 2002:a9d:3cc:: with SMTP id f70mr6481891otf.253.1638373243842;
        Wed, 01 Dec 2021 07:40:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638373243; cv=none;
        d=google.com; s=arc-20160816;
        b=WzizFdX9IqvZezyHP/cCLqdc4qdP2/b38NWG7SGBVxY9iYalCcG/HsN7jeBT2iPrgh
         wfnaTrPKq77p76XYmqYegGjfgXeEkl6P2b9xg1OaD63qjr6BIbmv9PntgN75zWfMh63p
         CD5ziwQnNOx+X98RqhTzD13eP7k5ARMIJfgV0l0LfThINIn/CXkdCQ7eAhG/NcFAjOeo
         x9A07lPJmcc68uuH0wNx30SE5Nt8m7qk+pz6qBjKctA7rDqDN8NaQGK+egtLvMZHfbeO
         g7PAXvkQluXtdpbkHMeZOzZ6O9wAo+z2fI/42YRwiIwSkWIGvqMwbOlOU5ZKjfVmcbOF
         6nEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MAQZgN/T0HLy6AkA0ensbjOaS/rycWoIYDepaSqjHUw=;
        b=yVfuGWn8D2iscKorWCA/nh2O71PeGcTpQcdVQECpNHXBiO1gQvMoKCKUUfe8+b0J94
         tBZgzJPqYqyk1hFIx4PdZ14Du0j8mFYF8AxEoG2MAxh09OCZkjMDX0hUGN2sQTE/aHh8
         MO0/vDVxvEAsf3VpGBljW8z7s3OhtF/UUcH03BkfbwSquZtFGB/7UwXrwyxl4tBCF7BD
         II1oh7mH8dJueJ66DwkGsh2hVysTxGZzIcJKKEWVdtasg6tHk8zkG0XXoUCdi4yerEPH
         KHX3W24e19f0x1eLh9LjspxjZGTTvZMSUDngH88AJGlMenM9uabUgdkCBjWTs6xrz0Hc
         T0PA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=W6VMJKvN;
       spf=pass (google.com: domain of idan.horowitz@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=idan.horowitz@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <idan.horowitz@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 63sor59058oih.129.2021.12.01.07.40.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 Dec 2021 07:40:43 -0800 (PST)
Received-SPF: pass (google.com: domain of idan.horowitz@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=W6VMJKvN;
       spf=pass (google.com: domain of idan.horowitz@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=idan.horowitz@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MAQZgN/T0HLy6AkA0ensbjOaS/rycWoIYDepaSqjHUw=;
        b=W6VMJKvNdwPytvCXfyeAooN3+IYsUEoOmRCLsw78RGNrbAcw3rXL/OI/cvNMnT9Xt0
         7xwQwVEdWlcVf4DKSpYit2bVKF7u2WHzQe0gtdShcZ37Ts5AMZruCQmRrxLnnZRG16uv
         ugX3c90ZeNmTn6zZDYL422q1p5u0anNNGkZlZMvRVwJL3ZqjI2IznBDCKZO4JpISXUcR
         1DaIY+Bp4O5N1WkMEFontcH3vN9/3B3onYs2f8F6WJ4F4vgnmK3JtTQ2Wd9SKQ8rwzlK
         00d0kS/yIA+7Fsh9mo0nfhRcUnUYQ+0y1kGUVdnXAt9sVh0hbAkmAGFpXuFlDVrxQRpw
         QXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MAQZgN/T0HLy6AkA0ensbjOaS/rycWoIYDepaSqjHUw=;
        b=Qy/Tyn0fvcsKRAiqKEWz9BIr8Mv2YE8wPFTDXZXL+QfNnyy/IKRsqcM354/hFvM0bB
         hA5mjJiB8xchOio884FIdpxQmcjTlYocQJgO4LN+gLUscxZeyWDgKqks2BU1CACsNYr2
         5NaAX4Rs0oe+WYQwXJgkwOJge4zrtmF/kZIvLTDwFehFat9LaxMH0sDy+HsamHX6QTW3
         yngc7DPNVCNW+Ne3q6QjW2CrK/yoCW5yjC+dPflProcLBZ+r9L63ITAj2Hz7EGQ1J34R
         1EOncqqP8M/kZ8NUVUNwVFVA3CvauDMwiva8R+KM37Qe2IMQdEpoEwCwtvvlqnfEAbTA
         3+Dg==
X-Gm-Message-State: AOAM533EKz5psYAUTqXtgP6l2zdERvYIVDAVRcgM5sML5c/JNVX7Rsfh
	i95SpH3bcIKPLak+yFxpXCyrDk19LPWm39U6MotvHDO99sI=
X-Google-Smtp-Source: ABdhPJw6+h63H3xyjztBPxbqD63lrzSPH32hUOVsTwVUHPwGp4CLs1ksI8FxxcFdBU6JsU26PST9Qm9EoSsOYUN/9/4=
X-Received: by 2002:aca:a989:: with SMTP id s131mr6929475oie.71.1638373243127;
 Wed, 01 Dec 2021 07:40:43 -0800 (PST)
MIME-Version: 1.0
References: <CA+4MfEJhOsmUWmifkzJ7jSw8B0q7X2mJe=jist4AiTwhYd8Wug@mail.gmail.com>
 <87fsrtv13t.fsf@linaro.org> <CA+4MfE+gT-CGEVZot=26DqwCRY+F-xZhTRSOsKKBVb29Un46Dw@mail.gmail.com>
In-Reply-To: <CA+4MfE+gT-CGEVZot=26DqwCRY+F-xZhTRSOsKKBVb29Un46Dw@mail.gmail.com>
From: Idan Horowitz <idan.horowitz@gmail.com>
Date: Wed, 1 Dec 2021 17:40:31 +0200
Message-ID: <CA+4MfEKrrsACvQKBimpkQt6r0H2cbJ9EaYCSFgZcx1Bqr20=Sg@mail.gmail.com>
Subject: Re: DSB does not seem to wait for TLBI completion
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: pHm1oSGG2WUT

Idan Horowitz <idan.horowitz@gmail.com> wrote:
>
> I am actually running in icount mode (-icount shift=10 specifically),
> and adding the translation block exit or just using ISB directly does
> not seem to affect it unfortunately.
>
> Idan Horowitz

After a lot of testing I had the thought of trying this without
icount, and it seems to work fine without it, so the issue is somehow
related to icount being enabled.

Idan Horowitz
