Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp615947ocs;
        Tue, 27 Sep 2022 07:44:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6nsbcXRpF98Tlzq9saETu62UNq5wfxoKALWlPfuDRtexB31AwXDUf33GhKd7sh2RRK9T7V
X-Received: by 2002:ac8:5950:0:b0:35c:d0b7:e2e7 with SMTP id 16-20020ac85950000000b0035cd0b7e2e7mr22388117qtz.519.1664289844211;
        Tue, 27 Sep 2022 07:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664289844; cv=none;
        d=google.com; s=arc-20160816;
        b=MpVTpfRKoGKNYGbwOR47XnxrwYPO3jv46fsd5OSnqg94+UrJBlblk5LFfE8fxGgduL
         4Qpf89PMpVK5jGDLszGinKqySk9xwMbLZ935KgcWjPkGnYhdItiBP7M/+4LFF82X8hmS
         4zgcdqh1x9ka/b18PXizv613Wy4ql7U6b2q4V/2TusWMdTgLaN9yESTjX//I6yFVrNkY
         IBVdWzZg7zv0aUYp1KQE3TAF2/AwPEEzV1K29SPHJaX6wBDW0BzVZWievc8T3CqChdYJ
         aow/1xkpvPmfYX2jbccnjTpm2iaPIG6fn0QaE9vJi9bo9NkA1C+AeuqDvUhx/+jh4t9J
         Tbcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=t2CwYiFfPFe7zNn6fpJXNcmxgp+8AQ3T6CXcmqBQgGM=;
        b=HFEJynEKLa0A19rMvSEaQQTqf80O+P4QnYPmo6mtnaIEKytWea5VGh5Wy7d2Vo6Q92
         D0QDB8lyFeRKxqeCMvSkDF/SnSpPJqid0WVEVf1uqRDtk4qM0KVgeeV0QIZL5Jn3leOW
         CNuRpNbCMaBpw6ULxW5XD6lwtBov7hakyZvWmtZq2HSXtCTHFWNoUFVxJqVLMSRJv30v
         q88aAmQeikgx0rWDii5rmoCYLthb5tPFXwsesrf0ztuOE8Fk/l0BvEnb52wh99zBmJ9A
         drTreGdsJWG+HMaMYGbondSD+WDipEWo14JUXg/Us7W/DPE5M6mz2N+Q/chrDN69Zb4b
         Vozw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WEGkkOsR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4-20020ad45be4000000b004ad88cbbaf9si1120812qvc.303.2022.09.27.07.44.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Sep 2022 07:44:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WEGkkOsR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odBoZ-0006Vp-N8
	for alex.bennee@linaro.org; Tue, 27 Sep 2022 10:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1odA0Q-0001cz-Dy
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 08:48:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1odA0M-00077C-VU
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 08:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664282885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t2CwYiFfPFe7zNn6fpJXNcmxgp+8AQ3T6CXcmqBQgGM=;
 b=WEGkkOsRHXU9g8MyV4QH8QiyqGdFi1JQMrSHKLwvgMCExjzx11oo9ZaJtDoAQ7VC5U+9hx
 NTxX7lrTLTuCw7C/9YlOJ2NNNtW08JZqiuf8xxSKO0Z2KQBk1aWARuiOaIyt/a5k71vwn6
 kP/pO89BxXwtJZWxzrQYVfbcKLSnCno=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-315-jyGtF8NpOUCOR3L7nfqRAQ-1; Tue, 27 Sep 2022 08:48:04 -0400
X-MC-Unique: jyGtF8NpOUCOR3L7nfqRAQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 dm10-20020a170907948a00b00781fa5e140fso3848121ejc.21
 for <qemu-arm@nongnu.org>; Tue, 27 Sep 2022 05:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=t2CwYiFfPFe7zNn6fpJXNcmxgp+8AQ3T6CXcmqBQgGM=;
 b=PCsccgPZ7TxU+9yxg1mHR+CzkOI8xZePFgvOmZ8Ug10d2+DoeWAfjXFjBwIeKuw3Zl
 1R9PoOaZnRD8l+wgIBKwcq+6wDgOghOyQrHW7im45hDBpnnXl48Bqyw2ZgWI1uzR6R3f
 4FpjO2/FinzGlMS/v29qkYMDb/4VCqa9yrQOx9tj9Ub3A5XDkQJEvA2y/1d6pX50H3K0
 5PKE8N9E+n+dLTUsQ8fbQ/unQ01qgMgODGcwHn7wxx7lzdoi6gXjD5GdZKKdkojyQLcE
 oqFgBRLMza3By8LPGWoPNWVL6mWaVh7ZMuaKVz2LhCNyy/+GYaAbDFYB/1pxCDzKG8Og
 KsLg==
X-Gm-Message-State: ACrzQf3JG+9rRzr+b4Gk2B+VJH+/VDg/p7c75De2Q18eXiFNgUPSAx3j
 ka2N9AE14AgxLOq07lbZftH0AL2eZHDjUaaNlQS6vaSkaUV+k9LzxIqYMTln5w/HuCYxz2JESez
 uZ6IyeoXhBVqL
X-Received: by 2002:a17:907:970c:b0:782:e3f1:af60 with SMTP id
 jg12-20020a170907970c00b00782e3f1af60mr15449380ejc.757.1664282883496; 
 Tue, 27 Sep 2022 05:48:03 -0700 (PDT)
X-Received: by 2002:a17:907:970c:b0:782:e3f1:af60 with SMTP id
 jg12-20020a170907970c00b00782e3f1af60mr15449361ejc.757.1664282883291; 
 Tue, 27 Sep 2022 05:48:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 z5-20020aa7c645000000b0044f0c01196esm1186148edr.65.2022.09.27.05.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 05:48:02 -0700 (PDT)
Message-ID: <58ecf105-9767-25fd-6781-86dcf149bc31@redhat.com>
Date: Tue, 27 Sep 2022 14:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/8] hw/arm/virt: Fix devicetree warning about the
 gpio-key node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-5-jean-philippe@linaro.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20220927100347.176606-5-jean-philippe@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rTKAdCfJK9LT



On 9/27/22 12:03, Jean-Philippe Brucker wrote:
> The node name of the gpio-key devicetree node should be "key-poweroff":
> 
>   gpio-keys: 'poweroff' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
>   From schema: linux/Documentation/devicetree/bindings/input/gpio-keys.yaml
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  hw/arm/virt.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 8605f5058a..6805c57530 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -932,12 +932,12 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
>      qemu_fdt_add_subnode(fdt, "/gpio-keys");
>      qemu_fdt_setprop_string(fdt, "/gpio-keys", "compatible", "gpio-keys");
>  
> -    qemu_fdt_add_subnode(fdt, "/gpio-keys/poweroff");
> -    qemu_fdt_setprop_string(fdt, "/gpio-keys/poweroff",
> +    qemu_fdt_add_subnode(fdt, "/gpio-keys/key-poweroff");
> +    qemu_fdt_setprop_string(fdt, "/gpio-keys/key-poweroff",
>                              "label", "GPIO Key Poweroff");
> -    qemu_fdt_setprop_cell(fdt, "/gpio-keys/poweroff", "linux,code",
> +    qemu_fdt_setprop_cell(fdt, "/gpio-keys/key-poweroff", "linux,code",
>                            KEY_POWER);
> -    qemu_fdt_setprop_cells(fdt, "/gpio-keys/poweroff",
> +    qemu_fdt_setprop_cells(fdt, "/gpio-keys/key-poweroff",
>                             "gpios", phandle, 3, 0);
>  }
>  

