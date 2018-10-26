Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp438453wro;
        Fri, 26 Oct 2018 01:28:02 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fAiYS+mFipmQ1NMqoT0hm77JZbmKfTeL4IAv9zpqPQ6GSDCKtLZP2dvdvE0AhKwQLALh1J
X-Received: by 2002:a37:31cf:: with SMTP id x198-v6mr2162084qkx.206.1540542482649;
        Fri, 26 Oct 2018 01:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540542482; cv=none;
        d=google.com; s=arc-20160816;
        b=DsDkWYslHAnXYKSYgINn89qrUT4ok3mb4X5e8G/8okXZgsEOpuZ0l4KhXbsKNU7m7p
         yOVQRf0aacNw2SGfN7SeZ+i3fBHn/Feko7MU9BwCRuUmHfYoeySu4LyUsU8lzLy0gyai
         rNdBZZejJw2yvJU06xK0PdUndRbqOSdtcYCbDHOiyaGIkZu4Oaa4a03H+HpXYFCJYSJp
         5KR3SuKlBaZMtaRMyl3ki0w1dveQwdq/E8JtwtDVcJsZH1UxZsO1I0x++ilUvEyDgWiG
         T8whfm9LiQdg0xpAYgWY6WNn8WkaZasUTnkq+ATOhVtpTSoKzoCLIFfHp4J5XMQPQprb
         kMaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=RJpg/GCxTn21w+Po2lDhGOZXoha2aUeHjUMl1lMLnWs=;
        b=LzXPfyEFWG54LcNr5JnurXrNIlVUih6iVaDeJ5vZfmQrDYCFKULT1wHGoLr5PV7Or+
         0YZol7OLJKtQKLHZl/dv+wzhttWwHwKNaX5YRXZ439ObQ8kseV/SmyEKFetKmB21Sr71
         arFmj2AzVQwGelzPERNqh92kG+OmbydPmqlIJGpD4PWHve5cO9oHF+krROmURyQmGOPs
         QRpQ5XQgPf/gruVuULjMXF/SpKbcHxP7kYYkAhKcSLysOSJXzTv8aFJNkbpG37ds8Vqt
         GiO1vMv+kk3FEfLRTbiMSsrYnKZ9wBOKgBVaTdrFS4VrFUQkmDyijQndicujiIcLMJaE
         RH/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a8-v6si359548qtb.19.2018.10.26.01.28.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 01:28:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFxTN-0000La-Vz
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 04:28:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFxTE-0000LS-Nt
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 04:27:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFxTB-0001wi-7s
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 04:27:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40556)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFxTA-0001wY-W5; Fri, 26 Oct 2018 04:27:49 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC00130020BF;
	Fri, 26 Oct 2018 08:27:47 +0000 (UTC)
Received: from localhost (unknown [10.33.36.71])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D35EC100164A;
	Fri, 26 Oct 2018 08:27:42 +0000 (UTC)
Date: Fri, 26 Oct 2018 05:27:41 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20181026082741.GK4096@habkost.net>
References: <20181025133301.16578-1-ehabkost@redhat.com>
	<20181025133301.16578-6-ehabkost@redhat.com>
	<20181025171759.GG2697@umbus.hotspot.internet-for-guests.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20181025171759.GG2697@umbus.hotspot.internet-for-guests.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 26 Oct 2018 08:27:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PULL v2 05/43] hw/timer/sun4v-rtc: Convert from
 DPRINTF() macro to trace events
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fTXJwNwPILWK

On Thu, Oct 25, 2018 at 06:17:59PM +0100, David Gibson wrote:
> On Thu, Oct 25, 2018 at 10:32:23AM -0300, Eduardo Habkost wrote:
> > From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> >=20
> > Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > Reviewed-by: Artyom Tarasenko <atar4qemu@gmail.com>
> > Reviewed-by: C=E9dric Le Goater <clg@kaod.org>
> > Message-Id: <20181002212522.23303-3-f4bug@amsat.org>
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> >  hw/timer/sun4v-rtc.c  | 13 +++----------
> >  hw/timer/trace-events |  4 ++++
> >  2 files changed, 7 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/hw/timer/sun4v-rtc.c b/hw/timer/sun4v-rtc.c
> > index 310523225f..13be94f8da 100644
> > --- a/hw/timer/sun4v-rtc.c
> > +++ b/hw/timer/sun4v-rtc.c
> > @@ -14,15 +14,8 @@
> >  #include "hw/sysbus.h"
> >  #include "qemu/timer.h"
> >  #include "hw/timer/sun4v-rtc.h"
> > +#include "trace.h"
> > =20
> > -//#define DEBUG_SUN4V_RTC
> > -
> > -#ifdef DEBUG_SUN4V_RTC
> > -#define DPRINTF(fmt, ...)                                       \
> > -    do { printf("sun4v_rtc: " fmt , ## __VA_ARGS__); } while (0)
> > -#else
> > -#define DPRINTF(fmt, ...) do {} while (0)
> > -#endif
> > =20
> >  #define TYPE_SUN4V_RTC "sun4v_rtc"
> >  #define SUN4V_RTC(obj) OBJECT_CHECK(Sun4vRtc, (obj), TYPE_SUN4V_RTC)
> > @@ -41,14 +34,14 @@ static uint64_t sun4v_rtc_read(void *opaque, hwad=
dr addr,
> >          /* accessing the high 32 bits */
> >          val >>=3D 32;
> >      }
> > -    DPRINTF("read from " TARGET_FMT_plx " val %lx\n", addr, val);
> > +    trace_sun4v_rtc_read(addr, val);
> >      return val;
> >  }
> > =20
> >  static void sun4v_rtc_write(void *opaque, hwaddr addr,
> >                               uint64_t val, unsigned size)
> >  {
> > -    DPRINTF("write 0x%x to " TARGET_FMT_plx "\n", (unsigned)val, add=
r);
> > +    trace_sun4v_rtc_read(addr, val);
>=20
> Uh.. as in v1, it looks like this should be trace_sun4v_rtc_write().

Oops, my bad.  I can fix this manually in case there's a v3 pull
request, but I would really prefer that to be included in a
follow up patch instead of making this block the entire pull
request.

--=20
Eduardo
