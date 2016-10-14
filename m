Received: by 10.80.166.35 with SMTP id d32csp400779edc;
        Fri, 14 Oct 2016 10:43:35 -0700 (PDT)
X-Received: by 10.31.2.201 with SMTP id 192mr9874598vkc.171.1476467015142;
        Fri, 14 Oct 2016 10:43:35 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x236.google.com (mail-vk0-x236.google.com. [2607:f8b0:400c:c05::236])
        by mx.google.com with ESMTPS id o137si10125030vke.203.2016.10.14.10.43.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Oct 2016 10:43:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::236 as permitted sender) client-ip=2607:f8b0:400c:c05::236;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::236 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-vk0-x236.google.com with SMTP id 83so99197903vkd.0
        for <alex.bennee@linaro.org>; Fri, 14 Oct 2016 10:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=twkg2vaVDvKsl2SSo7c+JgYABFnV4gC/IiGKOzUOL08=;
        b=RDev8APXkliBi9QXNRnT1qTppfYzUaAlEdG4Syc/DueYQMh5y3a50DcCt1K97r3TAB
         ttm4ZsMT9NZZMESOektb4pkG7TKxX/Yy22I7jKOXpJO3dtGuKqpat63o/H3iAz61OL34
         cRB01+VN3VUXUAyUUPCLoTys/qPycOos/RNiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=twkg2vaVDvKsl2SSo7c+JgYABFnV4gC/IiGKOzUOL08=;
        b=OTqhhDl5aDCSB66Uk+bqR5OCQPfds5ik/SKTxo9RGEbGHiyKvIl2bZbIYwgd57fmoK
         Ci2GxGJz0ilbN0eEdGx7dxj5aFvDmZSCk4rK801A19EoA0XzikHBtXQC2M1UmQm+TwPy
         GVVIebzgb+sq/Y0JfeFX8vxqFHy4b0fmI4448A0E7q77GPax6u3Ed1/TnRjYvC0fIISO
         2XOuDDcHep8C7hgmJ3XY9K99gNEG8r6EcEsFA+/MHLalsVze7UvTBYOtAG+/qi+PlsJh
         hapuBk/kWiix0WOZm2gqe7N8Em649lHKCb6M1gYZK/R+AI+UcaGpdWoJ5YNgpynPLI20
         PtOw==
X-Gm-Message-State: AA6/9Rnbd0WsmMEX/270Q8oszsaIHEQsnYcdUxs36XNx9nQ+4ZVPds5C7lTepUX0VKO4xF4LbipFvxur3L4+tEmZJNI=
X-Received: by 10.31.210.130 with SMTP id j124mr10196677vkg.17.1476467014618;
 Fri, 14 Oct 2016 10:43:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Fri, 14 Oct 2016 10:43:14 -0700 (PDT)
In-Reply-To: <20161014151336.31418-1-alex.bennee@linaro.org>
References: <20161014151336.31418-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Oct 2016 18:43:14 +0100
Message-ID: <CAFEAcA8UQjMtfhV7i1kRQxF5vj-=pinJXX8CbHMrwTCdZrWJ=g@mail.gmail.com>
Subject: Re: [PATCH] target-arm/translate.c: fix movs pc,lr exception return
 on ARMv7
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: YIXwOwdFZ471

On 14 October 2016 at 16:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> This was broken by the fix for 9b6a3ea7a699594162ed3d11e4e04b98568dc5c0.
> Specifically a movs pc,lr in the kernels ret_fast_syscall returning to
> some thumb mode user space code but store_reg unconditionally aligned
> the return PC instead of treating the return as an "interworking"
> branch.
>
> I suspect we need to audit all calls to store_reg that might involve the
> PC to ensure "interworking" branches are correctly handled. Also I'm not
> quite sure how the code worked before 9b6a3e as the store_reg path
> wouldn't have triggered the store_cpu_field(var, thumb) to set the
> processor mode back to thumb.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

I think this is the wrong fix to the problem -- see the
patch I sent a few days back.

thanks
-- PMM
