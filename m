Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F15FF5134
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 19:40:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wABou-0004u8-12; Tue, 07 Apr 2026 15:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wABoo-0004sp-Kk
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:10:34 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wABon-0002oV-9I
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:10:34 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43cf73bbfbdso3242448f8f.1
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 12:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775589032; x=1776193832; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QLMPykG6lfcrNa00ISi1soNyoXLxQUOTl5+omE2304A=;
 b=zYB2fM3QA5r7/jXWUhGXTGZpLmgv8HlwVDF02p4GKXpRhKdtKiOJ7cEEItF4RYP2+Y
 ekRpigIkdoGJ2Uy1cA8j7sLCmQ1bBKfPVLWTH5bRiUxadOTYlxqR4ahT7ZEPpOTiSeIG
 jnQQ9QO/nqS/t9DmU8qFu5riQHsUXZ8KR8UeBqnMTFofywPESJ2UpTLiGIOfPwJH4DOU
 CdQC5lc7Rzv0OMKMBTUemluDO7GjGrc5GmqvmIGpDCJYJ04g5DxxKGzfydIkI+/vRUpU
 0/8/GzWWFNsMt/JgAjzXaLUh32Hfxh4UdjBUtTi21UWVG3o3krhzX9LkcyK85Syt5nKN
 Acgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775589032; x=1776193832;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QLMPykG6lfcrNa00ISi1soNyoXLxQUOTl5+omE2304A=;
 b=BMIpxucrFFlhoDpDtlktD/luyiLbbOeGIbYQD63Ii36Dnou98C8p8WG+qPzCMsUETY
 R0gnfhPYqQLFF3j+GUi0e/ya8zHFXKcxYJhb+0fTUDiYOr9HnYBbs9NlubF8PocMEhir
 saDxi4JvzYmipsqdnNOGymPNL8Hp4zih4GFEorQb9OssJnpkaA7OCVXnarX9W0FSH4g4
 gLIMtdhYKrCljFA9Gz6YCfLycQIUE3/IGpy0HOwG1J0MjhOC3fj/dfk4f4+ljNW61s1j
 XyIZvjckmpJ33Jg8wvdtcVdtKQ8VAGrR0WydYEbg2KYXKBak+3sk/o9ZgpbhzAKRDWS1
 StVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp7DWEEV6DOLqghZ4Tr00vWN7H/HjPdopv6RFe7j1d5MxYfV/peDAI9m7VhuRfDLJwCs/nRGiIsw==@nongnu.org
X-Gm-Message-State: AOJu0YyDXgmuQ46Lcqb6wLEzABvga5TwFi2RTuYYKMcL6oyqTwkaSAZ/
 O6IJgrAotMW4fOc3GbuYe0jERrw66UWbsOoMzPvoPC7jJXk78gs4goGtWkYABSNkQ9I=
X-Gm-Gg: AeBDiev/wQ18FuVghDhsNJ8nYexdNtHYn9Id7uPCkCLXgwlUQZCAKs8JDbkek3R1TUv
 K4XXekX2hporMA94doHqrwT2eeEbCxHTEqnJQ8kp/xR4IhvIQJRzntg61Pbr5sVU8D5ggH3eM4H
 w25Tln7Tcf5w+XZa+1iunFtf1emUSnhxAg/wf3cZd8ITjL6yZ4XogpTPypOvDb20omdJU3A7SWC
 of0rDTSkBNJJFJjiSHt10kVQBI40owq0XyUtPfFfDn17wSlbENAC3mXPKbLBmvPhLbRhUjMVqvi
 AmqPexL6Sv8gytXAjZgCWAnaNi2/Cxf80m8wTowvZRMlX6o4lD06yKlc45w+XBo3t/f+fpkoE9x
 5RFOdjUPK2ELbsVOxBEAPHxxA89oMlFblwtHlXK2Sg4W0ZAea04wA+IyjtpxITBkX4i49qA5nKy
 yo3kUGGghntIsz64idGGpPTsHV5ZFs2Kt8ErsyxyVPcj5KMVSuwTZdn723qqTKygX10g==
X-Received: by 2002:a5d:5d08:0:b0:43b:80a0:d92 with SMTP id
 ffacd0b85a97d-43d2930fd53mr25241810f8f.45.1775589031784; 
 Tue, 07 Apr 2026 12:10:31 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f1a99sm55294838f8f.32.2026.04.07.12.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 12:10:31 -0700 (PDT)
Message-ID: <e0eb7051-660c-401e-aac7-29c03d5e50f1@linaro.org>
Date: Tue, 7 Apr 2026 21:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 08/20] target/arm/tcg/translate-m-nocp.c: make
 compilation unit common
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
 <20260407022748.57629-9-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260407022748.57629-9-pierrick.bouvier@linaro.org>
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

On 7/4/26 04:27, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/meson.build | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

