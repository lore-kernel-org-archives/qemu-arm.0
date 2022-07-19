Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp2226190lfp;
        Tue, 19 Jul 2022 15:09:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v+ItFv6hsNVY9CCKTkP0nl2fUEWMDG7om6DZtzjJgvOzJgcOVjR4emV6+5JEsTuPTI82RZ
X-Received: by 2002:a05:620a:2619:b0:6b5:eddf:ef8e with SMTP id z25-20020a05620a261900b006b5eddfef8emr7413953qko.674.1658268573590;
        Tue, 19 Jul 2022 15:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658268573; cv=none;
        d=google.com; s=arc-20160816;
        b=Z6Fs4A8VW4t4YzvblvJry2m8aOmPr/0WJKgFfSRv+Lc6/qWodxB2YQb8A/JZAlM+v3
         NYS2x7Bs+4Go0hNGkO+/4UYqM6vZjUqEOCyxQctB2xLumWrWUGQ/vli8s4/lLfmdxMTt
         RGe9jIqd3pUwjHt4qlTY069pHqu/aFavhDwNV2JZTu+W95kdGroODG9in4MuIcFdYsvq
         oAg/AD6zONHNfNHv3haTNRWSg7hQqn9IxeejOJjeADb6TFxMVWIJXME3DIMoKGInC53y
         vzKkSFWnbV10wQrilpW92aQXelQ0mvg/3onac0Tll6kurYv8e3oWGHAp71YU207l6dJm
         1FRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4YrdTZoh0vgz9wKbnhQrTgLC0ewY9Sjyrasryc1Fa08=;
        b=zQbqQ3++LRq9Lx+b1pzhgWajLwVsMCGbiJnt6hR4rj0/80sr6rrEcZCQfQwhOVqoRT
         gCRnLynnpEiT6Uam+aRZZqUYpKJ9CyQCf97qZ19+oRvlH7igr5zvetpHM5360kAcmDPp
         uIOHINEEQPox9QlXMMDRgEx8/SjQTffVoGcEp+nzfjwweZOUx8bi5D7bLiWN5Z+fDFYo
         Y9e2aqcAwyT0MOPz0XeBg52VkLXZWS2ZoEOARt0MghogOSN98pzu+cN4r9FofUDxuIy3
         MK7P/l99UrELxaNa45YJXR9b9R4UjHvDAml6D4/xNXtDP3ZIS0cnCSBuaPUJ4GX9B22G
         uLPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=E18qudaV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jq15-20020ad45fcf000000b0047298eab3f8si8496173qvb.487.2022.07.19.15.09.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jul 2022 15:09:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=E18qudaV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDvPJ-00066Y-3l
	for alex.bennee@linaro.org; Tue, 19 Jul 2022 18:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oDvOy-00066H-Kv
 for qemu-arm@nongnu.org; Tue, 19 Jul 2022 18:09:12 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oDvOx-0007wr-1M
 for qemu-arm@nongnu.org; Tue, 19 Jul 2022 18:09:12 -0400
Received: by mail-ej1-x62d.google.com with SMTP id b11so29752949eju.10
 for <qemu-arm@nongnu.org>; Tue, 19 Jul 2022 15:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4YrdTZoh0vgz9wKbnhQrTgLC0ewY9Sjyrasryc1Fa08=;
 b=E18qudaVvv59szILjLe01nNfFk+TEjVWsOwX6Hc9Sij5sLLjN997CyjBwFUPn1w5wJ
 UoJqpeun5m5ncWepsle788pJU6zVWzweuHJUSGZ6N34RAzzihEctHAEhCul+IvC368ZV
 rkuR+Z7Ch0kQpuSFN03fDFMJ5ZgoBmFag3dI6VFWCqHEjN10IYtDVixpvmWsYlPBenva
 Q/vLy2zuPJddAC/M4i0ZT/0WMNK3HaTGAhvf2mBvH+RabSAAOTWsKM0OaIAeKsZo8tHg
 mWw7EFkuNl4rx3txrgyJVqlmQCxiTuoxfFDBvNmp4vNcsXDUPaOjUlASOTAzbrECFd0L
 I9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4YrdTZoh0vgz9wKbnhQrTgLC0ewY9Sjyrasryc1Fa08=;
 b=j5+VJDomeXHS9ln1gxinMw/UcHNvDwAlnthdVR51arWiFAtI1DdGGXM6cYF3uqF1Vw
 wLGWiHJCkDGmw5mfxWVoWYFfWHN6pfub2btA0RHX+OJ4T+bZDZYDL9r8z/qKuRc0vvq4
 hXmyuB7fonKXXXt8iMvh6ChFSrhhtKLXpKQEEaWkYuKzy/2dr+z8MnxPWvYTigcGRAbo
 zBfOj7eTaLMLMiUn1++HY2GDDbtd5/f6HaoJ9W+/xClfgFV85UX0uWvyhgyQNFeAPuJU
 sYkrBVqKMJFHxo6kVNkwpK/Vj8NiMiPBFajB7lRbO/aWGtbSJ3UU49lWSvaaDTUJo3gl
 6dZg==
X-Gm-Message-State: AJIora8BLE9S/0gZ7SHk0uJ/j+AgtceCcQ3dmo41LozHou5OBh9xtrZW
 GnnAVmeHEIVpS45Giv1d82WxiXnup+fQlw87e+s=
X-Received: by 2002:a17:907:96a4:b0:72b:647e:30fd with SMTP id
 hd36-20020a17090796a400b0072b647e30fdmr31869824ejc.723.1658268549460; Tue, 19
 Jul 2022 15:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAL7npF9T0148jkgTigVfE7cSzH2HKqy0NG0VQtAH2HMXjdBOOg@mail.gmail.com>
 <CAFEAcA8RHhRcrMSO_3MK0hSH=zWzde7S0DHHaLPZf4jOv48RLQ@mail.gmail.com>
 <CAL7npF9hKFsQF18Udi9QFnRZSH-G8cafXHBSBQcrs7jpJmPd7Q@mail.gmail.com>
 <CAFEAcA92=ne8weVYDnLLzNk0+z+aMFJgOJvW_7hSYcY1TimyHw@mail.gmail.com>
 <CAL7npF8Hg7hJBxw9j-1_7GRV_E52KS+hP1WXKfD3+r05C=CBgg@mail.gmail.com>
 <CAFEAcA8tGiaXq+y40-BtdG3jiBJpP=L6x9tsPL_5dF6dr=afEA@mail.gmail.com>
In-Reply-To: <CAFEAcA8tGiaXq+y40-BtdG3jiBJpP=L6x9tsPL_5dF6dr=afEA@mail.gmail.com>
From: Jon Alduan <jon.alduan@gmail.com>
Date: Wed, 20 Jul 2022 00:08:58 +0200
Message-ID: <CAL7npF8d6LZHZtLWe65JiwQW+X-48JxLa2xBoGdxjJJWpKx-Fw@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d5381005e42fbb00"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=jon.alduan@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0gnCIVQnUm00

--000000000000d5381005e42fbb00
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Peter,

I compiled the latest Qemu version with standard options. I did it for the
dynamic qemu-arm option.
Anyway, I get the same result.
If you do not provide the -L option to qemu-arm, where are the arm-libs
which it does need to run?
i.e. *qemu-arm: Could not open '/lib/ld-linux-armhf.so.3': No such file or
directory*
Per default, they are expected to be under "/usr/gnemul/qemu-arm". Do you
have them located there?
Which ld and libc version are you using for building and running the app?
Would it be possible that you provide me these libs and the app you
created? Then, I could try to reproduce this good behavior on my side and
discard possible issues in my environment.

Thank you in advance again for your support.

Best regards
Jon


El mar, 19 jul 2022 a las 14:08, Peter Maydell (<peter.maydell@linaro.org>)
escribi=C3=B3:

> On Tue, 19 Jul 2022 at 12:58, Jon Alduan <jon.alduan@gmail.com> wrote:
> >
> > Hello Peter,
> >
> > this is not what I expected. I did the same as you again to be sure I
> was not missing something. but I get the same bad result (see below)
> > Are you using qemu-arm as static bin or qemu-arm as dynamic bin?
>
> My qemu-arm is a dynamic binary, and the guest binary I compile
> static so I don't have to mess around with guest libraries or the
> QEMU -L option.
>
> -- PMM
>


--=20
j.A

--000000000000d5381005e42fbb00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Peter,</div><div><br></div><div>I compiled the =
latest Qemu version with standard options. I did it for the dynamic qemu-ar=
m option.</div><div>Anyway, I get the same result.</div><div>If you do not =
provide the -L option to qemu-arm, where are the arm-libs which it does nee=
d to run?</div><div>i.e. <i>qemu-arm: Could not open &#39;/lib/ld-linux-arm=
hf.so.3&#39;: No such file or directory</i></div><div>Per default, they are=
 expected to be under &quot;/usr/gnemul/qemu-arm&quot;. Do you have them lo=
cated there?</div><div>Which ld and libc version are you using for building=
 and running the app?</div><div>Would it be possible that you provide me th=
ese libs and the app you created? Then, I could try to reproduce this good =
behavior on my side and discard possible issues in my environment.</div><di=
v><br></div><div>Thank you in advance again for your support.</div><div><br=
></div><div>Best regards</div><div>Jon</div><div><br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">El mar, 19 jul 2=
022 a las 14:08, Peter Maydell (&lt;<a href=3D"mailto:peter.maydell@linaro.=
org">peter.maydell@linaro.org</a>&gt;) escribi=C3=B3:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Tue, 19 Jul 2022 at 12:58, Jon Ald=
uan &lt;<a href=3D"mailto:jon.alduan@gmail.com" target=3D"_blank">jon.aldua=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello Peter,<br>
&gt;<br>
&gt; this is not what I expected. I did the same as you again to be sure I =
was not missing something. but I get the same bad result (see below)<br>
&gt; Are you using qemu-arm as static bin or qemu-arm as dynamic bin?<br>
<br>
My qemu-arm is a dynamic binary, and the guest binary I compile<br>
static so I don&#39;t have to mess around with guest libraries or the<br>
QEMU -L option.<br>
<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">j.A</div>

--000000000000d5381005e42fbb00--
