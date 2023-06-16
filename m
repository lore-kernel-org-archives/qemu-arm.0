Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp1409783ejt;
        Fri, 16 Jun 2023 07:01:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ77v7tIfP9KR1IIV++3FqFRDkEVHjcLMHhJgCnNJNsKY2MR/1lSzhXhXwUJT7YwPgI0GpYf
X-Received: by 2002:a05:620a:3d0b:b0:75e:cbb5:a8fa with SMTP id tq11-20020a05620a3d0b00b0075ecbb5a8famr1835046qkn.18.1686924115058;
        Fri, 16 Jun 2023 07:01:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686924115; cv=none;
        d=google.com; s=arc-20160816;
        b=n4dV417KR8EMv98xqG0XlEognPGdvtUJNaIZcDT2nsoAmmAdbMLjfKfzYJyjcs9oWP
         0LUmnRpZc4A564uso15yNFIupj3BN7Xr5zDN5gXBrPexZYUZ9dzhhO+t1g5qqUgzYROp
         6KFs5q42kxN4+D3XkLQ1KUqYYFcnN50TnxLij8hszS3xWv4kCAG2N8l+ALBH6StSCkfL
         azaHbZzNxw5LL+WPHB0FsG9WpFxrOfQuivgS+d4WYciwRniYxmC5EwYbr1h/W+j3eeln
         zVc9joH71/RDd8MZRhTZaLqMDXci0tk8sQ4ZhVRqIlWgWZMLEtkyPonIv2tSMrdokmnC
         wlKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=17mCC/vcnq4uPdOKtP702AjfRKThmQIlYS9p/tgie/A=;
        b=zk6eZzchVBepsHO45u2208d3P/1fx2YxdHL0QrVG3AzETl0T+T9/R+dvt91NGlvG62
         IG8/4tDs4xOJzcur1FBqOFy8jokIuZ5vJWUwChaBOvqaJ1+BqH7q82GASkb9pdivFr0S
         yQG+Xk9akrtCn+uVby4lxtTWkNrL6NoFpvO4jsspsFj6iSctXc1fanqVECdRKItaqxI0
         NQeguPGE8f+CnD2jodDMmXDZMgKX8BYh/mcfJL1u6ZCEkReWo+Xp9h8q27MiO/WoJAIY
         QvaPnhiKPMRTy3FVbXt4o4EJbb7oLIf6SZ/Wixt765hEDprNRnyL6Wmqr8i8WlYg5MaE
         v7zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u8CFReQi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19-20020a05620a149300b0075d005b547csi943849qkj.702.2023.06.16.07.01.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jun 2023 07:01:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u8CFReQi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qAA0l-0006Rb-Pr; Fri, 16 Jun 2023 10:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qAA0j-0006Qi-UP
 for qemu-arm@nongnu.org; Fri, 16 Jun 2023 10:01:10 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qAA0i-0004yy-1Y
 for qemu-arm@nongnu.org; Fri, 16 Jun 2023 10:01:09 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f8fb2eb75dso3100005e9.2
 for <qemu-arm@nongnu.org>; Fri, 16 Jun 2023 07:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686924066; x=1689516066;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=17mCC/vcnq4uPdOKtP702AjfRKThmQIlYS9p/tgie/A=;
 b=u8CFReQiqLtcd7tTb5cJFgHJSNvb3diktcBAEb6B01cPBzJCH9RhASIU6ri/I92h+8
 ddd5OluabmgyZEybErD96v5smzzFN7j29qNTD9XNidO4d8arx2rkFYrxPT0xNiMRJ4Kf
 GuX2eIiBkYjY4CElU/hZx1ne+zNcGdRHoqCjkQTI5S9Ptw/IRHctEeFwNyTJdYNLbnNc
 0KrMxNesM1EYbrbB9A6sI1A1QWYADUJpa/SKdVhmeaY5P2PeOuR1dyfZl5uURD/KN8hs
 ALzwb0bpyYgZIDng/unoMD1FTVob+R/q29G5ZzLFEcFC55v9Imgdw36+jr3l9OemwWRq
 oXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686924066; x=1689516066;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=17mCC/vcnq4uPdOKtP702AjfRKThmQIlYS9p/tgie/A=;
 b=KZh3ADpjkyBlbzvoEBjbTHVbqhDQsVoBFUnNnWCRVd7SwGDJOdLNJ5l4gIwVy0w460
 AqsGTCCmNG0j7zlWrgSXI7nwZjUt3sf0MHNgRU+8BjmKmFxo86Ng5ybJl1N6P6tsAfhL
 BtlF7jTlLbuUWVbE+lCSOddVAQOmBT3gcYotn427Zr9ukM0oiO0+8BfFQf8fvaUCbOnX
 Ei205sRjk8kxCU/Xz3jlj8xbKGHufYAtqc6EOq36NfC0We0HnfZzy59MSR07RcNOl9S3
 PFin3UiqOcyRC1aGxH5D7CXNejPFZhfHXmG6kqDhqu13JmzywcdeqtiqxlhV76WXnU6y
 89AQ==
X-Gm-Message-State: AC+VfDy64OLjF7apd8N6VTndmG3pZLzD+zGY48dzEqlWQ5F5CxCIROCk
 6BUSGWUCP/mJISM+C4Q8Dnxt2g==
X-Received: by 2002:a7b:c050:0:b0:3f8:f45f:5c34 with SMTP id
 u16-20020a7bc050000000b003f8f45f5c34mr1255670wmc.40.1686924066572; 
 Fri, 16 Jun 2023 07:01:06 -0700 (PDT)
Received: from [192.168.164.175] (146.red-88-29-160.dynamicip.rima-tde.net.
 [88.29.160.146]) by smtp.gmail.com with ESMTPSA id
 p24-20020a05600c205800b003f7a562ff31sm2325500wmg.6.2023.06.16.07.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jun 2023 07:01:06 -0700 (PDT)
Message-ID: <89105b1b-2c29-685c-3631-c5b0fa79962c@linaro.org>
Date: Fri, 16 Jun 2023 12:39:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 09/12] hw/vmapple/bdif: Introduce vmapple backdoor
 interface
Content-Language: en-US
To: Alexander Graf <graf@amazon.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20230614224038.86148-1-graf>
 <20230614225626.97734-1-graf@amazon.com>
 <20230614225626.97734-5-graf@amazon.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230614225626.97734-5-graf@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.093, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: X/xrD6n5Tlcr

On 15/6/23 00:56, Alexander Graf wrote:
> The VMApple machine exposes AUX and ROOT block devices (as well as USB OTG
> emulation) via virtio-pci as well as a special, simple backdoor platform
> device.
> 
> This patch implements this backdoor platform device to the best of my
> understanding. I left out any USB OTG parts; they're only needed for
> guest recovery and I don't understand the protocol yet.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> ---
>   hw/vmapple/Kconfig        |   2 +
>   hw/vmapple/bdif.c         | 245 ++++++++++++++++++++++++++++++++++++++
>   hw/vmapple/meson.build    |   1 +
>   hw/vmapple/trace-events   |   5 +
>   include/hw/vmapple/bdif.h |  31 +++++

Please enable scripts/git.orderfile if possible.

> +#define REG_DEVID_MASK      0xffff0000
> +#define DEVID_ROOT          0x00000000
> +#define DEVID_AUX           0x00010000
> +#define DEVID_USB           0x00100000
> +
> +#define REG_STATUS          0x0
> +#define REG_STATUS_ACTIVE     BIT(0)
> +#define REG_CFG             0x4
> +#define REG_CFG_ACTIVE        BIT(1)
> +#define REG_UNK1            0x8
> +#define REG_BUSY            0x10
> +#define REG_BUSY_READY        BIT(0)
> +#define REG_UNK2            0x400
> +#define REG_CMD             0x408
> +#define REG_NEXT_DEVICE     0x420
> +#define REG_UNK3            0x434


> +static uint64_t bdif_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    uint64_t ret = -1;
> +    uint64_t devid = (offset & REG_DEVID_MASK);
> +
> +    switch (offset & ~REG_DEVID_MASK) {
> +    case REG_STATUS:
> +        ret = REG_STATUS_ACTIVE;
> +        break;
> +    case REG_CFG:
> +        ret = REG_CFG_ACTIVE;
> +        break;
> +    case REG_UNK1:
> +        ret = 0x420;
> +        break;
> +    case REG_BUSY:
> +        ret = REG_BUSY_READY;
> +        break;
> +    case REG_UNK2:
> +        ret = 0x1;
> +        break;
> +    case REG_UNK3:
> +        ret = 0x0;
> +        break;
> +    case REG_NEXT_DEVICE:
> +        switch (devid) {
> +        case DEVID_ROOT:
> +            ret = 0x8000000;
> +            break;
> +        case DEVID_AUX:
> +            ret = 0x10000;
> +            break;
> +        }
> +        break;
> +    }
> +
> +    trace_bdif_read(offset, size, ret);
> +    return ret;
> +}


> +static const MemoryRegionOps bdif_ops = {
> +    .read = bdif_read,
> +    .write = bdif_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 1,
> +        .max_access_size = 8,
> +    },
> +    .impl = {
> +        .min_access_size = 1,
> +        .max_access_size = 8,

IIUC your implementation is using (min, max) = (4, 4):
i.e. if the guest emits a 64-bit read at offset 0, we want to return
both REG_STATUS/REG_CFG registers.

> +    },
> +};

