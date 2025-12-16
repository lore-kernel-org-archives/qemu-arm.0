Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F800D64061
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Dec 2025 23:58:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVewE-0000Xb-PG; Tue, 16 Dec 2025 18:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVewD-0000XR-RA
 for qemu-arm@nongnu.org; Tue, 16 Dec 2025 18:58:41 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVewB-0000qu-P6
 for qemu-arm@nongnu.org; Tue, 16 Dec 2025 18:58:41 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7b9215e55e6so3765107b3a.2
 for <qemu-arm@nongnu.org>; Tue, 16 Dec 2025 15:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765929517; x=1766534317; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EF0id/+k3FGCmd4ldUZgaea2Q+pPpVUsEhxcIAFitHc=;
 b=RKQ7QkFR/bdLHEZaO+vq4ROHROwX5+varX8olxxoPrQAr/lZerWNsz3c8XPr8ZrI5f
 0jczCdyDFTS05kZQvCguGFgl5coJ9997hrpJD1ifiwMT5JoFnvK9w0rXT3xUpFOeUfW5
 Skq8AWPG+WLV9GrSANEMrC5WlZkd6gnmY3UC4x+KP+zxU3dH80BDlg5hn1FQ6UqmeCPz
 jbSWzWQQncz20eLuxGM96IX7kc7iy80Z/6GuPCjX9SojnQ6FQuIBTNDpbk4aUhbMkCrz
 EcDajohIEwdwVFJtSjQJ7Milyx0rzBSXAetZDHKKDVuA2dQD3x+KhmbphmcWCQXd8GMj
 e73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765929517; x=1766534317;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EF0id/+k3FGCmd4ldUZgaea2Q+pPpVUsEhxcIAFitHc=;
 b=rE/dGM9hNNpSsLdJO3nA8qjRkMCZt4BCfJOvgk9a+p6QxIyA5Iv9Hc8OS6nGiMpF8W
 9uPYvdc/QqizCvV/i5xA4GHkTdDPldag1kmqj9xHUAR6PgsRuDo1XAxEMU9JctkL2acn
 iGEbvVgilZcWocNvNdT13fBDC23wzroJMbDFr6VYxr9DcKjEUSP2mBnsavu7K5gkxwYR
 JraTX7TcpOUeaSfFy9RtLMRh0CHCuEyX7T94103j80/DUH8fXaWUXIGY5TL8L2bKIDfJ
 tJaxA+bmG3cSwQXNj6MErbxXx6zc+VP9/W/X2jfixiLN4VjNgDESwkZtiQtDgd54tLca
 VxpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+jbHHIWj7Pxu4cIEh2SH+xi3UFtCezl/u1ecJaxUsOMgrz4RX+hKmgSnjfcNoMqb/MtBcH+SWmQ==@nongnu.org
X-Gm-Message-State: AOJu0YxSQ1OxwPV6Ly7i2kar2C2dglrbvmvqbt/+HvE1sy49ycJmGp8s
 MVquaojYGhwZuvxDrX5+LN/I65EBsuAl7n2PW6XkNXGgFGgsCLl8StBCodd/lgr9oKg=
X-Gm-Gg: AY/fxX5YQMi+6LcTPd8Yd/cIvsKHbjU3cjs8+1SOXhLaHH4gZRhiOLYuhwdjLbBkA+Z
 sKBEfv9uR4RjGivXggvkPRtyP9bB9/5sZSBrphGpa4Sj4yX14gOYPe+3SsRanaq8k5dnhyWPEgX
 OLzMki5ZKWjfW6dssVDm53dkTiHH+kN4hUXmm1q4ID2NfOX6OYpTPhbv7VreSuTCD9KZKldBNc8
 BLpSMeg4OqUnmcgHFZJyxSQ2oJ1XneEn1G5a5wezGG1buvip5GgMll8yMV9BY/T1rqRwsLOWOLO
 jpW8+lRMZgbYe+ie69C8SpdmyA/eJ1sQUmTnGAgNca8W75u/Bvv1tGvG5LLkylMqDLiZsf8e+bG
 6TxZGABCC9/CsCTCRN22as0LmbDJq3ayEzWDaHsgO7Hv/UamsbysgUTj0JIEpJqV0hs8PQ7NsEV
 GAwfuGZJYcrJ8dxvDPhOqKQ3xGAIugoKw34aLf9rgUm4ckx9iK4AcKwUs=
X-Google-Smtp-Source: AGHT+IFeH0wfAGHUWbLWlp3YPJmCRBAYKyediMR2UsDkCqqlfPvjjOAK/9ILsfxv/KnZjQuPxeKGUg==
X-Received: by 2002:a05:6a00:3391:b0:7e8:4587:e8d2 with SMTP id
 d2e1a72fcca58-7f66a079ee9mr15827110b3a.69.1765929517033; 
 Tue, 16 Dec 2025 15:58:37 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7fcbc5a2bd2sm676485b3a.67.2025.12.16.15.58.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 15:58:36 -0800 (PST)
Message-ID: <5e55a368-a268-4799-ad7b-6e113d11c40f@linaro.org>
Date: Tue, 16 Dec 2025 15:58:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hw/arm/smmu: add memory regions as property for an
 SMMU instance
To: qemu-devel@nongnu.org
Cc: tangtao1634@phytium.com.cn, Peter Maydell <peter.maydell@linaro.org>,
 richard.henderson@linaro.org, Eric Auger <eric.auger@redhat.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>
References: <20251216224845.1673051-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <20251216224845.1673051-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42f.google.com
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

On 12/16/25 2:48 PM, Pierrick Bouvier wrote:
> This will be used to access non-secure and secure memory. Secure support
> and Granule Protection Check (for RME) for SMMU need to access secure
> memory.
> 
> As well, it allows to remove usage of global address_space_memory,
> allowing different SMMU instances to have a specific view of memory.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/hw/arm/smmu-common.h |  4 ++++
>   hw/arm/sbsa-ref.c            | 16 ++++++++++++----
>   hw/arm/smmu-common.c         | 27 +++++++++++++++++++++++++++
>   hw/arm/virt.c                | 16 +++++++++++-----
>   4 files changed, 54 insertions(+), 9 deletions(-)
Sent v4:
https://lore.kernel.org/qemu-devel/20251216235731.1793908-1-pierrick.bouvier@linaro.org/T/#u


