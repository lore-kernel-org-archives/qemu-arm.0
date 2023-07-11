Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp2097059eje;
        Tue, 11 Jul 2023 11:38:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHgcDY9a8Rp17oq9fPlxXHlMuejOJspsGr78uZoHbjd9foyx30deknCis4fi6v29/sLiRK3
X-Received: by 2002:a05:620a:f0f:b0:767:ae38:bded with SMTP id v15-20020a05620a0f0f00b00767ae38bdedmr16596808qkl.8.1689100684859;
        Tue, 11 Jul 2023 11:38:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689100684; cv=none;
        d=google.com; s=arc-20160816;
        b=OUYrB4whboU1+noNB79kyVFQ+CCFDKvBVb+BXY7djkiOa++YFsptm1YoUU9dClGG56
         ogwBpymSrOETOqCKvJ1E1dsiQDKf1+ukqSAGKcCECTpPL5P8+TY16lcox+zYPSmzMuzG
         oKcFrBU2IKqhHwxSnaNThn+/ESm3NZylNn6lvjYUuzWr0vN7y8BZ6W0FoY9omifG8xmk
         qscLX/EbLj6QUnTOAX5pf+5/1+9ec+BWP+ysf5UI5T15XE5KlaxB/SL1zzydxlM3GAER
         N5UJ5FX7HtB5gxBshUyEmNG09Tse8hofrg0mONkVSlHyILTBH7TTW7O/ziV36zxnpxnH
         Nd4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uyAVL2i+oeGxGW7ieNr7kP2YHipSWkB0QBvZwgtnGus=;
        fh=8Yaygn7mAo3lX/NEHqfWa8GYGIGGvPT29lliyQ4DfPI=;
        b=ThmSogff5+GNPVqo1uIyIV1BAu7dGJLjPPKfGG2hw12jVqvFkkhX1eEnatEsPem3/o
         fcmMQd6C9Z/EhyES2swgSmeFa4CBYwng2wI0UZt76gqD56ompO5mz90IVqelAzUy19C5
         vy5oHtNx2s7hY2ZtLOrAigV8y7WkL54eiPekXbmuRm3SYjQMl6URZIIgifiRz6qzBwhD
         avlJW9RMz0MAV3Tj2aHiBFfLbOn3o9J8kQgKV3k24CbfuaV3WABWuwaAgqU5s7dHxnaL
         R4F+tPZtKMuoOMigZTbqtjmIdMNF2qLOZE4eE5t6nUbKJUbZxlySE4+Du8aSTImSgsoj
         SurQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I0xw5l3R;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id bi12-20020a05620a318c00b0075f02d4d588si1041305qkb.117.2023.07.11.11.38.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 11:38:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I0xw5l3R;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689100684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uyAVL2i+oeGxGW7ieNr7kP2YHipSWkB0QBvZwgtnGus=;
	b=I0xw5l3RUFISS9Ii1hFxPdIlHRgMcvsrsomPV+hqVscYLr1hDlKzT4OvW86Drh3oE/q28J
	WjbljHNXAAPQ50W1hRIGodfsQNCKv+OEoRbPd2+Z0ACC3J2a6Erfvw/YOfmTNcP4Gu46xG
	dw6pdH3A9r1iQ1SwKs5MedCY7n9vyGU=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-gk-FVIPdMemJMbu4EFiOoA-1; Tue, 11 Jul 2023 14:38:03 -0400
X-MC-Unique: gk-FVIPdMemJMbu4EFiOoA-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1b9c60aa6e7so50000005ad.0
        for <alex.bennee@linaro.org>; Tue, 11 Jul 2023 11:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689100682; x=1691692682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uyAVL2i+oeGxGW7ieNr7kP2YHipSWkB0QBvZwgtnGus=;
        b=e9danRRaUJPGawtHqSjsd87aQwIRUlI10LfsFWn1RIuDWQGekK0BBVUXRe8HB9fA1y
         pgiK1SQipieAiqO4B9kjoy9yUlhx/tdmVPvCUE4RZmfacPTT6AsKID64eSNz2G4yIbzM
         3O3dCMCn+1uMljDims/WoSeDb31KGE7B4glKzNfAoUFw7iPDf4slagUWI/PRdprdWAe0
         m+Wop5fuhZZtQc8Ic990H6UMsei0D+w7c2iEURbh6Ct/Bc4N0s23rwkcpI3Gmi1np7gM
         2IQmqirV2lwYQMoByvM9mBY7wV/GfZBNcA+shRhOud/xImfCbKSeoIfYCaFzsyXFaMn9
         w3Dw==
X-Gm-Message-State: ABy/qLYr48RmKPfvC0apcc6Yt9IFGYn4iho995ufbNLCGndQ/9U3Ei4X
	neE4ahqW8hiMmh6V3y4MOE/i0eywOAw2Vgkn8gAgIqBlY7HaxO9KMlCnH0jj87jUC8rlL18dMOI
	kH5V+OOLFDv49EMyex2CstXWZuA8ijqTm
X-Received: by 2002:a05:6a20:3217:b0:12c:763b:f098 with SMTP id hl23-20020a056a20321700b0012c763bf098mr11583182pzc.11.1689100681958;
        Tue, 11 Jul 2023 11:38:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:3217:b0:12c:763b:f098 with SMTP id
 hl23-20020a056a20321700b0012c763bf098mr11583166pzc.11.1689100681637; Tue, 11
 Jul 2023 11:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <666fb6bf-f3dd-f0b8-877e-9e73acf31c7d@linaro.org> <e7590da1-4586-17d7-b036-ecbfe179e3aa@ispras.ru>
In-Reply-To: <e7590da1-4586-17d7-b036-ecbfe179e3aa@ispras.ru>
From: John Snow <jsnow@redhat.com>
Date: Tue, 11 Jul 2023 14:37:49 -0400
Message-ID: <CAFn=p-Yk9NnaWh=zkq+zTWDBpwyXLhcV6We_86K8LU_4tiL+bQ@mail.gmail.com>
Subject: Re: tests/avocado/replay_kernel: ReplayKernelNormal.test_aarch64_virt failing
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000001e84b806003a662b"
X-TUID: dnCtTpSooBai

--0000000000001e84b806003a662b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2023, 12:43 AM Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
wrote:

> On 10.07.2023 20:14, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi,
> >
> > Per tests/avocado/replay_kernel.py:
> >
> >      def test_aarch64_virt(self):
> >          ...
> >          console_pattern =3D 'VFS: Cannot open root device'
> >
> > the test is succeeding, but Avocado reports an error.
>
> Does the emulator exit when error "Cannot open root device" happens?
> Therefore 'quit' command can't be processed in this case.
>
> >
> > I could get a verbose debug.log, so sharing it here, enjoy!
> >
> > Regards,
> >
> > Phil.
>

Yep, this is a race condition on cleanup.

The machine/qmp libraries will throw an exception if they can't exit
cleanly, which is by design to catch QEMU crashes on the exit/teardown path=
.

If the test expects the QEMU process to exit voluntarily without being
issued 'quit' via QMP, you should use vm.wait() instead of vm.shutdown().

It looks like the QMP library is getting a SHUTDOWN event for which the
reason is "guest-reset". The socket dies and the VM management code
ultimately reports that it wasn't able to shut the guest down cleanly
because it went away unexpectedly, which is true.

(Sorry the traceback is so verbose - perils of asyncio and accidentally
losing debug information means you see a bunch of traces that look almost
identical as they're handled and reported from the backend to the frontend,
then re-contextualized for each library it bubbles up through. Winds up
looking gnarly but it does give incredibly rich detail for the crash, so
thanks for uploading the log! These failures used to crash silently with no
info whatsoever.)

--js

--0000000000001e84b806003a662b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Jul 11, 2023, 12:43 AM Pavel Dovgalyuk &lt;<a =
href=3D"mailto:pavel.dovgalyuk@ispras.ru">pavel.dovgalyuk@ispras.ru</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">On 10.07.2023 20:14, Philip=
pe Mathieu-Daud=C3=A9 wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Per tests/avocado/replay_kernel.py:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 def test_aarch64_virt(self):<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 console_pattern =3D &=
#39;VFS: Cannot open root device&#39;<br>
&gt; <br>
&gt; the test is succeeding, but Avocado reports an error.<br>
<br>
Does the emulator exit when error &quot;Cannot open root device&quot; happe=
ns?<br>
Therefore &#39;quit&#39; command can&#39;t be processed in this case.<br>
<br>
&gt; <br>
&gt; I could get a verbose debug.log, so sharing it here, enjoy!<br>
&gt; <br>
&gt; Regards,<br>
&gt; <br>
&gt; Phil.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Yep, this is a race condition on cleanup.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">The machine/qmp libraries will throw an excepti=
on if they can&#39;t exit cleanly, which is by design to catch QEMU crashes=
 on the exit/teardown path.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">If the test expects the QEMU process to exit voluntarily without being =
issued &#39;quit&#39; via QMP, you should use vm.wait() instead of vm.shutd=
own().</div><div dir=3D"auto"><br></div><div dir=3D"auto">It looks like the=
 QMP library is getting a SHUTDOWN event for which the reason is &quot;gues=
t-reset&quot;. The socket dies and the VM management code ultimately report=
s that it wasn&#39;t able to shut the guest down cleanly because it went aw=
ay unexpectedly, which is true.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">(Sorry the traceback is so verbose - perils of asyncio and accide=
ntally losing debug information means you see a bunch of traces that look a=
lmost identical as they&#39;re handled and reported from the backend to the=
 frontend, then re-contextualized for each library it bubbles up through. W=
inds up looking gnarly but it does give incredibly rich detail for the cras=
h, so thanks for uploading the log! These failures used to crash silently w=
ith no info whatsoever.)</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>--js</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000001e84b806003a662b--
