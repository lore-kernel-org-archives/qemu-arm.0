Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5210BCA0EEB
	for <qemu-arm@archiver.kernel.org>; Fri, 22 Aug 2025 14:32:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1upSnh-0004VS-EC; Fri, 22 Aug 2025 10:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upSnf-0004U6-EH
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 10:31:27 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upSnY-0001R1-5Y
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 10:31:26 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-76e2ebe86ecso2780481b3a.3
 for <qemu-arm@nongnu.org>; Fri, 22 Aug 2025 07:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755873075; x=1756477875; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KcELbuUw+1+H9mAOl6UQfrPWV7H4vzw3MR6CPhp1FTU=;
 b=wW4P73g530PO47WKstWUvAtTVGH6rdlPiYO2cPKUb+zq+a/Xh9S4PWq9y2JkMHZhEB
 qqtfL29rtJeeebTg5IiUxdQC+nNLMvnAkF5mWKsBxo3XESi7ZfPHLeruQAxhgpF1ajMY
 72vgInankBzLpr9ocovG+XeHX0siw02WllMBJuM9ppmf1+AHzbGBY0XMrqwgppHdBkTR
 GcrL9DqW+AQk4WsivJr1hDB1VyulCoENZx3EnYnjLqqJwp94bS+HddWqluuel+cexMFa
 mRey70vLb3Y4kZoDDDdvP0/HBI7KZVI5ZN4f66CpTOwo9+vn46G8uf60hHt26f9g8fV2
 0ncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755873075; x=1756477875;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KcELbuUw+1+H9mAOl6UQfrPWV7H4vzw3MR6CPhp1FTU=;
 b=j6ugmKZOBMhYqkj5bLyg6UW8ktDrbmtgus1El2P1+e1gy4C1nvlHWt5dhQqxzC3sSY
 6cBGRthvaulsTueo/daWypKQ2M8AzUAlKmx5IkBAfK6PllyW8nkJHVpii3GaT+r2fOC0
 DM4Se4EGkPYNIXEFvnvnqjjzGFObQDG4IElSxZxQ01Hj8Hdu4NGLlTkQEHhQGJqyDPVN
 ORWSUjZIYSgjy7mO0zwXZeDJS1HLZm419EquMXk6EDKTLb4YOtVGjV6Z8c75rLxgXjDs
 F1tuLk+Eaj4yG+Nz5QwK/o18yGub0dc3U5JHLFvXIHjfQqfI2qzswmBWJoWrCEaJMvMw
 EE7w==
X-Gm-Message-State: AOJu0YyIX/3rNVzMzf1VB2XEcW29lAgs5Y1eDPJ6kq9Y58NSDGzrGbyV
 8q2LlXWMgS0soCVoUE0tA+9RZ/r3KDrDbEgsqF9u8fduag2p5WBCpQKD1ls8GDXNvwA=
X-Gm-Gg: ASbGncv/lpOrXXlygPpQ3KxtbTRFSKuY5COKIkwzKB4naIqVbGFkX0yn11LTrxJMa4m
 Dr31FpsXbtKmE3FrNl5J6iIcuDq2NQCpFYjEIjs6dnazMA5/OxGPHhXD30fX4MdMidPu5SAsx7T
 7je1nA7mrN2FtPHJrnda6S++LWk+suysVOB1zw8RZWoYoin2FBHEaHKl5ihJEioL9um9/MnDRk2
 krFrZ3z9MAMyg66kSvkom393ZM89UeGeuAuvSFiigcU4e06PmZoSvhLC3VPZO068Ze7hefR8tzV
 tBRuPpqLxTaH7EhP7Y3osxgS+J0mtNnSTicidIAUb45Qs9lL1uCu2SD0FD7+ynorO8DO0F3eBNg
 893TEuVkF5el30uIB9hQuYVRoD5wHK+Wy6ZSp
X-Google-Smtp-Source: AGHT+IG/qnmJphPksiFoF5HNix04sfvMrecB3tSCzxKuuoV+LT+s6eanNCiy2VASn6zRxic580x5tA==
X-Received: by 2002:a05:6a00:3e1e:b0:76b:caa5:9a32 with SMTP id
 d2e1a72fcca58-7702fa019ddmr3763536b3a.11.1755873075170; 
 Fri, 22 Aug 2025 07:31:15 -0700 (PDT)
Received: from [192.168.1.111] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7703ffb48a0sm130837b3a.8.2025.08.22.07.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 07:31:14 -0700 (PDT)
Message-ID: <3ca7be1f-267e-45c9-9894-67e920ad5ee9@linaro.org>
Date: Fri, 22 Aug 2025 07:31:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] single-binary: compile hw/intc/arm* files once
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, philmd@linaro.org
References: <20250801174006.2466508-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250801174006.2466508-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x435.google.com
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

On 2025-08-01 10:40, Pierrick Bouvier wrote:
> We simply compile them as target common code, without moving them to hw/arm.
> 
> Pierrick Bouvier (2):
>    hw/meson: enter target hw first
>    hw/intc: compile some arm related source once
> 
>   hw/intc/meson.build |  6 +++---
>   hw/meson.build      | 45 +++++++++++++++++++++++----------------------
>   2 files changed, 26 insertions(+), 25 deletions(-)
> 


Ping on this series.
I'll be out next week, but it should be ready to be pulled once the 
trunk reopens.

Regards,
Pierrick

