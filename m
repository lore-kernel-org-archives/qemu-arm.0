Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59A8CAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 11:44:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1kO9-00066A-5v; Thu, 25 Sep 2025 07:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1kO7-00060K-Nr
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:43:51 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1kNw-0001gY-6I
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:43:50 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46cf7bbfda8so5165475e9.2
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 04:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758800610; x=1759405410; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QDAiVucDnTwiiHSxzVHmrYEGy/lbcg0azc/QRJqtC/I=;
 b=Yioey535JckLaICMepqPwH30v/3vdyHfQdBcawqQRwBD3Uzi4+tE+ccTPjfi9jWb06
 NJ4GrGx0qqmGmbVhB5A1Wv2fEZdWJhlI46A3eQPuLUYol8ryGMcoNxfEJS28NjpERmtU
 Mwhd4zSyMt0z+hvIHBTuyoLeyvKWfHzMFyrf7A+A5lsOKY8Q0NZ7HC4vZtv1euUk/hqx
 KbPoCHKqqnl3oxSSwUoYRgLFaQch8eYAt2t2rVjt7j71IDheRBKZMaGIgIYe5uDFZQFP
 lIjFZQcjqJoDbG8v+UYZkO8dwcPqKYVOrh6i+X2WQhZNgoFHrgTzRlr0GhHB4YiRfrpj
 4nyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758800610; x=1759405410;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QDAiVucDnTwiiHSxzVHmrYEGy/lbcg0azc/QRJqtC/I=;
 b=R+CnbN51QElje6HkPPB8/LLcbJmrAAUtrXj/naWkbXdDFg5Xa3fQ5EdRnVnGmPNoqz
 Fl9yAAdVhLnujEoOU1wmaXI9REvUShHWYWaBqFGU+0kCtCSC9GuXlYTq1N3ZqV4eq2fA
 M2NDRmX0amlNPfrnH+X8cCa84hGuO4kKFZRzztS1gxNFnQbVazei7DKjUPtwH9ivt1UQ
 OotJb6CZaihMAyVTF7/nMJiY241l/aDRsH5rddOe04pVAkGSoW05R6YQd4QZHqpSG1Jx
 XZL+3TfkmYAnr3xEkia4yodAr0FE2oyWvuuNL5AZTA6VmIVA3DzCHvgLdrQFl/YNjnmy
 Abdw==
X-Gm-Message-State: AOJu0Yx6AhDCe3BtO5rFI3jhpPbmszZgB55FOLgkeE2a3j8lyusY6qkv
 kRSaKXNKb+oAk5L6mCl8QFC62F6JMh5+p+oZhFkPWG3SvNdE92WrRrUMhYEI9nB8R4E=
X-Gm-Gg: ASbGncu7hj06Mb11bMWHmM4ymyytRiFgbay5lyew3e5S5ZqrCrsgBaWP9LwSJqEIFZs
 hiqub2FA2QechfdJ/oh6BL4cZ13OQN1QEClIZ64Es0TJpSxZRxQPbHUL8h58FlEbXjJ5NhP8c4U
 SXsOrGYA/ygFCkjAbbXpNdGtw+lwr5cDu1AQHm3dhBjj1JvvmPvE1Kz3iD3urg3jda/MoYI9Hlg
 yrvhlTRo/uZB3UCNjDFTkxiVGWnVdFLPupmc/B/ODoeljUiC/hcwIqkkqJW687YVzsBXmtUis1n
 5IVlz36emXhWTBGqavvfnTHgXTOB95pTVVhv8gQgDUzoIzOfcPiDKXxjczj454KvY2r7XgVaRoa
 ZH6NeBDatasPmdm2Wt/zjlXCsm4xvFZCgsANH1iOlBQvJug5Vy9eOdlExbQho0scBTbDOCRzIpH
 NU
X-Google-Smtp-Source: AGHT+IGXQj3czMKRZvVqAWn8ddQww0WzBhnnwCBzpJ+lAIsIiGqLFpbeX4pJRILyvR6x7IAI87pT2g==
X-Received: by 2002:a05:6000:1846:b0:3ee:15b4:846c with SMTP id
 ffacd0b85a97d-40e44682b8dmr3123236f8f.28.1758800610017; 
 Thu, 25 Sep 2025 04:43:30 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb74e46bcsm2737147f8f.8.2025.09.25.04.43.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 04:43:29 -0700 (PDT)
Message-ID: <becd0683-f2e2-4795-bc90-e63d5a58fe5b@linaro.org>
Date: Thu, 25 Sep 2025 13:43:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/36] target/arm: Move writeback of CP_ANY fields
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-30-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-30-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 16/9/25 16:22, Richard Henderson wrote:
> Move the writeback of cp, crm, opc1, opc2 to define_one_arm_cp_reg,
> which means we don't have to pass all those parameters down
> to subroutines.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c | 52 ++++++++++++++++++++++-----------------------
>   1 file changed, 26 insertions(+), 26 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

