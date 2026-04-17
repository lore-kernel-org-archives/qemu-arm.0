Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA7FF8E4A7
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 06:33:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDclA-0004kE-Uc; Fri, 17 Apr 2026 02:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDckM-0004Hs-TG
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 02:32:12 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDckL-0007ip-BT
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 02:32:10 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso3639355e9.3
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 23:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776407527; x=1777012327; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+MVTjnaaisN4lgdXwQZh7jONO9DLw2/laxbMfsSMywk=;
 b=MnM1HUhg1TB0bFe4634AARquDdttSLYhQ7zwuOxj0L3lwLHTNSBw6DA9xMx4oabik7
 YnRtR/PkPjgU4A0OjHXPYodbpuVTtazqUYW3q1SyBaJrbxNXyRiuIorIVXdd6mKN+FrP
 eM37hR149PvfPrWw19kB3uqLXk6wfi3qvxyh0lZz1VOX8KBiiV0kv8xkMO0UcOTlplCZ
 QTcO5cEgeMjIIYHpr4ZXVS/rDTmr454By+onMg14VQgiIY7NPPxg8Cp8yGJRP3fzKIJl
 GG2uAvhC9mMYcWFOBqqPgoVMap8d3VkhfBirkB5+DF1njlLvR4I+6OhydT2scCbuxzKZ
 xotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776407527; x=1777012327;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+MVTjnaaisN4lgdXwQZh7jONO9DLw2/laxbMfsSMywk=;
 b=AkEOaNYsEsium/zlDolbz/j5RdcNEeUzvJQGfjlqgblwGoF0670BQd6g07GVM/0cEx
 rKRy+4QUZZ7s+XR20bpb49IvUuc/fV8RlTL1MfDW4Putqr025w7bqGVYuSWvhM0cB9PU
 g705HRZxUjox0CCqWoySQBmv2C4rcV+fDUNKOnRoga8FKK4pKPV+4bSNnUxFZ8D1t51M
 8cXkOfuMmvvxVfoumZa4C1aQyPL7/2WZi5U4ZwAMj/s2FUwEs9RLJdTbKf6awb/AuT+s
 NLGAAPpNWfGSCYBMqQY/Vs2JByRFR6LJWHX9XO+Rzwjo8JQ0RwZ6m7SdUQb5Y+LMqUuk
 MhDQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9kHYx7DgWudaxTstwfBslYmOKpYSUPkJ1fM84wh4PqLHoAQTSncP3hd2lLvvqNXieYxGbhApdH2Q==@nongnu.org
X-Gm-Message-State: AOJu0Yyh7WxPOoIoe0jXHapqwF+ekwtg/tHtW92PxNullg2lyL7gGSRf
 w1pE4y5rgnLb3epJry3EboYzGjg+pHoDJuWnyOfheWgUU7jwnPe/OdmjM4OIsNDDWl4=
X-Gm-Gg: AeBDietr06Kmd7f4SOunjU2E9Mfd3hYCL27YFuKeGcm8fe7ac1A8w/YiOgktsZ7rsuy
 RksVOBhWMPDN4JHD4s8606Rf3VBaqxYIG6/wvCkwsCHyNmgNn6Yv7DU3zkuuft1co+EHVoCmj/c
 BM4zrEBvGqVKoPjqG6DgLxKKZ0uz9y85O5NWZkIgdMvKrZ4h/fm9j9QMgDOJZDp0Yq/H1GyAeEr
 u0D2oGRRmuHbJvXNbQsS3fWb3bemen8qUNVsgkego0Vf1JOpXk+R97DIGdHwhOyTloA4WojiL79
 F1Q230+YvUAhZ7kxaQA5iOs34rIcRDwemgOBrJxjbaQ3haj4czuTS+qvxMOh7sUzJraL0zUgKw7
 UnhvsP/zUNgMTsd+7tMZAqlETxvl0KJT61G0ef5Utdkr0cR6+JN5SZeSChJJzn00KuxjEe7GRAR
 Ox3v5cKSOfJjJANENQ69VzChyfe4ujH9nnrEPck/iZA4Wsb8VbJY80HNGvh4AiSyUWDXq/yvRXv
 qAp
X-Received: by 2002:a05:600c:a318:b0:485:3e19:9e01 with SMTP id
 5b1f17b1804b1-488fb7844dcmr13607745e9.28.1776407527478; 
 Thu, 16 Apr 2026 23:32:07 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7bf696sm9473825e9.32.2026.04.16.23.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 23:32:06 -0700 (PDT)
Message-ID: <8cbcb8ec-ec87-4de5-9036-971ed8b4925f@linaro.org>
Date: Fri, 17 Apr 2026 08:32:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/17] hw/usb/hcd-ehci.c: Fix coding style issues
 reported by checkpatch
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
 <20260416014928.1279360-4-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260416014928.1279360-4-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 16/4/26 03:49, Jamin Lin wrote:
> No functional change.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/usb/hcd-ehci.c | 126 +++++++++++++++++++++++++---------------------
>   1 file changed, 69 insertions(+), 57 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

