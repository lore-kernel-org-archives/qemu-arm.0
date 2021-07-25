Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp1917960lfc;
        Sun, 25 Jul 2021 01:06:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+RFYDyJ+zydF0oi42FRb178nI2oYidN9V+CWH8GT6+k1tdwK+VAF8N0A0D/hwJ0YD9WiI
X-Received: by 2002:a05:6902:4e1:: with SMTP id w1mr16302688ybs.370.1627200398944;
        Sun, 25 Jul 2021 01:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627200398; cv=none;
        d=google.com; s=arc-20160816;
        b=RzJ5i/NRFj8D+w190VAAXVsoESZ7M+GJUBh+8gWKRkx4tA2ecqbwRrFuBdPuiN8r+T
         cX6/UwdJBWaLUvQyQcIzG75MquGTFSeMnOUkUSIctglSdXog1Qg0Dnws8qJh77Ix5Oij
         RrNM56BAbU07yojpCauzm59/mzpcid99G51jMjP1Dyzhnw6H7HxcWebyEXPmZzCAu9yW
         x+fORVX0Z3gPgbC1xcbE3Sp/3CGqAiLP1Lfoadah5LD/xW08a/AMCyqplYftCk39FqKl
         mFdL7BIx3Jtau9Feea/yGJa02U+YNnoqHW7ce5WagMYNnmkOfmYLfLxV8Kewzf+pdjLD
         m7XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=YkSShU/WfQKmU+QoAFuwA07yQuUmCePmPC02tRDmL7s=;
        b=FagDK8m+TRuJPbCIXC1Szs15R618SPAmA3S5spPHO1ZQ2N8r6WpZNSGCquTtkCDRYW
         UnN905oi5G5HxztiU5HN/N5EnghS8bpd1L4F7kEFFqSDdTKE4Yt4ezMH3a/HRJiDfVQp
         p5giT4QP5pNtfMMY59yd7MPt7kuTPg+qgKtTnoY3FkGPpM2fddDog7WvI1b1p5bQk0RR
         A4fUAlVDQhLXX/sJw3TjoBLTVZa78sGrKktamaiQosA8plksVOHu68wu5Jf8/6HpEa/l
         DIvR7u9nyUCpJjnr2Px1vWLkOceqpb5dMMJDgc1+hDTFsYEzPLU1Lp3qq2qqRtsUGjPi
         z22A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=O3N1THtx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si544936ybk.307.2021.07.25.01.06.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Jul 2021 01:06:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=O3N1THtx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:50022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m7Z9i-00050U-9k
	for alex.bennee@linaro.org; Sun, 25 Jul 2021 04:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1m7Z9X-0004zI-OO; Sun, 25 Jul 2021 04:06:27 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:50922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1m7Z9V-00085B-C3; Sun, 25 Jul 2021 04:06:27 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id DB7B6C6019D;
 Sun, 25 Jul 2021 10:06:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1627200379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YkSShU/WfQKmU+QoAFuwA07yQuUmCePmPC02tRDmL7s=;
 b=O3N1THtxXww/SE451FmYSj/UXwBl5bOcZmX4fCQGgXoNB3AO1OsCqtVOiuqjFT1V2atng4
 0DQRkZWHGDhE2dAGkvJjoGfnu/377LiSryDb5DsLkppWuLil5qb3Tx9kKG31ffAU6lORj2
 uCGw1O6lJZwhb/E3/BKdqeF1KpMHmxK+aEN9Gw/bDqoAV+ZCBqPa0FjN2Fy0mc5yhjMaoN
 WErMy/G3YK3NHK6LtyQbHnOmhBHvJFzobVrYN+uSQT1Lc7E3LZ3DYtWcIddJLroUlobuQ9
 uqPdXw+tO2gcfg4sSsTD7nqn0STnHz0UTdznovM+6hH3ROBi5bzCUEEDvcEgcw==
Date: Sun, 25 Jul 2021 10:08:17 +0200
From: Luc Michel <luc@lmichel.fr>
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
Subject: Re: [PATCH] hw/intc/arm_gic: Fix set/clear pending of PPI/SPI
Message-ID: <20210725080817.ivlkutnow7sojoyd@sekoia-pc.home.lmichel.fr>
References: <20210709094948.60344-1-sebastian.huber@embedded-brains.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709094948.60344-1-sebastian.huber@embedded-brains.de>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7yCU0plYMCCb

Hi Sebastian,

On 11:49 Fri 09 Jul     , Sebastian Huber wrote:
> According to the GICv3 specification register GICD_ISPENDR0 is Banked for each
You're referring to GICv3 but actually modifying GICv2 model. Having a
look at GICv2 reference manual, your affirmation still hold though.

> connected PE with GICR_TYPER.Processor_Number < 8.  For Qemu this is the case
> since GIC_NCPU == 8.
This is GICv3 specific. For GICv2 the architectural limit is 8 CPUs.

> 
> For SPI, make the interrupt pending on all CPUs and not just the processor
> targets of the interrupt.
So you're not referring to GICD_ISPENDR0 anymore right? SPIs starts at
IRQ number 32.  GICD_ISPENDR0 is for IRQs 0 to 31, which are SGIs and
PPIs (This is why this reg is banked, meaning that a CPU can only
trigger a PPI of its own). Maybe make it clear in your commit message
that you are now talking about GICD_ISPENDRn with n > 0

Moreover your statement regarding SPIs seems weird to me. Setting an
SPI pending (in GICD_ISPENDRn with n > 0) should really be like having
it being triggered from the IRQ line. It makes it pending in the
distributor. The distributor then forward it as normal. Why the
GICD_ITARGETSRn configuration should be ignored in this case? At least I
can't find any reference to such a behaviour in the reference manual.

> 
> This behaviour is at least present on the i.MX7D which uses an Cortex-A7MPCore.
Which has a GICv2, not a v3 right?

> 
> Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
> ---
>  hw/intc/arm_gic.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index a994b1f024..8e377bac59 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -1294,12 +1294,14 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>  
>          for (i = 0; i < 8; i++) {
>              if (value & (1 << i)) {
> +                int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
> +
Indeed, I think the current implementation for PPIs is wrong
(GIC_DIST_TARGET(irq + i) is probably 0 in this case, so a set pending
request for a PPI will get incorrectly ignored). So I agree with the irq <
GIC_INTERNAL case. But for SPIs my concerns still hold (see my comment
in the commit message).

>                  if (s->security_extn && !attrs.secure &&
>                      !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                      continue; /* Ignore Non-secure access of Group0 IRQ */
>                  }
>  
> -                GIC_DIST_SET_PENDING(irq + i, GIC_DIST_TARGET(irq + i));
> +                GIC_DIST_SET_PENDING(irq + i, cm);
>              }
>          }
>      } else if (offset < 0x300) {
> @@ -1317,11 +1319,10 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>                  continue; /* Ignore Non-secure access of Group0 IRQ */
>              }
>  
> -            /* ??? This currently clears the pending bit for all CPUs, even
> -               for per-CPU interrupts.  It's unclear whether this is the
> -               corect behavior.  */
>              if (value & (1 << i)) {
> -                GIC_DIST_CLEAR_PENDING(irq + i, ALL_CPU_MASK);
> +                int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
> +
> +                GIC_DIST_CLEAR_PENDING(irq + i, cm);
I agree with this change too, but you are modifying the GICD_ICPENDRn
register behaviour without mentioning it in the commit message.

Thanks,

-- 
Luc
