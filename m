Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp206267wrg;
        Fri, 14 Jun 2019 22:20:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz1vKpXy9A8DIt9OrbpUb8uunz1f4MhAXu/tgTee7SOxHSfd1V7IYkvkJ00SC2FMaDQwNlh
X-Received: by 2002:ac8:41d1:: with SMTP id o17mr9843133qtm.17.1560576007407;
        Fri, 14 Jun 2019 22:20:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560576007; cv=none;
        d=google.com; s=arc-20160816;
        b=nEb/j5GAyr2xclUxqwwU3tIhqyvEWKTeZv0ATSRFfS+L/jDtkhNW+BrMfuGPeFuUWJ
         3Mhzv3SUwMTww0yFRZb/9dL+mGsUJKtpcTcgzhYXapZeQ6QFN+S6IULn5JHKDCSgIjZD
         CJwNQNYUpmLWkRHLjOTps2F7G7LkQvJhonfEIoJfkk1kuyIXv0Rq06QhOuOabonbtznU
         eb1aYtQI/UhYdCtfVNaB9HLH+ZsThVezPVpohCB4cAta0yp+ctYbnECfAK1GO7F3KuPv
         Y7EzgqPSW6tdFFQnvWjpRLAipo3ss9U6HABIPHDysNI0IYeFIIvdzn/bz7BspAzj11+h
         pNSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ahfDBaZpWRRMUSU14banV4tDohtU7GQ0/Bn+quR5tGk=;
        b=GuToAPWVuWRZUcLYLqlI9Kq+uFokE0nwnHlruQA34fcNLYnb3cdvSg8oVeDpAsaQVV
         p5UOGkHA9/am4RaGZLKEr1NX+HRNuZPBOvBXdg8pAL+Hy9/R8bd1Xx9tGhaOX2Xyzzf+
         bik6zEUXoS3MiSw0ljEg3rmhyREaZ4nivvCJUxMWOROliQh9teHdbpfVNPyZjoSOYJxw
         maFUu/3aHHVEzEYpw4YtaoaW1HtOskD0rxKA0Vyn+677WIbmcxkHjjXZ+1nqNi7b33Dl
         1o7eDLX0qslP5DU+dMRVmIj9Qm6ZUz1I3nLCY3DdgL1yZAXfjSzZpY8jKXQHFCCRIQiR
         oKxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H6Pii8mP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x49si3108364qtb.110.2019.06.14.22.20.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2019 22:20:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H6Pii8mP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hc16k-0006y7-Vd
	for alex.bennee@linaro.org; Sat, 15 Jun 2019 01:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50526)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rfried.dev@gmail.com>) id 1hc167-0006Zx-5l
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 01:19:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rfried.dev@gmail.com>) id 1hc0y8-0007mM-Uv
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 01:11:13 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40009)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rfried.dev@gmail.com>)
 id 1hc0y6-0007dI-I8; Sat, 15 Jun 2019 01:11:10 -0400
Received: by mail-wm1-x342.google.com with SMTP id v19so4124305wmj.5;
 Fri, 14 Jun 2019 22:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ahfDBaZpWRRMUSU14banV4tDohtU7GQ0/Bn+quR5tGk=;
 b=H6Pii8mP5cGFjrndSVNTbbCrqkCZCpdxTHGt3dfZKexIc6mkQmVjWo0A6jlX4Uh1y6
 305+BMsGhuZ39++nsrJuYSqShsPbY1fqxbBS4OV3JTC8RiK4VjqAHqXhd00TsR7P+GZ/
 OWFlhpt2ntPOPAglUk8+Xt126Dq4GcLOUgnDIneZli64AGXFQzZplzlRwY6LzV5dBpFm
 WIlMLeC0Z8r/ij9lff5QATCbfa9MTdIfmjIrdScjgE68lB6DPYjBUcUK4EoYJkWSR2BZ
 MimoVGGgoy7cR/mgo3z6VzBNM7r5daWiX838mTGlprEkWsETfZipJnEdwy4FzU6l8zdd
 L5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ahfDBaZpWRRMUSU14banV4tDohtU7GQ0/Bn+quR5tGk=;
 b=YMn9uLm0mgVvCMxdMhJDN0/kRDyO2l4jblOP+kz6aiDdRVN/QT1VyL0bnrD54AHviA
 WIcE1WNEN8ZWnCmefz/TXWEOtTO5i3uHVvPZgM7RvZb/zmXiPyQsnUPsijxrzra1O1OJ
 13SY7/+vr4mYwqcOUqK0rbrtCrfE/ldctJ36jJKXjmE2/Z7lbFIQSAmR4nZ1GZF0Gtob
 yBEp2S4+VicgdgKoblWp29wt7MO38j97dsrQrl9YQJZfNw7xIgNY3fVaZEZVbyntZoS2
 riWWFCTcIdO/H9q/VsfQn5gx3jG7Z7gRugj2VHS5tsYToIsyv1Kz+zsItiGdxG/1/yKZ
 tgXw==
X-Gm-Message-State: APjAAAWQu+eQ5UX/sSqeqKuUdJpKKzqRmBb35OFqvr+pZAxYhVlAudzp
 XXWyLY7+AjbR7Qd9FuLIREOhPctbzeXdBWKQ5ps=
X-Received: by 2002:a1c:c255:: with SMTP id s82mr10881568wmf.6.1560575467518; 
 Fri, 14 Jun 2019 22:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190611145556.12940-1-rfried.dev@gmail.com>
 <f826d073-da60-96f0-9a37-c33761844cc2@vivier.eu>
 <CAGi-RUL2QThfiYPeZOE6iuryxT7Daj-y-Q=SSgUBRFcDsWP+zw@mail.gmail.com>
 <200eff56-ffff-904d-eeef-408b52ce2fa5@vivier.eu>
In-Reply-To: <200eff56-ffff-904d-eeef-408b52ce2fa5@vivier.eu>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Sat, 15 Jun 2019 08:10:56 +0300
Message-ID: <CAGi-RUKY_WPsaL+aYfuZzKLGcPj7=+PCUo94Oxm5-ERCGEgtzQ@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="00000000000062ff64058b55cad1"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] net: cadence_gem: fix
 compilation error when debug is on
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-devel@nongnu.org, "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n8npoXLKe3oP

--00000000000062ff64058b55cad1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2019 at 10:40 AM Laurent Vivier <laurent@vivier.eu> wrote:

> Le 12/06/2019 =C3=A0 06:27, Ramon Fried a =C3=A9crit :
> >
> >
> > On Tue, Jun 11, 2019 at 7:21 PM Laurent Vivier <laurent@vivier.eu
> > <mailto:laurent@vivier.eu>> wrote:
> >
> >     Le 11/06/2019 =C3=A0 16:55, Ramon Fried a =C3=A9crit :
> >     > defining CADENCE_GEM_ERR_DEBUG causes compilation
> >     > errors, fix that.
> >     >
> >     > Signed-off-by: Ramon Fried <rfried.dev@gmail.com
> >     <mailto:rfried.dev@gmail.com>>
> >     > ---
> >     > v2: change %lx to HWADDR_PRIx and %lx to %zdx
> >
> >     HWADDR_PRIx is to use with hwaddr type (packet_desc_addr).
> >     rx_desc_get_buffer() is uint64_t, you must use PRIx64.
> >     It may be better to remove also the cast to unsigned.
> >
> > Other places in the code also use HWADDR_PRIx with  rx_desc_get_buffer(=
).
> > Should I change them also ?
>
> No, in fact you should change the return type of rx_desc_get_buffer() to
> hwaddr.
>
Make sense.
I'll do it in a different patch.

>
> Thanks,
> Laurent
>

--00000000000062ff64058b55cad1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 12, 2019 at 10:40 AM Laurent =
Vivier &lt;<a href=3D"mailto:laurent@vivier.eu">laurent@vivier.eu</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Le 12/06/2=
019 =C3=A0 06:27, Ramon Fried a =C3=A9crit=C2=A0:<br>
&gt; <br>
&gt; <br>
&gt; On Tue, Jun 11, 2019 at 7:21 PM Laurent Vivier &lt;<a href=3D"mailto:l=
aurent@vivier.eu" target=3D"_blank">laurent@vivier.eu</a><br>
&gt; &lt;mailto:<a href=3D"mailto:laurent@vivier.eu" target=3D"_blank">laur=
ent@vivier.eu</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Le 11/06/2019 =C3=A0 16:55, Ramon Fried a =C3=A9cri=
t=C2=A0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; defining CADENCE_GEM_ERR_DEBUG causes compilat=
ion<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; errors, fix that.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Ramon Fried &lt;<a href=3D"mail=
to:rfried.dev@gmail.com" target=3D"_blank">rfried.dev@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:rfried.dev@gmail.com" =
target=3D"_blank">rfried.dev@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; v2: change %lx to HWADDR_PRIx and %lx to %zdx<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0HWADDR_PRIx is to use with hwaddr type (packet_desc=
_addr).<br>
&gt;=C2=A0 =C2=A0 =C2=A0rx_desc_get_buffer() is uint64_t, you must use PRIx=
64.<br>
&gt;=C2=A0 =C2=A0 =C2=A0It may be better to remove also the cast to unsigne=
d.<br>
&gt; <br>
&gt; Other places in the code also use HWADDR_PRIx with=C2=A0 rx_desc_get_b=
uffer().<br>
&gt; Should I change them also ?<br>
<br>
No, in fact you should change the return type of rx_desc_get_buffer() to<br=
>
hwaddr.<br></blockquote><div>Make sense.</div><div>I&#39;ll do it in a diff=
erent patch.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Laurent<br>
</blockquote></div></div>

--00000000000062ff64058b55cad1--
