Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp864770lff;
        Thu, 17 Jun 2021 12:51:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGP755RvID89c5vMNfh/umO0NZUOflyAKxrMUR1QdTaMBgEQvjfcrVTBpYMSuvmJLuxLMe
X-Received: by 2002:a1c:3c89:: with SMTP id j131mr7221862wma.85.1623959518522;
        Thu, 17 Jun 2021 12:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623959518; cv=none;
        d=google.com; s=arc-20160816;
        b=0SWtw1y7P+GKM0OazzNnjZTdJcBWV5BrP6FA5dbZ82j6j+DJQDjqr1ONT7bpp1s9Wc
         NAZpa8/eCw+L1+UJC0G+6IzdI4K06jV5Al2QPAl484bGxvz92bIpoGpr7+Y9SqJCY7yq
         y1LZKAQ49Mslg6X6TvmPIifcvkBl0o4O2tetoQtUG0pB2ugLCV81BgS+G+m7CYtWltzi
         anD44bghYyFcRqxoVA/snSe/AE+SjIS7ANO1SAJZYcLs+ODsLBs5Kzf7y505fzrdwgE/
         uJXXkVfblgSYTmWJtpjlkFdpoMwIGu1XHPf7zyNS6K98AKhzD0zj/Obrw06dExtdsbpQ
         KSgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3tN5V65uk1xsLZ+jG5bPvUSoPBkAs8qfZpJDVTd6lgo=;
        b=Cfgfn0D1WCd3OZJdkXV/+m1knsHwipQ4mo9KooT48NEw+dPnFnrj47sVvnPKgu0GWd
         RSGAwosm4ui42ZN3LXFVFBDxGqVztrt1CiW9wjHZy4wrPSCH23Coq0reBY5wH+Twyans
         0LFoYkhzpGA5lP7TiPICWPi7gO2cM8mEr0GFhw4xJT8gxETcwbDYegB3lmTNpvGr9e0j
         i0Oi65+MHW7+tEtcEsV+xt5Yhu8SX/KhQu7cwYKxECA0eGkWC4GXYLIM66pgPbHVyeTv
         C4cO6aA40vXEpZCobqxChpFZ85dw5oPM3xn9ajYVNrk4Fl5o2PtxsoBVz53zMbZ0MmX7
         mN6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WvrUYjcL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4si7449102wro.98.2021.06.17.12.51.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 12:51:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WvrUYjcL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lty3R-0003RO-HE
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 15:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lty3C-0003NQ-FP
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 15:51:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lty39-0004C8-Ow
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 15:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623959495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3tN5V65uk1xsLZ+jG5bPvUSoPBkAs8qfZpJDVTd6lgo=;
 b=WvrUYjcL60YvmfioT+d3HWpCkIvyrdInbR9G9sX1H4LalcgbHnBiWcLrhSr0igCFSUGymr
 xv0npURCgAulRqF9xmN/unTCiVG+k0mEFhIvKlpFWrTI45x2Ni1G0KyQ6lO858l4iqu6Ic
 nOcRkl6HBtWPcjcbxWzC9l4UOtCH0pE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-MGqk6bH3NoeWvOqdeled4g-1; Thu, 17 Jun 2021 15:51:34 -0400
X-MC-Unique: MGqk6bH3NoeWvOqdeled4g-1
Received: by mail-wr1-f70.google.com with SMTP id
 q15-20020adfc50f0000b0290111f48b865cso3400371wrf.4
 for <qemu-arm@nongnu.org>; Thu, 17 Jun 2021 12:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3tN5V65uk1xsLZ+jG5bPvUSoPBkAs8qfZpJDVTd6lgo=;
 b=AyFGjHcGRmq+6TrLI0+J0TbA4A+goFu1OihP3l3whLKxHkceog/HlvjBMkcgm9IKYq
 H/x51vKZov1+qSstLFVjTpZpfxAa3zN4Hb73T8VBTaUsQ5WuX/41uIBMMwJoPCrzBSkY
 7KK7ShSKjxC0enyjxHQOrDkpuT1yUBaBJBdF8rfFVsDPhMm8DL98G2QIDYuR7EDUTkgA
 P1ujdPma0sNqb0gOPwth3PoHnMy28Is+LjkJMq1WtpbTp5Gnak7/OTupCw+7m+57jhis
 qTr0OoK0pPnAi5jMbeMlrzV5oOCgAHk+zq6WvsOzxA1xfJmazxnuWLVY7XWyWWcFuIbu
 uYzg==
X-Gm-Message-State: AOAM532/cHiZ0SPbTyts+TdF957SKljF652pQdF1z2Wv/hKL/S/niSew
 LySbIpy87rtCldm/+SHCV0FHm+7sI0sJfWMUWY67lViHxLRUZdpyShpuFE1mxFuGx3fIYwzdpgW
 ADHD6rl6dxggT
X-Received: by 2002:a1c:770b:: with SMTP id t11mr7178515wmi.79.1623959493054; 
 Thu, 17 Jun 2021 12:51:33 -0700 (PDT)
X-Received: by 2002:a1c:770b:: with SMTP id t11mr7178491wmi.79.1623959492856; 
 Thu, 17 Jun 2021 12:51:32 -0700 (PDT)
Received: from thuth.remote.csb (pd9575d16.dip0.t-ipconnect.de. [217.87.93.22])
 by smtp.gmail.com with ESMTPSA id m23sm9975336wml.27.2021.06.17.12.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 12:51:32 -0700 (PDT)
Subject: Re: [PATCH v3 4/4] tests/boot-serial-test: Add STM32VLDISCOVERY board
 testcase
To: Alexandre Iooss <erdnaxe@crans.org>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>
References: <20210617165647.2575955-1-erdnaxe@crans.org>
 <20210617165647.2575955-5-erdnaxe@crans.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5d410450-6f69-2081-85c6-75ebc23409df@redhat.com>
Date: Thu, 17 Jun 2021 21:51:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210617165647.2575955-5-erdnaxe@crans.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.254, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list : STM32VLDISCOVERY" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xT7AlPCD8PEZ

On 17/06/2021 18.56, Alexandre Iooss wrote:
> New mini-kernel test for STM32VLDISCOVERY USART1.
> 
> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
> ---
>   tests/qtest/boot-serial-test.c | 37 ++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
> index d40adddafa..96849cec91 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -94,6 +94,41 @@ static const uint8_t kernel_nrf51[] = {
>       0x1c, 0x25, 0x00, 0x40                  /* 0x4000251c = UART TXD */
>   };
>   
> +static const uint8_t kernel_stm32vldiscovery[] = {
> +    0x00, 0x00, 0x00, 0x00,                 /* Stack top address */
> +    0x1d, 0x00, 0x00, 0x00,                 /* Reset handler address */
> +    0x00, 0x00, 0x00, 0x00,                 /* NMI */
> +    0x00, 0x00, 0x00, 0x00,                 /* Hard fault */
> +    0x00, 0x00, 0x00, 0x00,                 /* Memory management fault */
> +    0x00, 0x00, 0x00, 0x00,                 /* Bus fault */
> +    0x00, 0x00, 0x00, 0x00,                 /* Usage fault */
> +    0x0b, 0x4b,                             /* ldr  r3, [pc, #44] Get RCC */
> +    0x44, 0xf2, 0x04, 0x02,                 /* movw r2, #16388 */
> +    0x1a, 0x60,                             /* str  r2, [r3] */
> +    0x0a, 0x4b,                             /* ldr  r3, [pc, #40] Get GPIOA */
> +    0x1a, 0x68,                             /* ldr  r2, [r3] */
> +    0x22, 0xf0, 0xf0, 0x02,                 /* bic  r2, r2, #240 */
> +    0x1a, 0x60,                             /* str  r2, [r3] */
> +    0x1a, 0x68,                             /* ldr  r2, [r3] */
> +    0x42, 0xf0, 0xb0, 0x02,                 /* orr  r2, r2, #176 */
> +    0x1a, 0x60,                             /* str  r2, [r3] */
> +    0x07, 0x4b,                             /* ldr  r3, [pc, #26] Get BAUD */
> +    0x45, 0x22,                             /* movs r2, #69 */
> +    0x1a, 0x60,                             /* str  r2, [r3] */
> +    0x06, 0x4b,                             /* ldr  r3, [pc, #24] Get ENABLE */
> +    0x42, 0xf2, 0x08, 0x02,                 /* movw r2, #8200 */
> +    0x1a, 0x60,                             /* str  r2, [r3] */
> +    0x05, 0x4b,                             /* ldr  r3, [pc, #20] Get TXD */
> +    0x54, 0x22,                             /* movs r2, 'T' */
> +    0x1a, 0x60,                             /* str  r2, [r3] */
> +    0xfe, 0xe7,                             /* b    . */
> +    0x18, 0x10, 0x02, 0x40,                 /* 0x40021018 = RCC */
> +    0x04, 0x08, 0x01, 0x40,                 /* 0x40010804 = GPIOA */
> +    0x08, 0x38, 0x01, 0x40,                 /* 0x40013808 = USART1 BAUD */
> +    0x0c, 0x38, 0x01, 0x40,                 /* 0x4001380c = USART1 ENABLE */
> +    0x04, 0x38, 0x01, 0x40                  /* 0x40013804 = USART1 TXD */
> +};
> +
>   typedef struct testdef {
>       const char *arch;       /* Target architecture */
>       const char *machine;    /* Name of the machine */
> @@ -144,6 +179,8 @@ static testdef_t tests[] = {
>       { "aarch64", "virt", "-cpu max", "TT", sizeof(kernel_aarch64),
>         kernel_aarch64 },
>       { "arm", "microbit", "", "T", sizeof(kernel_nrf51), kernel_nrf51 },
> +    { "arm", "stm32vldiscovery", "", "T",
> +      sizeof(kernel_stm32vldiscovery), kernel_stm32vldiscovery },
>   
>       { NULL }
>   };
> 

Acked-by: Thomas Huth <thuth@redhat.com>

