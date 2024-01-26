Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp927437ejc;
        Fri, 26 Jan 2024 07:01:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqBqM+sr7o9dWSAg3qUJpE9tsrNpBYJK98u6QvqSrVK7AoOVIxPrgMxluKLXOUTlBKFoPZ
X-Received: by 2002:a05:6358:224e:b0:175:c520:802a with SMTP id i14-20020a056358224e00b00175c520802amr1027405rwc.62.1706281308028;
        Fri, 26 Jan 2024 07:01:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706281308; cv=none;
        d=google.com; s=arc-20160816;
        b=wI85QapuVUZlokveN7FouIOl0gA7J4nfjxBJHc9CwbLv6hb77XSlnUHJJZ43hXaOU2
         KhDVIn4fBI+k69fk6gPrBrKSCWASCcnW2GJaKRC+8cI3zHTFln3odFjtULZm0q796L05
         JmADu4qGIfXYwQDQrNdp3ruVed4c2aol0WL6oOb/4Zb4+apQaWGd1GMOeoOepqEg9WUF
         rZSZwZFe0p7pxDIvnHX1iACHkCvVNGIK0krmYlzEoR6+/0sv0WnbUBjWhZy4ENMt1P3e
         oQqfwItGAjyb4DjQy1GkbmZoL1hMj1CrGs8yNOrt4cHwS36SFWDJEy4GoJwcK83Cm1LF
         H0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=EbNcwVBZv62t2eZQbR8WW8dRh6LxCWHbZzQZlODZakg=;
        fh=YxBjZyHvYn9rzg23Yj4Yqt3QCAiBgV+kIfFR52LbKLI=;
        b=YwjDuzCb3ynqpH7bz+1TVD3K9OEpbC9XsbLEjsNCf+YqS3uITxP76IBDrfqugOC0QQ
         7JMsBuzgE9w1loKLf0PKJpBnUKga/rvuhlwk/JxgcZd0cK3ShsXV8VT6qW8kG4vzCmep
         lnDC/q1EvGsbd6/HT//yyQNfas+nx8+0ejbylYKQiPSJzms26WYV1/gwbKyvyhXnyiWZ
         D4tUcbnvLGybAe4qL8OX7gGs+xwtQSm2n/jDy7q5ZVZGuenA9ltSeVkHFiCu/IMV6qFF
         Jiz2R9LQgU04ZF5D/7J1HPBpap2pW/Y2mmD2/SV9MyCvVpbbPfTeVkCCuChpCqHwO/Ls
         XzGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ApT3vh8o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ib24-20020a0561022b9800b0046b1d1e09a9si169599vsb.296.2024.01.26.07.01.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 07:01:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ApT3vh8o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTNi7-0007yp-F2; Fri, 26 Jan 2024 10:01:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTNi5-0007yD-Ey
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 10:01:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTNi3-0007st-VW
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 10:01:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706281295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EbNcwVBZv62t2eZQbR8WW8dRh6LxCWHbZzQZlODZakg=;
 b=ApT3vh8oT/AWxmWMFp/kTOcdLkkmEhhc1cxWngOBCwu8Lw6l1oe2dzPjQv4NxMeOJMKI8I
 mWs9z9+vKJIovcJIBIcgW+49RxEZwZNGgTI2sKluG0qVBcGt2FewbTYk579O9MgJ59bhl0
 jjtQEKA4SlvZo6GCKZMf6dOPY/02PbA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-8jfqdVFLMbSwCu2RLxqoDQ-1; Fri, 26 Jan 2024 10:01:33 -0500
X-MC-Unique: 8jfqdVFLMbSwCu2RLxqoDQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-685850fb111so8651136d6.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jan 2024 07:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706281291; x=1706886091;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EbNcwVBZv62t2eZQbR8WW8dRh6LxCWHbZzQZlODZakg=;
 b=Cymp4MjqwxiC1HsUVV3GC64U5ZC9FifaQFwQtzedXZRif5ku/9o8Wj5W85aUA0BjZJ
 UF2AjyzMPSLKV3mf9r0Hv6pTzm/eaMBAD3af3YAMMrmZyANR98xoIAjDL2QT1LJYPQgX
 kSexhWt/i2IBvmAJErrHnoyu0r7uBRXHqPrY40v0u3E/PAOP/yhs4iRkMJ6DXvTwrcPt
 CqjsZSlXV2c3y8rB3QBGJMWliz5Xu4PJqISnNN3E3Zl8Xbwufh77OgvjDZAUKh01GPPo
 Ist8CIDq0gO8HePWkoCJv3VD07+Su0PFzFPLoRbHFFaXA2PZ9o4B7W2slLyIR8zd04XC
 bX4Q==
X-Gm-Message-State: AOJu0Yzh6dUG1L06qgCNfJ5+JsZ2j+ePVYi2fHUO+57I8LD1RFzEA5SU
 dEZZ1uuPLAobRQ5WH3chrjfr/Sk/s51isbmKdkUbb/reH7MqWefac9+fxLIII21R5O13usAmM8j
 oXbxMqllTDeOKqxo+MST+VZaeqB4jB+eI7sUuVwdem4jto5wddQ==
X-Received: by 2002:a05:6214:27cf:b0:681:7963:11ca with SMTP id
 ge15-20020a05621427cf00b00681796311camr1259264qvb.126.1706281289838; 
 Fri, 26 Jan 2024 07:01:29 -0800 (PST)
X-Received: by 2002:a05:6214:27cf:b0:681:7963:11ca with SMTP id
 ge15-20020a05621427cf00b00681796311camr1259231qvb.126.1706281288904; 
 Fri, 26 Jan 2024 07:01:28 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-176-119.web.vodafone.de.
 [109.43.176.119]) by smtp.gmail.com with ESMTPSA id
 nc7-20020a0562142dc700b00686ad7daabesm566907qvb.28.2024.01.26.07.01.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 07:01:27 -0800 (PST)
Message-ID: <acbab626-204c-4f79-a59f-543d07c90cfc@redhat.com>
Date: Fri, 26 Jan 2024 16:01:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/46] hw/arm/exynos4: use qemu_create_nic_device()
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>
References: <20240108204909.564514-1-dwmw2@infradead.org>
 <20240108204909.564514-24-dwmw2@infradead.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240108204909.564514-24-dwmw2@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.313,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: BrvbA+qve7s3

On 08/01/2024 21.26, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/arm/exynos4_boards.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
> index b0e13eb4f0..003992189b 100644
> --- a/hw/arm/exynos4_boards.c
> +++ b/hw/arm/exynos4_boards.c
> @@ -76,10 +76,8 @@ static void lan9215_init(uint32_t base, qemu_irq irq)
>       SysBusDevice *s;
>   
>       /* This should be a 9215 but the 9118 is close enough */
> -    if (nd_table[0].used) {
> -        qemu_check_nic_model(&nd_table[0], "lan9118");
> -        dev = qdev_new(TYPE_LAN9118);
> -        qdev_set_nic_properties(dev, &nd_table[0]);
> +    dev = qemu_create_nic_device(TYPE_LAN9118, true, NULL);
> +    if (dev) {
>           qdev_prop_set_uint32(dev, "mode_16bit", 1);
>           s = SYS_BUS_DEVICE(dev);
>           sysbus_realize_and_unref(s, &error_fatal);

Reviewed-by: Thomas Huth <thuth@redhat.com>

