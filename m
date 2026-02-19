Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DD6E9A048
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 15:17:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt5lu-0000eL-IL; Thu, 19 Feb 2026 10:16:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vt5lt-0000dK-2M
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 10:16:53 -0500
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vt5lr-0000E6-4R
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 10:16:52 -0500
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-5fdecf69a29so545550137.3
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 07:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771514210; x=1772119010; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OdxS+KAgzoWoqzWifAT2T6h5+gH+/G9qhe8dIL9Dfdo=;
 b=tRod0K7aKJZcp8yZB1VLVgaDKg/BFE03yJBIcrtzRR2+Cq7ZiSulswfhP8unFRYUlC
 Les0yWJyZ708VXJdLAI/VBoH2wlTnXRI9rVDx47yTm1v+pxXxTFtPAi826PtiY1D7RKI
 Kcu1opReQ5X0ITr/2TsCajyImTenQVLTGgtlgVQuMw7DK3UV5O+i+qG9ChKFlmJRvwjZ
 MhYI3XbZ7Zjh4cvG+2WEQnzYXfaY4FJTLK8jUe/I1OHNWHm65/xm45TIsuvdLv2CpM4m
 z62jb3XdOB4PqXFrgF69jjuO2eO/VDGQEGv354zKK+PrUnrl8LX8WB9MDsSkqyfBRbkC
 bbZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771514210; x=1772119010;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OdxS+KAgzoWoqzWifAT2T6h5+gH+/G9qhe8dIL9Dfdo=;
 b=EIwDr4bgLcsp9ZrxmSH9uDa0hCTMme56Z1XXx1MeJvfu1rbb7XM4QVxPmBI/9uCkFK
 WPHOLGBc/xrCKOEgRW0M7/YXWMp6qQ9TltZs74FqWe34ltRL3D/JL6UBtxLoS8oAIWal
 KHSFlWgkKpwf4kGAF5knfYjJcjWKp19toH9vc5f4lLs4w9Y+MX8Qcd0jif9phfE6Yvlm
 02y2fe4C/gCE5rs7qt6sKPrxVIp6UW+xWmVAVLZGy5m72TJAM4ofMMkRPS+sOBn8iZ7P
 jloT84AI8td86MxcvFHnwkjaJYopEUaX1vuQgthCB/JSjWNfTJwC997QPLQQG2MhuTp+
 3AYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhc1zDlUaxhU2H1yHb1PqS8NqxfUX2aUcMYFRvM0CXaeFp49JG5eHn3WAgTxR+B0UrwtI2xPFEHA==@nongnu.org
X-Gm-Message-State: AOJu0YzIRSY4+KX02N3VDNt5FFlweOesIHz7M+atsG/Wu644rdjKlp/e
 ek3mPaxDtlMnRWT5JjmRgPWABG8srfa16PGseRLtcULeoLVO/cCIA2kHMxRcjVQ+3m4=
X-Gm-Gg: AZuq6aI/DktuMwTCOTLZXLQie1kD7VHuojd+bhw/SCyqf0UoIm2WvHgm10fdIw/PbZZ
 lrhCNysn1ELxax8GG942UrVto6QPoaEbUWQRfU62BFyQeaIr8Tm9t62UeZFO883ebkK2Wpxh7M6
 6/FVy1PPF7fbfw7QoGKdT/S/Ut3iSsRuyDKfOO/QYzTm+TqMoMswwcFNyqc6A2nOZdZiPuw/U+U
 ZWvJibGWEv7IM9C7q6J5lf+l5SjvyJO2tNvlWfDhKjA3AvllhZsOTwplt2xTEwXpEISeWFgafUp
 8dGMVYl1//ofpZ+ibsdrV7Nh4s6RsGJHYbvEQuEJPvVTCqtC1ezLtoBFIZQ9u436+2XQkzFTzzQ
 1hPcCAgyA4AAJzuF1/xFOPmOuk+S3dIeLU+fi/zHrCXU6t8VtQBDYbS128AKze+NofbimtxLSRV
 srQFOWHcPAMfuEstRAqMaprVITsxSgWXvMvKzUPDSj/w0F4vCRtPK48wHTz3PNxJYtbthUDzWaM
 2Wxc048V+v4JQ==
X-Received: by 2002:a05:6102:c87:b0:5fd:d831:2938 with SMTP id
 ada2fe7eead31-5fe1add55f8mr8935051137.22.1771514209620; 
 Thu, 19 Feb 2026 07:16:49 -0800 (PST)
Received: from [192.168.0.103] (200-100-75-206.dial-up.telesp.net.br.
 [200.100.75.206]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5fde8a845ddsm13306297137.10.2026.02.19.07.16.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 07:16:49 -0800 (PST)
Message-ID: <00bed3eb-579b-4153-9bc1-07347a5d0792@linaro.org>
Date: Thu, 19 Feb 2026 12:16:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm/ptw: Clean up unused ARMMMUIdx
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 alex.bennee@linaro.org
References: <20260219140228.407513-1-gustavo.romero@linaro.org>
 <CAFEAcA_GdkVJbgGm2j8v15PM2ijKF2hYBAUKZ2_W=g6XasFvCA@mail.gmail.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <CAFEAcA_GdkVJbgGm2j8v15PM2ijKF2hYBAUKZ2_W=g6XasFvCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vs1-xe2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Peter!

On 2/19/26 11:13, Peter Maydell wrote:
> On Thu, 19 Feb 2026 at 14:02, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>>
>> get_phys_addr_disabled() is called from only one function,
>> get_phys_addr_nogpc(), and from two locations within it.
>>
>> The first call to get_phys_addr_disabled() occurs when mmu_idx is one of
>> the following: ARMMMUIdx_Phys_S, ARMMMUIdx_Phys_NS, ARMMMUIdx_Phys_Root,
>> or ARMMMUIdx_Phys_Realm. So, handling ARMMMUIdx_Stage2 or
>> ARMMMUIdx_Stage2_S is not required in get_phys_addr_disabled() for this
>> case.
>>
>> The second call to get_phys_addr_disabled(), with mmu_idx ==
>> ARMMMUIdx_Stage2 (or ARMMMUIdx_Stage2_S), only would occur if
>> regime_translation_disabled() returns
>> true for these mmu indexes. However, mmu_idx == ARMMMUIdx_Stage2 (or
>> ARMMMUIdx_Stage2_S) can only occur if get_phys_addr_twostage() was
>> called, since it's the only place where ptw->in_mmu_idx is set to
>> ARMMMUIdx_Stage2 (or ARMMMUIdx_Stage2_S) and that only happens if
>> regime_translation_disabled() returns false.
> 
> This is true, but only because we never call get_phys_addr_for_at()
> with an mmu_idx argument of Stage2, right?

Correct, and that's a case that will never exist too afaics.


Cheers,
Gustavo

