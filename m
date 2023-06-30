Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp759849ejy;
        Fri, 30 Jun 2023 01:58:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ58BYRQcrn++yO97MsYUX84PbXlnvAWctJOF40fSx9k/5P2rWG9rxeRv/KdzoultRQzlJma
X-Received: by 2002:a05:620a:4490:b0:767:4a4:f3cc with SMTP id x16-20020a05620a449000b0076704a4f3ccmr2366492qkp.26.1688115484028;
        Fri, 30 Jun 2023 01:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688115484; cv=none;
        d=google.com; s=arc-20160816;
        b=hCIGMJUx0CJBpTTCJ8QSaqy+SS8WS6Am6u0i9d6O1w+LRyTcoNq2UMDhQu3UX82TXk
         27RYNMobDCUTxd2XXO6OllzsvcnTiWaavYNcjSE0vNpzYHirjrc1CSdAXk2a0/Z6yl7b
         YnCkkd8qEulM6zghX0OFwg0YftzaUorzSBtJigUIV6kD+9p8qay7iP/6Mus6ctdf4RuH
         ASHEwNxXu8+fcSCf6C3LaPjv4UAT0LqZCzax5ol2SX5ap6peFW4qqKY8/vJiTbYdVO0P
         4MpxXOJcXkZmFPXtJw1AlYNj88j/KUBd8W1w+MLpkpfuF3LL7wLFs+iWILGl3HXABkSn
         5F1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jfPH+LwjZ/9LcomB7J5C36lR3ZpS1499ng2WD0IUbbU=;
        fh=WbzGqREMpVVDOFWEcJTn/wVtADaMoMH+aGpDOOI4xS4=;
        b=qKCPh2gxRYNdt28FFi/IUgJFQTkJbcFWeIxPA716aR1t4Y5R/yM8tymWbXvzZ3YBq1
         zONoines/IeK/ElpJoQunhWhIy/4jRc52TbMCBv8J0LA5IZbw31NAUZ4sb/Zb/l60mO4
         eIb7buUtcjf40XjrZE7oQjjkL0jz3XpfQlrXubYEn4ZQnEn73k6RRJDwptFF4zjcjxok
         u1e2G65rbyUeFtmstYTZiv055XxxDX/IGWkjHKbYhDaHPh9U3jPaR/1wKkZLkp7gdm37
         FpMiSAku83upozwESYJ/ENyhRpr2w4BvFUhIbCSATFkyA9j8eLqMm7qcwkyDGixeidqe
         LQrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RJjyH56M;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id tq15-20020a05620a3d0f00b007624a2935bdsi5502994qkn.270.2023.06.30.01.58.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:58:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RJjyH56M;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688115483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jfPH+LwjZ/9LcomB7J5C36lR3ZpS1499ng2WD0IUbbU=;
	b=RJjyH56MqmrU86w5cTaJEdCnkRv4SHh21Xz7gs0DAGFgukPkW1iK9pOcQmrVTZhDS2ARb2
	PPPxrqT1g5oMy1j/Tj9Y4yu+h2CeIs2x1+F3taIBrRPsCElPhHBpfU2npsJ32FtqpQ/6Es
	n0mrtA5A1dmFvLedXAKLMgDQPZkHcvM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-CW7gzXb2M1qQBT6VfcFzsA-1; Fri, 30 Jun 2023 04:58:00 -0400
X-MC-Unique: CW7gzXb2M1qQBT6VfcFzsA-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7659cb9c3b3so164967185a.1
        for <alex.bennee@linaro.org>; Fri, 30 Jun 2023 01:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688115480; x=1690707480;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfPH+LwjZ/9LcomB7J5C36lR3ZpS1499ng2WD0IUbbU=;
        b=AD8/fuZi1MXXSZ1YUy9ozsIe5QnyvOe613QN4e48Rd6hLuuxMgKEMkO4oaHVT65qaK
         i2gSGWsvxAYs7k9yRpbxGID9rZvVhj42PWMPIRPzyrao4+rk2THaH8Wv9iLRM7LX0v9v
         W9Q0/wVQDyN9UukDP+Du12pg/V2ROlX/qSwqkpA57XraZkhPeysV9ApHEaahdBkAKtfc
         gyMvtxt7CEc3NpciTZuI9IqNC3eeTTxC0pcJgGdthqUT/nwce+214ce8sq8nXyryqIMQ
         pcPgjcdCy7wmam4d0YPvrpKnnqTOjG1CFuh6ID2Sks4/zYtN6hZKjW74XU1rqOXWA9OR
         0Xag==
X-Gm-Message-State: AC+VfDzaef4ccG0M+EjXjhKmRGtO198Lmg4Azbhlu2PN1n0wn44aN9mj
	YEiebTDEqjCsfK/Ww8u8Z/PD7EcywZkzflHs8WNs+GJc0NtXbUg3FDtZwzfuHM1C2BXLUWpYl14
	tD5vK2TKKysjJoORK3TKCR8wEjOl3/sps
X-Received: by 2002:a05:620a:4727:b0:767:3771:f770 with SMTP id bs39-20020a05620a472700b007673771f770mr1901044qkb.40.1688115479980;
        Fri, 30 Jun 2023 01:57:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4727:b0:767:3771:f770 with SMTP id
 bs39-20020a05620a472700b007673771f770mr1901024qkb.40.1688115479747; Fri, 30
 Jun 2023 01:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
 <20230627160943.2956928-26-alex.bennee@linaro.org> <b08189c8-38c2-adbf-7bb3-0304f4845fc0@linaro.org>
In-Reply-To: <b08189c8-38c2-adbf-7bb3-0304f4845fc0@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 30 Jun 2023 10:57:48 +0200
Message-ID: <CABgObfa=pWNa17jKiLz3FnRk=qCyTsQ1jv1hk9ZoLZj0JV1Mng@mail.gmail.com>
Subject: Re: [PATCH v3 25/36] docs/devel: introduce some key concepts for QOM development
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel <qemu-devel@nongnu.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
	Leonardo Bras <leobras@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bmeng.cn@gmail.com>, 
	Yanan Wang <wangyanan55@huawei.com>, Darren Kenny <darren.kenny@oracle.com>, 
	Alexander Bulekov <alxndr@bu.edu>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Xu <peterx@redhat.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Laurent Vivier <laurent@vivier.eu>, 
	Eduardo Habkost <eduardo@habkost.net>, qemu-arm <qemu-arm@nongnu.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Bandan Das <bsd@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Alexandre Iooss <erdnaxe@crans.org>, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Laurent Vivier <lvivier@redhat.com>, 
	Qiuhao Li <Qiuhao.Li@outlook.com>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Riku Voipio <riku.voipio@iki.fi>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000082b4c705ff5503fb"
X-TUID: xnDWncyiLG1h

--00000000000082b4c705ff5503fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il gio 29 giu 2023, 15:41 Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> h=
a
scritto:

> > +The TYPE_DEVICE class is the parent class for all modern devices
> > +implemented in QEMU and adds some specific methods to handle QEMU
> > +device model. This includes managing the lifetime of devices from
> > +creation through to when they become visible to the guest and
> > +eventually unrealized.
>
> Good enough but we are mixing QOM vs QDev...
>

TYPE_DEVICE is mentioned here because it appears in the code (the part that
is not changing and thus is not included in the diff). It's not mixing QOM
with qdev.

Paolo

>   Alternatively several static types could be registered using helper
> macro
> >   DEFINE_TYPES()
>
>
> > +.. _device-life-cycle:
> > +
> > +Device Life-cycle
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +As class initialisation cannot fail devices have an two additional
> > +methods to handle the creation of dynamic devices. The ``realize``
> > +function is called with ``Error **`` pointer which should be set if
> > +the device cannot complete its setup. Otherwise on successful
> > +completion of the ``realize`` method the device object is added to the
> > +QOM tree and made visible to the guest.
> > +
> > +The reverse function is ``unrealize`` and should be were clean-up
> > +code lives to tidy up after the system is done with the device.
>
> Worth mentioning hotplug devices must implement it?
>
> > +All devices can be instantiated by C code, however only some can
> > +created dynamically via the command line or monitor.
> >
> > +Likewise only some can be unplugged after creation and need an
> > +explicit ``unrealize`` implementation.
>
> Ah, here we go.
>
> > This is determined by the
> > +``user_creatable`` variable in the root ``DeviceClass`` structure.
> > +Devices can only be unplugged if their ``parent_bus`` has a registered
> > +``HotplugHandler``.
>
> TODO on top, mentions the reset() handlers are called after realize(),
> and can be called multiple times.
>
> >   API Reference
> > --------------
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >   See the :ref:`QOM API<qom-api>` and :ref:`QDEV API<qdev-api>`
> >   documents for the complete API description.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
>

--00000000000082b4c705ff5503fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 29 giu 2023, 15:41 Philippe Mathieu-Daud=C3=A9 =
&lt;<a href=3D"mailto:philmd@linaro.org">philmd@linaro.org</a>&gt; ha scrit=
to:</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
&gt; +The TYPE_DEVICE class is the parent class for all modern devices<br>
&gt; +implemented in QEMU and adds some specific methods to handle QEMU<br>
&gt; +device model. This includes managing the lifetime of devices from<br>
&gt; +creation through to when they become visible to the guest and<br>
&gt; +eventually unrealized.<br>
<br>
Good enough but we are mixing QOM vs QDev...<br></blockquote></div></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">TYPE_DEVICE is mentioned here b=
ecause it appears in the code (the part that is not changing and thus is no=
t included in the diff). It&#39;s not mixing QOM with qdev.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
&gt;=C2=A0 =C2=A0Alternatively several static types could be registered usi=
ng helper macro<br>
&gt;=C2=A0 =C2=A0DEFINE_TYPES()<br>
<br>
<br>
&gt; +.. _device-life-cycle:<br>
&gt; +<br>
&gt; +Device Life-cycle<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +<br>
&gt; +As class initialisation cannot fail devices have an two additional<br=
>
&gt; +methods to handle the creation of dynamic devices. The ``realize``<br=
>
&gt; +function is called with ``Error **`` pointer which should be set if<b=
r>
&gt; +the device cannot complete its setup. Otherwise on successful<br>
&gt; +completion of the ``realize`` method the device object is added to th=
e<br>
&gt; +QOM tree and made visible to the guest.<br>
&gt; +<br>
&gt; +The reverse function is ``unrealize`` and should be were clean-up<br>
&gt; +code lives to tidy up after the system is done with the device.<br>
<br>
Worth mentioning hotplug devices must implement it?<br>
<br>
&gt; +All devices can be instantiated by C code, however only some can<br>
&gt; +created dynamically via the command line or monitor.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +Likewise only some can be unplugged after creation and need an<br>
&gt; +explicit ``unrealize`` implementation.<br>
<br>
Ah, here we go.<br>
<br>
&gt; This is determined by the<br>
&gt; +``user_creatable`` variable in the root ``DeviceClass`` structure.<br=
>
&gt; +Devices can only be unplugged if their ``parent_bus`` has a registere=
d<br>
&gt; +``HotplugHandler``.<br>
<br>
TODO on top, mentions the reset() handlers are called after realize(),<br>
and can be called multiple times.<br>
<br>
&gt;=C2=A0 =C2=A0API Reference<br>
&gt; --------------<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0See the :ref:`QOM API&lt;qom-api&gt;` and :ref:`QDEV API&l=
t;qdev-api&gt;`<br>
&gt;=C2=A0 =C2=A0documents for the complete API description.<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linar=
o.org" target=3D"_blank" rel=3D"noreferrer">philmd@linaro.org</a>&gt;<br>
<br>
</blockquote></div></div></div>

--00000000000082b4c705ff5503fb--
