Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2888975njc;
        Tue, 17 Jun 2025 18:26:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8WY2oRLfjiszaB3ZvGbCxWwBhvQbmS20uQeUOr6uK7c5iAbwYPbGyIqbijGZmAac4vTIShaC5n83eIg==@linaro.org
X-Google-Smtp-Source: AGHT+IHFnBwzuzhW/sDo46nNOUbOatonbRF8ZeQsFrkWksVsWAFwAKWO0jtfiDUgkVvQVDijPfyh
X-Received: by 2002:a05:620a:243:b0:7d3:d53b:35cd with SMTP id af79cd13be357-7d3d53b35demr1256427685a.40.1750209966167;
        Tue, 17 Jun 2025 18:26:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750209966; cv=none;
        d=google.com; s=arc-20240605;
        b=Rhvww88PoQuZYbi+y2XSPZxbwkZ3YSpZ81xBKWo7Wrsq+z95d9H+F3b8lk9fGuv2u/
         uwUOdE8xSLghQ8H7BFsbRZd/eExmc1rJhQjJZP9gEb841OCMwukfMeLaxkN1j+3IDTvE
         /POPA+pLDm/ZIL89mYHIzIRBHMz3tvM6RKqNzCBM7VC7qHa97VhY9GjYmH/TMbOaI8ga
         3TgznYYibAtiEl/rI6gXdeE44EPOIQlnJujOQHDaXSn/UHqnfPO0cZBZywPy0NqgGda7
         uBiwb8Cu7zh58qEYP0aGa2ohNIDSBkolyG8Y+AgC88mBzHrxnfoNgYJngA2x4dM07AW8
         xQLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=87P+y7nqx/CGSAU5vsOWjS1v8KZE8je4BB+iHwJ80W8=;
        fh=uZYy5g49pl+jewDXVG4JKymhVhosmo8yHQAjv9j92pI=;
        b=kF9WuoTIEBISd6mE9HUTsYMC0w1zHy4rJHW8HWTq7bmwkIyNXjeQjxOC5xNgJXkSFl
         9YoAUDZ8WVODd/up1/5u7POJwjLzPTOLZywj6Sr/8oUYthQUrccIenj72bMxy2F3GV40
         Cz8YtzzqUnb6jtZikgoA0zG4seDsyG3DguplUzclc2tSoStq5T9YWoFVHEKCy0FaohMW
         ZwxX6NyLRl0bQz+it+jWeyXYidHYwXCZ3xw5OsFH79D5o00/Ny18ITp8gpJT1EbEBRdf
         fXSYkZvkLBlGERbRnRarBobkyunyqdloTw+8bSV+Lfai7GHDORHyjuDN0jKPvFbINga1
         6n/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="Ov+/d0ch";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8dc32b5si1281865085a.127.2025.06.17.18.26.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jun 2025 18:26:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="Ov+/d0ch";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uRhYs-0007Uf-20; Tue, 17 Jun 2025 21:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@google.com>)
 id 1uRhYq-0007To-H7
 for qemu-arm@nongnu.org; Tue, 17 Jun 2025 21:25:56 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <komlodi@google.com>)
 id 1uRhYn-000561-Mo
 for qemu-arm@nongnu.org; Tue, 17 Jun 2025 21:25:56 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-3134c67a173so7487564a91.1
 for <qemu-arm@nongnu.org>; Tue, 17 Jun 2025 18:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750209952; x=1750814752; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=87P+y7nqx/CGSAU5vsOWjS1v8KZE8je4BB+iHwJ80W8=;
 b=Ov+/d0ch/nIDvRxpr2OyyY3WtrVyo1kYGnHtpW43lPuU+z4DPtVjMS3JS9EeNZUfLb
 cYENZlUOIYYEZWy6ZDgKMVUqIp6sS8cXIqv4Kcz+gi7j9F89OWyM1JS2/nRLXQ8oMeGP
 YKG1s6Ui0oeCyP7D73wMQl1zX/aZL4IM6CUWqEbBxmx2sPsAcMeEnjDZkHeDPnS5iWbi
 Gi/Uo2Uphu3x25oPCJvXmfTm5MK61i+nvhIiHJ5A0ij6n8AkCDM/qYED7T5Uzhp5PWxf
 esc066hAbp75r6kloLX6TfoZkjoCASjF20XBq67ZSXrt6UjFBpfC0ugrOdlMyY7+vsog
 HHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750209952; x=1750814752;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=87P+y7nqx/CGSAU5vsOWjS1v8KZE8je4BB+iHwJ80W8=;
 b=nkJyswzItmhijKIsramsB8G/U30Q/672EMh4/n+IX6k/ADGExG3uJs18VfwpxwVeEM
 BP1HUxsVow8XviSTmYrYci258ndGe7uZTTnjJlX7jfBuKUGJQvqBZxwCg3YsrlB4XBQ/
 A+ShaYZOnQv+wCVUyNCkTidV0sR/+XZvq2tjk+e/4fw25K6GCMf6A/QvIyp1wuDnvZmm
 Jca5cDBRS6weFmBCNixYSIqajsg4xPMGAt823Rb46BYzp9NFL9aen3XP97hD0O1vzmO4
 C3/fiJj8v0utkBoSE19iKRf/7Xcp87UfQWHzHmHqp6qvXprJk5P3KrRtDJPWNqEJ+KTM
 KyeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoHfGRIl5czmtIq85nN6QyQ6KIBi7tAyd57ArhvNFGn1WUQHW4OAe4gu8Vd9ZDmkm9I1NcTPE/RQ==@nongnu.org
X-Gm-Message-State: AOJu0YzWXUOMQfm491SDKidykEgkfmdL4bCq0qBXqHZsv0p1g8+UCHhg
 9HHRy6irTxF/c5NcDkkoOT4jXC7ts6NJRl6WhzkWCQfyFTD8kbwojed/of2+lXnFDtNRWWCYoqH
 2DLAi98cOFlUatE2zsSEKJkhN+AuCH1XPxkNuhygm
X-Gm-Gg: ASbGnctbnpeWhRyc/lApppXOI2cZKkmuoMM1/THZCwCQ2MNdZpiJW1fIhPp5tCbKcZZ
 gzRIBkmfm0DNUrcsyd3XGbX2B6DZTLDXrh/fpvYgU0/8VSi6iPF8isjySk3oxToU4eQaYW+TCti
 9fpOhQLyxJkCbQYUDkkDfgD6rpgnIdABCWPHYWFaSUUuYl68DVXs017cz+TIkEFI7rHB41H3wq
X-Received: by 2002:a17:90b:4d11:b0:312:ea46:3e66 with SMTP id
 98e67ed59e1d1-313f1cd67bdmr20310134a91.21.1750209951822; Tue, 17 Jun 2025
 18:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250613000411.1516521-1-komlodi@google.com>
 <20250613000411.1516521-2-komlodi@google.com>
 <ab6caa9e-5017-4bf1-a50e-9337cda92959@kaod.org>
In-Reply-To: <ab6caa9e-5017-4bf1-a50e-9337cda92959@kaod.org>
From: Joe Komlodi <komlodi@google.com>
Date: Tue, 17 Jun 2025 18:25:39 -0700
X-Gm-Features: AX0GCFumKwPTf39_oNo4aE5XbAbUjZhXIZ8ePjiIy3Lx26McZopOV2fZJ1Rpvow
Message-ID: <CAGDLtxtpQSvkVc0+r3TSjn1Ro=whogY+6W1EwS+YsZBA=mGRaw@mail.gmail.com>
Subject: Re: [PATCH 01/19] hw/misc/aspeed_i3c: Move to i3c directory
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-devel@nongnu.org, venture@google.com, peter.maydell@linaro.org, 
 steven_lee@aspeedtech.com, leetroy@gmail.com, jamin_lin@aspeedtech.com, 
 andrew@codeconstruct.com.au, joel@jms.id.au, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=komlodi@google.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ohaVlSKM88u/

On Sun, Jun 15, 2025 at 11:42=E2=80=AFPM C=C3=A9dric Le Goater <clg@kaod.or=
g> wrote:
>
> On 6/13/25 02:03, Joe Komlodi wrote:
> > Moves the Aspeed I3C model and traces into hw/i3c and creates I3C build
> > files.
> >
> > Signed-off-by: Joe Komlodi <komlodi@google.com>
>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>
>
> > Reviewed-by: Patrick Venture <venture@google.com>
> > Reviewed-by: Titus Rwantare <titusr@google.com>
>
> Internal reviews are not of much value. It's better to send without
> these tags and restart the assessment on the public mailing lists.
>
Ack. I'll remove them in v2.

Thanks,
Joe
>
> Thanks,
>
> C.
>
>
>
>
> > ---
> >   hw/Kconfig                            | 1 +
> >   hw/arm/Kconfig                        | 1 +
> >   hw/i3c/Kconfig                        | 2 ++
> >   hw/{misc =3D> i3c}/aspeed_i3c.c         | 2 +-
> >   hw/i3c/meson.build                    | 3 +++
> >   hw/i3c/trace-events                   | 7 +++++++
> >   hw/i3c/trace.h                        | 2 ++
> >   hw/meson.build                        | 1 +
> >   hw/misc/meson.build                   | 1 -
> >   hw/misc/trace-events                  | 6 ------
> >   include/hw/arm/aspeed_soc.h           | 2 +-
> >   include/hw/{misc =3D> i3c}/aspeed_i3c.h | 0
> >   meson.build                           | 1 +
> >   13 files changed, 20 insertions(+), 9 deletions(-)
> >   create mode 100644 hw/i3c/Kconfig
> >   rename hw/{misc =3D> i3c}/aspeed_i3c.c (99%)
> >   create mode 100644 hw/i3c/meson.build
> >   create mode 100644 hw/i3c/trace-events
> >   create mode 100644 hw/i3c/trace.h
> >   rename include/hw/{misc =3D> i3c}/aspeed_i3c.h (100%)
> >
> > diff --git a/hw/Kconfig b/hw/Kconfig
> > index 9a86a6a28a..61b8b2a142 100644
> > --- a/hw/Kconfig
> > +++ b/hw/Kconfig
> > @@ -13,6 +13,7 @@ source fsi/Kconfig
> >   source gpio/Kconfig
> >   source hyperv/Kconfig
> >   source i2c/Kconfig
> > +source i3c/Kconfig
> >   source ide/Kconfig
> >   source input/Kconfig
> >   source intc/Kconfig
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index f543d944c3..427d0f0271 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -530,6 +530,7 @@ config ASPEED_SOC
> >       select DS1338
> >       select FTGMAC100
> >       select I2C
> > +    select I3C
> >       select DPS310
> >       select PCA9552
> >       select SERIAL_MM
> > diff --git a/hw/i3c/Kconfig b/hw/i3c/Kconfig
> > new file mode 100644
> > index 0000000000..e07fe445c6
> > --- /dev/null
> > +++ b/hw/i3c/Kconfig
> > @@ -0,0 +1,2 @@
> > +config I3C
> > +    bool
> > diff --git a/hw/misc/aspeed_i3c.c b/hw/i3c/aspeed_i3c.c
> > similarity index 99%
> > rename from hw/misc/aspeed_i3c.c
> > rename to hw/i3c/aspeed_i3c.c
> > index 3bef1c84dd..e56822f928 100644
> > --- a/hw/misc/aspeed_i3c.c
> > +++ b/hw/i3c/aspeed_i3c.c
> > @@ -10,7 +10,7 @@
> >   #include "qemu/osdep.h"
> >   #include "qemu/log.h"
> >   #include "qemu/error-report.h"
> > -#include "hw/misc/aspeed_i3c.h"
> > +#include "hw/i3c/aspeed_i3c.h"
> >   #include "hw/registerfields.h"
> >   #include "hw/qdev-properties.h"
> >   #include "qapi/error.h"
> > diff --git a/hw/i3c/meson.build b/hw/i3c/meson.build
> > new file mode 100644
> > index 0000000000..ebf20325cb
> > --- /dev/null
> > +++ b/hw/i3c/meson.build
> > @@ -0,0 +1,3 @@
> > +i3c_ss =3D ss.source_set()
> > +i3c_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_i3c.c'))
> > +system_ss.add_all(when: 'CONFIG_I3C', if_true: i3c_ss)
> > diff --git a/hw/i3c/trace-events b/hw/i3c/trace-events
> > new file mode 100644
> > index 0000000000..3ead84eb45
> > --- /dev/null
> > +++ b/hw/i3c/trace-events
> > @@ -0,0 +1,7 @@
> > +# See docs/devel/tracing.rst for syntax documentation.
> > +
> > +# aspeed_i3c.c
> > +aspeed_i3c_read(uint64_t offset, uint64_t data) "I3C read: offset 0x%"=
 PRIx64 " data 0x%" PRIx64
> > +aspeed_i3c_write(uint64_t offset, uint64_t data) "I3C write: offset 0x=
%" PRIx64 " data 0x%" PRIx64
> > +aspeed_i3c_device_read(uint32_t deviceid, uint64_t offset, uint64_t da=
ta) "I3C Dev[%u] read: offset 0x%" PRIx64 " data 0x%" PRIx64
> > +aspeed_i3c_device_write(uint32_t deviceid, uint64_t offset, uint64_t d=
ata) "I3C Dev[%u] write: offset 0x%" PRIx64 " data 0x%" PRIx64
> > diff --git a/hw/i3c/trace.h b/hw/i3c/trace.h
> > new file mode 100644
> > index 0000000000..1e0c4eadf0
> > --- /dev/null
> > +++ b/hw/i3c/trace.h
> > @@ -0,0 +1,2 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +#include "trace/trace-hw_i3c.h"
> > diff --git a/hw/meson.build b/hw/meson.build
> > index b91f761fe0..31786f03d0 100644
> > --- a/hw/meson.build
> > +++ b/hw/meson.build
> > @@ -12,6 +12,7 @@ subdir('dma')
> >   subdir('gpio')
> >   subdir('hyperv')
> >   subdir('i2c')
> > +subdir('i3c')
> >   subdir('ide')
> >   subdir('input')
> >   subdir('intc')
> > diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> > index 6d47de482c..4a41716625 100644
> > --- a/hw/misc/meson.build
> > +++ b/hw/misc/meson.build
> > @@ -130,7 +130,6 @@ system_ss.add(when: 'CONFIG_PVPANIC_MMIO', if_true:=
 files('pvpanic-mmio.c'))
> >   system_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
> >   system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
> >     'aspeed_hace.c',
> > -  'aspeed_i3c.c',
> >     'aspeed_lpc.c',
> >     'aspeed_scu.c',
> >     'aspeed_sbc.c',
> > diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> > index e3f64c0ff6..f70459b3b7 100644
> > --- a/hw/misc/trace-events
> > +++ b/hw/misc/trace-events
> > @@ -287,12 +287,6 @@ armsse_mhu_write(uint64_t offset, uint64_t data, u=
nsigned size) "SSE-200 MHU wri
> >   # aspeed_xdma.c
> >   aspeed_xdma_write(uint64_t offset, uint64_t data) "XDMA write: offset=
 0x%" PRIx64 " data 0x%" PRIx64
> >
> > -# aspeed_i3c.c
> > -aspeed_i3c_read(uint64_t offset, uint64_t data) "I3C read: offset 0x%"=
 PRIx64 " data 0x%" PRIx64
> > -aspeed_i3c_write(uint64_t offset, uint64_t data) "I3C write: offset 0x=
%" PRIx64 " data 0x%" PRIx64
> > -aspeed_i3c_device_read(uint32_t deviceid, uint64_t offset, uint64_t da=
ta) "I3C Dev[%u] read: offset 0x%" PRIx64 " data 0x%" PRIx64
> > -aspeed_i3c_device_write(uint32_t deviceid, uint64_t offset, uint64_t d=
ata) "I3C Dev[%u] write: offset 0x%" PRIx64 " data 0x%" PRIx64
> > -
> >   # aspeed_sdmc.c
> >   aspeed_sdmc_write(uint64_t reg, uint64_t data) "reg @0x%" PRIx64 " da=
ta: 0x%" PRIx64
> >   aspeed_sdmc_read(uint64_t reg, uint64_t data) "reg @0x%" PRIx64 " dat=
a: 0x%" PRIx64
> > diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> > index 217ef0eafd..07265f26cf 100644
> > --- a/include/hw/arm/aspeed_soc.h
> > +++ b/include/hw/arm/aspeed_soc.h
> > @@ -23,7 +23,7 @@
> >   #include "hw/timer/aspeed_timer.h"
> >   #include "hw/rtc/aspeed_rtc.h"
> >   #include "hw/i2c/aspeed_i2c.h"
> > -#include "hw/misc/aspeed_i3c.h"
> > +#include "hw/i3c/aspeed_i3c.h"
> >   #include "hw/ssi/aspeed_smc.h"
> >   #include "hw/misc/aspeed_hace.h"
> >   #include "hw/misc/aspeed_sbc.h"
> > diff --git a/include/hw/misc/aspeed_i3c.h b/include/hw/i3c/aspeed_i3c.h
> > similarity index 100%
> > rename from include/hw/misc/aspeed_i3c.h
> > rename to include/hw/i3c/aspeed_i3c.h
> > diff --git a/meson.build b/meson.build
> > index 34729c2a3d..186effb84f 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -3651,6 +3651,7 @@ if have_system
> >       'hw/fsi',
> >       'hw/hyperv',
> >       'hw/i2c',
> > +    'hw/i3c',
> >       'hw/i386',
> >       'hw/i386/xen',
> >       'hw/i386/kvm',
>
