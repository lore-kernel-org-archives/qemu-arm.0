Received: by 10.25.159.131 with SMTP id i125csp572677lfe;
        Wed, 7 Dec 2016 14:47:47 -0800 (PST)
X-Received: by 10.200.49.165 with SMTP id h34mr60054417qte.43.1481150867477;
        Wed, 07 Dec 2016 14:47:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id r19si15624321qkl.151.2016.12.07.14.47.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Dec 2016 14:47:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42768 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cEl06-00074D-W4
	for alex.bennee@linaro.org; Wed, 07 Dec 2016 17:47:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cEl00-00073u-FO
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 17:47:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cEkzx-0000Dq-BR
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 17:47:40 -0500
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36011)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cEkzx-0000DS-5W; Wed, 07 Dec 2016 17:47:37 -0500
Received: by mail-wm0-f67.google.com with SMTP id m203so30839556wma.3;
	Wed, 07 Dec 2016 14:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=O+mCW4yAuRT8W45hxry+09by43fnMVZ777cBs7cvo7Q=;
	b=MvjBJYxRUu46uM3i8p5VBmbcF1j7MBV5LlfBWAQfy5xSacbwX5HY/5lE5P5Ezyb0EA
	YwbjAYJIv0ppJ4ZYQ+6PDARU3kOqDIvPxQF8Mbe5/5rBgC52IeapiqfrnMUeSsftoINe
	ql/bSOnjn609YnD8PTzthpRtUpks2LeIFC9k+AVT0HWt+hZEOEmwSiAquPcTWsUowwf/
	0Rf/SSiyuRNCfzWWdRAj7qkXyf9zN9oA7cMEBbjd7ZvSAw8Jd1e7C/+UoDAOzM147xnJ
	CHDIWwZaJrN+QVsNWcDnOhIJ5tZ7fn6Y0hXvPW2p4T0mHK1Xbymm/rIC6BiPKgl9tl77
	RECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=O+mCW4yAuRT8W45hxry+09by43fnMVZ777cBs7cvo7Q=;
	b=NndVXU78HtaqtbipPYARF9MUEgprRDetb3cSYpxL6oWi9UNk2FaLg9lUb+LF9c6c4G
	wAOALFmoIawkT8ASdW9NaCB96KgjlW5Nq9cy5UAa9iMb5MUfIG3eeiVsb+8PKeTTBas9
	aS1DJOK+ilVZiMqWBm/3iNECDrGKm/XajTr9PHNy0j6ddhWb+cKeERORM4lJ22C+cIvs
	srSTv2szjRQBBUIQ4whs5u9TSUMJYUa09F7J4C74g36UeLda+cprXJoTRAt09ClM8ViN
	BgQt7tLFC9++xnRB0n2H/kSWEOJkesin3EqVUgUAcw83vhElR2FqOU41qmK24S9RW4k3
	Q9hw==
X-Gm-Message-State: AKaTC03+aTLV9VO/1GpIkYiDjMZ7WTZvSiBJZQiJBCeYbJnehfLXEbXasSYsjo7UQF+dHQ==
X-Received: by 10.46.78.26 with SMTP id c26mr32226831ljb.46.1481150795871;
	Wed, 07 Dec 2016 14:46:35 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	c66sm5049950ljd.44.2016.12.07.14.46.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Dec 2016 14:46:35 -0800 (PST)
Date: Wed, 7 Dec 2016 23:46:34 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161207224634.GG9606@toto>
References: <1481046379-32632-1-git-send-email-peter.maydell@linaro.org>
	<1481046379-32632-4-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481046379-32632-4-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.67
Subject: Re: [Qemu-arm] [PATCH 3/3] hw/intc/arm_gicv3: Don't signal
 Pending+Active interrupts to CPU
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f/FQ4DXwUy/w

On Tue, Dec 06, 2016 at 05:46:19PM +0000, Peter Maydell wrote:
> The GICv3 requires that we only signal Pending interrupts to
> the CPU. This category does not include Pending+Active interrupts,
> which means we need to check whether the interrupt is Active in
> the gicr_int_pending() and gicd_int_pending() functions.
> 
> Interrupts are rarely in the Active+Pending state, but KVM
> uses this as part of its handling of the virtual timer, so
> this bug was causing KVM to go into an infinite loop of
> taking the vtimer interrupt when the guest first triggered it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  hw/intc/arm_gicv3.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
> index 8a6c647..f0c967b 100644
> --- a/hw/intc/arm_gicv3.c
> +++ b/hw/intc/arm_gicv3.c
> @@ -54,6 +54,7 @@ static uint32_t gicd_int_pending(GICv3State *s, int irq)
>       *  + the PENDING latch is set OR it is level triggered and the input is 1
>       *  + its ENABLE bit is set
>       *  + the GICD enable bit for its group is set
> +     *  + its ACTIVE bit is not set (otherwise it would be Active+Pending)
>       * Conveniently we can bulk-calculate this with bitwise operations.
>       */
>      uint32_t pend, grpmask;
> @@ -63,9 +64,11 @@ static uint32_t gicd_int_pending(GICv3State *s, int irq)
>      uint32_t group = *gic_bmp_ptr32(s->group, irq);
>      uint32_t grpmod = *gic_bmp_ptr32(s->grpmod, irq);
>      uint32_t enable = *gic_bmp_ptr32(s->enabled, irq);
> +    uint32_t active = *gic_bmp_ptr32(s->active, irq);
>  
>      pend = pending | (~edge_trigger & level);
>      pend &= enable;
> +    pend &= ~active;
>  
>      if (s->gicd_ctlr & GICD_CTLR_DS) {
>          grpmod = 0;
> @@ -96,12 +99,14 @@ static uint32_t gicr_int_pending(GICv3CPUState *cs)
>       *  + the PENDING latch is set OR it is level triggered and the input is 1
>       *  + its ENABLE bit is set
>       *  + the GICD enable bit for its group is set
> +     *  + its ACTIVE bit is not set (otherwise it would be Active+Pending)
>       * Conveniently we can bulk-calculate this with bitwise operations.
>       */
>      uint32_t pend, grpmask, grpmod;
>  
>      pend = cs->gicr_ipendr0 | (~cs->edge_trigger & cs->level);
>      pend &= cs->gicr_ienabler0;
> +    pend &= ~cs->gicr_iactiver0;
>  
>      if (cs->gic->gicd_ctlr & GICD_CTLR_DS) {
>          grpmod = 0;
> -- 
> 2.7.4
> 
