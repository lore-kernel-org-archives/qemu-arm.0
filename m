Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1438406lfg;
        Tue, 25 Feb 2020 01:36:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqxVqss3UzK0HqhZLVmTVofr+zTj55viowVuwb92Koftx3zty03yyKLjXY0pmoUK4atbWu/I
X-Received: by 2002:a37:4d8b:: with SMTP id a133mr54248331qkb.14.1582623406542;
        Tue, 25 Feb 2020 01:36:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582623406; cv=none;
        d=google.com; s=arc-20160816;
        b=XhzX/Rzaev3yuLKUK/uX+eh7V5u10UX0XAZfMiE7AIfzNj6Z+gXsJ/JiR4lPB0x1M5
         RxsMAoYP9ynXcZqDW0vjl6hunSDqi8Xf2D0z9AUis3UqzWZSpeglRI0nfrqIC1N71Yc/
         dp7UqJbylsHjiMFgPriALwRpWi+pJAUvVCz1NWTBjb0YTTGJwzTuNt69qfhYARWhQYLc
         6n5iA12gH3MGbSGcaNShRP35ofx2pMQOcC99lnfGwItKvt9MMIo9j8HwGXffckQnE/jX
         9givUfdvigDgE29rq7NNJv6Ods2uRgkxcpHg6vGhbW3/NJXaLQqMY1RTzIm/kdwefOgg
         vtfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=7KjT0CTZTWIUeOqi2YG+7sHvIjQlRTpL/HxX7X+vDAY=;
        b=TwuIAOC1E4kaBk1VkQH/Sq0oZqaPB7i90/eYHO7QftlaJuELBemQm46yd7aTH9Kr7u
         BYjB3xbeKeViFqGpVUG5ZfmxZRzFEvdlQjUbwDMBLEEU3SoSCLgD3Qgmrwiacj9IHg00
         tAZempSncfsNs4NSbF/sh7ipfgGyc2rngU4Wn6xVQ5+cR2VqnCk5ntrNhPpqU7cpV3TT
         /Ql9c9nggiKeJ948HUOQoGrWV27fRS+5Sr+rqnR2I5+49YiU4G7ULYpH+yAnA7LnPwlm
         QWRX/DVnTUyrGwTlp4CH1MezFE/BE1cS3fpfsjBVxVw6m+bBSPbPX1LUh/t8YwcQyJhp
         3U7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SCq2VVH1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si328824qkl.208.2020.02.25.01.36.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 01:36:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SCq2VVH1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6Wdy-000562-0K
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 04:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54643)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Wdn-00054U-QG
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 04:36:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Wdm-0005ye-EJ
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 04:36:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33397
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Wdm-0005yM-B5
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 04:36:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582623393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7KjT0CTZTWIUeOqi2YG+7sHvIjQlRTpL/HxX7X+vDAY=;
 b=SCq2VVH19ojQTLYQ1T2vRi6zuNxUb6gyAt6keAWI+OoHm/viq63FrIKiPo72Wy/mVSmNtE
 4QUhgzi/YxlK0GocKFgir5krB5ALOOxsr3RfvzNI+vsbg8tMrBxdy8B8YKY8CpiV2i8ijV
 RRvlNSeFZpOUIrW45Oo887zDJJI9H28=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-1ocV_YOfOjCd1iIqp38jnw-1; Tue, 25 Feb 2020 04:36:30 -0500
X-MC-Unique: 1ocV_YOfOjCd1iIqp38jnw-1
Received: by mail-ed1-f72.google.com with SMTP id f25so8614636eds.22
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 01:36:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7KjT0CTZTWIUeOqi2YG+7sHvIjQlRTpL/HxX7X+vDAY=;
 b=TxTjTnTv57wRuQVt7eYTmpfnFZ2Z5lEmEV44pWbHCJemEDuv+xOne2M+D8R7A+LUWT
 8bBrOQFc7ulHR//8UWns+aLoTPzoqKXPK49R9ly4Z9P7+M3P7biQH305D7Oskp4ArF6j
 WhKgVdKCE0YWrqbRNck7VrsQZt6khduGUdeCE0gOYyAXADTrzcNxNe9Izs6OmBs3oBzT
 X/9pjcLJO102O5EGWxgzQ9kaechPMgBC03lR5D1UkT0GkK8mfuSaxsIcaAe4qPWbNZFd
 gjGd5a3vkPOQaoEv0BsyMbBkpYxn0AdlI8fik1wCYXdVPHCoX2CTPq0hgkaJ8UTb0tVb
 1C1g==
X-Gm-Message-State: APjAAAUu1Y1vPPyVpvpn3BHsi5eSKYhKWxySjTqMx3t8bhD/xjQ0mUFh
 q4AzTxJoDe32mrrb35tVWf2ePEl3vHhqUUHVWstSWMTpnUu3VxmiEKVfvbrxT9k07tYbkxTi6qd
 H//oRvIrhXNUW
X-Received: by 2002:aa7:cf83:: with SMTP id z3mr49905224edx.166.1582623389081; 
 Tue, 25 Feb 2020 01:36:29 -0800 (PST)
X-Received: by 2002:aa7:cf83:: with SMTP id z3mr49905203edx.166.1582623388888; 
 Tue, 25 Feb 2020 01:36:28 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id j24sm1120838edr.57.2020.02.25.01.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 01:36:27 -0800 (PST)
Subject: Re: [PATCH 09/13] dma/xlnx-zdma: Remove redundant statement in
 zdma_write_dst()
To: kuhn.chenqun@huawei.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20200225020937.25028-1-kuhn.chenqun@huawei.com>
 <20200225020937.25028-10-kuhn.chenqun@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6d31ac16-adc6-235e-8784-51bf86e33b72@redhat.com>
Date: Tue, 25 Feb 2020 10:36:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225020937.25028-10-kuhn.chenqun@huawei.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: peter.maydell@linaro.org, Alistair Francis <alistair@alistair23.me>,
 zhang.zhanghailiang@huawei.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H7bANsUJwa8q

On 2/25/20 3:09 AM, kuhn.chenqun@huawei.com wrote:
> From: Chen Qun <kuhn.chenqun@huawei.com>
> 
> Clang static code analyzer show warning:
> hw/dma/xlnx-zdma.c:399:13: warning: Value stored to 'dst_type' is never read
>              dst_type = FIELD_EX32(s->dsc_dst.words[3], ZDMA_CH_DST_DSCR_WORD3,
>              ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> ---
>   hw/dma/xlnx-zdma.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
> index 8fb83f5b07..45355c5d59 100644
> --- a/hw/dma/xlnx-zdma.c
> +++ b/hw/dma/xlnx-zdma.c
> @@ -396,8 +396,6 @@ static void zdma_write_dst(XlnxZDMA *s, uint8_t *buf, uint32_t len)
>               zdma_load_descriptor(s, next, &s->dsc_dst);
>               dst_size = FIELD_EX32(s->dsc_dst.words[2], ZDMA_CH_DST_DSCR_WORD2,
>                                     SIZE);
> -            dst_type = FIELD_EX32(s->dsc_dst.words[3], ZDMA_CH_DST_DSCR_WORD3,
> -                                  TYPE);

Maybe move dst_type to this if() statement now?

>           }
>   
>           /* Match what hardware does by ignoring the dst_size and only using
> 

