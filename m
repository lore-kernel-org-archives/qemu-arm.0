Received: by 10.28.4.212 with SMTP id 203csp1255598wme;
        Thu, 10 May 2018 09:59:30 -0700 (PDT)
X-Received: by 2002:a9d:7259:: with SMTP id a25-v6mr1537458otk.267.1525971569929;
        Thu, 10 May 2018 09:59:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525971569; cv=none;
        d=google.com; s=arc-20160816;
        b=OdDI23wgL4EaM55av2yL/XS1l39xwXEYXyMhNCHOsy8SRKAREJZ0EMls63nEf50ynC
         G1SsVdn5lgExv496TrGhs0XYH/UxjQrbZ1pXTaKFfGWcKrOIz0zHxIlaVPAzol2PEtmZ
         9K96uKb5KHOcpwtmzNfXhijhaSsK7qOuJSs9du201UY2QQp6dYY1/QlzoQwx/KC1vpb4
         RvWZaVfWAQawS3T8GqmVw2kwR54emq4xW8dMdL1P7Fce4SB2yxeGXiGwvRTCumcYSjSr
         bf5L7VH4uUX7U2qfqxHxIF4arkZlZ8DdHqnw5oOkzqXBnPzokR+qjhWFEP7PlX+Bhy0C
         eRLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=dzX2fy+ZE+t/QI2irTzgciZlEtNW11Ud9SzneVoDchg=;
        b=W2ZSofK6XYLMSQFMt75zeU8B3VZVjxuYJMO8+g1B2rICCA2RYMkHXdfL3tIw9+YKMf
         NxKiTfIhHyMpwYIzAbQ/UfpRXl/XMOhqz/fyPYiCULnF+VcNcZ5T+5nLxmML9SQnXhIj
         AjMiPUMAOHk1uTTbe/1y5AJObUhx+K5sCjtj36K8IYHvnItxIOJaRMnbeaA0x3rbuZmq
         50iwTmfWh/Euy04eVH/QJjQVbnVFD6peQaQkYDu9mA5G6v2ADMnthyrKwSrL7TjBpPmt
         7tS39vFxRu3tPmQMl7BeByfLmIwIWVhwq9tHT2cxvoJwnIJq2/OABvKJTIjXz2VRuyuT
         qP2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BgNJRugD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y56-v6sor482484oty.98.2018.05.10.09.59.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 May 2018 09:59:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BgNJRugD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dzX2fy+ZE+t/QI2irTzgciZlEtNW11Ud9SzneVoDchg=;
        b=BgNJRugDpQvulFjnBwxloRwujPFiNSOMbLUgwcOGLxzpxobzRB4oC9Yj84de1gXBiL
         UwBuhicNbkK74w6FY0xUSH5QWwct4bfCMMojAz0QCC7NY4Aa3v93htaxp2nDtNByjpuf
         t4A71LCKavSt5Rf3lIcNw1NI3WSsNL34pT59I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dzX2fy+ZE+t/QI2irTzgciZlEtNW11Ud9SzneVoDchg=;
        b=i97urwNl32vkZF4fjZPbQ57jnhK4L5i9yCKZIb08BAOGLP/VFeTyGLRggSyDoSxl9u
         dVlw54WPj4O0CSQdmrX5rhb8YjvkBZRgLblhd+jt6sZt5wYnPaJ96EAnX382DE3dW1TV
         IDYOUbna0fKiWQX7o/0MTR+KX+14OuCFv9gASpOAIfxpLw/TfI2fiscCWSSgbNpxSVFY
         UgzNVjU+K/ecMGVh2bjyEqDfyNjY+hgX204wB9zoyErGf0/M5YP33bAeHghAUHbGGYVu
         danXmx1ExoEJ0oubtEjQfPdueMo+MQm07VclWdDybOv9r1b67iRPLtP3DmHKDz3s4GF4
         KNeQ==
X-Gm-Message-State: ALKqPwdr3YJxxEKDCcM/DRvPEt//xT9yo1dLcQxcAtzs18LmgrhNJf2b
	f07gCjKQzmIwhThccbWKYTuk0ignHuCQgjQ6+hyvhpP1
X-Google-Smtp-Source: AB8JxZqUhxt0J45bSSCKh0PIpmz07QoBtbEI8vAOlDsstSV6C9NEHBBfXJKSWXsEnWVK6RZEq0lJCcc74sqQsrJ6UGw=
X-Received: by 2002:a9d:5014:: with SMTP id a20-v6mr1387616oth.205.1525971569585;
 Thu, 10 May 2018 09:59:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 10 May 2018 09:59:09
 -0700 (PDT)
In-Reply-To: <20180502221552.3873-12-richard.henderson@linaro.org>
References: <20180502221552.3873-1-richard.henderson@linaro.org> <20180502221552.3873-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 May 2018 17:59:09 +0100
Message-ID: <CAFEAcA9fa4-DMgxMFGrOYgB6eMYGvLupyKS_LNp+vez7xGRKNw@mail.gmail.com>
Subject: Re: [PATCH v2 11/14] target/arm: Implement FCMP for fp16
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ldJMLLLyIOCW

On 2 May 2018 at 23:15, Richard Henderson <richard.henderson@linaro.org> wr=
ote:
> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> These where missed out from the rest of the half-precision work.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> [rth: Diagnose lack of FP16 before fp_access_check]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-a64.h    |  2 ++
>  target/arm/helper-a64.c    | 10 ++++++
>  target/arm/translate-a64.c | 88 +++++++++++++++++++++++++++++++++++++---=
------
>  3 files changed, 83 insertions(+), 17 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
