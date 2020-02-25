Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp937585lfg;
        Mon, 24 Feb 2020 16:13:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqydS9PnPuGneHWfp9Acehz3xNfDBbt6CnQd8Fae3uWg4XbKanrZO4znwDZHQsZgizSdDxRs
X-Received: by 2002:ad4:48c6:: with SMTP id v6mr46213070qvx.207.1582589627141;
        Mon, 24 Feb 2020 16:13:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582589627; cv=none;
        d=google.com; s=arc-20160816;
        b=Qlb61Ihaa5Ai656rNiWH5Vr76HhyvvfuQacNUyMM9gcKIJaqZIqxwhqEt7mTVUxFfy
         MtaW6MinULInMUHQRiMoRICF21jF4Jgmq4LaxadwxlzpjtSRTE1pSra2mZC4n+S6qpqh
         lRX8omITfImlpt5szQiDriUmgAkyuFrt7leDWijizaMK71t5Cb3LrcYgnc5UktgE2Yr5
         tBqZCHs9RT5gLDqfTWobapUeQqexVi/k3uIStqJ3mmwJYK5LkrEXiH5k57Ysv0rkjWAu
         jYVhsjrE7ZY2rk9u57JNLh9nJdxMymsBBpT8pm/ipurcmJAZgvQONX71wWY0OYj3wH4b
         qIkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Uz+5TqGYJX413m3vBqwUBxgi2mlKgOtQufLgjoZ7Z4A=;
        b=oWry918f6Tce4UxfdeYmRO3esMtUBZU24NdEw9WDwc9WlGsl1V2Ot99hggddid/VaO
         DbF5LKSncQHdUEQ45LFrsbWEbnTQ/to7PNzT96X3O3996uR6c3/xK06yMSRNdZgu+XrB
         I+DE/U5+aG31G82F7PMG1IfzPbItDhOv5s5u9NP+kpW6J7e9JgcHMK/1K2Mlp44TYVCJ
         ZrCfu5VAdytoJ1T+Ra2CrQdrEhNaA5hObB0ZLvwnyHdTBXE1IEu/yrffKpFOW6Oe06RO
         NKUxz+v4p+kdg318e8jfB5HMNfLeNb68e3Bv/50n052hEaNWQzPlVl3P14LfsGXmieJb
         mhaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="kacg/JqH";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dg4si6225483qvb.149.2020.02.24.16.13.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 16:13:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="kacg/JqH";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6Nr8-0005VB-Jt
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 19:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51147)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j6Nqi-0005R4-5W
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 19:13:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j6Nqg-00016t-Lu
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 19:13:20 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:41642)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j6Nqg-00016Z-ET; Mon, 24 Feb 2020 19:13:18 -0500
Received: by mail-lj1-x241.google.com with SMTP id h23so12085819ljc.8;
 Mon, 24 Feb 2020 16:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Uz+5TqGYJX413m3vBqwUBxgi2mlKgOtQufLgjoZ7Z4A=;
 b=kacg/JqHCIaMWGX8iYVb2u3lieLgEpHe9lNMN94eq6LbYWc6yFNcG/N84IkfngDxxT
 tqDWJMqKmogzETsol1sbFFh6fuedVpZBuf3JC6bGIecpHWGZNshCY3BqhVQJfKvD7eNm
 G7JAAb+/qBB6zBzpu8Ej18qw0a5/W906W9pOhAQQZO55AOFYUG5E4cYzIDFXdBhJSYzH
 K/NQxkhwWsFZAghgQyHxjeqCTOuffRjYBM5uEVE679ebDaZl3QbGfBp83V/etp/nJ9n3
 wqInlPWdYUfc2AEO872SwzwBhduWXEf8vbwVL37fVpsJAWNtUJoOgUXY+D3jP0910Q1A
 f9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Uz+5TqGYJX413m3vBqwUBxgi2mlKgOtQufLgjoZ7Z4A=;
 b=ZuYAgyqvGboMnpX6XIn9fXp0/4IHscKfkpdg+P4G2dlsukWiOxYlIiJHG0CAjGJ/cq
 VA+fSPFVq0sQSHNyx9CXLZEqq5hxk7NarOYuQiydP9/NZwDYiHu+hT5LNXj4BO2ngmZ3
 M1OtbSaSQ75Kzw++0L6EsG83VMISX1v7aqC1+yMil7ivDNTHCjr3HJ3DimuvipuTkTlr
 kqfRpDHlL2H4cj32Jdns0mzLaw5y4YQulV6Vzsk0CoienynHXQBDEOk+HHdJ6RbcUvDb
 TrsLEUPlTpZIUmT2gcjamAXXL8OGmn2IgvEgK7YqEgyy1RjRZseE0fs8BBAKfCEA5PTv
 f84Q==
X-Gm-Message-State: APjAAAWLaft0qc6vZRrkzD0xOdwFgCLK80d/95ap08ZoFgI2TuUxaZC6
 GzkXx6UphAj64B0nzGyM9WbbgNGLkOOFWZkBJRE=
X-Received: by 2002:a2e:8119:: with SMTP id d25mr32336193ljg.76.1582589597254; 
 Mon, 24 Feb 2020 16:13:17 -0800 (PST)
MIME-Version: 1.0
References: <20200224170301.246623-1-damien.hedde@greensocs.com>
 <20200224170301.246623-3-damien.hedde@greensocs.com>
In-Reply-To: <20200224170301.246623-3-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Feb 2020 16:05:43 -0800
Message-ID: <CAKmqyKPSgsU4pRZWK_RkZD8r2RTcMKBzA4=HLUg2QZVUZpE13g@mail.gmail.com>
Subject: Re: [PATCH v7 2/9] hw/core/clock-vmstate: define a vmstate entry for
 clock state
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Burton <mark.burton@greensocs.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Edgar Iglesias <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lwjcRndSqj/6

On Mon, Feb 24, 2020 at 9:06 AM Damien Hedde <damien.hedde@greensocs.com> w=
rote:
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> --
>
> v7: remove leading underscores in macro args
> ---
>  include/hw/clock.h      |  9 +++++++++
>  hw/core/clock-vmstate.c | 25 +++++++++++++++++++++++++
>  hw/core/Makefile.objs   |  1 +
>  3 files changed, 35 insertions(+)
>  create mode 100644 hw/core/clock-vmstate.c
>
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index 30ac9a9946..8c191751a1 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -74,6 +74,15 @@ struct Clock {
>      QLIST_ENTRY(Clock) sibling;
>  };
>
> +/*
> + * vmstate description entry to be added in device vmsd.
> + */
> +extern const VMStateDescription vmstate_clock;
> +#define VMSTATE_CLOCK(field, state) \
> +    VMSTATE_CLOCK_V(field, state, 0)
> +#define VMSTATE_CLOCK_V(field, state, version) \
> +    VMSTATE_STRUCT_POINTER_V(field, state, version, vmstate_clock, Clock=
)
> +
>  /**
>   * clock_setup_canonical_path:
>   * @clk: clock
> diff --git a/hw/core/clock-vmstate.c b/hw/core/clock-vmstate.c
> new file mode 100644
> index 0000000000..260b13fc2c
> --- /dev/null
> +++ b/hw/core/clock-vmstate.c
> @@ -0,0 +1,25 @@
> +/*
> + * Clock migration structure
> + *
> + * Copyright GreenSocs 2019-2020
> + *
> + * Authors:
> + *  Damien Hedde
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "migration/vmstate.h"
> +#include "hw/clock.h"
> +
> +const VMStateDescription vmstate_clock =3D {
> +    .name =3D "clock",
> +    .version_id =3D 0,
> +    .minimum_version_id =3D 0,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT64(period, Clock),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
> index d7080edf89..e3d796fdd4 100644
> --- a/hw/core/Makefile.objs
> +++ b/hw/core/Makefile.objs
> @@ -22,6 +22,7 @@ common-obj-$(CONFIG_SOFTMMU) +=3D null-machine.o
>  common-obj-$(CONFIG_SOFTMMU) +=3D loader.o
>  common-obj-$(CONFIG_SOFTMMU) +=3D machine-hmp-cmds.o
>  common-obj-$(CONFIG_SOFTMMU) +=3D numa.o
> +common-obj-$(CONFIG_SOFTMMU) +=3D clock-vmstate.o
>  obj-$(CONFIG_SOFTMMU) +=3D machine-qmp-cmds.o
>
>  common-obj-$(CONFIG_EMPTY_SLOT) +=3D empty_slot.o
> --
> 2.24.1
>
>
