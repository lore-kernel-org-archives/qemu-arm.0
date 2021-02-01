Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp3582825lfo;
        Mon, 1 Feb 2021 09:05:09 -0800 (PST)
X-Received: by 2002:a05:6402:50ca:: with SMTP id h10mr19621641edb.181.1612199108947;
        Mon, 01 Feb 2021 09:05:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612199108; cv=none;
        d=google.com; s=arc-20160816;
        b=KzIAfNoACAtv01BLQ5RoBcnhonrguh6QM6Tn6iEbd1fvz29beqMMfqA1I1w4vNfeVE
         4Erj2aQAFFT1d60ef6gRAa6rqTC1T/Ld7zvLIMQIcEyJymWrSb/pZTyyhPNmWjdUL/hu
         I3KPX6/qZiLkNHowxIv6k+dnY0lHvfnDLkePgHo0vzAQiQZFxhvUjTcUSra4JFNP8NP5
         /wAj5ZGA65nrlcW7Cmetz0CJK0iOWxprXCm492A5aLPoGiMZhowNqR5M0xX2osUSWhr/
         OzAjfzXWET1VOEcLWfBR2JkgmmvN9RrwRoXNWJ8c2OloQSc3JhG+23E0/QiHhV8syPNv
         v4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RZoHEYVo0xh/lfhruzq5ozEj/oB5CoO8KyeG7Y+GapY=;
        b=kdTg/1bxRVdGNH+6+fqH50HomL54ZIkqkQRsMVLs4YfqtVQZXlDuiETQc4TQAOEnhD
         OPuD5I1HRfHLwUupDX8aXbS+mgnt/p1U2Mn4VqqrN617yNVOFKfy+Fe7kpuCKriQ2Xqp
         cSYtgWPm7eK6Dts9lqCEC0/L1t2wAK6cAP5FSIIO56Q7VvchBhHMv7KjAKSSZgW3YDqu
         ti/wRASvLrm66Cn0+JPfV2QGqmRhtaHIU39B8YRnsYnGekCfG0L68ImAh0i7hub7HiIj
         eKvoOeNcmXrdETfvwdoFQAk1ysMRWaKvJiBuxnhWSWsTtvNT4Spw5b8Dekq4qaAZ4RoT
         T4Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kpvw560f;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id oz25sor3991659ejb.53.2021.02.01.09.05.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Feb 2021 09:05:08 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kpvw560f;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RZoHEYVo0xh/lfhruzq5ozEj/oB5CoO8KyeG7Y+GapY=;
        b=kpvw560f/vnGrYUq7divnC6Wde73zRDbPq5q6qqWQKsiola07hpcZmU45cQu7fnMq6
         yYJVpAlIZd2bOiJXf3nc7ULRJyikDbxaP0yncg7/rd3N/2rpIk4ogj/KLtZBXaL9dtO4
         SdIK5iTmW6O0EUc1IhCmgC261NFBqNgz460daWwUk5tX1GjAOX5pJ1TEc5HmcrSWYbDE
         uEa8Wibl8lU2Vs0hrUsxTMtFoDjKO7UZqL0P+Uf+08IH31SWvSrk8q5yxqyQfQm3SuMQ
         Qjgd2mdbBnvtd2wjMpayXYUOX+KhAwWsdrPNKlVhbsyu15RWciQuJQ4AElbvhuoAixPG
         WoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RZoHEYVo0xh/lfhruzq5ozEj/oB5CoO8KyeG7Y+GapY=;
        b=ZKmi4lOjEbFcFsWBawJvSqHr06VSQmkXAMyBkItV5GQVKccE+nlocn6H3AU9SqeNqW
         OWb8YGiup0v3ipw7hgattbQKsuLSoZpltbBPQsvTM8F7+5w9uPrKT+rImS96bl+dufOe
         jSXGfRGpQXuzUBSYLfDEVyjtNJ4aD0JRJtkNUuejuuFIdA08qsxzCtIxLNbGhyG4onK2
         IJ8pnBiG1AC5DaFbk/Wvd+Ji8WjzoSRiQNQxmlmQD8vA+tE7gww9Wt8kYwSEcmZPBE8o
         NI2FKj+9vwjf1LsmB/R/6ZlHJvE11teuCNZpr7pBtE90yl90U2bFuwk9ZdWuhJmH58m3
         mrTQ==
X-Gm-Message-State: AOAM5304PMbxyGlBngxhjsE1G7fCaLdAgXXf6FQWrFSZjIfV2rGKHVge
	95f6waQ+pOHqJFV1BDEMRiy7BkUn/u7OMbXwUml8zOP4wdAq1Qjh
X-Google-Smtp-Source: ABdhPJxJRrTbm7z08l3lzbNTrUZw4CQ3TYMY4ZCWwtf+NWwwupspynbaeEwGsyKU9Zz0mQvdcsSK3jhP835PylmJGv4=
X-Received: by 2002:a17:907:1b10:: with SMTP id mp16mr18684581ejc.482.1612199108593;
 Mon, 01 Feb 2021 09:05:08 -0800 (PST)
MIME-Version: 1.0
References: <20210128185300.2875-1-alex.bennee@linaro.org>
In-Reply-To: <20210128185300.2875-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Feb 2021 17:04:56 +0000
Message-ID: <CAFEAcA_R3phXwOtj-v-6-oCN891SjGSyAGwcx3_zDf+GFPWLqg@mail.gmail.com>
Subject: Re: [PATCH] docs/system: document an example vexpress-a15 invocation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: rukpN0Rfh/7p

On Thu, 28 Jan 2021 at 18:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The wiki and the web are curiously absent of the right runes to boot a
> vexpress model so I had to work from first principles to work it out.
> Use the more modern -drive notation so alternative backends can be
> used (unlike the hardwired -sd mode).
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>  docs/system/arm/vexpress.rst | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/docs/system/arm/vexpress.rst b/docs/system/arm/vexpress.rst
> index 7f1bcbef07..30b1823b95 100644
> --- a/docs/system/arm/vexpress.rst
> +++ b/docs/system/arm/vexpress.rst
> @@ -58,3 +58,29 @@ Other differences between the hardware and the QEMU mo=
del:
>    ``vexpress-a15``, and have IRQs from 40 upwards. If a dtb is
>    provided on the command line then QEMU will edit it to include
>    suitable entries describing these transports for the guest.
> +
> +Booting a Linux kernel
> +----------------------
> +
> +Building a current Linux kernel with ``multi_v7_defconfig`` should be
> +enough to get something running.
> +
> +.. code-block:: bash
> +
> +  $ export ARCH=3Darm
> +  $ export CROSS_COMPILE=3Darm-linux-gnueabihf-
> +  $ make multi_v7_defconfig
> +  $ make

We probably shouldn't be recommending in-tree kernel builds, or
polluting the user's environment with random variables. Try:

$ make O=3Dbuilddir ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- multi_v=
7_defconfig
$ make O=3Dbuilddir ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf-

> +By default you will want to boot your rootfs of the sdcard interface.

"off"

> +Your rootfs will need to be padded to the right size. With a suitable
> +DTB you could also add devices to the virtio-mmio bus.
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-arm -cpu cortex-a15 -smp 4 -m 4096 \
> +      -machine type=3Dvexpress-a15 -serial mon:stdio \
> +      -drive if=3Dsd,driver=3Dfile,filename=3Darmel-rootfs.ext4 \
> +      -kernel zImage  \
> +      -dtb vexpress-v2p-ca15-tc1.dtb \
> +      -append "console=3DttyAMA0 root=3D/dev/mmcblk0 ro"

thanks
-- PMM
