Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1093004lfg;
        Fri, 12 Mar 2021 02:32:22 -0800 (PST)
X-Received: by 2002:a17:906:ecfb:: with SMTP id qt27mr7636564ejb.245.1615545142248;
        Fri, 12 Mar 2021 02:32:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615545142; cv=none;
        d=google.com; s=arc-20160816;
        b=SfzsNK24qru7+VbLG3mnt+XMeJLgSUHVqp1x2xjTGilGU8/Uxg+6DZ7PptW6iyoL19
         zF1EPV+lOyJMGrmSXWecswEK6aY37Tz2eFbpssR7cMYU/P447rm4o+s5wvyzgcJna0D1
         50vj4oBVD34nazJ3686q1m7qQkti220xTNiw2iDL1z5fGUpEYeEui/o/bkAeBVijf+Gw
         mjQN/QriSuV2Mkw0w7QCr0J41ZewmkA9q3LAiyzPT/ElWn5U2o4OK3Ei1SO6v5iQsWAV
         WmfRFHUjlFqFPfHnueN2zuxiblmNgwwZN8w868anPDyi3IQFaLu1xg2a7zBpuVfa0Un0
         W3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xW/OLYeeQPD+vP4TJ82gujvOsb8Ulam83lpLmGem+1E=;
        b=vplw9c5H+vnNROA/wH1hRzTdoKs2EkHjj2CuO0D4hHqJEaavjTQ9S3aMD4FFcNvJsq
         yihdGXrMH/0gWRPVnouAC61wPI8lYNVilDHRk9K8rkeTKh7kqt6gjmDFuW3VssLj6stC
         FCIZLELQbXTyZqE1Zszz3klJLLD5pDdXL108EiNEHIWR7IeLyONk7w0UU69DCPdpeguO
         3SWdKtIPci1TBwHE1EzlLLoqQ2zaRogSuOeUU1kxZ/vA3XxGl4e1YPa6l72Y7iOPlTNF
         84mGO33DgAnWRWfmWp/2czRgHXoFienork9zuUJfXIvsuUb4ZPl4wxUIuj8C39I3owTk
         NjPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OkcU6Biq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id fx19sor3483746ejb.81.2021.03.12.02.32.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 12 Mar 2021 02:32:22 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OkcU6Biq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xW/OLYeeQPD+vP4TJ82gujvOsb8Ulam83lpLmGem+1E=;
        b=OkcU6Biq9KP+qKqQXNfTMcf47LVfBYtq0gBS1r8EsoM5Qzdf/mLogJ5KkrCZAith4Q
         K7JNhhUzqkdNNHsmU0LexMortmi4nqplmyxDOzCp6ktjLTKyEB4uRao2A6Ev8/gYl63b
         e9683dv3LEneppvCuTPO7wdgBMExPorECy3oGjcz3DbOnIN4WwteORf2ZhZ/c9jjg7pw
         UwnU/iMMMxSia0SeI2rQZqm1Twk2xaDHPfoLcjhzljem++/YtJzoDi04Ty4vkIu6UvPg
         uDMiVz/TJJP2MMKOLysaMaXGEGw4o4pMo+3VrXTkfR0WrG7Mft5uVou/Tf+9uFGDwQIB
         hjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xW/OLYeeQPD+vP4TJ82gujvOsb8Ulam83lpLmGem+1E=;
        b=d6jN7QRZIk6enYTN1uI7wlCzeaLWLEB+nMn9SG0VcQ7afi+oUc99Twv1jtP06+VhtH
         DIe1pKWLHpkN7Y5hyxliDisTiyjCFjgeyaCD0rnCRiDJXbbwezvqpVXVhT3mHABnUsWU
         JeWL6bGa8Lb6ncqNpxj85vbdmn8Ppi/xrNYBMD0zC8wVuoVuaZLgnrK7a4sGCkeXXMS1
         hJy1IP/c6WB6D043XElI9GDh8xW8D3KSgiiJOPkIY+smjSiVQX0PRvxonYZJ7bLLpHIz
         6GA9Q+tjdJjjnXeYiEi2pyLWT+ziI/zjZzo4Zb8mPIDscEE6VEMTCEVZzHUSVcbU3J30
         ws/A==
X-Gm-Message-State: AOAM531M1e+O02gNFWMsnR3yVP6SweyKUYSiCVNPpgszspwB8Ib5E+q/
	2UYGRu9mqaIP5EY2TdQLhKmjcJBpfL0LHJwmO8ZUfI46Wqcuj5q6
X-Google-Smtp-Source: ABdhPJyJQlZwaqobrG5ig7GgkT2qsSjIKZ7zgSX7RqurfPYwA1FTsWJAdZX21rSBVOL7YVbMCgKYzqoqPouRTPophiQ=
X-Received: by 2002:a17:906:16ca:: with SMTP id t10mr7885207ejd.85.1615545141929;
 Fri, 12 Mar 2021 02:32:21 -0800 (PST)
MIME-Version: 1.0
References: <20210312102029.17017-1-alex.bennee@linaro.org> <20210312102029.17017-4-alex.bennee@linaro.org>
In-Reply-To: <20210312102029.17017-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 10:32:03 +0000
Message-ID: <CAFEAcA8JP9venwOkUT9cSLTkTFFmGxVN46nekk0mr4c8PUhxNw@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] semihosting/arm-compat-semi: don't use SET_ARG to
 report SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Keith Packard <keithp@keithp.com>, 
	qemu-arm <qemu-arm@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	Bug 1915925 <1915925@bugs.launchpad.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: j4NqFHZYox9+

On Fri, 12 Mar 2021 at 10:29, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> As per the spec:
>
>   the PARAMETER REGISTER contains the address of a pointer to a
>   four-field data block.
>
> So we need to follow arg0 and place the results of SYS_HEAPINFO there.
>
> Fixes: 3c37cfe0b1 ("semihosting: Change internal common-semi interfaces t=
o use CPUState *")
> Bug: https://bugs.launchpad.net/bugs/1915925
> Cc: Bug 1915925 <1915925@bugs.launchpad.net>
> Cc: Keith Packard <keithp@keithp.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v3
>   - just revert the old behaviour

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
