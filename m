Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp164940lfm;
        Thu, 20 May 2021 06:24:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG9BcUlyRrDWqoHrP5OuPCMYsGHQU1Qzm47rBeUBDr+EBUw0BS7mFu8fK6JHlnlWZ9tjLy
X-Received: by 2002:a05:6638:2181:: with SMTP id s1mr6386509jaj.66.1621517063242;
        Thu, 20 May 2021 06:24:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621517063; cv=none;
        d=google.com; s=arc-20160816;
        b=dgOr6PR7kQ4AncIrpaodwpklASuStTzXIip+z+EavHBETJn8ojkPnPu7LPXrDePKMy
         m1sfP7LddoBCgZadlErpZjRR839C/ICXQHw3MJnA+J1b3WaEkmz9Onh9uzekf+tZJlsG
         IOY8njopJVqIYK/DdevzF3GscOaKTTkfluRXdlsCVzYbjVXbUKrZvKdbUzx3XNRUJ5bs
         wE+PevuiDn1G+d1O6fjEcEKkfPE/4ka/yO3t6g17YLTfkZ7qDoWOOt9YVEr3Mdo0NGN6
         rSDCdGvRrH422li0Bwh8IoE0/1SzaxZuYH3ypJ28G8q5GodGGo29AL+BFssKHDPBpsZM
         AKyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MJkc4iF6xzpAzMqlWyGf8DzlO9FkYxYCi1eaYfORvaA=;
        b=DnCTFx7sZGSAA+MpcKQe3P1rlcYyOTERxhpiTnMaVlNG1gPimVRTr7xs9cJOdYejAH
         2F/KCFOKphyQBmXD/Qea1EwgA9gscEZYnVafqjLP20ceZ4NkH0edLTH0elyc2Cj5mgFj
         rG7X+3oG3twlhLAeQcVVooQ/T7KJj/eNKTK0jynw1fl20xHcuMK5zILNbPT1tl6U09n4
         yA/oLiKKNr9TCbZsKkpDq9NmmBEpnUk9qv7s+OCehyV+dfMZ973xYeJp9871c0CLkovy
         309B6iF5JKbycspzLW8Nc72fDlvRq7v1iqIZc6V+O0EF64gxbDmHWy5JAMcOeQ8QLYwm
         ImJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vZY0mZNR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4si2565964iom.3.2021.05.20.06.24.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 May 2021 06:24:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vZY0mZNR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljif0-0007lG-IO
	for alex.bennee@linaro.org; Thu, 20 May 2021 09:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljidU-0006LF-1G
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:22:48 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:35652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljidR-0001hl-Mk
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:22:47 -0400
Received: by mail-ed1-x52e.google.com with SMTP id y7so1859291eda.2
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 06:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MJkc4iF6xzpAzMqlWyGf8DzlO9FkYxYCi1eaYfORvaA=;
 b=vZY0mZNRujY7IFyG1Ge6yWT7beqaGkikvsVP2+EA/0dMydvc2vcXWK1xCBZUDQsqxT
 14TlG34nSA77EFiexeQRv7TA1c3N5i/cIx4OH7Oa4BvMGUvr1qVfLFJ7dX6DqMwHaRwC
 gRcXRgg90LVo8/hi/obQiaHkHaF341gnEaRE6lKWx/e1g7jYehA04F6d44cmffS6GfHe
 TdrjukGpJOT/z/8EqN95izdy82H5S2QhafRpEbdOhENDXXMvXjebmN1dfZJB5J1mjFv3
 Gk6iFZQOX6WlEvLlA7KgRA3woA0EXOZBNPYiavLZvmLtN/lbAMczB1qGPbJaHnMq98yU
 ybzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MJkc4iF6xzpAzMqlWyGf8DzlO9FkYxYCi1eaYfORvaA=;
 b=Z8QQRCraU8/4sO4saWby/x7jIeKUwjVU0kDUeDljL+Tre+Y28YkulFn2TOlUM8zd1K
 nB+q6SpZ01z4sz4p+w0iTnf3sHKZcsNL5EeK9PfdO3Jvt8/gdQXbm6i2H9GNzFB/B+Nm
 IyszSnne1tG+S3kyilOAcvONDMzXb7n9HzRZeF3EbExeF2mu/k8HaRL84Z+iCmSqukxQ
 HA4lOMHGW2wQ1iwhcJxwBz3hmNhNUbYxocwZqieNAAodbfqqOI/TPRxM2CF/oAK2S0eM
 dxj6aGWuH9PHSD9KU8TYbTcW9ygl4E6lF+xbzSyfkDAOz8W9DNmtxBKfRiAWdJlhVLZT
 ytcA==
X-Gm-Message-State: AOAM533mZNXDKEk1Sxq+OZM8NSBC6NeAlKW19hUDMefdv0ivc1KTQcF4
 l7gelkF6w3o5V2ulP5QT3ubKqpCc2abfeJckj0Cs0Q==
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr4943387edt.36.1621516964254; 
 Thu, 20 May 2021 06:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210510150016.24910-1-peter.maydell@linaro.org>
In-Reply-To: <20210510150016.24910-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 14:22:25 +0100
Message-ID: <CAFEAcA82FvAViwCbUP93HDjmdnZ3kHhJ0DAHkB+fkdpf=ukiXg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Chan Kim <ckim@etri.re.kr>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aw2/wSl1yAja

Ping for code review, please?

thanks
-- PMM

On Mon, 10 May 2021 at 16:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In icc_eoir_write() we assume that we can identify the group of the
> IRQ being completed based purely on which register is being written
> to and the current CPU state, and that "CPU state matches group
> indicated by register" is the only necessary access check.
>
> This isn't correct: if the CPU is not in Secure state then EOIR1 will
> only complete Group 1 NS IRQs, but if the CPU is in EL3 it can
> complete both Group 1 S and Group 1 NS IRQs.  (The pseudocode
> ICC_EOIR1_EL1 makes this clear.) We were also missing the logic to
> prevent EOIR0 writes completing G0 IRQs when they should not.
>
> Rearrange the logic to first identify the group of the current
> highest priority interrupt and then look at whether we should
> complete it or ignore the access based on which register was accessed
> and the state of the CPU.  The resulting behavioural change is:
>  * EL3 can now complete G1NS interrupts
>  * G0 interrupt completion is now ignored if the GIC
>    and the CPU have the security extension enabled and
>    the CPU is not secure
>
> Reported-by: Chan Kim <ckim@etri.re.kr>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 48 ++++++++++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 16 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 43ef1d7a840..81f94c7f4ad 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -1307,27 +1307,16 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      GICv3CPUState *cs = icc_cs_from_env(env);
>      int irq = value & 0xffffff;
>      int grp;
> +    bool is_eoir0 = ri->crm == 8;
>
> -    if (icv_access(env, ri->crm == 8 ? HCR_FMO : HCR_IMO)) {
> +    if (icv_access(env, is_eoir0 ? HCR_FMO : HCR_IMO)) {
>          icv_eoir_write(env, ri, value);
>          return;
>      }
>
> -    trace_gicv3_icc_eoir_write(ri->crm == 8 ? 0 : 1,
> +    trace_gicv3_icc_eoir_write(is_eoir0 ? 0 : 1,
>                                 gicv3_redist_affid(cs), value);
>
> -    if (ri->crm == 8) {
> -        /* EOIR0 */
> -        grp = GICV3_G0;
> -    } else {
> -        /* EOIR1 */
> -        if (arm_is_secure(env)) {
> -            grp = GICV3_G1;
> -        } else {
> -            grp = GICV3_G1NS;
> -        }
> -    }
> -
>      if (irq >= cs->gic->num_irq) {
>          /* This handles two cases:
>           * 1. If software writes the ID of a spurious interrupt [ie 1020-1023]
> @@ -1340,8 +1329,35 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
>          return;
>      }
>
> -    if (icc_highest_active_group(cs) != grp) {
> -        return;
> +    grp = icc_highest_active_group(cs);
> +    switch (grp) {
> +    case GICV3_G0:
> +        if (!is_eoir0) {
> +            return;
> +        }
> +        if (!(cs->gic->gicd_ctlr & GICD_CTLR_DS)
> +            && arm_feature(env, ARM_FEATURE_EL3) && !arm_is_secure(env)) {
> +            return;
> +        }
> +        break;
> +    case GICV3_G1:
> +        if (is_eoir0) {
> +            return;
> +        }
> +        if (!arm_is_secure(env)) {
> +            return;
> +        }
> +        break;
> +    case GICV3_G1NS:
> +        if (is_eoir0) {
> +            return;
> +        }
> +        if (!arm_is_el3_or_mon(env) && arm_is_secure(env)) {
> +            return;
> +        }
> +        break;
> +    default:
> +        g_assert_not_reached();
>      }
>
>      icc_drop_prio(cs, grp);
> --
> 2.20.1
>
