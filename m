Received: by 10.223.197.9 with SMTP id q9csp1624042wrf;
        Sat, 30 Sep 2017 06:15:51 -0700 (PDT)
X-Received: by 10.55.33.203 with SMTP id f72mr7722541qki.176.1506777351161;
        Sat, 30 Sep 2017 06:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506777351; cv=none;
        d=google.com; s=arc-20160816;
        b=zKB8DJv8Fsj4oYQwTcvVva0d+S7c9uWoLaTQd3js6DCiDorIl9P2Y+DwlYsxVzPfyB
         3+IdppH2tkkCgaoD4ztm9ef/ATs7QSaLBbL42Qm+AmkYyvcOlaIeZu08oy6HhsRofDoe
         Y5DbFsOMZFZlpTkGRj/l+GHeDy0MX8LiAsp+/5Z6Y3JjZbQjEM43s2SIcCBfgbzb0qcm
         zssDIG7CDKuWF23yA2XPH9quKAjpRh2w5Dr0ZZ6v+M3exNeGiU5V/mEHtJrZYYG6mIkv
         WG/NFvLBzK+uVIJFEVysmLrxjbLNN/cAm/2b3xSw3lIW44UFMN7cl5pH97Qk2BI+QS9R
         g1KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=oPZbicbgu4N2SvEKpfb5VJHPnb2yFInK01vsv7jjzAE=;
        b=tsK5eK6mbTq3QnIp4ur5VrrnB6YYS730rYG6AT8FZysmRRCmaXd3xapYuhJ8z6a+kf
         FFviSoBUQIa4dW/KVN3QbnYyQRuME7erMy8o5odaFjgtrqVOJrV/Le1BPOE6d16a9Oqt
         Cu53Er9p/yrpdbPX1E/W+gAWeDSKlX8ZLOKTYfkn6p0sN9nfb7FYRpAjA4Ji55CI9c2Y
         0+U5ohYJoqapS637/TsR24kOejFVb83EB/IYUnUoPd/CMOKdkWoBzGqqG9RQMaLR2DLx
         DZcfi8/xrx1lhqjfVX/X2/SiqhsAORT8/vEINDEoJXTfA8d2E581z4SCh9JtWiu1Py3Y
         i4zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kOTpa13u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n34si5888333qtb.277.2017.09.30.06.15.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Sep 2017 06:15:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kOTpa13u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39302 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dyHcS-0007tj-Td
	for alex.bennee@linaro.org; Sat, 30 Sep 2017 09:15:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prem.mallappa@gmail.com>) id 1dyD8b-00073Y-9h
	for qemu-arm@nongnu.org; Sat, 30 Sep 2017 04:28:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prem.mallappa@gmail.com>) id 1dyD8a-0003qU-6o
	for qemu-arm@nongnu.org; Sat, 30 Sep 2017 04:28:41 -0400
Received: from mail-yw0-x22a.google.com ([2607:f8b0:4002:c05::22a]:57161)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <prem.mallappa@gmail.com>)
	id 1dyD8a-0003pe-12; Sat, 30 Sep 2017 04:28:40 -0400
Received: by mail-yw0-x22a.google.com with SMTP id w22so1102647ywa.13;
	Sat, 30 Sep 2017 01:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oPZbicbgu4N2SvEKpfb5VJHPnb2yFInK01vsv7jjzAE=;
	b=kOTpa13ulj/K5pXBvu7sZCDGQnoR7qeboIJsLHD8bnjwjyM+XgPNBD/bo85oGBn7Qb
	mZIDKOZJErtcJHE4Zth0xuc1X/3NGjuI6ecR4biq0J7k8NvjNkoLVWd/2hzkiMG90NrM
	v+VT8rS2h8HIDu3QFLFTJmA6IKa3apOeRudZEDSOMYNfKpdWr0EUJcxWlyMpr7ihwrXR
	gPT2Lnd/9E1wfhngo32GdKpasFCxSScZVxrINTTgXPVW4TAXh0QW/RFkA4pOQqrPKpaq
	8HBiGxBqEkXMJGNrxiYgEaZwtMzJ314D6V/Z6IU0LM8Yadxb2/srno79Y0ToNELGkdH2
	CGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oPZbicbgu4N2SvEKpfb5VJHPnb2yFInK01vsv7jjzAE=;
	b=s57sOKJliKNn7qKYjiy8dbqHszRy3aDodwO9ctM3luVtrsuTGfl1Kgqxrb2aoUTmld
	C1iC0cdgcC/m21jX8JHpeH8K2Xz+aAoaGEmubiWgZjuWKObMvgkgZ4xy4ozRWaIHKsZc
	zQEA+tGtVHwj02HbSIanD0ZHa4+cR1UNRUilz1hpsNZITSKmeXtrAk4ahks56pGQGl0G
	bwY+iiDUkOHnUshJ35pgjC9khdqKrSAkQ8bMvxFeYUAX9t+SruRUSTaf3Z067rn0HZ8n
	ynFD2yHoj2+nOJj0xN3MgrKylc7prlvCBAc9jqOD0PkTcoItGY1y0aaDmPxfWnkSU6zb
	N5Ug==
X-Gm-Message-State: AHPjjUiGl6mTLHMM8/8yApYNu876ttFtwYAo74XZ8P6JyAXD5jmKyQlC
	Kq6IT2JELcrhlKouJ2E63xm6J6nZSIQaTipXsKk=
X-Google-Smtp-Source: AOwi7QAmJeG3n2EmDPKGZ6apS9nWvhSrHKwN2oLVSaPAzo90BkXBh2Lkb7JmbK/8d+Iigl+Ym26EqaJNRyq8WufJEBg=
X-Received: by 10.37.91.69 with SMTP id p66mr8001379ybb.423.1506760117883;
	Sat, 30 Sep 2017 01:28:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.193.194 with HTTP; Sat, 30 Sep 2017 01:28:17 -0700 (PDT)
In-Reply-To: <CAFEAcA8k4nAjqJ_Mu5ZZ8ygMMJikX17BCB3M0ZkbQBsKVLt5TQ@mail.gmail.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-2-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8k4nAjqJ_Mu5ZZ8ygMMJikX17BCB3M0ZkbQBsKVLt5TQ@mail.gmail.com>
From: Prem Mallappa <prem.mallappa@gmail.com>
Date: Sat, 30 Sep 2017 13:58:17 +0530
Message-ID: <CADD6c-iohAZO7DLsYfh+sRz0SWyxWW0ja_tdFhdemgWJafHJjg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="001a1140f452969a22055a63ed23"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::22a
X-Mailman-Approved-At: Sat, 30 Sep 2017 09:15:43 -0400
Subject: Re: [Qemu-arm] [PATCH v7 01/20] hw/arm/smmu-common: smmu base
 device and datatypes
X-BeenThere: qemu-arm@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@gnu.org>
List-Help: <mailto:qemu-arm-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=subscribe>
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	jean-philippe.brucker@arm.com, Tomasz Nowicki <tn@semihalf.com>,
	Will Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, robin.murphy@arm.com,
	wtownsen@redhat.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: YxGN6GAfh9Jp

--001a1140f452969a22055a63ed23
Content-Type: text/plain; charset="UTF-8"

All,

I am no longer associated with Broadcom, so can't help much here I guess.

If there is anything else I can do; please let me know.

Cheers,
/Prem



--
Prem

On Wed, Sep 27, 2017 at 11:08 PM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 1 September 2017 at 10:21, Eric Auger <eric.auger@redhat.com> wrote:
> > The patch introduces the smmu base device and class for the ARM
> > smmu. Devices for specific versions will be derived from this
> > base device.
> >
> > We also introduce some important datatypes.
> >
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>
> > +/*
> > + * Copyright (C) 2014-2016 Broadcom Corporation
> > + * Copyright (c) 2017 Red Hat, Inc.
> > + * Written by Prem Mallappa, Eric Auger
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
>
> Really GPL-2-only ?
>
> Unless there's a good reason, you should probably fix this (including
> getting an ack from Prem/Broadcom where it applies to code that came
> from him).
>
> thanks
> -- PMM
>

--001a1140f452969a22055a63ed23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">All,<div><br><div>I am no longer associated with Broadcom,=
 so can&#39;t help much here I guess.</div><div><br></div><div>If there is =
anything else I can do; please let me know.</div><div><br></div><div>Cheers=
,</div><div>/Prem</div><div><br></div><div><br></div></div></div><div class=
=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature">--<br>Prem</div></div>
<br><div class=3D"gmail_quote">On Wed, Sep 27, 2017 at 11:08 PM, Peter Mayd=
ell <span dir=3D"ltr">&lt;<a href=3D"mailto:peter.maydell@linaro.org" targe=
t=3D"_blank">peter.maydell@linaro.org</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><span class=3D"">On 1 September 2017 at 10:21, Eric Auge=
r &lt;<a href=3D"mailto:eric.auger@redhat.com">eric.auger@redhat.com</a>&gt=
; wrote:<br>
&gt; The patch introduces the smmu base device and class for the ARM<br>
&gt; smmu. Devices for specific versions will be derived from this<br>
&gt; base device.<br>
&gt;<br>
&gt; We also introduce some important datatypes.<br>
&gt;<br>
&gt; Signed-off-by: Eric Auger &lt;<a href=3D"mailto:eric.auger@redhat.com"=
>eric.auger@redhat.com</a>&gt;<br>
&gt; Signed-off-by: Prem Mallappa &lt;<a href=3D"mailto:prem.mallappa@broad=
com.com">prem.mallappa@broadcom.com</a>&gt;<br>
<br>
</span><span class=3D"">&gt; +/*<br>
&gt; + * Copyright (C) 2014-2016 Broadcom Corporation<br>
&gt; + * Copyright (c) 2017 Red Hat, Inc.<br>
&gt; + * Written by Prem Mallappa, Eric Auger<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License version 2 as<=
br>
&gt; + * published by the Free Software Foundation.<br>
<br>
</span>Really GPL-2-only ?<br>
<br>
Unless there&#39;s a good reason, you should probably fix this (including<b=
r>
getting an ack from Prem/Broadcom where it applies to code that came<br>
from him).<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br></div>

--001a1140f452969a22055a63ed23--
