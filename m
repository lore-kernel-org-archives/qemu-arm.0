Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp220074wrm;
        Fri, 4 Oct 2019 02:50:20 -0700 (PDT)
X-Received: by 2002:aca:d7c5:: with SMTP id o188mr6163880oig.87.1570182620149;
        Fri, 04 Oct 2019 02:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570182620; cv=none;
        d=google.com; s=arc-20160816;
        b=B7kPV+UFRARPqOyRx16xSZbLMNOhc/MaxVKOmig8xfH193ojEFhnDcY0ZBA3ezdfWQ
         wwb9g6cRNzbHLgQMTF2C9uMqWQjHZbXSHNit72j7JL+bI7O7f03+HNsJIP2ki14lZ8yk
         ozsAWVdv/MakBVNEmxP35B7htHzd68gp1mLiBPxNwR2En96ihukEZF6/c8i+0hp2Rn3F
         509zbaglBz5XZ6QcCa/xQt5qamCNy+7d8EM64DrTjtoUys2TaX9jIwfxr6sYv8uCEvsl
         VHyKcAYZ1GhbwWA6hq6c8F8a6awzSjEtnmC7PkrxZYJ00+uRC1obVg2VwAHc+j2M25Y3
         vY9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Gh5bS3+Vusgx4lGf85ASQrcc3Xoaer4bot7JE0j5Hg=;
        b=yV+6vhVA/clgXFb3I4O63zGPuI2j7dqjD+rc7Sz1lBNTrf8vyQCa5MavbTJ1tqqewh
         ZTTfUsziYPolMygZLA+T0GVE4BwUJy5RYjFC9Nx5GzMzJh6EpUsLvrgyt+EmgY0FmtBO
         5B8pbJWk3jtDcpncOF81JJZEhtnFQt9+6qCpURrJT7YRUK4YKcEGidi/Ti0srccO2Yv2
         +ZBIcvhUdGxzyp8gPwzp86li4qBvwcuT5YAzp1ITCx/K1HZEZ0GlUk0s2yjIr2s1eCQn
         cqlOJmkVKGW8P9WuNnau38O3uNVQdjWY5F68NESYWEU0IA1NN2iI0rUW29f6fG3DkBxd
         zTww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LR33K7hs;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q7sor3030786oij.23.2019.10.04.02.50.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Oct 2019 02:50:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LR33K7hs;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0Gh5bS3+Vusgx4lGf85ASQrcc3Xoaer4bot7JE0j5Hg=;
        b=LR33K7hsuTq2HvwSVdvMzqIX9CFmP9yJTGFaBvwPhw11SGXwYRkeSjYaes5FKV84yj
         YNG0ljkZob9DH+ISI6itg2u7A9BJ/Qtqcw/LvV0PByam5EjUy6AP3EpegrB2IMzgcPAf
         gBU/Kp7bhB9to9IhHxDeJZZKWL/tjiBZRhawknvJwfoC+0SKNL9F1J6roB9JMiG9Oy8E
         cXTcnADXofkFBQmNy9HWqwj7sGdNNHOuMLVeWOmD1SwqWRq1Lku67Br8yrntgBGs2l83
         uXk6D2AP/ArBSh+1pMVRxhgNTDs/PlqxwLWt5dUsR9KljM8rzdIZH9DRrnLWSr+jjnuV
         WOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0Gh5bS3+Vusgx4lGf85ASQrcc3Xoaer4bot7JE0j5Hg=;
        b=LavGneimd6rCfzQt4wInEtuZ30+KSIL5Dz2+twP6ny1b9+PmFRaAn+Ypoq8QIFZDSZ
         UKaXpXXV654ByhyhCFFUJtrjcdiyUHgKAzP41DlOzonvAFRcC/qNm1f0lfdG9+VEloGU
         CD7JawytIcoQJ6UiqGcY2FF01J2I6EEMPp/QNXeH22Vykraz+tuLcUnKXl4ZNEckLAd1
         J0ahW+zgFkvduY8SeLvmiaxYlgLi+bashRLQ2d1P0+/OELoYtNuTyTHo8IQ6HN23trXB
         63P4Nt151/xUACrr23DiCziGfIl1o3XAOTJuEX6pSyVCnLTD+MEKj+3kzN1YP6PJcNqY
         00rQ==
X-Gm-Message-State: APjAAAW4nA0wsPsw4oUra4XzZVAJ94Q9hsEoXV7tfmy/ytQguChI6sG6
	LbU3y3Ng16tysj+Izpu7ZPE1ghFsNSl5vVNGVh1CsExJ
X-Google-Smtp-Source: APXvYqymo1MsrBEbyuEL5o0d6t29t00xq8Z+L2f3hPj3PbzVjRFs1cio2ZCB8ng2rcDrM0C4pT1pKM4b6kpLVdXUuYk=
X-Received: by 2002:aca:53d4:: with SMTP id h203mr6138543oib.146.1570182619719;
 Fri, 04 Oct 2019 02:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-2-peter.maydell@linaro.org> <a10f43ac-82e8-7600-94d3-513feafaf325@redhat.com>
In-Reply-To: <a10f43ac-82e8-7600-94d3-513feafaf325@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Oct 2019 10:50:08 +0100
Message-ID: <CAFEAcA9Qt++kGXTHiArfigjoZNmL=uLvDbZ9pCbcRgHP269sRg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 01/15] target/arm/arm-semi: Capture errno
 in softmmu version of set_swi_errno()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: /EmEnl9HI8vh

On Fri, 4 Oct 2019 at 00:24, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> On 9/16/19 4:15 PM, Peter Maydell wrote:
> > The set_swi_errno() function is called to capture the errno
> > from a host system call, so that we can return -1 from the
> > semihosting function and later allow the guest to get a more
> > specific error code with the SYS_ERRNO function. It comes in
> > two versions, one for user-only and one for softmmu. We forgot
> > to capture the errno in the softmmu version; fix the error.
> >
> > (Semihosting calls directed to gdb are unaffected because
> > they go through a different code path that captures the
> > error return from the gdbstub call in arm_semi_cb() or
> > arm_semi_flen_cb().)
> >
>
> Fixes: 8e71621f784

That was the commit that added support for semihosting
to softmmu in 2007, so I don't think suggesting that this
is a 'fix' to that makes much sense. This has just been
broken forever. (It's also pretty unimportant as a bug because
the semihosting 'errno' is so ill-defined as to be unused,
I think.)

thanks
-- PMM
