Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1366655wrq;
        Thu, 12 Jul 2018 06:25:49 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdKC4nHlHOL97TlGE70gfEkVBhI+equXjfjTxu+cNiWME6sjrU9fuQrJikd94YwRmaG/Kqi
X-Received: by 2002:ac8:3111:: with SMTP id g17-v6mr1730148qtb.312.1531401949643;
        Thu, 12 Jul 2018 06:25:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531401949; cv=none;
        d=google.com; s=arc-20160816;
        b=xUKpeYdm7gdb3G2ZQ5gAqpcZPiV2JHfkyHysPqS6eBilg/btNtOBKcgLOHMm3W6m5/
         paKz/PEV+xHbDgmgrWLIhCfnEVGOFs7XI9BMXm9ZRdyCH97gRGzvpEwGRCaF1DtWRaNr
         gmmd4MKVUzOUnKxkEt12br5KU1d0QHgvGBhjAisKk6dZOPO9zNd/VBovqoSy7Y+61rX/
         l49QoBvZkczv573E+S79ACLMyb5uHCeSCpEFGTXjdTLFL27Oepgy1GkaCrdWqurgGD9a
         GetAcX5BhpWWfXA6qJc6xS/CW9TpniTNSY/92hKgKCkFs96F4PPAAK/GlRqJ0ImiNmCX
         LaiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=14cPvbyxfhwcdpD+CB+99Yxiyr9ZFEnRtsHSxt6T3sg=;
        b=Ohxn/vaTMyMjxLcT6UMMPbiouX6dATOfVYIe0i3K4uedzyO4gJh8+gVV/llqdyfwBU
         el9xaPMILMUWUuVbDrUulyVYTYRx1yzy148aqxVZjSQNt3OCAseN8kAENa4Cj+hC7M6x
         2x4exXq80X04laqNPNu4qBGlrtONCQ0KNKrlWzv/paUEAFvcL7YVp7o1BcncMMVaWXQq
         6EG7WmmY7nf/wXQwL/nqWYembiAB4rMqsrupdUdaijQ9yKxMciqPy6JlYVnkLM/DM9f+
         eaO0X4fPdKXlU88HQJ0iFhsGKBMxHopOG8jy3Nr4xQkhmypQaMzWgjEXTTj635StjHOJ
         GG9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KKyFPZLh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d17-v6si5187796qtl.194.2018.07.12.06.25.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 06:25:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KKyFPZLh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59881 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdbbR-0001ZM-4L
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 09:25:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdbb1-0001LS-7R
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 09:25:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdbb0-0000Uc-74
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 09:25:23 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:42246)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdbaz-0000TH-UT
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 09:25:22 -0400
Received: by mail-oi0-x241.google.com with SMTP id n84-v6so55722744oib.9
	for <qemu-arm@nongnu.org>; Thu, 12 Jul 2018 06:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=14cPvbyxfhwcdpD+CB+99Yxiyr9ZFEnRtsHSxt6T3sg=;
	b=KKyFPZLhJ+IbUk1cXKClcGNiME1P1l2LriqdnB6wx8vlZo2+CE6mV/Ydp1SaAMEUWQ
	rrJOGYeKBsrJaLFy/gRiwOOOtazmPNaqewqPwAAxiC+ZY0PoxrCsuPtvKb9TpjLrt+V/
	kISbDRXDLKBPFrstnu1ZDVjINg9tGsZDErfUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=14cPvbyxfhwcdpD+CB+99Yxiyr9ZFEnRtsHSxt6T3sg=;
	b=adGbkRR1wm0DrzEtZpnA6IGJkgT0h9iu7g/bOJN2pTbg90nahxRcOnWWuH6j6k4mxH
	+AdPseHdSfix4K5V0D5q0NeoLo9wckDhDQ1vhr4jQ1JalcWJ/YmatNFUQa+6kdLluFXr
	WDxyWPOj9FqeSbw7KV+q10yzjmxH6XZfOPzHUjM5/A1GdXLyknidVZHIWsmqaknaSo+V
	vT69Z9b4ROc+M6pnlTuyF2fWeZX8v3W1dPus2uU9+6kjaHfFmiosfhGTOrmDahM7q4gY
	EjeJqSYeKzb3AZqo9DnYI6MwkucUHBI4YEKJwlFJEmreYnBeU2VLW9sl2jWRur8UK8bh
	7sRg==
X-Gm-Message-State: AOUpUlE7IhMHdRxh9lV/12geIwYA8nFPffwVTb9BRn/69uT5IIZEGu7b
	6Adf6CSUMh2wh11c6BkLCwwPkh/Q8gVxNGvIgc2Pew==
X-Received: by 2002:aca:a982:: with SMTP id
	s124-v6mr2452571oie.80.1531401921092; 
	Thu, 12 Jul 2018 06:25:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 06:25:00
	-0700 (PDT)
In-Reply-To: <20180629132954.24269-14-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-14-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 14:25:00 +0100
Message-ID: <CAFEAcA-h83Mf+fcquiFOrJiTAyROTt0LxbL_-dZ-mukk9iXQjA@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v3 13/20] intc/arm_gic: Implement
 virtualization extensions in gic_cpu_(read|write)
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yiNnxwURkQAw

On 29 June 2018 at 14:29, Luc Michel <luc.michel@greensocs.com> wrote:
> Implement virtualization extensions in the gic_cpu_read() and
> gic_cpu_write() functions. Those are the last bits missing to fully
> support virtualization extensions in the CPU interface path.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  hw/intc/arm_gic.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 434dc9c7b2..2b1fa280eb 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -1336,9 +1336,12 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
>      case 0xd0: case 0xd4: case 0xd8: case 0xdc:
>      {
>          int regno = (offset - 0xd0) / 4;
> +        int nr_aprs = gic_is_vcpu(cpu) ? GIC_VIRT_NR_APRS : GIC_NR_APRS;
>
> -        if (regno >= GIC_NR_APRS || s->revision != 2) {
> +        if (regno >= nr_aprs || s->revision != 2) {
>              *data = 0;
> +        } else if (gic_is_vcpu(cpu)) {
> +            *data = s->h_apr[gic_get_vcpu_real_id(cpu)];
>          } else if (gic_cpu_ns_access(s, cpu, attrs)) {
>              /* NS view of GICC_APR<n> is the top half of GIC_NSAPR<n> */
>              *data = gic_apr_ns_view(s, regno, cpu);
> @@ -1352,7 +1355,7 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
>          int regno = (offset - 0xe0) / 4;
>
>          if (regno >= GIC_NR_APRS || s->revision != 2 || !gic_has_groups(s) ||
> -            gic_cpu_ns_access(s, cpu, attrs)) {
> +            gic_cpu_ns_access(s, cpu, attrs) || gic_is_vcpu(cpu)) {
>              *data = 0;
>          } else {
>              *data = s->nsapr[regno][cpu];
> @@ -1387,7 +1390,8 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
>                  s->abpr[cpu] = MAX(value & 0x7, GIC_MIN_ABPR);
>              }
>          } else {
> -            s->bpr[cpu] = MAX(value & 0x7, GIC_MIN_BPR);
> +            int min_bpr = gic_is_vcpu(cpu) ? GIC_VIRT_MIN_BPR : GIC_MIN_BPR;
> +            s->bpr[cpu] = MAX(value & 0x7, min_bpr);
>          }
>          break;
>      case 0x10: /* End Of Interrupt */
> @@ -1404,11 +1408,14 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
>      case 0xd0: case 0xd4: case 0xd8: case 0xdc:
>      {
>          int regno = (offset - 0xd0) / 4;
> +        int nr_aprs = gic_is_vcpu(cpu) ? GIC_VIRT_NR_APRS : GIC_NR_APRS;
>
> -        if (regno >= GIC_NR_APRS || s->revision != 2) {
> +        if (regno >= nr_aprs || s->revision != 2) {
>              return MEMTX_OK;
>          }
> -        if (gic_cpu_ns_access(s, cpu, attrs)) {
> +        if (gic_is_vcpu(cpu)) {
> +            s->h_apr[gic_get_vcpu_real_id(cpu)] = value;
> +        } else if (gic_cpu_ns_access(s, cpu, attrs)) {
>              /* NS view of GICC_APR<n> is the top half of GIC_NSAPR<n> */
>              gic_apr_write_ns_view(s, regno, cpu, value);
>          } else {
> @@ -1423,6 +1430,9 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
>          if (regno >= GIC_NR_APRS || s->revision != 2) {
>              return MEMTX_OK;
>          }
> +        if (gic_is_vcpu(cpu)) {
> +            return MEMTX_OK;
> +        }
>          if (!gic_has_groups(s) || (gic_cpu_ns_access(s, cpu, attrs))) {
>              return MEMTX_OK;
>          }
> --
> 2.17.1
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
