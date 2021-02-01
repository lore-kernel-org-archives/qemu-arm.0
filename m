Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp3585524lfo;
        Mon, 1 Feb 2021 09:07:45 -0800 (PST)
X-Received: by 2002:a05:6402:2211:: with SMTP id cq17mr19644357edb.167.1612199265863;
        Mon, 01 Feb 2021 09:07:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612199265; cv=none;
        d=google.com; s=arc-20160816;
        b=Re/CD2S8IJIuUMeYxYtTfhH1E1ovNzs/UWgJ8N4Kq7eCR5fVBTmLFlH8D3NdBdqpm9
         2GuN+CC3GmSQwxm4kQ2yYyu09L5Xpf7iPOyo8WWnqyxQzXh761oMS/naCUO1VRX1Btkr
         FEPeUhpzT5GiGMvd5NfDngmMWwsp3CFXNuguMp0k2FdNSqq4Llm+1iYa4VL3/gPPaN8r
         9ie1YJIGDBmMRPCLTWZr2DQ4BGOGdCwYG7uMWg3/7cADRRQOXjPI6ydMi6wqPcEsbrBi
         OCVol/xPBdTtVnZpjwaFYbb5l3tKD8KrrO0nGLXPVC1Bb/4yjy8yp1/hFxQTsZYoWSbA
         5Png==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UqMXe4bj2183Q2V8DecL5lKHTV0DrJz0QnkHc5l4VKM=;
        b=EZ+2qOQ2khlxRbiA0wlyjtxzYVPy3BnmfhpJk6gYsTtK1zKkIgMLNP6qvN1A74opV1
         4ojvPzjnbhacbGqwkkqBUkhQamcoafr21B+0XpG4qDeQ16J5jhYXHuf1wZ71lvvRRFAB
         ySMGY81TrydXC/uKz0gQAUIUIdmaApxX47GfigunehuN+3HYbvMK6+3erKUybtZ4ZoGB
         lU7R2PmqmNzog1MC8LlmSyE8mAc2hw2dqcwSAg2s3jxX4IEnDMG7mOpjn+uUm28a8OiV
         D0wqCbFo25MddBgkarn4SpcIwTW9/4bLZUCS+53nXJ2PKQ8aAI5dnCcZlkQ3fttDmvtg
         jvmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lOZaLpCD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n8sor3455274eji.84.2021.02.01.09.07.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Feb 2021 09:07:45 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lOZaLpCD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UqMXe4bj2183Q2V8DecL5lKHTV0DrJz0QnkHc5l4VKM=;
        b=lOZaLpCDAhpROl1PjGc+qfGs4KzBWA3t4X5dvWHsEDJ10AZnW6IGLzEEQVJVLFwdJh
         690FgmAjgNpDjP7ef1NRdQNbeF5QfUwnWSscnLcugaSmiuSy/elCNIhufZUupr0CLzP7
         MZwFplOgkgtMXg9lww/jkSErPGs9Famnx2fwKNlH0xt6rlKpyq3RHBBkKZtN2Uwsvg8v
         y9ttFTxXgRt5EeedU4hU/1LFAYFzmivIkKy4sQtpn0IoCOaYIVCkQWLs32uPsj97H4zF
         IV+e0G8Ej06rGTdfZn5LVPdZFS17nnfg09wLs5mItiDOCj2vjJsh5aP5qPiTmTQU4MsK
         wmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UqMXe4bj2183Q2V8DecL5lKHTV0DrJz0QnkHc5l4VKM=;
        b=ZDIYsBYb9jkxsuNrUMXWHjWrNVLBzvQxFLVQj9ksAm6M7JpUA2uMFRcflsJssDGZZj
         nij83HDIsBgabO+j8MExMSFaOi7Lh6AVZPlfcgDCfaJzz6XpiM66AAufOxxauIat9hc2
         liuHWeeiITGPOVTNCIAvvt6oXc4eSg6LJngWoM8xZ2YM+OaPjBMsXOms/fyGP8gW+mcz
         YMc2oqDtt2TAM7z7CjK/EdwDSd775uCz1xFgldbnFgpZcae+Fy9KB/SnbunodJSjfBn5
         MWLLYQvnm++20x/QuKQvKiyjPr5qNHI6/xA1+SJln85RJhbjNVJ2JNEawkJvHL/3Pkmu
         D2qw==
X-Gm-Message-State: AOAM531uLvS1eSSXESb62gN6qScJeqqR5kaXe9xN4XCR9HiFJS3Cbsea
	rwkfABm4YWUa6jlvdz6DvcZc5fI6tLFz6CUzmMF+P0EaKz8tZA==
X-Google-Smtp-Source: ABdhPJyXc6gh49MENCUngbO+7YtlsviC2beGtFhKs0W7vGAQWzK5YCu+riev2sFWNOWKys49gbDNX5m3eTgLkVTm0nY=
X-Received: by 2002:a17:906:4002:: with SMTP id v2mr18821993ejj.85.1612199265589;
 Mon, 01 Feb 2021 09:07:45 -0800 (PST)
MIME-Version: 1.0
References: <20210129181319.2992-1-alex.bennee@linaro.org>
In-Reply-To: <20210129181319.2992-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Feb 2021 17:07:34 +0000
Message-ID: <CAFEAcA9M+J3X1hS6dPrTM-QxGVfLSrP2=VE7cpdJZPovCuzuJg@mail.gmail.com>
Subject: Re: [PATCH] docs/system: document an example booting the versatilepb machine
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Zbtd+a33KZaP

On Fri, 29 Jan 2021 at 18:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> There is a bit more out there including Aurelien's excellent write up
> and older Debian images here:
>
>   https://www.aurel32.net/info/debian_arm_qemu.php
>   https://people.debian.org/~aurel32/qemu/armel/
>
> However the web is transitory and git is forever so lets add something
> to the fine manual.
>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  docs/system/arm/versatile.rst | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/docs/system/arm/versatile.rst b/docs/system/arm/versatile.rs=
t
> index 51221c30a4..d16f20ccae 100644
> --- a/docs/system/arm/versatile.rst
> +++ b/docs/system/arm/versatile.rst
> @@ -27,3 +27,35 @@ The Arm Versatile baseboard is emulated with the follo=
wing devices:
>     devices.
>
>  -  PL181 MultiMedia Card Interface with SD card.
> +
> +Booting a Linux kernel
> +----------------------
> +
> +Building a current Linux kernel with ``versatile_defconfig`` should be
> +enough to get something running.
> +
> +.. code-block:: bash
> +
> +  $ export ARCH=3Darm
> +  $ export CROSS_COMPILE=3Darm-linux-gnueabihf-
> +  $ make versatile_defconfig
> +  $ make

same remarks as for other patch.

Does the 'make' make the right dtb automatically, by the way?
(I have some notes where I had to tell the kernel to build the
dtb explicitly, but maybe they are out of date.)

> +
> +You may want to enable some additional modules if you want to boot
> +something from the SCSI interface::
> +
> +  CONFIG_PCI=3Dy
> +  CONFIG_PCI_VERSATILE=3Dy

It's a bit daft that these aren't in the defconfig, but hey.

> +  CONFIG_SCSI=3Dy
> +  CONFIG_SCSI_SYM53C8XX_2=3Dy
> +
> +You can then boot with a command line like:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-arm -machine type=3Dversatilepb \
> +      -serial mon:stdio \
> +      -drive if=3Dscsi,driver=3Dfile,filename=3Ddebian-buster-armel-root=
fs.ext4 \
> +      -kernel zImage \
> +      -dtb versatile-pb.dtb  \
> +      -append "console=3DttyAMA0 ro root=3D/dev/sda"

thanks
-- PMM
