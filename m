Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3494962lfp;
        Mon, 27 Jan 2020 00:30:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqwfWaPOM5jfuz53mqzZveW6swavl2ppZQQTq1QyJzV+qqSsNJhM0vmazvhU0+6HVk7v3t5S
X-Received: by 2002:a0c:ab13:: with SMTP id h19mr15274732qvb.243.1580113815929;
        Mon, 27 Jan 2020 00:30:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580113815; cv=none;
        d=google.com; s=arc-20160816;
        b=uxdsSMeNjSdoPLLXfVmTQqY2UiH7DoxS6Ewz2IN12HSPaiCUvv1Kyek6+dwFJcDIMN
         XFNSDfHWGu53fYebWcwqyGSiSoRL/SWojJo/Sqk7aqeOlgubPefBYCv006YAiMCGETxr
         rFpqxKLKjq/7MSD5qcrAYK0nOi9Ex3oAngITrPy6h6+sL3awjMCBNhm+xvAdpbL8X8Ay
         eZfv4xZRuWAXkg8E56Wh+bnUR0tQO2GXQNg4rzSV6FzuAEXbcDRTTf5DlwbJk6qPHkDV
         j4wxlQ89okgnz+4oxB+C11ZH0kRkcXWdEcDtJv9Sr84toko2oDQC43Syelwkb66TQPmQ
         I2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=aDFiPwB3g7qXtkl/qjLNFZ6iknAFbfpVNydSC/I8930=;
        b=OFkSm1RVuo2W+x0XycVgCCo/zBsO7g95iPZFz1C7Q5eHyy6Myxj3uSsFVsY3ieE7R0
         Ovs/hKMIXitIW1BD2ANuKMc0VwVZ9nkXMnhDjW3F51SNgU/T3ebS7D4silbFi8SmrD5j
         +GINdLJ+L3R4/mhOAvwn9Sv2dZ4Cyi5TmziyW0Ef+PDnffPXu7eREfjpYtEGYxiR5hJ1
         0+zOMHPOkeem7C6zWo1wTTYtHYx7sJSDYMLEYizy0sM+lmFmRsmecdyFNAWHg1QV+1w2
         lM9tNusbR9S3Td2PrXUJFFun0VCc8WXoPDsH+NsxauBccwoTQmE9y1Ug/2wQN7FDkBsO
         44uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bF4Tv2SH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si1319066qvu.99.2020.01.27.00.30.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2020 00:30:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bF4Tv2SH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ivzmh-0003bz-CN
	for alex.bennee@linaro.org; Mon, 27 Jan 2020 03:30:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49042)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ivzmY-0003bD-El
 for qemu-arm@nongnu.org; Mon, 27 Jan 2020 03:30:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ivzmX-0002IQ-6L
 for qemu-arm@nongnu.org; Mon, 27 Jan 2020 03:30:06 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56524
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ivzmX-0002H6-33
 for qemu-arm@nongnu.org; Mon, 27 Jan 2020 03:30:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580113804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aDFiPwB3g7qXtkl/qjLNFZ6iknAFbfpVNydSC/I8930=;
 b=bF4Tv2SHCdC46YFZXtjmY9C0t9XuvIYrkZ8jGQE3+qeETjs7Y5dUI0BnkqmsxokubHpJzQ
 3msPQa2X0KgEjrpJPY0RubHPMutA+bDtPpDbqt6Prm6CFbU+y+n141eHGQ6LgKLnqN/UHJ
 xKhlMPhoaS9/39yFSODF+yrUmVhWTxU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-7fgfilUaPjenhAZ3btdiiw-1; Mon, 27 Jan 2020 03:30:03 -0500
Received: by mail-wr1-f71.google.com with SMTP id y7so5758242wrm.3
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2020 00:30:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aDFiPwB3g7qXtkl/qjLNFZ6iknAFbfpVNydSC/I8930=;
 b=PYgf7nJ6WmTwiZwZfP1wkvFrFuk5vzCARZsyKECxc1yWHhTNXgn4Iakg3DK8RRQDYA
 N1hePJ5BdhU6RSXMz538xmWQjZz8dKAhZ4FJmhxWgRIrfuTnPryp6t0FRy/CE1BW6zkB
 s0HiNJyk91eFJ8OdyxziLqzbMDGnCU5qtCjzq9WpUIA8qQEDzzmu38pe+TxbkqXd21zf
 FvoPhy6kwoVkKCfzUZsLwhcctgtU6+AeuozbSIsUNZrcIHkFk4Bm7nFU9AaT++2prxMu
 Mgs7Xs8eIItNXZ3sYRhJfXO2o4+LNPo2lnLBplXKg25bVkUHr3PUxHSnrY+N/XWnLgPf
 TvAA==
X-Gm-Message-State: APjAAAXRa8oqFyu5N7OIL+fCHxIGwSbiDmV/wGOlWBOwoujP4UXzszyt
 Wtx85vcV7tYaHGhfLdPK25HjQXMiwamuKJ3icjUrueOozCdmai8afMw2hFumpDLmqEvJdXlVhkv
 t6jaHieBfUwut
X-Received: by 2002:adf:f18b:: with SMTP id h11mr21619830wro.56.1580113801293; 
 Mon, 27 Jan 2020 00:30:01 -0800 (PST)
X-Received: by 2002:adf:f18b:: with SMTP id h11mr21619807wro.56.1580113801065; 
 Mon, 27 Jan 2020 00:30:01 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id q6sm21437416wrx.72.2020.01.27.00.30.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2020 00:30:00 -0800 (PST)
Subject: Re: [PATCH] bcm2835_dma: Fix TD mode
To: Rene Stange <rsta2@o2online.de>, qemu-devel@nongnu.org
References: <5099495.CBsx362VbF@desktop2>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9d885f77-0bb2-2ab6-cf46-400a0bc2deb8@redhat.com>
Date: Mon, 27 Jan 2020 09:29:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <5099495.CBsx362VbF@desktop2>
Content-Language: en-US
X-MC-Unique: 7fgfilUaPjenhAZ3btdiiw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X043R4IAyBd3

Hi Rene,

On 1/24/20 6:55 PM, Rene Stange wrote:
> TD (two dimensions) DMA mode did not work, because the xlen variable has
> not been re-initialized before each additional ylen run through in
> bcm2835_dma_update(). Furthermore ylen has to be increased by one after
> reading it from the TXFR_LEN register, because a value of zero has to
> result in one run through of the ylen loop. Both issues have been fixed.

What were you running, how can we reproduce?

> 
> Signed-off-by: Rene Stange <rsta2@o2online.de>
> ---
>   hw/dma/bcm2835_dma.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
> index 1e458d7fba..0881c9506e 100644
> --- a/hw/dma/bcm2835_dma.c
> +++ b/hw/dma/bcm2835_dma.c
> @@ -54,7 +54,7 @@
>   static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
>   {
>       BCM2835DMAChan *ch = &s->chan[c];
> -    uint32_t data, xlen, ylen;
> +    uint32_t data, xlen, xlen_td, ylen;
>       int16_t dst_stride, src_stride;
>   
>       if (!(s->enable & (1 << c))) {
> @@ -72,13 +72,13 @@ static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
>   
>           if (ch->ti & BCM2708_DMA_TDMODE) {
>               /* 2D transfer mode */
> -            ylen = (ch->txfr_len >> 16) & 0x3fff;
> -            xlen = ch->txfr_len & 0xffff;
> +            ylen = ((ch->txfr_len >> 16) & 0x3fff) + 1;
> +            xlen_td = xlen = ch->txfr_len & 0xffff;
>               dst_stride = ch->stride >> 16;
>               src_stride = ch->stride & 0xffff;
>           } else {
>               ylen = 1;
> -            xlen = ch->txfr_len;
> +            xlen_td = xlen = ch->txfr_len;
>               dst_stride = 0;
>               src_stride = 0;
>           }
> @@ -117,6 +117,7 @@ static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
>               if (--ylen != 0) {
>                   ch->source_ad += src_stride;
>                   ch->dest_ad += dst_stride;
> +                xlen = xlen_td;
>               }
>           }
>           ch->cs |= BCM2708_DMA_END;
> 

