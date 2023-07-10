Received: by 2002:a05:7022:629e:b0:68:46be:293d with SMTP id e30csp554672dle;
        Mon, 10 Jul 2023 01:15:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGbAZcdjUOI2Nb4zi3U8BHIh/xoA08NVXJ38GJfNqSydJ9iuTV/xJ8Rf5xfwPPwT91fwESx
X-Received: by 2002:a05:620a:28cd:b0:763:e942:f78a with SMTP id l13-20020a05620a28cd00b00763e942f78amr14260714qkp.32.1688976909590;
        Mon, 10 Jul 2023 01:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688976909; cv=none;
        d=google.com; s=arc-20160816;
        b=rwu748/8xUmUByFLbide1J41lQY5e5R9l24ICT+d0UL8aRBlzm4oFhejDZqUPecwJH
         VjDZwTtZz8Pb6sP9qC9zUuOLXjekjgOYI064E/rp6CnQ6qTpkaPkmRGJ9kFe2DVjDjqv
         zhX0YxzjjypBzc8sChX42dYMFxEGVpvZD8MGHFQu6D4xFeQjW5rsvSjTGE+DGRoPgBxp
         GAuDgy1i/Jv7sMOXU5gkT/ag9YOLsZhsxmngWSJv8kZ0Ojz17xtkCVDx3D/IA7VoamW4
         AlGE8fhfvUMdNmezyQb/DLXWZYMzTnKrqih5e3U1UA4NgavhYdYMYEUC4oog6RzYTUCz
         fN1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=T1lcUIdfSPQq+iuIgaHg/qar4exgjcyseHzvLWzhnjk=;
        fh=2Z+obaBksuYE7Qxupk7CTzUicq4MHU3CHKPRHf+vSy4=;
        b=CB9msp6x5q9M5IPqnDLjKDn7r2jeCk31Hq0HnC8IYVRiCDc6jXd9rgpxPSsQwxY7VO
         tdWn9rXAgW6obGzzX2g3vRQ3ZZusxyeQxA9bg6jzABDXQLF/TpQ0tEvz5EBscIL/IIRN
         h/eP+xg4Q2gTseDE/uCaFe/sJZgzx6ckNhNCG1hD4nAUPvzWidoVcYxZxaRV7j85+Oem
         cQHuIwQrmLx6Y37KYUmuz0GpThOEgd95qzeyQmJvXVi2rLr75ZoPRL3q1nDK8lebezPW
         qdtJCzEX0ZC9LbdlzBgZffAIhFbmVJDULg87ZZTKWaO1UdgjasJRaUaAewSEy5O5kY7a
         r7SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MvSOyOAP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1-20020a05620a290100b00767b973a761si3187103qkp.304.2023.07.10.01.15.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jul 2023 01:15:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MvSOyOAP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qIm2m-0002uE-4O; Mon, 10 Jul 2023 04:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qIm2k-0002rO-Je
 for qemu-arm@nongnu.org; Mon, 10 Jul 2023 04:14:50 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qIm2i-0000qr-2Y
 for qemu-arm@nongnu.org; Mon, 10 Jul 2023 04:14:50 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3143ccb0f75so4972989f8f.0
 for <qemu-arm@nongnu.org>; Mon, 10 Jul 2023 01:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688976886; x=1691568886;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T1lcUIdfSPQq+iuIgaHg/qar4exgjcyseHzvLWzhnjk=;
 b=MvSOyOAPdqW+ITb3O68ICovMYWQ3GNlgrjujbGGnltfWTOFM/L7SSWHoKnwRMi3SRi
 fg1OqOZWTOJdi1eYNqEqUZAk5h4JVae7esEsnYihhWNPZl9M677SuFWMjNDqlG0j3aQb
 dT/ji3XMiXfdYnwnFbfrlZorgpBYBn9NZV1HHcifXv8kJsbNIsgwEG67eHjHOx7f0zZ7
 Yn6p1+LFjExiHc8BkRkjd8W35CArEHUxWg3Kj+Kva11wnE6H3YESEdEMdCamTOPm9gIM
 merUcdaqaKRRxiqdTiKdBgfz7Uoef7yFwDzK31BQLUzmgK/vO8fh1TIh1WEtF3TthOuQ
 P6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688976886; x=1691568886;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T1lcUIdfSPQq+iuIgaHg/qar4exgjcyseHzvLWzhnjk=;
 b=GDdMmwD0VLEaJPcSHAWbBEHC1MBzHroq9TMOhGyPdfmYrh2sjesGLIH42cW0zMeiy9
 A5PB2yTJ/FzqYPf5qQMAVcpievY2aRC04Y7BdBX83fOCRzW9WdI84AJCfU636ROokDyk
 IdP9uWsZEetvHZ6IU29FCMbeX0KWGxdI/AumiaqP8LtyKBfLcEJAkni7mw/966PXxuyl
 whWXUUNUgXygW7G9bcyBoHmTxlhkozm2AoFlhB+zNV2iZ2sLBrXR/iP1CoMg66z0qzTj
 B96RrZFCudpyPI4Z9g2hpAismhTXU4b1iGB8dqD5ZCm9DIyEMRvA0P8R17l0q2vRzDcw
 rNxg==
X-Gm-Message-State: ABy/qLZ5hatOzpydB5CRVTN1/TD56C+0xIHb4lamRh3IZVh/BNin7foO
 eXNu7TPyNlA7MZI5BoLcC/qQeg==
X-Received: by 2002:a5d:6045:0:b0:314:52b4:cc38 with SMTP id
 j5-20020a5d6045000000b0031452b4cc38mr15997196wrt.52.1688976886325; 
 Mon, 10 Jul 2023 01:14:46 -0700 (PDT)
Received: from [192.168.8.133] ([148.252.133.210])
 by smtp.gmail.com with ESMTPSA id
 k15-20020adff5cf000000b00314398e4dd4sm11047068wrp.54.2023.07.10.01.14.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 01:14:45 -0700 (PDT)
Message-ID: <43d15316-fb7f-71b1-2f6d-a061c5a52b34@linaro.org>
Date: Mon, 10 Jul 2023 09:14:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: set 'slots' property of xhci
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>, rad@semihalf.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: quic_llindhol@quicinc.com, chenbaozi@phytium.com.cn
References: <20230710063750.473510-1-wangyuquan1236@phytium.com.cn>
 <20230710063750.473510-2-wangyuquan1236@phytium.com.cn>
 <6f7e7eb1-0837-58d4-1b6b-4f408150579e@linaro.org>
 <e3050d63-844e-31f7-511d-48d31279be44@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e3050d63-844e-31f7-511d-48d31279be44@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Z77/0y6NL9to

On 7/10/23 08:33, Marcin Juszkiewicz wrote:
> W dniu 10.07.2023 o 09:28, Richard Henderson pisze:
>>
>> hw/usb/hcd-xhci-nec.c:    DEFINE_PROP_UINT32("slots", XHCINecState, slots, XHCI_MAXSLOTS),
>> hw/usb/hcd-xhci-sysbus.c:    DEFINE_PROP_UINT32("slots", XHCISysbusState, xhci.numslots, 
>> XHCI_MAXSLOTS),
>>
>> The default is XCHI_MAXSLOTS, not 1.  So I can't see why you'd need this.
> 
> There are two systems using XHCI: i386/microvm and arm/sbsa. First
> one sets amount of slots already.
> 
> Without this patch Linux complains that there is only one port and
> refuses to connect second usb device:
> 
> xhci-hcd PNP0D10:00: Error while assigning device slot ID: No Slots Available Error
> xhci-hcd PNP0D10:00: Max number of devices this xHCI host supports is 1.
> usb usb1-port2: couldn't allocate usb_device
> 
> So it looks like default being XHCI_MAXSLOTS is not applied somewhere.

It looks like the problem is that we're performing init and realize in one step.  The 
defaults would be applied later, along with other properties from the command-line.

As this is the last full day before softfreeze, and we have many other instances of the 
same pattern, I'll give this an

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
