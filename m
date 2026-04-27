Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCF0FF8861
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 09:42:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHITQ-0000Qh-LD; Mon, 27 Apr 2026 05:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHITO-0000CE-Lv
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:41:50 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHITN-000324-6t
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:41:50 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso83487335e9.3
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 02:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777282908; x=1777887708; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9qBL0m3NYcXbunKk+ZDfMkPYLuNzIe/yFVC87ez3Jm4=;
 b=MY6xJuOxdFuO7VaeC72u0E5T2zOvsNCaesOeVY4UDUQW6lU2PmX8bDhMWYuLQ0dBDd
 u5OW94UXCmbuKwIaTjSNUfiz+x6qKHT1khO7zVMa1r17ipPCu0j6GArdZwyS4Y6ZYz33
 2vI3YGken5geihBw1a5835Buihdqb6mG7xpWhzm58lFImKG9YrJuGK50Gll7HdU/2yCr
 JWAdFGl6ncvJGgTx2IlYi3q6J/sYpUctiQHwZ3kxzECcEz25qJynE+d3TFSXNKRYTOAo
 J2k5j5Zmm8DURQ9oaN/uEjdTbph0GwxjumJ9H8Ly6SAmt6Vwws3EpPl+zW9J84oETcLl
 3KuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777282908; x=1777887708;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9qBL0m3NYcXbunKk+ZDfMkPYLuNzIe/yFVC87ez3Jm4=;
 b=AodviQedd2ek+gSdwHKk9EUrFA7o3qpxwrKDttjr3PwZuJngGMPortS6+uCJNSjxYy
 RkUGIQazx8Fio+w+a5fqILECbLxIWu/cBeoCgMALGx4PT1a0WOJGdsAuELDYb2IozUgR
 Nc4qFpN+76vasz+qc3zIpWN8Dvd73jAJJClKga9LJXh/cHqjXpUXLaZZyxsL7LmF0sxf
 VvWw0tsNmn30uOJCBLwtNj1duD3xgtpdIlV/KMjpTUzTzrECQnKstNYyeKh2y2IKX/iD
 tu0ZRGkndjOHlC1Dfri7JIUkmSj8M74/PF/sOIDwPdg5gYcKHWwc3JmD0vpE2FWEEFya
 nOtw==
X-Gm-Message-State: AOJu0YxMzHsvz07mrW0CRDOdcQkAPDx7AJddHU0qvH4BFwlhuuC3HI1A
 zSLGwMmze8lvZnOnIkSpF65UcrQQeZ6Gsys4N40sih967lRExVfn6RLkwQ0WtK86xxo=
X-Gm-Gg: AeBDietzbmi0SpsjRp2N+Si/Gig4GCCRaE7BcmGRtu5KLxx1O8Y9t6OhW/gSGkWlmsN
 ab/Td4Z7UDkY1Kq+eFQDTKtQZmxAHNL+7sspJktstruFOzWw9GtqR2Y+qRh2RUPknosYb5T1QGw
 DU9cnChP7X9TmSREUmzA/IPCdatW4axyIguMYMYV+tFkmzsiLzcvmdvND/Kz8eNEffmE25vMENM
 qE8qAZLAoflLuam6aqF8BAyPCH39Qk/DvPWYdUDR2+CmMoU8Rfc3zQGa07e6DQ55EMuBekbEzzp
 i8ElmJk6dPWlILdnWHgEEywbUnKhS31XRjwe6Imof7oksQtSjpUYySpp90VRMdtSk9jpCgHgaJt
 /Mp7suUGjR0vpxmnc6J7PElGqjO2c+tGcx8EAYb0etZHn1b1D6pk1u+yXGaBerY/5vLSUfCV2/Y
 w1uJIXcpHEiVvDydj4LGOIJtnkknF5G2CFh3EceaYp1IlqBhA4rcBwDZMRettL/A4Dr5qp8lQsX
 /+nBz95BXntQ4A=
X-Received: by 2002:a05:600c:890c:b0:485:3ff1:d5ed with SMTP id
 5b1f17b1804b1-488fb739cd9mr496739595e9.1.1777282907600; 
 Mon, 27 Apr 2026 02:41:47 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb74c7a2sm246789995e9.1.2026.04.27.02.41.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 02:41:46 -0700 (PDT)
Message-ID: <c3d78266-458b-452b-a261-71d2204fbea4@linaro.org>
Date: Mon, 27 Apr 2026 11:41:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/84] fpu: Drop parts_muladd_scalbn
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 26/4/26 15:38, Richard Henderson wrote:
> Use parts{64,128}_muladd_scalbn at each call site.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 28 +++++++++-------------------
>   1 file changed, 9 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

