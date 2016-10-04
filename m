Received: by 10.80.163.71 with SMTP id 65csp2328298edn;
        Tue, 4 Oct 2016 13:56:35 -0700 (PDT)
X-Received: by 10.176.69.141 with SMTP id u13mr3783417uau.176.1475614595378;
        Tue, 04 Oct 2016 13:56:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e5si5032296uae.105.2016.10.04.13.56.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Oct 2016 13:56:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45243 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brWlO-0004xc-Qw
	for alex.bennee@linaro.org; Tue, 04 Oct 2016 16:56:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1brWlJ-0004wc-Qt
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 16:56:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1brWlI-0006VS-Rm
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 16:56:29 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:36048)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1brWlC-0006Tg-Vd; Tue, 04 Oct 2016 16:56:23 -0400
Received: by mail-wm0-x243.google.com with SMTP id b184so21503857wma.3;
	Tue, 04 Oct 2016 13:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=yWIxZ7gPrSDlxyx0Zy6lQToHfwRWltacYgTFoms+7FU=;
	b=Yc0BX+MaDYXDqB7ew9MWYB4nqHau5jpfSPLRzeEwdzTHrrNE3Gt3SQWgYmtb3OsuYD
	oQNHZIhswKL7BTkEFWTAgiocE/ibgNWg30mmMsJi+sfpY44XH4WVnhSzTo52DEiRs4Dm
	BvJy6WaPnVZ400z65kL6o1wv/cyDiWxd2he3U4WVyXKuXUbIBNo9Y46lub+AeXiCPLtZ
	5waO5ShuT/VQ7RsCBi2YeEyM930ZMKrferj8EUMRLkIK2rkjf2zbYGeDzPToxCkk3p9s
	t/YGJ4XBttzDLZl6hy3rWnh/Y3p6sonfEkawUDvQmpjYOICkR2YvDyDUvHBbHdlcUQEa
	p24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=yWIxZ7gPrSDlxyx0Zy6lQToHfwRWltacYgTFoms+7FU=;
	b=cInGdUFwB3rUY7fuZlCNIcRGRSYq7soShVRfJIExW0PngAxcgh6tyQcc+v9sIqCAIr
	EeWgBgDKaAMWnBdd7qF4S95swrJWzmdpgSw6Xt7XNfe8MsA1qAq3jk2HcvPu0t8KVOz8
	i3YmRvnHyxO8hdOYWy8hCH9BIf049PH9UiCvNuviMPMpU2/av3/jdnKThHoHMhxyyetZ
	sWaGc5iKUGoUTnAg21kj+Lbbay/vt8uRP4/c+XCsm1yv+6rtnYfZ2FR2FJvkPnWAo6he
	bSxF2fKwyfrCrCUOxFD2sBceLHnL3ILIPZ+UJaQzPWAeQMOGUYhL4Qy0mtSizhEGWyu2
	zm1g==
X-Gm-Message-State: AA6/9RlDKLLwkHv/5CNyhzLRyIebCILOHi88zfgeb6dg1YxAesSWtj/bmDodmWvUNpzEAQ==
X-Received: by 10.194.84.199 with SMTP id b7mr4686576wjz.147.1475614582046;
	Tue, 04 Oct 2016 13:56:22 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	w203sm25962375wmw.7.2016.10.04.13.56.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Oct 2016 13:56:20 -0700 (PDT)
Date: Tue, 4 Oct 2016 22:56:19 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: rutu.shah.26@gmail.com
Message-ID: <20161004205619.GA31579@toto>
References: <1475604703-3381-1-git-send-email-rutu.shah.26@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475604703-3381-1-git-send-email-rutu.shah.26@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-arm] [PATCHv2] Reducing stack frame size in
 stream_process_mem2s()
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
Cc: stefanha@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vIr3EP8XV8yG

On Tue, Oct 04, 2016 at 11:41:42PM +0530, rutu.shah.26@gmail.com wrote:
> From: Rutuja Shah <rutu.shah.26@gmail.com>
> 
> Hi,
> This patch allocates memory for txbuf in struct Stream rather than the stack.
> As a result, the stack frame size is reduced of stream_process_mem2s().

Hi Rutuja,

A nit-pick:
The commit message is not meant to be a converstation-like message, so
normally we don't include greetings.
The expected format is to have an empty line between the message and
the SoB line.

Here's an example:

Allocate memory for txbuf in struct Stream rather than on the stack.
As a result, the stack frame size is reduced for stream_process_mem2s().

Signed-off-by: Rutuja Shah <rutu.shah.26@gmail.com>


Other than that, this looks good to me:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> Signed-off-by: Rutuja Shah <rutu.shah.26@gmail.com>
> ---
>  hw/dma/xilinx_axidma.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index b135a5f..6065689 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -111,6 +111,7 @@ struct Stream {
>      unsigned int complete_cnt;
>      uint32_t regs[R_MAX];
>      uint8_t app[20];
> +    unsigned char txbuf[16 * 1024];
>  };
>  
>  struct XilinxAXIDMAStreamSlave {
> @@ -256,7 +257,6 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
>                                   StreamSlave *tx_control_dev)
>  {
>      uint32_t prev_d;
> -    unsigned char txbuf[16 * 1024];
>      unsigned int txlen;
>  
>      if (!stream_running(s) || stream_idle(s)) {
> @@ -277,17 +277,17 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
>          }
>  
>          txlen = s->desc.control & SDESC_CTRL_LEN_MASK;
> -        if ((txlen + s->pos) > sizeof txbuf) {
> +        if ((txlen + s->pos) > sizeof s->txbuf) {
>              hw_error("%s: too small internal txbuf! %d\n", __func__,
>                       txlen + s->pos);
>          }
>  
>          cpu_physical_memory_read(s->desc.buffer_address,
> -                                 txbuf + s->pos, txlen);
> +                                 s->txbuf + s->pos, txlen);
>          s->pos += txlen;
>  
>          if (stream_desc_eof(&s->desc)) {
> -            stream_push(tx_data_dev, txbuf, s->pos);
> +            stream_push(tx_data_dev, s->txbuf, s->pos);
>              s->pos = 0;
>              stream_complete(s);
>          }
> -- 
> 1.9.1
> 
