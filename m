Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp9170449lfc;
        Fri, 29 Nov 2019 07:39:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqxrzzTAIfJWZBMmqzn6jTBMICFMIHReHUsLVCsOSVGy0xODGnNo7nzUtKsqXi/lIB9/DyBV
X-Received: by 2002:a17:906:b253:: with SMTP id ce19mr35631918ejb.61.1575041946048;
        Fri, 29 Nov 2019 07:39:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575041946; cv=none;
        d=google.com; s=arc-20160816;
        b=znjn+YNbcSn60SXhJ/fgGKsjZAyIqpjMGnf++jVOzAlMF+IBayKQUFNWdKnGfYY5DC
         /fbLcHWy5mwyRsO0zqb/dAVsXQE3Yv316PPzu6X8t55bE7nTr0xqVAP0TKCuA/osx2S4
         EVVf/fxZex9/vmXy0ei2KZXG/+/9XKJygVxUAuLhUNX3CUXQfy5F+cNQw2qa8s4W6tPq
         AaUVer+RvugT+ZAs0l1l4Rp/8PlU8pgPsPi2FEdoc7sTr2m8SILUaPOyAKnOvKmJAgvG
         sXgrQEcjPgWauNfb2XeEpdHr5gkv+9jyiO1BIRO6qkFOa2ctEVyN+/84q3+q1+WrK2ji
         TBpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dLxPmCibd/jvExQ+b8ZmycwQV2L50zWdzkVxWAZ1Lxs=;
        b=Bc2UJJwfxjFe1gcf+htozMWvwCG51VpHzKrvmS+5fCzhV6ewjjL1FRTv440nvGwjyO
         XigpgAqFSD8i1UlPgca+MTog1zaqZigyjJrn/uyzme+d71Cn/Yx2Rg/deEFTE1DJlOlG
         E20TQRHJG9DgxlSvQ+iCRgXCLyCyALjRnbMHevrdw0bYUt/rb8EnNXeYVXBJeditjy/3
         aiUm4vsI7tvxXViIEt++oIDd+Cd6c8DBRokpDl6MwnrdvbKz5OE4LkyzzBczfZkoZSw8
         O8xb93h4YNXp9AXwH4n34STGRLwjia9Z3bE5PS+DIOORcwr3nOCjRW5Z4IQomcGKqXiW
         Bm4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NGxggF2e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12si8272224edy.63.2019.11.29.07.39.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2019 07:39:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NGxggF2e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iaiMJ-0002J0-3i
	for alex.bennee@linaro.org; Fri, 29 Nov 2019 10:39:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52397)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iaiLm-0002G1-P9
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 10:38:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iaiLg-0002Pd-6d
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 10:38:26 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27230
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iaiLe-0002KS-Kt
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 10:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575041901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLxPmCibd/jvExQ+b8ZmycwQV2L50zWdzkVxWAZ1Lxs=;
 b=NGxggF2eI3pzRyfxTbPi6C4PLLuHJF7zF24asPDAz2j3ZYe3smfzriLb4bEkeaouTlYqo4
 wd+dNXAoLNgONPk/u1oT+ECLYCsDoO3DTCPCebyXTbihpMtoQguOvAj71GzZNw8CTXdYtZ
 pJwFSvP1xNRdnHGiOpZt99P7EFgTcRg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-D1_H9LCpNB6U_Q9kwBH9Jg-1; Fri, 29 Nov 2019 10:38:20 -0500
Received: by mail-wr1-f70.google.com with SMTP id b13so1618392wrx.22
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2019 07:38:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dLxPmCibd/jvExQ+b8ZmycwQV2L50zWdzkVxWAZ1Lxs=;
 b=o5wf1zIOPPWnv/oXGIc37MOhgXxL/tpUI1Kq+Mw1WvIXfKTucuzacGEe5ys3WZOJmW
 TPDvkPss1ERECaDUQdkjRGNxhM2mWYFyt5fAZszlm48qHBkGm0hIPyNX5MuC1esQRXb5
 l14qrC6jIXght+9yr3lJASB53P25OS45SkIwDoGZvpVUBVzaT+Rr+BqPlwlKsn7vVG0i
 vmCHKsRmxWwPdFNoqor0BWOpDirgiv9XMDra6hicQ0u1ZyLUt2eDr0ITJ2Dm0zrh45v+
 GShZrbvVDkS3G89Jn/A3aBJRp1JPcQWLGF0H1mxMuIax4IObrRb5V/vuQabqAr4AxZ37
 LIow==
X-Gm-Message-State: APjAAAXz2u16Wq3JIWdVxhtEiq63XLzlAOOQpBK9s9TyuwI9ACI1G3sW
 ezF/A9QeQ7miaGK147BCfdBGzvKRCAQN1893NXelcv60MzUCcdSZO6T6JgFBjIeySoGw3hXaLpK
 CpukozoxoLuHg
X-Received: by 2002:adf:a551:: with SMTP id j17mr53471054wrb.18.1575041898635; 
 Fri, 29 Nov 2019 07:38:18 -0800 (PST)
X-Received: by 2002:adf:a551:: with SMTP id j17mr53471040wrb.18.1575041898449; 
 Fri, 29 Nov 2019 07:38:18 -0800 (PST)
Received: from [192.168.1.74] (67.23.27.109.rev.sfr.net. [109.27.23.67])
 by smtp.gmail.com with ESMTPSA id h15sm28786322wrb.44.2019.11.29.07.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2019 07:38:17 -0800 (PST)
Subject: Re: [PATCH] net/imx_fec: Updating the IMX_FEC IP to support loopback
 mode.
To: bilalwasim676@gmail.com, qemu-devel@nongnu.org
References: <20191129150508.24404-1-bilalwasim676@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <afe9efde-7ac1-8607-446a-8fbf10accece@redhat.com>
Date: Fri, 29 Nov 2019 16:38:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191129150508.24404-1-bilalwasim676@gmail.com>
Content-Language: en-US
X-MC-Unique: D1_H9LCpNB6U_Q9kwBH9Jg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Jason Wang <jasowang@redhat.com>,
 aa1ronham@gmail.com, jcd@tribudubois.net, qemu-arm@nongnu.org,
 bilal_wasim@mentor.com, linux@roeck-us.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5/T8Y8Pg4JuH

Hi Bilal,

Cc'ing Jason, the maintainer of network devices.

On 11/29/19 4:05 PM, bilalwasim676@gmail.com wrote:
> From: bwasim <bilal_wasim@mentor.com>

Your git setup misses your 'user.name', you could fix it running:

   git config user.name "Bilal Wasim"

(eventually with the --global option).

The patch looks good otherwise.

Thanks!

> Loopback mode only works when specific conditions (as dictated
> by the IP guide) are met, i.e. the MII_MODE is set and the
> RMII_MODE is cleared. If not, we simply send the packet on the
> output queue (for TX to the host network). Tested by running a
> custom RTOS and TXing a ton of packets. The same packets were
> received on the RX side..
> 
> Signed-off-by: Bilal Wasim <bilal_wasim@mentor.com>
> ---
>   hw/net/imx_fec.c | 27 +++++++++++++++++++++++++--
>   1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index bd99236864..c51e7f7363 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -256,6 +256,29 @@ static const VMStateDescription vmstate_imx_eth = {
>   
>   static void imx_eth_update(IMXFECState *s);
>   
> +/*
> + * Function to check if the MAC is configured to run in loopback mode.
> + * If so, invoke the "receive" routine.
> + * Else write to the output.
> + * */
> +static void send_pkt(IMXFECState *s, uint8_t *frame, int frame_size)
> +{
> +    NetClientState *nc = qemu_get_queue(s->nic);
> +
> +    /*
> +     * Loopback or Normal mode ?
> +     * Per the FEC Manual: If loopback is enabled, the MII_MODE
> +     * should be SET and the RMII_MODE should be cleared. Loopback
> +     * will only work if this criterion is met. If not met,
> +     * we will send the frame on the output queue. */
> +    if ((s->regs[ENET_RCR] & ENET_RCR_LOOP) && (s->regs[ENET_RCR] & ENET_RCR_MII_MODE)
> +            && !(s->regs[ENET_RCR] & ENET_RCR_RMII_MODE)) {
> +        nc->info->receive(nc, frame, frame_size);
> +    } else {
> +        qemu_send_packet(nc, frame, frame_size);
> +    }
> +}
> +
>   /*
>    * The MII phy could raise a GPIO to the processor which in turn
>    * could be handled as an interrpt by the OS.
> @@ -488,7 +511,7 @@ static void imx_fec_do_tx(IMXFECState *s)
>           frame_size += len;
>           if (bd.flags & ENET_BD_L) {
>               /* Last buffer in frame.  */
> -            qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_size);
> +            send_pkt(s, (uint8_t *)&s->frame, frame_size);
>               ptr = s->frame;
>               frame_size = 0;
>               s->regs[ENET_EIR] |= ENET_INT_TXF;
> @@ -586,7 +609,7 @@ static void imx_enet_do_tx(IMXFECState *s, uint32_t index)
>               }
>               /* Last buffer in frame.  */
>   
> -            qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_size);
> +            send_pkt(s, (uint8_t *)&s->frame, frame_size);
>               ptr = s->frame;
>   
>               frame_size = 0;
> 

