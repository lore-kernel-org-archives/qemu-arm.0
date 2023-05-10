Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp3213829ejq;
        Wed, 10 May 2023 00:12:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7SGXYN4wl3v0dGZQduaXoYFerTfN2nkyaeyz2wYTByab8U0kGhTBz1UmYo9LvLmO0rtOY7
X-Received: by 2002:a05:622a:1391:b0:3f3:93cd:ff39 with SMTP id o17-20020a05622a139100b003f393cdff39mr12582293qtk.31.1683702748127;
        Wed, 10 May 2023 00:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683702748; cv=none;
        d=google.com; s=arc-20160816;
        b=T+bEomgD3B91kgde4/FBsGoRLEy7Xs4xdwOvkPW/JqCqWqpWoVGAlKJozvTRxoHplL
         o4MCNziNVtvrJCslkmVJ9Thlf74XjtOH8OjTXQYWfxHTK6DNMXxvLtirNo3VZPuLanfL
         OpPxYQtxyR56GP3JuZB2IN9i566nKJRmxNNR4VY/iFjT3eudD5pSxe+5dn8Abz5zxGIC
         VnFEDeRSE52mhQlOrKyrAfD+WH3iOSKubiGGwNgYKU/LnZJRCpIdkj5fxJ0VP+jkbHF9
         F8az/wimlrz8En320Dj4xnU0dLdK5D1/yp9j9NiAxPSbf8dvQR64vK926DLLMNmgVvUs
         UE3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:feedback-id:dkim-signature
         :dkim-signature;
        bh=JwNLOWDmx8X5jGyC6z0jdlCEO5VjziJtkp1psZHciWY=;
        b=kWYaTAXEFJ0PD6GWvT1ylMDRef+deKUW5Vrr65J0dV2hJWADAnGBww7NHIAtgaW32r
         Zd3QfvOkrZYxbq8d5AkDT61coUaptIR5fBN2bWcH7rqnhmHV7TQnTeiTZ4fty0hJyaqC
         abmuEE9GwHYNP/hEKF0A96D1ORJ58qfPg/cORHuVlrjmf89DxniVlFHoN5CyN7VfT27d
         bShzmlTOaKB1mfH0EWR5tMWCLUh4hOA/DuO7WB0FXgdO8DiHrovdUTtxGYzkNcH7l5hJ
         mHZ9bhpQoYd+F08RAQ3zy9QTJZfSHyZ/NNGKlVl0PtQaNnwFU5G7t5DwJQs2ChETXylh
         xDNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@flygoat.com header.s=fm1 header.b=cwYjx0PG;
       dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=CqX5H9LX;
       spf=pass (google.com: domain of jiaxun.yang@flygoat.com designates 66.111.4.224 as permitted sender) smtp.mailfrom=jiaxun.yang@flygoat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=flygoat.com
Return-Path: <jiaxun.yang@flygoat.com>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com. [66.111.4.224])
        by mx.google.com with ESMTPS id b14-20020ac85bce000000b003ef40d1f0e4si1330103qtb.178.2023.05.10.00.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 00:12:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jiaxun.yang@flygoat.com designates 66.111.4.224 as permitted sender) client-ip=66.111.4.224;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@flygoat.com header.s=fm1 header.b=cwYjx0PG;
       dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=CqX5H9LX;
       spf=pass (google.com: domain of jiaxun.yang@flygoat.com designates 66.111.4.224 as permitted sender) smtp.mailfrom=jiaxun.yang@flygoat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id AE4D658035C;
	Wed, 10 May 2023 03:12:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 10 May 2023 03:12:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1683702747; x=1683709947; bh=JwNLOWDmx8X5jGyC6z0jdlCEO5VjziJtkp1
	psZHciWY=; b=cwYjx0PGS89THA7+dKLflE1eh3FnmaLYZrSqzOpgOpw0ee+WmKI
	iL57V7Nd/Ix8ciFR02Uw++xnz0A/YfXwVdigFBRm5tWVgYBJU3DWfXDUI/833UVj
	JVSOKaPQRZV3ae9WbcsheVXzF6K5ie6iZFy4JOCBby/spZ3v0atvoVJRv+0vJqSK
	itdBcAHk3WgV+knXGIiH3MZt0thtjw2+80S9sn2gtCLoFWXBpVituylnZn2TvV1I
	pEGxH6dNOiM5dRY/PRxds870B7ygL3E3vIGGy0HMmf4r/QvSIpd8PPFIYECRrAVy
	Mf4JYYAE8/3IkWzeEjlaYCNIMkG8G2bpBTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683702747; x=1683709947; bh=JwNLOWDmx8X5jGyC6z0jdlCEO5VjziJtkp1
	psZHciWY=; b=CqX5H9LXnaUoSnVL/EXGszh63axNXg1w8CO1K65z80MRd0fggPR
	mP4G0mnnKADtX63LLMMQGevCccPovDVmyU+dm6urRNcLXMdcAn1CGGVoq4hN2mhp
	KZHDqMNHZF8P+6NC7egtcKAuqx50N2o099BE6sp6vdNHqYUw0h0xb/YG/6TvmhCw
	mvWm2UCDvfPpfQ3uZyfmLSc5Ay7q3AsJV/aXf8aOz5CzxwFI35vOIXayEanMU5sd
	PftaIe5BHFxF7orssHyw0J3p0WxPMFfMp7/VVadxqoA9/oOILm9Gu6+kn8eXeJSG
	WZmLFVUd0DXGq0I3uXeRXTfGzDSOo6hXbJw==
X-ME-Sender: <xms:2kNbZObwW_qii_JishhhQaMNZQWMao7pAOHkmTERUV36W0xSfqsrXw>
    <xme:2kNbZBZSkgP1t_5zUOnjEGCrtp7enhu27kAucriqsAgzZLzTroRU6o0TjV_o-5C3T
    XROekruVnsyJ3c_Q2s>
X-ME-Received: <xmr:2kNbZI8PtbL8GGU_Xfk9SO1Y4c7pXrWlx8SotCt3rg4BDtDHxBk0YD_nghNaXfm6OE2x>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegfedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhephfduueeguefhuefgheevfedttddujeffjeeujeehheegtddt
    teffjeefleeiudelnecuffhomhgrihhnpehmihhpshdrtghomhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
    lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:2kNbZAqGyWGA9aekjuPQqhvRqBwF3_N7xFZU1H-Yfsv6-6K1dMemOw>
    <xmx:2kNbZJrStio0rTS0Y6k7tUqZWPmrYuxjMz8k85acqm1FPqKyJM4Ijg>
    <xmx:2kNbZOSj7KMQmTY0tX4_fcAVVlpA-CeeNHMeE0Cu-EOOe2ewBtsOOg>
    <xmx:20NbZM-ynCzyKDvgoc2EfWamGOymrMnEWJg7_qa-G2l9jPXBgHPzBw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 May 2023 03:12:21 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH 21/22] tests/avocado: use http for mipsdistros.mips.com
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230503091244.1450613-22-alex.bennee@linaro.org>
Date: Wed, 10 May 2023 08:12:10 +0100
Cc: QEMU devel <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?utf-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Joel Stanley <joel@jms.id.au>,
 =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9F16A468-D51F-4462-9720-D4B60C2B13B6@flygoat.com>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-22-alex.bennee@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3731.500.231)
X-TUID: aZGhh11kGKgV



> 2023=E5=B9=B45=E6=9C=883=E6=97=A5 10:12=EF=BC=8CAlex Benn=C3=A9e =
<alex.bennee@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> As the cached assets have fallen out of our cache new attempts to
> fetch these binaries fail hard due to certificate expirty. It's hard
> to find a contact email for the domain as the root page of mipsdistros
> throws up some random XML. I suspect Amazon are merely the hosts.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Hi  all,

Just reached MIPS to get certification fixed.

Thanks
- Jiaxun=
