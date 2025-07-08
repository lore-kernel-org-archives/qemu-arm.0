Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4316CC83F09
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 20:48:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFAE-0002J4-7z; Tue, 08 Jul 2025 16:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZDgZ-0006cD-JM
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:09:12 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZDgT-0004w6-Fn
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:08:56 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ae0df6f5758so790382266b.0
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 12:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752001695; x=1752606495; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OqYTuCNiZiX8zi1SLZHeCYNVHaveo99iC222kPTZLq8=;
 b=k3l59SvGkTR9d0s9gbN8SuA1Ng6D0l9N/ifS+liilsyg+PgamRmSUjj1SkcDcB51RP
 bN83+7qp01Iy8fRi+UcO+3+SI554Q9gwK8X1h4KvPIhiSM9/QAAmqrAbHrP0LfqHJC4r
 eno/RLVw90SpRoUmurgApPR6vm2y1slxTJRJSNEcO3lmkn/jp1au1aYeDYLmsru7L81c
 cmIK9Q6QBsmn5xI87agu/17qkorizRuENk80KYJfhw5gKAW/keFQC1nZlGbL32bwcnra
 JLD6jsyFTP0liGpCh7bmumL2gwW4ljkGFBRw/w/MCQQbcO++tRzl9hmbv2c68VB8pOIB
 rQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752001695; x=1752606495;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OqYTuCNiZiX8zi1SLZHeCYNVHaveo99iC222kPTZLq8=;
 b=Ysm2T6O46O635g3XQg4SrL5poFlYqYMNM7PkTAKCjKGMJOKkLVNOwtFW/wqltHyIca
 gZE7RRhUQZ0JuJkndzA9JB1kpA2MGaPWndCPaMOcp3FdNVfF2yJktZAXpHCH4pDJ0GsN
 Gyk/q6PH2t3uJmpUuEKuaIrmooTNTLfp7KCtE0JAVF8VQpaSH6UKEncYxsMUJRzYYpcR
 N3L+OdF9niSGR7rTeF067y/qJNWsVXCtKKebJ8ab9l0tjgJc+2D1R48SbVRQQTo9fxkM
 g9sfErGM5N3//wyxPT4NlN523d2IxiJnSvfmFqDWhSrwJsH2CZEVwYBWJ4kbxy9tdrbD
 HePg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqy3Jsz+gtbRiiHxVXLVVYPHX5HRtwofFpo35j+cKoiFqNI6U1fzPDAE8nMRTMdNT6r7Xzw3rsGA==@nongnu.org
X-Gm-Message-State: AOJu0YzC9LLiz+yeJ7Q6nU9F3eSpDIlrX1M4sAvS5egz2epnNduzvmG9
 4vNhI4YO19rGq88/hEKVALYIg+B7OsJnKbN4xQHCcRy96wU3rPXU/Cf1BWOOJ0VjhscESFNtKZ5
 vXPF5
X-Gm-Gg: ASbGncuX3GIXvUwsHo0vkHuGNqq6dG7f/F0nWqoVg5TKD/2LDBAnZ7kFGNmwrutvY55
 5DnhcLXzAS/bmjzwUDNayGQAGmzHsbIHaBruIjB6f/ERibMpHvIKKnSRMWMuoGsNgba+ZyMWENU
 dPkoBVqgrYMLlTa2j9LTILbDcUhnEN5FhS2dcN48X9aG4ICr6CDdeTE7+fKcmI/EQKXgBC/jCAh
 95bZv311Ywe7IZd+HSqiTm5wrnLX/xOQ0//0fIu/B4u5k2YClv6z0Bq3rYIzhEgOXo2Uw9lobKb
 2nMbyLnUeJyTfnYjEspDMPQV3sLAhp3nwkAxxn0hlED9XHcxq2lIx7mc8DCUGVirYJBR5MAPGAU
 94PD+ZDSj9UGWJ67/EyDrBg1CR7xAjfGaJSeQy0Bx
X-Google-Smtp-Source: AGHT+IGwaihnAEepD74IpnE32Ml4CpQq7yS6bPmQPjzCJbQ999fIFyIc9hoif/JyG0smPFOTL0s0cg==
X-Received: by 2002:a05:6000:2583:b0:3a4:e629:6504 with SMTP id
 ffacd0b85a97d-3b49703925amr13885616f8f.49.1751994670877; 
 Tue, 08 Jul 2025 10:11:10 -0700 (PDT)
Received: from [192.168.69.242] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cdb381a6sm19420795e9.1.2025.07.08.10.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:11:10 -0700 (PDT)
Message-ID: <b56156da-c323-4eb2-9d0d-739e69769f14@linaro.org>
Date: Tue, 8 Jul 2025 19:10:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-10.1 v6 00/14] target-info: Add more API for
 VirtIO cleanups & introduce ARM macros
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org
References: <20250707172009.3884-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250707172009.3884-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
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

On 7/7/25 19:19, Philippe Mathieu-Daudé wrote:
> Rather than re-spinning the whole "single-binary: Make hw/arm/
> common" series, restrict to the API additions, but include
> examples of their usefulness (hundreds of virtio objects
> removed from default Linux build).
> Time passed since I context-switched out of this work so I'm
> not sure the DEFINE_MACHINE_WITH_INTERFACES() implementation
> is in the form Zoltan asked.
> 
> Philippe Mathieu-Daudé (14):
>    target/qmp: Use target_cpu_type()
>    qemu/target-info: Factor target_arch() out
>    qemu/target-info: Add %target_arch field to TargetInfo
>    qemu/target-info: Introduce target_base_arch()
>    qemu/target-info: Add target_endian_mode()
>    qemu: Convert target_words_bigendian() to TargetInfo API
>    gdbstub/helpers: Replace TARGET_BIG_ENDIAN -> target_big_endian()
>    qemu: Declare all load/store helpert in 'qemu/bswap.h'
>    hw/virtio: Build various files once

Sorry, I cut this branch incorrectly, I should have posted only up
to here, as the rest isn't required. I'll respin for clarity.

>    hw/core/null-machine: Define machine as generic QOM type
>    hw/arm: Register TYPE_TARGET_ARM/AARCH64_MACHINE QOM interfaces
>    hw/core: Allow ARM/Aarch64 binaries to use the 'none' machine
>    hw/boards: Introduce DEFINE_MACHINE_WITH_INTERFACES() macro
>    hw/arm: Add DEFINE_MACHINE_[ARM_]AARCH64() macros


