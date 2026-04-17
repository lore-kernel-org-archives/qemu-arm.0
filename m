Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B8EF8E4AD
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 06:24:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDccN-000812-Ah; Fri, 17 Apr 2026 02:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDccL-00080X-HD
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 02:23:53 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDccK-000675-5J
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 02:23:53 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48374014a77so3447485e9.3
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 23:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776407030; x=1777011830; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=61BNr8ucUCpua3Fei8SFsujtYYer+vh+5quEmFiLcRA=;
 b=ByuXGAt/EXgActCzPIHjcQkYAaMeo72R9KOvmpQq7l+7SF5AZLp7UQiYfUEhUA1+hv
 lAp1316SP+eVm/THLSWY1NBZIRE51ZqOZk3QePDbPzs+Eo4duguNfaKPagnaZxy8u3/n
 0EipCQPFcZjMLnBn/S83KQlhZFE7EFo0JwUJX0op8jQCKf3jxRrKItqQHh0h/lMpym/H
 VjVgVk9iJ5kBYrQe0QfPlDXTA5s1OZteG0+11TYT78NWP0GmprxBtaJ6x2AiVhlCWsmG
 NBzsYkhJYZKas2ZbadyHZQDg4aZiJo1gwGyNDD4jCURSvObPUGE8Iu6vK68dcX7Tq9uy
 sRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776407030; x=1777011830;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=61BNr8ucUCpua3Fei8SFsujtYYer+vh+5quEmFiLcRA=;
 b=PHd7dqUFc0X016C5O5+WTyV8WY+MZ8m0qSNFxH3wdFpl8yOjubgs7YnFeHQJXDLxRl
 NAOwqbJY6Rsw7mGZZYQ9k0O/J0WR4hWDqZK+SWN3XYefN/SKfHVIvWK+8nt3j5/GJVzw
 JiayLFntuyEE2+B7moTCyUFPdblsNSQGHWqlAOU5c9rAu+tujw7hvd7cB64kcHnIYv6K
 caAvyR0Xu30GPGcFqVOI3m2lpm6wMV/o/x2+kWeRYvKrZMpwnf+mLoRzC72LmSrPD6dn
 pQtuMJGns+qsKcEN6qPZtFqrqA/HOvff04fUBgZ2f0uBQlzJB2ojOSQhiV5UFDOheo69
 Ooaw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Xc2ZHCqhDWOi2+vqV43GLH9tHGRSUFPUXHBU33N+50fdW3lsKMxuOyx4fT3s84K2af5qXX/9GKw==@nongnu.org
X-Gm-Message-State: AOJu0YwiKs++F0gML+c16brCfg/3d8j7JxLJPWeW7RgMeN7pCaDdoY1T
 UHuheWV+uoF6pfENlXcm+HxoQt4SxsC7NPeQI7Ck3Ad4z2XNnIs9zF/j8dpxWPnp1tU=
X-Gm-Gg: AeBDievWfSLQyYatBR3tA1DbSfsSQ7AO4OjHc5AzJo6MA2L9OSbMp3F6sHycelmgvrU
 6b341tmV6BcK8w1r8AkTGO+tPFcLjowb/k7QZtQdDa7/Q2xiMhNm0iieFXAbb3XQhI7ZAHjBlge
 F9DL60f4s5jtWg9+J5SHKUOYciTzPhCGXC7/HAEO1dAqD0PoJKNVfZpzuAarBoVC/qvPKK80oau
 7mgHPL3I5JSjYi4N273Btc1+5iBEgpaUwQRdirf150ToeHQXC8Qog2E2EyKiMSx8VpUYzktAATB
 31TeDEJ9wb7xfTXvOnR4xoHOrJGNNF6dMamyakN9jkBXFoTw5OFBDTQ+WZRrGVpMgJrkBsvbiA6
 fYC3klwt/pD79LDVIPBhLcn2XE/VB45KkkZ0f41Expp3skV7mf70fBMIvKGT9nA0MZfWFPv4oWR
 OTLUrfP81tXqIMIvkNIhrznrfA+SQWkS8uoBgsIol3mXS3tUT5uNZQxmVqQv7WpCMHNEOlE2Zzm
 S0b
X-Received: by 2002:a05:600d:1b:b0:483:8062:b43 with SMTP id
 5b1f17b1804b1-488fb771438mr15659415e9.19.1776407030601; 
 Thu, 16 Apr 2026 23:23:50 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7aec91sm9320025e9.26.2026.04.16.23.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 23:23:50 -0700 (PDT)
Message-ID: <7ec734f8-4b9d-428d-87f9-89c87d54956f@linaro.org>
Date: Fri, 17 Apr 2026 08:23:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/17] hw/arm/aspeed_ast27x0: Enable 64-bit EHCI DMA
 addressing
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
 <20260416014928.1279360-15-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260416014928.1279360-15-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 16/4/26 03:50, Jamin Lin wrote:
> AST2700 supports a 64-bit DRAM address space. Therefore, DMA
> transactions must be capable of accessing 64-bit addresses.
> 
> Enable the "caps-64bit-addr" property for the EHCI controllers
> on AST2700 so that USB DMA operations can correctly handle
> 64-bit memory addresses.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/arm/aspeed_ast27x0.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

