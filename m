Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1861608ejb;
        Mon, 23 Oct 2023 23:59:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVzB5pAncXOdvhiw5ylhUMlkDISSWyBYrO/WIchtZXm9y3pPezMlxtHkhnH/peLQuOZDt8
X-Received: by 2002:a05:6214:c81:b0:66d:9e52:a431 with SMTP id r1-20020a0562140c8100b0066d9e52a431mr10446016qvr.3.1698130788650;
        Mon, 23 Oct 2023 23:59:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698130788; cv=none;
        d=google.com; s=arc-20160816;
        b=pCezbkZrbTkMQJJ6PMq+pz1Xy5CwR4QZNioCFBXjpV/E+/K4JyXthFsbb3bTRHVVPV
         XBNe8GbI56p9ocv/bneI3rP66jXqae8HC6oxU3h0N7rq4HEl5WaOOcFnFP5RF4Iv0mLz
         gEBBtI/ZfWKS3r3Te6C8CHL86CU4FmXDtmc9wDvQ4LZwqxl90NSHIQSYvofcVonFUWJE
         irZCseMr8TjneJsCuojsjx9MuRlukZnvxZeGBBhdaNLMlXDyS5W0rZeqjEzXzGRPoxZU
         alZfbiI8A6HVa699kmWydegk8cvHLdZgOVAQQ+zL4J6bZIuS6Q8bghmhi3mqBmvL11Us
         NzDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3LKoaw12Kegy/5Wwnu5bK7CWabfG8BwbA9wvMxlQdZI=;
        fh=EYaqcWeXxA8eS+WQrRVx+pYP+z06BK0zR/WQAthJTVk=;
        b=CqgjU4rSsmyFkCJPChWJgtCa8v68aZo78ejlCzHMsv0stEhZjPVWct5q6u6HP29CNi
         UEvGCm5vSQ9M6/9QiPHm5eQoQy8B3UW4B481ep/pkWS2SW8X5uaRDQgZJlafL5D9Fue1
         ddxhXWr4exXprXr3iZ5VkIW/dWMhi29wSAIxFffubeLQk5aJLiZ8vX8wslSrwS4WK9lx
         5m1Dh/qiY/jvteTMUX5SW9aeRxDvFFX3+zcmLwoRqmw3W6COVvYMqNbSHtiMOMSimhtf
         ymqwWNsCJ8pwmENV7HVEc7Bz+O+wvXV6P++th+nAXSN1KWyNbLTWD50ryauSkBvwmgJd
         mEEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RgiIgt75;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3-20020a05620a29c300b00765aafce58csi4347970qkp.120.2023.10.23.23.59.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 23:59:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RgiIgt75;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvBNy-0006QC-Mn; Tue, 24 Oct 2023 02:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvBNx-0006PR-Br
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 02:59:29 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvBNv-0000ks-OT
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 02:59:29 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4084de32db5so35484875e9.0
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 23:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698130766; x=1698735566; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3LKoaw12Kegy/5Wwnu5bK7CWabfG8BwbA9wvMxlQdZI=;
 b=RgiIgt75xS1g81WSUjRKC7povlAyiTKzMrFW8j2EIwgYs9e5ASELiKbDSWa7lCCErB
 FSBYPHS9ch5qy1sQZGBrOIpJW7hfPg+rX8hpWdbuEaoz9w8LdKwQYY0EAfzFHYp5CsKh
 1Oqh7IBmOj7pM4GDX7iw06ZZULSJPOkuGUFVQ+bpuxMeLwlecUaiBzuzIRM3zhqyf05I
 64qp6RMqSHBsdF4keTtA+XS1+yvbCvQSg5+8bJpzBDef6StWbzYf/UJcPcRJqNm6lgeG
 Av+miEmYv5QVYOKoaU9a5Kvm3OGaaet/La80FjZkmqEGkjBvbd7lhmYheGYGwNqQAQJt
 +EVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698130766; x=1698735566;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3LKoaw12Kegy/5Wwnu5bK7CWabfG8BwbA9wvMxlQdZI=;
 b=RK8bDWSKkzkZs1bIDSWbWfQQsm1Fbiy1IbvyNWt4mK9f8skbGK5kOcf3Lr7ewwGbvN
 dBP8qSxKkonHbfYmUScTLLYaxZEGUdrJKJNpV2HI43PAptE24k8bUWPexvIpuyR6oR6Q
 eoyHkjFIAo5BpJBOAU75qwtOkqJKfJKswhLPXWCxOKkEA2QzUV2UIR4BTqY3HLBYPLxS
 AgP3iE2nRldsd3mTfr6XfAFkuiA+67RnsKnZ1o8E1rdl20vxPzrQHzLuaKOj6va/sydG
 IIyzrrPcLpI47NjrJHQwR3iDcN0DAYVNvR665+EQ60F4HDpbfBY1d47dHW/7dWCsCQln
 VZsA==
X-Gm-Message-State: AOJu0YzuP+j2CQ/a6SJ71o0xyo2m6aUVb5/aEuvs09CLGHhkB0fTxIGI
 kkHC5DGkVGb3QvX4EsCydRwoiQ==
X-Received: by 2002:a05:600c:4f01:b0:405:3cc5:1105 with SMTP id
 l1-20020a05600c4f0100b004053cc51105mr9013389wmq.8.1698130766190; 
 Mon, 23 Oct 2023 23:59:26 -0700 (PDT)
Received: from [192.168.69.115] (sem44-h01-176-172-55-165.dsl.sta.abo.bbox.fr.
 [176.172.55.165]) by smtp.gmail.com with ESMTPSA id
 l23-20020a1c7917000000b004063cced50bsm11027118wme.23.2023.10.23.23.59.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 23:59:25 -0700 (PDT)
Message-ID: <bdaf1998-7870-ade6-a611-ed4bd793cf54@linaro.org>
Date: Tue, 24 Oct 2023 08:59:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 1/3] hw/arm/virt: Add serial aliases in DTB
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Axel Heider <axel.heider@hensoldt.net>, Laszlo Ersek <lersek@redhat.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Shannon Zhao <shannon.zhaosl@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20231023161532.2729084-1-peter.maydell@linaro.org>
 <20231023161532.2729084-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231023161532.2729084-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jQfuIIihcurc

On 23/10/23 18:15, Peter Maydell wrote:
> If there is more than one UART in the DTB, then there is no guarantee
> on which order a guest is supposed to initialise them.  The standard
> solution to this is "serialN" entries in the "/aliases" node of the
> dtb which give the nodename of the UARTs.
> 
> At the moment we only have two UARTs in the DTB when one is for
> the Secure world and one for the Non-Secure world, so this isn't
> really a problem. However if we want to add a second NS UART we'll
> need the aliases to ensure guests pick the right one.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/virt.c | 4 ++++
>   1 file changed, 4 insertions(+)


> @@ -889,7 +891,9 @@ static void create_uart(const VirtMachineState *vms, int uart,
>   
>       if (uart == VIRT_UART) {

I'd have put this patch after the rename (#2 <-> #1). Anyhow,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>           qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", nodename);
> +        qemu_fdt_setprop_string(ms->fdt, "/aliases", "serial0", nodename);
>       } else {
> +        qemu_fdt_setprop_string(ms->fdt, "/aliases", "serial1", nodename);
>           /* Mark as not usable by the normal world */
>           qemu_fdt_setprop_string(ms->fdt, nodename, "status", "disabled");
>           qemu_fdt_setprop_string(ms->fdt, nodename, "secure-status", "okay");

