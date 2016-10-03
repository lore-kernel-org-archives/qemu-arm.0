Received: by 10.80.163.71 with SMTP id 65csp1665413edn;
        Mon, 3 Oct 2016 10:02:53 -0700 (PDT)
X-Received: by 10.55.44.69 with SMTP id s66mr22100514qkh.174.1475514173766;
        Mon, 03 Oct 2016 10:02:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 96si21148045qkq.258.2016.10.03.10.02.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Oct 2016 10:02:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38249 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1br6dh-0004OT-7F
	for alex.bennee@linaro.org; Mon, 03 Oct 2016 13:02:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rutu.shah.26@gmail.com>) id 1br6dc-0004MW-NC
	for qemu-arm@nongnu.org; Mon, 03 Oct 2016 13:02:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rutu.shah.26@gmail.com>) id 1br6db-0003Ug-MN
	for qemu-arm@nongnu.org; Mon, 03 Oct 2016 13:02:48 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:34012)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rutu.shah.26@gmail.com>)
	id 1br6dW-0003RM-4w; Mon, 03 Oct 2016 13:02:42 -0400
Received: by mail-wm0-x243.google.com with SMTP id b201so10484808wmb.1;
	Mon, 03 Oct 2016 10:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i4pkilKXDrTV98yzgHM24KhwY1sVHzIAaf5rNHTsvh0=;
	b=ycz+JZ6qJ4XjirFcHcgiO6cnlPJu2BNprNd49TIe7pDl8kd76qa1LKkhIn2m5D5UL7
	UW6gFMOKoT6Uc8LeTHyZhQpo0wFUiuqOJvUGL4Rh8VTKfpIktowOUe25oU1Mtzae8zDz
	qiC3B1mVTvm/5WbG3Y1nG8KAZSm+Bss8FyOvui3eu+Z15GN4CS7/p3TG4Z90J/0eHI6z
	zJ+kyzOQIkmoAXOlE9v5CBIixSjh/mlpbHSeQWWZWohKrKUhfTg9exKenjQT01UuL4qQ
	zYxxeOk353bmgXRcd6NXSwW1yLHbWilFhj2hvtfBG5HZcd69JQPgOPuF8OMXMF1KE3J6
	JebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i4pkilKXDrTV98yzgHM24KhwY1sVHzIAaf5rNHTsvh0=;
	b=JaSLEEfULE/GImJXH/FEgbuK/3wKk1NqTzxrU8IIvQDFpQPPF5WDCIuvu7k/Fr+0uI
	R9KZ95V7bE5emU+DVxV7wKJgZqFr5QZzkIug91E960nM6u6E5ZMB0KNgCvt5MscabuOI
	+fXfp2J1ZwA8wOwGXBkT+cBuAw9lzwmFfAnIMszQeqO8qcqqHc7WMTmYiAL1z7++x0SF
	4d4mw9oQm/yogokjB6HiWfpenC/GPxxoaJqtuTxZNj7N2VwEkXsz+lJpirAdNVA/wx01
	uz3CSghzlb6XtsiIT7s3kQhNVWWd6onYIce2QZQ9fyV+LlhbTUA7n5tKMRevsXK4lEW/
	50JQ==
X-Gm-Message-State: AA6/9Rla+couqMtQd3ToPoQJo7khtwbeiACaEZdb1wnm0n1P2YUi6TXknMcXsDB9GqCGxmU5Yn4mUfdN0279Dw==
X-Received: by 10.194.112.169 with SMTP id ir9mr17965737wjb.24.1475514161030; 
	Mon, 03 Oct 2016 10:02:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.64.98 with HTTP; Mon, 3 Oct 2016 10:02:40 -0700 (PDT)
In-Reply-To: <1475513785-30275-1-git-send-email-rutu.shah.26@gmail.com>
References: <1475513785-30275-1-git-send-email-rutu.shah.26@gmail.com>
From: Rutuja Shah <rutu.shah.26@gmail.com>
Date: Mon, 3 Oct 2016 22:32:40 +0530
Message-ID: <CAFE_T+QzrfgGwSkqfbL6dArsSH_dyFREM=mma1sBeokO7gpX6Q@mail.gmail.com>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-arm] [PATCH] Reducing stack frame size in
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-arm@nongnu.org,
	Rutuja Shah <rutu.shah.26@gmail.com>, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UY2DF9s+P92w

++ stefan Sorry for the typo.
Regards
Rutuja Shah


On Mon, Oct 3, 2016 at 10:26 PM,  <rutu.shah.26@gmail.com> wrote:
> From: Rutuja Shah <rutu.shah.26@gmail.com>
>
> This patch allocates memory for txbuf array on the heap rather than the stack.
> As a result, the stack frame size is reduced.
>
> Signed-off-by: Rutuja Shah <rutu.shah.26@gmail.com>
> ---
>  hw/dma/xilinx_axidma.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index b135a5f..6c63575 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -256,13 +256,14 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
>                                   StreamSlave *tx_control_dev)
>  {
>      uint32_t prev_d;
> -    unsigned char txbuf[16 * 1024];
> +    unsigned char *txbuf;
>      unsigned int txlen;
>
>      if (!stream_running(s) || stream_idle(s)) {
>          return;
>      }
>
> +    txbuf = g_malloc(16 * 1024);
>      while (1) {
>          stream_desc_load(s, s->regs[R_CURDESC]);
>
> @@ -304,6 +305,7 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
>              break;
>          }
>      }
> +    g_free(txbuf);
>  }
>
>  static size_t stream_process_s2mem(struct Stream *s, unsigned char *buf,
> --
> 1.9.1
>
