Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp958373ejc;
        Fri, 26 Jan 2024 07:48:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbvz1QXoRfx0HIf4qIJMuzruHaYIPYw/+RjO3rFl+Lm+h6ICg/+CdSPEtRw98RrBieoaC0
X-Received: by 2002:a05:622a:1347:b0:42a:72f9:e7e2 with SMTP id w7-20020a05622a134700b0042a72f9e7e2mr22102qtk.58.1706284118778;
        Fri, 26 Jan 2024 07:48:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706284118; cv=none;
        d=google.com; s=arc-20160816;
        b=BxYRpa+tG5pFC9D0I0UuRWgIfNNDjmtSur0sV6Y7Ute0+qfvLAY3SLi6RAR6Dzmwzn
         SWLwcJJOePZ1nj3Ux699xPNkQLHzlj2YrKqSfeilPZcZhuAYO3DCKgRnGtDmqBYpcTmn
         WmIkay1QyHi0P0sNZ1tMdcLjLoOzvdQx+GX4AMHDvWXTlMAlKcVgknYlK3F4NP8XtRe1
         OGdYyDkSgrda87uhtRp18c1TSVvShCP0IQn1GThg4sIHvpaQrPvvWHK44KQ+YlNDe7ln
         6L1W3w07dtN1bP8LQpE4yaiOSdHOOfsMB84G8zUPXyGa+RttqhqpvSQ5ysdKOdzErQJB
         zKiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=acPOsyveWHQ8a/iWNOcBVxzaDethCk84WFQfb8l/wQc=;
        fh=lXQDabDPvqO1E+4aeEMC8njSkwAARD3RTdy6r+bzDvM=;
        b=DS8s2yQ3CG5gLTJUkwaWWmPHQNqwFSQLjmaPZgQjk3tC90T+QaIq56SLxmjwfo1xUP
         a8K2CMUfk9JtVOknitFb3Odh/XY1JpzgCNtiXS+Zu5B8P5TU7upa/pgquBgpN3Xbytl1
         pIVltmD6oDiubMAxpPqbWEKDKyES4WDfjT9PqxnCfJIXQu6q+vjqV3/NA6tYze2/HiZQ
         QiHEWRnAYBbFpS4+ZDyxcm99hawTwwSwj/zAP+PVIAu83+zfYiMvrUCxHHKgucIahppN
         ko41bcNfxwDG3WHkiC3BoTpjdscAzc7XFbYBGp8eom2U4Rr3mkV+Xm0wJKwboo1DpPhh
         1LtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Te9MxGSW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o19-20020a05622a045300b0042a7ac6a76fsi1458120qtx.53.2024.01.26.07.48.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 07:48:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Te9MxGSW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTORT-0003pI-Dl; Fri, 26 Jan 2024 10:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTORP-0003oh-1f
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 10:48:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTORN-0001Pk-Ff
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 10:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706284104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=acPOsyveWHQ8a/iWNOcBVxzaDethCk84WFQfb8l/wQc=;
 b=Te9MxGSWyhKa7ZJq9/Y9AX7ikpiDM4govnQOvZG23h8ETPPJUOCScA+8oizclSq6mvwcjQ
 3tLl6EOHA307dsIpEn+2ZtS8X4ucIB5l/yNL64ib1tGF+Q8QFBOHTSVdQHdUUsi+yx19Pn
 +O+UCLkV0jJ696IFyA5ZeOpCqfSoi+s=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-aA7vjVwPM3Csvrz9gFINsQ-1; Fri, 26 Jan 2024 10:48:23 -0500
X-MC-Unique: aA7vjVwPM3Csvrz9gFINsQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7816bea8d28so377963685a.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jan 2024 07:48:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706284102; x=1706888902;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=acPOsyveWHQ8a/iWNOcBVxzaDethCk84WFQfb8l/wQc=;
 b=wkht4qPNX6gfXOYbIPQffDUQ0K2dCmJxwO5UEmIZPlsiyz4uYRKnvVweNV6sBPZQLF
 SHmCDQ+ksqZbgA5TYFgtwufBLi7gqcb2SDEhzeAlOSrGvHtpkyNMjMd0oCAnI9K5tkTp
 Ylz/u2ORWNTRCVsoIMQsQ/cDBJ709RlB+/fdbY9Y31uaKIP9GwWls3sZyROShO2UR9Du
 maTopFGn45zspSFVk0FaM5sFtLtDmb0B80411fM51+hcrZfV7kaETaCSpJGu+ssLZoMm
 Z/htgHi90M+ljA7VbHtbBsXsoke0/Eav/3njIZzlmWzzPXJHy/IJFeOqPgPLm6Ib3nV3
 e5AQ==
X-Gm-Message-State: AOJu0YzbBXhU9RdnjxXCFLTiS6FgBH3ktjYjuoN1s9I8RjJWpR33bezs
 CzfIX0t3mv4iuSRq615/T0Hra2A5fp5nCX3Jp0UOEAbHSZyExpQdYbQkHg43zgY3nXlGZycfvqy
 Hu0s5vJ4+oBJakeM7X3G29JHu5w5MGRUF99t2mw5uT7Iw6Gnhlw==
X-Received: by 2002:a05:620a:6221:b0:783:4bfe:b0e6 with SMTP id
 ou33-20020a05620a622100b007834bfeb0e6mr39015qkn.38.1706284102392; 
 Fri, 26 Jan 2024 07:48:22 -0800 (PST)
X-Received: by 2002:a05:620a:6221:b0:783:4bfe:b0e6 with SMTP id
 ou33-20020a05620a622100b007834bfeb0e6mr39005qkn.38.1706284102155; 
 Fri, 26 Jan 2024 07:48:22 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-176-119.web.vodafone.de.
 [109.43.176.119]) by smtp.gmail.com with ESMTPSA id
 a23-20020a05620a067700b007838362da2dsm670485qkh.111.2024.01.26.07.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 07:48:21 -0800 (PST)
Message-ID: <3ccbe579-06d0-4da0-80fa-d989eac7809b@redhat.com>
Date: Fri, 26 Jan 2024 16:48:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 27/46] hw/arm/highbank: use qemu_create_nic_device()
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20240108204909.564514-1-dwmw2@infradead.org>
 <20240108204909.564514-28-dwmw2@infradead.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240108204909.564514-28-dwmw2@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.313,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6yEnkhzhe8Rv

On 08/01/2024 21.26, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/arm/highbank.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
> index c21e18d08f..6a0e20e58d 100644
> --- a/hw/arm/highbank.c
> +++ b/hw/arm/highbank.c
> @@ -296,19 +296,17 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
>   
>       sysbus_create_simple(TYPE_SYSBUS_AHCI, 0xffe08000, pic[83]);
>   
> -    if (nd_table[0].used) {
> -        qemu_check_nic_model(&nd_table[0], "xgmac");
> -        dev = qdev_new("xgmac");
> -        qdev_set_nic_properties(dev, &nd_table[0]);
> +    dev = qemu_create_nic_device("xgmac", true, NULL);
> +    if (dev) {
>           sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>           sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xfff50000);
>           sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[77]);
>           sysbus_connect_irq(SYS_BUS_DEVICE(dev), 1, pic[78]);
>           sysbus_connect_irq(SYS_BUS_DEVICE(dev), 2, pic[79]);
> +    }
>   
> -        qemu_check_nic_model(&nd_table[1], "xgmac");
> -        dev = qdev_new("xgmac");
> -        qdev_set_nic_properties(dev, &nd_table[1]);
> +    dev = qemu_create_nic_device("xgmac", true, NULL);
> +    if (dev) {
>           sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>           sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xfff51000);
>           sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[80]);

Reviewed-by: Thomas Huth <thuth@redhat.com>

