Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3610304lff;
        Fri, 20 Dec 2019 05:32:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqzyApQkNJ4F8mNYOz434nB79rwHA2z1uYNBCx82+0r0zoWAhlhH0l6NM9j8Nps3dTM7+Ql+
X-Received: by 2002:a05:620a:4db:: with SMTP id 27mr13821501qks.146.1576848746142;
        Fri, 20 Dec 2019 05:32:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576848746; cv=none;
        d=google.com; s=arc-20160816;
        b=iw4xOSlWxnZWpIBKfTLMR2evAHEhfFtuIqSi+RKOcw65WZp1vWFmOqTMGQVdQTEX38
         HVakT6nBmcR7P/VT+7M6HQLMzSjLKSLiPddhHjy/UrznA0HybxQnvZUb3eMzCoAUN6LM
         7+4gD07ZtBjzKiSQdcnachNgI7CVk+GPoZKrqlxl18kAvcxdMb1s4XAfhO5Vtp6CUCto
         iqA3Bz0x9TmlvNK6NW4IX8wF2aHpj+fyBllBtkxCjVCgLSePDg4DQ8uGs4qYXJpQi1oa
         x/v9G9I59vqd+b8SaWUTgkDbMPCtFEGZveJx4oCSBhwdFeesNmDnyMnedGURauM+6b0v
         JHHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0fLQEqhGLRF+qLVy+VmGtZowBiX6uE7sCge73L4Z+Gk=;
        b=GG53AjXSWeHoEPc4UyIF47XVAUIa8SKZoICS3gnIzSP0uZqlLbxjSEz0Dkux9dMtOs
         Oimsm8XMnXNN1NaRUWyrSUvR0n3Pbcz1D5QCvJ6tPxKYkssZz5gH97PVQtYXfXKzY1uE
         Y/SVnH9ue5g9XD7wpTgmxSkKee/EbGDvlx0shmcZgm5xTU5oUESbB+N/h5Tfn5DWDltr
         DdLuoNeaI73Zdj8DIdIHFtQcTHJ35sciHQvDZaYpEq3U8Tz5kUZFfuBa/n0/yXf+MH/U
         8XxvvoVUXLi4YwDbvjXCnfrbivlYjxCHFZ108B2Ivp0g5kcN76XC7w0kfiunoYkMsUtH
         isIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JsAxQZ17;
       spf=pass (google.com: domain of mlureau@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=mlureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mlureau@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id 21si5294121qkf.293.2019.12.20.05.32.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Dec 2019 05:32:26 -0800 (PST)
Received-SPF: pass (google.com: domain of mlureau@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JsAxQZ17;
       spf=pass (google.com: domain of mlureau@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=mlureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576848745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0fLQEqhGLRF+qLVy+VmGtZowBiX6uE7sCge73L4Z+Gk=;
	b=JsAxQZ17VaSuoadLUKvrc9KpZA6SJya6m4WVdQS7Y1/Iba57FE13xu73NF13zcez4T+0Rk
	s5u9ShCZTziquBeb8v+DSznP4UJpdIBDEezgwh+v/FdGg0GG6P03XN88g9hEuFlt0jLwKE
	f6jm6tvaWDVQNp6CPdl8n5i0yIuISC0=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-jG1wclfANc2RCiVVLwbPxg-1; Fri, 20 Dec 2019 08:32:24 -0500
Received: by mail-ot1-f69.google.com with SMTP id z3so4592717oto.22
        for <alex.bennee@linaro.org>; Fri, 20 Dec 2019 05:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0fLQEqhGLRF+qLVy+VmGtZowBiX6uE7sCge73L4Z+Gk=;
        b=oi8q55iWCbCQUyjia/KmLIQKe+ayV2nV2sG0fkKKHwGSVxXRY/GYKc2AqGvnYO0+mU
         b/wuT7RNrOzE9iPl4L/6k61rmGoGqD1lPwXw1FSvAWxXsmxQ+CRHOvwBIWBOGJFFEJSa
         1wGrf6UrOwin9A10JJ8NRbi2mJfSmtVTzLipEnldc2x9TJUxigpNxACWbVnaz1HiKJFX
         vfXIlgmLd8+yt7LF2+hCxmwL7DmI8FCV9UTFOvYy814c8UHbLETTY2DkRFcpE0chD10j
         JVNaYSmUCdGHwmPjuh4lr65uXGIF83UqVyebT35fkV0b6DtyraHmmi2Q0cDZ3wRXjkYn
         COxQ==
X-Gm-Message-State: APjAAAVRMnNr+lQD9CWZof3Y4b/y6Y4CS1SHEqecl+acrVqQvvH/ut04
	trgxWo2orC7SmWK8+iA7V9l4w/L/5We52UxGYP1vdlJeReBvwJgynkeFauyeSbGENMXZZEuhcQe
	wwwVX7uL/MJrrm0HFjZYzR+dGrh2Ow8wp
X-Received: by 2002:a9d:730e:: with SMTP id e14mr14225399otk.62.1576848743575;
        Fri, 20 Dec 2019 05:32:23 -0800 (PST)
X-Received: by 2002:a9d:730e:: with SMTP id e14mr14225352otk.62.1576848743262;
 Fri, 20 Dec 2019 05:32:23 -0800 (PST)
MIME-Version: 1.0
References: <20191218172009.8868-1-philmd@redhat.com>
In-Reply-To: <20191218172009.8868-1-philmd@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 20 Dec 2019 17:32:11 +0400
Message-ID: <CAMxuvayWibPU6_mEcYEqsWUhSRra33MvwPrbAYr254ZYaYKBgg@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] chardev: Use QEMUChrEvent enum in IOEventHandler typedef
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Andrzej Zaborowski <balrogg@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Alistair Francis <alistair@alistair23.me>, 
	Antony Pavlov <antonynpavlov@gmail.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>, 
	Fabien Chouteau <chouteau@adacore.com>, KONRAD Frederic <frederic.konrad@adacore.com>, 
	Peter Chubb <peter.chubb@nicta.com.au>, Alberto Garcia <berto@igalia.com>, 
	Michael Walle <michael@walle.cc>, Thomas Huth <huth@tuxfamily.org>, Joel Stanley <joel@jms.id.au>, 
	Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@de.ibm.com>, Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, 
	Corey Minyard <minyard@acm.org>, Paul Burton <pburton@wavecomp.com>, 
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Aleksandar Markovic <amarkovic@wavecomp.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Gerd Hoffmann <kraxel@redhat.com>, 
	Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
	Zhang Chen <chen.zhang@intel.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, 
	Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	qemu-block <qemu-block@nongnu.org>, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org
X-MC-Unique: jG1wclfANc2RCiVVLwbPxg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 2pT81QEa9pmm

On Wed, Dec 18, 2019 at 9:20 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Hi,
>
> After this chat on #qemu IRC:
> 13:20 <stsquad> so what is the difference between a IOReadHandler and IOE=
ventHandler?
> 13:25 <f4bug> stsquad: one is in-band and the other out-of-band?
> 13:26 <stsquad> f4bug: ahh yes it seems so - connect/disconnect etc...
> 13:27 <f4bug> see QEMUChrEvent for IOEventHandler
>
> I thought it might be a good opportunity to make the IOEventHandler
> typedef meaning more obvious, by using the QEMUChrEvent enum.
>
> To be able to build I had to explicit all enums ignored in the
> switch(event) statement by these frontends.
>
> Then I used a coccinelle spatch to change the various IOEventHandler.
> I don't think the last patch can be split, but suggestions are welcome!
>
> Regards,
>
> Phil.
>
> v2:
> - do blindly ignore all events using a 'default' case.
>
> Philippe Mathieu-Daud=C3=A9 (14):
>   hw/ipmi: Remove unnecessary declarations
>   hw/ipmi: Explicit we ignore some QEMUChrEvent in IOEventHandler
>   hw/char/terminal3270: Explicit ignored QEMUChrEvent in IOEventHandler
>   hw/usb/dev-serial: Explicit we ignore few QEMUChrEvent in IOEventHandle=
r
>   hw/usb/redirect: Explicit we ignore few QEMUChrEvent in IOEventHandler
>   ccid-card-passthru: Explicit we ignore QEMUChrEvent in IOEventHandler
>   vhost-user-crypto: Explicit we ignore some QEMUChrEvent in IOEventHandl=
er
>   vhost-user-net: Explicit we ignore few QEMUChrEvent in IOEventHandler
>   vhost-user-blk: Explicit we ignore few QEMUChrEvent in IOEventHandler
>   virtio-console: Explicit we ignore some QEMUChrEvent in IOEventHandler
>   monitor/qmp: Explicit we ignore few QEMUChrEvent in IOEventHandler
>   monitor/hmp: Explicit we ignore a QEMUChrEvent in IOEventHandler
>   chardev/char: Explicit we ignore some QEMUChrEvent in IOEventHandler
>   chardev: Use QEMUChrEvent enum in IOEventHandler typedef

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

(I guess Paolo will take the series for next PR?)

>
>  include/chardev/char-fe.h       |  2 +-
>  include/chardev/char-mux.h      |  2 +-
>  include/chardev/char.h          |  4 ++--
>  backends/cryptodev-vhost-user.c |  7 ++++++-
>  chardev/char-mux.c              |  8 ++++----
>  chardev/char.c                  |  9 +++++++--
>  gdbstub.c                       |  2 +-
>  hw/arm/pxa2xx.c                 |  2 +-
>  hw/arm/strongarm.c              |  2 +-
>  hw/block/vhost-user-blk.c       |  7 ++++++-
>  hw/char/cadence_uart.c          |  2 +-
>  hw/char/digic-uart.c            |  2 +-
>  hw/char/escc.c                  |  2 +-
>  hw/char/etraxfs_ser.c           |  2 +-
>  hw/char/exynos4210_uart.c       |  2 +-
>  hw/char/grlib_apbuart.c         |  2 +-
>  hw/char/imx_serial.c            |  2 +-
>  hw/char/ipoctal232.c            |  2 +-
>  hw/char/lm32_juart.c            |  2 +-
>  hw/char/lm32_uart.c             |  2 +-
>  hw/char/mcf_uart.c              |  2 +-
>  hw/char/milkymist-uart.c        |  2 +-
>  hw/char/nrf51_uart.c            |  2 +-
>  hw/char/pl011.c                 |  2 +-
>  hw/char/serial.c                |  2 +-
>  hw/char/sh_serial.c             |  2 +-
>  hw/char/terminal3270.c          |  7 ++++++-
>  hw/char/virtio-console.c        |  7 ++++++-
>  hw/char/xilinx_uartlite.c       |  2 +-
>  hw/ipmi/ipmi_bmc_extern.c       | 12 +++++++-----
>  hw/mips/boston.c                |  2 +-
>  hw/mips/mips_malta.c            |  2 +-
>  hw/riscv/riscv_htif.c           |  2 +-
>  hw/riscv/sifive_uart.c          |  2 +-
>  hw/usb/ccid-card-passthru.c     |  7 ++++++-
>  hw/usb/dev-serial.c             |  6 +++++-
>  hw/usb/redirect.c               |  7 ++++++-
>  monitor/hmp.c                   |  6 +++++-
>  monitor/qmp.c                   |  7 ++++++-
>  net/filter-mirror.c             |  2 +-
>  net/vhost-user.c                |  9 +++++++--
>  qtest.c                         |  2 +-
>  tests/test-char.c               |  6 +++---
>  tests/vhost-user-test.c         |  2 +-
>  44 files changed, 111 insertions(+), 56 deletions(-)
>
> Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>
> Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
> Cc: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
> Cc: Andrzej Zaborowski <balrogg@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Max Reitz <mreitz@redhat.com>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: Antony Pavlov <antonynpavlov@gmail.com>
> Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
> Cc: Fabien Chouteau <chouteau@adacore.com>
> Cc: KONRAD Frederic <frederic.konrad@adacore.com>
> Cc: Peter Chubb <peter.chubb@nicta.com.au>
> Cc: Alberto Garcia <berto@igalia.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Thomas Huth <huth@tuxfamily.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Amit Shah <amit@kernel.org>
> Cc: Corey Minyard <minyard@acm.org>
> Cc: Paul Burton <pburton@wavecomp.com>
> Cc: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Aleksandar Markovic <amarkovic@wavecomp.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Zhang Chen <chen.zhang@intel.com>
> Cc: Li Zhijian <lizhijian@cn.fujitsu.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-block@nongnu.org
> Cc: qemu-s390x@nongnu.org
> Cc: qemu-riscv@nongnu.org
>
> --
> 2.21.0
>
