Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3102615wrv;
        Sun, 14 Jul 2019 08:40:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwxlCrO9mmxk0AJ3XnlduMsHNhbvS3fybExc7SBxQU7qKMiJmJuuKWwT4S3y+foT0DAVFrq
X-Received: by 2002:a17:906:5c4a:: with SMTP id c10mr16381918ejr.15.1563118825484;
        Sun, 14 Jul 2019 08:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563118825; cv=none;
        d=google.com; s=arc-20160816;
        b=Qxlwcd5Bi90/sWCk5DNHRnvNzM1sLBunjiPeKRpredsRCkpD9+t38l1GHIO24htRX0
         ozhWwAEQ83yXaT7ynnX9JKS20BajK8uNDMqisU7Re9PD5rBmoXhTqAeTSWJjC3/0GkPV
         ++q17o4CH3LFT8zx/PRe20EQPwJimEJ181NNN1oJTo6T5n/nVP02LVpNBofL6NxDRKLN
         qDyt6YHRI5lPA9wvVvQP7xTr97ofmcpN1CwYBFst51AbOEXSa/hH2c//4FdBKeDZN6wb
         pagtRqiIJWuPeVrimQ5PcgtueDmIiiwjbDJHDM5F11BMV5RxEHZ7T+Et2MnNMpFt5FPN
         cSJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ze3KVudLrBGvIef9Y9ql9VL/shPv2tJVaBI50kDaR+w=;
        b=kz0hEBItXScZblvU0ciRuK2tzGRAllQKswyJBypwNactfNOOQuj9nlFO0Vvj1m3pED
         8jSiwbrJyupNIlLk0FrYkk9Yfo0+YN1j3Pm42KRuE49jTTH+VA2jQaeWkPVPktoRCTmY
         fu4KoEenBVE0mA3HbEDJE7GIsWIEJQg+55bjmrPZJ9CYaFM7mhiUuYrCK2MRj/h17YCX
         t7j8hj7BzUCXFZsa03Rg1OX5NH+icfyq9ti5fLblVLLyEOuA/DoR1YJeeZGCTuRyeepn
         /QEEY1dNljM9tQ0GqKFmais80vanpCYqBU3ZKTC0KOTS0UjNKT1c/aWLcTVy+r5P+vOW
         zKzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MFMNiovO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w21si6170109ejb.254.2019.07.14.08.40.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Jul 2019 08:40:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MFMNiovO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hmgbw-00051C-9c
	for alex.bennee@linaro.org; Sun, 14 Jul 2019 11:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38046)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <radoslaw.biernacki@linaro.org>) id 1hmgbs-0004wN-Bt
 for qemu-arm@nongnu.org; Sun, 14 Jul 2019 11:40:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <radoslaw.biernacki@linaro.org>) id 1hmgbr-0007dp-C6
 for qemu-arm@nongnu.org; Sun, 14 Jul 2019 11:40:20 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:45688)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <radoslaw.biernacki@linaro.org>)
 id 1hmgbr-0007cm-3f
 for qemu-arm@nongnu.org; Sun, 14 Jul 2019 11:40:19 -0400
Received: by mail-yb1-xb44.google.com with SMTP id s41so2667949ybe.12
 for <qemu-arm@nongnu.org>; Sun, 14 Jul 2019 08:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ze3KVudLrBGvIef9Y9ql9VL/shPv2tJVaBI50kDaR+w=;
 b=MFMNiovOpcuz0jSsG/Vi5gD9mzPTzkHeK4fGdGhA+QrHPni6ZZEeW6jCVdpL7RPKGG
 BRCDHMZvDUSO8tmurfTtPNgy2pYD947xjSUpfOpQO8t0ajsa3YUhh4FwNfoKINN3y7/B
 eB/BF/Fn5c0OfsAdVaYIo/Ng9tRIp+UEd9lMv9c8R4as2eWQFvcAx+5gsFZctEG3pCdo
 Q1IuG/DQDGjMZ+khvyXGTdw7T748ZXW0h/LtiPLedSOjdKx71mwSrK8JDlmxi9xBpEMg
 UPKxPqnLj3d10yEpYvDTsg1/ZbwKhLiHLXHYgYLAQSlLqCpwHftCiaJRdhl/AhUhz6ma
 6TMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ze3KVudLrBGvIef9Y9ql9VL/shPv2tJVaBI50kDaR+w=;
 b=l87CIkbBfPkGAY4a811ZxyU9IFyQk9i4RhvC7WT2TQiI2kh+kdebVP1e4laUFpL9cj
 Pp4Bo4kprsFGW74bziM/15lEQGTeg3WI30nPuqZ0UcKqeApVTmu7h+OWAWp4I60H4TjE
 Kkj/qeZp8uee/TZ4VyAG1zJhKnW7a1vb7+sWxapf9DibClBxL0EfIiwavl1FkSMB2hXy
 gBkBF39CFtYLhL4mi27hsrWAmIXcbmrFG13hrllzIo+T7ZZUOcPjqCHgPK9YV1Bjxysr
 k6Sdh58Kd73xCqzPTK1OVp9yM/rD5XR8zGHG1i6BZCqSRdCWOYdgFWIalyJ3IIIiRvFD
 Z6QA==
X-Gm-Message-State: APjAAAVV9I9036/t/A5g5/S8rlmjIwClbb1vBYCpjSFFYenSIT99625+
 KXiYXe0bzkIkhy7qAr5QHGFSg1yAf8af+CYiIwCAOw==
X-Received: by 2002:a25:5e88:: with SMTP id
 s130mr13118946ybb.134.1563118817148; 
 Sun, 14 Jul 2019 08:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <1561890034-15921-1-git-send-email-hongbo.zhang@linaro.org>
 <20190714152010.GA28247@roeck-us.net>
In-Reply-To: <20190714152010.GA28247@roeck-us.net>
From: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Date: Sun, 14 Jul 2019 17:40:05 +0200
Message-ID: <CAEK-wKk+1RQRmFOy8Rp+6fsOaZvzJvXSPNnyTKFY-7c-_VYSXw@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: multipart/alternative; boundary="000000000000d6950e058da5f586"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b44
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
X-TUID: Nt92gqP5AnLf

--000000000000d6950e058da5f586
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This machine is not ment for direct kernel boot. Is main purpose is
development of FW, kernel and other HW/SW parts for SBSA. We are currently
working on UEFI and ATF for this machine.

It might be somehow possible to run kernel with DT but we do not support it
at this moment. If all you want is to boot kernel directly, it is far
more convenient to use existing virt machine.

niedz., 14 lip 2019, 17:20 u=C5=BCytkownik Guenter Roeck <linux@roeck-us.ne=
t>
napisa=C5=82:

> Hi,
>
> On Sun, Jun 30, 2019 at 06:20:32PM +0800, Hongbo Zhang wrote:
> > For the Aarch64, there is one machine 'virt', it is primarily meant to
> > run on KVM and execute virtualization workloads, but we need an
> > environment as faithful as possible to physical hardware,  to support
> > firmware and OS development for pysical Aarch64 machines.
> >
>
> I tried to boot linux on this machine with -kernel command line argument,
> but have not been successful. Can someone point me to a working command
> line, one that lets me load the kernel directly ?
>
> Thanks,
> Guenter
>

--000000000000d6950e058da5f586
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This machine is not ment for direct kernel boot. Is main =
purpose is development of FW, kernel and other HW/SW parts for SBSA. We are=
 currently working on UEFI and ATF for this machine.<div dir=3D"auto"><br><=
/div><div dir=3D"auto"><div dir=3D"auto" style=3D"font-family:sans-serif">I=
t might be somehow possible to run kernel with DT but we do not support it =
at this moment. If all you want is to boot kernel directly, it is far more=
=C2=A0convenient to use existing virt machine.</div></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">niedz., 14 lip 20=
19, 17:20 u=C5=BCytkownik Guenter Roeck &lt;<a href=3D"mailto:linux@roeck-u=
s.net">linux@roeck-us.net</a>&gt; napisa=C5=82:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hi,<br>
<br>
On Sun, Jun 30, 2019 at 06:20:32PM +0800, Hongbo Zhang wrote:<br>
&gt; For the Aarch64, there is one machine &#39;virt&#39;, it is primarily =
meant to<br>
&gt; run on KVM and execute virtualization workloads, but we need an<br>
&gt; environment as faithful as possible to physical hardware,=C2=A0 to sup=
port<br>
&gt; firmware and OS development for pysical Aarch64 machines.<br>
&gt; <br>
<br>
I tried to boot linux on this machine with -kernel command line argument,<b=
r>
but have not been successful. Can someone point me to a working command<br>
line, one that lets me load the kernel directly ?<br>
<br>
Thanks,<br>
Guenter<br>
</blockquote></div>

--000000000000d6950e058da5f586--
