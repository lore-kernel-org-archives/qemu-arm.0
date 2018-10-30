Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5272103wro;
        Tue, 30 Oct 2018 01:18:49 -0700 (PDT)
X-Google-Smtp-Source: AJdET5e4+yp1CERKUtb2Kqu8M0QH3nFy3GCtOIkwSqbmwKq0pwwqxmHWwk5rgwLBRrb1mZcJV5j7
X-Received: by 2002:ae9:f80f:: with SMTP id x15mr8517423qkh.341.1540887529582;
        Tue, 30 Oct 2018 01:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540887529; cv=none;
        d=google.com; s=arc-20160816;
        b=wYNaFNs1UAEAldvWAI1k4D5rT9D8gn6qCCMT3zkAyCvR0clQuCiTk7sfh608DlLM2b
         Y7JzLlaLCECPyjVkqqekmQFUu0CHnSqUg/L883fno350LeXUKjI8TLj9MXn9SEBHiHDb
         8twhKC0Pzm0BaQuhUDdbr2h3cKFJEvuTHt2ihSaBLe6p3JqTZJbKyn9pO38BAaNxRjTt
         DD4Q1oc2SOEARiy0b/yvOVxBby1GwNyPExDp4qRjd2XRk6vhdQjFb2MiNzGBYAlPmeoP
         HYOmXWsrNhVc4XJYO6dB5ART2crV+NoKkk6UTCTb0Xo7ExFaSnCzTtcaDI16rrgcDyPp
         lBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=CMn0FQ2FVBYFqQ2MITyVoHiMTWScJG00qeFc3s4OlSQ=;
        b=QqNGrNQBnO4eaD3j9PV5PxGM3ovsko/KhgEG9nO3g0nr4E9YGU/ApjzIr9bua/MAB3
         MNksyYx46OvonUU8h7OWJrgUo49EudXEviB1VTo9XA+eV1O2d+4YpTvMAbzyCfalsuHJ
         CVJMdu0boZZJODiXleyqjhbnOZbsnp1nRzdWjjLnX1MeBjfIIKQEXJ1on4JIIfSxiike
         FWxEnmy57io0qQRryITMwSFdylane4k6BZ71iCbbp/8d+CdW4uFbbtNV4uEkZ+uD7fHw
         tgyGlhLZKXXHIcMJbpVrqBIynwdjC43qwbA3P80C64xJ801/zxt1B60lTMnxYohUn6Y4
         8mdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eLv50N64;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 55-v6si5329571qty.142.2018.10.30.01.18.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 01:18:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eLv50N64;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51511 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHPEf-00073d-2b
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 04:18:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHPES-00072s-8P
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 04:18:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHPEQ-000394-IH
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 04:18:35 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38899)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gHPEQ-00032a-9H
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 04:18:34 -0400
Received: by mail-wr1-x441.google.com with SMTP id d10-v6so11498105wrs.5
	for <qemu-arm@nongnu.org>; Tue, 30 Oct 2018 01:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=CMn0FQ2FVBYFqQ2MITyVoHiMTWScJG00qeFc3s4OlSQ=;
	b=eLv50N64CyhebcCUnBDu25ym3Sd7KirOK/6yXKfgTohc2YNY6wkdX/dATkzMhEOFkP
	KHnmIN4wGorFrxdsErVmnm2wzX76I2n/2reRMXpzxfrE4cSfw/uS0Pfs3fT52415OULC
	EV6b/WD2zWH/VhCqC66dHAiR877g1lRK/thRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CMn0FQ2FVBYFqQ2MITyVoHiMTWScJG00qeFc3s4OlSQ=;
	b=kODHnTS0Q+5r0qKDazKIqx/7Z68P7g/xCdopmmeKOGm9XMWHcrD42a3ogHZ/R0Ztk1
	/3Wn0MFcxLP/6KgmPWUpFKu6qEBjxy+XYEDzOVzIRdfrgzEd4hbvrK/ELRsZdb1CKXbx
	BxlKBaDaO96Gw9Sm3yfOdBvuTSXs/8rG2CmEKDlCzUHA4mPyWAwq5lMU3ZPGj66aF+PC
	wAW+W7P7ZovmTZZa+xMFc0QKHieXaxtrHWwrCJP8ITmFKHhemzQqekzm/hzoqkA2dzlf
	aLJCYScwot00Ae4dqDQNLJfdb3w1NgJ8VFsu16u96APcAiOA9dHVKvy/S2UqEZR+H+Dm
	ZcyQ==
X-Gm-Message-State: AGRZ1gKmrephaSKONdbLAcna/toNup4JfuPcuokuiKMvcd4TzTySiNXP
	8K3w+/GtOgqjm7l66YxnK3ejFDLqEd4=
X-Received: by 2002:adf:91c3:: with SMTP id
	61-v6mr17754486wri.97.1540887503044; 
	Tue, 30 Oct 2018 01:18:23 -0700 (PDT)
Received: from cloudburst.twiddle.net ([5.148.65.242])
	by smtp.gmail.com with ESMTPSA id
	c24-v6sm41768324wre.44.2018.10.30.01.18.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Oct 2018 01:18:21 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Guenter Roeck
	<linux@roeck-us.net>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
References: <20181029232100.8454-1-philmd@redhat.com>
	<20181029232100.8454-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d3a957a8-754a-5d25-b776-d1ab9583c93a@linaro.org>
Date: Tue, 30 Oct 2018 08:18:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181029232100.8454-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] hw/dma/pl330: Factor out
 pl330_init() from hw/arm/xilinx_zynq.c
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
X-TUID: 4eNK/O+rYYz1

On 10/29/18 11:20 PM, Philippe Mathieu-Daudé wrote:
> +static inline void pl330_init(uint32_t base, qemu_irq irq, int nreq)
> +{
> +    SysBusDevice *busdev;
> +    DeviceState *dev;
> +
> +    dev = qdev_create(NULL, TYPE_PL330);
> +    qdev_prop_set_uint8(dev, "num_chnls", 8);
> +    qdev_prop_set_uint8(dev, "num_periph_req", nreq);
> +    qdev_prop_set_uint8(dev, "num_events", 16);
> +    qdev_prop_set_uint8(dev, "data_width", 64);
> +    qdev_prop_set_uint8(dev, "wr_cap", 8);
> +    qdev_prop_set_uint8(dev, "wr_q_dep", 16);
> +    qdev_prop_set_uint8(dev, "rd_cap", 8);
> +    qdev_prop_set_uint8(dev, "rd_q_dep", 16);
> +    qdev_prop_set_uint16(dev, "data_buffer_dep", 256);
> +    qdev_init_nofail(dev);
> +
> +    busdev = SYS_BUS_DEVICE(dev);
> +    sysbus_mmio_map(busdev, 0, base);
> +    sysbus_connect_irq(busdev, 0, irq);
> +}

Why is this inline instead of in hw/dma/pl300.c?
There should be nothing performance sensative here...


r~
