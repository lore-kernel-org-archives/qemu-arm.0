Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3889379wrx;
        Tue, 16 Apr 2019 05:54:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwELozVghD3C1Wr2DtM7HVqG8zzrKr8WUqmwt8oApoQ7hgaqPI4OZhIPO1ZUvS5RwaUC1p0
X-Received: by 2002:adf:cf05:: with SMTP id o5mr50832423wrj.8.1555419240634;
        Tue, 16 Apr 2019 05:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555419240; cv=none;
        d=google.com; s=arc-20160816;
        b=t03Hs4YQxL/R322PUzEpvkqDsYNqtyUqcikFstY7AQzSvOliTiPFqXvm2GZZaTQV+j
         bQc0cgLlICprsPWtnvtjoV/4z5IPNsXvyeLRTv4XZbRdy01kV+E9GGlPiBlK0sDp1yjc
         jcsBg3tJGxr4UxSqzbcYZ9Lz+KPWaAV1bgYhxx00fsAFnEfws28JdwBO8WcVFc9G12bs
         Sdsupy2DSIBUKXE8mAbvecPbgTAhRrkOwqu87+/OL5EEbQxZ9KqJ4AMN/0lqWre4uXXw
         JOgvPRtsCy2SIN4JOX8vYF/otQpDHBLO/k1Q7jPaJFO/0uktn0LZin5aUH7dQ5WXjnRu
         swTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=DEJu5Ct55UMRzxb3vDocf5pY3ctJDz95yqbQx1duqVg=;
        b=LL6ixIsdkolvApfiOed5ofoymE/0umSKTQKfqPnICaam2Aig5uyjguxRYsbxO6vbhf
         T31fEdIxwGtZOsolE1bh2GcLJrBay07rx/6o3G0nwGIBE1vQuKnAIIzFHV30EWdyQHvA
         QY1Ly9eGkeHlnb0SsnogfwLbehxOySC3lh9Oh9EwdS0fGEhi5eRkUJXQbR7ITESJCvQ/
         iIvdsGMKS7YhZuEyF2586XkuqWhoGmi6XLWKba1N1GIxLPXsfV1VImidWyPvniLcyPQ/
         2MRlbV4vf9XA1t3Y4N8UN6J7TXCjTqyl/2eM5aj4IrkH7W8lADsxZFGdySAjFNTiwy8B
         PFng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vt.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12si35696296wru.357.2019.04.16.05.53.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 05:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vt.edu
Received: from localhost ([127.0.0.1]:36173 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGNb5-00038m-87
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 08:53:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33213)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <daz3@vt.edu>)
	id 1hGNaM-0002oV-2P
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:53:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <daz3@vt.edu>) id 1hGNaK-0006dz-Vy
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:53:14 -0400
Received: from omr1.cc.ipv6.vt.edu ([2607:b400:92:8300:0:c6:2117:b0e]:38350
	helo=omr1.cc.vt.edu)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <daz3@vt.edu>) id 1hGNaJ-0006TU-SU
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:53:12 -0400
Received: from mr5.cc.vt.edu (mr5.cc.ipv6.vt.edu
	[IPv6:2607:b400:92:8400:0:72:232:758b])
	by omr1.cc.vt.edu (8.14.4/8.14.4) with ESMTP id x3GCqxbm008469
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 08:53:00 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71])
	by mr5.cc.vt.edu (8.14.7/8.14.7) with ESMTP id x3GCqsF7026269
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 08:52:59 -0400
Received: by mail-wr1-f71.google.com with SMTP id y7so18987120wrq.4
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 05:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DEJu5Ct55UMRzxb3vDocf5pY3ctJDz95yqbQx1duqVg=;
	b=CAfPx1K81xMs16WnFL+i4vFvM+eMM1UBBowX96rCoakbhRQLng+EF+bW1MAsPMCWVZ
	PcmX4VkvqKI/TWiwvH19Z8fgdYc09yXfnfv5gOTVjds0ZRZra3BxcIKDNkt0hHmP8BTe
	trKGd9PNa5YQZMGIBYBcuIlFc79EOhsvY65oDoJFq0+Y/PX9G8bMqtpmxJi3eMLYvzvY
	9n3QeXDAsGI16QEQcub8ok9kJoSN07Ar2xHJ8Ne0w87UarBWE8Nr8Hphs7Y6iKEIdGZA
	SnkcDgvH99u5hdch1ErJclCCHQ6iXYYVIB9vIYUw9UI73Auwy5zTuzgwm8jWjALvdjFP
	l+vA==
X-Gm-Message-State: APjAAAXVIcoGKWhuvRBIaHWFC8DzWhuNxmELWjMVify2MMl7XpCqVCKA
	H4BH+ZroJBahgjpK67oIZfaHyWVKbVuVL7obTkaj5Ut+hUxm2DcOoa+VEVfCgJ4I59Pu2h1yV4V
	f19+82a0CPl7yMKI4tsXxg28QJLsojPikTSQW6Po=
X-Received: by 2002:a5d:5284:: with SMTP id c4mr33333235wrv.281.1555419174114; 
	Tue, 16 Apr 2019 05:52:54 -0700 (PDT)
X-Received: by 2002:a5d:5284:: with SMTP id c4mr33333209wrv.281.1555419173678; 
	Tue, 16 Apr 2019 05:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <CANY2w+3iU1m9exqE2qMJj+OXcHThm2Q3jxFdDn9FWwKC6JhKUg@mail.gmail.com>
	<CAFEAcA9B-7j9ws-vaChqx1uZOA_QDzQYPixNeGDmonLXeZ9vNQ@mail.gmail.com>
	<CANY2w+0ZULuVgJTu3M+--rC01biqS=y1V4tAbgjHfyKRd6X79A@mail.gmail.com>
	<CAFEAcA9zP8OateFNU+Ea1thk4NkYgcee5ykEscaguC=hAhXfag@mail.gmail.com>
In-Reply-To: <CAFEAcA9zP8OateFNU+Ea1thk4NkYgcee5ykEscaguC=hAhXfag@mail.gmail.com>
From: Da Zhang <daz3@vt.edu>
Date: Tue, 16 Apr 2019 08:52:17 -0400
Message-ID: <CANY2w+3qJgQ_HVai6trQ_gDXxPLruj1-L6LaTkcUZQbtQBofpg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005304750586a53f5c"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2607:b400:92:8300:0:c6:2117:b0e
Subject: Re: [Qemu-arm] Ubuntu installation shows "No network interfaces
 detected"
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RrZs6wpAbDWz

--0000000000005304750586a53f5c
Content-Type: text/plain; charset="UTF-8"

The qemu-system-aarch64 options support vda partition for the ubuntu
installation. How to setup the options to support sda partition?
I was trying to use the image for my gem5 experiment but it gave me "[ end
Kernel panic - not syncing: No working init found.  Try passing init=
option to kernel. See Linux Documentation/admin-guide/init.rst for
guidance.". One difference I did notice is that all gem5 disk images (ARM
and X86) I used are using /dev/sda. So, I want to try it and see if the
problem fixed.

Thanks
-- Da

On Mon, Apr 15, 2019 at 4:32 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 15 Apr 2019 at 06:27, Da Zhang <daz3@vt.edu> wrote:
> >
> > Thanks for the suggestions. Unfortunately, neither virtio-net-pci nor
> rtl8139 works for me. Yet, I haven't figured it out why. But, I found that
> virtio-net-device works for me.
>
> That will almost certainly be because your guest kernel
> has not been configured to include PCI support (and/or
> support for those specific network devices).
>
> thanks
> -- PMM
>

--0000000000005304750586a53f5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">The qemu-system-aarch64 options support v=
da partition for the ubuntu installation. How to setup the options to suppo=
rt sda partition?<div>I was trying to use the image for my gem5 experiment =
but it gave me &quot;[ end Kernel panic - not syncing: No working init foun=
d.=C2=A0 Try passing init=3D option to kernel. See Linux Documentation/admi=
n-guide/init.rst for guidance.&quot;. One difference I did notice is that a=
ll gem5 disk images (ARM and X86) I used are using /dev/sda. So, I want to =
try it and see if the problem fixed.</div><div><br></div><div>Thanks</div><=
div>-- Da</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Apr 15, 2019 at 4:32 AM Peter Maydell &lt;<a h=
ref=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 15 =
Apr 2019 at 06:27, Da Zhang &lt;<a href=3D"mailto:daz3@vt.edu" target=3D"_b=
lank">daz3@vt.edu</a>&gt; wrote:<br>
&gt;<br>
&gt; Thanks for the suggestions. Unfortunately, neither virtio-net-pci nor =
rtl8139 works for me. Yet, I haven&#39;t figured it out why. But, I found t=
hat virtio-net-device works for me.<br>
<br>
That will almost certainly be because your guest kernel<br>
has not been configured to include PCI support (and/or<br>
support for those specific network devices).<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000005304750586a53f5c--
