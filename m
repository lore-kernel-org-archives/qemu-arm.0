Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5955448lfp;
        Tue, 18 Feb 2020 02:05:13 -0800 (PST)
X-Received: by 2002:aca:b70a:: with SMTP id h10mr787920oif.20.1582020313338;
        Tue, 18 Feb 2020 02:05:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582020313; cv=none;
        d=google.com; s=arc-20160816;
        b=pxqQPSoFE0UGsiSOxZ0qASkmiiBcVXiUOouNI+94W/tmPTxeH91rsNdEagFWZT9Pfb
         cm3XCULUoMaN8jEG71lR0BKQfKoCJJbxGbyz7/Qu/vwvrQtQBb/VaiuCUSEfo3f4mHnv
         yilPlynCAyjbr8pbsT89vSVw8hz0XIYZOymbQ1fVlbU6fws4DbhiBd9tcdsmDgIwiNLP
         uvrpHS56U0m9la1Rsand/z2lMNH3nZ4hj04JJG6B+BLu0JGqlnmaY9ENq480y9LzYOB1
         24CtgCayb5MWRezhBd2vqqsuaZGbkamujSscgf+2yBf7SpsjDJTJASZPDhlskQUjrMB1
         c6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vMxX+nDorhKqu10/D7ZYUU5lAla6+z9TBRxzHMwoESE=;
        b=jhRPgKiW9vDCSHukIQNAjfOiA4IT0n2VnWeJuzc+Eyo03tlabxh16Tt2OEuHb3E/r+
         inYaSe8j2kAf7Minu8t0tlqyHy2ysIS11lyHhQVEZNxQWegSVG9sL17B752TMV9Ez4mI
         XDCCcI3pN2v34zlM9TDI1UZszSuDtaieijZ8hPxU8Hpaes4rdLyYs5jbAnwjuSBguBiE
         aIrzQH0pTNvG8fpy7L4zmcw2w2eTONaR4g0MDjmI6/NQh2wBJbggNqCtDI55W59VKOwk
         /Y1pClntFpxceZSM1Zv1NVLNwQaBl8acFzVdxBjiB/tZvq+JZR9gJq2xXfBjMM5GHQam
         msoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m9siwg1x;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b17sor1691704otp.102.2020.02.18.02.05.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Feb 2020 02:05:13 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m9siwg1x;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vMxX+nDorhKqu10/D7ZYUU5lAla6+z9TBRxzHMwoESE=;
        b=m9siwg1xRQPyQvh9D43Lgx3k9iJHpXfaViyYzH27RFStlHOKlFbJmG4N4s5TmdgI6A
         cb8kkvnStmoFoPXyYndIPQF/Ib3BmEkXIKJ7uxOA/iBk1NsMePUkF3al9+l6FoKOCCvq
         SLWE8jOOk8UUYPUk5/SXNIBU9jOps4yEfuBqFD5OrCAl2wrY1CH+D5C/qjgixHF1zXyp
         3Fph159DaSDVDWjO0f6ZsMeUBM+OY50L2jNIcKY1tIw0cq8oxuVtnJ4//iqP/L6HSMgC
         6DOjg7Os0o2f08UG6JceEEZdETWj+tcMhzg1Xr5rVQH6ZsUnlvuaGYdcVwkHwhB+Zp1A
         a1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vMxX+nDorhKqu10/D7ZYUU5lAla6+z9TBRxzHMwoESE=;
        b=OSXCCxF5Yeg9WZFZeCsUQDr6J8uzvQ1zHJaOokahNevvPN1LGRvDYuv8caO8YSC9f8
         0b/Y0CcWQfn1kmitASyhIWB6Sfdy3o8zk4DAk8qObZ06wlUFkpJmEiHQjJY/SUzJFbRV
         ElStCjPCF4aLc/DiCohPXmWcZTX/qf3oruPCzMrJqo2YPe1Zpv9v+LGIaMGL9YnNmVNW
         +trzOmILvtpN0i1xS7VYQY0n2sG+qY/BpIREsePKF3gFxaRbyoMS+qNmTub9LnYvwz4z
         fHQYPOSonKv+Zj8akl5dLWdT0V3+yFB6oecwYl3Jou3nS8FwdNrqwdqR2lbThD0nIevK
         Vi7Q==
X-Gm-Message-State: APjAAAUYFtiO/bUM7Uu+miTTyHyHqvuvl+BAZKkriO2QEOGIs3eJhZPS
	DepPEvlfUsfcOGejjTILRt3fTWHurIOZP5Bb3Pt6pVvZ
X-Google-Smtp-Source: APXvYqxj/zkU5gCFJstOibaBQqHoBML3D4jF5nT0TTyiwfdmvMcmlT4D8O0KJBhtIomLHeUv2NESIGt2N8wIOkPkZr8=
X-Received: by 2002:a05:6830:184:: with SMTP id q4mr15411534ota.232.1582020312884;
 Tue, 18 Feb 2020 02:05:12 -0800 (PST)
MIME-Version: 1.0
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
 <CAPan3WpV2m9HXLXZDopKUb2EfX2KE9y530m2pJG4-D96==ggCg@mail.gmail.com>
 <ee95179f-c15f-9615-e241-80199e6948b7@redhat.com> <CAPan3WpG0yPu5sbS=mpHk=xNVGaqwWFrBcDBcovLLRit==5dwg@mail.gmail.com>
 <3aa04b23-80a8-21d1-7481-d52b6d8f88c1@redhat.com>
In-Reply-To: <3aa04b23-80a8-21d1-7481-d52b6d8f88c1@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Feb 2020 10:05:01 +0000
Message-ID: <CAFEAcA-kNNWgLc8NxWgVJQk29BVr28j-A_d4M+8=7nfpTzhzcQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/20] Add Allwinner H3 SoC and Orange Pi PC Machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Beniamino Galvani <b.galvani@gmail.com>, 
	Jason Wang <jasowang@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: dpMecgr4b9le

On Tue, 18 Feb 2020 at 06:46, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> IIRC from the specs, cards are block devices and the only alignment
> required is the size of a block (512KiB for your 4GiB card).

Isn't there something related to erase blocks too, which impose
a larger granularity than just a single block?

Anyway, in general the backing image for an SD card device
needs to be exactly the size of the SD card you're emulating,
because QEMU needs somewhere it can write back the data
if the guest decides to write to the last block on the card.
So short-length images generally don't work (true for all
block devices, not just SD cards, I think). This often bites users
if they're using some distro "here's a disk/sd card image file"
where the expected use with real hardware is "dd the image
file onto the SD card".

thanks
-- PMM
