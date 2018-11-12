Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2541242wrw;
        Sun, 11 Nov 2018 16:17:49 -0800 (PST)
X-Google-Smtp-Source: AJdET5fCZzeA+dQgxm6DVFPCX4qJkAcjGke4RxJ9Z2FgamPXjDT3Ye/m6rQN0ow09PQio/ZiH2Wu
X-Received: by 2002:a0c:ad53:: with SMTP id v19mr17300844qvc.83.1541981869427;
        Sun, 11 Nov 2018 16:17:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541981869; cv=none;
        d=google.com; s=arc-20160816;
        b=X8a3oHpg94GfJeZhiopQJoBCyWBDDw3wUdeMxAkSadA2Dd9xvHS/5lDiFScANwlEsb
         Y5dtO2yCrJHwH1ggmAPFhSBisBV38XQ6E+YZYF0Y/CWdPQpmJ9sWo/HdxcgWgQDHPJ8I
         VU++1QYfEjNRxNLQEAui7Y5CdQ0KwHqKE7rgzzRBuTX4YC44XKLjAV9GbsUJEojyujxy
         y9CLUXqH6pmoOGmVTcrRv62Tn+VvJtQSSHzJ1Ft3b314lwWnsvqSWzKtV1L+0WV/LSEm
         9c7c2KuEvx18iY80XrnZqvs5FwHyebj5zM0HDgg4EzkWKKWLNYuULCadI5pJ7Z8H/cKZ
         FqmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version;
        bh=KIanP49syABJo64ORr0Llc8xPrs8vfbcsHmFvf90k8U=;
        b=ekqo2P3o0ItBZVwcCC1gerop23EebBa6m1ZXD/gnwyPR8WvLLhBObKEN3tLlDh2b/L
         fUPl9EqTxuIj6TQ3JonrAhTjoGaZmGsDGO95seg581Ncx+cIM/LQl8KczfM0KN5nwsmb
         QI8paDD1VwJVXOxTdyT32FHOhlW3Y3mr/wqJCG/yquqyZsrqwPnLkk8LWnrnjuNzAEy7
         i6pAkmFBWHBaEbmyMoILmcrblClA1969qW38KQhYeRq2RtDigSZy/YOr7E1XUhWW+5WF
         veJ+DmJgd1FfT8T9t9G9KaZzVTcTiCQ4jexwIJsrWtp0E9PZDDeFsh/HXyHhePSQNOAC
         jr5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j76si4818242qke.150.2018.11.11.16.17.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Nov 2018 16:17:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44160 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLzvI-0003A8-Ro
	for alex.bennee@linaro.org; Sun, 11 Nov 2018 19:17:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gLzv3-0002gm-D5
	for qemu-arm@nongnu.org; Sun, 11 Nov 2018 19:17:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gLzut-00074H-3V
	for qemu-arm@nongnu.org; Sun, 11 Nov 2018 19:17:27 -0500
Received: from mail-yb1-f195.google.com ([209.85.219.195]:37452)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gLzur-00073P-SM; Sun, 11 Nov 2018 19:17:22 -0500
Received: by mail-yb1-f195.google.com with SMTP id d18-v6so3267959yba.4;
	Sun, 11 Nov 2018 16:17:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KIanP49syABJo64ORr0Llc8xPrs8vfbcsHmFvf90k8U=;
	b=bmO+h+KTmKUD0jvhRWBl0pgv/TaooC1cb6qxoEIK9t8lFLAQAehZ98Iciymo26Pc75
	nvFR/EvxHyt4PVmgtceYiXxJIhljB2hwWpslIFScQ9SaDqg4BN4z/WYzE90A8zRMxLMw
	sZKVHUfL2FsRX/GlHjWn/r7QRQ+Phz5/oZL18Szr3JdMAZzU4jr1kbJlZybkSuIBAUg/
	Kz65pWbT8mnOP1B3gdXIqe+SDNWhW5wl7iwdnHh4eGKwDZ8Nuc7rT15xwDgMPTRjvfPN
	9R/DUMUQYDcbBQ60m2dO0L0BcP7P3uBtBaU2MmG1WRrs7kWcJZoOpWOemvJNd0vhRhwL
	NRgg==
X-Gm-Message-State: AGRZ1gLPeMnAxEp3RqcEhXmz8icvZlAYMeyIhhr0IuA4UjCrUghv82UC
	elttkrLAhGlLsXJyjIl4Rait8GLOq8/gUE2oTxc78Ghz
X-Received: by 2002:a5b:46:: with SMTP id e6-v6mr16880212ybp.406.1541981837622;
	Sun, 11 Nov 2018 16:17:17 -0800 (PST)
MIME-Version: 1.0
References: <20181106164118.16184-1-peter.maydell@linaro.org>
In-Reply-To: <20181106164118.16184-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 12 Nov 2018 01:17:06 +0100
Message-ID: <CAAdtpL5vyvWOdh0FCgaJAmCgKhf0SLEU8jFo+2_qzAFh-26AoQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.219.195
Subject: Re: [Qemu-arm] [PATCH for-3.1] target/arm: Remove antique TODO
 comment
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
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GawzKWSMX7zB

On Tue, Nov 6, 2018 at 5:41 PM Peter Maydell <peter.maydell@linaro.org> wro=
te:
>
> Remove a TODO comment about implementing the vectored interrupt
> controller. We have had an implementation of that for a decade;
> it's in hw/intc/pl190.c.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

On Fri, Nov 9, 2018 at 2:49 PM Peter Maydell <peter.maydell@linaro.org> wro=
te:
>
> Currently we track the state of the four irq lines from the GIC
> only via the cs->interrupt_request or KVM irq state. That means
> that we assume that an interrupt is asserted if and only if the
> external line is set. This assumption is incorrect for VIRQ
> and VFIQ, because the HCR_EL2.{VI,VF} bits allow assertion
> of VIRQ and VFIQ separately from the state of the external line.
>
> To handle this, start tracking the state of the external lines
> explicitly in a CPU state struct field, as is common practice
> for devices.
>
> The complicated part of this is dealing with inbound migration
> from an older QEMU which didn't have this state. We assume in
> that case that the older QEMU did not implement the HCR_EL2.{VI,VF}
> bits as generating interrupts, and so the line state matches
> the current state in cs->interrupt_request. (This is not quite
> true between commit 8a0fc3a29fc2315325400c7 and its revert, but
> that commit is broken and never made it into any released QEMU
> version.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> ---
>  target/arm/helper.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ec56becc394..851ea9aa977 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8378,7 +8378,6 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *=
cs)
>          return;
>      }
>
> -    /* TODO: Vectored interrupt controller.  */
>      switch (cs->exception_index) {
>      case EXCP_UDEF:
>          new_mode =3D ARM_CPU_MODE_UND;
> --
> 2.19.1
>
>
