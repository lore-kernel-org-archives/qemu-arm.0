Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC068CCD1BF
	for <qemu-arm@archiver.kernel.org>; Sat, 25 Oct 2025 17:58:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCiX8-0003Sn-EK; Sat, 25 Oct 2025 13:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vCiX7-0003SJ-1T
 for qemu-arm@nongnu.org; Sat, 25 Oct 2025 13:58:29 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vCiX4-0008VP-Tw
 for qemu-arm@nongnu.org; Sat, 25 Oct 2025 13:58:28 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b6d2f5c0e8eso655723066b.3
 for <qemu-arm@nongnu.org>; Sat, 25 Oct 2025 10:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761415104; x=1762019904; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QFIs2Aa0aI2/4xr0LydnbBXWZBqgexMa2+DBnxdrxyg=;
 b=wcv2fplwycv27d/gRdGWI1VyILX6OCFTWfzKOyJUlPV+PLZtJb/apsquJZ+4MGhiwI
 QaS0s64dqI4TvFKKk/dX9LlSSkv8ugH7FdX/grk3WBl5MBnsjARpgVG4PSDiIfs5n06a
 XHiYUgEflPA/c/IfkOaTfyPyDAwVPFT98clasp2a/YxFLBKcumnfnifD/55x8ViF6EHA
 CAKcoH8ROUk0cDT69pJXfqap4mXbUEvci+dLO0GQOmKBtMB3+vOOmCIzib0j7BixVuu8
 Hny+TNDjsTEYt1FrS5+2xwvFwX+Th9xRNhv3od+QZOpn1oiUnXqPEGyl5X7I4Q/bfP0e
 yMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761415104; x=1762019904;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QFIs2Aa0aI2/4xr0LydnbBXWZBqgexMa2+DBnxdrxyg=;
 b=C6JJQI5Bd8fooGWJ5SNTCrkiOmJ9tCIW5QtSn3FIFkqWXlQ2g8csHOZJqSFQOUKz6f
 /GSEGLFetfp0Sq03eZn+xJKZ2wPA0qXgUzXZxofZLFyjnYDVAcLT8rtrqsMYrla9th3H
 NKVYEgu6FfSiZmsnlr6oopWhEK09HDhIDptF0LupMo4Z1Ciuj8ZJ8vHPA17syNuPQa80
 AjAziwnkMLyIqwD6WuMGs5B25NUF7P9YRyHs4+kMWiEq/8MtOD0kLxhpg21CHkd9Zs9t
 5qTzciTRJa5Askgo+No4fiJCKe84VRO3fR5rRn+Y1m1QuLtCbYjGNaPO/m8HgBAWYLal
 HnGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNxTJQiADY0Ix5PrAgPW41AnWIK1IyeLO4DBWtnCPtj1z42L4gtdjKtQz/6l78L4cTNJurKceJow==@nongnu.org
X-Gm-Message-State: AOJu0YwcuXUOWvMSbHiJuFzVPaF0R0jvT4MudvWnrstIpjJXG/lGpuRv
 Ui3/8eOtSV2EdYolt1EXybMJQ8AXElmzPzJhOyCfL08rCYLPCLOsNzh72013z+8JIDw=
X-Gm-Gg: ASbGncs4IqPe+Kj5Yl7I8xD2YWnbM82dHYV/xwDBq1VvihL4IVGx4lDZ4+UAB38WtLf
 pzGD8pk1zI4qrcLLKSTVMNzEB5JryKvpSLK+7hfNj6v1YKOITqmpUwBbzFDRRk5W32BptclOHlE
 z+XdZH9isul2txwuhWzk5/5t+p/QAbvmFM95iVxLWEzxxWY84SAVks7z2+WLPgae1xWtYXW1q+W
 HNs9imFORsTyhiPv7dF2A3AQOt43DhylFJKQ9oOvCoRoE7FXbq4I6JPH81x1hXTY/ZLUJ9PLjGP
 473/EcdaspJCbYtrRYmTtPxwyN+EM5cELXwMgP1RRb9UNHi+lzamULh8jPi1X5buq3hDgsxnuDq
 cM7OCURHBM3pf/BH91hXo0wbiCQK+JeKWO+/rOifO/2o2yXRruJcywd3kFsUb0qanSgPoyCVJ14
 RJl2hYR1JCZC7L8tUXRTETkS5/7Q540lMwAl1967F08Skak9WXSquszV/5VbbuWCw=
X-Google-Smtp-Source: AGHT+IEqh8jL4doXcjbQNxwVOnoAjxtsInT/xpdy/Evgs+4e4UT87trcvOYQ1VACfrEnVZAuwdK/Dg==
X-Received: by 2002:a17:907:9690:b0:b46:8bad:6970 with SMTP id
 a640c23a62f3a-b6d51c05e68mr1097295866b.36.1761415104122; 
 Sat, 25 Oct 2025 10:58:24 -0700 (PDT)
Received: from [10.240.88.227] (ip-037-024-071-028.um08.pools.vodafone-ip.de.
 [37.24.71.28]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8544bb38sm251243766b.67.2025.10.25.10.58.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Oct 2025 10:58:23 -0700 (PDT)
Message-ID: <3e2412ee-57c2-4222-9188-33706cc6ec95@linaro.org>
Date: Sat, 25 Oct 2025 19:58:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 58/58] target/arm: Only allow disabling NEON when using
 TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Roman Bolshakov
 <rbolshakov@ddn.com>, Cameron Esfahani <dirty@apple.com>
References: <20251023114638.5667-1-philmd@linaro.org>
 <20251023123142.8062-9-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251023123142.8062-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x631.google.com
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

On 10/23/25 14:31, Philippe Mathieu-Daudé wrote:
> Only allow disabling NEON when using TCG.
> 
> This avoids confusing user experience:
> 
>    $ qemu-system-aarch64 -M virt -accel hvf \
>                          -cpu host,neon=off,vfp=off,vfp-d32=off
>    qemu-system-aarch64: AArch64 CPUs must have both VFP and Neon or neither
> 
>    $ qemu-system-aarch64 -M virt -accel hvf \
>                          -cpu host,neon=off,vfp=off,vfp-d32=off
>    qemu-system-aarch64: ARM CPUs must have both VFP-D32 and Neon or neither
> 
>    $ qemu-system-aarch64 -M virt -accel hvf \
>                          -cpu host,neon=off,vfp=off,vfp-d32=off
>    qemu-system-aarch64: can't apply global host-arm-cpu.vfp-d32=off: Property 'host-arm-cpu.vfp-d32' not found
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

