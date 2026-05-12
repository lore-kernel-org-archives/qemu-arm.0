Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DA3CD4F21
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 10:51:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMkhv-0003s6-1C; Tue, 12 May 2026 06:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wMkht-0003rI-4j
 for qemu-arm@nongnu.org; Tue, 12 May 2026 06:51:21 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wMkhr-0000YB-Kx
 for qemu-arm@nongnu.org; Tue, 12 May 2026 06:51:20 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48d102471a4so53293505e9.2
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 03:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778583078; x=1779187878; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZPbG27XBlYc6lQH65/69OCmIYvEee6QUFCLVhoOLQVQ=;
 b=Avuoa0WR2prtr2MVaRP5A8kNgUH+ERFNFbgjQ8XweG+EQZf6IOZO9/q8ufFlMooCSe
 6oZX+mktJPy5UoUjG2GrZWcvrye033reRHb8/iH6Z6dCG2NNaTpX+OxsnkSfFc1DkQq+
 JB/fOAHtb45lGzA8+78G5upj4wHoyhLxKpSW1CYmGfnrl0+PsLH5d/qrhkrBzTlFyytv
 gaBald585tQJK1/O+5q7P70OBrTPrdo9szgL4ZkJKBXT/3c9Vh6gwV9OjR9Q4u0wkmQQ
 qMgXS1ZkuYZDQNPLuKxr4ckc8M+lcFrm0I2inFe8dmqeHVivC4PfkT4uSAfqPwkc8heq
 PZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778583078; x=1779187878;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZPbG27XBlYc6lQH65/69OCmIYvEee6QUFCLVhoOLQVQ=;
 b=fVwlysJRK2CtZxpROnlh53WMHb69ty8B5k/un2nI8eIxIWugAUCo5VU5W8d0om/9vO
 8hPmKsr9rMH9MU7G7PHf3LUJebsetjrrSqLq3amYxVzx2+Po7uBo/YTaPLyNco+LPa94
 K3FuwVtr7DHT9Vw+d2A2ONVMJQAjU+bM2JkMNqi+ehc5KbQ8NGN/+pI5qU1+9i1KTEuy
 kVIPnLxTq88d5I88xUeY8+GjCIf+lmbNjwWGEqTqLJSCJwsiaXvo37lNGIglBUVVqpHV
 bWwOvIwSavMzHrvpKe8gvrA5rGa9SnPFDY85hHvwUKK1OOvbUdN9BGnUJmEpIedmTXCV
 O70Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8LnFMEolLmmeaFcas7fM8E+mVc+x9ZcFicVHPevVudBGVJobOKbMCxQWuEQAVnA9ay47PXWY7KGA==@nongnu.org
X-Gm-Message-State: AOJu0YzEghLd1mSqZOkdm69YW7w2Y/VAiMi8xyvo1vo0BwBOQS6uqCmf
 mFv2RHbSdlQm6YbTZJTJZZTPwJd7LtKq2YUaYYT8rs4TX9I1YLcMdVufnl4YnhyJGHc=
X-Gm-Gg: Acq92OGazHsUMAaw4eEuQLtFX/9+nkghEfgJ+fK0rR+yVtc08+k+a6/y8MwuGoPD458
 kHlV1E4RBjB5Ga2/SXNkcUmffjDJuUcd4pDrOF1qn+NsGfAkLUazQ99Mlrvh9YVK8I9D4hGQsmK
 H7NLY5VkToVsCRaaXjEZb339kX1WILfMV/jxW0EjIWoZdYaxto0oAzzhf33VdzzGaKBBuJcHkhh
 6OKGSjXDSZ1sqpKEQDYxUvHo9kfODI/kVmoG0uRq70C7a1CK8AV2rmUTWgdPDkU+45OkUoSsoz0
 KjUiPksQUUhZwYHvTPewbIoXYp4djX5Y25zvoIzhA/vz9RJvmRFCoOu07y70TvJ2BxzrMGM8Dt3
 EbJ7vKe6o7bvyNAdcVVw9QuonaT5ayfsDn1q+hpC7ffDxhoav0pTFYix+SZHjTJ28FVXqX4zZ40
 7DHIerwUgFtKBmRc/mYZQhUMKihLwMl8F4LtfqD4AuTq5MB8fZHWduxXdhBDz6LQmZ8g==
X-Received: by 2002:a05:600c:a30d:b0:48e:5d91:cfe3 with SMTP id
 5b1f17b1804b1-48e6748a72fmr191586555e9.1.1778583078128; 
 Tue, 12 May 2026 03:51:18 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e90536e18sm37357905e9.5.2026.05.12.03.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 03:51:17 -0700 (PDT)
Message-ID: <ea9a6a72-5ffa-46a1-b200-0c7c26944019@linaro.org>
Date: Tue, 12 May 2026 12:51:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] target/arm: GICv5 cpuif: Don't set HPPIV bit in
 GICv5PendingIrq::intid
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260512093856.3197700-1-peter.maydell@linaro.org>
 <20260512093856.3197700-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260512093856.3197700-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 12/5/26 11:38, Peter Maydell wrote:
> In gic_hppi() we return the current highest priority pending
> interrupt in a GICv5PendingIrq struct.  We try to set up the intid
> field of that struct to be the form that is used by the ICC_HPPIR
> register, which has a "valid" bit in bit 33.  Unfortunately the
> GICv5PendingIrq defines the intid field as a uint32_t, so Coverity
> points out that the bit doesn't actually fit.  Move the handling of
> the valid bit to the callsite, and make this function report "no
> pending interrupt" with GICv5PendingIrq::prio == PRIO_IDLE,
> consistently with how we use this struct in other places.
> 
> CID: 1659594
> Fixes: 9edad4ff3 ("target/arm: GICv5 cpuif: Implement ICC_HPPIR_EL1")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/intc/arm_gicv5_types.h |  2 ++
>   target/arm/tcg/gicv5-cpuif.c      | 18 ++++++++++--------
>   2 files changed, 12 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

