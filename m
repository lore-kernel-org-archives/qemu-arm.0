Received: by 10.25.0.147 with SMTP id 141csp1405355lfa;
        Tue, 28 Feb 2017 06:05:29 -0800 (PST)
X-Received: by 10.28.97.194 with SMTP id v185mr2616643wmb.117.1488290729529;
        Tue, 28 Feb 2017 06:05:29 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x22b.google.com (mail-wm0-x22b.google.com. [2a00:1450:400c:c09::22b])
        by mx.google.com with ESMTPS id s4si2595519wra.167.2017.02.28.06.05.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Feb 2017 06:05:29 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22b as permitted sender) client-ip=2a00:1450:400c:c09::22b;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22b as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x22b.google.com with SMTP id v77so85913570wmv.1
        for <alex.bennee@linaro.org>; Tue, 28 Feb 2017 06:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bz1pS93/oFQyk0+9alnSOif9wP2e5gssCTudu4SKMos=;
        b=JReAoh89drVqT7KcHGi14Zwfua1IUzDXR/+Kg414z4nkZ8ZtTNRUQHKhc5Iy+N0Mms
         q+8NUArUcuvwGzXO3ujHAS6u8gw4uWlBdmeEDfL/CZf0UYJPzQNBpLKBIP0uL69ApGy/
         qnlg9x9BesxGln+dpw4P1vTip2Jpha66/QyZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bz1pS93/oFQyk0+9alnSOif9wP2e5gssCTudu4SKMos=;
        b=iRgJSozPgh10pujA6yBjVo8T1uuXXvfXlLKnUEEkN2fQlgSuA4fq5mCYbrvRLQyRRG
         lm+G7THPPBRr+tLf8vJkkWDroYcWfLglYTxTPAiB25VNSNUfPYcO9gMV0w41JLxhQIzk
         5EM3eTrbQockK3vzbNSKXJWg8PE1EQM092MC13gpKohG7vTvPpGyBC9/yNtAoSJu1Q5w
         oSEBRl+LIh6h6h+Pro4p/FEnASHLEGZFJlJqyEGFR9bqiNEob7cLTyONCmHWfNJqOLRs
         9U0cOIG5Y/p/4GR4i/99OsmXE+2wGJobSMyLsiKm6Kra9NZJcy+9J42NSxToX4LNXHQ1
         mqWQ==
X-Gm-Message-State: AMke39mPIP/rlHBfWiQOGfE0Ny+UaMll+OpZKktihbcymWbU9OMJaBWhuD3yDhuJK9I7wj2a3CHVup4IJmBCEYzC03A=
X-Received: by 10.28.189.135 with SMTP id n129mr2580639wmf.92.1488290729142;
 Tue, 28 Feb 2017 06:05:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Tue, 28 Feb 2017 06:05:08 -0800 (PST)
In-Reply-To: <87lgsq2zd5.fsf@linaro.org>
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
 <1487604965-23220-4-git-send-email-peter.maydell@linaro.org> <87lgsq2zd5.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Feb 2017 14:05:08 +0000
Message-ID: <CAFEAcA9ErvjYLgQK+UfM0xpHx9NrU_5qMwn=vZUh=5JMDxifVw@mail.gmail.com>
Subject: Re: [PATCH 03/11] armv7m: QOMify the armv7m container
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Alistair Francis <alistair23@gmail.com>, 
	Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: x6Gft5DZhW5d

On 28 February 2017 at 13:56, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>> +static void armv7m_realize(DeviceState *dev, Error **errp)
>> +{
>> +    /* here realize our children */
>
> This comment is a little zen-like. Does this mean the child devices are
> realised at this point when the armv7m realise code is run?

Yeah, it just means "we init child devices in init, and realize
them in realize", but it's a bit cryptic. I have a feeling it
was a placeholder comment I put in when I was writing this
as a "put this code here" note. I'll delete it.

thanks
-- PMM
