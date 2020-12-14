Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2429277lfq;
        Mon, 14 Dec 2020 02:30:22 -0800 (PST)
X-Received: by 2002:a25:e910:: with SMTP id n16mr35447571ybd.269.1607941822248;
        Mon, 14 Dec 2020 02:30:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607941822; cv=none;
        d=google.com; s=arc-20160816;
        b=TfMC3kobeuGEghTU2lHGvphtjC9HenO7pqDqcMow6QZjb9VhQosiZ0zbwPQHPScMW/
         w3WTCmRhG4pxsQ0dBjdCDRqejdm0ZdT0a/7GTiep8bEKAsUOprLo1WeRzZ/EE654AkGT
         smo4TFjJcpYvmDyt0IRxVslhg2S6PLUUUbNwXodYFALjwByaB0o1BK3mu8cQ8rnQAEXU
         Ne4hZCzUrQ+YKcxQ3o+yz7dcFapPjJyD70KbSA/9hSWvyxAAsCB5FPxXAb3jt1tqg+m7
         RMacbURrMZLcgr0kYme2Og321rWOCuMkbSoiqvg5sL04giYpu0QaFYNEvvca5yUNiSOB
         2ePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W1nOVW6vpV4RMIvnGQchOOBYWcL+YJha58w53tValYQ=;
        b=HsO4CE4gtKIm0Oq2TJF9nwctiBMxSGJ6mmV0hcoK2ql/DPa+7X+oUHsGY8NfgH2stq
         F5DTI41xUhgL7AbD30HrLe6MCyoih+GqQ087ZY3G0C0OlRIwktYObPVFxF2S/KWQ9J7c
         rYJvGf0oT2N9DT/jjlH8tDCeA3wFVv3ohGyPWoLs9xwyC5pp1+r/Iy/iC0CEkQQhYAIs
         Jxk1S6+99MfFnTB44oVuzPSM6tVF6vecXxqr72Sz23zcm2h8KTkQw5DTx8yVWJNz4hn/
         yJjsaTkxF7Co6FGseK8xBaSVc1l+9Ay/qjvLJEUDX5NNH+Y6xX8WjiyByPylaA5pHKBe
         MqFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=N9N+ewHK;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i4sor4626321ybj.212.2020.12.14.02.30.22
        (Google Transport Security);
        Mon, 14 Dec 2020 02:30:22 -0800 (PST)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=N9N+ewHK;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=W1nOVW6vpV4RMIvnGQchOOBYWcL+YJha58w53tValYQ=;
        b=N9N+ewHKNzgW2VXmZT0ljvzFSyWW/DLMbi6xNgBEY2xKxn0wh2jc6YD8PE+YuSdZqB
         /1smFUN0WoRr0yKTwlnp1VXWhkJrqUtd5ta4TXD78EiFNjrWROVl8GYwSaFQdbuDLR/P
         bWXmv4mIEVnMgf8KFVgZwRDRdjnZBPUD1GxdKfPWWvBDxcUFd/8Yg8nwf3U391JIwwTh
         kYzrDnVPC9/Zmmkyjlymhteipv/XkYYC/pgOLewNDBWOU3M148YRydcDRmsOHaDnsW4m
         GM9rTjkwcGbUtOud2FiW5iNEHaoo7EeerB83VwOLf1lfgx/sKo4v5uXGZCmJLbNhINkd
         vzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W1nOVW6vpV4RMIvnGQchOOBYWcL+YJha58w53tValYQ=;
        b=JmWGnkotQyCDi6CQ+d9LQLyirFChLMeoq3wBHE3lz81wvUiG5RtyoxQuvi3q+txZhc
         iSmXmEARW1AbhawouQS3r1XwGMy4EpguOTt9y+Mvl9MXlDzUjjpeg9+iv6J8g4LQpSVn
         e5A2oYxr7MC/yTzCYS8pHhu866iPwm3n1S1y2TDJ84ziDBBjswYVXhxDDAXXwOdA9Tmd
         06rhNBIVtYKv1rv6sLO9PsJFr14RZ22k9n+jNEZe1sLBMjgGn2pjk6Uq3Z8bJwiuKRte
         WqT8kq8xtOQ++XyX905ZGrR7SM45lrvYtYJ2888h+4BVLEDRHADH1yc0VPq4pLQ+4bHb
         TVUQ==
X-Gm-Message-State: AOAM533aujIQv541SVeR4QCHg0Iu56sKhf3qEJg235sewdpYAKpd2EUP
	2Hmd1P+K+cWM/JthyO5D5UsPBfsCVZppkoQKFaEUxjJr
X-Google-Smtp-Source: ABdhPJyod4/KKGKBrSLTlINW1Nrn+IAQNfO9QDuwrDb7N3hKHY+kx+UkfNDqmMOsG623YQ7vnvboshmWOm68gy2lsfE=
X-Received: by 2002:a25:aaee:: with SMTP id t101mr33601669ybi.517.1607941821774;
 Mon, 14 Dec 2020 02:30:21 -0800 (PST)
MIME-Version: 1.0
References: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com> <87eejsvg5k.fsf@linaro.org>
In-Reply-To: <87eejsvg5k.fsf@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 14 Dec 2020 18:30:10 +0800
Message-ID: <CAEUhbmXk379CmfdGB8Ua9-=Gv1cPfih3bu8Z=r_8w+J461tZRQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm: sabrelite: Improve emulation fidelity to
 allow booting upstream U-Boot
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>, Peter Maydell <peter.maydell@linaro.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: U1UN1Vhc0cV2

On Mon, Dec 14, 2020 at 6:24 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Bin Meng <bmeng.cn@gmail.com> writes:
>
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > At present the upstream U-Boot (as of today, v2021.01-rc3) does not
> > boot on QEMU sabrelite machine.
>
> Are there any public build artefacts for u-boot on saberlite that could
> be used for an acceptance test?

I am not aware of one. Upstream U-Boot has build pipelines but it does
not publish artifacts.

>
> > This fixes several issues to improve emulation fidelity of the i.MX6
> > sabrelite board. With this series, upstream U-Boot can boot to U-Boot
> > command shell.
> >

Regards,
Bin
