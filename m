Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1398387wrq;
        Thu, 12 Jul 2018 06:57:27 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdHYnOVdDEYCatSLrrdSXtvBhe/ZFZp+ixbziSTGAzU5gsNSn3h/5snkSDhn5dbK2YeLqlf
X-Received: by 2002:aed:3573:: with SMTP id b48-v6mr1914113qte.370.1531403846990;
        Thu, 12 Jul 2018 06:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531403846; cv=none;
        d=google.com; s=arc-20160816;
        b=Kl4/P4Yn2G07GdgnziVRajcUZibcpkeFMpOCjGun8hdg8HfuHnDeRn775MOUrLprMz
         cul5U67anMh3Hs3HvpKpMLRi6m/OX6zm4/UuJo+tRO4hgtBvaIF9Vq6jLaGhAeT0mEZU
         WJxKDpg8oYW1La8V34g/1zUHoxOSIvhNE/0m9F4M4I7JmJlQYn7syCXc6MaG74bD55ag
         BLTeansHPyFNKzFtQ856ivYApsij0LyYv6zgD02yE8B/IPV4YC8cAeM8ctWe3/mVvNGy
         80i7EbE9t/LvN+DSLMnXMdsUb20i/A1ghVkNEbIqxHtlKTqTRJnqJY9FIR47uM6A6DJV
         YUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=3cIBQAAzh4SsQlzAdSiIkHlYKW8j4dB0GHv988J0QJk=;
        b=D7gVYTV7y12hsAVfyMde5Gs394C9dEquJv16zQaag4iQp3BnPLX6ylcDEcjGX3Z9Wp
         buGUZjhE1lVWhyYZBG4nvyzcj9Et+1cRVTTGFLbpStr9XaHQxdt3fSpFGieEiwK8iN4S
         KtP0BPBVtIWdMQrVkYesXBjxayYGSrxTBCYrSriWc2uy+pI4vNZX6j6x07IiRVcrWuY/
         3XcjF9ElF/T6686NqAhN+K2COyc6/3GLJeewyOkEyjX6w1A8NbM4/YKF9BCgjrdeIwhc
         MmaRyxHMQvZVkIz5DdpZ9TxkpQDSHYhjtbYjv8mS/abU+YvoYLS7EduSXCMrPVXLmaQ/
         RaPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hXlAgZg8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z8-v6si1496560qtm.205.2018.07.12.06.57.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 06:57:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hXlAgZg8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60295 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdc62-0005Ja-FJ
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 09:57:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdc5p-0005H9-UG
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 09:57:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdc5p-0007Vq-2V
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 09:57:14 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:33568)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdc5o-0007V1-LP
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 09:57:13 -0400
Received: by mail-oi0-x244.google.com with SMTP id l10-v6so9225612oii.0
	for <qemu-arm@nongnu.org>; Thu, 12 Jul 2018 06:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3cIBQAAzh4SsQlzAdSiIkHlYKW8j4dB0GHv988J0QJk=;
	b=hXlAgZg8pQ7aTpR+a0DBjJf7cTUehfxGqfI9CI2J1urBNVuKO7SAmW712B5iMcC7Ci
	zQLRnIBPkPz1iq/VwyZXxWL/S7RMY40hlZoRfKOfbBspui5LaN8liDyAx/V9mue5nV5B
	zkPCP9X2gtmty1TeX9QA6bkh32M7RiAlr108Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3cIBQAAzh4SsQlzAdSiIkHlYKW8j4dB0GHv988J0QJk=;
	b=FcYUuBrX7QsANDPqHQgCL2AHxT8DM2ZXDVEXwEFi5+DWV7oTieDxqDWDio1grRxQwI
	eFHUEnrXviW1OuFGwMbsoKnNJgqImVQ2lzV4qJfo7/fgGelnaLyaVZE4e/9RW2NNTPeZ
	48jxFUFb9nQFXGovVkdJRJIr84Sp/xxqLEoKW9E4Xt/h/0AW2/id6Jg2gV2G6VKtJdqp
	fxbJU3LBv9bcoTsiaILd9E4tCGU++K7Mh6+71DQb3797PmfUQPu3D7v8DfBmKJSkX/9S
	B8FpRmU7KlJNYq1pDs56lkqy3/DJvluPrJWbi/bsFpWWPa+DRWITEaSYuQLkjb58oMQJ
	piZw==
X-Gm-Message-State: AOUpUlHhf9inUZidNxbHnnd4OMpzvD6FUuQxggVajltyFDIXyCV4dNSL
	XtmzZKIygD6gTKyx98lRL1Ke2kan1G7/FdfD2kAoxw==
X-Received: by 2002:aca:5f0a:: with SMTP id
	t10-v6mr2271260oib.337.1531403831741; 
	Thu, 12 Jul 2018 06:57:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 06:56:51
	-0700 (PDT)
In-Reply-To: <20180629132954.24269-17-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-17-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 14:56:51 +0100
Message-ID: <CAFEAcA_fFsqwr316OLcZVwBs72ESLob1AKDZN24JfFo78zQ=AQ@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v3 16/20] intc/arm_gic: Implement
 gic_update_virt() function
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
X-TUID: aARfx8TglKBr

On 29 June 2018 at 14:29, Luc Michel <luc.michel@greensocs.com> wrote:
> Add the gic_update_virt() function to update the vCPU interface states
> and raise vIRQ and vFIQ as needed. This commit renames gic_update() to
> gic_update_internal() and generalizes it to handle both cases, with a
> `virt' parameter to track whether we are updating the CPU or vCPU
> interfaces.
>
> The main difference between CPU and vCPU is the way we select the best
> IRQ. This part has been split into the gic_get_best_(v)irq functions.
> For the virt case, the LRs are iterated to find the best candidate.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  hw/intc/arm_gic.c | 170 +++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 130 insertions(+), 40 deletions(-)


> +
> +/* Return true if IRQ signaling is enabled:
> + *   - !virt -> from the distributor to the CPU interfaces,
> + *              for the given group mask,
> + *   -  virt -> from the given virtual interface to the CPU virtual interface.
> + */
> +static inline bool gic_irq_signaling_enabled(GICState *s, int cpu, bool virt,
> +                                    int group_mask)
> +{
> +    return (virt && (s->h_hcr[cpu] & R_GICH_HCR_EN_MASK))
> +        || (!virt && (s->ctlr & group_mask));
> +}

For a real CPU interface we test the GICC_CTLR EnableGrp0/1 bits here.
For a virt CPU interface shouldn't we test the GICV_CTLR bits ?

(This doesn't actually cause any wrong behaviour because this check
is just an efficiency check: "if interrupts are entirely disabled
then we don't need to do the expensive look-at-all-irqs checks".)


Otherwise looks OK.

thanks
-- PMM
