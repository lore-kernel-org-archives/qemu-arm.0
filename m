Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1575442wro;
        Thu, 14 Mar 2019 20:54:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxetbVsk//gHCxr6bMUlU+fxqSWDLWB9TeVIv21X4Zn1o6Xf7hOc5Y8PXo9+crAiExeSxmM
X-Received: by 2002:a1c:760f:: with SMTP id r15mr557321wmc.88.1552622095256;
        Thu, 14 Mar 2019 20:54:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552622095; cv=none;
        d=google.com; s=arc-20160816;
        b=PQWfytWwLUvd9mXp/+tAP/7p/oB8IaSrhdsc5cOlY3KELmGSY6pb+Gq0M3rw/EdQSc
         Dj9mTOYV4Jorkx3OAx5p1zjzKwOedEKr0UwORQ1unCfGOsd2tHPWtnUlCCRglD3yepqK
         uvqCB/7upZNcI5o1BMIBdjuf9sSu4Hwxakfd2Q6nVKR5dR/VkK3uwP09ZwkSVTvq713t
         ZpeyNXrFkYL26iiCuu71bNfTIfFMkIeFO8gu9Le9XSzhCS3xD8G4GTdoJ/PvRGSgL3Fd
         0V4SfGDnPRbZn1uWfw5fio+9xdKONA7TAX53Nfq3MRhfuRZmFy8/N7bxuWv+jb8OzwfX
         XA+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nd+w3EvMNbsjTdI79MyfRGy7wnudiuvU8/AwNEMkZd8=;
        b=HXcLNJU989xtMLsWBhNbOZyKlweuS9bzYzcOCEZ36qnxVaWEBtJFMBBDuXNqg+QNmZ
         2q6C6433mOPEBNNvkCKQRCvHR7r3L4KxupH5FCqjR1Ssk0pnNheW9QLsWkUH+pWh6BfX
         n49ii416m6Y2APYTirCif9A8t8qSp6XhPEMPHVm7b5BoF7ZGf4IXOMn8S+OTpE5VPeix
         qEOjJMjqyqYM2XuMgvqogvse6nCePjs+gk0zSF7Afdlf+R1hEnvO6MWeUv97cwIMDJeH
         sDnZUP2je/ZzEQYKlGLy+uSnqzhU4s23QpTCHAHwWhyK4+nX3bl8xOIjd5Z4Cb9JGRz3
         vDow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="d2xAU/AM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 91si520496wrs.202.2019.03.14.20.54.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 20:54:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="d2xAU/AM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:49113 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4dvq-0004py-8r
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 23:54:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1h4dtb-00037d-GX
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 23:52:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1h4dtZ-000611-VL
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 23:52:35 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:38569)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1h4dtW-0005xe-K7; Thu, 14 Mar 2019 23:52:30 -0400
Received: by mail-qt1-x843.google.com with SMTP id s1so8681858qte.5;
	Thu, 14 Mar 2019 20:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nd+w3EvMNbsjTdI79MyfRGy7wnudiuvU8/AwNEMkZd8=;
	b=d2xAU/AMa5t5fcOJ/VCnZ4k5Sc8CwUAV5sgJmSyDUWEWuPeilK5pH+uXdcep7poEvv
	613yVd9IGz1AW1jnB/XPGe6IKRGXDYyNdI0NkuJ1Ut3adAk1lvO3CWr3O0fdNu/ioVqm
	sGdNuSVwYgM3Ay/pzWLkvQM/+JrR5xYSwOo3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nd+w3EvMNbsjTdI79MyfRGy7wnudiuvU8/AwNEMkZd8=;
	b=siYFnquG1+8eDuQoY2IpusgYcz3rboieTzqg/ktK8eeQvkO91ntOJYAP5fsLkVjOrQ
	LKU3OzVsuZ4wwuV247cT/LMBgY+KT74xQP3itZKBdpZneF04d/op/96DmkaJ9JY65Uzh
	4EfGAWXeIhqzhOC73j6nPY6/gJqKzFnPwzdVyThX+NKx2zMB4KQ83M2Gfme9RYH8wyWs
	7/VdjPRzJJhw6u8AOR9s3SUnpjOp00SW7x7I13i5RotwFc9r7w4ZsJ1DwM+fPi2R1y1g
	psXs4RibykAKguHv3UyBS3KAgrZ3g28h5WJAX/dSLsLUwdTfAOHyEhw3QtgUee62YtDA
	g5gw==
X-Gm-Message-State: APjAAAVjbf9GPVta7s3Uxs0ikZs+n2nCGrlRlvH2yPrZk7Oja/h026XW
	M5Ogx0Y7QmvU2r9joAHgAzhEkcoEzkcxZpspEuyqnBC5
X-Received: by 2002:ad4:528a:: with SMTP id v10mr953956qvr.89.1552621949652;
	Thu, 14 Mar 2019 20:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190315032629.21234-1-richard.henderson@linaro.org>
	<20190315032629.21234-18-richard.henderson@linaro.org>
In-Reply-To: <20190315032629.21234-18-richard.henderson@linaro.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 15 Mar 2019 03:52:18 +0000
Message-ID: <CACPK8Xe_vZxzMYKS8vrL7pKt0+6=PRwZ48Mzy6RW9mOVgQSJ5Q@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::843
Subject: Re: [Qemu-arm] [PATCH v3 17/23] hw/misc/nrf51_rng: Use
 qemu_guest_getrandom_nofail
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0qYFHBlKJmeF

On Fri, 15 Mar 2019 at 03:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The random number is intended for use by the guest.  As such, we should
> honor the -seed argument for reproducibility.  Use the *_nofail routine
> instead of error_abort directly.
>
> Cc: qemu-arm@nongnu.org
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/misc/nrf51_rng.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/misc/nrf51_rng.c b/hw/misc/nrf51_rng.c
> index d188f044f4..3400e90a9b 100644
> --- a/hw/misc/nrf51_rng.c
> +++ b/hw/misc/nrf51_rng.c
> @@ -14,7 +14,7 @@
>  #include "qapi/error.h"
>  #include "hw/arm/nrf51.h"
>  #include "hw/misc/nrf51_rng.h"
> -#include "crypto/random.h"
> +#include "qemu/guest-random.h"
>
>  static void update_irq(NRF51RNGState *s)
>  {
> @@ -145,7 +145,7 @@ static void nrf51_rng_timer_expire(void *opaque)
>  {
>      NRF51RNGState *s = NRF51_RNG(opaque);
>
> -    qcrypto_random_bytes(&s->value, 1, &error_abort);
> +    qemu_guest_getrandom_nofail(&s->value, 1);
>
>      s->event_valrdy = 1;
>      qemu_set_irq(s->eep_valrdy, 1);
> --
> 2.17.2
>
