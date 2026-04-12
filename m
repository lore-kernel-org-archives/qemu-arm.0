Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FA0E93805
	for <qemu-arm@archiver.kernel.org>; Sun, 12 Apr 2026 20:35:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wC1WB-0006lw-FF; Sun, 12 Apr 2026 16:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wC1WA-0006lm-Pt
 for qemu-arm@nongnu.org; Sun, 12 Apr 2026 16:34:54 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wC1W9-0000iz-4Q
 for qemu-arm@nongnu.org; Sun, 12 Apr 2026 16:34:54 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso29595715e9.0
 for <qemu-arm@nongnu.org>; Sun, 12 Apr 2026 13:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776026090; x=1776630890; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D2X2yQawK2yED/vm9MPrBI+GUdhWyI8d2KdgH0FLPf4=;
 b=CInZytZSOVD6OkuRiEyO/YkLc2XClFrG0OOrDgNyXqRQOcQNDRxbFFFRFUGj+ZKb39
 ZfHq0mhoUB88frBSTfPT+S2mIxr9sdpGuvhFC+7zq+jujyGuYyULbKfzX+17A9OoYn0o
 Ixij91+EZYgHaHgb2x1yBXLPBsz/YZUWZXKeSIIl6Fn/SL/8BGNAlWcMl/Mf0HdHCUnC
 34sgP/1m0YlvQzRk+64AiQZf5LqAlowbpALKRvCVAW9M9ulv5gXqI1o7b9jK4Z30HM8+
 TfIQGF4cithV2S3Qrf9Lt6Yg4+hwhkV6DmLEgpsJyqF19KUgP+BaQCUoXtSKA8EMWxqJ
 D1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776026090; x=1776630890;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D2X2yQawK2yED/vm9MPrBI+GUdhWyI8d2KdgH0FLPf4=;
 b=jl/iSdRrOXWybv27NmKfhJXnz4o6Ibs3lEauAOJKXgLwDQIuMWOdAoMiQByq9Q6et8
 sm9lWpkQv421IGWJAphekzdMKTbqXXNSCwkVHbR8Eh3SAsKyEJjf8r3cWAz1o6ogsPtZ
 VsCkbPEBMOgJ/B2k4rpxNj3holt5HDCmGVxd2hwQqC6UKEwEJ0aZeDK7jV9YpEe42/1V
 TgzGvOSR8PbupX+q/38+5yStqyZElIl3oX8FdOHS6HS6OfRinvpE5dXhSYgisxhTt+To
 jBo0YI03ra0lh+lZJ5EPDl6nasuZgPjSxM4lGsAZSpcalG19NN44KcWpmV1UOhqMxCxW
 Fj2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXnOBjt/FZCJ3bH/zJ+tlpE10XmCOU2rQ6T2OYf8J+QYJXvMRt8O3NmPOdoHps30eQKbE4feCOQw==@nongnu.org
X-Gm-Message-State: AOJu0Yyk1WUoF5WjayVj6n1O+oG4rJRZWIAIfmVFeqpvesZ4atq7Ml1K
 0Zibt6TDQ+COAQpEiY4ovKxldga/xAzC8/FNmt/36GtA8Bbe1hwl8AH/27jlrEoFgCk=
X-Gm-Gg: AeBDievSr4+KD01ui0LgTzIU9a0RqWmOChjei3IAFyKTy/DB/VLA74hVt79Y3roKoXr
 bJMfhxqbVvLB+SEQf0Y0ZYbHeCEpBiaVn1QtKHNCxHMTw581SbVJ1+WOQq3mCIeozN8B542bzSJ
 wdVecXvRDigr+uWCKdtwRkaYBVS2lgqMqkHGyIEHOmL3k0HdPPMmvl4sTF4w2gEf0bfhLAPW5xT
 037CJEzGCpWUB6tQ6ltoY8lF2Lazowyji3O6lkSSNq+zpfs44r667pM8hgppTPc4aOgsk+NdnM/
 hnQg/T6yvU57upRDWT3e3h+zotenM68SjtGqlZmc/yMniSZqX05Z+jQZjRbs08MRAXx7HB+KdXF
 QkQw1hF3ICnLegDmrwDErVc9PQ/FFabaUl/+xL2nBDOGdxcibMbUwT5AswjYqvQbEzUFYNdvgck
 OEDsvN3y8IPKZdJGVB4tqLqn63zzkB5e+Fr6TIIu+5u2A04zPPtDsN37+FIsXaGQsbZQ==
X-Received: by 2002:a05:600c:3047:b0:488:d6eb:e635 with SMTP id
 5b1f17b1804b1-488d6ebe7ebmr87538865e9.12.1776026090514; 
 Sun, 12 Apr 2026 13:34:50 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d58bf10fsm251660545e9.8.2026.04.12.13.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Apr 2026 13:34:49 -0700 (PDT)
Message-ID: <4253d673-02a9-45cd-9781-0f03866b9703@linaro.org>
Date: Sun, 12 Apr 2026 22:34:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/13] hw/usb/hcd-ehci: Change descriptor addresses to
 64-bit
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>
References: <20260311072614.1095587-1-jamin_lin@aspeedtech.com>
 <20260311072614.1095587-4-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260311072614.1095587-4-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

Hi Jamin,

On 11/3/26 08:26, Jamin Lin wrote:
> Change internal EHCI descriptor addresses from uint32_t to uint64_t.
> 
> The following fields are updated:
> - EHCIPacket::qtdaddr
> - EHCIQueue::{qhaddr, qtdaddr}
> - EHCIState::{a_fetch_addr, p_fetch_addr}
> 
> Update get_dwords() and put_dwords() to take 64-bit addresses and
> propagate the type change through the descriptor traversal paths.
> 
> Adjust NLPTR_GET() to operate on 64-bit values:
> 
>      #define NLPTR_GET(x) ((x) & ~(uint64_t)0x1f)
> 
> so that link pointer masking works correctly when descriptor
> addresses exceed 32-bit space. The previous mask (0xffffffe0)
> implicitly truncated addresses to 32 bits.
> 
> This patch does not change the on-wire descriptor layout yet.
> It only removes the internal 32-bit address limit and prepares
> for later patches that will add full 64-bit QH/qTD/iTD/siTD support.
> 
> Since the type of fetch_addr changes from 32-bit to 64-bit,
> bump the VMState version.
> 
> No functional change.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/usb/hcd-ehci.h | 10 +++----
>   hw/usb/hcd-ehci.c | 67 +++++++++++++++++++++++++----------------------
>   2 files changed, 41 insertions(+), 36 deletions(-)


> @@ -2484,8 +2489,8 @@ static void usb_ehci_vm_state_change(void *opaque, bool running, RunState state)
>   
>   const VMStateDescription vmstate_ehci = {
>       .name        = "ehci-core",
> -    .version_id  = 2,
> -    .minimum_version_id  = 1,
> +    .version_id  = 3,
> +    .minimum_version_id  = 2,

Since this device is used in cloud virtualized instances, we can not
ignore previous migration streams and really need to implement the v2
to v3 hook.

>       .pre_save    = usb_ehci_pre_save,
>       .post_load   = usb_ehci_post_load,
>       .fields = (const VMStateField[]) {
> @@ -2513,8 +2518,8 @@ const VMStateDescription vmstate_ehci = {
>           /* schedule state */
>           VMSTATE_UINT32(astate, EHCIState),
>           VMSTATE_UINT32(pstate, EHCIState),
> -        VMSTATE_UINT32(a_fetch_addr, EHCIState),
> -        VMSTATE_UINT32(p_fetch_addr, EHCIState),
> +        VMSTATE_UINT64(a_fetch_addr, EHCIState),
> +        VMSTATE_UINT64(p_fetch_addr, EHCIState),
>           VMSTATE_END_OF_LIST()
>       }
>   };


