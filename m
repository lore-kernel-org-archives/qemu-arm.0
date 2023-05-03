Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2888057ejm;
        Wed, 3 May 2023 07:46:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ45yFDQMwU7AsFI0w64VGPtpLFfJR+YTr1sJ1M0rTFUwelxEDbKYKwYPRc36iIw/3e1tYzL
X-Received: by 2002:adf:e241:0:b0:306:3731:f73b with SMTP id bl1-20020adfe241000000b003063731f73bmr198722wrb.43.1683125185782;
        Wed, 03 May 2023 07:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683125185; cv=none;
        d=google.com; s=arc-20160816;
        b=X9tq4dzSBHkbnCkalSHNbbVeO7wPNk3M7l8M4K2zj+ZASwBaC+xZLfmxhrWsGFuy0M
         kB4WOy5DSytnNRWC6fb6O5FoV3WZfWuEo6pFjOCMFeaD5s1LHlibNXARKQqaUxxLK+H1
         ak2YChdl0Im4ebNCazvMm2fLb42409WR8ZhDIGdvl9/czNDfOAPjgK+N7UJdp4o2dKpv
         MLYoEExJyKKGnElysbOWjoAvYMyGbZ8C8A1O3AdMwHkQqpq8pDMow5bmaIWYLjYf7a1K
         8wAjdP7w5u8vwnPcudAs2mmDS75zceWUipZUxb5bq8AmIfjlL6ppuOp0RlPsycgoAEsd
         RVsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=slpm+XM+BqGsQpIT7Hp5TpIX+ty3WkkMBdLYGvAjYpk=;
        b=DRk5yHz6yrrkgPNFShmjV+ZSj29j8GLDGXb00pqvKu8v/4FhQ45LIh+f7bWjjIgO1Q
         1xjpO1pB7pCDHLADSPEGCr62XPMZhf+zlCyEvfPASpfGcab8cipjuJXA49Ul9fkRYlyh
         Xgjax3zTIF37V+iBhUPm9IUph0KgYdSVeF7eT975iF+sLGaupnLRc8OjscvPHzu5Jz5d
         aIaYgDaNQ1yvQ3Wm9JCnNb4/hU0+PkDcuZUBXXNfYlbL9/QnLI0FTGsoo2Bq89qjt3tI
         mCkuzroToAtXZMVZR5ynD/IUlbBUziiYS+rs+ZQ29a3pu991QUbd1odqsD6vxEvoM0jL
         hF+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=U7pfaj9v;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id b5-20020adff245000000b002e4e508d626si19935191wrp.955.2023.05.03.07.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 07:46:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=U7pfaj9v;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 240021FE71;
	Wed,  3 May 2023 14:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683125185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=slpm+XM+BqGsQpIT7Hp5TpIX+ty3WkkMBdLYGvAjYpk=;
	b=U7pfaj9vSgZ/UYLexvGv8IqLyGQ1c10FklH+U+p7DUQGPfg5Z9tLHK2gX4yFjkGN0ZGktD
	ZGh1JFfsT4UxDe35/G1H76vbchoO9oe5BtS+XdbsKBHhg+48hyL9Vf+J7xgSyUqW0YtZZN
	n+bi6FKZNZtbttrqWXZTP6rPZFAxrr4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683125185;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=slpm+XM+BqGsQpIT7Hp5TpIX+ty3WkkMBdLYGvAjYpk=;
	b=ngArVwcmDlzmGfwCBIa9xMdfOE6Bffnq7wUPDYgPxexFidQtRBQSkrnEwxDJZhv9Lx+XeC
	sACBWMFYMrHJAVAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6F7171331F;
	Wed,  3 May 2023 14:46:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Lh8nG8BzUmR7TgAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 03 May 2023 14:46:24 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>, Gerd
 Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, Stefan Hajnoczi <stefanha@redhat.com>, Cleber
 Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Eduardo
 Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>, John
 Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Ilya Leoshkevich
 <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, qemu-arm@nongnu.org, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Beraldo Leal <bleal@redhat.com>, Max
 Filippov <jcmvbkbc@gmail.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno
 <aurelien@aurel32.net>, David Hildenbrand <david@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>, Joel
 Stanley <joel@jms.id.au>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
In-Reply-To: <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
Date: Wed, 03 May 2023 11:46:22 -0300
Message-ID: <87mt2la2wx.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: hl0GmJJv3mPT

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 5/3/23 11:12, Alex Benn=C3=A9e wrote:
>> From: Fabiano Rosas <farosas@suse.de>
>>=20
>> The 'virt' machine uses virtio-net-pci as a fallback when no other
>> network driver has been selected via command line. Select VIRTIO_NET
>> and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors when PCI_DEVICES=3Dn
>> (due to e.g. --without-default-devices):
>>=20
>> $ ./qemu-system-aarch64 -M virt -accel tcg -cpu max
>> qemu-system-aarch64: Unsupported NIC model: virtio-net-pci
>
> With respect to patches 5-17, very few devices need to be present when=20
> configuring --without-default-devices, and thus need to be "select"ed by=
=20
> Kconfig.  You should select a device only if you cannot even start the=20
> machine without --nodefaults.
>

There are some devices that are not explicitly under the scope of
-nodefaults, i.e. they are not part of the "default" logic at vl.c, but
still some code deep within QEMU uses them as fallback in some
situations.

> Anything else should be added by hand to configs/ if you use=20
> --nodefaults.  In particular, failures of "make check" when configured=20
> --without-default-devices are *test* bugs, not configuration bugs.
>

Yes, that makes sense, just keep in mind that this have lead to us not
testing the --without-default-devices build and people just assuming
some devices will always be present. So there's genuine scenarios of us
providing a CONFIG that can never be turned off because everything
breaks.
