Received: by 10.25.21.96 with SMTP id l93csp645009lfi;
        Thu, 23 Jun 2016 10:47:47 -0700 (PDT)
X-Received: by 10.55.9.134 with SMTP id 128mr10694247qkj.148.1466704067167;
        Thu, 23 Jun 2016 10:47:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p69si1206420qki.90.2016.06.23.10.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 10:47:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38391 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG8jC-0007sq-IS
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 13:47:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG8dx-00028E-TP
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 13:42:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG8dw-0002bm-Vn
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 13:42:21 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:36382)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG8dw-0002bf-RM
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 13:42:20 -0400
Received: by mail-vk0-x230.google.com with SMTP id u64so116848150vkf.3
	for <qemu-arm@nongnu.org>; Thu, 23 Jun 2016 10:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EpyAHpK4PDZo1BthVOGdtZy8PjDqC+hE0KoXf5MYPuw=;
	b=i/eldTSI97JRkhAzTPyNBmpmRsQIvDNODq721qKh5xiDVH+MrYa0M84Zv2HfzAs1Cn
	9EnTFqFeyfvIBuScNtlHFTf6xJZeCMMTmniP3yMioQvqKz9cxgVQuIcXDQ6+amhh2g6m
	XktSxWuUqxbSLGg1aa3FhWBOQqK/QAXc4pU2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EpyAHpK4PDZo1BthVOGdtZy8PjDqC+hE0KoXf5MYPuw=;
	b=dWBN7FzjA1Wdqf6dHCyEML/bLhcywrAhmKTzDdGdETzpaeDtI+x95qZBnKRN6XyT0p
	kKrjX+WD5XHO16oohG2ysasNmLfwvNFVGqBi+183I7PF4JNV617DlKK5aAJZxT3DhEos
	6JQida+M2FdJEgC3W/I9xjgJEp4uJoMsy1AakB7I1QuXfZudkt3TIEunIstg4QwgCIjn
	AvhrYqiXdQPngzcxLj+mJUc4zbbTp9hsSDhGxxyjGUtZOW5B0MrjNtrEs9W7e3b5p6XI
	M8gUvg6PwmZifkkGGh0UEtUndJt4y03QHOYIZGR8wclWGPe/tSJ+H/i2OAxjwGDubf6M
	OfEw==
X-Gm-Message-State: ALyK8tIYbSVZREycjY/kR5UTqhZyCAro4oBKNXRuEgHhl7Z2khKftOQgJ0V6U5WbiUM6JJT9Q3/UoFpQO8mQnqyq
X-Received: by 10.176.6.41 with SMTP id f38mr16201612uaf.82.1466703740383;
	Thu, 23 Jun 2016 10:42:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 23 Jun 2016 10:42:00 -0700 (PDT)
In-Reply-To: <1466648115-17015-2-git-send-email-andrew@aj.id.au>
References: <1466648115-17015-1-git-send-email-andrew@aj.id.au>
	<1466648115-17015-2-git-send-email-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2016 18:42:00 +0100
Message-ID: <CAFEAcA9MYTmTRsj1ga-Vu0yrunytvY9rAUDwHR3ziY2oHWNYpg@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] [PATCH v2 1/3] hw/misc: Add a model for the ASPEED
 System Control Unit
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6faXWJGxoSQM

On 23 June 2016 at 03:15, Andrew Jeffery <andrew@aj.id.au> wrote:
> The SCU is a collection of chip-level control registers that manage the
> various functions supported by ASPEED SoCs. Typically the bits control
> interactions with clocks, external hardware or reset behaviour, and we
> can largly take a hands-off approach to reads and writes.
>
> Firmware makes heavy use of the state to determine how to boot, but the
> reset values vary from SoC to SoC (eg AST2400 vs AST2500). A qdev
> property is exposed so that the integrating SoC model can configure the
> silicon revision, which in-turn selects the appropriate reset values.
> Further qdev properties are exposed so the board model can configure the
> board-dependent hardware strapping.
>
> Almost all provided AST2400 reset values are specified by the datasheet.
> The notable exception is SOC_SCRATCH1, where we mark the DRAM as
> successfully initialised to avoid unnecessary dark corners in the SoC's
> u-boot support.

> +static Property aspeed_scu_properties[] = {
> +    DEFINE_PROP_UINT32("silicon-rev", AspeedSCUState, silicon_rev, 0),
> +    DEFINE_PROP_UINT32("hw-strap1", AspeedSCUState, hw_strap1, 0),
> +    DEFINE_PROP_UINT32("hw-strap2", AspeedSCUState, hw_strap1, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};

You don't seem to specify in the board layer or the SoC layer
any of these except hw-strap1, so should the default values
for these really all be zero?

I suspect silicon-rev at least should either have a default
value specified here, or have the SoC layer specify it.
(It probably should not be specified at the board level.)

thanks
-- PMM
