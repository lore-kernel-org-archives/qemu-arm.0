Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B839EF8E4A9
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 04:54:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDbDx-0002Em-RD; Fri, 17 Apr 2026 00:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDbDt-0002Dh-M8
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 00:54:34 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDbDs-0005DD-47
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 00:54:33 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4888375f735so2402445e9.3
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 21:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776401670; x=1777006470; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RswCezjul7SiRoikcBxbY5C2ZOOnN8Qs8fMA80JbeJI=;
 b=EilcURQhGAy/dd0ZcFV10Nd1L7RM3zhDhy5O3+cFy/qKVImH9RMjg0TmO2kB0KyUAj
 Eg9vzhRwNj1S6A34viopr1AEtqykpPoO6BZXQhHUweOsQI0wW0V2kCS4nOQvCl1FPck3
 MLa/WlfZkP8TAKHIIRUaagjoBYSy3hLe18GC5P5gAbsgPnZtZaYQ5U9e/8ggZxUlItMw
 uVw5BeCTkb8aPtccfcIKzJ65FnJp0TTfZjNFJsOiaOqlgWhzuvQTUuBTzC37rqoAbpnq
 GAEwGd7soRzs7ShehvFZ1yDyCfvHwG3yu3NokQWTXgsq39A8hwPqwZDSyzp7/lNrHAQ/
 Zl7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776401670; x=1777006470;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RswCezjul7SiRoikcBxbY5C2ZOOnN8Qs8fMA80JbeJI=;
 b=MkQ7MtohGMtPFrX/9mFFCMGlKvvUFl/5c9Yro2SRBF6mavCBlDtzVXSu9myfephBw7
 p5HZKkCYxGh6V6WRZLWVHsbORAJbPPC4mOUE9+g7OV2ifUWTpWCKRK8QrlWlVlSq3rqH
 2Ydb8jrKLcqABucOdtr3jNbiyfiGNo/HwsinE4VOgrsL8/UX4IaRus9wjrzUUZAOU5Ux
 +o67HsCVfGZ2iu9lHGFHlb+nzGQZGLanfhmnUwtLFeN7KYg50URiQ1sIq41dejacss2j
 eVtBD66to9VrLA3nUB+olqItoPIHcx1sVl1lUGf0U3ofMQjsgSWhb/4OJHDbKaYeJ63F
 fFYQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8QmcNz1PqzoEJ1BpImNESeRlp8Ocn1INmmEmvdJtV8ABDL6OhEXyUiAu0ToM4GTW2Y0YjNgxRIng==@nongnu.org
X-Gm-Message-State: AOJu0YydI3VTBIwbIItxgf0kQIoG26lajYLy16tLyRUdXbvhHBxtigRm
 oS56KzrMEqS4BSOfwS28N74pDIB3OOyn65VeVV4CU3oh8j/FpBo0FhreZFO8K3uNZf4=
X-Gm-Gg: AeBDietOtXNnDP1nyJjiPCm3m9ORz2VcB0ZJByWI0dh6Ckr7eRgN6CxWJMKjS25QBHV
 cQcYaRgL/S1Per8GMFRTza27BVcb02mmWjlFSZqjG4Z5qbJ0lnzeaW686/M2skJnOtZUfLfCgnr
 InRM2lgn09EJOIvR+6nYyILkOMEmeAwy+Vm6DpXZ4HURAP320TDSnjSnWH3VROsZ+GJI0W2VZQn
 yJ5fwLn+HPa1ZTRCT+MwU6iif948cy4OBfI2rtUlLDHi75wigje5ow2HlD/OUfMRAx+6LrKZpU9
 RMqHZl9Sp0oMj67URKcUvBilYRf17IdwZGUexcgMfbbnGM243rsg11wiYEEcnalCnbV38D5Kbdr
 lD4mmh0LPzH9aNeDHGa9+f0ycdfgJof67gBN783/mQtNc7n5YoEWCQ0Edo2gtUrS+2ekuqRg114
 v+noz/5spv3fMy0jxrQPZKaI4FYdDHpzAVPT05SDfVwrL5rHMLYxEZeI1Pv9TC45OC1c0RDUb1T
 Xyc
X-Received: by 2002:a05:600c:c096:b0:488:af14:f1de with SMTP id
 5b1f17b1804b1-488fb73b27dmr11566325e9.4.1776401669998; 
 Thu, 16 Apr 2026 21:54:29 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4daf2sm1389605f8f.33.2026.04.16.21.54.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 21:54:28 -0700 (PDT)
Message-ID: <c49201c7-55ac-43ae-a8ee-3efeb804ddbc@linaro.org>
Date: Fri, 17 Apr 2026 06:54:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/17] hw/usb/hcd-ehci: Change descriptor addresses to
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
References: <20260416014928.1279360-1-jamin_lin@aspeedtech.com>
 <20260416014928.1279360-7-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260416014928.1279360-7-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 16/4/26 03:49, Jamin Lin wrote:
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
> Migration compatibility:
> 
> The fetch address fields in EHCIState are extended from 32-bit to
> 64-bit, requiring a VMState version bump (v2 -> v3).
> 
> Backward compatibility is preserved by keeping the legacy 32-bit
> fields (a_fetch_addr_pre_v3, p_fetch_addr_pre_v3) for pre-v3
> migration streams via VMSTATE_UINT32_TEST(), and introducing new
> 64-bit fields for v3+.
> 
> In post_load, pre-v3 state is promoted to the 64-bit fields.
> 
> No functional change.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/usb/hcd-ehci.h   | 12 +++++----
>   hw/usb/hcd-ehci.c   | 64 +++++++++++++++++++++++++++++----------------
>   hw/usb/trace-events | 24 ++++++++---------
>   3 files changed, 60 insertions(+), 40 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

