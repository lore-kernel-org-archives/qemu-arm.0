Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp625441ejt;
        Thu, 15 Jun 2023 03:25:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5gJn6YYzc1M9k8bf8jpAhiwCY5qpXCD07nfC45jKz0jUqFTkSfhkdTuxr+3HmxSh+5FIt0
X-Received: by 2002:a05:6214:d6c:b0:626:1e4e:b5b7 with SMTP id 12-20020a0562140d6c00b006261e4eb5b7mr19854555qvs.59.1686824724944;
        Thu, 15 Jun 2023 03:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686824724; cv=none;
        d=google.com; s=arc-20160816;
        b=JQeQBLwJMUojEzMs24Iecd89YFWRY5Kd9ZNZXQ0YWl27s7Yz5JZnbDe4F5i+1+jlIR
         wJ2ttcZZzPYQmKRJsQGLSHzHP9hiO6sp6U4+mzD152upkLGYACIIZ9GgYnXxSkASUBja
         PNOkDL0ldGGBupq88ChXvH9tqLQ5HlYmS+nxRzmFtA8PX2oPBMrdlrN9z8s6EQqvYuaU
         rFX0Sgg8T2kXMbgY4JAgAz7muTPOTQrqJi672YTpeGrpd9tft+p3UEqFugs8EbTOPxWY
         DTZrOmLwzrvawomX9dNID5Mu6T9FCQonfTsRe1qSAkDsb2rmbxi6wPlREFcywK0TrHcm
         xNiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ft2Mh9fiIf5GfqCvoGdPnZrt5zD3PwtSMKH21zHeixA=;
        b=x0tMbbQY/nlba7WL/0TTYrS1RHL4vjlL34GqlofNdc25DrhodS1G2uLe8GKiZMs4wV
         Iwt+yOuo+PDPXYomE6tjfcDsHyaTRGMWF4cIq59T7hjsza5al3+2E9QHIFYB8jFA5vKk
         uNqtHrZodQcDPTMcjxPFsTaKEGeyoc7Rtjd3QT3RJsVL0HEyL6ahnp8Uq6xm7YztP4lQ
         eJaGjPimjIhZyjy/pFriu9ePiEIt72vetXe5JcVlN9mTk4F3J/6+R8wb0iiH34ot+Oxt
         UWZphpLIbvxrc5TSmVS46ie6yxnM9mm5r/xLVqNHofh2ves79h12QgBDPKgyNiBWPjwI
         6TEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OSp0fRFJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020a05621420ee00b006262e2d208asi9326273qvk.534.2023.06.15.03.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Jun 2023 03:25:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OSp0fRFJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9kAH-0000a0-7N; Thu, 15 Jun 2023 06:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q9kAE-0000ZX-Kw
 for qemu-arm@nongnu.org; Thu, 15 Jun 2023 06:25:14 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q9kAB-0007if-WD
 for qemu-arm@nongnu.org; Thu, 15 Jun 2023 06:25:14 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9828a7a39d1so159431366b.0
 for <qemu-arm@nongnu.org>; Thu, 15 Jun 2023 03:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686824710; x=1689416710;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ft2Mh9fiIf5GfqCvoGdPnZrt5zD3PwtSMKH21zHeixA=;
 b=OSp0fRFJIyR4sQVwsLL6hfE94Ef3NtA2V2mR0/lthfFpt4KpMTqoSwqdsvX6aJpwxi
 01unJr/B+e+qaiMPENK7psU9YqH9/BG1JJZGrCmoJ0ge4Y4cEa5ysy0rvtHRHRvJEEdR
 o6MoER0e+Vx3+rWeuzn6hBrcIPTNAf9Xf6E9oidMHBjZU3eqGezran/+BAcmQMd4Wour
 1uwKmBVlKY9Yy0A9u3WRyjPTC9UEj8WMJXqDjUXB2fRD60UkEKs/UcCNCjPUued3rP6O
 BP1HqbWQMgaj8n0IOdSe289bOJ7sSJU1xbCUCYe15sK4ryvQ1sf3cSdlfvD3eGzhny9B
 Q1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686824710; x=1689416710;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ft2Mh9fiIf5GfqCvoGdPnZrt5zD3PwtSMKH21zHeixA=;
 b=QGAwpa26K3xph/yFdMb0sDauaaLBFsEl+hsgeq891ed6QFSplrx259YEmf9m7dTQVB
 cGIZ33M/2DkJn7f5yDfC10Xo17Q2twIL0Ni0eW5HrMixMBQke+HxETEPCo81Ut14SQdV
 E0DCxIYfprf78GSJBCxZQIJkEEHxi/o9n1jjBep2Kh36hvrKqVF0WBD6peH5yRiIpMPy
 mOyTJPiZ/0ZUvpHBLLhgLLLmMbK0eZE/rfsjbww3M/TElYdZjhrwbdKduCn7pCCaXViJ
 C6UBkz+QLJxp8dEdbeRogrpVtUzwj93s52kykI6O3U4Bk4wJLMTTriE3FaWrEyNoX7tS
 4llQ==
X-Gm-Message-State: AC+VfDwtjvVjFXSCw9vb5fKmoGJ440AcxJCZ9lhsqxJ1jXw12+PzHkUi
 WyLvjiVYF2s8W0DweBxZLREzDQ==
X-Received: by 2002:a17:907:9309:b0:96a:861:a2ac with SMTP id
 bu9-20020a170907930900b0096a0861a2acmr17036228ejc.0.1686824710415; 
 Thu, 15 Jun 2023 03:25:10 -0700 (PDT)
Received: from [10.14.201.118] ([213.175.39.66])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a170906140e00b009786ae9ed50sm9146240ejc.194.2023.06.15.03.25.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jun 2023 03:25:09 -0700 (PDT)
Message-ID: <580b6ade-fb79-870b-eefa-5c0f0acfa7cd@linaro.org>
Date: Thu, 15 Jun 2023 12:25:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v2] imx_serial: set wake bit when we receive a data byte
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230608154129.133169-1-martin@kaiser.cx>
 <20230615093054.1084972-1-martin@kaiser.cx>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230615093054.1084972-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: O+z905Asw72U

On 15/6/23 11:30, Martin Kaiser wrote:
> The linux kernel added a flood check for rx data recently in commmit

"Linux", "commit"

Also maybe s/rx/RX/ s/uart/UART/.

> 496a4471b7c3 ("serial: imx: work-around for hardware RX flood"). This
> check uses the wake bit in the uart status register 2. The wake bit
> indicates that the receiver detected a start bit on the rx line. If the
> kernel sees a number of rx interrupts without the wake bit being set, it
> treats this as spurious data and resets the uart port. imx_serial does
> never set the wake bit and triggers the kernel's flood check.
> 
> This patch adds support for the wake bit. wake is set when we receive a
> new character (it's not set for break events). It seems that wake is
> cleared by the kernel driver, the hardware does not have to clear it
> automatically after data was read.
> 
> The wake bit can be configured as an interrupt source. Support this
> mechanism as well.
> 
> Co-developed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks ;)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> v2:
>   - support interrupts from wake
>   - clean up the commit message
> 
>   hw/char/imx_serial.c         | 5 ++++-
>   include/hw/char/imx_serial.h | 1 +
>   2 files changed, 5 insertions(+), 1 deletion(-)

