Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3369665wrv;
        Sun, 14 Jul 2019 15:08:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxud5CTKzMTISRhnqyeaw1lu0S6R1uYE6QTjH84VnMZzsnBTKQTH1+NlOqRQLkwIt1ezUhM
X-Received: by 2002:a50:9167:: with SMTP id f36mr19982304eda.297.1563142137273;
        Sun, 14 Jul 2019 15:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563142137; cv=none;
        d=google.com; s=arc-20160816;
        b=qujfQYd9KKoElaOHQIhJtLRzGgDfjmT0pXQtViFPGOpNkyVnFdnfpECJfjkPGxydN/
         MtMGaw3y+hh416+JLvOJnzuoFK0aL29VHC8LJC4RyK/yC5eXdHa47ovwwXx2TReGn9nC
         mq6zuznWh5Up199BOA7MwzPRjXE5ubxiezkWdl21kYZ+fjYFZfTZGIKcA2dNdNvydugP
         6xOA11nWeT3dohXIce5shGld8EYZKPuYmISvw2wBTdGCx/Auiz7eyGpN0xmoSQMf46PV
         N06BjQ+XK5Aq47WsqhLKg02NSuo/cIgn9fp7pAtxf3xF4zQCWzqSjub70bp6+gxzDZKU
         d5fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v1vLA6NnRH2WUz9EzwXQmezKfms1ODS+chrkpicTKPI=;
        b=ctwFfF1J8Z9svfrKROCLLEH2YtY8Uvq2PmDw74SDaTwPsTjQ7mKbTDCD24o9T331uf
         F1KiJn+HWK+9pw2oiBNLddxfmhxBKC/H/5LL4sW8qcjfWslIWO7LCHYVwTjkmIFjGpvM
         xOXY55PGRYR4tv4vNN3lk+tpfBlRvzbc62WtZHf2zlM4w/lKPl8DcWljRrVBtah3ELq/
         SE2YewCAlffJP1hGMhjLRPl99V8bVSaf0WAWIXm2gNy4UbsATLHtX+ObL3mHE+vY5Njk
         pOvmrQFwRaZTbsmFTr/zlx2/R1eHf363vsCaFnLoN3S7cI2fBQ/F8laxsyKBpZnYCTsX
         m0kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oYincNxf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e2si7698145ejc.257.2019.07.14.15.08.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Jul 2019 15:08:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oYincNxf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hmmfw-0001W8-2h
	for alex.bennee@linaro.org; Sun, 14 Jul 2019 18:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47101)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <radoslaw.biernacki@linaro.org>) id 1hmmfs-0001VW-Aw
 for qemu-arm@nongnu.org; Sun, 14 Jul 2019 18:08:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <radoslaw.biernacki@linaro.org>) id 1hmmfr-0001Gu-4A
 for qemu-arm@nongnu.org; Sun, 14 Jul 2019 18:08:52 -0400
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:32901)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <radoslaw.biernacki@linaro.org>)
 id 1hmmfq-0001GC-Rt
 for qemu-arm@nongnu.org; Sun, 14 Jul 2019 18:08:51 -0400
Received: by mail-yw1-xc42.google.com with SMTP id l124so6774701ywd.0
 for <qemu-arm@nongnu.org>; Sun, 14 Jul 2019 15:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v1vLA6NnRH2WUz9EzwXQmezKfms1ODS+chrkpicTKPI=;
 b=oYincNxfLuJVVdvqFEIcU+/w1WUd2fhgnNCCs2e0ebj009s96LvUzFADxLcX6xI/HW
 LN4/gtLDyox5hxy+I+LSEG8NMNmvErkelP8rp8LcABCBR/DQ905BJ6B/+xCpW0FssiQm
 pVcD+g2IGM5dLOb+La5hw6CGR++hp0EA+XTy4mOZjOlHDalr8/qC/VU5mGP9zkc42mlX
 fBeR92qGLc364x6596kNWRcA6KY4TWEoOI4bWJeOjQ9rlbKeKuoaKKhAIFKLAyUd0v1L
 9zJCLrgBMQ1Mq0Zr0x3RgJGJsTtgBkKCVHWnJwkkETTa1BmYRpX4Cm3hYeQtgSRT+PKx
 aeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v1vLA6NnRH2WUz9EzwXQmezKfms1ODS+chrkpicTKPI=;
 b=C4pma8ubEjNM+dZe4ItyVvNzHZvaIZwiM5oGKiP7Y8W6qCS/caRd6tWIMY6g0btnqx
 56fOu6Bi5JLVgxS9DnhN9uaPLd6jNmWS9fL6zve/ZpqGm/pctvP9TlJr05HBmdLmmVzn
 XdG46iPdTa79cKpZbJIRNwRhnmaO8jJ3s4wN1N5Pv5M2hgNKD5d3gNlXbulx0mAcyykl
 wW+KUWhh/qBd+BaPyBnrRzXtvnpGNyQ2ZBxQqtuNcB0RXmqSkP6Mly+1FS7k8yq8J1EP
 rdquS+22J55gPYqoqV7mYX82ZMjVLLpp2XWFT5fmFfdN/s7ECOmzMzrYj23lmB/kUw5f
 aowg==
X-Gm-Message-State: APjAAAWdpJ7Pt2K23EhewT8yyMfNA77mJH5cN+2GRz0lv+cJg0GcGPeb
 87IW14M8F7EPYOW9riEE3UAIcYnhp85GkyPgzRK9Xg==
X-Received: by 2002:a81:1f42:: with SMTP id f63mr12338043ywf.184.1563142129917; 
 Sun, 14 Jul 2019 15:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <1561890034-15921-1-git-send-email-hongbo.zhang@linaro.org>
 <20190714152010.GA28247@roeck-us.net>
 <CAEK-wKk+1RQRmFOy8Rp+6fsOaZvzJvXSPNnyTKFY-7c-_VYSXw@mail.gmail.com>
 <bfc94fff-e84f-c07f-322d-d9430048512c@roeck-us.net>
In-Reply-To: <bfc94fff-e84f-c07f-322d-d9430048512c@roeck-us.net>
From: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Date: Mon, 15 Jul 2019 00:08:38 +0200
Message-ID: <CAEK-wK=6hrj-OCFcn+uJpAuPM9chZL2w4tXGdu9=FENuXsA6Rw@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: multipart/alternative; boundary="00000000000063365c058dab635a"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c42
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 0/2] Add Arm SBSA Reference
 Machine
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
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, ard.biesheuvel@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 leif.lindholm@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UUrzhUBMkX3l

--00000000000063365c058dab635a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If running full machine stack is an option, than I think that you will be
able to use SBSA machine in your tests once we have all the FW images
ready. But unfortunately we are not there yet.


niedz., 14 lip 2019, 23:57 u=C5=BCytkownik Guenter Roeck <linux@roeck-us.ne=
t>
napisa=C5=82:

> On 7/14/19 8:40 AM, Radoslaw Biernacki wrote:
> > This machine is not ment for direct kernel boot. Is main purpose is
> development of FW, kernel and other HW/SW parts for SBSA. We are currentl=
y
> working on UEFI and ATF for this machine.
> >
> > It might be somehow possible to run kernel with DT but we do not suppor=
t
> it at this moment. If all you want is to boot kernel directly, it is far
> more convenient to use existing virt machine.
> >
>
> Too bad. As you may know, I am testing the Linux kernel by running it wit=
h
> as many qemu
> machines as possible. I already run several boot tests with the 'virt'
> machine, and
> I was trying to extend test coverage with the sbsa machine.
>
> Guenter
>
> > niedz., 14 lip 2019, 17:20 u=C5=BCytkownik Guenter Roeck <linux@roeck-u=
s.net
> <mailto:linux@roeck-us.net>> napisa=C5=82:
> >
> >     Hi,
> >
> >     On Sun, Jun 30, 2019 at 06:20:32PM +0800, Hongbo Zhang wrote:
> >      > For the Aarch64, there is one machine 'virt', it is primarily
> meant to
> >      > run on KVM and execute virtualization workloads, but we need an
> >      > environment as faithful as possible to physical hardware,  to
> support
> >      > firmware and OS development for pysical Aarch64 machines.
> >      >
> >
> >     I tried to boot linux on this machine with -kernel command line
> argument,
> >     but have not been successful. Can someone point me to a working
> command
> >     line, one that lets me load the kernel directly ?
> >
> >     Thanks,
> >     Guenter
> >
>
>

--00000000000063365c058dab635a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>If running full machine stack is an option, than I t=
hink that you will be able to use SBSA machine in your tests once we have a=
ll the FW images ready. But unfortunately we are not there yet.</div><div d=
ir=3D"auto"><br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr=
" class=3D"gmail_attr">niedz., 14 lip 2019, 23:57 u=C5=BCytkownik Guenter R=
oeck &lt;<a href=3D"mailto:linux@roeck-us.net">linux@roeck-us.net</a>&gt; n=
apisa=C5=82:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 7/14/19 8:40 AM, Ra=
doslaw Biernacki wrote:<br>
&gt; This machine is not ment for direct kernel boot. Is main purpose is de=
velopment of FW, kernel and other HW/SW parts for SBSA. We are currently wo=
rking on UEFI and ATF for this machine.<br>
&gt; <br>
&gt; It might be somehow possible to run kernel with DT but we do not suppo=
rt it at this moment. If all you want is to boot kernel directly, it is far=
 more=C2=A0convenient to use existing virt machine.<br>
&gt; <br>
<br>
Too bad. As you may know, I am testing the Linux kernel by running it with =
as many qemu<br>
machines as possible. I already run several boot tests with the &#39;virt&#=
39; machine, and<br>
I was trying to extend test coverage with the sbsa machine.<br>
<br>
Guenter<br>
<br>
&gt; niedz., 14 lip 2019, 17:20 u=C5=BCytkownik Guenter Roeck &lt;<a href=
=3D"mailto:linux@roeck-us.net" target=3D"_blank" rel=3D"noreferrer">linux@r=
oeck-us.net</a> &lt;mailto:<a href=3D"mailto:linux@roeck-us.net" target=3D"=
_blank" rel=3D"noreferrer">linux@roeck-us.net</a>&gt;&gt; napisa=C5=82:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Sun, Jun 30, 2019 at 06:20:32PM +0800, Hongbo Zh=
ang wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; For the Aarch64, there is one machine &#39;vi=
rt&#39;, it is primarily meant to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; run on KVM and execute virtualization workloa=
ds, but we need an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; environment as faithful as possible to physic=
al hardware,=C2=A0 to support<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; firmware and OS development for pysical Aarch=
64 machines.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I tried to boot linux on this machine with -kernel =
command line argument,<br>
&gt;=C2=A0 =C2=A0 =C2=A0but have not been successful. Can someone point me =
to a working command<br>
&gt;=C2=A0 =C2=A0 =C2=A0line, one that lets me load the kernel directly ?<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Guenter<br>
&gt; <br>
<br>
</blockquote></div></div></div>

--00000000000063365c058dab635a--
