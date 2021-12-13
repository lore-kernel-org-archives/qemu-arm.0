Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4596580lfk;
        Mon, 13 Dec 2021 14:34:26 -0800 (PST)
X-Received: by 2002:a25:9d82:: with SMTP id v2mr1537167ybp.383.1639434866647;
        Mon, 13 Dec 2021 14:34:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639434866; cv=none;
        d=google.com; s=arc-20160816;
        b=hJnnIGRoQBf2aZAJLJJq4cbamZh3lmFp6TI5EzCdWfxraqBwjo58WwCsPIGnccpfWU
         XI+2TpfOoB3nbhvdl5SvhBfm498jeQ9AeOWV7CdyWIqCfXP5O6YB/s0vKgklwIUFGDAw
         D0j2twX63sTMsDRSIBEOdwyxpHwZZkA79BocbN6GJZnzeDSVzT1PuDmAJZWdhlA5Zloa
         pR8qSEGrt8j5XPXhb13zzaGjcrFcnrtDgp9gmo6ZtwhKWsQry6J1bqlRFErmffU8Yd25
         mzARAFxxC4KH1csPhA7vvPybVbvSdV7/VFcatCTSLJ1i4e/Hykb7+vO6MmVaPPzrXeUy
         8jIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4hXfOZmpFUioqobW2Gk5O70L0Umoxu3UUJjNGr7PuPU=;
        b=Suc+3v5wFprra56t4NFeYhYjbDiG0YrKf26650VNMGGc5lmqTZeqZs+R1yhwJbpPjq
         7C9+0goviipzD+CALtTA8kFv01yr74knoedeY0UPm6Cmx+41Dxbs3bsB8RESgihlewEe
         cXKFI+budubrJVVad7zBn1A8sGwg6XIUmMOgGYVyx67ufMs7XheuCqFEAjxaqVNBkkm6
         URR6Q0TxKcwgD/iXEo/JgtOuNvuu4ya+jLzKuIoSTP53eLn0irR3irhGFcsSECh2WePQ
         /FZ8o/TC9rvClMcidWOJV42GXDBXrldgrUNLoX9wzhWDmexjSpkg1/dVi2X5iZYBhg9v
         BDnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=QZMrxjIJ;
       spf=pass (google.com: domain of bslathi19@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bslathi19@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bslathi19@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s202sor6260567ybc.181.2021.12.13.14.34.26
        (Google Transport Security);
        Mon, 13 Dec 2021 14:34:26 -0800 (PST)
Received-SPF: pass (google.com: domain of bslathi19@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=QZMrxjIJ;
       spf=pass (google.com: domain of bslathi19@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bslathi19@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4hXfOZmpFUioqobW2Gk5O70L0Umoxu3UUJjNGr7PuPU=;
        b=QZMrxjIJ8VVVeuHBpmc1iKoA1/Xlu2RDWz7RE45Id5i1Y1c0cDCu455vRfC+sWEFv2
         nLJLvgtGCCM+tixMjYm6XGhC0NzGkjhhx4/aNperPjybb3hJCTr8C7VXZ7JkzSgY4Og/
         JlS2xOxme5a37sY20KwXCCdNXrmNoF8w15aS3MpLkiadHGQvTV4uBDuJz+pJ/wTlip9s
         CVwituTh7Zzn2P1h5fVu9PRKa1g+FmYksWCpI2G3mxO32AwkQzv8NGExW64iBJKIKqhW
         UuY+G2F4a8al3VDF5QBKIe8cVsnevj3rI6e4H9o6SoEyfHKs+fyMoTzDtBm1SfxGSh4P
         0SSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4hXfOZmpFUioqobW2Gk5O70L0Umoxu3UUJjNGr7PuPU=;
        b=NPPa+43iXqWJEuKxM1zkQrvw0HPJdR7Y8/C3BmCFnMgtgCYtn/AsIcVftS81LgpMEE
         7tfBdvy0SKPzB1cl5KOpGE2I4qx7195pm6DKDvUrgWEcr0f1+YXieYTst8gaK/OBlJP+
         3/YAu/Y2ysCWiFT15SM382099sCSbI9cwEo03edGjDGjkm2CAhFClq/GnRtfpOle1LxQ
         X7Wf8JZ6Zs5+IIsp/HvVo7odLW7VUH14meRayLGIIQNv+SRXazRwUslrinQ9xyZrLryh
         8ydmXJcIJnuT6BAiP49uu++9ScOuHoj2ZvCWp67fgHfZtSQm/xg+FrlqRxSYNTdetouK
         gXyQ==
X-Gm-Message-State: AOAM530kQP883BHOyMftOaZ1MZGzW7LOL8uz/VqEi8MvNrdXoiL5yfu+
	/pS9Dq/FdBLKvJOm8XN1+q2droFhN+vmo0a92sPs6cWCtGg=
X-Google-Smtp-Source: ABdhPJwHqAkiAzzPH0RJVPClabIPgb48mvV93u94djh8HNPh8/+H6UNdF7wQtDmJZ+lePanSRCmRkAmzzZD27xnkU0o=
X-Received: by 2002:a25:abe2:: with SMTP id v89mr1685233ybi.521.1639434866048;
 Mon, 13 Dec 2021 14:34:26 -0800 (PST)
MIME-Version: 1.0
References: <20211213182449.7068-1-bslathi19@gmail.com> <87wnk8i4x7.fsf@linaro.org>
 <d0f649f7-4d5d-9b15-829c-d5cef2137797@linaro.org>
In-Reply-To: <d0f649f7-4d5d-9b15-829c-d5cef2137797@linaro.org>
From: Byron Lathi <bslathi19@gmail.com>
Date: Mon, 13 Dec 2021 16:34:14 -0600
Message-ID: <CAJ_MG7qqySDDBgi0WdcmK_q2v=BzNCKpnzRL9T9c7Cpq9WugWA@mail.gmail.com>
Subject: Re: [PATCH] Target/arm: Implement Cortex-A5
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d2c36005d30eac30"
X-TUID: xvnB4SBxbUo1

--000000000000d2c36005d30eac30
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The goal for me was to eventually add the SAMA5D, so I might have made some
assumptions that were not correct for all devices. My apologies for the
typos.
I will add those changes and re-submit.

On Mon, Dec 13, 2021 at 3:46 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 12/13/21 1:02 PM, Alex Benn=C3=A9e wrote:
> >> +    cpu->midr =3D 0x410fc0f1;
> >
> > hmm wikipedia lists the part number as 0xc05 (and the a15 as 0xc0f) but
> > I can't find the actual value in the TRM.
>
> https://developer.arm.com/documentation/ddi0434/c
>
> has exactly this value at the top of table 4-9.
>
> >> +    cpu->reset_fpsid =3D 0x41023051;
> >
> > I think for the a5 the FPU is optional so maybe we need a cpu option
> > here? Or maybe just assume it's enabled on QEMUs version?
>
> Yeah, there's no entry for fpsid in the above manual.
>
> >> +    cpu->isar.id_mmfr0 =3D 0x00100103;
> >
> > the TRM says [11:8] Outermost shareability 0x0 L1 cache coherency not
> supported.
>
> Again, this does match table 4-9.
>
>
> r~
>

--000000000000d2c36005d30eac30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The goal for me was to eventually add the SAMA5D, so =
I might have=C2=A0made some assumptions that were not correct for all devic=
es. My apologies for the typos.</div><div>I will add those changes and re-s=
ubmit.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Mon, Dec 13, 2021 at 3:46 PM Richard Henderson &lt;<a href=3D"mail=
to:richard.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 12/13/21 1:02 PM, Alex Benn=C3=A9e wrote:<br>
&gt;&gt; +=C2=A0 =C2=A0 cpu-&gt;midr =3D 0x410fc0f1;<br>
&gt; <br>
&gt; hmm wikipedia lists the part number as 0xc05 (and the a15 as 0xc0f) bu=
t<br>
&gt; I can&#39;t find the actual value in the TRM.<br>
<br>
<a href=3D"https://developer.arm.com/documentation/ddi0434/c" rel=3D"norefe=
rrer" target=3D"_blank">https://developer.arm.com/documentation/ddi0434/c</=
a><br>
<br>
has exactly this value at the top of table 4-9.<br>
<br>
&gt;&gt; +=C2=A0 =C2=A0 cpu-&gt;reset_fpsid =3D 0x41023051;<br>
&gt; <br>
&gt; I think for the a5 the FPU is optional so maybe we need a cpu option<b=
r>
&gt; here? Or maybe just assume it&#39;s enabled on QEMUs version?<br>
<br>
Yeah, there&#39;s no entry for fpsid in the above manual.<br>
<br>
&gt;&gt; +=C2=A0 =C2=A0 cpu-&gt;isar.id_mmfr0 =3D 0x00100103;<br>
&gt; <br>
&gt; the TRM says [11:8] Outermost shareability 0x0 L1 cache coherency not =
supported.<br>
<br>
Again, this does match table 4-9.<br>
<br>
<br>
r~<br>
</blockquote></div></div>

--000000000000d2c36005d30eac30--
