Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4509244wrp;
        Mon, 16 Sep 2019 14:51:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyjEMDuQ2ZMb+CjIaKpEupF12dIQIfQXxi73CWBZb8kmj3ms7iURU1va+g1uSnGvZNAnvW9
X-Received: by 2002:a37:2784:: with SMTP id n126mr497871qkn.302.1568670705874;
        Mon, 16 Sep 2019 14:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568670705; cv=none;
        d=google.com; s=arc-20160816;
        b=tz0UUr5rzRbPtp0mWoaaEdjoDda34gijKxUS8jkST0j/ByrjcbH21y00o2aZ3wXpJs
         ToQOB2FHyDc0YiJO5/VTXTNHB2f9FPsgMHg6eNT33HP+izJK9cmCk6/Ji23BBg+ddmiW
         jbUOak83w0eDw/rjcxBSnIUvSr79sZefS5uY92bGH3v/EaC3Cfok9bZsCoAtmiwxDRGt
         3+/37mJfMsroONKg12Gbboyxo3SUmVhFTiE1b22qSIvtjsAPcVjA+IyF4cR8KfZWJDVR
         ZMP1mFX1P5nEdaWrAvg44KDVlW1onL56L2Cm6y1KBSlDaVxrvNbQWaq1mjEEi0V9smBS
         gzbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=V4nCQhbs3+rU2YHzLA0lHZ/OyAgBO5PawmVuuNSRAHA=;
        b=kUrEA9QwsvHFUHsVfFDS/DrqbL4bsePE5VnmnBUPRPmrpTfzTIYF44Mhic5m4bC6MV
         AtV4P/no11kfd6JAEbkP1XPvQOREEzbbohR1/LhxqEGKHilpeOwqSU78xBlQW7FcEEsA
         hgN9Ff0QqtZoIXIlCgV1dbpT//I4IC+ZbmMVkAf1+K9VMZ7KSdrim5jciB/YLcP8AIwo
         zC5zoCpuzyNDL6Bmg9myuBxr+TQnRgo9KS//c/0HJfiJLnCz3qm85qlCtarf8VR13wYo
         F9wKO0A6T/7YvdZz7XqqM6Zr3CkFC3i7U4c1oXEgfkwH2jIVhvtSymfMZFkDOT1sFhTd
         E7ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oTMzipx6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b25si257506qtp.122.2019.09.16.14.51.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2019 14:51:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oTMzipx6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i9yuO-000573-P6
	for alex.bennee@linaro.org; Mon, 16 Sep 2019 17:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36673)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1i9yu7-000520-FN
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 17:51:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1i9yu6-00059p-8h
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 17:51:27 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:38838)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1i9yu1-00057Q-Tl; Mon, 16 Sep 2019 17:51:22 -0400
Received: by mail-lj1-x241.google.com with SMTP id y23so1406774ljn.5;
 Mon, 16 Sep 2019 14:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V4nCQhbs3+rU2YHzLA0lHZ/OyAgBO5PawmVuuNSRAHA=;
 b=oTMzipx6WgLX5bXCSw1n4yNtviV91CWb/kSl8FechH4XKO7TRgnJhRYDXyzXviDoM4
 tCAWMZDEs9EKU5iajZUGmY4tij7tSpx3R6x0xAbqWGZ/7rKC1xZkvzuH1wzwe4rJb6yt
 k5R0T+SK5tT883u80DfdyO5URJWWth2cDJwb1j/NnIXmnNy8mjfQ21FlanBmaxY0W6Iu
 /fb7a/Ua1iOe7wDWDClYCsZJd5deJ5vEVuiHlobHWS9sErfUQ8dfDhfhOoC9ZrOeQZPw
 61EupoinQl9Y6WZ+uveJ95xEMyK2YWmog9tAzDt67t7pcdY9JjDT7JBTit/sanajfGbK
 U1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V4nCQhbs3+rU2YHzLA0lHZ/OyAgBO5PawmVuuNSRAHA=;
 b=M3SZUNSLIDW4uEs4V+8XOdv7LG2yqR9iHpNdZFLXH7x73MOTQa78lg7Waq+a5viFur
 ZKeJFO7SYuIaQ8nJ10cGTOJgobWurQ/gLfjdnZfnHN9p1UuHJA3hcIHSWFpKgA3EbuH5
 AdljDq67eCgEpKKG9i+TlQUPVbRNLQolJDHA+YQqDwwrJOW0O31H4Rq0voUkL6NVtZaN
 vuOba6FtWgJ0mwywCLd5Yf1RxYSmQMWsfMDEP0Z/OzzYuLyqDRO7S2SSfrBXInPvRYBS
 m3RsryVLn8mfAUIxb4AvUDDqeWKLLuhj1MM3O3OEtrGjojiJtLGCOYs85qYmGyGI7hc7
 tznQ==
X-Gm-Message-State: APjAAAXctTq126qyGsd58R8Q02fVxNwSW4H+YPgIs4lvbbbx3lzlMwP6
 C/sPyMcUdI4su5+fAH3I3FIB/Ig6ksAAUgZqBYw=
X-Received: by 2002:a2e:3902:: with SMTP id g2mr41167lja.196.1568670680032;
 Mon, 16 Sep 2019 14:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190916154847.28936-1-philmd@redhat.com>
 <20190916154847.28936-13-philmd@redhat.com>
In-Reply-To: <20190916154847.28936-13-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Sep 2019 14:46:47 -0700
Message-ID: <CAKmqyKNt9Emmn8q20j9Nnnw8eNz3F6rj-Mt=3W01tkGJyyJa_A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 12/13] hw/rtc/mc146818: Include
 mc146818rtc_regs.h a bit less
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, "open list:New World" <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Rhisq7y94aH

On Mon, Sep 16, 2019 at 9:42 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Only 2 source files require the "mc146818rtc_regs.h" header.
> Instead of having it processed 12 times, by all objects
> using "mc146818rtc.h", include it directly where used.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/rtc/mc146818rtc.c         | 1 +
>  hw/timer/hpet.c              | 1 +
>  include/hw/rtc/mc146818rtc.h | 1 -
>  3 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
> index ced15f764f..9d4ed54f65 100644
> --- a/hw/rtc/mc146818rtc.c
> +++ b/hw/rtc/mc146818rtc.c
> @@ -35,6 +35,7 @@
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
>  #include "hw/rtc/mc146818rtc.h"
> +#include "hw/rtc/mc146818rtc_regs.h"
>  #include "migration/vmstate.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-commands-misc-target.h"
> diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
> index 02bf8a8ce8..9f17aaa278 100644
> --- a/hw/timer/hpet.c
> +++ b/hw/timer/hpet.c
> @@ -34,6 +34,7 @@
>  #include "hw/timer/hpet.h"
>  #include "hw/sysbus.h"
>  #include "hw/rtc/mc146818rtc.h"
> +#include "hw/rtc/mc146818rtc_regs.h"
>  #include "migration/vmstate.h"
>  #include "hw/timer/i8254.h"
>
> diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
> index 888e04f9ab..09e273a2a1 100644
> --- a/include/hw/rtc/mc146818rtc.h
> +++ b/include/hw/rtc/mc146818rtc.h
> @@ -26,7 +26,6 @@
>  #define MC146818RTC_H
>
>  #include "hw/isa/isa.h"
> -#include "hw/rtc/mc146818rtc_regs.h"
>
>  #define TYPE_MC146818_RTC "mc146818rtc"
>
> --
> 2.20.1
>
>
