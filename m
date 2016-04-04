Received: by 10.25.208.211 with SMTP id h202csp1145821lfg;
        Mon, 4 Apr 2016 06:45:19 -0700 (PDT)
X-Received: by 10.140.155.7 with SMTP id b7mr13555752qhb.14.1459777519121;
        Mon, 04 Apr 2016 06:45:19 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 74si4704550qhc.32.2016.04.04.06.45.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Apr 2016 06:45:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58726 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1an4og-0001qo-NG
	for alex.bennee@linaro.org; Mon, 04 Apr 2016 09:45:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an4oK-0001UM-Ip
	for qemu-devel@nongnu.org; Mon, 04 Apr 2016 09:44:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an4oJ-0008Sn-CX
	for qemu-devel@nongnu.org; Mon, 04 Apr 2016 09:44:56 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:34725)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an4oJ-0008Sg-7f
	for qemu-devel@nongnu.org; Mon, 04 Apr 2016 09:44:55 -0400
Received: by mail-vk0-x236.google.com with SMTP id e185so179760607vkb.1
	for <qemu-devel@nongnu.org>; Mon, 04 Apr 2016 06:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nVsTSGcksqnGIzVRP6lc1n3AOlB9CjhJVunGTlH1cNA=;
	b=AS1eiKL8vwlk6spSLl7g1Gahv5Tl56uXyLy1KmdB1rOE+gtUehCxzALsf4M4Lcitqm
	duN4JGCRdXpvseaE21meBlq8FEeRSewuSvuO/OQM5uiPW5MeyHyWmqoEG+iq26P8IzlS
	gEcfo2wKLA21kJenP1JsFhSCyUb5NqDwQOm5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nVsTSGcksqnGIzVRP6lc1n3AOlB9CjhJVunGTlH1cNA=;
	b=l/mG3UtVCxg7/4FtwHWUhLQAms4W+8155Mo3CxHettY0gH3BecUlMyLr7yd+5eFTTV
	L5abQ+54RtizPSJizPmTT7qlV4fkDyH8MnR6NbT7ehb0NZExdB5DHHpojbyzJnyT0yC2
	11BWfi3aypQMDcVUr/HCblMInNfTNPVTGxaREG2cDvVaym5lFcEgI+LfAWHAgf8F5oJp
	VdyNgfSTfFpslRS7GYYgT3goaS0aiHH6itkn0/Dmm3rTK0gmqfP2zt+OUEcS7JUNbnDu
	J3htFXZII8uOm4dP8gZzCxPFkAUDLS8u1IojohIT6m3hxvFq900vldCTaOJjnxWgxzCC
	nUwg==
X-Gm-Message-State: AD7BkJLY9VQvkZRY1tzljHE17PQoLm7cFuDM9mQH3dwsLzcCb2b0QVMQi5h2i5P2Ftox+MYy72LgIDT+HHpfK1TE
X-Received: by 10.31.7.138 with SMTP id 132mr6610135vkh.92.1459777494783; Mon,
	04 Apr 2016 06:44:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 4 Apr 2016 06:44:35 -0700 (PDT)
In-Reply-To: <1459777195-7907-2-git-send-email-vijayak@caviumnetworks.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
	<1459777195-7907-2-git-send-email-vijayak@caviumnetworks.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Apr 2016 14:44:35 +0100
Message-ID: <CAFEAcA_RDSe=exvgo-yF57bQDk2=sx3kLnvKiKkXHPJHCTGE+w@mail.gmail.com>
To: vijayak@caviumnetworks.com
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: Prasun.Kapoor@caviumnetworks.com, Vijay <vijayak@cavium.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Vijay Kilari <vijay.kilari@gmail.com>
Subject: Re: [Qemu-devel] [RFC PATCH v1 1/2] target-arm: Update page size
	for aarch64
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: obwRdAV9jZYd

On 4 April 2016 at 14:39,  <vijayak@caviumnetworks.com> wrote:
> From: Vijay <vijayak@cavium.com>
>
> Set target page size to minimum 4K for aarch64.
> This helps to reduce live migration downtime significantly.
>
> Signed-off-by: Vijaya Kumar K <vijayak@caviumnetworks.com>
> ---
>  target-arm/cpu.h |    7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 066ff67..2e4b48f 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -1562,11 +1562,18 @@ bool write_cpustate_to_list(ARMCPU *cpu);
>  #if defined(CONFIG_USER_ONLY)
>  #define TARGET_PAGE_BITS 12
>  #else
> +/*
> + * Aarch64 support minimum 4K page size
> + */
> +#if defined(TARGET_AARCH64)
> +#define TARGET_PAGE_BITS 12

I agree that this would definitely improve performance (both for
migration and for emulated guests), but I'm afraid this breaks
running 32-bit ARMv5 and ARMv7M guests with this QEMU binary,
so we can't do this. If we want to allow the minimum page size to
be bigger than 1K for AArch64 CPUs then we need to make it a
runtime settable thing rather than compile-time (which is not
an entirely trivial thing).

> +#else
>  /* The ARM MMU allows 1k pages.  */
>  /* ??? Linux doesn't actually use these, and they're deprecated in recent
>     architecture revisions.  Maybe a configure option to disable them.  */
>  #define TARGET_PAGE_BITS 10
>  #endif
> +#endif
>
>  #if defined(TARGET_AARCH64)
>  #  define TARGET_PHYS_ADDR_SPACE_BITS 48

thanks
-- PMM
