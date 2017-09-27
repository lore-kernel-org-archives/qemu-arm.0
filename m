Received: by 10.223.173.107 with SMTP id p98csp24377wrc;
        Wed, 27 Sep 2017 16:00:38 -0700 (PDT)
X-Received: by 10.200.37.157 with SMTP id e29mr4067639qte.271.1506553238282;
        Wed, 27 Sep 2017 16:00:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506553238; cv=none;
        d=google.com; s=arc-20160816;
        b=PucWhxKqGKZBFxHEzcX+w1YyDdE/d5CW3Z/YLGmXBP/SShVP5W+3TPQ8QwTC4rFsP9
         /YsUkzO7keEpNU1K6+zxgJdLwtCo3BNwbcG4TixhnKyQ0/BYshieF01ejjqun6dcuc5x
         jHw8ow8aaZpxnDGnd++yXhxhuJlM2NhYbMjlJWe1kjhu0JQZsi8aj/NiV6THoCrF55tk
         MIuXwtmOfdSZHx/2M7YiepgqopyzCFFNdscvfrEafhGRspKuTNrBWQy/Gdk+CyZ5jihj
         rBlJKx7wm188ZdBSrEekdXGIO4utupv/K2kP6dwcVvOKldi9JRfkY9l8j7yrssUCvQXi
         nUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=90fC2/2weE4V4ynyIWTlVwfAVihaIEOLgpWt7gI5CjQ=;
        b=HCeYxU44NT93PV4wEzWIq35WDY7aHrYqXlDF7FXVVg+Hi+azsQCrsjKVdOCavx1FEM
         Nw4FpWJ1/9dYkZ+lXVAM9ef0g0Gzps1N2L6voVICMyKiAFYFF8cDZbQrCr6OFWaX3kCi
         +EBilrIAQV676d5dXRBqRPk9kNH92hiZN07sFgr/6VDLqzGdYlPcdg028KLvKKGUrtMo
         kBuqm7peJB7wJwpDe3kQoTiW2n1kBXlArSJEaqXLLSd46ADDn2ToTes/U8CIvygGbhOZ
         XzZVDX9l1K8fag8IxXWLkaqdGHpVNxTpSlCTjj09Z+NZljjtYNouFPchIbFiVw6FUVhj
         DQrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OX2u8JH8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w31si93325qta.299.2017.09.27.16.00.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 16:00:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OX2u8JH8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56639 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxLJk-00082U-2o
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 19:00:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dxLIn-0007dI-Th
	for qemu-devel@nongnu.org; Wed, 27 Sep 2017 18:59:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dxLIm-0007WQ-G5
	for qemu-devel@nongnu.org; Wed, 27 Sep 2017 18:59:38 -0400
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:49440)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dxLIm-0007Vw-5s; Wed, 27 Sep 2017 18:59:36 -0400
Received: by mail-wm0-x22f.google.com with SMTP id r74so136923wme.4;
	Wed, 27 Sep 2017 15:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=90fC2/2weE4V4ynyIWTlVwfAVihaIEOLgpWt7gI5CjQ=;
	b=OX2u8JH8PecN7QWBu3kSjwdsaP+wYPlJYWl2y3ZC1YUbD8HGsRWft0bowV21mLcBn8
	xKKGvW64prgzqWk8Lf4GS8dOAzh1x4Ab6ldKL914XUGdutUXPBoaV5cbDSJL3xZWEazK
	LT4/ka22V5t1U3gxtvNIbC0ueCtIkbDYK+pv+EZ9wOXckDwEgdRFjdtzQm5okbOkNNWo
	yYy2NOzlx4mo3E0ZHZVOcXvBotBLxpGehluBf1LgqauwBx8x7TRHL4+rUSfW40eoDBY4
	rSh2brDHxAsIwkR+pEzCDAo6j1eXZ0yuFoIle1WHKcWTolgEAr4euGaUjBEsDJEtSRSg
	MjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=90fC2/2weE4V4ynyIWTlVwfAVihaIEOLgpWt7gI5CjQ=;
	b=di6HVgV23+BUml7YgGAg9nRqtqyGwDNzq23OiDNUfDAPQvYTUF8HpBWuWj0h7YqbU0
	a32+vPZ/Hw0LC9jOiafzIdLCX0hwJcdGpiSo5ArvrnOmFtJgs83rQZeSn2XaLfnbv62E
	WknW+5l+gNBBWFYewvfyKkp1/pE4jHj8zu9kF/BahuvUxwGwb/ldLW/Cv7IzwvtcCyei
	dJ+MBEowZUwlJmx+ilycF2nVnai2a4JGvpU+GtzceKeEzl5als+8AXlDxWga6a1gVp5X
	/yUA3YThU+1Ls6AcnSNZQhfkqAj31q+HtvI+vWphh1Iua+mwyTl0dr4iQZ6i5qWL13Bh
	MI5A==
X-Gm-Message-State: AHPjjUgu38cGJ4WF3W1V3Ng6yb8Oo8iELfyOFOlZJunrs4stMEp9TNV0
	CGVwBmMXd9A28GPl65KOsqY4AsTlX5cg4s7Fydo=
X-Google-Smtp-Source: AOwi7QD0hLFiBNxW6hvBeDxiYt/HTmhgc4ujHzMMt5fkws9wXfVEeOgEWkgruhILjBVbmcbQILh6BSYcLodlVdZM714=
X-Received: by 10.28.104.7 with SMTP id d7mr1349877wmc.6.1506553174878; Wed,
	27 Sep 2017 15:59:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.135.139 with HTTP; Wed, 27 Sep 2017 15:59:04 -0700 (PDT)
In-Reply-To: <1788278d-9437-34a0-4a17-d7914d459f77@redhat.com>
References: <cover.1506384414.git.alistair.francis@xilinx.com>
	<e9eb34b7a508fbe3b89bb8b8aa8141f018871081.1506384414.git.alistair.francis@xilinx.com>
	<1788278d-9437-34a0-4a17-d7914d459f77@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 27 Sep 2017 15:59:04 -0700
X-Google-Sender-Auth: BbtVS_jUPp1ZnK5OCaE2OeYTRlw
Message-ID: <CAKmqyKMzdmNJ=+pHNa8fq7MPq+KCn_BtKEzoD99qw9=KE2ZqVw@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22f
Subject: Re: [Qemu-devel] [PATCH v1 1/8] Replace all occurances of
 __FUNCTION__ with __func__
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <famz@redhat.com>,
	qemu-block@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, qemu-arm <qemu-arm@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	Yongbok Kim <yongbok.kim@imgtec.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6PymaPRDUnhY

On Tue, Sep 26, 2017 at 6:32 AM, Eric Blake <eblake@redhat.com> wrote:
> On 09/25/2017 07:08 PM, Alistair Francis wrote:
>> Replace all occurs of __FUNCTION__ except for the check in checkpatch
>> with the non GCC specific __func__.
>>
>> One line in hcd-musb.c was manually tweaked to pass checkpatch.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Cc: Andrzej Zaborowski <balrogg@gmail.com>
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Anthony Perard <anthony.perard@citrix.com>
>> Cc: John Snow <jsnow@redhat.com>
>> Cc: Aurelien Jarno <aurelien@aurel32.net>
>> Cc: Yongbok Kim <yongbok.kim@imgtec.com>
>> Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>> Cc: Stefan Hajnoczi <stefanha@redhat.com> (supporter:Block
>> Cc: Fam Zheng <famz@redhat.com> (supporter:Block
>
> That looks funny, with no closing ).  Something's breaking down between
> get_maintainers.pl and your eventual email, although it's not fatal.

Yeah, that's a copy and paste error, will fix.

>
>> Cc: Juan Quintela <quintela@redhat.com>
>> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>> Cc: qemu-arm@nongnu.org
>> Cc: qemu-block@nongnu.org
>> Cc: xen-devel@lists.xenproject.org
>> ---
>>
>
>>  65 files changed, 273 insertions(+), 273 deletions(-)
>
> Big but mechanical, so I'm okay without splitting it further.

Phew! I did not want to split it.

>
>>
>> diff --git a/audio/audio_int.h b/audio/audio_int.h
>> index 5bcb1c60e1..543b1bd8d5 100644
>> --- a/audio/audio_int.h
>> +++ b/audio/audio_int.h
>> @@ -253,7 +253,7 @@ static inline int audio_ring_dist (int dst, int src, int len)
>>  #define AUDIO_STRINGIFY(n) AUDIO_STRINGIFY_(n)
>>
>>  #if defined _MSC_VER || defined __GNUC__
>> -#define AUDIO_FUNC __FUNCTION__
>> +#define AUDIO_FUNC __func__
>>  #else
>>  #define AUDIO_FUNC __FILE__ ":" AUDIO_STRINGIFY (__LINE__)
>>  #endif
>
> This can be further simplified.  We really aren't using _MSC_VER as our
> compiler (can anyone prove me wrong?), and we DO require a C99 compiler
> (per C99 6.4.2.2, __func__ support is mandatory), so we don't really
> need the #else branch (or, for that matter, we probably don't even need
> AUDIO_FUNC).  But to keep this patch mechanical, that can be a separate
> followup.

I have a second patch that removes AUDIO_FUNC

>
>> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
>> index 58005b6619..32687afced 100644
>> --- a/hw/arm/nseries.c
>> +++ b/hw/arm/nseries.c
>> @@ -463,7 +463,7 @@ static uint32_t mipid_txrx(void *opaque, uint32_t cmd, int len)
>>      uint8_t ret;
>>
>>      if (len > 9) {
>> -        hw_error("%s: FIXME: bad SPI word width %i\n", __FUNCTION__, len);
>> +        hw_error("%s: FIXME: bad SPI word width %i\n", __func__, len);
>
> Not this patch's problem, but it would probably be simpler if hw_error()
> were a macro that automatically prefixed __func__, rather than making
> every caller have to supply it themselves.

I'm going to leave this for another day, but I think you are right.

>
>> +++ b/hw/arm/omap1.c
>
>> @@ -1716,7 +1716,7 @@ static void omap_clkm_write(void *opaque, hwaddr addr,
>>      case 0x18:       /* ARM_SYSST */
>>          if ((s->clkm.clocking_scheme ^ (value >> 11)) & 7) {
>>              s->clkm.clocking_scheme = (value >> 11) & 7;
>> -            printf("%s: clocking scheme set to %s\n", __FUNCTION__,
>> +            printf("%s: clocking scheme set to %s\n", __func__,
>>                              clkschemename[s->clkm.clocking_scheme]);
>
> Worth fixing the indentation while you are here?

Fixed

>
>> @@ -2473,7 +2473,7 @@ static void omap_pwt_write(void *opaque, hwaddr addr,
>>      case 0x04:       /* VRC */
>>          if ((value ^ s->vrc) & 1) {
>>              if (value & 1)
>> -                printf("%s: %iHz buzz on\n", __FUNCTION__, (int)
>> +                printf("%s: %iHz buzz on\n", __func__, (int)
>>                                  /* 1.5 MHz from a 12-MHz or 13-MHz PWT_CLK */
>>                                  ((omap_clk_getrate(s->clk) >> 3) /
>>                                   /* Pre-multiplexer divider */
>
> Likewise?

This doesn't actually change the indention. It's all one argument to a function.

>
>> @@ -3330,13 +3330,13 @@ static void omap_mcbsp_writeh(void *opaque, hwaddr addr,
>>          s->mcr[1] = value & 0x03e3;
>>          if (value & 3)                                       /* XMCM */
>>              printf("%s: Tx channel selection mode enable attempt\n",
>> -                            __FUNCTION__);
>> +                            __func__);
>>          return;
>>      case 0x1a:       /* MCR1 */
>>          s->mcr[0] = value & 0x03e1;
>>          if (value & 1)                                       /* RMCM */
>>              printf("%s: Rx channel selection mode enable attempt\n",
>> -                            __FUNCTION__);
>> +                            __func__);
>
> and again

Fixed.

>
>
>> +++ b/hw/arm/omap2.c
>> @@ -1312,7 +1312,7 @@ static void omap_prcm_apll_update(struct omap_prcm_s *s)
>>
>>      if (mode[0] == 1 || mode[0] == 2 || mode[1] == 1 || mode[1] == 2)
>>          fprintf(stderr, "%s: bad EN_54M_PLL or bad EN_96M_PLL\n",
>> -                        __FUNCTION__);
>> +                        __func__);
>
> More of the same. I'll quit pointing it out.

Fixed

>
>
>> +++ b/hw/block/onenand.c
>> @@ -661,12 +661,12 @@ static uint64_t onenand_read(void *opaque, hwaddr addr,
>>      case 0xff02:     /* ECC Result of spare area data */
>>      case 0xff03:     /* ECC Result of main area data */
>>      case 0xff04:     /* ECC Result of spare area data */
>> -        hw_error("%s: imeplement ECC\n", __FUNCTION__);
>> +        hw_error("%s: imeplement ECC\n", __func__);
>
> Should we fix the typo while here? s/imeplement/implement/

Fixed

>
>> +++ b/hw/isa/vt82c686.c
>> @@ -30,7 +30,7 @@
>>  //#define DEBUG_VT82C686B
>>
>>  #ifdef DEBUG_VT82C686B
>> -#define DPRINTF(fmt, ...) fprintf(stderr, "%s: " fmt, __FUNCTION__, ##__VA_ARGS__)
>> +#define DPRINTF(fmt, ...) fprintf(stderr, "%s: " fmt, __func__, ##__VA_ARGS__)
>>  #else
>>  #define DPRINTF(fmt, ...)
>>  #endif
>
> Not this patch's problem, but I hate bit-rottable statements.  This
> should be fixed separately into a form that always evaluates under
> -Wformat (guarded by an if(0) in normal builds).

Ah, I really don't want to go down that rabbit hole right now either.
I might leave this as is.

>
>> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
>> index e8b2eef688..41a7690560 100644
>> --- a/hw/mips/gt64xxx_pci.c
>> +++ b/hw/mips/gt64xxx_pci.c
>> @@ -33,7 +33,7 @@
>>  //#define DEBUG
>>
>>  #ifdef DEBUG
>> -#define DPRINTF(fmt, ...) fprintf(stderr, "%s: " fmt, __FUNCTION__, ##__VA_ARGS__)
>> +#define DPRINTF(fmt, ...) fprintf(stderr, "%s: " fmt, __func__, ##__VA_ARGS__)
>>  #else
>>  #define DPRINTF(fmt, ...)
>>  #endif
>
> Ditto.
>
>
>> +++ b/hw/usb/hcd-musb.c
>> @@ -253,8 +253,8 @@
>>  /* #define MUSB_DEBUG */
>>
>>  #ifdef MUSB_DEBUG
>> -#define TRACE(fmt,...) fprintf(stderr, "%s@%d: " fmt "\n", __FUNCTION__, \
>> -                               __LINE__, ##__VA_ARGS__)
>> +#define TRACE(fmt, ...) fprintf(stderr, "%s@%d: " fmt "\n", __func__, \
>> +                                __LINE__, ##__VA_ARGS__)
>>  #else
>>  #define TRACE(...)
>>  #endif
>
> and again
>
> My comments were either about things for separate patches, or things
> that are trivial if you choose to touch them up, so:
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!

Alistair

>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>
