Received: by 10.25.208.211 with SMTP id h202csp896497lfg;
        Fri, 11 Mar 2016 01:03:34 -0800 (PST)
X-Received: by 10.55.221.200 with SMTP id u69mr10075892qku.0.1457687014186;
        Fri, 11 Mar 2016 01:03:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a12si7749310qha.52.2016.03.11.01.03.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Mar 2016 01:03:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:53490 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aeIyr-00086R-O6
	for alex.bennee@linaro.org; Fri, 11 Mar 2016 04:03:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aeIyo-00086E-5U
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 04:03:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aeIyn-0007v5-69
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 04:03:30 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:33745)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aeIym-0007ux-TE
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 04:03:29 -0500
Received: by mail-vk0-x233.google.com with SMTP id k1so127047503vkb.0
	for <qemu-arm@nongnu.org>; Fri, 11 Mar 2016 01:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LY7CG+U9y1Uf/FHUChgS9F0HvPnYyoKXsPghD+oyjDw=;
	b=IG6mhn3r7rw5Ry5YjO9HUzWDX5YfgC1KyQvGfcwEGnVvkUZcgtxmnJ6+flNmCVL+5Z
	T7YzphJE3bcwtbUKVVnjPjUVzrg8o/5f9QV1UpEygt6Tn//jho9T3yeu8JU6474YLBPV
	BrIgB/Di7noMnKNK/HiaGrJ9xdOKC7sHREXcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LY7CG+U9y1Uf/FHUChgS9F0HvPnYyoKXsPghD+oyjDw=;
	b=KzhBO48c8Okfm2DKJ/RLLzbbi3zY+BDOT6dL68RRPAwcCk069U1Qgcfd6Pd3UdiOC7
	r4nRZ86H01IYnPdyu0cRYDC2j7T3KuaPF+Rcl7QjT3MOTlF/D9oL9pZcye46NneREv32
	FfOOM/D1HPukZHDCNtBatf39w8+GmE95HONQqtezlIwNyeNJL8nnZRezsAq9E8Cg9lcw
	gBXpjaZpKfhU6R35Fger3WLafGYH7EvPVBmKxn+h9LQQlYUsUwTZghjKP6MGkPn8VbQO
	+lj8lHdn6Tv9VKxkkYpRTfgrfw4f8Z8IXC5cWsTXes7R1i2wbVxZ76u2wzZEbxT6A5/f
	sduA==
X-Gm-Message-State: AD7BkJJPpCDj+Um9uekv1Zu/cdyh1OZJyZZYnPrWRCoG1Gq0tnmEnqRjRR9rk1r8E1opoPpsWVDETvWhY6wI1bsw
X-Received: by 10.31.8.210 with SMTP id 201mr8553015vki.90.1457687008179; Fri,
	11 Mar 2016 01:03:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Fri, 11 Mar 2016 01:03:08 -0800 (PST)
In-Reply-To: <1457152177-19550-3-git-send-email-andrew@aj.id.au>
References: <1457152177-19550-1-git-send-email-andrew@aj.id.au>
	<1457152177-19550-3-git-send-email-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Mar 2016 16:03:08 +0700
Message-ID: <CAFEAcA-sdB7cb=APLcFYKtDyfGjsk-3zYZq_=-9bRQ+s1JscEQ@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v3 2/3] hw/intc: Add (new) ASPEED VIC device
	model
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
X-TUID: sRFEjDdIAzwm

On 5 March 2016 at 11:29, Andrew Jeffery <andrew@aj.id.au> wrote:
> Implement a basic ASPEED VIC device model, enough to boot a Linux kernel
> configured with aspeed_defconfig. The model implements the 'new'
> (revised) register set and while the hardware exposes both the new and
> legacy register sets, accesses to the legacy register set will not
> be serviced (though the access will be logged).
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

> +static void aspeed_vic_write(void *opaque, hwaddr offset, uint64_t data,
> +                             unsigned size)
> +{
> +    const bool high = !!(offset & 0x4);
> +    hwaddr n_offset = (offset & ~0x4);
> +    AspeedVICState *s = (AspeedVICState *)opaque;
> +
> +    if (offset < AVIC_NEW_BASE_OFFSET) {
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s: Ignoring write to legacy registers at 0x%"
> +                      HWADDR_PRIx "[%u] <- 0x%" PRIx64 "\n", __func__, offset,
> +                      size, data);
> +        return;
> +    }
> +
> +    n_offset -= AVIC_NEW_BASE_OFFSET;
> +    trace_aspeed_vic_write(offset, size, data);
> +
> +    /* Given we have members using separate enable/clear registers, deposit64()
> +     * isn't quite the tool for the job. Instead, relocate the incoming bits to
> +     * the required bit offset based on the provided access address
> +     */
> +    if (high) {
> +        data &= AVIC_H_MASK;
> +        data <<= 32;
> +    } else {
> +        data &= AVIC_L_MASK;
> +    }
> +
> +    switch (n_offset) {
> +    case 0x18: /* Interrupt Selection */
> +        /* Register has deposit64() semantics - overwrite requested 32 bits */
> +        if (high) {
> +            s->select &= AVIC_L_MASK;
> +        } else {
> +            s->select &= ((uint64_t) AVIC_H_MASK) << 32;
> +        }
> +        s->select |= data;
> +        break;
> +    case 0x20: /* Interrupt Enable */
> +        s->enable |= data;
> +        break;
> +    case 0x28: /* Interrupt Enable Clear */
> +        s->enable &= ~data;
> +        break;
> +    case 0x30: /* Software Interrupt */
> +        qemu_log_mask(LOG_UNIMP, "%s: Software interrupts unavailable. "
> +                "IRQs requested: 0x%016" PRIx64 "\n", __func__, data);
> +        break;
> +    case 0x38: /* Software Interrupt Clear */
> +        qemu_log_mask(LOG_UNIMP, "%s: Software interrupts unavailable. "
> +                "IRQs to be cleared: 0x%016" PRIx64 "\n", __func__, data);
> +        break;
> +    case 0x50: /* Interrupt Event */
> +        /* Register has deposit64() semantics - overwrite the top four valid
> +         * IRQ bits, as only the top four IRQs (GPIOs) can change their event
> +         * type */
> +        g_assert(high);

Don't assert on conditions that can be triggered by a guest.

> +        s->event &= ~AVIC_EVENT_W_MASK;
> +        s->event |= (data & AVIC_EVENT_W_MASK);
> +        break;
> +    case 0x58: /* Edge Triggered Interrupt Clear */
> +        s->raw &= ~(data & ~s->sense);
> +        break;
> +    case 0x00: /* IRQ Status */
> +    case 0x08: /* FIQ Status */
> +    case 0x10: /* Raw Interrupt Status */
> +    case 0x40: /* Interrupt Sensitivity */
> +    case 0x48: /* Interrupt Both Edge Trigger Control */
> +    case 0x60: /* Edge Triggered Interrupt Status */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Write of read-only register with offset 0x%"
> +                      HWADDR_PRIx "\n", __func__, offset);
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Bad register at offset 0x%" HWADDR_PRIx "\n",
> +                      __func__, offset);
> +        break;
> +    }
> +    aspeed_vic_update(s);
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
