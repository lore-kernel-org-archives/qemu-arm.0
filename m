Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp6388dyb;
        Tue, 24 Jun 2025 00:34:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDtklbNBGyiOHl5IX7co4kKh2QXWP2J14gtjzYqubsAQUUsiFW0yUg0aA9XERsgTteNCZgFn7kU6jp7A==@linaro.org
X-Google-Smtp-Source: AGHT+IFwctmN/5LRPmzD5Wi8DTRcs6T+ur02jVMMsjQkC97aAea/iIVvaNKPw1KNTuoL80Ak3fVs
X-Received: by 2002:a05:622a:489:b0:4a7:693a:6ae4 with SMTP id d75a77b69052e-4a77a2b67c0mr259828621cf.28.1750750469589;
        Tue, 24 Jun 2025 00:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750750469; cv=none;
        d=google.com; s=arc-20240605;
        b=XFWYQ8DlQ3iM8EUTx8sh8VojdWTVaXfpqCNLc6M+8qUyWHojbpwA7pt9+HTXEY5Alm
         QUlm7ZaxzE65yGWfrheC3eNONJwHISlzarOxPXRoU8H0btY/doNlyKMJNOfjIiUNYFRS
         dEExDOh5Od6Q+pnLcyCat2Sr2XgwDKLWovf9W+Ia1gN2kO0j9M5RfYyc7+JUHNIxrLej
         yOQe5LpQPn4zbzuYC372JQZ6NL/3HcHPA0r1G3ey4FSuA0mx0v+2Ec8zIIkZVHIIV/W5
         Z7YOjoV22Bf+1mXBYy9YW5rcrnB2mg9PPHKa26E0nrvG5GOIT20Ryi5e9n6HvwRQ+38X
         5bnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=Jq44Z2zwbgcBqtfTirT5nLheLYiyc6cOV9sFWrSjdZA=;
        fh=JsYS1j22pDclmMd5QyUiOMaq3Tnie2u2fULgH65fSIA=;
        b=hx37J3r/OPm+REAzaCb+XaMpSFTr6QWAuh40K/hJhAHnGo/cfxARLGTzkqzJOghJxG
         v46vjFuEahHnfJkhuI9r9NdSzsOLGXVL428KU/mzWx/0NJ7PeSF7efui11TTMTFqsIPN
         jtYHI+KyzPUYZkHFXDY/NfL3Nj4V0ALKjAnMJOM6+GUoID65n7wlekX501gyUD+dSbf+
         NpBTmsEBj0XKZ5LNyYE4lmBdXbnExi+CDhCoAjh9yjeDNawt/36Bj+WRHSmfzXroLhIC
         Toe4s9V1A7rIQGx++Rr1FhyBUvi2ArkbJ5taGPca8OQcYk8u6FvqPTeeApO08B5whs+p
         xRtg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DA8+kHN4;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a77a0d1b80si94781281cf.460.2025.06.24.00.34.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 00:34:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DA8+kHN4;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750750469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jq44Z2zwbgcBqtfTirT5nLheLYiyc6cOV9sFWrSjdZA=;
	b=DA8+kHN4Bt97u0onQxeNRWDR7Iwj/TD9iNusuvALYEx6gKyOVvn2Nxq7oISxqw2PoyfUei
	1ntEAsZuGPewtMqgBnJiFz/9ZrBaSjFz1EI9LqcE1gw/y4Xrbac2/4JnZaolKTBamDgkw0
	XvhAzXMwbfDuL/cEpDCaMhYK80kYhLU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-2m1SBbyzMwa9OUJhhUdqoQ-1; Tue,
 24 Jun 2025 03:34:22 -0400
X-MC-Unique: 2m1SBbyzMwa9OUJhhUdqoQ-1
X-Mimecast-MFC-AGG-ID: 2m1SBbyzMwa9OUJhhUdqoQ_1750750457
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1F86B19560A2;
	Tue, 24 Jun 2025 07:34:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.10])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E32821800287;
	Tue, 24 Jun 2025 07:34:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 4E5A821E6A27; Tue, 24 Jun 2025 09:34:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Joel Stanley <joel@jms.id.au>,  Yi Liu
 <yi.l.liu@intel.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Helge Deller
 <deller@gmx.de>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Andrew
 Jeffery <andrew@codeconstruct.com.au>,  Fabiano Rosas <farosas@suse.de>,
  Alexander Bulekov <alxndr@bu.edu>,  Darren Kenny
 <darren.kenny@oracle.com>,  Leif Lindholm
 <leif.lindholm@oss.qualcomm.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,  Ed
 Maste <emaste@freebsd.org>,  Gerd Hoffmann <kraxel@redhat.com>,  Warner
 Losh <imp@bsdimp.com>,  Kevin Wolf <kwolf@redhat.com>,  Tyrone Ting
 <kfting@nuvoton.com>,  Eric Blake <eblake@redhat.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Yoshinori Sato <ysato@users.sourceforge.jp>,  Troy
 Lee <leetroy@gmail.com>,  Halil Pasic <pasic@linux.ibm.com>,  Akihiko
 Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,  Michael Roth
 <michael.roth@amd.com>,  Laurent Vivier <laurent@vivier.eu>,  Ani Sinha
 <anisinha@redhat.com>,  Weiwei Li <liwei1518@gmail.com>,  Eric Farman
 <farman@linux.ibm.com>,  Steven Lee <steven_lee@aspeedtech.com>,  Brian
 Cain <brian.cain@oss.qualcomm.com>,  Li-Wen Hsu <lwhsu@freebsd.org>,
  Jamin Lin <jamin_lin@aspeedtech.com>,  qemu-s390x@nongnu.org,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  qemu-block@nongnu.org,
  Bernhard Beschow <shentey@gmail.com>,  =?utf-8?Q?Cl=C3=A9ment?=
 Mathieu--Drif
 <clement.mathieu--drif@eviden.com>,  Maksim Davydov
 <davydov-max@yandex-team.ru>,  Niek Linnenbank <nieklinnenbank@gmail.com>,
  =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,  Christian
 Borntraeger
 <borntraeger@linux.ibm.com>,  Paul Durrant <paul@xen.org>,  Manos
 Pitsidianakis <manos.pitsidianakis@linaro.org>,  Jagannathan Raman
 <jag.raman@oracle.com>,  Igor Mitsyanko <i.mitsyanko@gmail.com>,  Max
 Filippov <jcmvbkbc@gmail.com>,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,  "Michael S. Tsirkin" <mst@redhat.com>,
  Anton Johansson <anjo@rev.ng>,  Peter Maydell <peter.maydell@linaro.org>,
  Cleber Rosa <crosa@redhat.com>,  Eric Auger <eric.auger@redhat.com>,
  Yanan Wang <wangyanan55@huawei.com>,  qemu-arm@nongnu.org,  Hao Wu
 <wuhaotsh@google.com>,  Mads Ynddal <mads@ynddal.dk>,  Sriram Yagnaraman
 <sriram.yagnaraman@ericsson.com>,  qemu-riscv@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Jason Wang <jasowang@redhat.com>,  Nicholas Piggin
 <npiggin@gmail.com>,  Michael Rolnik <mrolnik@gmail.com>,  Zhao Liu
 <zhao1.liu@intel.com>,  Alessandro Di Federico <ale@rev.ng>,  Thomas Huth
 <thuth@redhat.com>,  Antony Pavlov <antonynpavlov@gmail.com>,  Jiaxun Yang
 <jiaxun.yang@flygoat.com>,  Hanna Reitz <hreitz@redhat.com>,  Ilya
 Leoshkevich <iii@linux.ibm.com>,  Marcelo Tosatti <mtosatti@redhat.com>,
  Nina Schoetterl-Glausch <nsg@linux.ibm.com>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  Qiuhao Li <Qiuhao.Li@outlook.com>,  Hyman Huang
 <yong.huang@smartx.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  Magnus Damm <magnus.damm@gmail.com>,  qemu-rust@nongnu.org,  Bandan Das
 <bsd@redhat.com>,  Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  Philippe =?utf-8?Q?Ma?=
 =?utf-8?Q?thieu-Daud=C3=A9?=
 <philmd@linaro.org>,  kvm@vger.kernel.org,  Fam Zheng <fam@euphon.net>,
  Jia Liu <proljc@gmail.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Alistair Francis <alistair@alistair23.me>,
  Subbaraya Sundeep <sundeep.lkml@gmail.com>,  Kyle Evans
 <kevans@freebsd.org>,  Song Gao <gaosong@loongson.cn>,  Alexandre Iooss
 <erdnaxe@crans.org>,  Aurelien Jarno <aurelien@aurel32.net>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Peter Xu <peterx@redhat.com>,  Stefan
 Hajnoczi <stefanha@redhat.com>,  BALATON Zoltan <balaton@eik.bme.hu>,
  Elena Ufimtseva <elena.ufimtseva@oracle.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  =?utf-8?B?RnLDqWTDqXJpYw==?= Barrat
 <fbarrat@linux.ibm.com>,
  qemu-ppc@nongnu.org,  Radoslaw Biernacki <rad@semihalf.com>,  Beniamino
 Galvani <b.galvani@gmail.com>,  David Hildenbrand <david@redhat.com>,
  Richard Henderson <richard.henderson@linaro.org>,  David Woodhouse
 <dwmw2@infradead.org>,  Eduardo Habkost <eduardo@habkost.net>,  Ahmed
 Karaman <ahmedkhaledkaraman@gmail.com>,  Huacai Chen
 <chenhuacai@kernel.org>,  Mahmoud Mandour <ma.mandourr@gmail.com>,  Harsh
 Prateek Bora <harshpb@linux.ibm.com>
Subject: Re: [PATCH v2 06/12] python: upgrade to python3.9+ syntax
In-Reply-To: <20250612205451.1177751-7-jsnow@redhat.com> (John Snow's message
	of "Thu, 12 Jun 2025 16:54:44 -0400")
References: <20250612205451.1177751-1-jsnow@redhat.com>
	<20250612205451.1177751-7-jsnow@redhat.com>
Date: Tue, 24 Jun 2025 09:34:07 +0200
Message-ID: <87cyatmw40.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b9ak6Pgvzj9QWHX3z3XFBIS51nXg9aMAg5CPfR0_gQ8_1750750457
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: jCK/6j7E5Ri7

John Snow <jsnow@redhat.com> writes:

> This patch is fully automated, using pymagic, isort and autoflake.
>
> Create a script named pymagic.sh:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
> pyupgrade --exit-zero-even-if-changed --keep-percent-format \
>           --py39-plus "$@"
>
> autoflake -i "$@"
>
> isort --settings-file python/setup.cfg \
>       -p compat -p qapidoc_legacy -p iotests -o qemu "$@"
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
> Then, from qemu.git root:
>
>> find . -type f -name '*.py' | xargs pymagic
>> git grep --name-only "#!/usr/bin/env python" | xargs pymagic
>
> This changes a lot of old Pythonisms, but in particular it upgrades the
> old Python type hint paradigm to the new 3.9+ paradigm wherein you no
> longer need to import List, Dict, Tuple, Set, etc from the Typing module
> and instead directly subscript the built-in types list, dict, tuple,
> set, etc. The old-style annotations are deprecated as of 3.9 and are
> eligible for removal starting in Python 3.14, though the exact date of
> their removal is not yet known.
>
> pyupgrade updates the imports and type hint paradigms (as well as
> updating other old 'isms, such as removing the unicode string
> prefix). autoflake in turn then removes any unused import statements,
> possibly left behind by pyupgrade. Lastly, isort fixes the import order
> and formatting to the standard we use in qemu.git/python and
> scripts/qapi in particular.
>
> Signed-off-by: John Snow <jsnow@redhat.com>

[...]

>  448 files changed, 1959 insertions(+), 1631 deletions(-)

*=C3=84chz*

I hate it when people ask me to split up my mechanical patches...

One split is by subsystem / maintainer.  I've done this a few times, and
it's quite a bother.  Questionable use of your time if you ask me.

There's another split here...  Your pymagic.sh runs three tools.  If you
commit after each one, the patch splits into three.

I understand you pass --py39-plus to pyupgrade to get the type hints
modernized.  If you run it without --py39-plus for all the miscellaneous
upgrades, commit, then run it with --py39-plus for just the type hint
upgrades, commit, the last patch splits again.

Thoughts?
