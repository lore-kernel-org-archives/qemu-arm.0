Received: by 10.28.71.27 with SMTP id u27csp822234wma;
        Fri, 23 Feb 2018 09:02:04 -0800 (PST)
X-Received: by 2002:a17:902:6bc6:: with SMTP id m6-v6mr2372485plt.100.1519405323926;
        Fri, 23 Feb 2018 09:02:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519405323; cv=none;
        d=google.com; s=arc-20160816;
        b=Oj7QTmScgWjLybuGENfBH+LXXV8+xYx9oDZu6/pes0qoQ5/K6EykaicWxhJgkhc/Rl
         xeMJZUhguZQNYXKX9nNAydX85a10tl6n1YOYJt58LWPbUxagy2JlLQueAiNgCVH6XOOQ
         9WmU5qOB9ZnPW10C64xCNzzIy+fDExadsaoCPty/pD5AKT1/PdTonCosY9ZtFGElbxOl
         vCy4BnrLpNsnrOCDGE9kD5RRS4sWFvrZyY4yWmESgKVUjq8Jv7KPC5K2IZfic6Tq3yIk
         11a5jU+FPRQVNvj9feF3NQJV5RecnEd5IuJd9mebVJ+1RlRKZB2y90Y0wBX+QQcfmKZD
         kh2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=hyonNJ5Wd31AY8Y5lEqhK8x9MnJH26GTrphAXUcCVsA=;
        b=EUzh5DZ5tyrSmWB54zGYlcWR/FZmiLuQr/BMEvL2IcYppCKg05hmgsXZ+6ysXwJWRM
         NLzJ9LFLK/g4OBxI9D303Du7pnRqPFskJ2ztotaXkM6eRpuleocg4l0Lkn3zjSYBy3Qn
         Cb/MyrvYrP1sCKqiriV7tDAgEpLuV+sd9mmpCen6X7GBgbYw9ttuSGXaY0bqMZcVMujR
         ygLT9OYjfLwUIB/DBJY1tUvGsk45etQEbGqeQhhbkY9++S1Jafb51UnBqPggRcvH3HMH
         Ci9qK/ow0nbRKG9mUVgTXOtfwOCeVP524C0B8naSn9k2CmKO7MAhlpTimpSxYS7zX0yg
         JX3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EQqnRnLh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y16sor712489pgv.74.2018.02.23.09.02.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Feb 2018 09:02:03 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EQqnRnLh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hyonNJ5Wd31AY8Y5lEqhK8x9MnJH26GTrphAXUcCVsA=;
        b=EQqnRnLhH+NaQmgA3WB1BQmOk16ngzYjzCJ9jzADI2NV8kjG1q+OCxD/WXOXSlBUOp
         EGbtvAJUuhvBLgwO/o06sMUb4kIFi2fc4+5y1cuse7xlvtwgHLvKySy97/EIzg7KlfCT
         lyG2OH+XdBi5IV1X3jPSH/+1DizQsAbtro8OU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hyonNJ5Wd31AY8Y5lEqhK8x9MnJH26GTrphAXUcCVsA=;
        b=W7RtgG3fLhie68uYF7WxNn9xPZEbQVZ1iNTnYRx7tKhqawJ73xZtiuOYlrHTCkrHnd
         2xZCjzBSMWS5ESFmulsQtbSzzYSmqid0snsvMJRMFarDuheVrOV3BJFgOm9B+f0EGnlm
         nYtdgchpcTzrHaHN20mCfsdNzF6FoJdclB8coA+bJLrEgUJNOzsA2TilFqQHbh1yXKsn
         +fLORmj5DvUvxUd/jcmWfmPAvQ/9MI1N+vW18LObW5ert53B/1uOmGAil9h/dTt55OfT
         W11Vrh+9x40lq4a8YOEQIOqIp/VZC6/yShv4wf7rf7alxBV6v59im+O2KmkT//HSRkGr
         qOmA==
X-Gm-Message-State: APf1xPBQhcAr0eEYBFNgOysZFagPlH7GjESToanRqKogit1mNaY8TAPb
	Xdim2LIsoHp9IbFcSi78mNeLxHfG1ZaLt5ml2hJVL+MlSk4=
X-Google-Smtp-Source: AH8x224lDPq7dGPB4c4iB893iuhQhrIsrhwwMwWu2tukhE3tLcbDOE86sjTxFEMl7QxUsbInThPoXf2ki4v5jN4FJig=
X-Received: by 10.99.175.8 with SMTP id w8mr1463280pge.390.1519405323592; Fri,
 23 Feb 2018 09:02:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 09:01:42 -0800 (PST)
In-Reply-To: <20180223164937.GG31076@redhat.com>
References: <20180223154613.2096-1-alex.bennee@linaro.org> <20180223154613.2096-5-alex.bennee@linaro.org>
 <20180223161723.GF31076@redhat.com> <878tbjac3d.fsf@linaro.org> <20180223164937.GG31076@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 17:01:42 +0000
Message-ID: <CAFEAcA-r7o=yMD+Mvo0-3Lpfe-Vvs_SdKOnJoOFnuNJn1oEdLA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v1 4/8] new contrib/generate_all.sh: batch
 risugen script
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: hjnDwuo2x7sB

On 23 February 2018 at 16:49, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> If it is going to live in QEMU source tree, then avoiding introducing a n=
ew
> license is desirable.

It isn't -- risu has its own repository.

thanks
-- PMM
