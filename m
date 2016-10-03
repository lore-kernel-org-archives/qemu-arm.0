Received: by 10.80.163.71 with SMTP id 65csp1754976edn;
        Mon, 3 Oct 2016 13:39:59 -0700 (PDT)
X-Received: by 10.55.40.144 with SMTP id o16mr23952638qko.138.1475527199199;
        Mon, 03 Oct 2016 13:39:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e95si11400103qkh.239.2016.10.03.13.39.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Oct 2016 13:39:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39075 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brA1m-0003Gs-IP
	for alex.bennee@linaro.org; Mon, 03 Oct 2016 16:39:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1brA1j-0003Gb-1j
	for qemu-arm@nongnu.org; Mon, 03 Oct 2016 16:39:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1brA1a-0002dA-4n
	for qemu-arm@nongnu.org; Mon, 03 Oct 2016 16:39:55 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:33070)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1brA1Z-0002cS-U3; Mon, 03 Oct 2016 16:39:46 -0400
Received: by mail-wm0-x242.google.com with SMTP id p138so16478669wmb.0;
	Mon, 03 Oct 2016 13:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=xkbEFjD3kj00iCAOA/dBnhJ3zpczgqtRfKbZx+k8KBM=;
	b=I+ubXrIfS70ZwBDAvnG2/mKKZvxUV/b4spaGBJwpxTCgOTBwJYHr8XjzPZOQtZzGRc
	bCS+OTD2tb46IRQUtmvzYnR2zRQGKwdP33WAmXqujDyjqAVbUPahYcXIbTZwxRNxLASz
	V16O1LE6wkkHDhNF3qMpF7A4Ecx0nuuo8hR6YtTBY+7q5GQxDOUjsbUaORvdyTQMeM5M
	T3izZUjqIbGOYe/kWYXbuLiHaNymcqJTf6e07aV7D0QRFJmUwqVfqFXfILeYEC4yLyL/
	03y/398uscggustut1lRJ5cE+SgdABhfsnc8m27huPbRF5LbbSPhROnXYzSpRrKVc3KT
	VBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=xkbEFjD3kj00iCAOA/dBnhJ3zpczgqtRfKbZx+k8KBM=;
	b=O4M48tyXP30Jv3ouCzE3l4ugflFg8drGtSnW3+9IaYUTGR43fDhrX+/xlHYjtGkozF
	QTywgRb81rmNbBUx6e//X1xuTTzJqL3j9HgPUCVHVckZnRFqVX4Gmf/l6SZw/oWl4VYI
	G3rTuTpr1UcLPcX6wUljd/EqRPEMqfzurOO96WJIt4Vc9z+htYSnlM/menE1Wzip2cSl
	IfyFJ+wd3V/T3VUuMGvz+G3N8/02fqvIitsYcyNp6OrLmPVKqZR7EU3e1drq9WjxOKtI
	a80Me84nmGPE0yAQCM7H8A1Dx9mQ5Wif/GCg7wMw1Ap3j3n4mIE2j6qOWQhnfbHp35rg
	HYJA==
X-Gm-Message-State: AA6/9RlQ0bo0+aJH0iW+HyEJlUfrd6AHwDVrEiym8vaWVW8uQ/4JgkWckQRDlk7ImdPjKw==
X-Received: by 10.28.45.14 with SMTP id t14mr410126wmt.20.1475527184896;
	Mon, 03 Oct 2016 13:39:44 -0700 (PDT)
Received: from [192.168.10.150] (94-39-176-182.adsl-ull.clienti.tiscali.it.
	[94.39.176.182]) by smtp.googlemail.com with ESMTPSA id
	137sm20711636wmi.16.2016.10.03.13.39.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Oct 2016 13:39:43 -0700 (PDT)
To: rutu.shah.26@gmail.com, qemu-devel@nongnu.org
References: <1475513785-30275-1-git-send-email-rutu.shah.26@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <59aa1348-a938-4ba8-4b1e-9ffcc09c5c29@redhat.com>
Date: Mon, 3 Oct 2016 22:39:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475513785-30275-1-git-send-email-rutu.shah.26@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
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
Cc: alistair.francis@xilinx.com, qemu-arm@nongnu.org, stefanh@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PtMOejuUF7yB



On 03/10/2016 18:56, rutu.shah.26@gmail.com wrote:
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

Hello, please place the allocated buffer in struct Stream (see
xilinx_axidma_realize) instead.  This function is a hot path, and it's
better to keep allocations outside it.

Thanks,

Paolo


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
> 
