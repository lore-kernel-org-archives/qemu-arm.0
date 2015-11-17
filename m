Received: by 10.182.158.201 with SMTP id ww9csp990010obb;
        Tue, 17 Nov 2015 13:52:33 -0800 (PST)
X-Received: by 10.129.44.3 with SMTP id s3mr41857576yws.141.1447797153306;
        Tue, 17 Nov 2015 13:52:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s5si21385967yws.243.2015.11.17.13.52.33
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 17 Nov 2015 13:52:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@pebble-com.20150623.gappssmtp.com
Received: from localhost ([::1]:60809 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZyoAy-0003lW-Te
	for alex.bennee@linaro.org; Tue, 17 Nov 2015 16:52:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <francois@pebble.com>) id 1ZyoAw-0003lN-SM
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 16:52:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <francois@pebble.com>) id 1ZyoAv-0008Lw-Kz
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 16:52:30 -0500
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:35288)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <francois@pebble.com>) id 1ZyoAv-0008Lh-DX
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 16:52:29 -0500
Received: by wmdw130 with SMTP id w130so174212093wmd.0
	for <qemu-arm@nongnu.org>; Tue, 17 Nov 2015 13:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pebble-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jWC3e23a5WuKyka71a6OIusSXDGaqvFnP+cIcckOxcE=;
	b=JLZV/kzJtjmNGXQPSUD1PqgG8rkkW/VcWelGZIrKRJB2cnjKyW44fAy0pepk93vrnR
	QFGJs2f/fbqUc27p/yDKOBoAPHgANJf4r8OTO+PZziXN5EeQ8htBoM/g7i2j+wWBW6am
	i+Bln8PC1plZn3HQ0Fcw7dCSWG+gTr5YC8kIPGPzZ3NMtNc7V/DepkKaZFdhC92IK9Qh
	68wq0KW+6q53wfGsiLsLyftTQDmtdlVN6CE+JSeToqmytinpOCps6O9vIOgnpwjI8CMG
	WIA1n8XcAdHfsr9OmpIFplzJGYhnVWTzcPoxXRoQkbjLUgZcDrLJM4H2XoPwT2K6Llyv
	QkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jWC3e23a5WuKyka71a6OIusSXDGaqvFnP+cIcckOxcE=;
	b=YgLyILolBS0U8edM1dlHJYtg54A4Q3RkCbu8Ep5GXnaQ+/Edq/LfOhk53AqzwiB9Hp
	8GA347+uSwBB2aqzMPRqPenx5TDV2ZvEvDL81qIizhRhsnuU9aaZk8LeoF/MJvdVptzr
	hMz3pxjGNLobURGEaze7sTS6+w99+L3M24p5wZ5ESmkNb1ckQwhqKCAwPzk5yDd6k+VL
	FzkqiwFr2iyFG71BwQx4+297ND/ElgUkMTgUl8aSqrDbaDYhxEUm9Xfd0T0zNaL+EtHV
	dfa5mR5t1/0b5PQmRrhVEYif6oS3gnWFlSzfjEcrhGxlcTL5PEs/jYXD4cDBOZqeQwaY
	Dv8Q==
X-Gm-Message-State: ALoCoQlk6303ONPO0wBV54w27w4EJQFtZME862Ft9Fbp+eifr5G720ivxngDLYL6laWJeLwatutj
X-Received: by 10.28.51.135 with SMTP id z129mr5079845wmz.19.1447797148412;
	Tue, 17 Nov 2015 13:52:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.169.139 with HTTP; Tue, 17 Nov 2015 13:52:08 -0800 (PST)
In-Reply-To: <CAFEAcA-oUjbRbOPdReNTEmW5bSXX6j9X+tdNyqr-fpKk8TqK2w@mail.gmail.com>
References: <1447796430-90226-1-git-send-email-francois@getpebble.com>
	<CAFEAcA-oUjbRbOPdReNTEmW5bSXX6j9X+tdNyqr-fpKk8TqK2w@mail.gmail.com>
From: Francois Baldassari <francois@pebble.com>
Date: Tue, 17 Nov 2015 13:52:08 -0800
Message-ID: <CAHpaMEZVHNbjGx9sRqevBn8XGoyB=3tqWfMAqM-LXFMSBXwdvw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary=001a1144424ebd09a70524c38a85
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::22e
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] target-arm: Priority masking with basepri on
	v7m
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Y5Zn10Q0FG+/

--001a1144424ebd09a70524c38a85
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks for the swift reply.

Michael's changes look very good indeed. Thank you for pointing them out.

No need to consider this any further then.

Cheers,

Fran=C3=A7ois.

On Tue, Nov 17, 2015 at 1:49 PM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 17 November 2015 at 21:40, Fran=C3=A7ois Baldassari
> <francois@getpebble.com> wrote:
> > On armv7m mcus, the BASEPRI register can be set to mask interrupts
> > above a certain priority.
> >
> > This changeset implements that functionality by way of the NVIC which
> > ultimately sets the interrupt mask in the GIC.
> >
> > Signed-off-by: Fran=C3=A7ois Baldassari <francois@pebble.com>
>
> There are a lot of problems with our NVIC priority handling
> right now. You might like to take a look at the patch set that
> Michael Davidsaver sent out earlier this month:
> https://lists.nongnu.org/archive/html/qemu-devel/2015-11/msg01542.html
>
> That has some problems but I think it's probably the way we're
> going to go to fix up the NVIC.
>
> thanks
> -- PMM
>

--001a1144424ebd09a70524c38a85
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Thanks for the swift reply.<br><br></div>Michael=
&#39;s changes look very good indeed. Thank you for pointing them out.<br><=
br></div><div>No need to consider this any further then.<br><br></div><div>=
Cheers,<br><br></div><div>Fran=C3=A7ois.<br></div></div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On Tue, Nov 17, 2015 at 1:49 PM, Pet=
er Maydell <span dir=3D"ltr">&lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On 17 November 2015 at 21:40, Fran=C3=A7ois Balda=
ssari<br>
<span class=3D"">&lt;<a href=3D"mailto:francois@getpebble.com">francois@get=
pebble.com</a>&gt; wrote:<br>
&gt; On armv7m mcus, the BASEPRI register can be set to mask interrupts<br>
&gt; above a certain priority.<br>
&gt;<br>
&gt; This changeset implements that functionality by way of the NVIC which<=
br>
&gt; ultimately sets the interrupt mask in the GIC.<br>
&gt;<br>
&gt; Signed-off-by: Fran=C3=A7ois Baldassari &lt;<a href=3D"mailto:francois=
@pebble.com">francois@pebble.com</a>&gt;<br>
<br>
</span>There are a lot of problems with our NVIC priority handling<br>
right now. You might like to take a look at the patch set that<br>
Michael Davidsaver sent out earlier this month:<br>
<a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2015-11/msg0154=
2.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.org/archi=
ve/html/qemu-devel/2015-11/msg01542.html</a><br>
<br>
That has some problems but I think it&#39;s probably the way we&#39;re<br>
going to go to fix up the NVIC.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br></div>

--001a1144424ebd09a70524c38a85--
