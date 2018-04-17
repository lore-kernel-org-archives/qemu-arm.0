Received: by 10.28.4.212 with SMTP id 203csp4289554wme;
        Tue, 17 Apr 2018 14:27:20 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49aeEe0xWE3EJfO0c3+9aNAS1eJeIQRrHmnBPWorkRsFAZJH14mN8PaZuUmt5chszlAiGlF
X-Received: by 10.200.15.17 with SMTP id e17mr3915915qtk.261.1524000440013;
        Tue, 17 Apr 2018 14:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524000440; cv=none;
        d=google.com; s=arc-20160816;
        b=tdAEGLXT3IH5kgyAWbkpRyxR92aHcfu5r8OwDki8dqM7JQ1ZN+fZkenqOZgd3XdZJ9
         A4fY+A4eFRKYEKx98ikFn+4AcGROFcDqktHTcaoqaVzdPizK7WFUXuEzIaxvXT9RO9sP
         SqAu2s6DmkMyDwI7wjBv/DcmdXwBwqemNHZOx/op+M2qnUSk18nu7F+r/54o4rudUtVJ
         HN3VafFQO/6M7YZqCB0F/iKNh4PFzzwHjgqmk+sPD54rKLWckq6XyqmnHMwjuGvJRhsj
         CroDD462U1Wm0lviDXXbxseRZWw3WJqUFf2OaUDxwNv8ZQCwl4GM4f9zwWUvp59G14oF
         Kh2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=XpQ7TfHvL5DywncTIPn0kDqOY75Opyz6Vgs0kTX49wA=;
        b=e/d5L9bUaNgAIlnLvr5SsFE6Ob+tOKMZsioEW3cISAW2+hJIJr5sudBwBkoaTp3ySO
         JOm5gW+m4COyfyC/sSeT3ISapvIvIsWNd5nHc56OQ1XhEEdn6c5+eNbf48v8uRfurBPJ
         n6PnYfkuXaDyk6fzgshGv3BKqkgMoiAyuUbvF6W9KT0CTdObO8+cRsYAjn/T7MKBN/sj
         HjMq/lwvGnwjnyuBGd5+gsV6B/bVo+E1sVLNRaJmf8PQ7tMN1azLOWl7Afj1hDi3DbvB
         Fzlszt7wBdQ10zByXZTcDgqJcHVHNdBROtHMQ77S8mieK4V/f4CrfhuHKIr+rHc2wSX0
         u9AA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hRGDEVfb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i64si3719474qkf.279.2018.04.17.14.27.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 14:27:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hRGDEVfb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8Y8F-0006oZ-GF
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 17:27:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hwertz10@gmail.com>) id 1f8Y82-0006mV-Uo
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 17:27:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hwertz10@gmail.com>) id 1f8Y81-0000yy-7t
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 17:27:06 -0400
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e]:38382)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hwertz10@gmail.com>)
	id 1f8Y80-0000oI-Rq; Tue, 17 Apr 2018 17:27:05 -0400
Received: by mail-wr0-x22e.google.com with SMTP id h3so26687583wrh.5;
	Tue, 17 Apr 2018 14:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XpQ7TfHvL5DywncTIPn0kDqOY75Opyz6Vgs0kTX49wA=;
	b=hRGDEVfbpoAcm2luZ9BN6gJ+s3DVSXS+BjdJ3zB9H2SWR/rXhY/YJz5biCXE0zxxVp
	k0ai44J/aCc60fRYzC6jORZPAl/7c81j7A2jin5fPkqbKESaCqfTbAf29cMifJhirkOV
	hYRIIrQ+U5T1unSxYmZqSRwP7qauLc/1QZsNkoEt32zIEEqxZd8OxRMQW3hrvVVRIZ8m
	AOeMXrYEP6f8BgTStumKFOdG75UCbi7Ds3lX0G8kJVE5ngM0eLUooZrFRpOIbOJ7oZH/
	pY6eM51guwoGyXHf05kRQMyGmhrSqVd3Q771e8Udhk64AuR1fBPfjfF5x3Dqg1pcS0n9
	LH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XpQ7TfHvL5DywncTIPn0kDqOY75Opyz6Vgs0kTX49wA=;
	b=PPmMBcfgpTbegR7JUUaHKvakhLolp4IU6pGrzw7UJg3O0mgDRKqmeth8eijocYrz8z
	swxH/dL0KJzaOPbeK7hq8V4+CSPx1FRBBSDWsvJNLXH93HF2K3bIIHTgbr97MC8U0smx
	WrwaVQeJ6u6DZ5VDPmiX/uMqbEbVJCoEwyfBOkhQhcDYGH+4wWa/qMYQVKPPUXtxrflw
	wa+JfEjDe8q7dVL89XszkOTprdIglo37r8dodMvF8+WrHiY35fCowQ5Ekrqe4sZJubR6
	QOlpbrqhqaxJU+JIPtcfmLCpHIymTL+wzo3sEEIi3vNPDRzpf/owA2svzF7MOsz98g/O
	wg7Q==
X-Gm-Message-State: ALQs6tCzOB3cbAk2mdcWZwtRNXUT2tA4UCLWeG1yMvnqgbHkWle2bk5Q
	OR/2FLnWmL5/xVjpR7KU/dd7RRlyDLWI/gwaXJo=
X-Received: by 10.28.144.196 with SMTP id s187mr2113549wmd.82.1524000423235;
	Tue, 17 Apr 2018 14:27:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.129.104 with HTTP; Tue, 17 Apr 2018 14:27:02 -0700 (PDT)
In-Reply-To: <CAFEAcA_Hti-FYqEse7ubdNyVr3fPHO==e6MDv9Ym4KVYJcYTwA@mail.gmail.com>
References: <CAOuPqTE8GsN_+REWzSt4DOiqddSbZC-kOH=WnYG3U8ge3GsLoA@mail.gmail.com>
	<CAFEAcA_Hti-FYqEse7ubdNyVr3fPHO==e6MDv9Ym4KVYJcYTwA@mail.gmail.com>
From: Henry Wertz <hwertz10@gmail.com>
Date: Tue, 17 Apr 2018 16:27:02 -0500
Message-ID: <CAOuPqTG_C_dLF+RPxP_=A7575KWSg=dTbuN6-94HCDqsTEJPOQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="001a11473788dd5adb056a11ffcf"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22e
Subject: Re: [Qemu-arm] [Qemu-devel] Patch for ARM memory barriers and
 getdent
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <Laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KzpvCqzUhxal

--001a11473788dd5adb056a11ffcf
Content-Type: text/plain; charset="UTF-8"

Hi Henry; thanks for these patches. Please could you provide
> a Signed-off-by: line for them? This says you're happy for us
> to apply them to QEMU under our license, and we can't do anything
> with them without one. The top part of
> https://wiki.qemu.org/Contribute/SubmitAPatch
> has more detail.
>
     Yup, I'll resubmit both in proper format.

> You'll probably have better luck if you submit patches as separate
> emails rather than all in one -- the set of people who care about
>
     Can do.

In general, 64-bit binary on a 32-bit host is not supported by linux-user.
> Various things are likely to go wrong for anything but the simplest
> of guest binaries. You need a 64-bit host to reliably use linux-user
> for a 64-bit guest binary.
>
     I didn't test it very hard, I was only using it to run the couple
Android SDK binaries (aapt and friends) that Android Studio runs; these in
general open a file or two, process them, write out a result, so they
probably are pretty simple guest binaries.  Nevertheless,with this patch
these few x86-64 binaries run on 32-bit ARM and (last I checked) 32-bit
Intel.


>
> I think your change isn't sufficient to handle the "target 32 bits
> and host 64 bits" case, because the 64-on-32 code path that you're
> using for it uses the guest's buffer size as the size of the
> host buffer it allocates to pass to the host syscall.
>
....

> Maybe I'm missing a clever trick?
>
     As far as I can tell, it makes a "linux_dirent" and "target_dirent"
and is pretty careful to calculate rather than assume offsets, and so on as
it copies data from one struct to the other.  i didn't look before, but
there is in fact a line "assert(count1 + treclen <= count);" that would
trigger if the buffer is going to be overflowed.  I think the code may not
have even been needed, except that d_type (file type) was moved to the
"middle" of the dirent64 struct instead of at the end.

Thanks!
-- Henry

--001a11473788dd5adb056a11ffcf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te"><span class=3D""></span><br><span class=3D""></span><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">
</span>Hi Henry; thanks for these patches. Please could you provide<br>
a Signed-off-by: line for them? This says you&#39;re happy for us<br>
to apply them to QEMU under our license, and we can&#39;t do anything<br>
with them without one. The top part of<br>
<a href=3D"https://wiki.qemu.org/Contribute/SubmitAPatch" rel=3D"noreferrer=
" target=3D"_blank">https://wiki.qemu.org/<wbr>Contribute/SubmitAPatch</a><=
br>
has more detail.<br>
<span class=3D""></span></blockquote><div>=C2=A0 =C2=A0=C2=A0 Yup, I&#39;ll=
 resubmit both in proper format.<span class=3D""></span><br><span class=3D"=
"></span></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">
</span>You&#39;ll probably have better luck if you submit patches as separa=
te<br>
emails rather than all in one -- the set of people who care about<br>
</blockquote><div>=C2=A0 =C2=A0=C2=A0 Can do. <span class=3D""><br></span><=
span class=3D""></span><br><span class=3D""></span></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">
</span>In general, 64-bit binary on a 32-bit host is not supported by linux=
-user.<br>
Various things are likely to go wrong for anything but the simplest<br>
of guest binaries. You need a 64-bit host to reliably use linux-user<br>
for a 64-bit guest binary.<br></blockquote><div>=C2=A0 =C2=A0=C2=A0 I didn&=
#39;t test it very hard, I was only using it to run the couple Android SDK =
binaries (aapt and friends) that Android Studio runs; these in general open=
 a file or two, process them, write out a result, so they probably are pret=
ty simple guest binaries.=C2=A0 Nevertheless,with this patch these few x86-=
64 binaries run on 32-bit ARM and (last I checked) 32-bit Intel.<br>=C2=A0<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
I think your change isn&#39;t sufficient to handle the &quot;target 32 bits=
<br>
and host 64 bits&quot; case, because the 64-on-32 code path that you&#39;re=
<br>
using for it uses the guest&#39;s buffer size as the size of the<br>
host buffer it allocates to pass to the host syscall. <br></blockquote><div=
>.... <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
Maybe I&#39;m missing a clever trick?<br></blockquote><div>=C2=A0 =C2=A0=C2=
=A0 As far as I can tell, it makes a &quot;linux_dirent&quot; and &quot;tar=
get_dirent&quot; and is pretty careful to calculate rather than assume offs=
ets, and so on as it copies data from one struct to the other.=C2=A0 i didn=
&#39;t look before, but there is in fact a line &quot;assert(count1 + trecl=
en &lt;=3D count);&quot; that would trigger if the buffer is going to be ov=
erflowed.=C2=A0 I think the code may not have even been needed, except that=
 d_type (file type) was moved to the &quot;middle&quot; of the dirent64 str=
uct instead of at the end.<br><br></div><div>Thanks!<br></div><div>-- Henry=
<br></div></div></div></div>

--001a11473788dd5adb056a11ffcf--
