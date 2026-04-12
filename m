Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E07E93802
	for <qemu-arm@archiver.kernel.org>; Sun, 12 Apr 2026 20:40:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wC1bn-0000Ag-Nk; Sun, 12 Apr 2026 16:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wC1bj-0000AA-Eu
 for qemu-arm@nongnu.org; Sun, 12 Apr 2026 16:40:40 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wC1bh-0002be-AN
 for qemu-arm@nongnu.org; Sun, 12 Apr 2026 16:40:38 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488ad135063so35437815e9.0
 for <qemu-arm@nongnu.org>; Sun, 12 Apr 2026 13:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776026435; x=1776631235; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ACJxaywudMwrTLfxzQ6gGKprUXdb7b0YKQf3koP+Buk=;
 b=iFY3sGBiGvcAEtpTWtg/FSdhZ84V3qai5l+FmcvasV9GXHuf+wunj5tG6t4fwJC/KA
 6CATk2Fc/9YPrj7o3zQasBVqREJ2oj3o2QDzEqOy15cvSgEWZrIaADdhn0GW7BsRQvXK
 RDSPlUfhIcZV7t5SEQ7ImC5UBoUORSZUuEebvHH2JmXm8E5tVG6g8WR2m3o+kyr+0Zq4
 aXqoxTD3//r0BAb0lnTXHhUGC0SZiDa8BcLqsltuHhTCqJSk63wmcBabzugKj4pznC23
 gG7OfNLzSgfEevzwIDxLpI6l2zhDQl04jGJ9cvzc70eLQxj8ag/RFLJhQ+FHgGCiHJKL
 cC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776026435; x=1776631235;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ACJxaywudMwrTLfxzQ6gGKprUXdb7b0YKQf3koP+Buk=;
 b=VC/seMglYTT9LHhus811uVc1hv1Lcz24x1cJL+Zg27GnTqNDNiLvF8fMvMPs/UP+k3
 2wyLftq4iWKAIJZ47eQSO7nuvyZu8fLmP8ozKoykad2i1S4/KHwHvjdm3ruaxVdT3ARb
 js/s0s0E9rk2FIO+T3KydV6WUgH9zz7WcsaDMujrpae0vcdxVVnXISdyn35lQHN+Bkl6
 W2wzvfjhoxT528zG06RuKJJD/fUa1cl17dCsGpLhdFPEwub1TTsJAHFYMQ7mbnruFaf2
 2d4JIOuOWKiAy19okWbtw2P3AJ4Fi0MorOsvaAshpgZ+aXpQ/PeUHvxzJIno6hRfjzTo
 Urmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyGVFUN40t6AvHf+GXLTZ+wb3/+muStyxWYaWR4ckziMunSZQvLMbfh26qUJGWEpKRKuwAFo0Gjg==@nongnu.org
X-Gm-Message-State: AOJu0Yzwo0R2zTgnnr44Qy7ozuhwdttly9fF8zabSInTA+D9JQGoKnYu
 2nPA44XhitNFIIF2Cx1XJKVhSM5YcOiy8jHu+fyROdypgc0X6aXX3+tBBpyu/9UYHqQ=
X-Gm-Gg: AeBDievGv863YSDVX28LQpgwDhJ3YYU88Um/qzySk5c2s3+xvk4jZTtRJGC7hfDnA25
 VSuF0SUgO12Qxokhkqi6Cksd1uixlJNSvWGJ/8i90vGmtI5+5HuTj0eaQMxPKpHUYtbx0fU7bbR
 TUmyFDv2myj3bP/883dsYRAFB2FvaDX4b/x1r0ifM8S+529iENvxC1Cd7th5gJ3Xk8SKq4On2WT
 6QxND4MGtqrBRJNAarAL4VAjhKifj2nUVD4KTCIN0ss+VTopt2e7oE4CRcOFPILxkYS657aapNN
 ahuNZ6yKrVY/zYTh+kyLxJ4b9geBFslW5LFRJp55r80HqcPjqQMMn47JuQF0Ky1uDEQ8vb0X2KX
 cMtbsNleKVJy2nrYohHn0IlSJvOtanBnkzqwBmLxJ1yWM3qsHDw5mFfdJ2QXSSwldR4WJ5f4kMz
 177+4kewe6ciEM5GtlDne8CnsSVXAer9hj69nvvb2avXRRLNFSy6Yu1weOV+6nbRbVUw==
X-Received: by 2002:a05:600c:8b27:b0:488:af7f:775f with SMTP id
 5b1f17b1804b1-488d68766c7mr136914125e9.18.1776026435442; 
 Sun, 12 Apr 2026 13:40:35 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d58a414bsm244320185e9.4.2026.04.12.13.40.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Apr 2026 13:40:34 -0700 (PDT)
Message-ID: <1ec64a4c-b648-4b79-a3a1-ca938ef4b7ae@linaro.org>
Date: Sun, 12 Apr 2026 22:40:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/13] hw/usb/hcd-ehci: Reject CTRLDSSEGMENT writes
 without 64-bit capability
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
 <20260311072614.1095587-7-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260311072614.1095587-7-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
> The EHCI CTRLDSSEGMENT register provides the upper 32 bits [63:32] used to
> form 64-bit addresses for EHCI control data structures. Per EHCI 1.0
> spec section 2.3.5, when the HCCPARAMS 64-bit Addressing Capability bit
> is zero, CTRLDSSEGMENT is not used: software cannot write it and reads
> must return zero.
> 
> Add a capability check in the operational register write handler and
> reject guest writes to CTRLDSSEGMENT when 64-bit addressing is
> not enabled.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/usb/hcd-ehci.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
> index 9e82328116..d7a0917caf 100644
> --- a/hw/usb/hcd-ehci.c
> +++ b/hw/usb/hcd-ehci.c
> @@ -1106,7 +1106,14 @@ static void ehci_opreg_write(void *ptr, hwaddr addr,
>                 "      is enabled and HC is enabled\n");
>           }
>           break;
> -
> +    case CTRLDSSEGMENT:
> +        if (!s->caps_64bit_addr) {
> +            fprintf(stderr,
> +                    "ehci: write to CTRLDSSEGMENT while "
> +                    "64-bit addressing capability is disabled\n");

qemu_log_mask(LOG_GUEST_ERROR, ...).

> +            return;
> +        }
> +        break;
>       case ASYNCLISTADDR:
>           if (ehci_async_enabled(s)) {
>               fprintf(stderr,


