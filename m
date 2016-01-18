Received: by 10.25.159.19 with SMTP id i19csp1860158lfe;
        Mon, 18 Jan 2016 03:43:05 -0800 (PST)
X-Received: by 10.140.42.20 with SMTP id b20mr30411263qga.16.1453117385867;
        Mon, 18 Jan 2016 03:43:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d82si10084568qkj.38.2016.01.18.03.43.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jan 2016 03:43:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:58917 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL8DB-0003Do-GC
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 06:43:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aL8DA-0003DY-4M
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 06:43:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aL8D9-0004fQ-7y
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 06:43:04 -0500
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:33716)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aL8D9-0004fF-40
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 06:43:03 -0500
Received: by mail-vk0-x231.google.com with SMTP id i129so191780909vkb.0
	for <qemu-arm@nongnu.org>; Mon, 18 Jan 2016 03:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=J9vBR2XOBoLBaOoyZR775zZ8rspBZvea/oHtL6E7Tak=;
	b=J/BykqFAZGR+bYe4S8HfgTRgRnigDfuE/MgJj8TicHrtlq5f/OkSCxHBxP+FG56MhI
	meHrKQbTnKwM3IRqqT9kNGLUNkCXoJOKAAzd+1a9ESjmQLtzM8OCJHaDs9U5zfzFGQ1Y
	X5FAPSjtAQm+67iTwBe1UMvv0x8jYd+LXI2mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=J9vBR2XOBoLBaOoyZR775zZ8rspBZvea/oHtL6E7Tak=;
	b=KR9624thCV8GbqQRSmrCyWpxkO034/kox8Vu1cwdRqoI1IFjZdD873qjXVSnXyDE5u
	5r4PBA+ls4fd3hRgeGgitZx9kxjF8W0J8YayEnwJAK9Nem4U5kJwmtkdxrHBsVLGsmRB
	lm7OZMwZen0+MiOP7dyS5o5Wt1BbQtxWRO5XBgNalCRt9bjjlrAAI95jq9iNLSgrnyc/
	PDNgAypX/HmoVHg4eJcXXj0EzLNnJKhMs5lKHUUxh8m7huDc84QUcNdW2hnkVuYp5gnN
	amKVJeyxOYlccYQKRd4P7T3U6UYv9kvut7u90R4YanZtzx3Q5nf1K25+LBUebxI3q63P
	L5ow==
X-Gm-Message-State: ALoCoQlcr4mTPQvSrTL9/rw8OhdSMqpYd56Z8YWgLrZkuKOYPJtRA8+YUvV7LRt7qYKgcsqF6cHNjfZHyN7UV3rGZr/5hllBaSfgRWG+XN9M0G6Efe2CtGI=
X-Received: by 10.31.131.203 with SMTP id f194mr17052776vkd.90.1453117382426; 
	Mon, 18 Jan 2016 03:43:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 18 Jan 2016 03:42:43 -0800 (PST)
In-Reply-To: <1453101737-11255-1-git-send-email-crosthwaite.peter@gmail.com>
References: <1453101737-11255-1-git-send-email-crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jan 2016 11:42:43 +0000
Message-ID: <CAFEAcA9_2nMEb-z46znkVy02uMgEmyOwa2NnStyRRhSr15FLEw@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: Re: [Qemu-arm] [PATCH] misc: zynq-xadc: Fix off-by-one
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Qsc0C1ZMTZbs

On 18 January 2016 at 07:22, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> This bounds check was off-by-one. Fix.
>
> Reported-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
>  hw/misc/zynq-xadc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/misc/zynq-xadc.c b/hw/misc/zynq-xadc.c
> index 1a32595..d160ff2 100644
> --- a/hw/misc/zynq-xadc.c
> +++ b/hw/misc/zynq-xadc.c
> @@ -220,7 +220,7 @@ static void zynq_xadc_write(void *opaque, hwaddr offset, uint64_t val,
>              break;
>          }
>
> -        if (xadc_reg > ZYNQ_XADC_NUM_ADC_REGS && xadc_cmd != CMD_NOP) {
> +        if (xadc_reg >= ZYNQ_XADC_NUM_ADC_REGS && xadc_cmd != CMD_NOP) {
>              qemu_log_mask(LOG_GUEST_ERROR, "read/write op to invalid xadc "
>                            "reg 0x%x\n", xadc_reg);
>              break;
> --
> 1.9.1



Applied to target-arm.next, thanks.

-- PMM
