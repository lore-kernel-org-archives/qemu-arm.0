Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1860612ejb;
        Mon, 23 Oct 2023 23:56:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6g8LLvuBXOlR/S9UKDc6tL/w/SNoBBKCN692eC3IjeU2MEltgRq2bXtpY7jIPmDINBYfO
X-Received: by 2002:ad4:5b8b:0:b0:66d:61c3:8ca4 with SMTP id 11-20020ad45b8b000000b0066d61c38ca4mr10963338qvp.15.1698130600413;
        Mon, 23 Oct 2023 23:56:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698130600; cv=none;
        d=google.com; s=arc-20160816;
        b=a9C9OuQzMv5x0aNpxhyrLYw7OnFVhVcDEar7GnnpRqhSD+dwURKhZVoGIaWvH8TxNN
         /80a9SzwpSycGhjxT/O4QayrAggQ44vwsUtrMy8a1ciRPZPglb2EE+kbPfPL4uIskMB+
         0DU7ZxSA1YOGlQ9D9J4ogDK8jpS0XX670lCXpOMLvOW1J+DX8mRqUAcOzXK7kj+6SVbn
         viLJVwt8PlkeSxMS6CO4wARgScjvmcojC7OvdZh8USOK/mrgq02VbMrOiso3NHncvf9f
         TDZRYaNbL1xMmrc3BJDmFJy6zB1Kkou9uyJhwVSCQSa3rnmemEzHBprQdfHsCfFsjeoo
         EfHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lKsHxJ9UGLhndcbZ+ldBg9PWjGIpNn5jd7CJwuYj/TU=;
        fh=EYaqcWeXxA8eS+WQrRVx+pYP+z06BK0zR/WQAthJTVk=;
        b=yWUw2AiAim2Q0e5dYGWdg0DBi8PbyFgbXpVc+IU6JXTvMAKiQOguqYb1PPREXyBQP1
         RM/z1gYhZf2JYaNvSQ5kyyiXjtI7bkW8hWO8BZRBzzdceuUPj5jDhKAM5moSLzDaRqa2
         YgprubFkFqE17KqIXjswa1RIPyiQwydtZ5xRDav29cL+Woro0L+7qi+kCrEBOlI7S8Qf
         FZ6PB+rjVNtVg1o1MmEG02zidxkDr0sjwHrJeSzJVPRgxMNN70K3JvtYMxzNmK/SkSPf
         GVLeFEhy55o9bzwShbRnCiEmm12Utje9meMnxGbqL0cAZBfRqDLiBQ37FfMpZTBhDA72
         bryQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l+BmdNBx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a05620a078300b0076d88513635si6554640qka.115.2023.10.23.23.56.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 23:56:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l+BmdNBx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvBLB-0005Rd-3M; Tue, 24 Oct 2023 02:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvBL9-0005RE-Ex
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 02:56:35 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvBL7-0000PB-5B
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 02:56:35 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-32dc9ff4a8fso2789748f8f.1
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 23:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698130586; x=1698735386; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lKsHxJ9UGLhndcbZ+ldBg9PWjGIpNn5jd7CJwuYj/TU=;
 b=l+BmdNBxHHjcQKpRCNgNjxsy6RYxQUJjh+mr1VIT4gicyHkKYad53XaHmc0QovNpR6
 rhb4wmpehnhk/zQYnljzngquXqxwCxir383MWfkj5qIIxH5DQMr29Tp5r1pfn0eFPwGB
 q+daa3yW0GobEtTHzrl1uDmZmcn9aUYSgggYUrPx3j9hy10p07xUY3NSJp0E7eerHBJm
 oryhzEdCFsCPtvEoJgMBeABaYXA2PP/VCTezgpigyxXgq9XnEX/OLtTL0dJXnWTWTvzX
 2jfnVo/u+y7WbTcdkjy16tm8M7QFLre/JdZI/YY+hWQv2U9ijvPkFWgCDCwP1jNdj2Aa
 myuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698130586; x=1698735386;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lKsHxJ9UGLhndcbZ+ldBg9PWjGIpNn5jd7CJwuYj/TU=;
 b=B92Jv6OQPhD3Hzwab+QaGhylW7o+gECe+wm6Q6xwTZiYnHo8YjcKdMpNSy0kZvKk2Z
 U4Rg2z01Ahzne92h3TyqjHzqOSbyZddfoVg5tciIWOgw1ecQ7g+zVBNY2wyrNaxtr9mO
 lt7exsbn6oXaE5DftuXJJjM7vLBsd3o3q07/V69ZI+/fC9KPv5dhlD6Za/M4pHLHwrjr
 9MvMW8eNow3W0hWrf5pxVOr8v3GhntDbR32choZFCvowChsU1G3EekfnSdjVHrFTCgbF
 lQXTUMKS/m6MSK6MxXFkFmGjm69NvG0bfAKl4iA4NvukbZnKt6iW6Y8g9RVJUiOPpU+5
 ezyg==
X-Gm-Message-State: AOJu0Yyk49UykhI1qxua5jcM3UcPIjuC2E2FwSb8jgrgT3E/IrM/v2hn
 sXOhz7LSSFICwtNHkHC+Pifhnw==
X-Received: by 2002:adf:cf02:0:b0:32d:8da0:48d0 with SMTP id
 o2-20020adfcf02000000b0032d8da048d0mr7662746wrj.68.1698130585678; 
 Mon, 23 Oct 2023 23:56:25 -0700 (PDT)
Received: from [192.168.69.115] (sem44-h01-176-172-55-165.dsl.sta.abo.bbox.fr.
 [176.172.55.165]) by smtp.gmail.com with ESMTPSA id
 dk18-20020a0560000b5200b0032dbf6bf7a2sm9301353wrb.97.2023.10.23.23.56.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 23:56:25 -0700 (PDT)
Message-ID: <a6f97523-a1df-eca4-93bb-eb865d03598e@linaro.org>
Date: Tue, 24 Oct 2023 08:56:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 2/3] hw/arm/virt: Rename VIRT_UART and VIRT_SECURE_UART to
 VIRT_UART[01]
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Axel Heider <axel.heider@hensoldt.net>, Laszlo Ersek <lersek@redhat.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Shannon Zhao <shannon.zhaosl@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20231023161532.2729084-1-peter.maydell@linaro.org>
 <20231023161532.2729084-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231023161532.2729084-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Rs0ETetXKzNv

On 23/10/23 18:15, Peter Maydell wrote:
> We're going to make the second UART not always a secure-only device.
> Rename the constants VIRT_UART and VIRT_SECURE_UART to VIRT_UART0
> and VIRT_UART1 accordingly.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/virt.h    |  4 ++--
>   hw/arm/virt-acpi-build.c | 12 ++++++------
>   hw/arm/virt.c            | 14 +++++++-------
>   3 files changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

