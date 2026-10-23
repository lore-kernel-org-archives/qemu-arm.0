Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C519606A31D
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 12:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XL4ene9o
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKE15-0000v5-Tr; Fri, 23 Oct 2026 08:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKE12-0000sU-MG
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 08:04:56 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKE0x-0000th-VE
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 08:04:55 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-8b0cf2c0785so7438937b3.3
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 05:04:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792757090; cv=none;
 d=google.com; s=arc-20260327;
 b=fWr9DcYC1i3kW6IMtf7JBv5BosIpMQYobwSU4W/X9J+jUvHT4JIH86ZZxRoqU2LJyH
 0zNFS5WgA9Dj8qTJXLNj4jrWaI74i2CkCyWLxK9ReYA4Cx25qYfz/44u0THi9629XSUD
 /CwIcMfHAU5jdegWWTy0w1Ul9ngD8f/b7WLAJoml3Ul/RJCUL6ujOM9ZmHIG9iynlzbH
 aeMFMYFFCs/8xsPmb/MwdSOmAscKxgIUOlJ4wnI63Baxut9CU2lwd/V7JfKnKzqIraLI
 U8UmKv20bIf4X0pnn4ehObohVHIUZqJye3FFrQk9NMY83tABCbhoLwt5PU18Nh1O8bAg
 68/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=FeHXqLjqAXP2xWWAenvxFwnk0YeIH+GjC1tle1H0ukA=;
 fh=TGrCKUMsEazqYR4yXIOrNOal+qj8NT965CTRmjbfK3k=;
 b=RzVsRPo7RkehQGXSYevzFGnjC7EcDcpmM3MTU0KyB3GaEfBM+91N1t62sPCyypAYeA
 38jmq4DwZCWCl17uFTkoVcceqmrX57EgZaOgswqCm4qG/aBh6YGO5kZ9VXANeNy2pnHR
 HcRNZxIYZoE3q038GdTw3lsRcK5WT6KIoh4LnessPSfUJzJdlwPWN+blp0AJcb/cl27s
 2TFTWSL/I/nnxX/Xm7fBenKXrD5p2OT+dcQuvHcvWuaiICFmnTZ3OKJbyqS2PLKjC8HX
 k3Wd0SnnX/4U9CdM0Jf4t2KW5xVFcIPwzE8FeT4r08GnWd2MsDkKdxq39TCMgoOBJ4Bf
 nW0w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792757090; x=1793361890; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=FeHXqLjqAXP2xWWAenvxFwnk0YeIH+GjC1tle1H0ukA=;
 b=XL4ene9oBgP5kFb5YvOlxvyIEWD8UsugCIJpHftUCFPw+YPeKX5hOl6e/yKdg4omtz
 moX59TKzXbYUM5hgqtN4A8I6ommKk26Rp61djUvozV6XK7/akxmWvwkoSvwnjUOspGPL
 uAp8uklP9pFw7pUavc3xZeLRxK0be34AqPhelukHS1GNVx5eAvpAAKAtX5rBO1ea0+Kj
 QCEfOpb5e0/iXS5sb37u9RUm546zQtUbJjRUExD3gh72VOPJi2Tdpix7ZWmWp/12gmPk
 yxz6Y1MFpS5SsmhTpHxWVJ/+NXwLgvqcNjVFUJ3T6ODEW0ywtl+hmnwtEC1uEqBdKxlm
 IWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792757090; x=1793361890;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=FeHXqLjqAXP2xWWAenvxFwnk0YeIH+GjC1tle1H0ukA=;
 b=L4rYpggnMi1Ee8NqUd1p2Q5kinGCHff8GdpLP+A0hpTJ3Wy5vLnpD8daPu8u7J+5lv
 0eD5SXZifwcZkRZG8+ZT3iDl8TnkxoB92VnblbUv8YHNcVVsupSWinB16ZOLBy48ES9T
 q4QuLHEA41XfEEhJz+g1K18t4d15i/3IbAyXIFHMILdk/GyiHU8pt/ShtMp9kRLFxsTf
 S+buvENvkhi6jw3vSYVIty1OW2S85CEkIHWW4/leLn9FsP20IG+hvDTOjf78rIc/DDd9
 +bVrNB2cti0XGdmX46NPTd+Eylm9zsH8lN+RRzea6J66E3S3uysWQUV5r2FBhzCfurc1
 uLRg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwVEU3krPXGo6CTL9ZpjA1yRpwKi6lG8+XcQVzccj61GI647mxfvUACQcaZRDhPkROgGSUsveb3jA==@nongnu.org
X-Gm-Message-State: AFq9FYJegpKLjC5MVBmCX43XVMXxaTtQGhkrnZxQ6fqnBzwmDD9u3J0L
 fTXweGkXLODOn1Hb+GmLsdowBaluDu2EI9sC1eVtJVy/r9vjoYtXtiCi4SH1C1evwWWZ0CS9a8o
 /0Y7wSVTb2RvLDh7qLfEzK9k2jV6O5YOTxu33hKaUQdgA7zEgQspROvA=
X-Gm-Gg: AYBFou2q6AxLCIQA3mvnMtxq9l2Ke6s7iRyPBfTh3RIw358UtDQikNLIJwl15c6JV3i
 LraRGGpidzNEKx1giSPzDr09z3vb6xqDhWYa91eAdV3WeX/Azawb1Yky4olZdlIbGDXXIcsIYdK
 jETl5aPyf9I+Jo988cqfzhLsVahVHghDv1F3T7s+z8ufNmKJjns0gQV33OeAAftxj5IxvmNKwGb
 zKLwpiZ4atfxd8N50Suii8ou5bAlWPhEvtZouZuqJDkwGLWS1ICDJaONghnvhIt2FSKJp47Fe0D
 jTlc4v0KnPM4CpEBxkAuzQprjgZUEjXFnCKVPfodfhIjrIdKJ9hc9aZzh93NG0hyUP+J5zHK3rb
 GuZbdpUrtNAR32zd7Fedd9HOcWfXWfzsLzfHUNTCLxMgIVuEofwD1K56wsqAb/g5wQ4bdtvzptk
 +wHv2+8Q9o9l/Ai9Ooj0a3
X-Received: by 2002:a05:690c:e245:20b0:8ab:447c:b159 with SMTP id
 00721157ae682-8b157dee59dmr9779487b3.94.1792757090011; Fri, 23 Oct 2026
 05:04:50 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022213647.21665-1-mohamed@unpredictable.fr>
 <20261022213647.21665-2-mohamed@unpredictable.fr>
In-Reply-To: <20261022213647.21665-2-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Oct 2026 13:04:37 +0100
X-Gm-Features: AclHuK_-J5UufX2xkE0Kpq0_5P4oMGP8GZ9weaijQvlWgDrHg8joT-d5Yo8GlWI
Message-ID: <CAFEAcA8c58Kn6hDJcBxwqsOXaiJ98cqvi6drCHW3Jcdrsq6Pnw@mail.gmail.com>
Subject: Re: [PATCH 1/6] hvf: gicv3: manually set GICD_ISPENDR on edge
 triggered interrupts
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 22 Oct 2026 at 22:36, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> This addresses stability issues with Windows as a guest.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  hw/intc/arm_gicv3_hvf.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_hvf.c b/hw/intc/arm_gicv3_hvf.c
> index ae881092ea..4876446189 100644
> --- a/hw/intc/arm_gicv3_hvf.c
> +++ b/hw/intc/arm_gicv3_hvf.c
> @@ -603,7 +603,27 @@ static void hvf_gicv3_set_irq(void *opaque, int irq, int level)
>      if (irq > s->num_irq) {
>          return;
>      }
> +
>      hv_gic_set_spi(GIC_INTERNAL + irq, !!level);
> +
> +    if (level) {
> +        /* Fetching state from the vGIC */
> +        hvf_dist_get_edge_trigger(s, HV_GIC_DISTRIBUTOR_REG_GICD_ICFGR0,
> +            s->edge_trigger);
> +
> +        /*
> +         * 0->1 edges latch the pending bit for edge-triggered interrupts.
> +         *
> +         * Hypervisor.framework does not seem to do this for us as expected.
> +         */
> +        if (gicv3_gicd_edge_trigger_test(s, GIC_INTERNAL + irq)) {
> +            hvf_dist_getbmp(s, HV_GIC_DISTRIBUTOR_REG_GICD_ISPENDR0,
> +                s->pending);
> +            gicv3_gicd_pending_set(s, GIC_INTERNAL + irq);
> +            hvf_dist_putbmp(s, HV_GIC_DISTRIBUTOR_REG_GICD_ISPENDR0,
> +                HV_GIC_DISTRIBUTOR_REG_GICD_ICPENDR0, s->pending);
> +        }
> +    }
>  }

This basically would amount to "hvf doesn't implement edge triggered
interrupts". That seems very unlikely, because basically every guest
is going to use edge-triggered interrupts, and the documentation
for hv_gic_set_spi() says that it handles edge triggers.

I would want a lot more evidence of hvf being broken plus a
bug report to Apple about it before taking something like this.

thanks
-- PMM

