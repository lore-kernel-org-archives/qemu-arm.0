Received: by 10.223.150.237 with SMTP id u100csp3503492wrb;
        Fri, 10 Nov 2017 00:54:23 -0800 (PST)
X-Google-Smtp-Source: ABhQp+SuBTUMfP1FXt3DGIXpmYGL0+aFZc6mdQ7qUiSZjXi78K116tuQgTRYHzAC8Cv6WNw+9T6A
X-Received: by 10.129.102.9 with SMTP id a9mr2199416ywc.291.1510304063387;
        Fri, 10 Nov 2017 00:54:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510304063; cv=none;
        d=google.com; s=arc-20160816;
        b=uhl3PmCwiMLgikFFEZnc7QwBD2zOwr4TqedyR88G8HfIMoLXGUIry2PfNA+zt295pF
         GlFhu8908AoAeCor+zOl+5LlMd0fvbTzGATIcr7F1GuaVYHIzjasGuOzQBfRU4xjYzKE
         MuIQGJPTIsAchc87a6Mwkyn/Xc0rzdsqmvR7dr4K33/kI9LoXpxJze0S1wKhS4Fa2nP6
         p4yOLIilLgShLs5Mf3az8z/jzOemU26yK6mY0yHHR37DYR0bF3u3X/52u6uGuraW8hNl
         HFWwz20c4cChQz7M+f/W1J4OwABf86nE7i0do++UXZ5uI3Dp1vy47kazm/R12foSP9z8
         it8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=t0jUrQ5lv8iAVYYi45a5F7xou7fz+mgHeUcmBKGI9t0=;
        b=OcPAGk5TIVDaBO89eqQk/VWbgk90HpnYXKWZOI3H83O67bqOSFxnngdOwcmG339J59
         G8OFMdzV49bQjAqy0yYBsN4ytz+oIeY4X54+2ExfjlzFccddPy3iN+Tx8e9BxtWOAQud
         NtXKUQwE1WOZ5VFDe1lHHCV7luS/fCqMBcty8w4OqYygD535YzMPYrhT8Lo5NSTL9cBy
         UHKlfgjI4dONI7PSJJ/Zyn+JoUVRdyz5Zoglh4KVPZChHbIkXkHMhfEfoDSaSkVI8eN7
         OJ9Q7n9tjLrSrSowzGSaM8fpAgZISJHf06v8iXxcfrxZFAlFzj1smWyTQokAeSbPrfgt
         nWfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IKEEka9N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i65si1232953ybi.264.2017.11.10.00.54.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Nov 2017 00:54:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IKEEka9N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40681 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eD54w-0002pk-Pt
	for alex.bennee@linaro.org; Fri, 10 Nov 2017 03:54:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1eD54l-0002oF-0n
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 03:54:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1eD54j-0008QN-O3
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 03:54:11 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:53176)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1eD54g-0008N3-93; Fri, 10 Nov 2017 03:54:06 -0500
Received: by mail-vk0-x235.google.com with SMTP id i133so5675341vke.9;
	Fri, 10 Nov 2017 00:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t0jUrQ5lv8iAVYYi45a5F7xou7fz+mgHeUcmBKGI9t0=;
	b=IKEEka9NUrJKg77y9mHqkQWY6rDIx9prgrG2YiAh9Fn9/GRNhkqUwecou+Kh7SWVi8
	QPQrJt33J2Oca3EQxRiY1xks/zJPrdg1Y79GURsCfj1OLhgX1/r+epvGrDx3QWHa9b1u
	e7M8+Ai8b303HR2aM5NMEgGvaZLsJXrs18mFo497qYLJxUwqQeHFK4l3a5KGI9q15XcJ
	HnVyAc4ARw4O+SNYf44sBNPaeD2ar/cHTu0WWqRJwPWtHuSPCpOuO+HO8C29e9nk3TA4
	gjRubOMEAnOEnvDo7HNYGNMn31QHYYkJNqEmdOQq4vhykP6gk5RYLXSEaXZtg8gBUnGD
	xkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t0jUrQ5lv8iAVYYi45a5F7xou7fz+mgHeUcmBKGI9t0=;
	b=njVSLq4a3/EUwII1O1fhJJI5NjI4NJgEtOtvs+5HwjLXN4/KAlWR108yEeWh/1hXn8
	dCI6Lv/QOsMlVGANvQv37Hq+Leqxe8i9uGjRf+CpJit+n4CwHUwm71bVTmX0K7o3+DCJ
	pSuf6AKDZuTFhxZBPUHHk3Wx+uFx8hKjAm4GIDL6oIKfmF/79N4zE6a89f8zWeXS2vl4
	AvN9rJ1XmfOJQQe0S+cLhAs30qvylOixzxKbVx1DrH5AD+3E9DmobOC9Q6sIvM71bDxG
	5UiLZom/eaYvseJJ8uvojs55Bnr9ehsoeRurR8CLCC2EE6nZNMXIrzrZHdxC3Pa60Uit
	Qzww==
X-Gm-Message-State: AJaThX7bGg8eSbR+QsJKaG/lF07fElsg98fB1drsZFrCOKs8gFh+6BuR
	qjXFlO4gGzpZBxW4/ID+caeU1TknnhAvERmj5Sc=
X-Received: by 10.31.60.211 with SMTP id j202mr2524118vka.134.1510304045500;
	Fri, 10 Nov 2017 00:54:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.63.6 with HTTP; Fri, 10 Nov 2017 00:54:05 -0800 (PST)
In-Reply-To: <5a7b721c-fe04-921b-b9d2-986c9930b00b@amsat.org>
References: <1510228971-6005-1-git-send-email-sundeep.lkml@gmail.com>
	<4beb4e47-0ff9-8251-6502-23824779edbd@amsat.org>
	<CAFEAcA-ATtAougvALVo=48p+jVx5B+Ejq60TD9dGYEQU2ReWCQ@mail.gmail.com>
	<5a7b721c-fe04-921b-b9d2-986c9930b00b@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Fri, 10 Nov 2017 14:24:05 +0530
Message-ID: <CALHRZuroyXXzxcWW0XX5fzQ9m8Zh0oZy8RivtiQjzKdHoxQ9WQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="001a11437e04229194055d9d109e"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-arm] [Qemu devel PATCH] MAINTAINERS: Add entries for
 Smartfusion2
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jiH99gNO2f45

--001a11437e04229194055d9d109e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guys,

On Fri, Nov 10, 2017 at 5:52 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> On 11/09/2017 08:55 PM, Peter Maydell wrote:
> > On 9 November 2017 at 21:46, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
> wrote:
> >> Hi Subbaraya,
> >>
> >> On 11/09/2017 09:02 AM, Subbaraya Sundeep wrote:
> >>> add voluntarily myself as maintainer for Smartfusion2
> >>
> >> You need to share your GnuPG key signed, I couldn't find it using
> >> http://pgp.mit.edu/pks/lookup?search=3DSubbaraya+Sundeep
> >>
> >> from https://wiki.qemu.org/Contribute/SubmitAPullRequest :
> >
> > I don't in general expect to take pull requests from
> > everybody listed as a maintainer in the MAINTAINERS file.
> > That just means "I'm going to be reviewing and should
> > be cc'd on patches". Pull requests are sent by people
> > who are maintainers for a subsystem. Rule of thumb:
> > unless somebody asks you to send a pull request, you
> > don't need to do it.
>
> Ok, please apologize my misunderstanding. I still think the M: entry
> stand for 'Maintainer' instead of 'Mail', and still don't understand the
> difference with a "Designated reviewer" (R: entry):
>
>         M: Mail patches to: FullName <address@domain>
>         R: Designated reviewer: FullName <address@domain>
>            These reviewers should be CCed on patches.
>
> "Designated reviewer" seems to duplicate the M: entry and is therefore
> confusing. Can we simply remove it instead?
>
> When introduced in fdf6fab4df4 the explanation was:
>
> --
> Some people are not content with the amount of mail they get, and would
> like to be CCed on patches for areas they do not maintain.  Let them
> satisfy their own appetite for qemu-devel messages.
>
> Seriously: the purpose here is a bit different from the Linux kernel.
> While Linux uses "R" to designate non-maintainers for reviewing patches
> in a given area, in QEMU I would also like to use "R" so that people can
> delegate sending pull requests while keeping some degree of oversight.
>

Do you want me to remove M: and put only R: ?

Thanks,
Sundeep

> --
>
> Regards,
>
> Phil.
>

--001a11437e04229194055d9d109e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Guys,<div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On Fri, Nov 10, 2017 at 5:52 AM, Philippe Mathieu-Daud=C3=A9 <span =
dir=3D"ltr">&lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@=
amsat.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On 11/09/2017 08:55 PM, Peter Maydell wrote:<br>
&gt; On 9 November 2017 at 21:46, Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br>
&gt;&gt; Hi Subbaraya,<br>
&gt;&gt;<br>
&gt;&gt; On 11/09/2017 09:02 AM, Subbaraya Sundeep wrote:<br>
&gt;&gt;&gt; add voluntarily myself as maintainer for Smartfusion2<br>
&gt;&gt;<br>
&gt;&gt; You need to share your GnuPG key signed, I couldn&#39;t find it us=
ing<br>
&gt;&gt; <a href=3D"http://pgp.mit.edu/pks/lookup?search=3DSubbaraya+Sundee=
p" rel=3D"noreferrer" target=3D"_blank">http://pgp.mit.edu/pks/lookup?<wbr>=
search=3DSubbaraya+Sundeep</a><br>
&gt;&gt;<br>
&gt;&gt; from <a href=3D"https://wiki.qemu.org/Contribute/SubmitAPullReques=
t" rel=3D"noreferrer" target=3D"_blank">https://wiki.qemu.org/<wbr>Contribu=
te/SubmitAPullRequest</a> :<br>
&gt;<br>
&gt; I don&#39;t in general expect to take pull requests from<br>
&gt; everybody listed as a maintainer in the MAINTAINERS file.<br>
&gt; That just means &quot;I&#39;m going to be reviewing and should<br>
&gt; be cc&#39;d on patches&quot;. Pull requests are sent by people<br>
&gt; who are maintainers for a subsystem. Rule of thumb:<br>
&gt; unless somebody asks you to send a pull request, you<br>
&gt; don&#39;t need to do it.<br>
<br>
</span>Ok, please apologize my misunderstanding. I still think the M: entry=
<br>
stand for &#39;Maintainer&#39; instead of &#39;Mail&#39;, and still don&#39=
;t understand the<br>
difference with a &quot;Designated reviewer&quot; (R: entry):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 M: Mail patches to: FullName &lt;address@domain=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 R: Designated reviewer: FullName &lt;address@do=
main&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0These reviewers should be CCed on =
patches.<br>
<br>
&quot;Designated reviewer&quot; seems to duplicate the M: entry and is ther=
efore<br>
confusing. Can we simply remove it instead?<br>
<br>
When introduced in fdf6fab4df4 the explanation was:<br>
<br>
--<br>
Some people are not content with the amount of mail they get, and would<br>
like to be CCed on patches for areas they do not maintain.=C2=A0 Let them<b=
r>
satisfy their own appetite for qemu-devel messages.<br>
<br>
Seriously: the purpose here is a bit different from the Linux kernel.<br>
While Linux uses &quot;R&quot; to designate non-maintainers for reviewing p=
atches<br>
in a given area, in QEMU I would also like to use &quot;R&quot; so that peo=
ple can<br>
delegate sending pull requests while keeping some degree of oversight.<br><=
/blockquote><div><br></div><div>Do you want me to remove M: and put only R:=
 ?</div><div><br></div><div>Thanks,</div><div>Sundeep=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
--<br>
<br>
Regards,<br>
<br>
Phil.<br>
</blockquote></div><br></div></div>

--001a11437e04229194055d9d109e--
