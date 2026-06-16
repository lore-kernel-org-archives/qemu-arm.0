Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E106FCD98E3
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 15:32:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZVlu-0007lx-ET; Tue, 16 Jun 2026 11:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wZVlt-0007lY-Lq
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:32:13 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wZVls-00043x-8u
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:32:13 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2c69921bd15so7118985ad.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 08:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781623931; x=1782228731; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1SlUbXy3o5QJDBTtYZp+CfR36UvvgS7Zm4D6qMxfndk=;
 b=MiktfAFiI7opz9ZqYf4e2wUQmdF1qKn8teDXTzKNwniHs99kvLFXPQg5SQcXNIrO0I
 QwEkIi8H299yXuGr89p0d1yoEEsI7jDv0HvBp8yjdNkcwVTrKrn/9cKmm0fW4Haj4P9g
 AutKqDh20p9pl8zQVPwIDAyzy++wCrROyQpD0WoJMF1whP6rsmbmTAOtctPN+aNEJlGs
 D7c4d+G3Di+L9gvg4epDoDTRvDv7KPEMEb1cy3fGZSOKvUXnKTsMm/FviuvoHkr9CJMS
 2IBnsdhLUc04HTy5j7rrfCOA4VNsbWDFe5G32jv9qs3QM7c/Ro/IQifQwu78ygcMI8rU
 38Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781623931; x=1782228731;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1SlUbXy3o5QJDBTtYZp+CfR36UvvgS7Zm4D6qMxfndk=;
 b=YbWiRwzd+x6vnU0kid7ta0i7HFs5UeDnMYOD/KME6CuX1MFKf3vRHzE+/F8j0yeHYo
 jyWoBo4S7Bn4krKCpf68mK/Z4lTf7clGRHeNIAIurb44RoMyuZNvZajCJqEHuNoUuMXc
 O2xKpUE6XsfdF05pkUtQxknlaqC1zA4SZOfJm1HvPvHIM2vS28wVeW/ANhn5UMzbpyJ6
 QqyiPJ2YA2H7CV8071MoftXAURpw07DSP/866JFliV5z+y+CHjz6iUmGukXNQt6IWsl1
 YuoO8GkJ2Wspq7urRt7tKIwb5oLgKC/M+/rOUPhPQwyJ8TzXU6mBvFJ0pPmq9GzZnVlN
 XSlQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ88VXZhEYkYeA3BixgR+layF/nZJolR++54bHC9Yw+RlxTjyBWCrx8aBc7YTs1mI5wavIUqcFTtuw==@nongnu.org
X-Gm-Message-State: AOJu0YxYNTaIFICh0SjKNwfU/w2qS9fN9Zi4b/ZcTGCApBfNO7fvmQTH
 QfY/IF5gNdyRAFr9T5/BNIPEOYFjxebQAKwyh5cuna4SUY0MGuHe0TviyHFea3JZUUU=
X-Gm-Gg: Acq92OEhwzMQvdnFWQWT6SRZFQHuCsMsUr2pV+GiQzdXsSROlI/SwG/RLvqjcBBsOmI
 1DeAF0zPQFOAgz7EYVkVDg+d7bl2D2XdjlDIYsWPNrackdqprMflcGi/FqMkZLU8S2lGTGGlrXR
 oFkQPt6/MiYxAKG14KMMYPWLErogLyVYopKOkaaxYHYQ+qA8kxpdpd6WV4dW/XfYAc/XdMV+s9x
 A00UptZlM7z3zAyCIPx2tAf96tIdHH96OTkt4QAPhGwLKbzD9cwXT3fu6JIlL67WR0KkAzamXfN
 jLz5a0j8XIcy1SJpAOWphx8/poa8mNXFbg9CXXWedwHw8N97w5qekJESLF5Bmv1qVKUIjPSjAmz
 PAr1vqj5mfL8gxjMoREvo0/ENXWxKogN2XO5bUaPmGlVnPeAFMIKj4MrWEK/sHDsKveHUu4nena
 6+A1IQowWWF3HzwvZkW29fPLJHhMwwhG4ksllNGFXcv9eDe1oJIKsOKWiMqoaEv/VrkaNV
X-Received: by 2002:a17:903:15c8:b0:2c1:ef9:4516 with SMTP id
 d9443c01a7336-2c664227c1emr175514445ad.35.1781623930521; 
 Tue, 16 Jun 2026 08:32:10 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c42f1f0a36sm131987775ad.15.2026.06.16.08.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 08:32:09 -0700 (PDT)
Message-ID: <827e0cfe-7d1d-460a-9fff-990d357a7e2d@linaro.org>
Date: Tue, 16 Jun 2026 08:32:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/25] target/arm: Implement FEAT_SSVE_AES
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-25-richard.henderson@linaro.org>
 <CAFEAcA-0VgXH7bZgbc730ZgHZ02ZR-jm300izcPDabgBCHAY=A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA-0VgXH7bZgbc730ZgHZ02ZR-jm300izcPDabgBCHAY=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

On 6/16/26 07:51, Peter Maydell wrote:
> Do you think it's worth updating our feature function names to
> match the official architecture names, or shall we just leave it be?

My first thought was that this might have been a combo feature test, requiring both sve2 
and aes -- I've done that elsewhere with e.g. isar_feature_aa64_sve2_f8mm8.  But since 
that isn't the case here, it might be worth making the function match the (newer?) feature 
name.


r~

