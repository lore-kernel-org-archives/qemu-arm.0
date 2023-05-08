Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2340468ejq;
        Mon, 8 May 2023 15:24:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6tAio+673FScXN0zwxHEpT2sA05hfjVfdfMJBlUe54IqLzCh1947SAfHNgai32aPP05WOS
X-Received: by 2002:ad4:5b8f:0:b0:61d:be1e:7c4e with SMTP id 15-20020ad45b8f000000b0061dbe1e7c4emr17041384qvp.12.1683584641005;
        Mon, 08 May 2023 15:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683584640; cv=none;
        d=google.com; s=arc-20160816;
        b=todItD7teNS/uTOWTFSOmjkoCoVmN8LJ52DuQ2l6dSB94YH3OY4lMGxZ1i+0e3hrF3
         C8joJ1b8mxvT5pN9mw9smaa4GMKVQjGyvLwVRGbxjcEJmV/cx1fVDwrnPy50fslqwaY2
         6jSCm2284IJoEiWQbZCRWrPqeDU4DeeEvsmSixLmUV1+rfbpFgZW3/kfNjpLv4i3+Md4
         8Cqhj7DufDeyBiqrqnZIUG5+MUSaKmartuAWRVVua9EKrsgwkASiIGy7rdsbfZ+M067s
         MN6eUOTueBY7w8ngQ0gPEfFlO/UpsQLK2ovWUfJhEr8bu8Wupk1xw5xZDg1oRVBjel9U
         N2tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zureYO06k8lyXk0X/C4wQv289tsk/aNMUI3ppydUuCk=;
        b=B4OpGH57ICQ4WPO4yuzWWAP7G5fOKnXGxVGnodCUsozUFK5oKPNbxfbilAWjXDerMT
         1Q9mEdgvTik6Aog+JB2ZBNlurAvoIM4yEf966JaW8CvUhdadOZjPPdxejk+oTghk1ER1
         QyxWaEgTwj+ce8SdtyCzanaAVwT08t5zodBeoj2+LAOLWanuVYXSq7Qb3PMV4i6b2gWb
         vjudeieFJRIr+hvQ6YpRmhKXTzWYHyibSGpp33X75+8Ss9kmUm/xTAUS11Kp54b+WlYo
         iYBoFoBgHOH7X/KVOyr0oe7/ooMaJfI6pvYRVTQfD/Wtf4AkKsFahK/8giU3MR/AIeJi
         bagw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jO3uXnSw;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 11-20020a0562140d6b00b005f99f9674e7si390215qvs.92.2023.05.08.15.24.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 15:24:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jO3uXnSw;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683584640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zureYO06k8lyXk0X/C4wQv289tsk/aNMUI3ppydUuCk=;
	b=jO3uXnSwUiHLXrEQpBUx/HQYLLlEMp4X4Umln2Kj+AVYX4JYREn3oSVyWk0N8x7CPCgXww
	54eDPi3QPCVJjUa5eyATbio9mRX148+AxBZI0QCQ1+kXXjln1m7Q8xVpHSHN3DxovxetCe
	Uo+w33Op/cetnMwyG5Lbt6CkUhacOxI=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-AsRxbHNjPfiAmUzJ8ZVdfw-1; Mon, 08 May 2023 18:23:59 -0400
X-MC-Unique: AsRxbHNjPfiAmUzJ8ZVdfw-1
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-43483abf52aso2692048137.1
        for <alex.bennee@linaro.org>; Mon, 08 May 2023 15:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683584638; x=1686176638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zureYO06k8lyXk0X/C4wQv289tsk/aNMUI3ppydUuCk=;
        b=e6xI0qLYmcWAVEkCeJqRyjlRbMrtTpbf62sgU+ohRLyRBg4NAsnAIWiWUBcoSOnuar
         pGqb/eSE1Kizh+BLayJzqH7ON2+cAd76AxpdlM0F2IWktXSLkTZIVPo9u+Br/kErSLaC
         wS6odhCNs76D29FVh9LH+mGtfWyFzNAQtxYJQJ47EhaiHJg4lmsf1lIE4/PnsTsPg6Z2
         1b9rGJJcosA6ILGSnBjAUaGv3J7KfhP3MVvRFkxuMpIy6Dx0ixOV2Lb1m6kLTit9VphH
         ETQuC4L2tulQkyHz0ZungXnLRDjqUYePE08sXYrR+bDG3aqlK9eAr5UWPR+03YOWDP4h
         PpEg==
X-Gm-Message-State: AC+VfDxI4n7unuJdoTmnOJIItltTQc0/q5L+8AMovFa4jpSwY7w4uMtV
	Cv7Q8jeXKWmdf8VK8VYkSjxhl6kVow3laJoGwCyCGR80MlbhnfeD5Oj2sNqt3VS/GPtvFn/Leak
	scJgWkHMiny075yPMQi9XfwPzYkO+89dG
X-Received: by 2002:a05:6102:316f:b0:42f:eb31:810 with SMTP id l15-20020a056102316f00b0042feb310810mr4064388vsm.17.1683584638423;
        Mon, 08 May 2023 15:23:58 -0700 (PDT)
X-Received: by 2002:a05:6102:316f:b0:42f:eb31:810 with SMTP id
 l15-20020a056102316f00b0042feb310810mr4064383vsm.17.1683584638153; Mon, 08
 May 2023 15:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org> <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
 <87y1m5s9yl.fsf@linaro.org> <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
 <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
 <e7185f74-f041-05b1-0f76-bab6d724e796@redhat.com> <878re4cl1u.fsf@suse.de>
In-Reply-To: <878re4cl1u.fsf@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 9 May 2023 00:23:47 +0200
Message-ID: <CABgObfYYFfGk2X6M5MxbEbVqCYOp1Km53xkTNrfHwkK=aZOpyw@mail.gmail.com>
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
To: Fabiano Rosas <farosas@suse.de>
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
	Andrew Jeffery <andrew@aj.id.au>, qemu-s390x <qemu-s390x@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Beraldo Leal <bleal@redhat.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>, 
	Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000004e8e7605fb36186f"
X-TUID: 9R0F6GKrpowN

--0000000000004e8e7605fb36186f
Content-Type: text/plain; charset="UTF-8"

Il gio 4 mag 2023, 14:56 Fabiano Rosas <farosas@suse.de> ha scritto:

>
> It's a bit hard to maintain the original intention with just
> documentation. Couldn't we require that --without-default-devices always
> be accompanied by --with-devices?


Maybe, but why would it be bad to just patch the default .mak file?

And more to the point of Peter's
> question, couldn't we just leave the defaults off unconditionally when
> --without-default-devices is passed without --with-devices?
>

No, for example RHEL adds a lot of devices and is perfectly usable without
--nodefaults, but we still use --without-default-devices because we want
any new config to be opt in, unless it's always needed.

The coupling of -nodefaults with --without-default-devices is a bit
> redundant. If we're choosing to not build some devices, then the QEMU
> binary should already know that.
>

--without-default-devices is not about choosing to not build some devices;
it is about making non-selected devices opt-in rather than opt-out.

Paolo


> Just to be clear, -nodefaults by itself still makes sense because we can
> have a simple command line for those using QEMU directly while allowing
> the management layer to fine tune the devices.
>
> In the long run, I think we need to add some configure option that gives
> us pure allnoconfig so we can have that in the CI and catch these CONFIG
> issues before merging. There's no reason to merge a new CONFIG if it
> will then be impossible to turn it off.
>
>

--0000000000004e8e7605fb36186f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 4 mag 2023, 14:56 Fabiano Rosas &lt;<a href=3D"=
mailto:farosas@suse.de">farosas@suse.de</a>&gt; ha scritto:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><br>
It&#39;s a bit hard to maintain the original intention with just<br>
documentation. Couldn&#39;t we require that --without-default-devices alway=
s<br>
be accompanied by --with-devices?</blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Maybe, but why would it be bad to just patch t=
he default .mak file?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">And more to the poi=
nt of Peter&#39;s<br>
question, couldn&#39;t we just leave the defaults off unconditionally when<=
br>
--without-default-devices is passed without --with-devices?<br></blockquote=
></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">No, for example =
RHEL adds a lot of devices and is perfectly usable without --nodefaults, bu=
t we still use --without-default-devices because we want any new config to =
be opt in, unless it&#39;s always needed.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>The coupling of -nodefaults with --without-default-devices is a bit<br>
redundant. If we&#39;re choosing to not build some devices, then the QEMU<b=
r>
binary should already know that.<br></blockquote></div></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">--without-default-devices is not about choo=
sing to not build some devices; it is about making non-selected devices opt=
-in rather than opt-out.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
<br>
Just to be clear, -nodefaults by itself still makes sense because we can<br=
>
have a simple command line for those using QEMU directly while allowing<br>
the management layer to fine tune the devices.<br>
<br>
In the long run, I think we need to add some configure option that gives<br=
>
us pure allnoconfig so we can have that in the CI and catch these CONFIG<br=
>
issues before merging. There&#39;s no reason to merge a new CONFIG if it<br=
>
will then be impossible to turn it off.<br>
<br>
</blockquote></div></div></div>

--0000000000004e8e7605fb36186f--
