Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2547044lfk;
        Fri, 19 Nov 2021 08:44:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKRUpcBHVq0bklSiHxfBhY1DabIYVse7MZjLYmNaRxov489CeFvvMreXI2HDU4JuXPPAas
X-Received: by 2002:a67:bc16:: with SMTP id t22mr86027490vsn.10.1637340248128;
        Fri, 19 Nov 2021 08:44:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637340248; cv=none;
        d=google.com; s=arc-20160816;
        b=eo53WVDCPLn7TnlSZXC7dBpTK2K2UTmRU8BCCHSwWUwlLl9biPU+97G/mlFrhp4B/y
         m+GHkHzyjSIcPw09CxNb4eyYyU6aS6V+BCFzadwRDDLT/TZxp1tpDtgkPBc6HUPJNU6f
         xG+Tsb2iCe3cEIM2Q8v0n1S+Y2UsH5oXOYXp8eOL1LkajoWVbA2h3S1QR/TYZJ8iXyLq
         GYHdGxPxFDdgcpaGg7CreDuXMeAD8blF/hbJzEXzoCHGBDV9b8A1R5x0X268bHOGJlwW
         aDgJW67O3MiqRi5F6lGcTTPoWCgUotS3pjas+a/zWRiB0lUkCu6WxebnyAfdPElm4p2r
         9lWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zG2t7zzP01/xi2DcbaU/ZHaTua0kKfaqD1t46wZWq0c=;
        b=vw3EseJ7iRAQFQ5ILXbRszT59qBclv7xmINghroGXX041J39z+rvFluCynuhZchjST
         aIR3Dk9+fKU6vPesCbA+k316TUjLwHzAEDlJlQHV59PROQEEB7b8LoFM66tvhHd8KSl/
         c5WYnWHmoq1OyFjT39oUtMhMSAwrILmznwFWjKRBFnsLkfdjL0tok5+DAkcdfMSD2VsZ
         5DQyw1VdWEerplxrKm2Yy4GmS7RiUbpAHC9n2XvdHmo4J3Ukelw5Qo/9jDmpGjEcoVic
         DmoF7DY3JgUt6oWXFcheNLFYaignCyI82w6ZzGnk9vittC25d6uS6oU1rxZ5bFxb7Ymb
         aHlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=lxEK06Dw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4si838010vse.69.2021.11.19.08.44.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Nov 2021 08:44:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=lxEK06Dw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mo6zf-0001Co-Ey
	for alex.bennee@linaro.org; Fri, 19 Nov 2021 11:44:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1mo6jU-0006lf-2J
 for qemu-arm@nongnu.org; Fri, 19 Nov 2021 11:27:24 -0500
Received: from [2a00:1450:4864:20::130] (port=39751
 helo=mail-lf1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1mo6jS-00065E-2B
 for qemu-arm@nongnu.org; Fri, 19 Nov 2021 11:27:23 -0500
Received: by mail-lf1-x130.google.com with SMTP id f18so45878991lfv.6
 for <qemu-arm@nongnu.org>; Fri, 19 Nov 2021 08:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zG2t7zzP01/xi2DcbaU/ZHaTua0kKfaqD1t46wZWq0c=;
 b=lxEK06DwjPnhfib74vXQOYfFDnzrKOmxgzGhJEPk7rmKNO+G6uAQdS14Zwyc8PzJEP
 ZcWJgKV7zVmNl4pTELKcbmgBmNsUHRwn/Lc4pac9W1voTMpueJ0nanBHPKEEiGzToMZD
 Zx64bQTzTPFgeG7xvaPVI5Ru5yPQNGTlifT1oJXv8IWcGGKFsjzyldN2TFLhSuo7rJtA
 /qX4+KyO1+/n6QhunotGJ5EvZ25AwtqjzD+NxHoLIjVqHYrVeyaBM87HwfkCgEHOC1sY
 24Yd1sVK+Ypna14vMulrFFBm0iYvgiJpn03ot/RyS532J4UACNl9LWMqwLaAP4ej5tRU
 iIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zG2t7zzP01/xi2DcbaU/ZHaTua0kKfaqD1t46wZWq0c=;
 b=qN1458axg7r2J/xMkT4Yvvtd4fvMZzcgcSiLFYTO3lSgkoblJ0qmjqPpfw2GeJq8P5
 D/a3Vkb7ejfgtkTWsF5si38QAZEjhjpnhnt7DoTkqo5C8xI0zHpGeXrJJlRbK15OHQgi
 du50lXGvcFKIq4uYTtW30qCk0pkrYSoiWpFsfkwaKLyWSRNKrvttjtciRsjOUMwGPz3E
 ibFUCsMU1E5f26R3iREwYsNVGJufl4kcG6I4PjCQX840Xnoa5AXcLrX0zX5NRavIca/N
 CZF4SgIutc/5tNfeF9W0qpqgyVfLSuX+sHAx4gnmUty4jEd4Dc5roMHESqe47WVX41Q4
 syew==
X-Gm-Message-State: AOAM532G1zG84Uwg2mRLSW189M3ZzCmnKYnpE+GGsGiKH44craLNhOET
 yp+mBPxd74hkfUJ+aY8LQ6/gpj9CGl6c/Hj+fXM=
X-Received: by 2002:a05:6512:682:: with SMTP id
 t2mr32986691lfe.503.1637339240053; 
 Fri, 19 Nov 2021 08:27:20 -0800 (PST)
MIME-Version: 1.0
References: <CAE=NcrYJfjF-pEiX-tY7NfiTbDfXtcxnk5AnBVwc2AX4cpeCrg@mail.gmail.com>
 <CAFEAcA-CKqZPF8A+WsXE7gLgOPPYncteomvMSOcAuLEkB9F-Ew@mail.gmail.com>
 <CAE=NcrbPW4LVihnZksOCJ6NcQQYkwJudbqrp-sUEx663+qyG5w@mail.gmail.com>
 <CAE=NcrYPqu9oa0UZM7VRDtUqQWg93spVOdRLQGs0hdHtqghGVg@mail.gmail.com>
 <CAFEAcA_uzvNuMx9KJa=Z_Dwuonf10ekTDUbNf9bZSVa+hNtHLg@mail.gmail.com>
 <CAE=NcrY8GJZ-Py0n_24JDao0sJLcYoZ1TSK4RMLfkiWyOxPR3A@mail.gmail.com>
 <CAE=NcrZ3jU2K4a7tqhKxOSGpbEf=9-z6P1vhc=ep6JWXB0zxsA@mail.gmail.com>
 <CAFEAcA-pqkZ8DEC3d0yCeNvoeDtQvdf_s3+SpyeDdOkabCOXVA@mail.gmail.com>
 <CAE=NcraAxKOGGmOKDmugJdt-bzwpUU3dsWo1ZLuhNo6dr95JAA@mail.gmail.com>
 <CAFEAcA84ForLRiAv68ASfuv_vamL-xyNGa1BS4Pp9SzpA3KwJA@mail.gmail.com>
In-Reply-To: <CAFEAcA84ForLRiAv68ASfuv_vamL-xyNGa1BS4Pp9SzpA3KwJA@mail.gmail.com>
From: Janne Karhunen <janne.karhunen@gmail.com>
Date: Fri, 19 Nov 2021 18:27:08 +0200
Message-ID: <CAE=NcraGwxmXnjo+SpUHSkRRGT8TsV6Hfux1knAKWb4RgaP7zQ@mail.gmail.com>
Subject: Re: softmmu 'at' instruction support
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000c7bd2405d126bf91"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::130
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=janne.karhunen@gmail.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rZeQTDjTNza6

--000000000000c7bd2405d126bf91
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri 19. Nov 2021 at 17.59, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 19 Nov 2021 at 14:39, Janne Karhunen <janne.karhunen@gmail.com>
> wrote:
> >
> > I suppose I wasn't entirely clear on the kernel/user mapping split, I
> > just did the second stage and didn't really care about what exactly
> > happens in the guest. Things seemed to be a bit more complicated than
> > I thought as bits above 48/52 were not ignored after all and made all
> > the difference on the table selection. I had the impression it was
> > just the calling context that defined the table to be used.
>
> Calling context defines the "translation regime" to be used;
> some translation regimes support having two virtual address
> ranges and thus two TTBRx registers. (The usual approach at
> the OS level is that you make TTBR0_EL1 cover the userspace
> process's mappings and TTBR1_EL1 cover the kernel's mappings,
> so you can switch processes by changing TTBR0_EL1 only and
> leaving the kernel mappings as-is; but that's not obligatory.)


Yes, I had somewhat simplified this in my mind. Thanks.

Maybe this will now allow us to finish the code making the Linux kernel
properly read only. We=E2=80=99re moving our host kernels to the gigabyte b=
oundary
such that one half can stay genuinely read-only by locking the ro table
mapping with the hypervisor. If this works out quite a lot of the
randomization effort may be much less urgent.


=E2=80=94
Janne

>
>

--000000000000c7bd2405d126bf91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri 19. Nov 2021 at 17.59, Peter Maydell &lt;<a href=3D"mailto:pete=
r.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><div=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-=
left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto">On Fri, 19 Nov 20=
21 at 14:39, Janne Karhunen &lt;<a href=3D"mailto:janne.karhunen@gmail.com"=
 target=3D"_blank">janne.karhunen@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I suppose I wasn&#39;t entirely clear on the kernel/user mapping split=
, I<br>
&gt; just did the second stage and didn&#39;t really care about what exactl=
y<br>
&gt; happens in the guest. Things seemed to be a bit more complicated than<=
br>
&gt; I thought as bits above 48/52 were not ignored after all and made all<=
br>
&gt; the difference on the table selection. I had the impression it was<br>
&gt; just the calling context that defined the table to be used.<br>
<br>
Calling context defines the &quot;translation regime&quot; to be used;<br>
some translation regimes support having two virtual address<br>
ranges and thus two TTBRx registers. (The usual approach at<br>
the OS level is that you make TTBR0_EL1 cover the userspace<br>
process&#39;s mappings and TTBR1_EL1 cover the kernel&#39;s mappings,<br>
so you can switch processes by changing TTBR0_EL1 only and<br>
leaving the kernel mappings as-is; but that&#39;s not obligatory.)</blockqu=
ote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, I had somewhat simpl=
ified this in my mind. Thanks.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Maybe this will now allow us to finish the code making the Linux ker=
nel properly read only. We=E2=80=99re moving our host kernels to the gigaby=
te boundary such that one half can stay genuinely read-only by locking the =
ro table mapping with the hypervisor. If this works out quite a lot of the =
randomization effort may be much less urgent.</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">=E2=80=94</div><div dir=
=3D"auto">Janne</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1e=
x;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
</blockquote></div></div>

--000000000000c7bd2405d126bf91--
