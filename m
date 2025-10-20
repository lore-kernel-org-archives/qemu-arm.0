Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96307CCD19F
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 23:08:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAyzF-0007sG-HG; Mon, 20 Oct 2025 19:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAyzD-0007rI-HV
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:08:19 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAyzB-0006Mo-Ug
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:08:19 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-290dc630a07so24434725ad.1
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 16:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761001696; x=1761606496; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g0OnY+G6SucFiSC1Ha0XjhMDXzI0B8LGekH0SlSl6EE=;
 b=egnlJWitrNkqdclAASJnd9DFCOdhH26FnjyY+bKZioPw0D8YsxgU0fML9fBHVdqlDo
 kZ7DM7VpszZVq7ayIDqljAG6/QzYjq0OY79bbuHY7N1JrGdpnL/e5TPp5p+h7RdwCqi2
 ifn1cFy07ezc47Sxf2vR92oRuHHflFt5rbdcKC7Kyk6DLtvC6RcTTlmSA1XzckJVslry
 AnbP65aYVnG79lS9D6PJlTui1+oaYq7s5sCGinDsAnEgNTePyZ7qZ4pJk2uz5XrAWjAl
 wUcyhjiH15xLXB8ruMCq82Nxx3qEzwARtS5RrIZTLRQSaBE/ncc8i881Uy1cBaTJUt83
 7q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761001696; x=1761606496;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g0OnY+G6SucFiSC1Ha0XjhMDXzI0B8LGekH0SlSl6EE=;
 b=eQrSkeW4cAxMv0RcwbyDgLs6C5fFFfBbfds3XTpLLWJiw+f+XlnnsG/2qMRQ503vqh
 85/eJb7O9KBAnlTapTb98/J2884g+3ePCdn034QWDu59qSU+zsvu5ZVQ9gS/hfKumJpi
 g72inlWaNQeCvFZO+1GlmpVujSN54I2ZwtLatsy/vF8ajPZE43EtEONF+pBI9e6IGTdS
 uxBnaKAHbe+2DtG5ngW1I1uZF/4twpJSgtyhjLmQWNGV8qUL9hEVhIxE3KwTmdTWOsgP
 GbKrovYZb9UWNfxHu9CDSEP7UXq2v1jmLEX3OlxOrRRnuwgakwtR9ZmlS3w+QQ06Tv0F
 IUzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtp6hlOAU9ezEanr7hpoRhx76UJ/oMFasT+YLRxAk76oFTPTPEEupy4TPGsHaOSCttXZwd6SH65w==@nongnu.org
X-Gm-Message-State: AOJu0YzJAvcYRPpbIqaOh2ZVoMlFcdiOGTKuT8G0CgWx2jUOgH+OWSWQ
 5m5c5ncoM0OxuRK7tS+ev82Q8+GWSW+RcUDGEGZe2HxGSRW6IPUWHEjbe/ZGLO7izMM=
X-Gm-Gg: ASbGncuAdhzDwCK/pIapB6u9EPITbrqmXx3p//9FoF6f5V9BOt5S9j5lHXOWlYEsQ0G
 ofkGWEiClX2Bu11qCCSaz7SpA0/k5r8++8fBKkvA6vKsoqP/PUyarOqYRhBFzdMdQ8h9R7xAsmu
 RIwRNs/4XkXSc72cdWIfE0nAGiDkmQZII+Iaa5ztrqD1YyJG1/SSsE0q7lxFfH/WFiMekurJeXW
 RYYQdjX+L5oveodKHMwWvbH/vWSi+9m3v/IXnZ7quEXNAOjz6u42rAdnx+RG8m58CaKf4UaQi/I
 uNvZhKkiuzi1u+BfjiWoTIt0XZlohdbkLRUpiEYsscQRsjs9laPGDbX4Td99wx378tI5BuB0HA/
 q9rmIaBI4Wji3plncrqYfviJAhPZ6Iuts4RTMT4JnQtYkEDCW5uPfa2osukg6iC3SSowKCthpio
 nGf5rIKZDfO7DfLg==
X-Google-Smtp-Source: AGHT+IETOiBgONkNoHieLsjP1kdtVotTW1riJMn+J8nKKFOA48haiRhuK2dmg5TahHfncehxcwpCxQ==
X-Received: by 2002:a17:902:d506:b0:290:c5c8:9412 with SMTP id
 d9443c01a7336-290c9cf37demr201646965ad.5.1761001695970; 
 Mon, 20 Oct 2025 16:08:15 -0700 (PDT)
Received: from [192.168.1.111] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471fddfesm90404695ad.88.2025.10.20.16.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 16:08:15 -0700 (PDT)
Message-ID: <648e387f-808f-40c7-8ffe-4f519b8233ae@linaro.org>
Date: Mon, 20 Oct 2025 16:08:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/30] qemu/target_info: Add target_arm() helper
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org
References: <20251020220941.65269-1-philmd@linaro.org>
 <20251020221508.67413-2-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251020221508.67413-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62e.google.com
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

On 2025-10-20 15:14, Philippe Mathieu-Daudé wrote:
> Add a helper to distinct whether the binary is targetting
> ARM (32-bit only) or not.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/qemu/target-info.h | 7 +++++++
>   target-info.c              | 5 +++++
>   2 files changed, 12 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


