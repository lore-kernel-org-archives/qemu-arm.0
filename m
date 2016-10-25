Received: by 10.80.166.35 with SMTP id d32csp3324024edc;
        Tue, 25 Oct 2016 10:56:14 -0700 (PDT)
X-Received: by 10.31.13.133 with SMTP id 127mr16822797vkn.132.1477418174346;
        Tue, 25 Oct 2016 10:56:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 91si8267992uar.218.2016.10.25.10.56.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Oct 2016 10:56:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57196 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bz5xN-0002if-OS
	for alex.bennee@linaro.org; Tue, 25 Oct 2016 13:56:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bz5wn-0002Ig-Vf
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 13:55:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bz5wm-0002Id-OD
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 13:55:38 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:37733)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bz5wm-0002IQ-B8
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 13:55:36 -0400
Received: by mail-vk0-x230.google.com with SMTP id h7so14135993vkf.4
	for <qemu-arm@nongnu.org>; Tue, 25 Oct 2016 10:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0HfBONHzQkDgLWNHdJV6SqHMLoVMsRA4xX8qlMVUcjA=;
	b=M0pFmoldVz+NdHPKHrAzlpl2KULKrj652xPT3b87D3DsibtUKR+4qDeVg3MtHn3LXD
	WHyqAMWmtzvnNdiY0/HFR3jlW0Z8ygQdwr3yj7JWX5Y5YiNnxVZ4kn0+q1NQ77YiRRHU
	bq1LqTYn1R4uLblhdvRvvj02pHjQDK2p7hk74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0HfBONHzQkDgLWNHdJV6SqHMLoVMsRA4xX8qlMVUcjA=;
	b=T0F4tastV0dtBl4ilf13lT0lzIHi3pJ9EvQDD86q5csvMoqU/mC2MHorfhIsRMLMNh
	u3dziIRMWHurbFP984rpA1p9+1Zp0HAEzyzhZ9y97kD52JoX+Ue0mjdwouj7pjny5g94
	nNl2sM/7W00k5B+I3VtEI52hysU8HeNoWsnKfjz46262gKw3mnqic9Au+JUGzyF45dX+
	fGaEqRKnKqNYQM1aCi0TkxDb3EL4A5Z3KpNIc+8abX+FR9/dQ3XE0bPjt4xYt3bwJcMA
	qaNzKXXR5rhzfThznfwOHStMgjYxl8D1A2dyEm/f+4lshtP2TXbeGbE6qoh61x2a/5RQ
	F2qg==
X-Gm-Message-State: ABUngvcIELAJdtatBh08Bk1om78X1MKNFhLMYzawF6Yh7xqR+4i4BWfmD1yWGucMB2v3GeR1SdJEQ5xB3qR8Ry3X
X-Received: by 10.31.165.74 with SMTP id o71mr16349297vke.95.1477418135607;
	Tue, 25 Oct 2016 10:55:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 25 Oct 2016 10:55:15 -0700 (PDT)
In-Reply-To: <1477315364-15134-1-git-send-email-ppandit@redhat.com>
References: <1477315364-15134-1-git-send-email-ppandit@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2016 18:55:15 +0100
Message-ID: <CAFEAcA-oy2z_q=vC60u_KLCPB8w9Dky5K=_aRbLNWb-sPux=ew@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] [PATCH v2] char: cadence: check baud rate generator
 and divider values
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
	Qemu Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Huawei PSIRT <psirt@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BhabtBPtPxrl

On 24 October 2016 at 14:22, P J P <ppandit@redhat.com> wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> The Cadence UART device emulator calculates speed by dividing the
> baud rate by a 'baud rate generator' & 'baud rate divider' value.
> The device specification defines these register values to be
> non-zero and within certain limits. Add checks for these limits
> to avoid errors like divide by zero.
>
> Reported-by: Huawei PSIRT <psirt@huawei.com>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/char/cadence_uart.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> Update: set register values as per the specification
>   -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg04931.html
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index e3bc52f..c176446 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -1,5 +1,6 @@
>  /*
>   * Device model for Cadence UART
> + *  -> http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf
>   *
>   * Copyright (c) 2010 Xilinx Inc.
>   * Copyright (c) 2012 Peter A.G. Crosthwaite (peter.crosthwaite@petalogix.com)
> @@ -410,6 +411,18 @@ static void uart_write(void *opaque, hwaddr offset,
>              break;
>          }
>          break;
> +    case R_BRGR: /* Baud rate generator */
> +        s->r[offset] = 0x028B; /* default reset value */
> +        if (value >= 0x01 && value <= 0xFFFF) {
> +            s->r[offset] = value;
> +        }

Appendix B says that setting this to 0 has a meaning
("disables baud_sample"), though it's less clear what exactly
that ought to do (stop the UART working completely??). It
also says that bits 31:16 are ro, so you should be doing
a value &= 0xffff; rather than doing an upper bounds check.

> +        break;
> +    case R_BDIV:    /* Baud rate divider */
> +        s->r[offset] = 0x0F;
> +        if (value >= 0x04 && value <= 0xFF) {
> +            s->r[offset] = value;
> +        }

Appendix B says:
8 bit register, so mask value with 0xff.
Values 0 to 3 are "ignored", which is slightly surprising
hardware behaviour but I guess we take them at their word
and ignore the write...

> +        break;
>      default:
>          s->r[offset] = value;
>      }

If you're taking the approach of ensuring that the register
values are within bounds in order to avoid crashes, then
you also need to check after a migration state load.

thanks
-- PMM
