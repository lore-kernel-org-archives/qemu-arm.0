Received: by 10.80.166.35 with SMTP id d32csp896868edc;
        Tue, 18 Oct 2016 02:50:36 -0700 (PDT)
X-Received: by 10.55.17.155 with SMTP id 27mr1518106qkr.10.1476784236309;
        Tue, 18 Oct 2016 02:50:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c12si20389607qkh.323.2016.10.18.02.50.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 02:50:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwR2Z-0006CB-Bp
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 05:50:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bwR2S-0006C4-3y
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 05:50:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bwR2R-0005qR-80
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 05:50:28 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:36260)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bwR2R-0005qL-1c
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 05:50:27 -0400
Received: by mail-vk0-x234.google.com with SMTP id 2so210532014vkb.3
	for <qemu-arm@nongnu.org>; Tue, 18 Oct 2016 02:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=liB1aHy21JQIMqccENa7NJYtDpYriR8u71ZI43IrNCM=;
	b=cxsNIFyf4kAs3Zt6cNqeXTU5thybQgauNZ5bhgJT1sQCVtecvLMeceYRQOeHstB5NN
	S7KeJNYJ3aTR2BKtb6uS/FXQKCETQPX4FAEW+bb0S4ZNgw+wNxcpvati/6FDVWSx4CO+
	lOeNClaq5OHIW28Cv1i+X3up+yIx5Qwq2LbSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=liB1aHy21JQIMqccENa7NJYtDpYriR8u71ZI43IrNCM=;
	b=L8mNGnHr5EHUQnXQVoLFVFSOyle6w5dd9/ZSrANeDnsqlZmonpzsv9bFS8xPCe4yoG
	PqxvqXZRQ7hjEBPKjE+JqfzyekDTbY++1568jr7CbURovZmju+dzThZef/NOTYqQI5yN
	VUiK2jsggtuvO5NTEgH/MUYgeGXHdmik3LJk8P5mR1y0VnGXfBB3zE0Gep1UkMdX92AC
	k/5ofncfUlga/CU9RnX/9FOmlGF4lsI/PPqiW9xbwd/y/mGmuRZCwKzCgOT8BA+g5dAH
	00zY2zzbBCrHSPxLBHwf08Bl2ipk8BMORralESo4eNv+PVN7N5Yg9sCSkRKA8UTqiH1K
	IOxg==
X-Gm-Message-State: AA6/9RkEEbVu1iufOY79RjwwF1xgc6OWBEmJW2OxqLVCZpK4WqgMc415kF1mmIwWsMLVNAio9osiSM4sZrxSLapu
X-Received: by 10.31.206.198 with SMTP id e189mr1282800vkg.51.1476784225859;
	Tue, 18 Oct 2016 02:50:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 18 Oct 2016 02:50:05 -0700 (PDT)
In-Reply-To: <1476784025-27293-1-git-send-email-ppandit@redhat.com>
References: <1476784025-27293-1-git-send-email-ppandit@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Oct 2016 10:50:05 +0100
Message-ID: <CAFEAcA8hkSJa5rVpNrL1D7w_U-1EKSf-t2G5jKzxceXL2rqRdg@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-arm] [PATCH] char: cadence: check divider against baud
 rate
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
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Huawei PSIRT <psirt@huawei.com>,
	Qemu Developers <qemu-devel@nongnu.org>,
	Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hIECYF54gCbM

On 18 October 2016 at 10:47, P J P <ppandit@redhat.com> wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> The Cadence UART device emulator calculates speed by dividing the
> baud rate by a divider. If this divider was to be zero or if baud
> rate was to be lesser than the divider, it could lead to a divide
> by zero error. Add check to avoid it.
>
> Reported-by: Huawei PSIRT <psirt@huawei.com>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/char/cadence_uart.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index e3bc52f..b18dd7f 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -170,6 +170,10 @@ static void uart_parameters_setup(CadenceUARTState *s)
>      baud_rate = (s->r[R_MR] & UART_MR_CLKS) ?
>              UART_INPUT_CLK / 8 : UART_INPUT_CLK;
>
> +    if (!s->r[R_BRGR] || !(s->r[R_BDIV] + 1)
> +        || baud_rate < (s->r[R_BRGR] * (s->r[R_BDIV] + 1))) {
> +        return;
> +    }
>      ssp.speed = baud_rate / (s->r[R_BRGR] * (s->r[R_BDIV] + 1));
>      packet_size = 1;

It seems really unlikely that early return here is the correct thing, since
it will result in our not correctly setting a bunch of the other
stuff done later in this function that's unrelated to baud rate.
What does the datasheet for this UART specify for this situation?

thanks
-- PMM
