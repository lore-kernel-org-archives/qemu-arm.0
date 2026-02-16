Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51744E63F3F
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Feb 2026 17:25:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vs2LM-0004DO-1l; Mon, 16 Feb 2026 12:25:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vs2LF-00047K-Lq
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 12:25:04 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vs2LE-0001se-4j
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 12:25:01 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-483487335c2so32348315e9.2
 for <qemu-arm@nongnu.org>; Mon, 16 Feb 2026 09:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771262698; x=1771867498; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=092vyY2pu5P0qQlyeuwKjkRm11oNmFxVu1mg8dthB50=;
 b=wqvDb+xOvj26q4VvtbW06tdTEkaSpIh6isWTOSYQazp1e31/TFhG4+Kvf12XPl5EYg
 sSjH5mn7RcdpxrdlFxMinGfGWD1lmXmY5YqxybpQBOODR4buDOgUDsZJH+Sd/HhGpDYo
 DhwapZTfesBz7rInJ+aj7MSy7sC+W5JrJs8VAWReMyn9aVfA0+zek/+iVIiFZ4NOGhxQ
 kFqNMVA3YhRtaV17wFhoYZMm/gonY+7Ts9pZtwNuWkXjQWmX7G4Rto2jjhekA/OMyCqp
 6GR6/+WsTmsDDlp6xQUbNAGaXMkYNidE49FoRsRxd7uDrVLw84pH1QJbmnubNY+Gslx7
 pd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771262698; x=1771867498;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=092vyY2pu5P0qQlyeuwKjkRm11oNmFxVu1mg8dthB50=;
 b=tokEz14g1m1grsUsiqUtO38n807I1SkYdIxStD9NHdqZvj1hd8R80O946d7bx4B4wI
 RSqfkGtbI9+0abjkmPFOdybyhLsxDqq7irI9g9ynuHHEgXJ5o9JtHjcTImB3dTMqRtTD
 gl7l8rCd9RW9U/7l41T7CHX8C/JGnsyN2pv/tQ1kaYjiDs/X68gQ/z5OyFIs8MIcVNCt
 sn/HDnQ1d5lSKrCsRzlaDl9sw+abJ4Tey25cCbTGW6oiAFfooU6WXJKi3003jSZ2AdZV
 EEoqITCG64Ly5bBLKuMcjh3oBe0HEOGS8idoFoo2QUcuTDGwZ7wt0TPviBCfpxck0ck6
 iYwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzI6fzQTHhvBMto52fQg+5+L9+mOUEzVjJhlDshxoQc04jrPFLWmllqkWSFEn7n6liSQZs1wh/gA==@nongnu.org
X-Gm-Message-State: AOJu0YwlVaAspWimduZu0WnjGweO8xKEX78y/agDzPRyrB1D/SPMnLtO
 bEaNK0HJz2z8Y4K840GdeNhowZ+d+ZjfTzz4fX+OQSzAtA4DMJhr5eQqxKS7h7gYxJ0=
X-Gm-Gg: AZuq6aJ2HXh4qnjKVvYAT0ix/FaSBayNUAYJrUcR/GRDWC3OctWLBFZSladiCQaqGBq
 s+L2xXY/c2na7uT8zRxEoX88LyozbwjTboNNTZP/3zQSMEXNQATMbplQtnya7l3buv5ShxUIrLZ
 JgLgRTpToefJY0ej7lt6+sFCmjrTQtP/VvxH+QlZ2nbuj1CIUI8tPhTkurLyLAYEXn6sQzcFeOP
 DI1KSPp2Ay+zfiPIvxJPi4/kn1wGe5PawQfsHnlxnq0t+M5wHU57JVwg3s8myYpYW8IzSFZlZqi
 EROrcBHfl+EW7scfHVXT5LXA0Lz9CHHnxJLrhre7UgYzWjoZNvY5kU3eRPiBk/rVvhSRGS3AP+1
 gbS8LZEzqrBKJvX0O0wwu9VLYo8nyeHNPB5GF9OAz7ZGpiGiUdDu/ipr3y69y4M7DMzzJUsAHkU
 MbHL/n8cWN+AZKquueSM2kMWjSNr3av0GpiDanJhq7Y7t9N1uXE2B+BwoHoCPJc7jZcYUlQWWT8
 kkr
X-Received: by 2002:a05:600c:6989:b0:480:3a71:92b2 with SMTP id
 5b1f17b1804b1-48373a44055mr196367945e9.26.1771262697669; 
 Mon, 16 Feb 2026 09:24:57 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8075sm27926909f8f.29.2026.02.16.09.24.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 09:24:56 -0800 (PST)
Message-ID: <b1dcb5e7-5680-4397-971d-3f7544a20568@linaro.org>
Date: Mon, 16 Feb 2026 18:24:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/arm: Don't require helper prototypes in
 helper.c
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260216160349.3079657-1-peter.maydell@linaro.org>
 <20260216160349.3079657-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260216160349.3079657-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

On 16/2/26 17:03, Peter Maydell wrote:
> In arm_cpu_do_interrupt_aarch64() we call the TCG helper function
> helper_rebuild_hflags_a64(), which requires helper.c to include the
> TCG helper function prototypes even when this file is being compiled
> with TCG disabled.
> 
> We don't actually need to do this -- because we have already written
> the new EL into pstate and updated env->aarch64, we can call
> aarch64_rebuild_hflags() to achieve the same effect. This is the
> function we use everywhere else in this file to update hflags.
> 
> Switch to aarch64_rebuild_hflags() and drop the include of the
> TCG helper headers.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

