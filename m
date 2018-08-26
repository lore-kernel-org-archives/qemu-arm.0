Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3867484wrd;
        Sat, 25 Aug 2018 18:39:56 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vda8G+lsiLpJT54qPefl4CRMy57qzn0cNi/DKMHsBcGkxym6Q04xAOyof8ADM8BaTGV0D6Hq
X-Received: by 2002:aed:2d44:: with SMTP id h62-v6mr8078554qtd.199.1535247596740;
        Sat, 25 Aug 2018 18:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535247596; cv=none;
        d=google.com; s=arc-20160816;
        b=Cql4G/vIg4Vk8QxlWGM6dmbkKRI/6HV4hbtUwS+tZAS0dgTTGAaOByoHjEEiotTCkK
         66ToLuMnihk+6RgPXiFyQGQRu1JCtTWs8WvB0KOplagipEqioPfMotaM7xSWQx7gfMoZ
         lN2ztJbI+cmOGjbEa9rV0khpj//EDny/vrOHZLM1Z6eyF/VnMjYwMzu+DVROJSDFX1Nb
         b8tExWISa7oE0PtNWU/NgTTJWQiFfOIAoohQI+8atONmuK2W4AHGKpy8gfdSpOTan1bZ
         qsxTfoWREHeY0CnwXsBWEz2xUVk6UqTQCXgs8sQ1MAC4MCkDcCIeDf+0QhQQHa2cyzBm
         Khqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:arc-authentication-results;
        bh=qfY3+PUw/E+fBfraAY1TnNoSNKL7t08XABMYV73eZeg=;
        b=dVGO4y3i0QgDaDHYnvoKP8XywqPK3zbEwZrkxolEmB8c/rVeiBus0416mkhP/ez98V
         PudZ8U6Yb+AwF7cBinD2wa4Bje1G9E9fGZSI/D1GmANkfxIwXwa/97UkSzuUrV2Q7YXd
         Ge5ACGGPP7v+4xmcI2HhpaKyDjnbSZNFwwASKxFGjr26bxZ3Ao5kAPq+0y6DQSgMt9lr
         bCQaNAW8uVs9PRp8DZx+gF9arIcIKMurfTUqjHPrNZtSjy+MlEN3I15Fgp3EiZrY2jLj
         2GS/AnCJOA/qMZWsEzBKQUE3+VGoM1CbYZI0oJTguAVl12KbVcOxMWM+eGKX3nB2U7qQ
         31Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d14-v6si1721130qto.282.2018.08.25.18.39.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 Aug 2018 18:39:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47599 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ftk20-0004DP-4Y
	for alex.bennee@linaro.org; Sat, 25 Aug 2018 21:39:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ftk1j-0003q5-9D
	for qemu-arm@nongnu.org; Sat, 25 Aug 2018 21:39:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ftjv8-00020q-PA
	for qemu-arm@nongnu.org; Sat, 25 Aug 2018 21:32:54 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:43400)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ftjv8-0001yC-Iu; Sat, 25 Aug 2018 21:32:50 -0400
Received: by mail-yw1-f65.google.com with SMTP id l189-v6so4416234ywb.10;
	Sat, 25 Aug 2018 18:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qfY3+PUw/E+fBfraAY1TnNoSNKL7t08XABMYV73eZeg=;
	b=oTLR7adf0Tv2j0S+p8JFNSxXi3YZROaG1QaGwXRUxHjHX9kq+nA66InuWl3TODX1Jk
	ZWv1TsEWiNKBEKFN+dzEWSBN/JqVFR4BwIvidRXw3fTNKWtsMlg6MRliCiCSjkGVVtlF
	ljXioFe68Uj7mGSqtdN1hJZf0k3uc03eHIwUpukIw4S0FtHOCzy5vHxP1VUNEq98WEz8
	mqGZMH38QWS94t/nyKt3l/QyrIfJ6Cd57EOZR6cBjya0yEQeGCJHgChRnOVXvtIqesXN
	L2OYEz3vzZtdZz61SiZ0Y0fbcMNBpvmrTN5WsQSHv/kjrsOJvfQ0kBO1GkQkfDXbmYI2
	Wm+w==
X-Gm-Message-State: APzg51Dbdf7shW5lL2ajbIXA4Zz0DDLaSaa9VvO1ENlM37n/JTasi40Q
	rzN77wmUEWKgNjKkIgZp+YswtReNej9jRx21NDnbuQ==
X-Received: by 2002:a0d:e64c:: with SMTP id
	p73-v6mr4200238ywe.217.1535247169806; 
	Sat, 25 Aug 2018 18:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20180824161819.11085-1-peter.maydell@linaro.org>
In-Reply-To: <20180824161819.11085-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 25 Aug 2018 22:32:38 -0300
Message-ID: <CAAdtpL5VxgzRZ99jRQC_E6fYuK8YESQqE7=aUW1Dw7ErkkQiog@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000032e7cd05744c96a4"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.65
Subject: Re: [Qemu-arm] [PATCH] hw/intc/arm_gic: Drop GIC_BASE_IRQ macro
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1MAU9cGntpf/

--00000000000032e7cd05744c96a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 24 ao=C3=BBt 2018 13:18, Peter Maydell <peter.maydell@linaro.org> a
=C3=A9crit :

> The GIC_BASE_IRQ macro is a leftover from when we shared code
> between the GICv2 and the v7M NVIC. Since the NVIC is now
> split off, GIC_BASE_IRQ is always 0, and we can just delete it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

---
>  hw/intc/gic_internal.h   |  2 --
>  hw/intc/arm_gic.c        | 31 ++++++++++++++-----------------
>  hw/intc/arm_gic_common.c |  1 -
>  3 files changed, 14 insertions(+), 20 deletions(-)
>
> diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
> index 45c2af0bf59..8d29b40ca10 100644
> --- a/hw/intc/gic_internal.h
> +++ b/hw/intc/gic_internal.h
> @@ -26,8 +26,6 @@
>
>  #define ALL_CPU_MASK ((unsigned)(((1 << GIC_NCPU) - 1)))
>
> -#define GIC_BASE_IRQ 0
> -
>  #define GIC_DIST_SET_ENABLED(irq, cm) (s->irq_state[irq].enabled |=3D (c=
m))
>  #define GIC_DIST_CLEAR_ENABLED(irq, cm) (s->irq_state[irq].enabled &=3D
> ~(cm))
>  #define GIC_DIST_TEST_ENABLED(irq, cm) ((s->irq_state[irq].enabled &
> (cm)) !=3D 0)
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 542b4b93eab..b3ac2d11fc5 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -955,7 +955,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr
> offset, MemTxAttrs attrs)
>              res =3D 0;
>              if (!(s->security_extn && !attrs.secure) &&
> gic_has_groups(s)) {
>                  /* Every byte offset holds 8 group status bits */
> -                irq =3D (offset - 0x080) * 8 + GIC_BASE_IRQ;
> +                irq =3D (offset - 0x080) * 8;
>                  if (irq >=3D s->num_irq) {
>                      goto bad_reg;
>                  }
> @@ -974,7 +974,6 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr
> offset, MemTxAttrs attrs)
>              irq =3D (offset - 0x100) * 8;
>          else
>              irq =3D (offset - 0x180) * 8;
> -        irq +=3D GIC_BASE_IRQ;
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          res =3D 0;
> @@ -994,7 +993,6 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr
> offset, MemTxAttrs attrs)
>              irq =3D (offset - 0x200) * 8;
>          else
>              irq =3D (offset - 0x280) * 8;
> -        irq +=3D GIC_BASE_IRQ;
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          res =3D 0;
> @@ -1019,7 +1017,6 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr
> offset, MemTxAttrs attrs)
>              goto bad_reg;
>          }
>
> -        irq +=3D GIC_BASE_IRQ;
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          res =3D 0;
> @@ -1036,7 +1033,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr
> offset, MemTxAttrs attrs)
>          }
>      } else if (offset < 0x800) {
>          /* Interrupt Priority.  */
> -        irq =3D (offset - 0x400) + GIC_BASE_IRQ;
> +        irq =3D (offset - 0x400);
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          res =3D gic_dist_get_priority(s, cpu, irq, attrs);
> @@ -1046,7 +1043,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr
> offset, MemTxAttrs attrs)
>              /* For uniprocessor GICs these RAZ/WI */
>              res =3D 0;
>          } else {
> -            irq =3D (offset - 0x800) + GIC_BASE_IRQ;
> +            irq =3D (offset - 0x800);
>              if (irq >=3D s->num_irq) {
>                  goto bad_reg;
>              }
> @@ -1060,7 +1057,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr
> offset, MemTxAttrs attrs)
>          }
>      } else if (offset < 0xf00) {
>          /* Interrupt Configuration.  */
> -        irq =3D (offset - 0xc00) * 4 + GIC_BASE_IRQ;
> +        irq =3D (offset - 0xc00) * 4;
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          res =3D 0;
> @@ -1183,7 +1180,7 @@ static void gic_dist_writeb(void *opaque, hwaddr
> offset,
>               */
>              if (!(s->security_extn && !attrs.secure) &&
> gic_has_groups(s)) {
>                  /* Every byte offset holds 8 group status bits */
> -                irq =3D (offset - 0x80) * 8 + GIC_BASE_IRQ;
> +                irq =3D (offset - 0x80) * 8;
>                  if (irq >=3D s->num_irq) {
>                      goto bad_reg;
>                  }
> @@ -1204,7 +1201,7 @@ static void gic_dist_writeb(void *opaque, hwaddr
> offset,
>          }
>      } else if (offset < 0x180) {
>          /* Interrupt Set Enable.  */
> -        irq =3D (offset - 0x100) * 8 + GIC_BASE_IRQ;
> +        irq =3D (offset - 0x100) * 8;
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          if (irq < GIC_NR_SGIS) {
> @@ -1239,7 +1236,7 @@ static void gic_dist_writeb(void *opaque, hwaddr
> offset,
>          }
>      } else if (offset < 0x200) {
>          /* Interrupt Clear Enable.  */
> -        irq =3D (offset - 0x180) * 8 + GIC_BASE_IRQ;
> +        irq =3D (offset - 0x180) * 8;
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          if (irq < GIC_NR_SGIS) {
> @@ -1264,7 +1261,7 @@ static void gic_dist_writeb(void *opaque, hwaddr
> offset,
>          }
>      } else if (offset < 0x280) {
>          /* Interrupt Set Pending.  */
> -        irq =3D (offset - 0x200) * 8 + GIC_BASE_IRQ;
> +        irq =3D (offset - 0x200) * 8;
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          if (irq < GIC_NR_SGIS) {
> @@ -1283,7 +1280,7 @@ static void gic_dist_writeb(void *opaque, hwaddr
> offset,
>          }
>      } else if (offset < 0x300) {
>          /* Interrupt Clear Pending.  */
> -        irq =3D (offset - 0x280) * 8 + GIC_BASE_IRQ;
> +        irq =3D (offset - 0x280) * 8;
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          if (irq < GIC_NR_SGIS) {
> @@ -1309,7 +1306,7 @@ static void gic_dist_writeb(void *opaque, hwaddr
> offset,
>              goto bad_reg;
>          }
>
> -        irq =3D (offset - 0x300) * 8 + GIC_BASE_IRQ;
> +        irq =3D (offset - 0x300) * 8;
>          if (irq >=3D s->num_irq) {
>              goto bad_reg;
>          }
> @@ -1333,7 +1330,7 @@ static void gic_dist_writeb(void *opaque, hwaddr
> offset,
>              goto bad_reg;
>          }
>
> -        irq =3D (offset - 0x380) * 8 + GIC_BASE_IRQ;
> +        irq =3D (offset - 0x380) * 8;
>          if (irq >=3D s->num_irq) {
>              goto bad_reg;
>          }
> @@ -1353,7 +1350,7 @@ static void gic_dist_writeb(void *opaque, hwaddr
> offset,
>          }
>      } else if (offset < 0x800) {
>          /* Interrupt Priority.  */
> -        irq =3D (offset - 0x400) + GIC_BASE_IRQ;
> +        irq =3D (offset - 0x400);
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          gic_dist_set_priority(s, cpu, irq, value, attrs);
> @@ -1362,7 +1359,7 @@ static void gic_dist_writeb(void *opaque, hwaddr
> offset,
>           * annoying exception of the 11MPCore's GIC.
>           */
>          if (s->num_cpu !=3D 1 || s->revision =3D=3D REV_11MPCORE) {
> -            irq =3D (offset - 0x800) + GIC_BASE_IRQ;
> +            irq =3D (offset - 0x800);
>              if (irq >=3D s->num_irq) {
>                  goto bad_reg;
>              }
> @@ -1375,7 +1372,7 @@ static void gic_dist_writeb(void *opaque, hwaddr
> offset,
>          }
>      } else if (offset < 0xf00) {
>          /* Interrupt Configuration.  */
> -        irq =3D (offset - 0xc00) * 4 + GIC_BASE_IRQ;
> +        irq =3D (offset - 0xc00) * 4;
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
>          if (irq < GIC_NR_SGIS)
> diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
> index 547dc41185e..57569a4e590 100644
> --- a/hw/intc/arm_gic_common.c
> +++ b/hw/intc/arm_gic_common.c
> @@ -191,7 +191,6 @@ static void arm_gic_common_realize(DeviceState *dev,
> Error **errp)
>                     s->num_cpu, GIC_NCPU);
>          return;
>      }
> -    s->num_irq +=3D GIC_BASE_IRQ;
>      if (s->num_irq > GIC_MAXIRQ) {
>          error_setg(errp,
>                     "requested %u interrupt lines exceeds GIC maximum %d"=
,
> --
> 2.18.0
>
>

--00000000000032e7cd05744c96a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr">Le ven. =
24 ao=C3=BBt 2018 13:18, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@=
linaro.org">peter.maydell@linaro.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">The GIC_BASE_IRQ macro is a leftover from whe=
n we shared code<br>
between the GICv2 and the v7M NVIC. Since the NVIC is now<br>
split off, GIC_BASE_IRQ is always 0, and we can just delete it.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt;<br>=
</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><spa=
n style=3D"font-family:sans-serif;font-size:13.696px">Reviewed-by: Philippe=
 Mathieu-Daud=C3=A9 &lt;</span><a href=3D"mailto:f4bug@amsat.org" style=3D"=
text-decoration:none;color:rgb(66,133,244);font-family:sans-serif;font-size=
:13.696px">f4bug@amsat.org</a><span style=3D"font-family:sans-serif;font-si=
ze:13.696px">&gt;</span><br></div><div dir=3D"auto"><span style=3D"font-fam=
ily:sans-serif;font-size:13.696px"><br></span></div><div dir=3D"auto"><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
---<br>
=C2=A0hw/intc/gic_internal.h=C2=A0 =C2=A0|=C2=A0 2 --<br>
=C2=A0hw/intc/arm_gic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 31 ++++++++++++++-----=
------------<br>
=C2=A0hw/intc/arm_gic_common.c |=C2=A0 1 -<br>
=C2=A03 files changed, 14 insertions(+), 20 deletions(-)<br>
<br>
diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h<br>
index 45c2af0bf59..8d29b40ca10 100644<br>
--- a/hw/intc/gic_internal.h<br>
+++ b/hw/intc/gic_internal.h<br>
@@ -26,8 +26,6 @@<br>
<br>
=C2=A0#define ALL_CPU_MASK ((unsigned)(((1 &lt;&lt; GIC_NCPU) - 1)))<br>
<br>
-#define GIC_BASE_IRQ 0<br>
-<br>
=C2=A0#define GIC_DIST_SET_ENABLED(irq, cm) (s-&gt;irq_state[irq].enabled |=
=3D (cm))<br>
=C2=A0#define GIC_DIST_CLEAR_ENABLED(irq, cm) (s-&gt;irq_state[irq].enabled=
 &amp;=3D ~(cm))<br>
=C2=A0#define GIC_DIST_TEST_ENABLED(irq, cm) ((s-&gt;irq_state[irq].enabled=
 &amp; (cm)) !=3D 0)<br>
diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c<br>
index 542b4b93eab..b3ac2d11fc5 100644<br>
--- a/hw/intc/arm_gic.c<br>
+++ b/hw/intc/arm_gic.c<br>
@@ -955,7 +955,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr off=
set, MemTxAttrs attrs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(s-&gt;security_extn &=
amp;&amp; !attrs.secure) &amp;&amp; gic_has_groups(s)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Every byte=
 offset holds 8 group status bits */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - =
0x080) * 8 + GIC_BASE_IRQ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - =
0x080) * 8;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &gt;=
=3D s-&gt;num_irq) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0goto bad_reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -974,7 +974,6 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr off=
set, MemTxAttrs attrs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irq =3D (offset - 0x100) * =
8;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irq =3D (offset - 0x180) * =
8;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq +=3D GIC_BASE_IRQ;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &gt;=3D s-&gt;num_irq)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D 0;<br>
@@ -994,7 +993,6 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr off=
set, MemTxAttrs attrs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irq =3D (offset - 0x200) * =
8;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irq =3D (offset - 0x280) * =
8;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq +=3D GIC_BASE_IRQ;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &gt;=3D s-&gt;num_irq)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D 0;<br>
@@ -1019,7 +1017,6 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr o=
ffset, MemTxAttrs attrs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq +=3D GIC_BASE_IRQ;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &gt;=3D s-&gt;num_irq)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D 0;<br>
@@ -1036,7 +1033,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr o=
ffset, MemTxAttrs attrs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else if (offset &lt; 0x800) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Interrupt Priority.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0x400) + GIC_BASE_IRQ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0x400);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &gt;=3D s-&gt;num_irq)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D gic_dist_get_priority(s, cpu, irq=
, attrs);<br>
@@ -1046,7 +1043,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr o=
ffset, MemTxAttrs attrs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* For uniprocessor GICs th=
ese RAZ/WI */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0x800) + GIC_B=
ASE_IRQ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0x800);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &gt;=3D s-&gt;num_i=
rq) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_reg;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -1060,7 +1057,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr o=
ffset, MemTxAttrs attrs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else if (offset &lt; 0xf00) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Interrupt Configuration.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0xc00) * 4 + GIC_BASE_IRQ;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0xc00) * 4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &gt;=3D s-&gt;num_irq)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D 0;<br>
@@ -1183,7 +1180,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offs=
et,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(s-&gt;security_extn &=
amp;&amp; !attrs.secure) &amp;&amp; gic_has_groups(s)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Every byte=
 offset holds 8 group status bits */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - =
0x80) * 8 + GIC_BASE_IRQ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - =
0x80) * 8;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &gt;=
=3D s-&gt;num_irq) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0goto bad_reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -1204,7 +1201,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offs=
et,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else if (offset &lt; 0x180) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Interrupt Set Enable.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0x100) * 8 + GIC_BASE_IRQ;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0x100) * 8;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &gt;=3D s-&gt;num_irq)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &lt; GIC_NR_SGIS) {<br>
@@ -1239,7 +1236,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offs=
et,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else if (offset &lt; 0x200) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Interrupt Clear Enable.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0x180) * 8 + GIC_BASE_IRQ;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0x180) * 8;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &gt;=3D s-&gt;num_irq)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &lt; GIC_NR_SGIS) {<br>
@@ -1264,7 +1261,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offs=
et,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else if (offset &lt; 0x280) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Interrupt Set Pending.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0x200) * 8 + GIC_BASE_IRQ;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0x200) * 8;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &gt;=3D s-&gt;num_irq)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &lt; GIC_NR_SGIS) {<br>
@@ -1283,7 +1280,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offs=
et,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else if (offset &lt; 0x300) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Interrupt Clear Pending.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0x280) * 8 + GIC_BASE_IRQ;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0x280) * 8;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &gt;=3D s-&gt;num_irq)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &lt; GIC_NR_SGIS) {<br>
@@ -1309,7 +1306,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offs=
et,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0x300) * 8 + GIC_BASE_IRQ;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0x300) * 8;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &gt;=3D s-&gt;num_irq) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -1333,7 +1330,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offs=
et,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0x380) * 8 + GIC_BASE_IRQ;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0x380) * 8;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &gt;=3D s-&gt;num_irq) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -1353,7 +1350,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offs=
et,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else if (offset &lt; 0x800) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Interrupt Priority.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0x400) + GIC_BASE_IRQ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0x400);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &gt;=3D s-&gt;num_irq)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_dist_set_priority(s, cpu, irq, value,=
 attrs);<br>
@@ -1362,7 +1359,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offs=
et,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * annoying exception of the 11MPCore&#39=
;s GIC.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;num_cpu !=3D 1 || s-&gt;revisio=
n =3D=3D REV_11MPCORE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0x800) + GIC_B=
ASE_IRQ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0x800);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &gt;=3D s-&gt;num_i=
rq) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_reg;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -1375,7 +1372,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offs=
et,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else if (offset &lt; 0xf00) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Interrupt Configuration.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0xc00) * 4 + GIC_BASE_IRQ;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0xc00) * 4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &gt;=3D s-&gt;num_irq)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &lt; GIC_NR_SGIS)<br>
diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c<br>
index 547dc41185e..57569a4e590 100644<br>
--- a/hw/intc/arm_gic_common.c<br>
+++ b/hw/intc/arm_gic_common.c<br>
@@ -191,7 +191,6 @@ static void arm_gic_common_realize(DeviceState *dev, Er=
ror **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt=
;num_cpu, GIC_NCPU);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 s-&gt;num_irq +=3D GIC_BASE_IRQ;<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;num_irq &gt; GIC_MAXIRQ) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;requested %u interrupt lines exceeds GIC maximum %d&quot;,<br>
-- <br>
2.18.0<br><br></blockquote></div></div></div>

--00000000000032e7cd05744c96a4--
