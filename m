Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A62CD37B5
	for <qemu-arm@archiver.kernel.org>; Mon, 11 May 2026 10:12:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMNc6-00018Z-6m; Mon, 11 May 2026 06:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wMNc4-0000wU-Lf
 for qemu-arm@nongnu.org; Mon, 11 May 2026 06:11:48 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wMNc3-0002jB-3l
 for qemu-arm@nongnu.org; Mon, 11 May 2026 06:11:48 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-45562c41ec7so1236104f8f.1
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 03:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778494305; x=1779099105; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yBjkC+AAaXfW3JTMdnJdtN8vSMhwVFrHL65kEN5sB7s=;
 b=cwpNNb4AWFfh7uC2fz47BiOn6lCVDPeeg9P9j3Ua8ahtsgnKqPOtCHzc5kPUWg4eWa
 gHbSQ0Zgx0rzwiKqkJ4kFF52lq8Lb//I5s9flVqxGFlbgR3NviyCAftHcBundHS4wscH
 PURvaDc+gflf9rEWlUZWkWifV9xVrPZL5JBp9M5upoa2FhvTfyCxD/muQV4tuoN6dz5l
 8NsbTx+lZxHEKxnqB1TJ45BY0o5x9NrnM6yd4qjOASbLc7OMfvjfUjD69pO+iitem1sl
 UsSKXVMYv7h+sZzRYMdLj0LOXOXJxD7E5LD8unwkrvuBAZT08eGpKf2/kp6hVpZTRm69
 4lmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778494305; x=1779099105;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yBjkC+AAaXfW3JTMdnJdtN8vSMhwVFrHL65kEN5sB7s=;
 b=UGYRi+tbz1nt9XkYdMlNmMTh6a8equPK1HscM2fAwMdQkePxA3vQyDUiMDmFLYPK9f
 qXUuTorXDOXjeeHt/vfaYb2JpV3NsMljYNuKshWNzkdtwMW2eI/VmBX8IOU1nH/3cXCx
 8BcrtSeEQs9SnyuP7AWB5vM/Ms6NyeJYBqT+cXU1hrxIm4efOsnxk77qH2C469gqYg7X
 xQyKO9b6xStKoFQZNBzD29YLqLEQELCM/WZBP8X5hrPtDUNU1WrlYgmC/WV7/HxaRFzB
 rPL0E8zztA/jwCUKOmifvgDIsgLJ/E3GC29jYJG6UGehfXtG8LIC/YO8Ao9rSMwQHDCT
 UVvw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+fMTA9LKQNHlmOzWZ3ygbtCgSJG9lXC1Y4vT4GrvBdGUoIyHE2recgpendiGu+E6L+T2betaMr1A==@nongnu.org
X-Gm-Message-State: AOJu0YxkfS2NF+8s69ViE/xcPOOFl5muuGGuEeomgcyDvWkX96lXTcRb
 dvW7oinNER79FFTOTmYo9B/0T/yQD8/cHpnFjo/Tnz02F/yjYJbsME2wPJExdunWKuc=
X-Gm-Gg: Acq92OEFTeCY2RtqnFvJYWnevZ0GuxEqCAS89CicdxSph2VbjOIWSIEictdcN80ogDk
 I805e6PaVOWl+s0sctZePrd4PxRpBa6t1K65tzUECs8zH1wPrATVhKA8Uyt63xbdBegNHoxWtTA
 laVSBgMKBXyZ/GpzuVlNZNU3jrF2FidBD7/4o0H8YjSpqNcwgn1JSbturec2Wgj/lEnJVprMPlo
 4rbsOx4x+sMWAeohcpaJVAGykWZK/IyE3MjmJeee7Kl3Nc5z3Q/6UYmOZN1boai1iWvhpxnCbjU
 a30YhrZQlveBSxFUmmukxzxPQXopfz12hxWStpW9u3Ovg0t+NTCpuFyv/olL5VmFgL1Maq3UNFb
 raeWvWm28VaJdIYBP5QLZbeDDVSOc62kg5Rruab1xr2oqTCyPmiX9sMZiG1mVAFa/2PJg+9GlOK
 FZFx+CWOn4krQCu5vh2qGiUaJDjxkQZCTEfX18SZ3wNoKCbjuFqhqZ5sCkqc+yk+SVb2gV6HM/q
 72t
X-Received: by 2002:adf:e014:0:20b0:452:273:5cd6 with SMTP id
 ffacd0b85a97d-45202735d7emr25054153f8f.1.1778494305447; 
 Mon, 11 May 2026 03:11:45 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548ec6b071sm24080110f8f.14.2026.05.11.03.11.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 03:11:44 -0700 (PDT)
Message-ID: <dd3e03a2-e470-477f-a5e4-485ce9595cac@linaro.org>
Date: Mon, 11 May 2026 12:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] hw/arm: Remove fp5280g2-bmc machine
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, pierrick.bouvier@oss.qualcomm.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, kane_chen@aspeedtech.com,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20260510165704.2935316-1-clg@redhat.com>
 <20260510165704.2935316-4-clg@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260510165704.2935316-4-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

On 10/5/26 18:57, Cédric Le Goater wrote:
> The fp5280g2-bmc machine was deprecated in QEMU 10.2 and is now
> removed in QEMU 11.1.
> 
> This Inspur FP5280G2 BMC board does not rely on specific device models
> and can be replaced by the ast2500-evb machine with appropriate
> fmc-model and I2C device configuration via command line.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   docs/about/deprecated.rst        |  8 ---
>   docs/about/removed-features.rst  |  8 +++
>   docs/system/arm/aspeed.rst       |  5 +-
>   hw/arm/aspeed_ast2500_fp5280g2.c | 88 --------------------------------
>   hw/arm/meson.build               |  1 -
>   5 files changed, 10 insertions(+), 100 deletions(-)
>   delete mode 100644 hw/arm/aspeed_ast2500_fp5280g2.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

