Received: by 10.28.4.212 with SMTP id 203csp4694579wme;
        Tue, 8 May 2018 15:40:49 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrJ5I8QZNaBZzhjzZKfq2GgQHMXWLS6yqgZg3M27L/fqx6432ujjokrm6iN+WauSwV/HCYI
X-Received: by 2002:aed:3ead:: with SMTP id n42-v6mr39239342qtf.56.1525819249253;
        Tue, 08 May 2018 15:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525819249; cv=none;
        d=google.com; s=arc-20160816;
        b=yB7+GsQJ1f3KkQ87E0Cay/6VIoKOxaJa9RhQPbfw4nytuNcSSmxuI+tDx3XRL8sYLE
         XWVQ6VS/jPySnlhQ/nqmyXuXfojv29pJ9/p55ldxxEDtSlhE9XKpeKtvtTERVIRKitaR
         e1pyRjvMOSBgmuZhPqVR4VPbgzql1ffL/ZO++uO1K44nMoEF9XrDmG8/djWpLT02nEfZ
         QNtXyNi3cB7Knev/8yvSvbrOjJ4iwFEn861GDUnZ7oHhnimCHXV4KnbeXVbBqDeljkzg
         xtkC71mZwaN1981juYP6OPtdA5RIh/n6D4tx6s/vu/kdBAj/nRKNrdmOAXogHJL0K/V9
         OuMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=wG0kPyDXtCKVlmVVJBKGGizCcwKz89zceucZdRTKLEY=;
        b=0ZbUcUQVv69AiBX31y+hEXejxkiFzcTwmxAaHiUZmOADJFw+R4WQdTMhFfMsa6u3JA
         Z8+jhW1rrfylt2WEvU2FS5Vy051DWB8meiL2DDQA/fvPU7/bQNeJXPzRWxv0YKTTgpZh
         9VLC/SXQaLvEUZg6Jq05eaJhDnEjRyPDbTbeGXslpz8fdCnf1Lwg2QjF26nyLcIiug5g
         2fi1XP5PBOtryCMzHRMnOR0eSe0TikiWwt8tCu25J6ROwjhLo5wjjprt4XFdUPcCk3LM
         11eZFsLT6JmRnZqqp79PPAnW7m+sVgq/cGGVFcvwTOzLuLIznBJqG2YLgGyBbpMVnbEe
         lmAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nUEn7P5Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f12-v6si16014279qtk.50.2018.05.08.15.40.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 May 2018 15:40:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nUEn7P5Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGBHs-00013j-Mw
	for alex.bennee@linaro.org; Tue, 08 May 2018 18:40:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fGBHc-00012k-Ls
	for qemu-arm@nongnu.org; Tue, 08 May 2018 18:40:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fGBHb-0003rY-SA
	for qemu-arm@nongnu.org; Tue, 08 May 2018 18:40:32 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:35643)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fGBHb-0003r9-Iq; Tue, 08 May 2018 18:40:31 -0400
Received: by mail-lf0-x244.google.com with SMTP id y72-v6so34439352lfd.2;
	Tue, 08 May 2018 15:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=wG0kPyDXtCKVlmVVJBKGGizCcwKz89zceucZdRTKLEY=;
	b=nUEn7P5QFpo0m8anUKT+pgy0+Owzl9KdHUTk8+5kAunP+JMveRiAX+EwbmdHGLwtXV
	PhDm7ZVvD3kUeTQ3IPo89znFz3PjkqjMLko3Z7EzsZvrms1qVL8ualrJstKuUnrr9KgD
	bRhGPNtHEenION4GBNIj62R4Gv2nDInIUsOrdPvF4+SNC/BRok9Tyt2cQQi0BA80w84o
	jIa6LH/MULImr+yaLoVEyAXE/mngZDk0NcBBPHJT1tjqpmoZuDgU4E8WgL2wMcBkbi4A
	QG+7NS3w5WaRk4XPDNT0KVkYxQe6jIJ4+eqtBz36+5sTQ/xjk6+9bJ9G38Y9APCl/K+X
	ipKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=wG0kPyDXtCKVlmVVJBKGGizCcwKz89zceucZdRTKLEY=;
	b=OTspR+uGt4K1l5xTd6dq8y2I/X4OVJuYiiNF+ko2A6vvjpJIIl98IXwh3T2ohhR/sP
	2jKnTgZywz2YrraUbS6wxLaNJK2fj0IXbpNmvlfOS28JEP6YtKZRSCqpxM1pN8wP1y0n
	1BwTY39muR6f08Nfs1QIIhA+GMNPG8LBbOQnaFqYQUipn873q3TDPFAzdleOuhso+HC9
	OhslQ1+Jkzj7AFzEtxjMkD1NmotDruBLisKUQAexoA4wtjJ0lVz4VEa12OK2DwXDPO/y
	4EyALYTFg/huFezoESdrk0VNnD4+64I1mAXF5ZbOidxRLcrEGzpBS+Or/tb57E4ZxAEp
	bdNA==
X-Gm-Message-State: ALQs6tBS4DEfWI959wz2ZaRM8Ei3yTRA8q8mtfV9CSsueCgQ0oloyVIg
	88MlS2RKYCubtnZ6rgFnOwSibhZiSys3Ykx6kZk=
X-Received: by 2002:a19:1d84:: with SMTP id
	d126-v6mr28233500lfd.100.1525819230319; 
	Tue, 08 May 2018 15:40:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.65.74 with HTTP; Tue, 8 May 2018 15:39:59 -0700 (PDT)
In-Reply-To: <20180508151035.16774-4-f4bug@amsat.org>
References: <20180508151035.16774-1-f4bug@amsat.org>
	<20180508151035.16774-4-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 8 May 2018 15:39:59 -0700
Message-ID: <CAKmqyKMwRmmp40xmpe5jC+G8yUAbEuNVgNW_9+zAz7mmOJCNJw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 3/4] hw/ssi: Remove SSIBus
 from qemu/typedefs.h
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mMaaPMcbE+NZ

On Tue, May 8, 2018 at 8:10 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> There are only two files requiring this typedef (strongarm.h
> and hw/arm/pxa.h), let them include "hw/pcmcia.h" directly to
> simplify qemu/typedefs.h.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

I think this is heading in the right direction.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair


> ---
>  hw/arm/strongarm.h      | 1 +
>  include/hw/arm/pxa.h    | 1 +
>  include/hw/ssi/ssi.h    | 1 +
>  include/qemu/typedefs.h | 1 -
>  4 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/strongarm.h b/hw/arm/strongarm.h
> index e98840b461..ae51a1ae34 100644
> --- a/hw/arm/strongarm.h
> +++ b/hw/arm/strongarm.h
> @@ -3,6 +3,7 @@
>
>  #include "exec/memory.h"
>  #include "target/arm/cpu-qom.h"
> +#include "hw/ssi/ssi.h"
>
>  #define SA_CS0          0x00000000
>  #define SA_CS1          0x08000000
> diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
> index f6dfb5c0cf..f184349f02 100644
> --- a/include/hw/arm/pxa.h
> +++ b/include/hw/arm/pxa.h
> @@ -13,6 +13,7 @@
>  #include "exec/memory.h"
>  #include "target/arm/cpu-qom.h"
>  #include "hw/pcmcia.h"
> +#include "hw/ssi/ssi.h"
>
>  /* Interrupt numbers */
>  # define PXA2XX_PIC_SSP3       0
> diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
> index 6a0c3c3cdb..bdbf3c51f5 100644
> --- a/include/hw/ssi/ssi.h
> +++ b/include/hw/ssi/ssi.h
> @@ -13,6 +13,7 @@
>
>  #include "hw/qdev.h"
>
> +typedef struct SSIBus SSIBus;
>  typedef struct SSISlave SSISlave;
>  typedef struct SSISlaveClass SSISlaveClass;
>  typedef enum SSICSMode SSICSMode;
> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
> index c7a0159bd2..b4dc63a466 100644
> --- a/include/qemu/typedefs.h
> +++ b/include/qemu/typedefs.h
> @@ -106,7 +106,6 @@ typedef struct Range Range;
>  typedef struct SerialState SerialState;
>  typedef struct SHPCDevice SHPCDevice;
>  typedef struct SMBusDevice SMBusDevice;
> -typedef struct SSIBus SSIBus;
>  typedef struct uWireSlave uWireSlave;
>  typedef struct VirtIODevice VirtIODevice;
>  typedef struct Visitor Visitor;
> --
> 2.17.0
>
>
