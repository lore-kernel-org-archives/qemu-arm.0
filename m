Received: by 10.25.0.147 with SMTP id 141csp342567lfa;
        Fri, 3 Mar 2017 09:10:14 -0800 (PST)
X-Received: by 10.223.149.66 with SMTP id 60mr3505745wrs.29.1488561014618;
        Fri, 03 Mar 2017 09:10:14 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x22a.google.com (mail-wr0-x22a.google.com. [2a00:1450:400c:c0c::22a])
        by mx.google.com with ESMTPS id p137si3649035wmd.166.2017.03.03.09.10.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Mar 2017 09:10:14 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22a as permitted sender) client-ip=2a00:1450:400c:c0c::22a;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22a as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x22a.google.com with SMTP id g10so77885850wrg.2
        for <alex.bennee@linaro.org>; Fri, 03 Mar 2017 09:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wtuJAfxACxr1gf5kly73wXau9+1nRV7bQ+2O4U1vPAA=;
        b=TGpyDZG0kItdln6iQKkJnMjIjyjSPl//DHG3z+Gs/q/LvkRxJE2eT+9GnYbp/BKXFi
         YLvYmxmxU943G9sT1WXS1G4OqthAZfQVeZXrT9AC+UF+TNtMNCcHF33bkAdm6SZHa7yK
         lvjjYnJ7lKOjHoGOXWyTc2+xQJGJdWelXif6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wtuJAfxACxr1gf5kly73wXau9+1nRV7bQ+2O4U1vPAA=;
        b=nlQbwqqZ471KKJMpGiZ4XEWkQDmfnwr5eZS+Y53r+/RjK5f7Jmz+BBWL8CHImNzsie
         dEE6D2zLZlJy5r8j7iAD6kIhP3dyUcpENdZ1CNTvwD54qOrlLoAGs7kqhkJIu7IVyghc
         A/iC8gunKxyDQb3HKviReE6H9Vj9EMOSymUdQBip/PRC3jDrXqteqMOgHWFKZKil00Ax
         Ojv4HlgcStxLchu/PYYImjl8D+bJqXQag6ixKihUj5WFsT7RPHPeAqRZt2rgoC+vhuAa
         7q4eiCV7C2iZAQ6+941r3lu7hz9RyJao+jRG0xu+gXWufZs9wcVH6cL8Q/5RWdTKTLhm
         rPIw==
X-Gm-Message-State: AMke39nJMCI6ixtPzZaYxG5eZ88Dj1ffs5PG3btsSRCCYQVOfT1QzZ5Ytsr455vkubB5GQjzo7Rm4xBkCEWbET6WRX8=
X-Received: by 10.223.152.215 with SMTP id w81mr4010043wrb.151.1488561014286;
 Fri, 03 Mar 2017 09:10:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Fri, 3 Mar 2017 09:09:53 -0800 (PST)
In-Reply-To: <4e71b620-8ebd-0f66-f032-64fb8cc98b9f@greensocs.com>
References: <20170302195337.31558-1-alex.bennee@linaro.org>
 <20170302195337.31558-12-alex.bennee@linaro.org> <4e71b620-8ebd-0f66-f032-64fb8cc98b9f@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2017 17:09:53 +0000
Message-ID: <CAFEAcA-t3vNH2dYWCGh8WaHsKeYs+kZonbcncv7dmm8dy29+Dw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 11/11] hw/intc/arm_gic: modernise the DPRINTF
To: Frederic Konrad <fred.konrad@greensocs.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	MTTCG Devel <mttcg@listserver.greensocs.com>, 
	Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, Alvise Rigo <a.rigo@virtualopensystems.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, "Emilio G. Cota" <cota@braap.org>, 
	"open list:ARM cores" <qemu-arm@nongnu.org>, Pranith Kumar <bobby.prani@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: FxtpvY4Pn7fD

On 3 March 2017 at 17:05, Frederic Konrad <fred.konrad@greensocs.com> wrote=
:
> Hi Alex,
>
> On 03/02/2017 08:53 PM, Alex Benn=C3=A9e wrote:
>> While I was debugging the icount issues I realised a bunch of the
>> messages look quite similar. I've fixed this by including __func__ in
>> the debug print. At the same time I move the a modern if (GATE) style
>> printf which ensures the compiler can check for format string errors
>> even if the code gets optimised away in the non-DEBUG_GIC case.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  hw/intc/arm_gic.c | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>> index 8e5a9d8a3e..b305d9032a 100644
>> --- a/hw/intc/arm_gic.c
>> +++ b/hw/intc/arm_gic.c
>> @@ -26,15 +26,20 @@
>>  #include "qemu/log.h"
>>  #include "trace.h"
>>
>> -//#define DEBUG_GIC
>> +/* #define DEBUG_GIC */
>>
>>  #ifdef DEBUG_GIC
>> -#define DPRINTF(fmt, ...) \
>> -do { fprintf(stderr, "arm_gic: " fmt , ## __VA_ARGS__); } while (0)
>> +#define DEBUG_GIC_GATE 1
>>  #else
>> -#define DPRINTF(fmt, ...) do {} while(0)
>> +#define DEBUG_GIC_GATE 0
>>  #endif
>>
>> +#define DPRINTF(fmt, ...) do {                                         =
 \
>> +        if (DEBUG_GIC_GATE) {                                          =
 \
>> +            fprintf(stderr, "%s: " fmt, __func__, ## __VA_ARGS__);     =
 \
>> +        }                                                              =
 \
>> +    } while (0)
>> +
>
> Seems a prefered way is using qemu_log instead of fprintf?

This is debug print. Our "preferred" approach is the trace-events
framework (look at how gicv3 does it for example), which has the
nice property of being user-enableable at runtime, but there's
no absolute requirement to update old code to use that instead of
debug printfs. (It's not completely trivial to update, and among
other things you need to consider what trace might be useful to
the user rather than merely whatever random fprintfs you found
helpful during development.)

qemu_log is for certain specific kinds of user-enableable tracing
(notably "guest did something wrong" and "we don't implement this").

thanks
-- PMM
