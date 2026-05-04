Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1539CFF885A
	for <qemu-arm@archiver.kernel.org>; Mon,  4 May 2026 12:17:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wJsEu-0006KP-PQ; Mon, 04 May 2026 08:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wJsEt-0006K9-4g
 for qemu-arm@nongnu.org; Mon, 04 May 2026 08:17:31 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wJsEr-0000YO-9F
 for qemu-arm@nongnu.org; Mon, 04 May 2026 08:17:30 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48909558b3aso43164975e9.0
 for <qemu-arm@nongnu.org>; Mon, 04 May 2026 05:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777897047; x=1778501847; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eh11noYDc/3Az7blVqfxgjOKo9iIpH2UOu7mqbKVHNE=;
 b=GJIrmF8zkCZAxCQeTfq0CdZhnpoGGiioo96n7T2d4YsL9sIfjTs/sFovSdleYA4bSz
 JBfZ6G4nM5Xek2CaJzt5UedbCJObY1HIbSz93KH5sxeY7xRTcjcRZT8bxqLrVxXl6u4j
 AVT5LKvHF6UEPspNb9fyAsWUeVyxD9vgswcCIVT9a9JnyOv4R9Bb+7Svr80eRY0LgicS
 hW9ysT/avq7qjK/mGW9CjI9Y7mDIv0l42zd09FYFG6nqsSEK0PQqXeGUTm9xMJeg9C/7
 0vP003mv0/jJLIpj480dfGOqkVNwhmCiT7JGOgq+wwbJLcU2EjiYWqWB6C1a+gXsuW7K
 FSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777897047; x=1778501847;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eh11noYDc/3Az7blVqfxgjOKo9iIpH2UOu7mqbKVHNE=;
 b=FBDMowlNcL7rWfgFyRYPL0ABfIrrIsdkA9Gtr8l/0KzyEW+Z2aN8q8q7JBfSjNDffu
 V2gh9SU2+ZebkUiDmUKdrKu9BaYmyLfehotw6K+/NNW9Efg4ZGNIncT3GZRSz4cxdlwf
 JihVa8mCfjRzP/uIkyygcKB6ApXm+lqJSacGTpI6fw0nVwyOBooUZRP5uRu5YL0k0/89
 Cq3AW4aO6654gyk9LKN+DymwawrhCkxEBRiDBGPrvA5W43KDI7CG1ikJ0F5kAAMDSNd9
 +weCoaDEOSBtqCPoVYKYC5vtZl7L6V7fuYNW4Ndk/p63trPdZ8y60iThma/FUvvbSB96
 rb7g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/eUAFyFWh5SwjXtx2JqgpLCYzLjsm7GQ8CCRPuWj9KZaet5HQjNTBN52IUAZZp7Io2EdlmXYBySg==@nongnu.org
X-Gm-Message-State: AOJu0YzgwRswS0NvHnk/Zt86hG60h+RfCAyH4mz1Qax1lCJTuh5af+Yk
 5UGGYL/g75rupQlLk1dY2J910JC3BYCuJWbYCINeegPL4rJ5LT5hLTLcJdRTOihnGM8=
X-Gm-Gg: AeBDieupJWBaW3SFXm7F8BYn5smFHhwXjFOomOGUU1OD6+Xd7CXcXH3As34Cg7eCR65
 j5n1YGOcBM4NLa8zQYNRsqhCSuN5e4MgxGuVEl34W1dVsbDy/+NxCZCJ/Z1FD2rnZ5lXXWHNTCo
 AbryMj8P8FG97PMiW3rHa6gIwVOgE6OH2mm8iuhWk5T72T0nzLpV54Yt68UzB3iDkoi875hBxaf
 8Ow5zSNan1IKJ3Yp16Xv/CyBEdogPAV7dVZBx4iRrApckjS+xZFyLPnwZ3WbI2cluPu8JPDR8aj
 0ZylI0CNMD4j6xUrmWnwNfJyjavGHTQT7NI9ZF3jPbnnM4ql1N5SoiVuIqW+nH5oGGypwHuRu99
 +/zZK+CMrD80Iah1f0743DYcCrPZT/yBv7d4fMIekmlIyCBlWlVNEeW//dX7otVJFpZqquaXSnU
 kg9zbIomz7EOPmPAVwjLxFFDtw6vs3/kMYTxntBvO9IXr/mlTM6N5Kb95/JabGhOoVtOPs3yGY7
 zIT
X-Received: by 2002:a05:600c:c0c2:b0:48a:65a5:750f with SMTP id
 5b1f17b1804b1-48a98668f0emr115945535e9.21.1777897047299; 
 Mon, 04 May 2026 05:17:27 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a82308d77sm377542235e9.14.2026.05.04.05.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 05:17:26 -0700 (PDT)
Message-ID: <65f928c1-50f0-448f-bd5e-6edcf3b2e5fd@linaro.org>
Date: Mon, 4 May 2026 14:17:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/11] hw/usb/hcd-ehci: Change descriptor addresses to
 64-bit with migration compatibility
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 "peterx@redhat.com" <peterx@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Zhao Liu <zhao1.liu@intel.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, "farosas@suse.de" <farosas@suse.de>,
 "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>
References: <20260504025342.1452605-1-jamin_lin@aspeedtech.com>
 <20260504025342.1452605-3-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260504025342.1452605-3-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 4/5/26 04:53, Jamin Lin wrote:
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
> To preserve backward migration compatibility, keep the legacy 32-bit
> fetch address fields (a_fetch_addr_32, p_fetch_addr_32) alongside the
> new 64-bit fields.
> 
> Migration format is selected using a machine compat property
> "x-migrate-fetch-addr-64bit":
> 
> - Old machine types migrate 32-bit fetch addresses
> - New machine types migrate full 64-bit fetch addresses
> 
> This is implemented using VMSTATE_UINT32_TEST() and
> VMSTATE_UINT64_TEST() so that only the appropriate format is migrated.
> 
> In pre_save, the 32-bit shadow fields are populated when migrating
> to old machine types. In post_load, the 32-bit values are restored
> into the 64-bit fields when loading old migration streams.
> 
> No functional change.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/usb/hcd-ehci.h   | 17 +++++++----
>   hw/core/machine.c   |  5 +++-
>   hw/usb/hcd-ehci.c   | 72 ++++++++++++++++++++++++++++++++-------------
>   hw/usb/trace-events | 24 +++++++--------
>   4 files changed, 78 insertions(+), 40 deletions(-)


> @@ -256,6 +256,7 @@ struct EHCIState {
>   
>       /* properties */
>       uint32_t maxframes;
> +    bool migrate_fetch_addr_64bit;
>   
>       /*
>        *  EHCI spec version 1.0 Section 2.3
> @@ -294,8 +295,10 @@ struct EHCIState {
>       EHCIQueueHead pqueues;
>   
>       /* which address to look at next */
> -    uint32_t a_fetch_addr;
> -    uint32_t p_fetch_addr;
> +    uint32_t a_fetch_addr_32;
> +    uint32_t p_fetch_addr_32;

Technically '?_fetch_addr_32' aren't "which address to look at next"
anymore, but simple migration helpers. Could be worth adding a comment?
And rename including 'migrat{e,ion}'? Can be cleared on top.

> +    uint64_t a_fetch_addr;
> +    uint64_t p_fetch_addr;
>   
>       USBPacket ipacket;
>       QEMUSGList isgl;
> @@ -308,7 +311,9 @@ struct EHCIState {
>   };
>   
>   #define DEFINE_EHCI_COMMON_PROPERTIES(_state) \
> -    DEFINE_PROP_UINT32("maxframes", _state, ehci.maxframes, 128)
> +    DEFINE_PROP_UINT32("maxframes", _state, ehci.maxframes, 128), \
> +    DEFINE_PROP_BOOL("x-migrate-fetch-addr-64bit", _state, \
> +                     ehci.migrate_fetch_addr_64bit, true)
>   
>   extern const VMStateDescription vmstate_ehci;
>   
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 1b661fd36a..54336da294 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -39,7 +39,10 @@
>   #include "hw/acpi/generic_event_device.h"
>   #include "qemu/audio.h"
>   
> -GlobalProperty hw_compat_11_0[] = {};
> +GlobalProperty hw_compat_11_0[] = {
> +    { "sysbus-ehci-usb", "x-migrate-fetch-addr-64bit", "off" },
> +    { "pci-ehci-usb", "x-migrate-fetch-addr-64bit", "off" },
> +};
>   const size_t hw_compat_11_0_len = G_N_ELEMENTS(hw_compat_11_0);

Good.

> +static bool ehci_fetch_addr_64_needed(void *opaque, int version_id)
> +{
> +    EHCIState *s = opaque;
> +
> +    return s->migrate_fetch_addr_64bit;
> +}
> +
> +static bool ehci_fetch_addr_32_needed(void *opaque, int version_id)
> +{
> +    return !ehci_fetch_addr_64_needed(opaque, version_id);
> +}
> +
>   static int usb_ehci_pre_save(void *opaque)
>   {
>       EHCIState *ehci = opaque;
> @@ -2424,6 +2438,11 @@ static int usb_ehci_pre_save(void *opaque)
>       ehci->last_run_ns -= (ehci->frindex - new_frindex) * UFRAME_TIMER_NS;
>       ehci->frindex = new_frindex;
>   
> +    if (!ehci->migrate_fetch_addr_64bit) {
> +        ehci->a_fetch_addr_32 = ehci->a_fetch_addr;
> +        ehci->p_fetch_addr_32 = ehci->p_fetch_addr;
> +    }
> +
>       return 0;
>   }
>   
> @@ -2444,6 +2463,11 @@ static int usb_ehci_post_load(void *opaque, int version_id)
>           }
>       }
>   
> +    if (!s->migrate_fetch_addr_64bit) {
> +        s->a_fetch_addr = s->a_fetch_addr_32;
> +        s->p_fetch_addr = s->p_fetch_addr_32;
> +    }
> +
>       return 0;
>   }
>   
> @@ -2504,8 +2528,14 @@ const VMStateDescription vmstate_ehci = {
>           /* schedule state */
>           VMSTATE_UINT32(astate, EHCIState),
>           VMSTATE_UINT32(pstate, EHCIState),
> -        VMSTATE_UINT32(a_fetch_addr, EHCIState),
> -        VMSTATE_UINT32(p_fetch_addr, EHCIState),
> +        VMSTATE_UINT32_TEST(a_fetch_addr_32, EHCIState,
> +                            ehci_fetch_addr_32_needed),
> +        VMSTATE_UINT32_TEST(p_fetch_addr_32, EHCIState,
> +                            ehci_fetch_addr_32_needed),
> +        VMSTATE_UINT64_TEST(a_fetch_addr, EHCIState,
> +                            ehci_fetch_addr_64_needed),
> +        VMSTATE_UINT64_TEST(p_fetch_addr, EHCIState,
> +                            ehci_fetch_addr_64_needed),

Hmmmm. I didn't review all previous versions, for my own education, why
don't we use VMSTATE_UINT64_V() here? Did you test (pre-11 <-> this
series) migration? My understanding was we need to maintain the stream
size to avoid mismatch.

>           VMSTATE_END_OF_LIST()
>       }
>   };


