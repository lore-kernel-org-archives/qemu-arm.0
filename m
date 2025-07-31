Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1958C87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 22:11:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhbUB-0002SR-0i; Thu, 31 Jul 2025 18:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhbP7-0006DD-TV
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 18:05:43 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhbP6-00053n-9z
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 18:05:37 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-24049d1643aso7701495ad.3
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 15:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753999534; x=1754604334; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=83PVYiKDyIirv2WVwkBm9KU1K/Q/DopTJ8dmfiHBusI=;
 b=nusJRiFa58u3qbc0lPHUQxrEyXJ54xezxpiK8yfLKcMQLCNJ1F5zv0dscEorbWhPjZ
 JQ1GAvsZ0F6GsvF6eJzsnJE5rNOe+xT7xeaKxbyQXHSOR5R2Y3pHh6elFAR8RlBO3i/G
 xp3jt/rOU/rtuZWFXgvXXPnLWV1nnlFfxGBl0tAuaMVSw+J+ZuV0jw5ZkLGbb3iXRutB
 DF1bNfrH036/Fm1NzSg01fI0ZFziKxnpHigzJYZaqPOg8LxkgDfUfoMaGt53bKl+lMol
 DEzB6kgZgcGo9dnh6N9UfPKFs7mkwK7S6QJZVxmHrK/qCLrAMTiOmGGZ/LL02SGmJQBg
 kV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753999534; x=1754604334;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=83PVYiKDyIirv2WVwkBm9KU1K/Q/DopTJ8dmfiHBusI=;
 b=JOaiU6QFD/yyW+l9681JvNzCh0yjT1d398T/vUklY8twF3MfVBnCIpmeclZ3RzuGdH
 fQq+JMqySQzn1Iu0x35dnZVYVKuXTf0vQbIVyRCtleM1jtUM3oopo3RrbbFLKRmHo5kY
 RgTAZcTMNeOyOFktcO2N0zxjBt3mVfeEfF9Pfg90l6YjNOnm2zfpXI7SvYzkcTmCASvU
 5dMg7Qh1Bh8tmM2xfm8Hm81MHCKJlN3Kzmnz+f5teOFAea0RaD/h0/CKZ21LSa3k9Bxn
 oYYEQZ4k2jb2W+PuAh9gsCAd4+nbfn5GPlbHGbvIgdDBeCAK3jW0LBgeVetknjbcFpGp
 SNbw==
X-Gm-Message-State: AOJu0YzmmSUB0NIOeGCnnt4p+uiA52zF4FiFNlXsaQEUew0NE1s09tdF
 07CFqkl7YygJjW3xpRJqDXHUNJ7VgUdTetm3VDtqO+euatSmO5KaU5GX6X9T1l2U4d0=
X-Gm-Gg: ASbGncugQJ/YJAHDmcWvCpLmmyLRijEm4MdtGynMPwi6Pscln1v2zBNISmccItmyHCO
 xu3ChXNWAya76JWEOmwYb2pccCybU8Qp7ykJZRDxZpBT37Kb+yFCmGDPMwLksdOcylNrHpwoaMb
 sE60rY+TPqKRHzLG3mgbsBBLp6efWdYqftwoSr/I7Dp2OqtYC6EmqGjFMs9Q/Uw37tDmUsFGMFK
 ID3k3Zj942z1Gt6tnnPNviBQb3jK/3dzweoe+Z/tI61ylEL9NdwOI/jChVX7bFUDWzLxRbAEiYk
 9u1ov6CgtnDLwKB7EUWniHIseyHIcqDlM65Op/QSzpaVOt21r9cKtmWJrSTWoRjC3LWc3+zMdwG
 47t7vshH12iKSZ1J2rD1AvTa1YD0sF447Wws=
X-Google-Smtp-Source: AGHT+IEJBwqTN9BAPKUHPRD9MUjIMNxnPUtbqixaIZe2N2W9pF/jDvQMNkgd8a7JtpRIelFC1Kp+iw==
X-Received: by 2002:a17:903:1a67:b0:240:8fa2:15d2 with SMTP id
 d9443c01a7336-2422a69a02cmr3412345ad.33.1753999533573; 
 Thu, 31 Jul 2025 15:05:33 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aafb8csm26470765ad.179.2025.07.31.15.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 15:05:32 -0700 (PDT)
Message-ID: <0aec42a2-17e1-4a86-aca9-f1709923be79@linaro.org>
Date: Thu, 31 Jul 2025 15:05:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 80/82] tests/tcg/aarch64: Add gcsstr
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-81-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-81-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x631.google.com
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Add some infrastructure for testing gcs in userspace.
> Validate successful and trapped executions of GCSSTR.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/tcg/aarch64/gcs.h           | 71 +++++++++++++++++++++++++++++++
>   tests/tcg/aarch64/gcsstr.c        | 48 +++++++++++++++++++++
>   tests/tcg/aarch64/Makefile.target |  5 +++
>   3 files changed, 124 insertions(+)
>   create mode 100644 tests/tcg/aarch64/gcs.h
>   create mode 100644 tests/tcg/aarch64/gcsstr.c

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


