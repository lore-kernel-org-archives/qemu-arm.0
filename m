Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD16F8E4A5
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 04:55:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDbEX-0002Xu-M9; Fri, 17 Apr 2026 00:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDbEV-0002U0-84
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 00:55:11 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDbET-0005ZG-EN
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 00:55:10 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-48374014a77so2706275e9.3
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 21:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776401708; x=1777006508; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K2eUsc15FJXvL0oeiNwJM4ny+AUkGpojf3/e1jZx7IA=;
 b=QHM8HC/5TwqOE2AWq5dZnzpYscaNtEGRlVPk6YCUZk8+XyqTKvvUOjPH4gvHIvQ5SI
 EQhWQ9O2Ls5rpob8tzWs7W/LGKr7fxA0RxDAWQce5rV7SpK+bH8LOrUDMVKUs+Wp7lPB
 qKETKpnisXVx/l8sL/sESCArYZNs0OHHhhdqRTQ/GCSTxp4C9JxQpXHi8SnYhSyJapiK
 KVYzBejUZMWNn6ZdSCNrnLnP5FhkfRQugGqXkXsaZIVe4NIfysOLF2khmgBJRG7r6HTs
 KAnnxIAi3hsCOdo/0958B/a4c2xaWKAKwCReXfX8cOEtjT0wUWVeFS8Riy7MWFxeNbv6
 ncIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776401708; x=1777006508;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K2eUsc15FJXvL0oeiNwJM4ny+AUkGpojf3/e1jZx7IA=;
 b=Nv+MXgYU1NG8pi7Kz5Hk/wxkIAEmonMsOpSS/PTNjRHnRT1M2hJF30mlPZwzbftxE1
 iLbx1iBEBwfV7wooCQ46FT9sA2+9AiLUo/SiudH9kO3LN2RWHCu6nxUbo+U3YO0L41RA
 6Ad9B88yUAhUKTlOagpauHqzfFa0PQJmvVhxXhIw67YvjYI+w0MRilAWyl1XCUSxuApD
 XbU3S2gwe3SfwW6/TK61pEnFJggmhU33JZ0jl5KVtt3J5fqNKFVhjdSo6kfRSa18nD2V
 TahA334blYqu4JeI1phokJeblHzFZdlvm773QeoXXKLPi0Ft4o4IuNZ6dHh60zArsqPu
 QgWw==
X-Forwarded-Encrypted: i=1;
 AFNElJ90bpKWgMDIBFrdLO/9n0VRgY1oLJAAMLLxnTHbloB28B3IkTB50iKiM6Oe6sZgSIDgaT9AqJngFA==@nongnu.org
X-Gm-Message-State: AOJu0YzjqPg/3GgRGa/j8nGHrsS3igaw9hZp4GdTcpGD7j3clma8K4pg
 XHzd4uK19UCGgn8foRsa81GZuFaNDJRURmcbxn85IojYBEf/tEu/daAuyV6Wiy/5B4U=
X-Gm-Gg: AeBDiesMMUCvhnmTTulFVPrrd8vGxfXguen/CPeYyiu81mPG3sSMUAXYrScJZu64pJ1
 DCw04Abl5BRDNTsrPmomPjmpQYwEj4unXMImoHibf0UHvNY4MbidGTTxklnqfk5RJFuzJtbR5dE
 JenysK92koXzjL97dqlGomTq8pS6TjPzc89ylkQwVQSgyq+vX0gWAf/WOqBuczBtlRfT6miiWgU
 JGWTyC8aLgpDjfwRphNADjaoiSDvaZRe1TqLXI9XxX8BfKvOux7jEuBb9VBPN7QwFbJDWt8spV0
 XvENs//mPXhoMibz0yVpvEq24ejnmZZBVhIs9uFg9e0sTsuFQnYR83SkPcgMwLqmXDXtFLLatyL
 8bmTEWt83R1ZyEezPRIGvxaDRrUBp+XtkGuady+x4+Xgxwcx0kPYcMrBED63PCd3KGV38gjPjlc
 EF3esWmg9pOuzPZMQUdSVWHpzmnNPS5qmMwp681WQTd9CTtt7iZm/4ZnaehTjoVzoXXjpeiFTVI
 gq8
X-Received: by 2002:a05:600c:1da1:b0:488:bc6a:528d with SMTP id
 5b1f17b1804b1-488fb785204mr17524105e9.22.1776401707685; 
 Thu, 16 Apr 2026 21:55:07 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc14a61asm13447145e9.15.2026.04.16.21.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 21:55:07 -0700 (PDT)
Message-ID: <0801da2a-3970-4021-8e15-679d0c3d6d5b@linaro.org>
Date: Fri, 17 Apr 2026 06:55:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/17] hw/usb/hcd-ehci: Add property to advertise
 64-bit addressing capability
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
References: <20260416014928.1279360-1-jamin_lin@aspeedtech.com>
 <20260416014928.1279360-8-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260416014928.1279360-8-jamin_lin@aspeedtech.com>
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
> Introduce a new boolean property, "caps-64bit-addr", to control
> HCCPARAMS[0] (64-bit Addressing Capability).
> 
> When enabled, the EHCI controller advertises support for 64-bit
> address memory pointers as defined in the EHCI specification
> (Table 2-7, HCCPARAMS). This allows software to use the 64-bit
> data structure formats described in Appendix B.
> 
> When disabled (default), the controller reports 32-bit addressing
> capability and uses the standard 32-bit data structures.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/usb/hcd-ehci.h        | 1 +
>   hw/usb/hcd-ehci-pci.c    | 2 ++
>   hw/usb/hcd-ehci-sysbus.c | 2 ++
>   hw/usb/hcd-ehci.c        | 5 ++++-
>   4 files changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

