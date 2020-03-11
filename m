Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1171001lfc;
        Wed, 11 Mar 2020 12:58:23 -0700 (PDT)
X-Received: by 2002:a02:cb8b:: with SMTP id u11mr4431931jap.57.1583956703751;
        Wed, 11 Mar 2020 12:58:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583956703; cv=none;
        d=google.com; s=arc-20160816;
        b=BPf83hRL5/nshofxDmfOFjH7rFMnur0TNHSd5DDgSWX0y/i2MZI+jP73xVkVQsdve5
         wldpbKFMC0Rnszkqj30JJpuxkZYbQLISzBC+hVQZPd9gkukbul3WN2fQONR89IMqZSqR
         MGBUx8StpbHylo//yusGx42HGT4PCzEH5Vgo1YmSApcO4ZuoXls1mcMRzIsdqwe48upq
         AYv65MEoypxiQnc3PEuRB7yjCFjnzhiFnxKxvzXZV7+f3i0Us7GB9omFC08aAaZJI+bQ
         ybbtIAZmY2KpOI6aIjwtUo+9hCQ9pifAFl8ACUx8RYVeeOmZZ9EK/asArl0vn70UFo1i
         1cYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RR3mg5wmMKz/+GwN6HCoqmVSY+wRsxn8EXjNnSDeV6E=;
        b=0nT2YnpAOtrJX6zpISV4sLt0YMHBmRxt7FTWiWBeSduodsMfkGfRhw+q4riVI/DXsx
         ocVchh/8hgfN8Jimx9YJV8cEt4qW5wEJgvNZyHJRYwsDWT9KQ/8AEGrp3uP1KyPw2j8C
         x1+halIJrW7zeVVF25p2QQUqQ6nzsow0L8AgfMhLFxcL9B/grtEPsibMeaya9hQjWoIJ
         IrdQw+9MdTKipAKidhbrXH4Tf5fBAdljCWTRniyh14HlrCfgHFSZVoEmMNJaqfb8i7ez
         IzbpM9XBZyPpVORQ6DQGPy3iXarmxNZ8hr65mI92Uz6Dqv3OaTBG1XyWvnbjv5tWivhf
         3xCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=quEuiLWh;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i1sor2661880ioo.91.2020.03.11.12.58.23
        (Google Transport Security);
        Wed, 11 Mar 2020 12:58:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=quEuiLWh;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RR3mg5wmMKz/+GwN6HCoqmVSY+wRsxn8EXjNnSDeV6E=;
        b=quEuiLWhNZKcEZfY5Z2C4iuKPD9JyTJwdJ0WNidK1OmctrcE9KpONZW1qVnou0aHtR
         2x9UrwjVgUiliAoUcMQQMsWbLCaP3DiC3XxP0TFKpmUT0n+nPQVidFAxDidAi2XoD8VQ
         fj+8uHXALAldCWuQ2hKxp9ORENdsVZp9sdmieKdSuQzvnAyAh2y8nPcHHt6pfvpZCsez
         M9UdMAGWTFkD2fVBkyeGZOzgXcTiA+tPEk0PBQ67Ku8gFK8ISTH6Qx6wvu+wzrWnZLi9
         r9Ldb0ACnpDPrdEGMGbvf1p9azCE+JasI2fyLu3NRispDt1G3OvHgR/ZWQaITmPpZT3y
         ZbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RR3mg5wmMKz/+GwN6HCoqmVSY+wRsxn8EXjNnSDeV6E=;
        b=i9UAU8psk7usejRtZrBrwAoIDPEB4Hc6mcYvXNca2y7hCFdqX5K15mmmakGxqe5DLR
         5MVzwPsEzKh6I+681Y+NuY/4JQRWBaxCARBhZCVqiorqt7TfBWnCAbQsm3a8itEnGU94
         xgpOxwfGL4qYYorVk4TEsUsMAozCmq7N/Bz9vJe1vI1VSyB0LgG5GGaUMUxCVUDGvaHi
         Piydjf9b0NlT73C42dyNVCZvKpysP0xTQX8Pr8AaXcMPWmJ4vMMvJ4pzVFnD2ehS1OzI
         qdu7+P2HO26WHuxd2RBkW9VMD9VZsPaOQ/WLwsBb4LF6ZRMr8iWYk+euDL/SxGWR87vN
         3xuA==
X-Gm-Message-State: ANhLgQ1R93NArTQqlBuStmqIvkGGA1cqQA9vkZHWKU0k89bVVtHofXvL
	QK27+AqD0b8QviPfDYSKqMRNkuOqaM36320RybYvBQ==
X-Google-Smtp-Source: ADFU+vvAYgkZ5tnJtYRxFcZw8mPY5UYexVg73TGG0aRUov8o3RO2n6ZTVXVOnwNIrQWpQkava/63ESI69i2R6cdXKqg=
X-Received: by 2002:a6b:740c:: with SMTP id s12mr4504091iog.108.1583956703153;
 Wed, 11 Mar 2020 12:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200310213203.18730-1-nieklinnenbank@gmail.com>
 <20200310213203.18730-19-nieklinnenbank@gmail.com> <875zfbgff8.fsf@linaro.org>
In-Reply-To: <875zfbgff8.fsf@linaro.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 11 Mar 2020 20:58:12 +0100
Message-ID: <CAPan3Wp0AotZrbu=R0gEkwCjkU6Lw43fYUaz3c7BucYvLF0bQA@mail.gmail.com>
Subject: Re: [PATCH v7 18/18] docs: add Orange Pi PC document
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a1936105a099a875"
X-TUID: qwxYxDhgD9Cp

--000000000000a1936105a099a875
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2020 at 3:00 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Niek Linnenbank <nieklinnenbank@gmail.com> writes:
>
> > The Xunlong Orange Pi PC machine is a functional ARM machine
> > based on the Allwinner H3 System-on-Chip. It supports mainline
> > Linux, U-Boot, NetBSD and is covered by acceptance tests.
> >
> > This commit adds a documentation text file with a description
> > of the machine and instructions for the user.
>
> Awesome to have such comprehensive documentation for a system. Thanks
> ;-)
>

I'm glad to hear that Alex. Perhaps in another patch series we can begin to
add documentation for other boards as well.

Regards,
Niek


>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> --
> Alex Benn=C3=A9e
>


--=20
Niek Linnenbank

--000000000000a1936105a099a875
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 11, 2020 at 3:00 PM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com" target=3D"_=
blank">nieklinnenbank@gmail.com</a>&gt; writes:<br>
<br>
&gt; The Xunlong Orange Pi PC machine is a functional ARM machine<br>
&gt; based on the Allwinner H3 System-on-Chip. It supports mainline<br>
&gt; Linux, U-Boot, NetBSD and is covered by acceptance tests.<br>
&gt;<br>
&gt; This commit adds a documentation text file with a description<br>
&gt; of the machine and instructions for the user.<br>
<br>
Awesome to have such comprehensive documentation for a system. Thanks<br>
;-)<br></blockquote><div><br></div><div>I&#39;m glad to hear that Alex. Per=
haps in another patch series we can begin to add documentation for other bo=
ards as well.</div><div><br></div><div>Regards,</div><div>Niek<br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Reviewed-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org"=
 target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000a1936105a099a875--
