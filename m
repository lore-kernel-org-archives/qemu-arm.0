Received: by 10.25.44.15 with SMTP id s15csp4113799lfs;
        Sun, 16 Jul 2017 21:11:23 -0700 (PDT)
X-Received: by 10.237.46.38 with SMTP id j35mr25302407qtd.178.1500264683666;
        Sun, 16 Jul 2017 21:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500264683; cv=none;
        d=google.com; s=arc-20160816;
        b=MveQGWgFakf9jUMfRa5hf1RpETs6ITYbCNdvkg7TuDeEe6Ww4SmOevRm//IvhK5nYf
         8HvgimPdQvVIOjC9SdXJwYglJv/+ZbiVXlb4vJjGsa3dfTspwa7rWaYKLXBEn+FRc2Tg
         BFR3/yqc5NqOP4FpyqYg+NrhdGQQoEjTuyZvn1j2vSJUXuIKzxfMIm1NN2d0cUpaI4Ix
         KlgWLOTRgD5TKfwPV6GFO7JCiJw95iVj6DvxSRKnFCXnAa3xruvmdk0K9KqJMXWkNJxG
         iG1O8tJa/oTS1sKBcHuMG3vJP12WRAlSzFbGfPryV4qLDvf/0Ntcai8xQgkc9wCDvl/y
         CCeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=9nV8ukURCGpVbHY5pa/dDw1epLBtU7GB+beQrKqJeJY=;
        b=g7I3IWexOFCH55tyAL58xe8Fi8iH8bO8ch6HXXJ8BCtqln6wDgcJAllF58iCqVpR5D
         2RTqFmOfXuWzpKjPY3fC5QI/fp1zNaEndcMtx3mwWdgzzhDn3tTD/n9X+AZ+kZsjXnNe
         S/8o8jaLrx+/VS5BG0CXw3rOyL50buSMJycOK2k3dY0TR2uxRC44VXNg/ZLuEBPo9o+6
         jxT65EB8AhmOjZ96a17zBdqnlguGL8luNxykllcQPSwFkOVRbP5oRPi1PY6fWM5La7V5
         XJ2zBax10Ce09Uw2zuluc+U0+xWW1rEB329HpjCA8sTMr9/t5tfACCbsLXNU43TbxGua
         jysQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=si2pa3TQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k65si14260941qkb.233.2017.07.16.21.11.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Jul 2017 21:11:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=si2pa3TQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47845 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dWxNQ-0004OR-Uw
	for alex.bennee@linaro.org; Mon, 17 Jul 2017 00:11:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dWxNM-0004Mt-7i
	for qemu-arm@nongnu.org; Mon, 17 Jul 2017 00:11:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dWxNH-0001Ey-AE
	for qemu-arm@nongnu.org; Mon, 17 Jul 2017 00:11:16 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:35258)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dWxNH-0001Es-5Y; Mon, 17 Jul 2017 00:11:11 -0400
Received: by mail-qk0-x243.google.com with SMTP id z22so726088qka.2;
	Sun, 16 Jul 2017 21:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9nV8ukURCGpVbHY5pa/dDw1epLBtU7GB+beQrKqJeJY=;
	b=si2pa3TQGSlv+UiB+gp+WY/SPOR6pa2l6+f5zQM5B6+jkJhbb4VZWKIS3Ufe9USyFx
	KbeYBq8HQmsbN+Fflw8DqLe8uiAuOq3kTXXbD+ZFkkcn4fiuToc4VZBUxeT+pSxqqYXN
	s5/AUCa16UND9iS4Bt/RXmoM5D/vyYoL7QQPbHHnqvUSuue/Mwis9EmjprUaLQVxXqL4
	m8vw5yxiefoH5Sf4M9dkn7hYvHE158tnK0p3xw1sSfLehLnGXRTq7Wk9my+ZyFBbAKD6
	uGHbX5dCa+In1mmd3Q18E3HWkZQGlAsE7kgEKgDL3ziQuzVd2YpsLcy+uytuQ+VEJpb3
	8cJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9nV8ukURCGpVbHY5pa/dDw1epLBtU7GB+beQrKqJeJY=;
	b=f0yPWuaQ1v1iWOJEYw2tBZl8/0KEqEVDXeTuLP2Q/vjioB240hTYSPWSAT6NSu8qrB
	lkWpvxknToVaysqMYaykZrCUPZnmCGBrO8/pMTtEiT+uzXT1pVhuwo3+nTVJ6LNfoUCG
	CcayR0r89bk2c79/3vE049e7pdPe3M6hHStPhRsybugV3xZ105Pl1J932CVp1Ea3DpSs
	XZ4DfO6wH6SZQjnReGeejZ7w+0aA/PjdKaItIfqLH9SD7lD2BoqFRQYf/x+JKtfLpEeW
	g4m3yRIYS1NO/7OBCxulSQ46A/nsXJiKcw8EdwT4bTj/JFIBjBe/YdaYG9dFWEfiIqtG
	mtrw==
X-Gm-Message-State: AIVw113xJFlGDQf8PiWUTCK2REJvY/q5YvO+E40soZv2JYcbtxKfZpJM
	wKchcSuEhPMUUluTmaw=
X-Received: by 10.55.197.83 with SMTP id p80mr25217547qki.239.1500264670510;
	Sun, 16 Jul 2017 21:11:10 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id c4sm13349615qtc.1.2017.07.16.21.11.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Jul 2017 21:11:09 -0700 (PDT)
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <20170717023824.18796-1-famz@redhat.com>
	<20170717023824.18796-7-famz@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e8dca1fa-8075-b1e7-3446-e8e8416fadae@amsat.org>
Date: Mon, 17 Jul 2017 01:11:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170717023824.18796-7-famz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 6/6] xilinx_axidma: Convert
 to DEFINE_PROP_LINK
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kj5nTv5JJuBF

On 07/16/2017 11:38 PM, Fam Zheng wrote:
> Signed-off-by: Fam Zheng <famz@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   hw/dma/xilinx_axidma.c | 16 ++++------------
>   1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index 3987b5f..9b48103 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -562,18 +562,6 @@ static void xilinx_axidma_init(Object *obj)
>       XilinxAXIDMA *s = XILINX_AXI_DMA(obj);
>       SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>   
> -    object_property_add_link(obj, "axistream-connected", TYPE_STREAM_SLAVE,
> -                             (Object **)&s->tx_data_dev,
> -                             qdev_prop_allow_set_link_before_realize,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> -                             &error_abort);
> -    object_property_add_link(obj, "axistream-control-connected",
> -                             TYPE_STREAM_SLAVE,
> -                             (Object **)&s->tx_control_dev,
> -                             qdev_prop_allow_set_link_before_realize,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> -                             &error_abort);
> -
>       object_initialize(&s->rx_data_dev, sizeof(s->rx_data_dev),
>                         TYPE_XILINX_AXI_DMA_DATA_STREAM);
>       object_initialize(&s->rx_control_dev, sizeof(s->rx_control_dev),
> @@ -593,6 +581,10 @@ static void xilinx_axidma_init(Object *obj)
>   
>   static Property axidma_properties[] = {
>       DEFINE_PROP_UINT32("freqhz", XilinxAXIDMA, freqhz, 50000000),
> +    DEFINE_PROP_LINK("axistream-connected", XilinxAXIDMA,
> +                     tx_data_dev, TYPE_STREAM_SLAVE, StreamSlave *),
> +    DEFINE_PROP_LINK("axistream-control-connected", XilinxAXIDMA,
> +                     tx_control_dev, TYPE_STREAM_SLAVE, StreamSlave *),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> 
