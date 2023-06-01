Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp503542ejb;
        Thu, 1 Jun 2023 07:51:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7BNxEwzqnLN3CdC487HcJiJk4R1g4EgKpAvJjxky/HI/EDqxtrSrWik7lJa5s63qJn7dzI
X-Received: by 2002:ad4:596f:0:b0:626:1db8:de49 with SMTP id eq15-20020ad4596f000000b006261db8de49mr8800324qvb.32.1685631081075;
        Thu, 01 Jun 2023 07:51:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685631081; cv=none;
        d=google.com; s=arc-20160816;
        b=zLpCGKAeoTKfa2iNW9Ode+GisLrtpGITp10tvvoSBZB+NxETCS7hcxvYmIUyx6HwnJ
         eoUFmIWHvvpeMuyYBcBRVhwasYgHuFbtUu4BY4xenKg0clH1GKKKV3347fwS0BYSO/Pi
         fSjLG5X4g4yjyoUCKR2Nt1l3YebxhvteOrtddkvBH63b3LyC8umHsX3ikTVSEf5W69q2
         j2PcM76D4y9DWhZbcYngqoNETIucqn8hw474pukkee0gEQavmRQdhPuU9yn9x1x0LV86
         sGSdrPg6L9x7qv5X5S8TZpiBFCATbvb7NWqaawOEIO0raWwbpWcUuZ7lo9nOLOQni7Bd
         XUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ADxdaf120RRlsuYU+GFR6xzszWSZcLsh+bs1NIJtiZw=;
        b=jgfLnKY+xRgOE4D3zQHXZC/ilMkbndMs0oP1xbKFhsWvR+Obeoi0eGWC3edvivYhDr
         c1UMaGeLvKVzQV4HvqWKIucFBy8hffPGJzFmXrJtrH6IHRY0lh9Ti/5FPHnL3p9VYi9V
         92TIgl4sGfluifpVfWGbp97OVwz2jW8ua65KxVkB6NyMA6xN63nohTqP4ioauRvq9HJ7
         zozVCGW3RMFsIPROI6fCW5InAwmITiK8klMlrtNP2Og+6Dq0pPa0ivG8c5WIyWm9bCAm
         iYa3e7YE9PqCbT1Wg1JqvuWqRpWynKovIjkVxrn8d4Ts1KHHc18DuGohhsWJHH4n2kIH
         88vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ftZjAb19;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey3-20020a0562140b6300b00621257f084csi9535146qvb.156.2023.06.01.07.51.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 07:51:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ftZjAb19;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4jdp-0000lu-Ex; Thu, 01 Jun 2023 10:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q4jdn-0000lO-RL
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 10:51:03 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q4jdl-0004iU-RY
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 10:51:03 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1b03b9f02b4so4098565ad.3
 for <qemu-arm@nongnu.org>; Thu, 01 Jun 2023 07:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685631060; x=1688223060;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ADxdaf120RRlsuYU+GFR6xzszWSZcLsh+bs1NIJtiZw=;
 b=ftZjAb19b1kNiKDdGuXw+lI92CqzGBxB3eU9Q6SqKSJbLWZdqczd6QlxWyqaS5EdXf
 0LYB+cEixM55o8XK/N9MB4MYryHgvhNfyMHO8pJLgMsTSr4oZDd/tD2AmPHBROcAPf95
 lOdLScRXpY/t6FTjTaCybSAguY2vaB6a8FMx4VbHkcL3Ut5AwnNmn6rj/FTxBfXgS5rR
 +uUiJrh9uqUS3QsVJocFXIFdclNyLRc2fDdZ64rMXQS2P4zwj4e7b0chtpzNoD2HFm1r
 5hTOdZljBcsv+9IVTpJEf7yLk9ZBSZiUypGiUVDQbBzSu+MbtK5uLjiJdM+n0Lbyfc8H
 N4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685631060; x=1688223060;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ADxdaf120RRlsuYU+GFR6xzszWSZcLsh+bs1NIJtiZw=;
 b=GRr2/qd1Lv+eRpf2AKpn79UTEpnwudU98a0NDg/inz8qpC0uamZXePcPKKEC2ObXbb
 tWKgOE/wXrjhjmxTiQtw5RnsiLwI+Phe+nkIG73ksRCT90BXNLh3uGVnYmEf0TSesD8Z
 CkaFScIotSZMQKoTUa5TOL+iFrXr9Y42yJ/XJOUHP4sGJjck/sfZQCy7JQEApFU9q7J7
 YVHwqbKaea+9Y3spwMh1SgvRGu01wtGlsNwZwHzho0IoRygzRBBMC7f2pyWJrIW+QetL
 XoMOIVWzpT1PB+ln+kSNy2LhG/53A3FK9aHoOSLUn/ED0ztQbseXbeNAWN9Ov1Jd5UD9
 j3xQ==
X-Gm-Message-State: AC+VfDxTevFaA7fyPjQ3um3hPPa9N9jrCYQluqcWBnsCN+ZWBF/hxHNx
 Bb7JRkar0FqtoDsfmQ4Sxo0PEg==
X-Received: by 2002:a17:902:e5c2:b0:1ab:63e:67b0 with SMTP id
 u2-20020a170902e5c200b001ab063e67b0mr6685308plf.54.1685631060318; 
 Thu, 01 Jun 2023 07:51:00 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:c935:f07f:4b59:7091?
 ([2602:ae:1598:4c01:c935:f07f:4b59:7091])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a170902d31500b001a221d14179sm3556135plc.302.2023.06.01.07.50.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 07:50:59 -0700 (PDT)
Message-ID: <392a7a42-bf1d-c9c6-4e11-2ff68036dd10@linaro.org>
Date: Thu, 1 Jun 2023 07:50:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/1] hw/arm/sbsa-ref: add XHCI controller on PCIe
Content-Language: en-US
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>, rad@semihalf.com,
 peter.maydell@linaro.org
Cc: quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230601063737.464751-1-wangyuquan1236@phytium.com.cn>
 <20230601063737.464751-2-wangyuquan1236@phytium.com.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230601063737.464751-2-wangyuquan1236@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.1,
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
X-TUID: WXBlfagmYoll

On 5/31/23 23:37, Yuquan Wang wrote:
> The current sbsa-ref cannot use EHCI controller which is only
> able to do 32-bit DMA, since sbsa-ref doesn't have RAM below 4GB.
> Hence, this add an XHCI on PCIe to provide a usb controller with 64-bit
> DMA capablity.
> 
> Signed-off-by: Yuquan Wang <wangyuquan1236@phytium.com.cn>
> ---
>   hw/arm/sbsa-ref.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index de21200ff9..a33cd80d69 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -668,6 +668,8 @@ static void create_pcie(SBSAMachineState *sms)
>   
>       pci_create_simple(pci->bus, -1, "bochs-display");
>   
> +    pci_create_simple(pci->bus, -1, "qemu-xhci");

Better to use TYPE_QEMU_XHCI.
Need to remove the EHCI controler.


r~
