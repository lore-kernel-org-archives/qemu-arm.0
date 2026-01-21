Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4536C44500
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 22:08:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vigMj-0003zE-3f; Wed, 21 Jan 2026 17:07:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vigMh-0003wp-DV
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 17:07:51 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vigMg-0006YD-1i
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 17:07:51 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4801eb2c0a5so2972235e9.3
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 14:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769033268; x=1769638068; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=abyx160Tpf+dSJPztRCgtIyZ9igEdG6K9C8f2TUcisE=;
 b=jE7o2fcisuCH0Xdl443DxIHZ/JAqfe1203hHwD0MWtAllKfshYX72MdYIw+90iIb9H
 jgnk9EEm83wHThU9MPEFZdMVJTDmray4+KGcAR2OqjnnZW7bD2MYiqGL57WwcRiMKhYr
 We7/EYXQxwbU10bhnVuthm5HPqS62mz+yF5+9ZKcRzArdKXvkd6sMBbDz8IYyf8Vim+T
 GbNF8+5HQR70iSkoEfat76prZpd7fP2g1L1pgKGhPNoHcX8HMSQf4p90M7NWdIPm3O22
 WSiW0IpbiWkEaFMW2xfNrLgmXHIJhW8xJY9yPoMrgYMGFoKawYL1BkZ+k5mxMIrnIiAp
 4URw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769033268; x=1769638068;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=abyx160Tpf+dSJPztRCgtIyZ9igEdG6K9C8f2TUcisE=;
 b=MIz26NhzC5kBXcN8FA0P51eqNkqY2d0AQhDklgs7KRPzVFi0tFIZyaHk+f4euU0Rnl
 ZFB0aotWGN/FHRMsZaKnD4YyywfoELsatF59r/989HixAZVUNom0i6i5qZIcIfkyn7Px
 SUqxuB8RbAxcMAJaoKtpR9RVlD13pnTpmBr+/nHetd/mYWgodiVfREuR12IxJHElu639
 PzjxaEaa+hBrfMDsGxcd9d5Wwm/+R/Uix+Hjw4dTa9pqEHibdiYJYSdWxGZ5Ff59gXye
 +46slQbhdOHT/H0ItNtgCPBLAHRMsHlj0Yrd86q/ah79Nv0Fb6LuIUJvvldt4s7vwdLa
 7VZA==
X-Gm-Message-State: AOJu0YyxjTPXCOqSHJK599cMBqyUo0ZmRnAHCzn6K+cj3QfEMwRPoGy2
 B1vCEXnUrI1CEbVKrXQHNOmxgquPj3LmZm8aIGaUeGn9df832EXx/XRfTU8AaSU+SB0=
X-Gm-Gg: AZuq6aI2LtgUaVsVA1yWPJe+jeBsBmFW90uutMXYhG3DNrcmDblvHGSXv2UEN+AsS+z
 vlz+X/OUTFyEAEyDdfulBErLU0phoPBllsCawTh7PqApqagx3BrPM4E4sQHCLO07quv3f4AfJRE
 erGyL/lFTAzuhOMKXFMIQEbaky7/p4Li3ir12vecSp2bS+t5WPva86S23YcYsMwCVehHwaaYcm8
 TTZay0Ax5nINiCxTrbecqUBbw1FYrdoxwL87nFBWPBRg8WnaUhv9tQb37ydyWZkZF/EBQECv6kX
 qDMqEENgp8lEA84s1Ve8U4HbQBohslHXutSHsoddpmuFsdju7Cdpmg7DNrcotKtECcbpLHaYIjd
 YBr5iKqumFAKPO70A/KBJxfIcJDrnGyCxuXNynWhRKWnD4rs5rNdkZksZF9XXAuUJjDlkcMolz7
 Fk5pUW3MqRbuG2Esr9ay7MYLY4n8GKg5Mqbuq5+7j01kzUFH63QRc9xA==
X-Received: by 2002:a05:600c:4f90:b0:480:3b76:6b92 with SMTP id
 5b1f17b1804b1-4803b766c41mr138098425e9.29.1769033268467; 
 Wed, 21 Jan 2026 14:07:48 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48042c38063sm31509075e9.12.2026.01.21.14.07.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 14:07:47 -0800 (PST)
Message-ID: <97e9b5e6-604d-4db7-bdf5-947d6b408a73@linaro.org>
Date: Wed, 21 Jan 2026 23:07:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hw/intc: declare GIC regions as little endian
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20260121105932.135676-1-alex.bennee@linaro.org>
 <20260121105932.135676-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260121105932.135676-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 21/1/26 11:59, Alex Bennée wrote:
> The GIC should always be a little-endian device as big-endian
> behaviour is a function of the current CPU configuration not the
> system as a whole. This should have no functional effect as the GIC
> cannot be instantiated on a BE system but will help the single binary
> efforts.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/intc/arm_gic.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

