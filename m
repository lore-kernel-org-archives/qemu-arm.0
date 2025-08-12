Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0748CA0EC4
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 06:14:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uliHN-0006WK-Go; Tue, 12 Aug 2025 02:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliH4-0006JJ-5c
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:14:20 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliGx-0004NP-VT
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:14:17 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3b78d337dd9so3228577f8f.3
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 23:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754979247; x=1755584047; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ElmGRZXtBianV6qZi7wLW+BYFTb5y/OXbI4Df90GETI=;
 b=fZycT7VajNJw2k0XM/DjeVGQgvd//q/Bd97FifVcFb3ompUQSiXDFLKRw19AQIzcuV
 hwrh39kfO57W1sxYp8m+a9xKjFTQc0/jgYMmR81JVUVAbgiDCA9jGYOX3mTPrMudHrUo
 WkUWJaYBDBSDj/LkBXQ7CYjZCncAKwvm/J0DoAAg9BLLTJg70zw/af7S8gnkTV3SkbQV
 J1QX/vXDWIF1ieusNAn6bEXrn6Xo8EI77O369GvcO/EUIpO1OS8XoQsmA7/y/cxlS8yq
 krmmQmPYps2YRrNta+7LS5UYZBT36oF2jGZfvOzOb5jEG6gaT2/c/e4hezPDQ4kEaKyI
 5mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754979247; x=1755584047;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ElmGRZXtBianV6qZi7wLW+BYFTb5y/OXbI4Df90GETI=;
 b=pRU21kd+L5OZTJq24fnumXpMKTNMnwGsTuRzeaMDoQyF8uSBqJQhCuRXpJqJ53P1Lu
 eJIehRYTiGAsf97teTqXg6zAyVNfwpeJljouzCVYR4mbkGEv75Fs8L5/g/r8tDnO5kAu
 iNQZTOhUfGYw9lRxJmLRcm8XADOQ1r20zhLGC/u54DhEOJ8Ik8k6A+Jev8vFfBeOboe8
 Op6+xO97/RfdkI4t8t4v4hu8a/R5bxiAcdNA3Pl6nG9uAaK++mVydfmhgDT2UcmoLWRk
 rCoDHlieewK2FDKMPnJMBkmtYaDp/iOZSSgOkXwA7u4tYMjJvAlJlO0Kjw0GcOCarSdq
 gLyQ==
X-Gm-Message-State: AOJu0YyJMTKm1j0NMEX89FvKM9PEEZOa90/WX/EvpKcBqCnNkD4TIBlb
 Ev/iQx9vC9U4F9/ejBoxmqaHRt76FDEviAK+nlLpGCgCcKYcm/5OpHOb+HRC6A2JhMU=
X-Gm-Gg: ASbGncsd8JKZgS4KmxhRvblvk8yPGv2mle2o3xjrTjPtm8G5U8033gbA15nmCX4Zi2V
 vDI712T/jqK3tGC/TditbiwFZst3OWZd/NMTn2vEYoH/FXa9B2g1BKVl4MmvsoRb2peA09St/7x
 wFGRn6cvU2Vt/qGqoLBHOZNM0i3qXu/Vswr0/8ysti+p14Zr9M+1zxx5+3z/WZmgc+WsdWRpTie
 RmF91luwVOPHAYfLwg22zWckuxMkbquBY4FvaHRe8hrNZx5P7e5aUca8S1Riu2K9kVWV4R5kCyC
 SDd9DCoaLw7t49ndGbe6ktFMhGfJV2s0/uVGbxNDhV8zT30wjnlu39p8+Guv2RJWdncEAg0hd04
 sIPxjwmVeZ7LZmSN7Azj5AM/dCDhWPg6wZs/ta/iEtHsU63F36PKMb9+VTUJgtrc2Gw==
X-Google-Smtp-Source: AGHT+IG7Egdiq57krLhYfRt5hbgwVtBqLSjMS7+TYvq4FZMwSdgCTNHNqegl3WryRBOMIce7LmvXRA==
X-Received: by 2002:a05:6000:18a8:b0:3a4:f66a:9d31 with SMTP id
 ffacd0b85a97d-3b900b2d56cmr10940359f8f.16.1754979247094; 
 Mon, 11 Aug 2025 23:14:07 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b9132f00ecsm713509f8f.24.2025.08.11.23.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 23:14:06 -0700 (PDT)
Message-ID: <f8e97cdc-1ee1-45b4-974b-822cfd469117@linaro.org>
Date: Tue, 12 Aug 2025 08:14:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 41/85] target/arm: Convert arm_mmu_idx_is_stage1_of_2
 from switch to table
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
 <20250802232953.413294-42-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250802232953.413294-42-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

On 3/8/25 01:29, Richard Henderson wrote:
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h       | 19 -------------------
>   target/arm/mmuidx-internal.h |  8 ++++++++
>   target/arm/mmuidx.c          |  7 ++++---
>   3 files changed, 12 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


