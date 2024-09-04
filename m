Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp80434njb;
        Wed, 4 Sep 2024 04:20:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUsBQc4RizlWb4QHQkVvRnxRXBT1+hF+AmXA21WF+JwBYC3hT5eT5f85waBWkbv2VC5csLJLClMcaa4+g==@linaro.org
X-Google-Smtp-Source: AGHT+IEdzh1InZb+JmsRcHPTuZczcqiUzvSaUikYE6wuHlFfo1TKxzyzo9/7PEhNMjQ4LjTthd2U
X-Received: by 2002:a05:6214:3283:b0:6c3:64ec:fe4d with SMTP id 6a1803df08f44-6c364ed0052mr99623986d6.42.1725448813897;
        Wed, 04 Sep 2024 04:20:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725448813; cv=none;
        d=google.com; s=arc-20160816;
        b=h9W4ZJnS0XFmOnnLB9rr2h3THgqeioRtB7fquKWqMc0LXZOzdVspCOekeAc2GnmBeW
         4ZQpOmYzTqi0uk+9tZEBIhi0AmWMTeaiay6oy4jkWSWbylf4dMzYQI/xaf8rYfuQUDQD
         dM2OCXZzmiAM5MSP0oaf50npLGfB2QGvQZWvODm3UnDbNEGcNznxfGKXIYiSHSssnWeq
         dtuLRKgAfuCTtvlZjMgNJ6SjNZ0oaU5rJmnCYNkGYQFr+KZ3RoedlYraSAbmlAWYIGb5
         PDaBeK33VAOPgunF2YcJuZuWTCEmSHCRoKElFW+qZbbP8ZTh+Yuso72jCNHUBROhMKdn
         Bh/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4aVXANGKcY1vRL0Aj3+SYG7ovQJCNC4fljz9df9NtVk=;
        fh=rpzeOfm9IFHZcKRY7+Fmxyjswk6pT/Ul+6bpb+rjg/o=;
        b=e54PvLpNnQGF4XNtVYuo5qwm7cvo87grjAUmN13vf5A2mLFzmNoljz6inWJAYdGxCP
         JHCEkpTWQaE0D4clTn7JKn+NMRn/ypr9BY0tRqa7o4Qsc/wYwMxauP1+OqnVRPf3RZod
         Q4512/j5oMh1CDze9krkE3KEYhXD1TQXeitkJ3RlPqvTnd81d9K1rslyq5WNaFl0cfpZ
         d/yWdNYZgQw4iG1sh3Wh9Cg/bXZYY5i73WGLvQzQNDumRM4+QCbMd+ILLeSUFoqXoW3L
         GxByc3LgvpDEUIvBzA0QpuYGobK5TtWEvZ0qryd+RWeMdmMJ+UnAqS0ySNqK6/fWrSkl
         n6lw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=YOQuFyum;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682d3d549si147689521cf.292.2024.09.04.04.20.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2024 04:20:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=YOQuFyum;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slo3R-00019b-Qa; Wed, 04 Sep 2024 07:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slo3K-0000jb-OH; Wed, 04 Sep 2024 07:20:00 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slo3I-0008LD-Ha; Wed, 04 Sep 2024 07:19:58 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7143165f23fso5126252b3a.1; 
 Wed, 04 Sep 2024 04:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725448794; x=1726053594; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4aVXANGKcY1vRL0Aj3+SYG7ovQJCNC4fljz9df9NtVk=;
 b=YOQuFyumDrZdCAdJMBJ3GfXV3SGbIf7N708FpyER/vAiTW3c1+wLQOT2DM38XUTPFe
 q6hml4wBV0r3WqEu/9OswPmrOQA4WU1CZNgDGGfLecQsviWFabqVCrpXVrjD3UWtEUjC
 PbCYfAJQnyKq+lG9HrzmfRjbdivJV0ay+IUxrsjSKUaGA46T5wLXr4yl8CfXDfp1g9j5
 7UnTF3ByGt39CyRaIwJaz7G2FI0YfknuVMr1pOuRMK+4myVt6mRHJnsalOPNUPVEQaUD
 do+/0+IcxPA0wFssOvSMImIbukWV8y7kkJ0NneYYxYl2ZqpP+wZDTZVMjEy7ar7V9wWO
 gL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725448794; x=1726053594;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4aVXANGKcY1vRL0Aj3+SYG7ovQJCNC4fljz9df9NtVk=;
 b=gdShiv71RHQM0Gr0Yx2q1wTmeHVAT186KlrUePSJY+M0J8pIQ6yaTgiMeVubeZPs3p
 3h/f9OD2m5KesPoxc0aXIRV06g/OqeLgrSCbm5wQEPk5VOSbGT6LbKy1Jg9aLwG4W/bK
 Iib2s0JvQu8rqTiOarCCFtRtXoA+p0ui7HbXgiwkBPkxtsbuq6pauFfULkQrM3WH/F3N
 k3Pz9vYFY/ALE5jbGRyRLuzROrnL14RU7mtqSjBDxRKZ81BI5wivZBDFP1huzpgHfX+9
 UqcEcCj/TSTujwdiUm+zUYUnFKhschezGbP/Izs5uSZPthbVsZ9VKv+VMiJBLD9Xmumz
 SnRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1T1x9AE8MfIUlG0Vg9cPUtwYL3rBNb2YxWu43KOspDvyAkYdN7tNjrLfgskWe4EKGLzEM90L1tg==@nongnu.org,
 AJvYcCVVYw9muLA5YYiU4wI0Xs28OIzJjVZN4NV2x0GyI6U2WvBcjYUpG2pHewjtFRWbn/MW0u2Z+7GHIY3GXEQJ@nongnu.org
X-Gm-Message-State: AOJu0Yx/4IsI13jn9hPMhvTc235tmHxphVjGTAZx6hXfBncUOu7DMfMK
 897dn5vg8FHSlg9Y99uEeTle9j/hqg6xdcS9R4CAplMM1vkHDTRj9UeYJ/WOoYfeYJ/bBGSiFy1
 nxavRQlYbAVuDWf7KK5qn7jtD3EALzfnaAn8=
X-Received: by 2002:a05:6a20:9f08:b0:1c0:ec1c:f4a5 with SMTP id
 adf61e73a8af0-1ced04bd8aamr13997975637.25.1725448794108; Wed, 04 Sep 2024
 04:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <CA+1FSigiu8xXF1OPs1oSPS7LiGe23gsN73RwPpJUYH=X5EkTRQ@mail.gmail.com>
 <CA+1FSiiH9LP-7UupNLjDyZJGqJAHAjN2nSLFm9fCx=ZNphxGoQ@mail.gmail.com>
 <CA+1FSih6t-Ccnxh1GvOFMf9pMjcfV1V+yyJHV=ZH0c2RY0Kjng@mail.gmail.com>
 <268989a3-cd5c-41fc-ba0d-5eb71bc6e9dc@linaro.org>
 <CA+1FSijygoVZmTkYR8Xoob4yQQdf9o3CZ2-LmzDrBh2e0VaerQ@mail.gmail.com>
 <CA+1FSigOmKen0QPKSEQqt15Zzrx4UFSCpj+5DJMCJtGnFcE+Hw@mail.gmail.com>
 <CA+1FSijfe+5V4RHs-1ow2JwAeiKcmW31V2Ddx9a9zxb_kybDFg@mail.gmail.com>
 <70b240aa-98de-4998-8c1b-34349fc831ba@linaro.org>
 <CA+1FSiiyb2v7oy43exRuY7kQpLgUcEifAE2zrEtpYPkgAY+TRw@mail.gmail.com>
 <6eac1f19-59a2-440a-a5b3-f4d9654ba539@linaro.org>
 <CA+1FSigjog5DO4UJ4bjo+rvtRc2ih+yJF0q9HM7y6N=aSg6w=A@mail.gmail.com>
 <CA+1FSijxZ5Ocic-aGTikNxr_faS54fP=P+2uuCxfypMJKEE2aQ@mail.gmail.com>
 <2eeb9049-3444-49e0-892e-7022ab045647@linaro.org>
 <CA+1FSigoFF_FSKSGbs4jOyya6DJrEH9O0MMV84+XowZ7RkmFNw@mail.gmail.com>
 <faf8ceb4-d04f-45d8-85e3-5cfa09747b1c@linaro.org>
In-Reply-To: <faf8ceb4-d04f-45d8-85e3-5cfa09747b1c@linaro.org>
From: Mario Marietto <marietto2008@gmail.com>
Date: Wed, 4 Sep 2024 13:19:17 +0200
Message-ID: <CA+1FSijORakuqhwiU-juACBtgbgQKHwV7sd+1Fd6vsBA1TtZ-Q@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000737e280621495ab9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=marietto2008@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gulVobxotunS

--000000000000737e280621495ab9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> There are only 3 small patches, barely changing UI size and buttons.

Are you sure ? I see a lot of modifications :

https://github.com/antmicro/kvm-aosp-qemu/commit/5c24bce3056ff209a1ecc50ff4=
b7e65b85ad8e74

On Wed, Sep 4, 2024 at 12:47=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> On 4/9/24 12:13, Mario Marietto wrote:
> > -> What do you mean by "qemu patched"?
> >
> > Isn't this version of qemu :
> >
> > https://github.com/antmicro/kvm-aosp-qemu/releases/tag/5.0.0-kvm-aosp
> > <https://github.com/antmicro/kvm-aosp-qemu/releases/tag/5.0.0-kvm-aosp>
> >
> > properly patched or adapted,I don't know how to define it,to boot
> > Android 10 on the Jetson Nano ?
> >
> > -> Hopefully you are right, but unlikely:
> >  >
> >
> https://github.com/antmicro/kvm-aosp-qemu/compare/fdd76fecdd...5.0.0-kvm-=
aosp
> <
> https://github.com/antmicro/kvm-aosp-qemu/compare/fdd76fecdd...5.0.0-kvm-=
aosp
> >
> >
> > What do you mean with "Hopefully you are right,but unlikely" ?
>
> There are only 3 small patches, barely changing UI size and buttons.
>
> >
> >
> > On Wed, Sep 4, 2024 at 11:54=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
> > <philmd@linaro.org <mailto:philmd@linaro.org>> wrote:
> >
> >     On 3/9/24 22:52, Mario Marietto wrote:
> >      > Unfortunately the usage of qemu patched to boot Android 10 on th=
e
> >     Jetson
> >      > nano didn't change anything. I get the same exact errors as
> >     before. :(
> >
> >     What do you mean by "qemu patched"?
> >
> >
> >
> > --
> > Mario.
>
>

--=20
Mario.

--000000000000737e280621495ab9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span class=3D"gmail-im">&gt; </span>
There are only 3 small patches, barely changing UI size and buttons.</div><=
div><br></div><div>Are you sure ? I see a lot of modifications :<br></div><=
div><br></div><div><a href=3D"https://github.com/antmicro/kvm-aosp-qemu/com=
mit/5c24bce3056ff209a1ecc50ff4b7e65b85ad8e74">https://github.com/antmicro/k=
vm-aosp-qemu/commit/5c24bce3056ff209a1ecc50ff4b7e65b85ad8e74</a></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On We=
d, Sep 4, 2024 at 12:47=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:philmd@linaro.org">philmd@linaro.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On 4/9/24 12:13, Mario Marie=
tto wrote:<br>
&gt; -&gt; What do you mean by &quot;qemu patched&quot;?<br>
&gt; <br>
&gt; Isn&#39;t this version of qemu :<br>
&gt; <br>
&gt; <a href=3D"https://github.com/antmicro/kvm-aosp-qemu/releases/tag/5.0.=
0-kvm-aosp" rel=3D"noreferrer" target=3D"_blank">https://github.com/antmicr=
o/kvm-aosp-qemu/releases/tag/5.0.0-kvm-aosp</a> <br>
&gt; &lt;<a href=3D"https://github.com/antmicro/kvm-aosp-qemu/releases/tag/=
5.0.0-kvm-aosp" rel=3D"noreferrer" target=3D"_blank">https://github.com/ant=
micro/kvm-aosp-qemu/releases/tag/5.0.0-kvm-aosp</a>&gt;<br>
&gt; <br>
&gt; properly patched or adapted,I don&#39;t know how to define it,to boot =
<br>
&gt; Android 10 on the Jetson Nano ?<br>
&gt; <br>
&gt; -&gt; Hopefully you are right, but unlikely:<br>
&gt;=C2=A0 &gt; <br>
&gt; <a href=3D"https://github.com/antmicro/kvm-aosp-qemu/compare/fdd76fecd=
d...5.0.0-kvm-aosp" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/antmicro/kvm-aosp-qemu/compare/fdd76fecdd...5.0.0-kvm-aosp</a> &lt;<a href=
=3D"https://github.com/antmicro/kvm-aosp-qemu/compare/fdd76fecdd...5.0.0-kv=
m-aosp" rel=3D"noreferrer" target=3D"_blank">https://github.com/antmicro/kv=
m-aosp-qemu/compare/fdd76fecdd...5.0.0-kvm-aosp</a>&gt;<br>
&gt; <br>
&gt; What do you mean with &quot;Hopefully you are right,but unlikely&quot;=
 ?<br>
<br>
There are only 3 small patches, barely changing UI size and buttons.<br>
<br>
&gt; <br>
&gt; <br>
&gt; On Wed, Sep 4, 2024 at 11:54=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <b=
r>
&gt; &lt;<a href=3D"mailto:philmd@linaro.org" target=3D"_blank">philmd@lina=
ro.org</a> &lt;mailto:<a href=3D"mailto:philmd@linaro.org" target=3D"_blank=
">philmd@linaro.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 3/9/24 22:52, Mario Marietto wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Unfortunately the usage of qemu patched to bo=
ot Android 10 on the<br>
&gt;=C2=A0 =C2=A0 =C2=A0Jetson<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; nano didn&#39;t change anything. I get the sa=
me exact errors as<br>
&gt;=C2=A0 =C2=A0 =C2=A0before. :(<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0What do you mean by &quot;qemu patched&quot;?<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Mario.<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--000000000000737e280621495ab9--
