Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp1272543lfk;
        Mon, 5 Jul 2021 07:21:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUywbpF4lbHhb4jia7GW+OBS6zpGtw71a0O3oDiXKYaKyVWIpDa/kCxIFS4x8b2ix8TdUA
X-Received: by 2002:a17:907:7252:: with SMTP id ds18mr13649811ejc.227.1625494885521;
        Mon, 05 Jul 2021 07:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625494885; cv=none;
        d=google.com; s=arc-20160816;
        b=jC9CfwVQF22jVnp5FuMD55OIXsHCMU/Ly02oJaAOidsMjfx2ekgARjSp0h+zqSyQFj
         /8K/UX334/2eW7U1d5E74W2edl4hbQWbfZZZFy8C9KuwzVhHmeq7411i+ADra2B2OQRv
         mgFCiFgKJkZBYrLAxiPfetYSEq8ncQbmyKXb0tiw0kBL8ePey4VzkcDtjzM9yuX5buAs
         BwGhZE67g55ODaNDa+fLFljUMVtPjIvPp65Us9lVH0eMdfdlOPAoudsov91M2bqH2Q2p
         Eaaz6907s7jl8mXA6kIP51auZ3GC/NcWDECI3mzGPdSqfWh19l4BTBkGfPxI1HoOQogd
         B+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bqPPPRrNU+LZFx5KUP6Cp8OQnYnfHIbr6N5ctiMheR4=;
        b=BxS4A556/CnoTJjCiivDMtgeu3pZoMnB3ay8qwJYekeTM9wFQtXOjET9nij63hjzGk
         aGUxy/Y/Iyd7PbqUM/rg0pgB483W+Ofw6PX3i5GRlLdt61KLBwACLm0EuBfRGxpiMhxS
         bn9loZLIkVsPOPl8M5UWpiwIkFabg8VIRSgQ48f0H5ehB6Xoxl+A/Cx5NxleaAnt3fVH
         jHXEWVUiHGONMMJOl1YINMHvWYpb/vShzNP1u/Py0XlJXD0vbfyyFoyHUGxKoSxlnfkw
         su0kWo7ex1z9xuw7VXwTBYYC0F6UR2SB2smvNTU39fslgZ+kRAlCluux+/a8wOHGOT5G
         qVXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gS6o6OLI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21si11565251edz.357.2021.07.05.07.21.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jul 2021 07:21:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gS6o6OLI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0PTQ-0006WP-LX
	for alex.bennee@linaro.org; Mon, 05 Jul 2021 10:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0PTB-0006Vk-Ow
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 10:21:09 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:34393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0PT9-0008Bj-4s
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 10:21:09 -0400
Received: by mail-ej1-x62e.google.com with SMTP id hr1so25867505ejc.1
 for <qemu-arm@nongnu.org>; Mon, 05 Jul 2021 07:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bqPPPRrNU+LZFx5KUP6Cp8OQnYnfHIbr6N5ctiMheR4=;
 b=gS6o6OLIE94tps/3aCFv0ZycdjytWkkaaTKxO2rcMmphyv1T/UR+Zn5K+x5Sp0pVS5
 MlS3QGI3CJYgAo+FQKphw8PbwKxlZvYgvSn0uFwtJnbfDFgeh6KWkH8sMWjUhobj5MJO
 XvxEN9FyIBe0XZJp62eShUTSGSiLE4vRmuEYu9LX+5wpQ0nPLjuiSY882OhftcKjGohZ
 iFQPYazgvS6eNhVDg4fTiXn08bR5BGVpU9XxuJ/POnm8jOq94mYvqMTBNlfaRMoR7/8E
 vzW21QaGpWZqpzL/oRCVMo/rSLRCmaSR8Z6+MSgrFkNWdBozBbX/pkJ00m0sJZt14boo
 EWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bqPPPRrNU+LZFx5KUP6Cp8OQnYnfHIbr6N5ctiMheR4=;
 b=tQMDJwisjF9565e2PIvaTmOAgfNGj4OrnUknrTs+PfSSuljGZ3IIH9wHHpXebyRO49
 +gR5KXMIPCFPnvhSRmxkrJNyElN98S4Y5cUEaM9jDoi0VMfufQHEX4jYR/qm3/7vH+Z2
 QVjVWZfQTv3+iimI0nppUekERu5GLLbUMRqp1P7Vx7c++g0ijYZrnZ++KO/ib5VJhX1I
 zAHp7z6SGdb2l7MTGyzf9JQjm9V7UQ+xd/xVr2aIMyw2I9pIkzTAiRMQcTf62TpJIrjd
 qAx9DcJvn6+k5kqdLb+BqVc1Fswa7Vn8ZDPMBKb8WsyZBfL/6TAvvsHNsXw9LV40tWA6
 m4pQ==
X-Gm-Message-State: AOAM532xSuAK6Os+CdcHLKQOyixfCtO13VM2Oy/U/r5QV3Pvv+hLJWC6
 xH2ZRRuYKfWRjs4aPWPZlEpdXXtbuGCDQ+jmloT13A==
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr13506362ejy.407.1625494865407; 
 Mon, 05 Jul 2021 07:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-6-shashi.mallela@linaro.org>
In-Reply-To: <20210630153156.9421-6-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 15:20:27 +0100
Message-ID: <CAFEAcA_Rn25iBodv+XOgSa-BUjxRHK8uCx82pkS4ZPNcO5NaQA@mail.gmail.com>
Subject: Re: [PATCH v5 05/10] hw/intc: GICv3 ITS Feature enablement
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lHab3e8O9Rrg

On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added properties to enable ITS feature and define qemu system
> address space memory in gicv3 common,setup distributor and
> redistributor registers to indicate LPI support.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
>

> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index f7675a5adc..43ce4a8a95 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -68,6 +68,9 @@
>  #define GICD_CTLR_E1NWF             (1U << 7)
>  #define GICD_CTLR_RWP               (1U << 31)
>
> +#define GICD_TYPER_LPIS_OFFSET         17

This should be named GICD_TYPER_LPIS_SHIFT, in the usual naming convention.

> +#define GICD_TYPER_IDBITS_OFFSET       19
> +#define GICD_TYPER_IDBITS_MASK       0x1f

You never use these, so don't define them.

>  /* 16 bits EventId */
>  #define GICD_TYPER_IDBITS            0xf
>
> @@ -123,6 +126,9 @@
>  #define GICR_TYPER_COMMONLPIAFF      (0x3 << 24)
>  #define GICR_TYPER_AFFINITYVALUE     (0xFFFFFFFFULL << 32)
>
> +#define GICR_WAKER_ProcessorSleep    (1U << 1)
> +#define GICR_WAKER_ChildrenAsleep    (1U << 2)
> +
>  FIELD(GICR_PROPBASER, IDBITS, 0, 5)
>  FIELD(GICR_PROPBASER, INNERCACHE, 7, 3)
>  FIELD(GICR_PROPBASER, SHAREABILITY, 10, 2)
> @@ -137,9 +143,6 @@ FIELD(GICR_PENDBASER, PHYADDR, 16, 36)
>  FIELD(GICR_PENDBASER, OUTERCACHE, 56, 3)
>  FIELD(GICR_PENDBASER, PTZ, 62, 1)
>
> -#define GICR_WAKER_ProcessorSleep    (1U << 1)
> -#define GICR_WAKER_ChildrenAsleep    (1U << 2)
> -

Why move these defines?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
