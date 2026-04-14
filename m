Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B201ED7B93
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Apr 2026 09:23:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCZyu-0002sy-76; Tue, 14 Apr 2026 05:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCZys-0002rp-RJ
 for qemu-arm@nongnu.org; Tue, 14 Apr 2026 05:22:50 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCZyq-0002gn-Me
 for qemu-arm@nongnu.org; Tue, 14 Apr 2026 05:22:50 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488971db0fdso52884585e9.0
 for <qemu-arm@nongnu.org>; Tue, 14 Apr 2026 02:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776158567; x=1776763367; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=napVYKet5wfgKuxipXOGqoJX84ZK+ADDAP9uEoPAauw=;
 b=Ll9ECSPJxBE8ULWo2u2KPvXkHpWX7UBKFbAZTqppI1o6wQeZyCbSbtEYBkukhxjfzs
 Jv/m1v4m7pZYkyZMPbCQOJ0PbQk8P9a63sxKdlatm5/RsxRerrCSDPXbv1BI4Rznu0m2
 B2/YZhXGn5X16XVIQGlAuUy94wSfHosB54O5/Em0GBqRotPz3HMrm9/5gFCmN0naRjS4
 KldT03rIKnk9JH2wiZW9YtwtkSZFl0AlT3KwFvDUUlxsAKc5ERY2HQsTIGLlhJOUncc4
 bsiMTCRBvdlFOVnpyCjOFqqAxF0fhK9ySvqsbX6aAgo5GFJ2xamSUQqSg+QCRZudaM0s
 Ufug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776158567; x=1776763367;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=napVYKet5wfgKuxipXOGqoJX84ZK+ADDAP9uEoPAauw=;
 b=HDGHDsfmRv4PnTEEQ1jsPKw2p6U4SFJKLLmIhejrak60hEyUESF5qVaeQUx0BzBMyB
 Zwx39ck+gd6hLIyxjYPAvBGVK03OuZ5TMRZ57LChuXfHUbpiau6n7UQitZaoBhLNLyV2
 iHddOPqEzrYk2riiakszW+aT+P0s+oukTBoVrVIYu4n0OPRPtHq9s7h70CJFVwTRhJ43
 SRYNMD/UNH6kyFG4BrxuuBmK/zyiUKFD1FREJICjLQXqfz8qxSwcgJD8fOsMWtl7qR5l
 JncnXKozH+EZ2E6IYb9SoUbtRZyDuQerCiJadnQKRaBMDFivtmymqJ78MqhGsSKiJa4H
 YcPw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ZeQyVD8q8pwi8y9qvtibOImW8AUN0PuFzdH1tAW4jXVFNhvJzLLCSMly9z7Ufgq0VMGD6JmWaIQ==@nongnu.org
X-Gm-Message-State: AOJu0YzthqFPyeT30XdkZGS8VK2H4DICi2ISxueJnRyl4RJ6qtLPcZ+z
 V/t/6smgPNadtkFO4aC0XRVn1NcV0j7Gwhpd5+YTijYjC0FyOAskQCnIutGQ99dJmWY=
X-Gm-Gg: AeBDietIBAq1YFIq304kmZ9nN7bNw1bUduHbI2SpkohB5i31hNoBM+YcSm3Z3v3G1ET
 zMRQbVJvcP8rSEjfg7tsKNSa90KV6LKqjazsEEMPmNZIkNSdlFxBZH5Rc7ZGueZuOPCniwl0GfM
 /lsLOCQf+ey489LwMP1Kr42aXV8dHlUbEkMFUCYpXwNpeXVRNl8VpOAVHsjzYB74x4jRjEHRUYN
 G+zkjNT0FSUMTuYCxZiBV5YewwduaCvEtB6ZG5I8E27+dZQdZLlEPbnFSc+d1kz72yzxA17e5lW
 BompGrhqLVdYuqlmc59hM9P21h6QJasqJfjAldTkCir7R6lIszhIRqm1iaSHpKntDzWfFMBUwk8
 iNj6kpJWtVNRgRUkXjl3nnkedw9fwbHALVCQDVQURdrVl1yhm/SwY9uajGS3a+GI938xQKJhpty
 uN//NsUlA37rriGN3eYcOmlp9NrLQ6JCu7DHKHCOgquxq0FOZTAu74ukOvAFzwg5/i8Q==
X-Received: by 2002:a05:600c:4715:b0:488:9e54:94c0 with SMTP id
 5b1f17b1804b1-488d67e7dd4mr245692415e9.8.1776158566868; 
 Tue, 14 Apr 2026 02:22:46 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ee042ff9sm40765095e9.14.2026.04.14.02.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2026 02:22:45 -0700 (PDT)
Message-ID: <7eb32749-dd83-48ea-94a4-41935cc90aca@linaro.org>
Date: Tue, 14 Apr 2026 11:22:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/17] hw/usb/hcd-ehci: Change descriptor addresses to
 64-bit
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>
References: <20260414080025.3005916-1-jamin_lin@aspeedtech.com>
 <20260414080025.3005916-7-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260414080025.3005916-7-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 14/4/26 10:00, Jamin Lin wrote:
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
>      #define NLPTR_GET(x) ((x) & ~0x1fULL)
> 
> so that link pointer masking works correctly when descriptor
> addresses exceed 32-bit space. The previous mask (0xffffffe0)
> implicitly truncated addresses to 32 bits.
> 
> This patch does not change the on-wire descriptor layout yet.
> It only removes the internal 32-bit address limit and prepares
> for later patches that will add full 64-bit QH/qTD/iTD/siTD support.
> 
> Update the EHCI trace-events prototypes for QH, qTD, iTD, and siTD to
> use uint64_t for the address argument and print it with PRIx64. This
> ensures full 64-bit addresses are shown in trace output and improves
> debugging of queue heads and transfer descriptors.
> 
> Since the type of fetch_addr changes from 32-bit to 64-bit,
> bump the VMState version.
> 
> No functional change.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/usb/hcd-ehci.h   | 12 ++++++----
>   hw/usb/hcd-ehci.c   | 57 +++++++++++++++++++++++++++------------------
>   hw/usb/trace-events | 24 +++++++++----------
>   3 files changed, 53 insertions(+), 40 deletions(-)


> @@ -294,8 +294,10 @@ struct EHCIState {
>       EHCIQueueHead pqueues;
>   
>       /* which address to look at next */
> -    uint32_t a_fetch_addr;
> -    uint32_t p_fetch_addr;
> +    uint32_t a_fetch_addr_pre_v3;
> +    uint32_t p_fetch_addr_pre_v3;
> +    uint64_t a_fetch_addr;
> +    uint64_t p_fetch_addr;


> @@ -2441,6 +2445,11 @@ static int usb_ehci_post_load(void *opaque, int version_id)
>           }
>       }
>   
> +    if (version_id < 3) {
> +        s->a_fetch_addr = s->a_fetch_addr_pre_v3;
> +        s->p_fetch_addr = s->p_fetch_addr_pre_v3;
> +    }
> +
>       return 0;
>   }
>   
> @@ -2472,7 +2481,7 @@ static void usb_ehci_vm_state_change(void *opaque, bool running, RunState state)
>   
>   const VMStateDescription vmstate_ehci = {
>       .name        = "ehci-core",
> -    .version_id  = 2,
> +    .version_id  = 3,
>       .minimum_version_id  = 1,
>       .pre_save    = usb_ehci_pre_save,
>       .post_load   = usb_ehci_post_load,
> @@ -2501,8 +2510,10 @@ const VMStateDescription vmstate_ehci = {
>           /* schedule state */
>           VMSTATE_UINT32(astate, EHCIState),
>           VMSTATE_UINT32(pstate, EHCIState),
> -        VMSTATE_UINT32(a_fetch_addr, EHCIState),
> -        VMSTATE_UINT32(p_fetch_addr, EHCIState),
> +        VMSTATE_UINT32_V(a_fetch_addr_pre_v3, EHCIState, 2),
> +        VMSTATE_UINT32_V(p_fetch_addr_pre_v3, EHCIState, 2),

IIUC we want VMSTATE_UINT32_TEST(..., 3) here, for "<3".

> +        VMSTATE_UINT64_V(a_fetch_addr, EHCIState, 3),
> +        VMSTATE_UINT64_V(p_fetch_addr, EHCIState, 3),

These ones are correct (">=3").

>           VMSTATE_END_OF_LIST()
>       }
>   };


