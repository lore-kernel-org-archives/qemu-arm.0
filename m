Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp329714wrt;
        Fri, 7 Dec 2018 02:54:20 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V6au7pa3b1MUfh9xfDIORSMvHos4julvgRDtdCgYnZL1rUJsE1AcFmwb1gT33mMNsxJAoF
X-Received: by 2002:ac8:2281:: with SMTP id f1mr1436043qta.197.1544180060432;
        Fri, 07 Dec 2018 02:54:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544180060; cv=none;
        d=google.com; s=arc-20160816;
        b=wCJgq6JvW8FRvUqFWgZ4j+MSIVm5Si6Wh7J7Iu74yqlc+qCDJ5Dmn1GvmkHsH5C4pJ
         x/vewS+gdoi1vuOTcVhrQBuVxgB7nYiPgUybwarICF+EnlEb+8ZSkEUh1LzpWkzgTNxw
         Cd2fGdV3gZOgidstqcmZ8v5pCu2G7hKCw+3fyWsRMBmVUAn1WwFh0QLshKzjSQlpMjsW
         eZv9agvwBhlo9sH05n9IeUW10e5/xPWmOUJbtJW2KvZJtYIr/VwTeHG76UVR4MixIup3
         U/ug6ELsyKPtGgtJ5rZf3K2LwH6GnkG3X/0XgvNSFmfKU3grqwiL3gf6hmU/8a9LlIc+
         IXRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2EtSM0n/vWs0pL2fz4gAJ0/9olpKZI2BMU9XctAIH50=;
        b=LsUhya4lMtN9pf+/MOcQbBfdVScLArK4u3sErER9Z4pbl9+40iBwWqcpBmNxcI7owI
         o6OM0oP9y30Jt1EkODQ4IOYYN+Aj4asfWsqBL+1DZs1OWrLlrlt7gM1a3ctPmMcBm9nE
         PNnCceqZlNKEWZGi/gFNUZkQs5ZBuK2v7UsUVPHCu7F5cBp7emnuJn6NgoLQaz7UqIUh
         8zm10H4MkI7sYrQmU3q2OLBgwrByxe1KgZN8qi9rOBlE+ogMfuukUIdagBkJ2R0D7q+0
         kyPyNi/eJKOZvxY2NHRWGlia2i2cmgtx5jbuCFuLpGMIqCEIhvxWcb/XGCINz1hU+dpG
         plCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z5ALntET;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v40si31060qta.42.2018.12.07.02.54.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 02:54:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z5ALntET;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVDlz-0003On-Up
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 05:54:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gVDel-00040x-UJ
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 05:46:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gVDek-0008MT-Ec
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 05:46:51 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42577)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gVDej-0008M1-VN
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 05:46:50 -0500
Received: by mail-ot1-x343.google.com with SMTP id v23so3352857otk.9
	for <qemu-arm@nongnu.org>; Fri, 07 Dec 2018 02:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2EtSM0n/vWs0pL2fz4gAJ0/9olpKZI2BMU9XctAIH50=;
	b=Z5ALntETtcEhus+7R5ji9/WmaDHhyRidXzLjniNdMCehqBsSzldLwQB7ARGBdimrbU
	FepsK+f3mjrDxkTe8vqA+BiXZOIlhKvImVTkwY5SBzRuj2KOhEgyeADMumthBfWmAzHk
	HLBKutpiANb00RgRkHU4Fzl+hcRw3A+Gwuayc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2EtSM0n/vWs0pL2fz4gAJ0/9olpKZI2BMU9XctAIH50=;
	b=CpS4NEJQGvtdnUGOtKSDv60bmKpb8CLpT66LhLqSxnYJ4SApZ9lqq+ScVhXBFyLrJG
	SQrZVUCuW97SI/EPB6rbir/TiWCPBNkYyK0sfqoilZpuJGkwtwnwqqZrk91Xo4gJBdhb
	NB68lwqWDj6aCWu5j+hAGsBE3of4/mrY7QyOhB8MDG9XUeeiqTxZJo+84c078BWB9ipq
	GSLabDYWkK6lVgQlXWWantCS/VHAfjt7xobd0Z0JjChTB17hwwsi9Vai02C279BE3hHQ
	N8rQwh/KXFlsfFr0Aux8eCQYkbznWO1pr78+bLGXxcDrpEr4Ef+R0MzEVBYbuV62qKs7
	WMgg==
X-Gm-Message-State: AA+aEWZBnj6pkZuRxz+MMS4D0lUwcy7Nsd9/6yJwzo2lRH78d0cz94eS
	pBaAJMNR49Ur5tu2KGJXj9uGC3kN5rstZj1s7HVRQg==
X-Received: by 2002:a9d:12d:: with SMTP id 42mr1061846otu.352.1544179608953;
	Fri, 07 Dec 2018 02:46:48 -0800 (PST)
MIME-Version: 1.0
References: <1544172110-76526-1-git-send-email-peng.hao2@zte.com.cn>
In-Reply-To: <1544172110-76526-1-git-send-email-peng.hao2@zte.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Dec 2018 10:46:37 +0000
Message-ID: <CAFEAcA8ZuifFOR0pQkbhSgkDyk49xVQAv6shYwWr6AkpEX9jNg@mail.gmail.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH] hw/watchdog/wdt_i6300esb : remove a
 unnecessary comment
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oGJZA1W+CpbU

On Fri, 7 Dec 2018 at 08:19, Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> The registered memory region of i6300esb is not suitable for coalesced
> mmio, because a write for the region may trigger an immediate action
> and can't be delayed.
>
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  hw/watchdog/wdt_i6300esb.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
> index 7b59469..1c6eddf 100644
> --- a/hw/watchdog/wdt_i6300esb.c
> +++ b/hw/watchdog/wdt_i6300esb.c
> @@ -449,7 +449,6 @@ static void i6300esb_realize(PCIDevice *dev, Error **errp)
>      memory_region_init_io(&d->io_mem, OBJECT(d), &i6300esb_ops, d,
>                            "i6300esb", 0x10);
>      pci_register_bar(&d->dev, 0, 0, &d->io_mem);
> -    /* qemu_register_coalesced_mmio (addr, 0x10); ? */
>  }
>
>  static void i6300esb_exit(PCIDevice *dev)
> --

Hi -- it looks like you cc'd the wrong mailing list by mistake
here -- this isn't an arm specific device. Patches should all
go to qemu-devel.

thanks
-- PMM
