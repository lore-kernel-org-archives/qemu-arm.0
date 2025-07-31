Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7CAC87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 22:19:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhbby-0004Zv-5A; Thu, 31 Jul 2025 18:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhbY9-0000aa-1U
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 18:14:58 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhbXz-0006NI-VY
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 18:14:55 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-b422863dda0so206691a12.3
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 15:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754000085; x=1754604885; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uAu17frkcTkEkXcaZkcm0cS7GetCOGzF/S0l64Jrf5Q=;
 b=Sb59WQTbS3ekC5HET7+xhEj+3IO1GWbZXDjpQSh4KsJh+wXpC0QEVaE305kKHZsO/z
 KBqKBAkUbmb/j5jRjwJmxiwjcgNypY16cjnAgqj1RXI1RArpydNOKiMLU1WE4xsujV+p
 J5Cq87QCxK7fNpaRKnQ00ZEVzs/T5f+h/d4BEJiruHvaIf054fJNyqzPqOlSVh5ilHDI
 g9C7/eA1KqngZ+hh/CIQX92OTLon/NpAliR5Z13ZvF+q8KES+p0yCX764exAjIh63Q2p
 ZF5BB0zi/j5+3K0RQKf7bg77U/sPwJeCN2jPmlzwU/amUMEeKrSkBljLafv1Ab/iNnVa
 t7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754000085; x=1754604885;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uAu17frkcTkEkXcaZkcm0cS7GetCOGzF/S0l64Jrf5Q=;
 b=kamCkX8GbEL9TD2OFkgJf1M2cys5mpqcdgTmRVdE/r7LR7xkQ7Fx6q4rAayLeGhmPk
 3TbejRYDcHr4wMUN9vkZtnkVh5l5EV+c6uR9mRAd6ccSbIpwJH6OMp5BRgGZ7MLb4YU/
 P/yYu7iJUWSCmI0S2ueDpuyyv/ZxVCabuhFRFUxWWGgqm8rJTX/wvQ+euBh07cNOEcQI
 Rk4uQ+VsOvlD35MM82N98oUdkzF7lb7+BONfxIeIQnwgGpzxH0smF74m5basa8/RyWZH
 QMmGW8x0bOPl1k/Ex2xadNHvvPrs0Uy9KjU8AN+ph/YSObZ65POoylH1WXIPXibFgsQb
 sM5Q==
X-Gm-Message-State: AOJu0YzRHzmeIUbQqguU7OsMfists4+DRz7gijbl80OXhxP4XWcmEdAi
 XItAnVkpqlysvCjXMVRoF+bsgmfM23Ug08rnBxTWvcDjAzrlltn7dWnIgBEEbqISNjU=
X-Gm-Gg: ASbGnctMlPEGrmotL8+wX2SG0m/iRmRRSnFXprXMjIpRNRzrosYVaa1O5anSMxvLTbd
 D0LqLLfZN480SzAkXIXHk22HlSs7gCMGPMkbJrwITgKOQAAyoUGM6Yq3y4uCutkzM/c4tGQSbS6
 0o3xZqsrw7wVfenYpBjnQaXjA1b5QZvU/8mq76MxccCeS4rF6sG3Z4Odn5UgxsBd06tpUrhtxs2
 aBVwemRCFJvcs4PtUdtlFVYO7vY8Bdqo6PKwxfb6hu7o2Gr9EXhPYb/9q32RAA55KeWGb8j8SPZ
 KX6LIWX00/G6JRKCPh1vZ4hQR9JENdzGYmoBsp5ju4z6QO8fPnzSUdzMYY/UdS7GNh9gawxZTfE
 TDna6lTIcXKaBsyM9uMgyNXs8wsJnI1yHgsk=
X-Google-Smtp-Source: AGHT+IFVGcoBQvyFh7w09rKGnfQLog400lM8DRrLXl1Ky0v5n9Zca14zhWn4yotjuNr/SvqMwIlDfA==
X-Received: by 2002:a17:903:32cb:b0:23f:d47a:c9d3 with SMTP id
 d9443c01a7336-24096ae6857mr123735935ad.15.1754000084960; 
 Thu, 31 Jul 2025 15:14:44 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef67a3sm26714115ad.15.2025.07.31.15.14.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 15:14:44 -0700 (PDT)
Message-ID: <b992d6ab-308d-49de-a92e-091b9e71973a@linaro.org>
Date: Thu, 31 Jul 2025 15:14:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 82/82] tests/tcg/aarch64: Add gcsss
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-83-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-83-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Validate stack switching and recursion depth.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/tcg/aarch64/gcs.h           |  9 ++++
>   tests/tcg/aarch64/gcsss.c         | 74 +++++++++++++++++++++++++++++++
>   tests/tcg/aarch64/Makefile.target |  2 +-
>   3 files changed, 84 insertions(+), 1 deletion(-)
>   create mode 100644 tests/tcg/aarch64/gcsss.c

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


