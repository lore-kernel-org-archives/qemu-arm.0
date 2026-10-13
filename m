Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E30CA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 12:10:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGbK6-0006LQ-FH; Tue, 13 Oct 2026 08:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jaminlin1207@gmail.com>)
 id 1xGWVb-0001mF-HG
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 03:01:17 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jaminlin1207@gmail.com>)
 id 1xGWVZ-0006Fb-8Z
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 03:01:10 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c315729ad50so437095266b.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 00:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791874868; cv=none;
 d=google.com; s=arc-20260327;
 b=KMPmUG/+RzEBxsYwJwDPgz+Cjivi/CnDaTXAG6VoEnioz3B/e/czdy7Aq5dlwUesH5
 2zEAK08x3mmoVc5Y4uXzeO1KuPopNUBXNi4KkE0HkSIgg34et3MLvhtzXUuYxd2wfFO0
 x0xQUbsM7+uUQ+oKPQ/ozQvlR2fiqm2nnHpqePQKRBhMSlCO9XLULTmbdntYdfkWh8Ls
 QPyrWAzR2s9pvLhgCZLfMW/PoAg2WwbKu2qPInexV154oOugE23mkGCrldMSKDjpz6Ep
 9P8Z7a4TRciFjcesbQ+DUrEjglFafgC4YxBFAGZ4LuP65dWpExU8yeYYp4NHE+b5Sjig
 r0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TKCT5RnEV1vWOyylNVGqIx5R7i4UZOmdib+i9xrVYAQ=;
 fh=FKLX4TXmaUu7Iy8r009pxUdqlnx9YLYfgxmmNkto+o4=;
 b=h4dKXYtmqMOlu9WgZkeLwL6WslEX7GLzAuyQlqfnFjUmRBX7sk7aTes5BY3++VBXfi
 CktNq/3ZI98MQSw1iTSdEHWfMglq5Z0QP4KJrJC2d10UdXMQdL9lYABxbsxX5vjKIppq
 6eOXZooGCBb6mzz4TklQTTQ+OZFvPlx/HVPjj3LFejBX6pVnYAL2nO9Es8r4RfGtIyti
 Ga5u7BjM9PX0BhtIxcPeC+f+Dmr/eRt9/cmBcBmb5O7unNDU7ASdkwUpS/yKLKXIbkVa
 wflIjcMRIax3V31YGsYifDXATh45EtNlcPaIgV95aD7XxkCdU5y3O5vssI3ZbF2vS6CJ
 eAVQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791874868; x=1792479668; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=TKCT5RnEV1vWOyylNVGqIx5R7i4UZOmdib+i9xrVYAQ=;
 b=euDsU3nmDmV8pvwsq/RmQSM6yefFODWpYrQ911F4gUsavtNlacBv6ZjmuJeQl1XT42
 e2o5LfHDD9H6dhgozDnVz/nNrpWcC6T9c1n8/geC3A9PQeN3xezfB0zAighk7DBaRaDJ
 uHrXaoeVtHIkoeku+0Xh8z8CASfq0KV3pONFzFJigdzV3C/HlkZrqZYwjq4dnAOKuDJq
 7g5HflYa2WDbE/k045pKNJ6Y4XL+Elgkip1tBbNfxjJWeDmFcQhtc47OmtbpdYyNW6s9
 O/hoplpkA6BMT9dkLf/20iN0WnMj0a/FIzKGxg15IQcYBa4uJIAz1RUYNnm2VzR3tVYQ
 V/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791874868; x=1792479668;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=TKCT5RnEV1vWOyylNVGqIx5R7i4UZOmdib+i9xrVYAQ=;
 b=EPwwr5Yi4t4rIyC7EDZ/G1npmy50oe6ubDXMknC7LiGSORaKZ586sGg1y1XYyVulUa
 YnOIbLbZLicJr+F5E568Z+HUOagc7Q+Ns3NPmw9iARpeIrtGE+v5qXxVzfVdaQqM/rjx
 ABdPVG59urBXcjw0fH6JMQIvDoUgCwTC03RjHHu0GC2zKNbczOhCE1B53Mwh/TMEHz7E
 Dd7ovBafdXlubSvC38DJiibi4tmAskbe/FD8OFfkEKvOqVnoXdEgvDwVXlGoh20FunrM
 L2ATvSj4Axj5msV3f97tbNgR4riHSfagC05m/F/cwyZGv+zLvV1LB+CFyywacyHrY1Lm
 9fIw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxnqwisYDLQkHMqo9erB6jcZPMowza+eNPqY8U+HULE9OApW9WRFU2BFMDGzfOQE9WGg6ZTfP5dLg==@nongnu.org
X-Gm-Message-State: AFq9FYLYH/WRbP0ooPhtYn9s3lWtmHy759Z5IkGP0akd8FQz7yEw1EKu
 YGkScp6pD71vxMjzUVhqo+YP8mMmGR9FgLdsEXphsj5UuVQaYUM9W+B53HoKNrnkizNn89O1wmE
 KYQxBBlhJR5Y5nZhJK1DgTj/0Lux/2xY=
X-Gm-Gg: AYBFou3z+c8XHbiD+mDFW1sC+NYMU/X9X1mkVlAIYq6UxlwyCnkm1eUhMdMGVy/QKlK
 rK2fZCDSroaob2Rs65h+lIiVr86uPmkY/Zes/MdvB/6RSJwxuO5KXMVla/uoEiBLcAcheiwX8pd
 uMy9CymPMHeWgntgFxL+EQd2n/5tQBlfjs3Dw8DOY7ceri2WT7l9aDFzQVKtAfm2joBHXsOwDMw
 vXoos+1rqk7BFPRujbP4f/cSSwHcDtfhypqsK50xXBMuqyUVbs0SS1BlaxYPWBoyxogHtZ5sgtn
 jYz8UKiSL0PUBaYi6DrAVD8qmu2hTuDURrl/vh98eqh9bf4bGBps
X-Received: by 2002:a17:907:724b:b0:c2e:1d6a:6b78 with SMTP id
 a640c23a62f3a-c31aa0e0cb8mr1176461466b.47.1791874867472; Tue, 13 Oct 2026
 00:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
 <20261012-bmc-minerva-v2-3-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-3-4c3dff084ec9@free.fr>
From: =?UTF-8?B?5p6X5bu65piO?= <jaminlin1207@gmail.com>
Date: Tue, 13 Oct 2026 15:00:55 +0800
X-Gm-Features: AclHuK_0EmA86gxslNXKzkKFMXSLT-zOmF24a1p4E6djvihwlnmWjCpLOGNXMCs
Message-ID: <CA+8rw5xkA0idsTC5e+G=YWLDn4cPLkvMiDNjcT9ef5Sh_3QMQQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/50] hw/arm: sanmiguel: remove the second SPI flash
 controller
To: Emmanuel Blot <emmanuel.blot@free.fr>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=jaminlin1207@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 13 Oct 2026 08:09:33 -0400
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

>
> The board only populates the flash device attached to the FMC
> controller; the SoC SPI controllers are left unused. Advertising a
> part there presents the guest with a flash device the hardware does
> not have.
>
> While here, add the missing year to the copyright line.
>
> Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
> ---
>  hw/arm/aspeed_ast2600_sanmiguel.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/aspeed_ast2600_sanmiguel.c b/hw/arm/aspeed_ast2600_sanmiguel.c
> index 345a9c9416..ac2aef740a 100644
> --- a/hw/arm/aspeed_ast2600_sanmiguel.c
> +++ b/hw/arm/aspeed_ast2600_sanmiguel.c
> @@ -1,7 +1,7 @@
>  /*
>   * Facebook SanMiguel BMC
>   *
> - * Copyright (c) Meta Platforms, Inc. and affiliates.
> + * Copyright (c) 2026 Meta Platforms, Inc. and affiliates.
>   *
>   * SPDX-License-Identifier: GPL-2.0-or-later
>   */
> @@ -384,7 +384,7 @@ static void aspeed_machine_sanmiguel_class_init(ObjectClass *oc,
>      amc->hw_strap1 = SANMIGUEL_BMC_HW_STRAP1;
>      amc->hw_strap2 = SANMIGUEL_BMC_HW_STRAP2;
>      amc->fmc_model = "mx66l1g45g";
> -    amc->spi_model = "mx66l1g45g";
> +    amc->spi_model = NULL;
>      amc->num_cs    = 2;
>      amc->macs_mask = ASPEED_MAC0_ON;
>      amc->i2c_init  = sanmiguel_bmc_i2c_init;
>
> --
> 2.50.1
>
>

Reviewed-by: Jamin Lin <jaminlin1207@gmail.com>

