Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp7204007lfb;
        Wed, 29 Dec 2021 05:23:58 -0800 (PST)
X-Received: by 2002:a05:6808:1a89:: with SMTP id bm9mr11593838oib.86.1640784238437;
        Wed, 29 Dec 2021 05:23:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640784238; cv=none;
        d=google.com; s=arc-20160816;
        b=Z1FyC5rAflTSC5P7YKI6kfyZ7Juf/9ssgjJpYCY6ZJ6Ja2VpCvPHp818Qo/1lntEKl
         YNGgcVVEcOtniDeEmNxRHiWwRUODNjSPoUcWBgKlGq8waPLC299+nzuX28PNHX9nXJRa
         KvGJsV0Keb+ge1XvZG7QxxopbK9C7Y8xkemU9dwwA20pi2zy8y7QGfG0hVbnxKIK/hmM
         x/XOX69V+otnndunew3Z008UoYkwv/BWamCdtEJuNzb4chxE3hVDblzTnejgjsi6mRJU
         +MNnONeK+asq4lEKpy2dLCopqqaEvYRCeGvvumn2zF1CVysUJ60v4T+Eapsadg7v3/cG
         VMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uPjxk7SKPSg1V/oZ+tI7n5Xlmpzy7Xh4ki+Upzci5E0=;
        b=eRkE2q8Vxy9eYNUk/0FJP+Ij/DUB7XX9OF7E4X2FSB9u/V8RTDnY4Rw3m9F85Nw8OT
         DF0xEMKhH+dgIZrrvf54BWuYe9O3GmRp8zU1HnJqY6GTQ3/IdtW8PxC/ckOxbny5FdOO
         Wa7EKfespJ6g2IxWGIyQvYz9TBWoFUFSkFxQf+mYhCqdLAMzODVmwQ9ikZwVzxTmheLW
         NHjcFbv9KQqcEZ36yQPdmSXK5YPPUdDbQIyUcrl63in1ikJDf24/+vK9cHLiNnlcuvkF
         XQa5q0zJW73CzuUWK0iUXrhlVLVMBe3+W8Ecfn6FVydyZ0zCctGKuQKX8QufnbjvaF8D
         uPsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=dtSTFmOS;
       spf=pass (google.com: domain of idan.horowitz@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=idan.horowitz@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <idan.horowitz@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f8sor3454238otu.178.2021.12.29.05.23.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 29 Dec 2021 05:23:58 -0800 (PST)
Received-SPF: pass (google.com: domain of idan.horowitz@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=dtSTFmOS;
       spf=pass (google.com: domain of idan.horowitz@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=idan.horowitz@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uPjxk7SKPSg1V/oZ+tI7n5Xlmpzy7Xh4ki+Upzci5E0=;
        b=dtSTFmOSN8jerqd2rQLDu87ofCF0/VgN+JU3TyqUe/9UMRLS9/WgCeNI0P2OaiKs6Q
         aAAd+GjwfQ1zELnjojJ3iUX3vteEJ4Eo57v/Zp5fetRTE/0Uwy3ERQY/FenLNnWFDnMA
         +YitFgdNvhet9W+DNGSg++wCNoYxbxF1CQbzXSF6CYEImxg4YNMiDMVQKGs6n98MJwLo
         DVLogLRWbjX2/lCYWPRyAWjOUTGLKTPfThnbM86qScWPzeyyTT4siAe6kLT6Q5aj3LeR
         Ws1R/v6hSMsI5ia5YmAXRsec9PqdtitmW2PbHrPvTcPcBMDDiOQ8R1d0jV0CKPXLqzbv
         FEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uPjxk7SKPSg1V/oZ+tI7n5Xlmpzy7Xh4ki+Upzci5E0=;
        b=jkZSmtCWMl4rfoYosN3OmqxjtIBzEPXMg2n/WWCve5F5JB/NJyF/k/qoXrTeFOhuaY
         hWk67aAEURNPACIuPrqEzhVynsFqB5xkpMcdnLvAMLMieVmuR0u8YV3/i4jD4XS5VRh8
         LyCeN9gbygAncoWUDaZBrZJk/GachppueDsJophBGhcUacrhUQpO18/CZMCrXkCsv8J3
         z2bfXQbVoxq2B/VIv1Z2eRqW/3jtu8aXeYK6DpT/pZrtP2rxVZNyHo2GmqgPAgFU8znt
         TnZqolQDupK2ojDigxuxk6Xn/AAwAqOOP9ltwpgF2eZzM9stTwjzOA3TbXPHLsbRRIOR
         1AoA==
X-Gm-Message-State: AOAM533EY8zypue1zxGgKniZFixhOO0rh7sfURscwePo0/R2dx4ZulV2
	OY2qdMdNh1zSkR/ffvJ7zGFe19fCaka0GVRMSF40u4vxdg0nbw==
X-Google-Smtp-Source: ABdhPJwMBtVO5Q9QbuLaC5onQabF5pBwYKvpoYLS0kAMT3avJtGchzAA8TMVugBhxUMWxL3oVnJ97CbpoyclNauxYec=
X-Received: by 2002:a9d:5c81:: with SMTP id a1mr17760593oti.277.1640784237816;
 Wed, 29 Dec 2021 05:23:57 -0800 (PST)
MIME-Version: 1.0
References: <CA+4MfEJhOsmUWmifkzJ7jSw8B0q7X2mJe=jist4AiTwhYd8Wug@mail.gmail.com>
 <87fsrtv13t.fsf@linaro.org> <CA+4MfE+gT-CGEVZot=26DqwCRY+F-xZhTRSOsKKBVb29Un46Dw@mail.gmail.com>
 <CA+4MfEKrrsACvQKBimpkQt6r0H2cbJ9EaYCSFgZcx1Bqr20=Sg@mail.gmail.com> <87sfvcxpvb.fsf@linaro.org>
In-Reply-To: <87sfvcxpvb.fsf@linaro.org>
From: Idan Horowitz <idan.horowitz@gmail.com>
Date: Wed, 29 Dec 2021 15:23:46 +0200
Message-ID: <CA+4MfE+XTqhXiMLc-ScHqDCwvfKmX2CT8UikPfc5S79De8ewXw@mail.gmail.com>
Subject: Re: DSB does not seem to wait for TLBI completion
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: J9wVY+t2I+7v

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
>
> That's is weird because icount basically ensures round robin scheduling
> of each vCPU in turn. I wonder if there is a pending flush when the vCPU
> switches?
>
> We really need a reliable reproducer for this to investigate further.
>

I have finally been able to find the source of the issue, it was an
extremely subtle race condition in my code, so not an issue in QEMU
(although I did find a translation-related issue in QEMU during the
investigation: https://gitlab.com/qemu-project/qemu/-/issues/790), the
issue was so subtle in fact, that not even hardware was able to
reproduce it, only QEMU's highly deterministic icount mode was able to
reliably reproduce it. So thanks for your help, and sorry for wasting
your time.

>
> --
> Alex Benn=C3=A9e

Idan Horowitz
