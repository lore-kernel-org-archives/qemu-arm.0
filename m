Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1784416wru;
        Thu, 16 Aug 2018 05:21:00 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwK1YUNyEdMRFRPaVig2MhF7mAp25cSijTZnaE+QVxIbZqTkIfLKzK17IcprjfDjR2prxbV
X-Received: by 2002:a0c:8622:: with SMTP id p31-v6mr26503651qva.116.1534422060312;
        Thu, 16 Aug 2018 05:21:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534422060; cv=none;
        d=google.com; s=arc-20160816;
        b=LlZXuQ84yTZ3eIE8+O9V+RhPoH6URMa3ZeMvrORvLoAwiOtv6ejTPxwB02Cc4XXAXj
         fxBpfrslElgKBfGoRfPl/LQDxQa7efl7UEC9rx0FvkeS1zygltf/0/C2Xov9S9HiWvbs
         C0iS7B/AYFxqR3/JQM2f6OUJ7Oess7mzxPT07YdooosPMyyMDLzrZpJMkBl0DcqdnQYj
         ODUDO4227oH2RJXpLlsVVDhDc8a6XIq7T7tscojpL0ENcjLIah1bo4x3b7OT/ceWe+hr
         PJRc/+Iqc4DQCb9VMHLsKJ9q2kQhcvMl1AjtJo2XdRXGFwvDGKHK5zS4wQ1y5/nYVS2C
         yvEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=4RiuQhUNWuW4zzKNw1UiQw2ecfCRmTx60DjnDzML+Vc=;
        b=yZyb+hUpvPQ3amzd5aVW9OihsrljhLdhZY2BAhe7SB5LYP9vaVo0XCqEOYvICjKlac
         3E8RstlFrrK+KgIoEpjHU1nz/8RUoUYEcStxwPa01mCRGlJtbZT5x5QvaCxX+abNi1o7
         CugSl0kO71dqoKmI4TleCrAfcJGFsy7oPGJrphbxBHkt6otm8nhzEAhe+v1BH5eyDh7i
         9xLQKzxAXXVv8kkC0HrHvG878x2NoIizXscCz0ds0PHCwHCoqcvWaLMVwTXHY5mkOrz1
         80H+U97Nf0TCyWznlLTPA3GMtH/cHtdAWBUM849S8QRdbR2GwjJSHrduq0xIO9iIc3PC
         DF6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NMB2Klvz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h35-v6si152073qvi.283.2018.08.16.05.21.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 05:21:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NMB2Klvz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55275 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqHGt-00011k-Ow
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 08:20:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39713)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqHGd-00011Y-RW
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 08:20:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqHGb-0001X8-Vl
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 08:20:43 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:34852)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqHGb-0001VD-K6
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 08:20:41 -0400
Received: by mail-oi0-x241.google.com with SMTP id m11-v6so7627177oic.2
	for <qemu-arm@nongnu.org>; Thu, 16 Aug 2018 05:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4RiuQhUNWuW4zzKNw1UiQw2ecfCRmTx60DjnDzML+Vc=;
	b=NMB2KlvzwtGV5vHmAVnZmaBIVy2Hvk4NnNJvAwbzeaFj2LlDGKQBlG5v2PaL3s1BVJ
	+U+pmu0siuibR9IdHG8hZxzu04cHBtoNR7b52MiPPdg/17rYD1ELYA9Avgcy1QCri8CV
	gkiUPx7rARVN8Ary5AKiB1yeaW/a8fthi02Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4RiuQhUNWuW4zzKNw1UiQw2ecfCRmTx60DjnDzML+Vc=;
	b=L/6kAYdvgOAYKAkpPpFdxTl4vU380/qkRMeLpZSd4MLXRV1XST+zpzEBia7LWsGIl/
	Wwf/CZLMuZEKBH595mV9NYO9Rz7Jf6J1RdJN8taRLdiCc1xMoq4l4tRRiTI4HWypV3fO
	FhXw+cqBheH6q0KIVEtXwpCrpb1Avz5ibwhR/j82ll2zRDe6PM+YfF7OANlw3b6iaGZ8
	TUz7uZi173FF6BNwTjBxZoGsBglFP6eKer3j5CHXjV9To/fZVYMD5CMF+hckoOG4hqRC
	qp/Td5FIIM0dDT8PJdyc63UI7sxV2BElXSaOnmyCarLb6V3zYWa1Ozxa5cvYfcGL5MHn
	ENgg==
X-Gm-Message-State: AOUpUlEjSBc0KnPzOmXvv6tOe5nzT0T5IIRpLZ7JDfY4E316SCKLu88W
	RwLQ+DIr5maBseab9juIh/LkoLejwbdarY3t8BNQYcdxFbuAUQ==
X-Received: by 2002:aca:b9c2:: with SMTP id
	j185-v6mr29490098oif.212.1534422038096; 
	Thu, 16 Aug 2018 05:20:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 05:20:17
	-0700 (PDT)
In-Reply-To: <20180730162458.23186-1-peter.maydell@linaro.org>
References: <20180730162458.23186-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 13:20:17 +0100
Message-ID: <CAFEAcA-O=zofLVPmH9V5JnAw-JY4aZe4dYeW1MMaAdsd9hSFXg@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/5] mps2: Implement FPGAIO
 counters and dual-timer
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
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c1G3EUqLxuYJ

Ping? Patch 2 has been reviewed but the rest are still waiting.

thanks
-- PMM

On 30 July 2018 at 17:24, Peter Maydell <peter.maydell@linaro.org> wrote:
> This patchset adds some missing timer and counter devices
> to the MPS2 boards:
>
>  * the MPS2 "fpgaio" register bank includes some registers
>    which provide various kinds of free-running counter
>  * the boards have an instance fo the CMSDK "dual timer module"
>
> Together these are sufficient for QEMU's mps2-an505
> emulation to pass the "timer test" subsection of the
> self-test program which can be found (behind a clickthrough
> EULA) in the Cortex-M33_IoT_kit_2_0.zip at:
>  https://developer.arm.com/products/system-design/development-boards/fpga-prototyping-boards/download-fpga-images
>
> The dual-timer patch ended up a bit big; I can try to split
> that up if people would prefer that for review.
>
> thanks
> -- PMM
>
> Peter Maydell (5):
>   hw/misc/mps2-fpgaio: Implement 1Hz and 100Hz counters
>   hw/misc/mps2-fpgaio: Implement PSCNTR and COUNTER
>   hw/timer/cmsdk-apb-dualtimer: Implement CMSDK dual timer module
>   hw/arm/iotkit: Wire up the dualtimer
>   hw/arm/mps2: Wire up dual-timer in mps2-an385 and mps2-an511
>
>  hw/timer/Makefile.objs                 |   1 +
>  include/hw/arm/iotkit.h                |   3 +-
>  include/hw/misc/mps2-fpgaio.h          |  10 +
>  include/hw/timer/cmsdk-apb-dualtimer.h |  72 ++++
>  hw/arm/iotkit.c                        |   8 +-
>  hw/arm/mps2.c                          |  11 +
>  hw/misc/mps2-fpgaio.c                  | 146 ++++++-
>  hw/timer/cmsdk-apb-dualtimer.c         | 515 +++++++++++++++++++++++++
>  MAINTAINERS                            |   2 +
>  default-configs/arm-softmmu.mak        |   1 +
>  hw/timer/trace-events                  |   5 +
>  11 files changed, 767 insertions(+), 7 deletions(-)
>  create mode 100644 include/hw/timer/cmsdk-apb-dualtimer.h
>  create mode 100644 hw/timer/cmsdk-apb-dualtimer.c
