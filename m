Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp5576136wrd;
        Tue, 18 Sep 2018 11:54:36 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdaZBMR1qU3QvEnyu1PZhcWg/eWAWHnNBxdy4JoptdMyLumSivWexj6GwX1jZT4ty17eNK7h
X-Received: by 2002:a0c:d842:: with SMTP id i2-v6mr21812173qvj.145.1537296875920;
        Tue, 18 Sep 2018 11:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537296875; cv=none;
        d=google.com; s=arc-20160816;
        b=NPB3YSY/UlhLiyu8qBL42Cbf9yrkc+tDx2ughxGi3G79DompNT6677k034FYOs8MF4
         CFgr6MxQZSls77rFYa9tjLGGc3tMvlA3vHsAfPHU7i5OI+HZ8/yGFQlFtm6wSVt82yjS
         xRfxrzNtJuRrkIZD8bJAXZ0/iOyC5ZFwbkrrzflpJ7qGtPOE1BzWkYpZIwe9xRK62tzu
         G8n/noPQ7PZNOs5ruf0PM05QioTZXteua1grkKblJBnHK8eu44KMVoMwT3+/Fh5JqQRZ
         oHXyio/iwKY/iVgXgLFsEkpf8JXHuCJ13n7y1d1qguzzSr2tcFi9um7U4FpxLoZTyShM
         zKtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=O3vnmPyVKhbMznPU9bnkRfyLhCw5wtiD5bNjsM5tsr4=;
        b=TNyQV5QgATXXQZ2TR+ITraHNiMnqcrmVm6odMPSIUACqFLoRmtwdqrT7CKyCrFu66c
         H25CQiu7G1KrMxrnlQcb3aK24EM5isRIyhr5WP5Sj1taqhs8dbnxAYxbp0WRP6Z0KYl4
         ZqHGPVYhX9yiClnJf5QY0Zu0yG4NjQF0czXtEzaPNQfDUWdfQlQJXpoL6Hw9Dcq6cPoQ
         XPlnKbT1ggTAJzM+m8VM/9Xq3BVao+QGvnqVv3BTG9obv2r38lJY90JjS0Ww67nrWUSV
         VqfERzriuWw9f5J+YL2LQHVNy3zD7EpjDHkUumMoy6V96T5PQOvIeg+ohEgFcWqNipzs
         h3QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IPnXC6MN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k7-v6si7556594qke.215.2018.09.18.11.54.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Sep 2018 11:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IPnXC6MN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42126 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g2L8t-0000BF-G7
	for alex.bennee@linaro.org; Tue, 18 Sep 2018 14:54:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g2L8D-0008CW-6f
	for qemu-arm@nongnu.org; Tue, 18 Sep 2018 14:53:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g2L89-0003sA-1h
	for qemu-arm@nongnu.org; Tue, 18 Sep 2018 14:53:53 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:42007)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g2L88-0003rQ-Sx
	for qemu-arm@nongnu.org; Tue, 18 Sep 2018 14:53:48 -0400
Received: by mail-oi0-x244.google.com with SMTP id v198-v6so2775747oif.9
	for <qemu-arm@nongnu.org>; Tue, 18 Sep 2018 11:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=O3vnmPyVKhbMznPU9bnkRfyLhCw5wtiD5bNjsM5tsr4=;
	b=IPnXC6MN+MTwNIwaI2VnSAQ8nhB87f+jZBKX8YAIqCuyvurYfD9+G1YS3UGL6+oum2
	+aUeL6Bpn1ptNrlnsblh780+W8q+tYpYGfp3TVJBhMFMTi80/nqn7DRnjACxmkGiSHLR
	ZNt6s2GYYQ8Tl43NingsdzK+ufSxJfVs5mgHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=O3vnmPyVKhbMznPU9bnkRfyLhCw5wtiD5bNjsM5tsr4=;
	b=Z6QHW6TjAQMNmkGhcVqYw8vkVnE1TOuf+elZXhBt4Nu13ZQEYipUjMdNQUtfhuPPDm
	L1ywCw+v3ivl7JkqMdZwsufDY0m/kEoYFdyBJOWbQkOA34J+mZZdMoIACjwAOUOj75ql
	hYQNtDlwaCjcCuMeKUXDCnVyqUljvYLxYdo5khpFZUT5yiP/2ZSmFjxY5SXG6NBMbgeH
	z4LsV7s+a8/kbdTwXpova1JVHZ/A1z1PcR+SuzhbWOSjNh45sQ14/B8q4pCiSfL8ams5
	q/pDn45inRZZnn2g6lNCM1fNb3ynooGOfxPLLL2x87s3RaIJgiE2AFuMzoMWRfjSBEhN
	QHKQ==
X-Gm-Message-State: APzg51A7iZl7WmryKMF6jBHq85iBhPwfOulTIik86h1lH7sgYcWagai5
	zQrX8Xry26IEzLyY1QvnrMIpoM0nygP3jyVeGXBHlq1Gipc=
X-Received: by 2002:aca:a6d3:: with SMTP id
	t80-v6mr2334563oij.44.1537296827818; 
	Tue, 18 Sep 2018 11:53:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 18 Sep 2018 11:53:27
	-0700 (PDT)
In-Reply-To: <20180831103816.13479-9-clg@kaod.org>
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831103816.13479-9-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Sep 2018 19:53:27 +0100
Message-ID: <CAFEAcA_MNEHUYOpA9juZPuUqrGf6awYc8wVWyqkfnz2Xyw=7GA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH 08/11] aspeed/smc: add support for DMAs
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 08bKNHTJ+IEI

On 31 August 2018 at 11:38, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The FMC controller on the Aspeed SoCs support DMA to access the flash
> modules. It can operate in a normal mode, to copy to or from the flash
> module mapping window, or in a checksum calculation mode, to evaluate
> the best clock settings for reads.
>
> Our primary need is to support the checksum calculation mode and the
> model only implements synchronous DMA accesses. Something to improve
> in the future.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

>
> +/*
> + * Accumulate the result of the reads to provide a checksum that will
> + * be used to validate the read timing settings.
> + */
> +static void aspeed_smc_dma_checksum(AspeedSMCState *s)
> +{
> +    uint32_t data;
> +
> +    if (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid direction for DMA checksum\n",  __fun=
c__);
> +        return;
> +    }
> +
> +    while (s->regs[R_DMA_LEN]) {
> +        cpu_physical_memory_read(s->regs[R_DMA_FLASH_ADDR], &data, 4);

Ideally DMAing devices should not use cpu_physical_memory_*().
It's better to have the device take a MemoryRegion which it uses to
create an AddressSpace that it can use address_space_ld*. This (a)
allows you to correctly model that the DMAing device can't necessarily
see the same set of devices/memory that the CPU does and (b) detect
and handle read/write failures.

Commit 112a829f8f0ad is an example of converting a DMA controller from
old style cpu_physical_memory_*  to taking a MemoryRegion and using it.
(It doesn't do checking for read/write failure, but you should, by
passing a non-null MemTxResult* final argument.)

thanks
-- PMM
