Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3839060wrd;
        Sat, 25 Aug 2018 17:49:20 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZI4o1+y5WsS/5nsNju0ym3K8tgTtPe1JgfpDD4u/PSC/yUORN0KHzJ2ITCS4f4ZzOGRVu3
X-Received: by 2002:a37:3891:: with SMTP id f139-v6mr7515939qka.177.1535244560246;
        Sat, 25 Aug 2018 17:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535244560; cv=none;
        d=google.com; s=arc-20160816;
        b=hC9WCi/kdr6JyZnZc/j80ajxWjIPXVamEoCbXFYp8sYovAbeoC76gjDIUpFN1xQ2WG
         NUcEsStFyX+wf2/HxUDU9ktk2aBU2WfKTnM3Eo5sfT6CEBAr3tDzdiVDQx9gsiHNIXhG
         og2trbyYAXy18csCHmjrOq8DS0xXurmhtFGRUz6WAhBYNkmh3vCxjlSvgTNEsBDurR/a
         itsB8adYRZo3DYlyX063/+Sc/vZ3AkshwLklWpIhJDDiR44phQ+N5wCiF/8BVDdDi4Di
         6Y/2lfAJEMZZTiOQv8q3q4gjdr+4Wm0Z6MMH2fi0lsFlSG6ToXI1e6V5z5UoeTa1vus5
         lTLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature
         :arc-authentication-results;
        bh=hE5rSgMT4BjFcc9bx7i9UgRG+fTv4KnqTntVaaNOBWM=;
        b=SuP8R1MXbt1AcOgsLMUmA00KooWWTQy0ztar/iUtT7cD8HiYGOX9zm3U0PtWTWYnQT
         UibbK8c8d5TNusFHUV8kGKvZlczsy+hIuWz2yNx2c8aT4b6eEA2Ryz0Bg0tbY5In4XG2
         8QL2tcVRhM8KqzUEcxWaldtx/JmxC9xQBAyRWX4Vcx6VvKqmegz1sTEZO8wKdDllRV4z
         aadJGGL6GymxzGVPZ17wcHzF3r8O9AiVk7V+iwfcXk6Nn8U7nznxOujSDh0p3yRe5UbD
         GxROCaKMGpq4L469R7XR945j6tfJyu0agHzSTr0WyscSHFllnzi0lt51db4E8AFDR0xS
         dOsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=ZsEX+LZn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w8-v6si409778qvi.32.2018.08.25.17.49.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 Aug 2018 17:49:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=ZsEX+LZn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47521 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ftjF1-0003Eh-QK
	for alex.bennee@linaro.org; Sat, 25 Aug 2018 20:49:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1ftjDy-0002vb-9O
	for qemu-devel@nongnu.org; Sat, 25 Aug 2018 20:48:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1ftjDx-0006qk-9C
	for qemu-devel@nongnu.org; Sat, 25 Aug 2018 20:48:14 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:36174)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1ftjDw-0006qD-VC; Sat, 25 Aug 2018 20:48:13 -0400
Received: by mail-qk0-x243.google.com with SMTP id 93-v6so8273968qks.3;
	Sat, 25 Aug 2018 17:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hE5rSgMT4BjFcc9bx7i9UgRG+fTv4KnqTntVaaNOBWM=;
	b=ZsEX+LZn9MIX8GvyfonQm+SmSAoc0RSdgUSG4OhkOUGaQFd6nVnXlCTKbqoczL2v16
	ppuQzL8cBPlt7Gkv/h5UacRk7vZP35HPrb088Ui2p8fP3Fj5EU2oraQqBiGyUhcFmtRk
	VjPPPwenMayw3kSWq76p+MaiP8AV3XRBGHSbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hE5rSgMT4BjFcc9bx7i9UgRG+fTv4KnqTntVaaNOBWM=;
	b=Cqu1dTUmKdoR1fkZwHRagtyq8c9s49QItsz3JZysfe/GNNn8m0Nu5k3YsqImVWAMCj
	y64wGqTp3WeOfbGc9PwyAICeUV1Jv1y/xx9qCcpzUSlcZGjfRIFf2XaV7VkDorZt4Fnr
	UBZpbxIJ33OgBgX6GbwE3x2nkkgrJ9spKbJ7uOVj9WTX3otd209vTaddcKkrd7sdi5PN
	vf7RR9tivLb+iDSFDR0HyowVdcRJaEms19HSYiGOT+e+bawb5R/OtqjH++XqDsmMmaMd
	WtaWLF/oku0wLne/M2Gm+kLuZz/my7FaSs4pa7g9v3fHoKhHyDPuvWBX3KdIChu5m2L3
	5Pig==
X-Gm-Message-State: APzg51BrLGddQVJSf42I4yWF92+sHruYGIC74iv3eH45H7bUnxqonmpc
	OaITFmdK0GjR5+qbPOnuZ94toPF6UQ5YXK7pxMM=
X-Received: by 2002:a37:6b84:: with SMTP id
	g126-v6mr7626823qkc.231.1535244492154; 
	Sat, 25 Aug 2018 17:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20180816141303.20518-1-joel@jms.id.au>
	<20180816141303.20518-3-joel@jms.id.au>
	<CAFEAcA9N_H2PqVUP-W=Sp-SQ4WYpbu5fqyN5hxkHdHGocX59Mg@mail.gmail.com>
In-Reply-To: <CAFEAcA9N_H2PqVUP-W=Sp-SQ4WYpbu5fqyN5hxkHdHGocX59Mg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Sat, 25 Aug 2018 17:48:01 -0700
Message-ID: <CACPK8Xeqaq2=Ey7cDxjQZrS1nw9mvbVsWd5ObOCDVVAuu0T8eA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-devel] [PATCH v5 2/3] arm: Add Nordic Semiconductor nRF51
 SoC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 88uLZYlcS5iu

Hi Peter,

On Thu, 16 Aug 2018 at 07:24, Peter Maydell <peter.maydell@linaro.org> wrote:

> > +static Property nrf51_soc_properties[] = {
> > +    DEFINE_PROP_LINK("memory", NRF51State, board_memory, TYPE_MEMORY_REGION,
> > +                     MemoryRegion *),
> > +    DEFINE_PROP_UINT32("sram-size", NRF51State, sram_size, NRF51822_SRAM_SIZE),
> > +    DEFINE_PROP_UINT32("flash-size", NRF51State, flash_size, NRF51822_FLASH_SIZE),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
>
> Ah, I was wondering how flash_size was handled when I looked at patch 3.
>
> Instead of your patch 3 board model code reaching into the internals
> of the NRF51State struct to pull out the flash_size field, the board
> code should set this property on the object it creates, and then it
> knows how big the flash it's asked for is and can pass that value also
> to the armv7m_load_kernel() function.

Thanks for the review. I've sorted out the other comments relating to
this patch, but I wanted to discuss this one.

I agree that it would be neater to do this. I didn't as the flash is
part of the NRF51822 SoC, opposed to some external flash that is on
the microbit board and connected to the SoC. This is mentioned in the
comment at the start of the file:

 /*
  * The size and base is for the NRF51822 part. If other parts
  * are supported in the future, add a sub-class of NRF51SoC for
  * the specific variants
  */

What would you prefer we do here?

Cheers,

Joel
