Received: by 10.25.0.147 with SMTP id 141csp1289275lfa;
        Mon, 6 Mar 2017 01:45:21 -0800 (PST)
X-Received: by 10.200.1.206 with SMTP id b14mr14536877qtg.285.1488793520924;
        Mon, 06 Mar 2017 01:45:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z21si13993250qtz.221.2017.03.06.01.45.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Mar 2017 01:45:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42650 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ckpCg-0008V4-7M
	for alex.bennee@linaro.org; Mon, 06 Mar 2017 04:45:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ckpCa-0008T5-HO
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 04:45:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ckpCZ-0002iJ-Bd
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 04:45:12 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:34727)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ckpCZ-0002hb-5n
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 04:45:11 -0500
Received: by mail-wm0-x233.google.com with SMTP id 196so17177049wmm.1
	for <qemu-arm@nongnu.org>; Mon, 06 Mar 2017 01:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Yn+j+6qmmkq525XPZ1tzAoxMthbx3seK8HsQrkKjnyg=;
	b=TCdckQxf+PkkptFofiGbCTkTt5mlXG1UTcj84T/aUjXA5dqfHgKEK+SYm5kwwW35jR
	ujEuRCkxA2dp3MuQmbL9NhvYK8ljend/h0n8gPT6Q/IPoOKiPteef5mvTvmg5u4wHrj/
	mfzqnAXdRAZhldYJ6xIhb3lYdRv/sWOSzbJQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Yn+j+6qmmkq525XPZ1tzAoxMthbx3seK8HsQrkKjnyg=;
	b=fDLYU7Q7eSYlC6ebDD4SUd3/aic2mMAyAtU3dktaoEmhfPhe8wJ4SkPYU9wFtO6p+a
	Vd5inrzjjGg8KlGTZ4sFmS9I1eVJ+Zw2ikFvXg3rvbTaIpLst8547uJp2QhWkw9S4r0d
	dtitGht6wJEoSgjjl0tSilXfjPnXH0MZB0IiwEcj8Su0U4osHlIA7/rwEpUvz0gTQMj8
	PQJvgfLKBPmOvWTW2MSXnc+hov3+m5ZxDDlKB6GRkPPBtRy5tn5FmWbB4FDReTAu1pU8
	m7ldZwNWVzbO8YoypdddXY9gFVTZNHrMijZTSEjZmx0kp/JOka9W+F+n+FLte+gMcSUm
	+MpA==
X-Gm-Message-State: AMke39lGETBc9XlEnSfvyV7YSV/JBgkL+9KuMKqfIixZLhZqCfkanqAb19Jobl1s2bfQ71jrEsFChTbO/0DGa7t7
X-Received: by 10.28.4.10 with SMTP id 10mr13518278wme.142.1488793509979; Mon,
	06 Mar 2017 01:45:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Mon, 6 Mar 2017 01:44:49 -0800 (PST)
In-Reply-To: <20170305214857.9510-2-krzk@kernel.org>
References: <20170305214857.9510-1-krzk@kernel.org>
	<20170305214857.9510-2-krzk@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2017 09:44:49 +0000
Message-ID: <CAFEAcA-09S5LtTLA6iMf9qYaJvxT2qW=LiTBqnRtUMDy+9BSiA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-arm] [PATCH 2/3] hw/arm/exynos4210: Constify data pointed
 by few arguments and variables
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ya4/uYeJKpS1

On 5 March 2017 at 21:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> In few places the function arguments and local variables are not
> modifying data passed through pointers so this can be made const for
> code safeness.  Also the static array exynos4210_uart_regs is not being
> modified.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  hw/char/exynos4210_uart.c     | 10 +++++-----
>  hw/intc/exynos4210_combiner.c |  2 +-
>  hw/intc/exynos4210_gic.c      |  8 ++++----
>  hw/misc/exynos4210_pmu.c      |  2 +-
>  4 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
> index b75f28d473bf..83e1be253255 100644
> --- a/hw/char/exynos4210_uart.c
> +++ b/hw/char/exynos4210_uart.c
> @@ -102,7 +102,7 @@ typedef struct Exynos4210UartReg {
>      uint32_t            reset_value;
>  } Exynos4210UartReg;
>
> -static Exynos4210UartReg exynos4210_uart_regs[] = {
> +static const Exynos4210UartReg exynos4210_uart_regs[] = {
>      {"ULCON",    ULCON,    0x00000000},
>      {"UCON",     UCON,     0x00003000},
>      {"UFCON",    UFCON,    0x00000000},
> @@ -220,7 +220,7 @@ static uint8_t fifo_retrieve(Exynos4210UartFIFO *q)
>      return  ret;
>  }

Constifying this sort of thing is OK...

> -static int fifo_elements_number(Exynos4210UartFIFO *q)
> +static int fifo_elements_number(const Exynos4210UartFIFO *q)
>  {
>      if (q->sp < q->rp) {
>          return q->size - q->rp + q->sp;
> @@ -229,7 +229,7 @@ static int fifo_elements_number(Exynos4210UartFIFO *q)
>      return q->sp - q->rp;
>  }
>
> -static int fifo_empty_elements_number(Exynos4210UartFIFO *q)
> +static int fifo_empty_elements_number(const Exynos4210UartFIFO *q)
>  {
>      return q->size - fifo_elements_number(q);
>  }
> @@ -245,7 +245,7 @@ static void fifo_reset(Exynos4210UartFIFO *q)
>      q->rp = 0;
>  }
>
> -static uint32_t exynos4210_uart_Tx_FIFO_trigger_level(Exynos4210UartState *s)
> +static uint32_t exynos4210_uart_Tx_FIFO_trigger_level(const Exynos4210UartState *s)
>  {
>      uint32_t level = 0;
>      uint32_t reg;

...but I disagree here somewhat...

> @@ -488,7 +488,7 @@ static const MemoryRegionOps exynos4210_uart_ops = {
>
>  static int exynos4210_uart_can_receive(void *opaque)
>  {
> -    Exynos4210UartState *s = (Exynos4210UartState *)opaque;
> +    const Exynos4210UartState *s = (Exynos4210UartState *)opaque;

...and definitely here.

These are effectively method implementations for QEMU objects,
and defining the "this" pointer as const in some methods
because it happens not to be modifying things just makes
the code look out of line with every other method implementation
in the code base (and means somebody will have to drop the 'const'
again at some point if the method needs to be updated to
modify state in the future).

thanks
-- PMM
