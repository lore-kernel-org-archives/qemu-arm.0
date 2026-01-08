Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20759D1D494
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Jan 2026 21:08:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdxEm-0007uE-4B; Thu, 08 Jan 2026 16:08:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vdxEk-0007pG-Hh
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 16:08:06 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vdxEj-0004I8-0L
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 16:08:06 -0500
Received: by mail-pl1-x641.google.com with SMTP id
 d9443c01a7336-2a1022dda33so23435775ad.2
 for <qemu-arm@nongnu.org>; Thu, 08 Jan 2026 13:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767906483; x=1768511283; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ziI4BWcl2GdbvwhB1oeCzrrRMbMBSD1h+o2Xn58dEi4=;
 b=mmSdKLdmmkpT2Iw1IV2seNT3eO4iSAolQh5j9VX2XE5zjv2GM5+PU3tqfypOChdAgW
 wWkcl9RlmzAwLKhqYhTlW9SIrHmHhJW4tGLexVIQpH7F2QboC3+KdXoSfpqrRzEUsYun
 g4hJ+Bmet2w/PWktH2NiFPy0CKXJyhqukktXmtH11ISH/WpuPApMh5h4pjqgxNgAp7si
 AgLx09JGjr0wQYlaV7pvIClyAU5F+9NbYXOFUWmCqAsh7whqt0J8NzQUiY082X7Geozh
 Jp0U2/LlWQD+k24l1NPp1R8371+nwrhhn32uXee63tjuLf8JH/VALvaGet0BtVdkXAjp
 3vgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767906483; x=1768511283;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ziI4BWcl2GdbvwhB1oeCzrrRMbMBSD1h+o2Xn58dEi4=;
 b=p3Ba4zj57mJy9fEZOEB3yrZrryrCiQBqaQ2fSjdyUYsmSzP4tSDJCDHsz805FKEsya
 1uKT0Jf1DvmVZOyN3krzeAOfauBXtOjea03DwYYsYdLSW+GgsaF+nYyAqS7drlCrGT6i
 N5NyEFM20vB2D25kQOxTPQfQwE5ksB5HIN6uYpSZ/A9YnesFx5NW9fLRIn/U7e2JP8sa
 dNA21c3KdsWyXeUOJKVPnmPW3Cq7AtUM5wqDIRIruNe0qmxO1GFxFpgMW3zuTb2miYL0
 c8BsslX0stCBSS+pYbElWKb/k4Ihu94MjqFgIJP/4S4q+TEVZV0eSeLR079tXvAhFsXt
 ymLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA+ObbTstPB4+x+yiaHfghAERhNyeWlccuQ+1kqV9AVMy4FyFsiXVG4iIFqVQ3pzpGBQPeMIzqvQ==@nongnu.org
X-Gm-Message-State: AOJu0YzGq7UeX0Y/6mPjKO7zxeDn7fCiHFz1n67DBa5tilpiaeEnOfwD
 5OLGFQYFvhNNefTp/bZmx2kW3Py5WW4P3WBh7/u+olH+wp5Gm3Si0KDlgUi05jizZgo=
X-Gm-Gg: AY/fxX4ZPo/D4HJeYnKXxObmjOYPjdwuMsDhaEdENfVMyrwiqF6wwFPg7RefMQB9C7i
 tb5dtAYBSnc8k0QG1RAlhB0Z4WrGdoUACGluYtcG8ARol22iFXR83vpwgVwqLgpXlMZ7y8cKLOD
 Qem12Mz+1uPR4HdNr+hj2J9v5XH5t6Ncetuuy1b5x34YNQSj8ZedkbElTaSaHqX2eYywZj+1Tfw
 jIlok4MeXOu8KRvS1YhFPGC7P1SdQ2/Grm70RdfGWY2trkB3beuszs4BOeJfYkn95Cgky0E2GH1
 kYb2UMJCkZoWSuWHwee5CrmMEgKZO7kOnVWyYquZnGZZgZHJUTZptFF+rGWPFTXt5VS6s5lPIg7
 KdQw+2PtZ86FaP8Ly8ScTbSwVGreDF28OeJ2dic8IZS05BkOHILDpt+FnWgXAM3mdoadcWL915D
 t8RQ9zTYer1n3WwQMbJ+BOELTeYm7fnd36s7+sOktLMQe12q3QrzoffoIqK7tlwTJF90c=
X-Google-Smtp-Source: AGHT+IE/iwFAk9Y7iLIjrlZXpIplq4nS3kzfbzYAJAT6UzTeVtbRx4cmPJUGPyPpJAyIvN1We8Zqbg==
X-Received: by 2002:a17:903:2341:b0:2a0:c1ed:c8c2 with SMTP id
 d9443c01a7336-2a3ee4b4497mr60543505ad.55.1767906483282; 
 Thu, 08 Jan 2026 13:08:03 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3cb2c0fsm86979535ad.66.2026.01.08.13.08.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 13:08:02 -0800 (PST)
Message-ID: <883095d5-0df5-415a-9c4c-a98ec705b973@linaro.org>
Date: Thu, 8 Jan 2026 13:08:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] hw/arm/smmu: add memory regions as property for an
 SMMU instance
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Radoslaw Biernacki <rad@semihalf.com>,
 tangtao1634@phytium.com.cn, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>
References: <20251216235731.1793908-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251216235731.1793908-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x641.google.com
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

On 12/16/25 3:57 PM, Pierrick Bouvier wrote:
> This will be used to access non-secure and secure memory. Secure support
> and Granule Protection Check (for RME) for SMMU need to access secure
> memory.
> 
> As well, it allows to remove usage of global address_space_memory,
> allowing different SMMU instances to have a specific view of memory.
> 
> User creatable SMMU are handled as well for virt machine,
> by setting the memory properties when device is plugged in.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/hw/arm/smmu-common.h |  4 ++++
>   include/hw/arm/virt.h        |  2 ++
>   hw/arm/sbsa-ref.c            | 16 ++++++++++++----
>   hw/arm/smmu-common.c         | 25 +++++++++++++++++++++++++
>   hw/arm/virt.c                | 13 +++++++++++--
>   5 files changed, 54 insertions(+), 6 deletions(-)
> 

v5 sent:
https://lore.kernel.org/qemu-devel/20260108210453.2280733-1-pierrick.bouvier@linaro.org/T/#u

