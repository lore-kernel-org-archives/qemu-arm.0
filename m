Received: by 10.80.166.35 with SMTP id d32csp3156971edc;
        Tue, 25 Oct 2016 05:20:57 -0700 (PDT)
X-Received: by 10.200.57.162 with SMTP id v31mr3341957qte.36.1477398056996;
        Tue, 25 Oct 2016 05:20:56 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m123si13347239qkf.103.2016.10.25.05.20.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Oct 2016 05:20:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bz0iu-0000oP-ED
	for alex.bennee@linaro.org; Tue, 25 Oct 2016 08:20:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bz0ht-0000OY-W1
	for qemu-devel@nongnu.org; Tue, 25 Oct 2016 08:19:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bz0hp-0004j3-PZ
	for qemu-devel@nongnu.org; Tue, 25 Oct 2016 08:19:53 -0400
Received: from mail-ua0-x22c.google.com ([2607:f8b0:400c:c08::22c]:37149)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bz0hp-0004i8-Km
	for qemu-devel@nongnu.org; Tue, 25 Oct 2016 08:19:49 -0400
Received: by mail-ua0-x22c.google.com with SMTP id b35so12496137uaa.4
	for <qemu-devel@nongnu.org>; Tue, 25 Oct 2016 05:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iAZOTBu7yKjjTJczd4Ku1fjt3ZYgfcJ8aB12LlGuNzk=;
	b=cVVNNlUv3gYdBD1pvCgX9Y/pJdOCeYCze7FvxuMCEtaIJc27EfreKoTpw5y9dckl3P
	BEIoqE/cfLu96RxcsP4HJeeehWn4A7Ym57B4KEzSjv7X5v6jhNU33E4LaOF+VCMHl24e
	eRS3QMmSLFzRUxOteIPeNITKPIBLHM7iO+GVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iAZOTBu7yKjjTJczd4Ku1fjt3ZYgfcJ8aB12LlGuNzk=;
	b=dk4xG/PowRORqNLo3OzitLNqs1RY5LHTJFZCrjohVjKJ8zRtux3aa9A3niUOl55xZh
	IdE8uMr7GZWlhOX6Ch0+zz8CGH/pfffVSIAQwa6BPokzy2bXTdCnzlwjIW1ImPF8+Itt
	cwCbGiwjRmR/tBerFDVCL+BFglJ3xF/SpFk8ClvRFNdOkMneK3TMC8ZW5TOTBUZCMnzJ
	3W/vKF1AWCdgK8OfACehAW7ZTwiRejdhk7Cp6pKVRouOoZ6ViAob7fjRUU9QSx3yE3Jp
	+90j9FMu+icA6E0Ja4mIoMjCw7h7RXHdfuLcHuLiA0D54wIm7vzWFkishwHOsSqLkMM3
	hp5g==
X-Gm-Message-State: ABUngveMPCU/KJ6oltV1jBHjw9tnQGCKjFyeM8kTPIN9eOSTO3UFEuWoMbO7oANzqkYacd3NAFVFgvZkAZJcrwJL
X-Received: by 10.176.84.210 with SMTP id q18mr13514060uaa.42.1477397989019;
	Tue, 25 Oct 2016 05:19:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 25 Oct 2016 05:19:28 -0700 (PDT)
In-Reply-To: <1477378140-2670-1-git-send-email-ppandit@redhat.com>
References: <1477378140-2670-1-git-send-email-ppandit@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2016 13:19:28 +0100
Message-ID: <CAFEAcA_H7OaczsgH-Tu6X10KoerJTwtr_jf2h4Jz+Wn0b+pLSw@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22c
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] char: cadence: correct reset
 value for baud rate registers
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Qemu Developers <qemu-devel@nongnu.org>,
	Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5g3bwArbyC3Z

On 25 October 2016 at 07:49, P J P <ppandit@redhat.com> wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> The Cadence UART device emulator stores 'baud rate generator'
> and 'baud rate divider' values, used in computing speed, in two
> registers. The device specification defines their range and
> their reset value. Use their correct value when resetting the
> device in cadence_uart_reset.
>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/char/cadence_uart.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index c176446..b8d4c28 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -471,7 +471,8 @@ static void cadence_uart_reset(DeviceState *dev)
>      s->r[R_IMR] = 0;
>      s->r[R_CISR] = 0;
>      s->r[R_RTRIG] = 0x00000020;
> -    s->r[R_BRGR] = 0x0000000F;
> +    s->r[R_BRGR] = 0x0000028B;
> +    s->r[R_BDIV] = 0x0000000F;
>      s->r[R_TTRIG] = 0x00000020;
>
>      uart_rx_reset(s);
> --
> 2.7.4

I'm going to wait for a review/ack from one of the Xilinx folk
before putting this in target-arm.next.

thanks
-- PMM
