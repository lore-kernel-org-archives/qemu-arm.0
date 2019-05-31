Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp895379pjq;
        Fri, 31 May 2019 09:54:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz7Xo5PEaEL6WmvyfFIF5nKsjVf7zW1jyZ2C8OlGz8PIeMs+KFLG/pH1jLwOKolpdj+NMSm
X-Received: by 2002:aca:bbc3:: with SMTP id l186mr4742791oif.44.1559321652316;
        Fri, 31 May 2019 09:54:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559321652; cv=none;
        d=google.com; s=arc-20160816;
        b=HoajGVC7mAbTDMA1tghgeC8rT2BYHxqrp/1h6rzlVjDVvp/kmpPDktdJi24MHNtg2d
         n8GbghGxoa1b6OXQFa7UlpHxQwFOpR5S6oryjBXfOMjSFsCZKZqfKl4D1LpEUTzZhVWT
         3nMtRU8B+awXKn8KA5JhwS9ydcaLcDgvcmK8jLNH6g0wubvufLcY5s56Ax+nlBC8IJPC
         vXRUaPHq9H/jGPDlDymoMi5NbdYnYWXu4KAw6ihCenbCW+EXpt81WufDiRIYnXJ6YDT9
         qFH6MwW/hskZlu3jcV/5djYlxgcouB+WKuQZaojleMDQ8rLFzjLlj4al4CwnA4krrEiY
         bFmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=thread-index:thread-topic:content-transfer-encoding:mime-version
         :subject:references:in-reply-to:message-id:cc:to:from:date;
        bh=u7yKnJhlF1k39qOqeWCccFhEI5U8c5VFFraQEVNqIqk=;
        b=wrkwb4jG2eJ/VKPApycbS8ITfmXaAWC7LVXXIjF4anthLyQn3p/uilQSG+zNx53Nid
         uxIpUmKF2yvBvYiswaO6b0TMl6rYkUXjegLCZSXY4lG6oP2tQ8fNA+2rOkhEizm6N4dk
         RiTmHb88G5UP9BI43R3XqGpbo8Um25UjDDwbg+Ewr75IG5fUsFG8tsnLhkP7uS09ESSb
         nZHXkkF02gMEKUYMTZRGeSNcJg5G2vFvuj9mqjE9WDChOMUVGoPLof9PTq2peEGw4Pih
         hMEALsS0YkjnKZIcVo78ez1xRiIboqK3HHNK8ihX1/gNA7loUjlMNAEBYqCQFvJ/3bZd
         I1JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of mrezanin@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=mrezanin@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mrezanin@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id b6si1316981otk.125.2019.05.31.09.54.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 09:54:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of mrezanin@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mrezanin@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=mrezanin@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D279281F25;
	Fri, 31 May 2019 16:54:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD0031001925;
	Fri, 31 May 2019 16:54:08 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 72F7F3F6E4;
	Fri, 31 May 2019 16:54:08 +0000 (UTC)
Date: Fri, 31 May 2019 12:54:08 -0400 (EDT)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	Aleksandar Rikalo <arikalo@wavecomp.com>, 
	qemu-arm <qemu-arm@nongnu.org>, 
	Aleksandar Markovic <amarkovic@wavecomp.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, 
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Samuel Ortiz <sameo@linux.intel.com>, 
	Rob Bradford <robert.bradford@intel.com>
Message-ID: <431872249.25606899.1559321648368.JavaMail.zimbra@redhat.com>
In-Reply-To: <947e851b-4b95-3126-2eaf-d5d16f8b831b@redhat.com>
References: <20190531154735.20809-1-philmd@redhat.com> <CAFEAcA9TJGq-8fMv2amQEEGz9QKCNWYwJxCXrjqSh=Yc87yTww@mail.gmail.com> <947e851b-4b95-3126-2eaf-d5d16f8b831b@redhat.com>
Subject: Re: [RFC PATCH 0/2] target: Build with CONFIG_SEMIHOSTING disabled
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.40.204.19, 10.4.195.19]
Thread-Topic: target: Build with CONFIG_SEMIHOSTING disabled
Thread-Index: vbSVI98EzWnZENu1t63TP56joihEsg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Fri, 31 May 2019 16:54:10 +0000 (UTC)
X-TUID: ABqLUlbn/fbx



----- Original Message -----
> From: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
> To: "Peter Maydell" <peter.maydell@linaro.org>
> Cc: "QEMU Developers" <qemu-devel@nongnu.org>, "Paolo Bonzini" <pbonzini@=
redhat.com>, "Miroslav Rezanina"
> <mrezanin@redhat.com>, "Richard Henderson" <richard.henderson@linaro.org>=
, "Aleksandar Rikalo"
> <arikalo@wavecomp.com>, "qemu-arm" <qemu-arm@nongnu.org>, "Aleksandar Mar=
kovic" <amarkovic@wavecomp.com>, "Aurelien
> Jarno" <aurelien@aurel32.net>, "Alex Benn=C3=A9e" <alex.bennee@linaro.org=
>, "Samuel Ortiz" <sameo@linux.intel.com>, "Rob
> Bradford" <robert.bradford@intel.com>
> Sent: Friday, May 31, 2019 6:40:30 PM
> Subject: Re: [RFC PATCH 0/2] target: Build with CONFIG_SEMIHOSTING disabl=
ed
>=20
> On 5/31/19 6:21 PM, Peter Maydell wrote:
> > On Fri, 31 May 2019 at 16:47, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com>
> > wrote:
> >>
> >> Amusingly Miroslav and myself hit this issue at the same time.
> >>
> >> Currently there is no way to pass a CONFIG_X to sources in target/,
> >> except via a Makefile rule (and filling with stubs).
> >>
> >> Paolo says this is on purpose, CONFIG_X selectors are meant for
> >> devices and we try to avoid having config-devices.mak in
> >> config-target.h.
> >=20
> > ...but some things in target/ are devices (like the Arm CPUs,
> > which inherit from TYPE_DEVICE).
> >=20
> > Is there a way we can have a Kconfig fragment that expresses
> > "if you asked for an Arm CPU then this should 'select SEMIHOSTING'" ?
>=20
> Yes, but inversely, we can also deselect a feature, and all features
> that requires it get deselected. My guess is Miroslav is building a
> KVM-only QEMU, but upstream does not allow to build ARM without TCG.
>=20
> I'll see what happened to Samuel series "Support disabling TCG on ARM"
> and see if it can be salvaged:
> https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02451.html
>=20
> I suppose in this thread:
> https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg05641.html
> you refer to this series (not yet merged):
> https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg03137.html
>=20
> I'll try to figure what "KVM injection of interrupts" is.
>=20

What about CONFIG_ARM_VIRT - can we use it to introduce dependency on
CONFIG_SEMIHOSTING or is there valid scenario of qemu build with CONFIG_ARM=
_VIRT
enabled and CONFIG_SEMIHOSTING disabled?

Mirek
--=20
Miroslav Rezanina
Software Engineer - Virtualization Team Maintainer
