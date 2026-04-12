Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2CFE93802
	for <qemu-arm@archiver.kernel.org>; Sun, 12 Apr 2026 20:50:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wC1kq-0006fy-3R; Sun, 12 Apr 2026 16:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wC1ko-0006el-F4
 for qemu-arm@nongnu.org; Sun, 12 Apr 2026 16:50:02 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wC1km-0005AB-JN
 for qemu-arm@nongnu.org; Sun, 12 Apr 2026 16:50:02 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43d73422431so502959f8f.2
 for <qemu-arm@nongnu.org>; Sun, 12 Apr 2026 13:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776026998; x=1776631798; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=99//8Qdl8Nl4XZNELcSg9us9cOBG7f/uZJi+Fte2f/E=;
 b=dXWK96KNlsVLt6cueiJoxGkbiEov9IPjxzPyDqCxTdsIuDw21fGxic6NVOQ+xmbx18
 VwgZv5D6TIjBaVDpaYXfLcdq12Z+tAWFi1FkFnQNgT6JLUFH2yrp4RidpKLuXZyTj9jv
 ON+0etsavwH9XhSc25cVUJSNx2n3eGOXMSnpTZXFNmBQ6GvxlwvMbInXdkYQ+L/8GVrJ
 utCY2Oc+1CkceWuAinAUOeQGKBpCQD0t8QdBVTeyMtgXHIk9OcPfiv3cgPI2OAA9+GP4
 dm786LMuo50WLvBclJyodYoP8Kcx8CVEKw0wnYnLq4/iUmxM7yzg39QFn8NXuNfQ+nLN
 jBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776026998; x=1776631798;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=99//8Qdl8Nl4XZNELcSg9us9cOBG7f/uZJi+Fte2f/E=;
 b=XfvAizCzIDeHL9g0IUzqjmY/qg2lmqcXwwOmecBrlQg8XSb3KYjrKBu/KW6XchPWVC
 zJd+t0s2LWj+YyKtZakcFXvy+RscXTQvlGiuRwbCLGy5oy9GoK0eG1VoBkxv9kqOixGV
 q74tTJMJ/hh8YFHWgRk9LeCbY2wR+XBQWHBm54JDsWha5/eEhZ6jle33kfkiWQ8M8lai
 5vrwDwRh6yoUZ8IjAbIsy3eS8q9c4YUyTovISQe6peCUWiT74xWouWkaqusOTexePYSV
 s7JOB+XkDKiSfPzUdZ96e2gCeh40lBqNGa71Hr4ywX1SlUoD2zm/SqKxxPRSmIIsvGYw
 HQ+g==
X-Forwarded-Encrypted: i=1;
 AFNElJ9vlxhAJKmBV0bb5tUhPu6yfNYOy0oGp08VHgu6f3zsRlpGWeHL74lsLsdp3OHw0zzwnCvTvAp8PQ==@nongnu.org
X-Gm-Message-State: AOJu0YwBRxkJ4/g7AXllcIL7daSIY+0Q3bx8h3+VjDHKtDsGqB/OYEC6
 QPAVHv2ryezEn9q4C7TynlW1kO5SAy+B4o5galAoknCNWC1ylnD4X5PMg82it0Oeq6g=
X-Gm-Gg: AeBDietHQI1cJiwQQ3m22XYSReil8m94yqr1EdXRWQ7jAs7qfnL+yslQSAuvc4Urb9X
 6Vq1WHbUCs38OTMVdmdm3MfckkKddNIG/OWcFcJI6xmBmYkMgFwAyr/iRGeIb19s9yd/sDUTPkv
 0xtccnsQJhZU1bx+N9zgUnoKB5MWrbKMEkwJFTR5LAHpXwKUUdRY59p1mP18BXl8OF+LmTDLEpv
 md1t054sXvsdI0uMjs/f7w+mwbnD892IK62ApcJ6SaIbKvdmxt+Ff4McBYpOY7OGTfIOEZZ3UoY
 MQzfUzueM5y6VBk37z+i7LAAFGzpAAtDy9YVLwxx2Qn03w/Rimaxt/n5D26l0R6S1ZZWsxGdPKw
 85sK16qRPzQx54N9Fr/y0B3KSmHvnm+pNE0tNa+w5bWUedMbxM0DA8U60hF4aS+O9qLBcYhEezc
 /lsLy3X/SmhKkbbm9EU8i6f056HJzsMBzq9lQc9dHnBRYABla0vbwHe+Hf2mv/PAo2/Q==
X-Received: by 2002:a5d:5d0b:0:b0:43d:70e5:bfa9 with SMTP id
 ffacd0b85a97d-43d70e5c016mr5248279f8f.48.1776026998351; 
 Sun, 12 Apr 2026 13:49:58 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e4f16bsm26430024f8f.26.2026.04.12.13.49.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Apr 2026 13:49:57 -0700 (PDT)
Message-ID: <b143a786-751e-4d19-b27f-40449aba52a7@linaro.org>
Date: Sun, 12 Apr 2026 22:49:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/13] hw/usb/hcd-ehci: Implement 64-bit QH descriptor
 addressing
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
 <20260311072614.1095587-8-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260311072614.1095587-8-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 11/3/26 08:26, Jamin Lin wrote:
> EHCI supports 64-bit control data structure addressing when the
> 64-bit Addressing Capability bit in HCCPARAMS is set. In that mode,
> the CTRLDSSEGMENT register supplies the upper 32 bits which are
> concatenated with 32-bit link pointer fields to form full 64-bit
> descriptor addresses (EHCI 1.0, section 2.3.5 and Appendix B).
> 
> The current implementation assumes 32-bit QH descriptor addresses
> and directly uses link pointer values without applying the
> CTRLDSSEGMENT upper dword.
> 
> Introduce a helper, ehci_get_desc_addr(), to construct full 64-bit
> descriptor addresses when 64-bit capability is enabled. Update QH
> traversal paths (async list walk, horizontal QH link, and periodic
> schedule entry handling) to use the translated 64-bit addresses.
> 
> Also add bufptr_hi[5] to EHCIqh to support 64-bit buffer pointer
> fields as defined in Appendix B.

bufptr_hi[] is not used in this patch (but the following), however
I wonder why not convert to 64-bit:

-    uint32_t bufptr[5];               /* Standard buffer pointer */
+    uint64_t bufptr[5];               /* Standard buffer pointer */

adapting the current 32-bit path and extending 64-bit in the next
patch.

> 
> When 64-bit capability is disabled, descriptor addresses remain
> 32-bit and existing behaviour is unchanged.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/usb/hcd-ehci.h |  1 +
>   hw/usb/hcd-ehci.c | 45 ++++++++++++++++++++++++++++++++-------------
>   2 files changed, 33 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
> index 7dc6d151cc..f18150c352 100644
> --- a/hw/usb/hcd-ehci.h
> +++ b/hw/usb/hcd-ehci.h
> @@ -204,6 +204,7 @@ typedef struct EHCIqh {
>   #define BUFPTR_FRAMETAG_MASK          0x0000001f
>   #define BUFPTR_SBYTES_MASK            0x00000fe0
>   #define BUFPTR_SBYTES_SH              5
> +    uint32_t bufptr_hi[5];
>   } EHCIqh;
>   
>   /*
> diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
> index d7a0917caf..8fd3fd60c4 100644
> --- a/hw/usb/hcd-ehci.c
> +++ b/hw/usb/hcd-ehci.c
> @@ -146,6 +146,18 @@ static const char *addr2str(hwaddr addr)
>       return nr2str(ehci_mmio_names, ARRAY_SIZE(ehci_mmio_names), addr);
>   }
>   
> +static uint64_t ehci_get_desc_addr(EHCIState *s, uint32_t low)
> +{
> +    uint64_t addr;
> +
> +    addr = (uint64_t)low;

Not need for 32-bit @low, take a uint64_t addr argument.

> +    if (s->caps_64bit_addr) {
> +        addr |= (uint64_t)s->ctrldssegment << 32;
> +    }
> +
> +    return addr;
> +}
> +
>   static void ehci_trace_usbsts(uint32_t mask, int state)
>   {
>       /* interrupts */
> @@ -438,8 +450,9 @@ static bool ehci_verify_qh(EHCIQueue *q, EHCIqh *qh)
>           (endp    != get_field(q->qh.epchar, QH_EPCHAR_EP)) ||
>           (qh->current_qtd != q->qh.current_qtd) ||
>           (q->async && qh->next_qtd != q->qh.next_qtd) ||
> +        /* 1 altnext_qtd + 1 token + 5 bufptr + 5 bufptr_hi */
>           (memcmp(&qh->altnext_qtd, &q->qh.altnext_qtd,
> -                                 7 * sizeof(uint32_t)) != 0) ||
> +                12 * sizeof(uint32_t)) != 0) ||
>           (q->dev != NULL && q->dev->addr != devaddr)) {
>           return false;
>       } else {
> @@ -1534,7 +1547,9 @@ static int ehci_state_waitlisthead(EHCIState *ehci,  int async)
>       EHCIqh qh;
>       int i = 0;
>       int again = 0;
> -    uint64_t entry = ehci->asynclistaddr;
> +    uint64_t entry = 0;
> +
> +    entry = ehci_get_desc_addr(ehci, ehci->asynclistaddr);

(for example, @asynclistaddr is 64-bit).

>   
>       /* set reclamation flag at start event (4.8.6) */
>       if (async) {
> @@ -1562,8 +1577,8 @@ static int ehci_state_waitlisthead(EHCIState *ehci,  int async)
>               goto out;
>           }
>   
> -        entry = qh.next;
> -        if (entry == ehci->asynclistaddr) {
> +        entry = ehci_get_desc_addr(ehci, qh.next);
> +        if (entry == ehci_get_desc_addr(ehci, ehci->asynclistaddr)) {
>               break;
>           }
>       }

