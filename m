Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1560094wme;
        Tue, 22 May 2018 07:19:59 -0700 (PDT)
X-Received: by 2002:a54:4d02:: with SMTP id v2-v6mr13425918oix.190.1526998799252;
        Tue, 22 May 2018 07:19:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526998799; cv=none;
        d=google.com; s=arc-20160816;
        b=kkJJHUa7rqBlsDGmHy98eFZCou8K983AqW+2/aCOFMw82A20c4RF80eKdtbh0KiPNs
         3OTTzOvY/7DYdVX9Djg6skBJdXy4Hk7YQK8r5FStgaGOII4gMouRIiIPiWbsiRDDBGfV
         vfTNDBXhHTAWUAE6FAIpEn53j2Upo5XgITZrn+j9UoxR2qAUPEerZlFgsqamDSjrg8hO
         QsSuXL9gZHwSK/L4Ki6PAbP92Yxl0KFa2fyeU2QVQIjb8KBLUn3d+WLjNAsGcGU3LvUp
         h19ZLUXjq1hJhF/0bFCuL6GY42i2MBT0KG9H4QieHQEL4WXa8f3D9OGTepSfbfgNjqeP
         Lpaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=qntkmGhhzzkHW7eGMXsK5WhLrwS29V5DwLeEWo5mPJI=;
        b=EE+CWgDXsgc6Ag8JLrXaiZdLUxxEKhNTAkcR+mm74j2clsFMYqpDmMw90nsKBr/1Qt
         XG60JSYUKMikJB6vMGQOebrYSOf8LR779Y+f48wZ49DlHKCcq/u5Kc43pVfCzHeG0Aex
         4KpEqw9zcKc/FqHmaJSPpX66OHk0rINr0+is0xQPxe0wooCD0Iw1Cdj0GgIJtHAEul3t
         iy4SajXiySddozd65xNIM+0taBfKzaQEgeuvOW9tjJvyoLY5bfjuP+8a6/wA4co8WgcW
         B/l06YLZihvmfR7C0X3lxjspWYpf+oOmaYGJeTuTqSpzo3IDUTzGeXWkX8FgbsHyHJj0
         nIaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c5bf5xbi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g23-v6sor8074915otc.166.2018.05.22.07.19.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 May 2018 07:19:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c5bf5xbi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=qntkmGhhzzkHW7eGMXsK5WhLrwS29V5DwLeEWo5mPJI=;
        b=c5bf5xbi9QmgLRLuNwBWOr0Zhrn9cjOwY9ZA6X+P1Leaphs7zyRQXWRUzpLmQmze5f
         RbY+KhLm2NZinFil5dIbs9KqXwD0mxnWo13jet/c9wnfPQzQ1rtDbQt3+Vm50n5NbnY7
         DTPPGJGNOrmvrj1suJJxNGe2WSPLkiTnXmKm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=qntkmGhhzzkHW7eGMXsK5WhLrwS29V5DwLeEWo5mPJI=;
        b=cPOj13II9CfSaJNmrUgTHMc7bUoh81iWr873xayGbIXHWnPTV32q2mTDnW7Es3XZfr
         /cNGk3bh5LOYf6OSA/XqpkW34uUF67wb8l2PZec3TOXt6JYxZa0A7fQlN7mGDxNe5SD2
         vRQoZzeOC0EGoMq8Uh1Q/V820yoNzrIGHqp/YaN3sCj/NnjRKPicN30qFC5/6Kq3RlwY
         21ke7dvsYVgb3aFUFGVO0GyNPlg2zTdU2KEL5BPYpR611CV8EWtieUUYYjrcOoAFnp2z
         yKW4iEeaSGBg3rbUJBDChrZCeNzISh0T3Vm7AZqXun25NpsGUlW3fWgu2CKMBOOoiMwj
         FzTA==
X-Gm-Message-State: ALKqPwfCUu/XeGCGpvOYuNhw4fZmofbpZFdnR38ThI1GB8QZZGn6+TXr
	CHlCslxOjsOwUKrCIIxfRxbZ2cBqtbLyPaBewIyKp/UP
X-Google-Smtp-Source: AB8JxZor+twoe9LEBNugBvQky6woW05xXjhYeSIFCi6dCQREUJaH1jbZ/i+PfAqCpD1WSv4Y4WtufzcIZ2nssx8ovQk=
X-Received: by 2002:a9d:2842:: with SMTP id h2-v6mr17460088otd.210.1526998798913;
 Tue, 22 May 2018 07:19:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 22 May 2018 07:19:38
 -0700 (PDT)
In-Reply-To: <595dcb89-3856-3755-e8db-7791c1374284@redhat.com>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-15-peter.maydell@linaro.org> <47281818-f0cf-0ed1-c479-fbcaca5c5167@redhat.com>
 <CAFEAcA-R9t4K488viYM9ipmfArA=ijMMJn+FD1wekPdAbNOHvQ@mail.gmail.com> <595dcb89-3856-3755-e8db-7791c1374284@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 May 2018 15:19:38 +0100
Message-ID: <CAFEAcA8Eq+EvtL1JuqtHePWMLPdkHG9zzAh7Wkrw7sNYw8jzUQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 14/27] iommu: Add IOMMU index concept to
 IOMMU API
To: Auger Eric <eric.auger@redhat.com>
Cc: "patches@linaro.org" <patches@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-TUID: SeHhxuI/KwIn

On 22 May 2018 at 15:11, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 05/22/2018 03:22 PM, Peter Maydell wrote:
>> How many substream IDs do we expect to see in practice?
>
> Spec says max 20 bits, matching the max size of the PASID

Right, but do we actually expect to see transactions from
devices that use the whole 2^20 possible values, or will
they in practice mostly use 1..5, or somethnig else?

thanks
-- PMM
