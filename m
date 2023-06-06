Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3382763ejb;
        Tue, 6 Jun 2023 03:20:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5acnFBi7TZ4l1cinPhHI27lVRhUA0I5x8pj5K7T7RfK5M/W7FyFoU9vLOyL9aGwBaoP1eK
X-Received: by 2002:a05:622a:1a9e:b0:3f6:af78:de13 with SMTP id s30-20020a05622a1a9e00b003f6af78de13mr1572033qtc.18.1686046807338;
        Tue, 06 Jun 2023 03:20:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686046807; cv=none;
        d=google.com; s=arc-20160816;
        b=Ey8uBhwrviu8SeRdwPnrIrCWC6HX2CTrjXmR1Dc/QRU3jvFCoh/42z+fyHZNYtb5SO
         AcXDbHLqX9a5omYATSg4XiB/p65VQigujH6txi+AnyMXJgJU3az06BqAcPErEwoE9IFc
         N0kJhSxis6DtTjF0Hm+FZTC7ySM9oPssIBoVldVvU/4BUHtsrpz7rEwBa363HCL715oO
         8iIYH0J3QtnqKvPxRrEiz3bNNmCnICVVMnzlSSE3b0mXaC3SOYtKtJGkSdP0oPBqJAba
         ullqr+m/t6AWFSHry0w4NOU/GIdIYLLk+KkosVFxFyYpsRJLb8WoEjrgs93rJq8kz3wG
         KaIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZDj0tonTL4+3tYRmEMsaTv/xWQn5lUJWkT6rfRidSOs=;
        b=leFJ0lkXQyHXcSqvKQWplyQ+y5gn84jjpkhdDoidNex0ZX9psBN42PjucWnUzOfDwP
         l/pj8cFHDsXZDNUnQZeVZCRlTEyfXVxRi6AmiaqzQRkWfjCGrucTzy1LWkcMNyn5JuEX
         fMRZCm4okuu65j8JN1ZoWvRrYWSxCNbYUgsCUt70caxcyR+DKknD2bN/p/ZFiVdKuuwP
         EkFel7X5WmxLD0pCJIIdFTwDMJsSF1igCGChM0uK3P0SFlC3tfEFWODQ1lZqgu3947QE
         h5ms2TBU9w+OS4jYSR990i+tc3GNGFBxzhFGwhR9otq/MEUcq3kPlbSYZ0XYGwOo7+ZL
         Pc8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n8vF5zqh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3-20020a05621421a300b0061ac2bf9f0dsi6098054qvc.435.2023.06.06.03.20.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 03:20:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n8vF5zqh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6TnC-0001Jt-FO; Tue, 06 Jun 2023 06:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q6Tn6-0001BB-V0
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 06:19:55 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q6Tn5-0007WL-1X
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 06:19:52 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f62722d661so2900905e87.2
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 03:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686046784; x=1688638784;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ZDj0tonTL4+3tYRmEMsaTv/xWQn5lUJWkT6rfRidSOs=;
 b=n8vF5zqhxp5dmaKT43ThHU8hJPbr/Nw8SQQrFNNZGuKfG/UoN9jBp2xMd8fbSh3+JN
 wRCj5c75+aFDt5A836i6TBGX3ZzB8cia6qRlUTQeUJqStUe4Kz7ajQCu8daNYYW8UND+
 SwILAtypKQgRrkHNzwFNSzq0pYVGC6+T7yBfNbH294up9LNN/l6FZGyxCxRXb9lSU/Ob
 vvzc13cuAR0JUPuumAXk+gpXReccpbmTsUoLCSy7MGvTw1j0veNqG0AMKYv5/XBn/v0m
 xJIqCd4xkmscxASG7AzumM0Ff4Qc8SiPFguCUSNyBQYUhBg3uLV7w1qxBt6wFwJNluuR
 NDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686046784; x=1688638784;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZDj0tonTL4+3tYRmEMsaTv/xWQn5lUJWkT6rfRidSOs=;
 b=dLle2+gkogW9ogEvsMamAfZ8e+0cmD4gqwejJX0W4WiUrcnqUDKt1VMdUARXiAgnn/
 Wuffa4V8D/rcNTXu2HwjtbTEHOOK1JtoE+Q78XgEpUgNM70FOt76ixT6tVd0Jk40oi/E
 2ePPj5pRv59dxseTwR7Nid1x2DRAd5l9DbX1EVoQn2yaGoPwCDuVaZQD1bbNcn/WZx/z
 yGb0rdF55r5FVhRVxRGe+YLhFq6ybzQyY1ukyhYm8GBnBzNdj9RZw/3F0CTmPgo2Rf0i
 TPOni8gwBoKyIHGlPqoM9Q8cDFVRx46H1J+GrY+WaqyFPU2rc4+nWM+/4WLf7nLDLAey
 g+ug==
X-Gm-Message-State: AC+VfDy5wCQ7k8l6uVrAtLMxHFdQCFezeelg/QO93qrl6rseEGIGzqNG
 enb1esGEZvFY3QrMHqXqktMXog==
X-Received: by 2002:ac2:47e6:0:b0:4f3:8196:80cb with SMTP id
 b6-20020ac247e6000000b004f3819680cbmr671711lfp.41.1686046784234; 
 Tue, 06 Jun 2023 03:19:44 -0700 (PDT)
Received: from [192.168.200.206] (83.21.93.182.ipv4.supernova.orange.pl.
 [83.21.93.182]) by smtp.gmail.com with ESMTPSA id
 u11-20020ac248ab000000b004e90dee5469sm1413437lfg.157.2023.06.06.03.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 03:19:43 -0700 (PDT)
Message-ID: <e150d65a-b529-a905-708e-c0bfb4ae68a8@linaro.org>
Date: Tue, 6 Jun 2023 12:19:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
Content-Language: pl-PL, en-GB, en-HK
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Yuquan Wang <wangyuquan1236@phytium.com.cn>, rad@semihalf.com,
 quic_llindhol@quicinc.com, chenbaozi@phytium.com.cn, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230605095536.117384-1-wangyuquan1236@phytium.com.cn>
 <20230605095536.117384-2-wangyuquan1236@phytium.com.cn>
 <1fc502fa-8363-5a5b-0697-f3001c7ab773@linaro.org>
 <CAFEAcA_sGtV3HFZHX1JapnE04UpOxxxWvwgApVVm7dMX7+A-uw@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CAFEAcA_sGtV3HFZHX1JapnE04UpOxxxWvwgApVVm7dMX7+A-uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lf1-x134.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: oNXVyKyafUue

W dniu 6.06.2023 o 12:04, Peter Maydell pisze:
> On Tue, 6 Jun 2023 at 10:47, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:
>>
>> W dniu 5.06.2023 o 11:55, Yuquan Wang pisze:
>>> The current sbsa-ref cannot use EHCI controller which is only
>>> able to do 32-bit DMA, since sbsa-ref doesn't have RAM below 4GB.
>>> Hence, this uses XHCI to provide a usb controller with 64-bit
>>> DMA capablity instead of EHCI.
>>>
>>> Signed-off-by: Yuquan Wang<wangyuquan1236@phytium.com.cn>
>>
>> Reviewed-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>>
>> Without EDK2 changes Linux behaves same way (no USB found), with EDK2
>> changes (EHCI->XHCI) Linux gets USB devices.
> 
> So it doesn't break (cause to crash) old EDK2 images? That's a
> pleasant surprise.

In both cases with not modified EDK2 Linux behaves the same:

ehci-platform LNRO0D20:00: Error: DMA mask configuration failed
ehci-platform: probe of LNRO0D20:00 failed with error -5


