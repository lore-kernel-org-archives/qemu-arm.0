Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8346B10AB832
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Mar 2026 23:40:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w5uJE-0003s9-AY; Thu, 26 Mar 2026 19:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w5uJD-0003rd-Fm
 for qemu-arm@nongnu.org; Thu, 26 Mar 2026 19:40:15 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w5uJB-0005ME-Us
 for qemu-arm@nongnu.org; Thu, 26 Mar 2026 19:40:15 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-b6ce6d1d3dcso620074a12.3
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2026 16:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774568412; x=1775173212; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fkDYQ8A6uUP11/J/8eNKQJQXtm4Ez1vUP/TRKDlm2q4=;
 b=SLrlpdZLozkb6NdDMCqeA6YJMy63tpdbrhqOYewK3wehFF/7jCytHYnMXhE+acU9Tp
 8RVYCCZdSUG+Pxsq5wVJaYxBNrWugcughU1aqsdkKDqg+yqs+ZTqT9FzrXHenRk9Clne
 IF3Y24S3Z9bLBLKS0P1F9FwnRI41MUyBFIK6r4zeN152LnK8Ow3wfY78gxpE54M642A5
 t9iV+b5Cs52KJyuyJ7zb14RS7HX0aUnlLJWmZclnBPiG8uS+cpwEKPaQHyeUeggpmvet
 Q5s1syWkAsqVg+J/YesO2kXWxW2AxIWzoULyANkUBMSJE67p/43oVnOYk2eRlCapOmwN
 RAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774568412; x=1775173212;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fkDYQ8A6uUP11/J/8eNKQJQXtm4Ez1vUP/TRKDlm2q4=;
 b=r6UW3xd2tQJhkP8rG6xRst4mmx2cVt2Ibql5OhpPp4uDBgRBSvM7rv7BhhI8fc/er5
 ccXZNOPaOqRdt5J72R7PEj7EOGY22TSd5Ig1czjvIHEwVrZ04RH1IYpViQ5TOuh1LCRe
 VTWiVuOQKSfrEwk+upoP1AI8zft6P9KZdYv+BLhDrG0sKtDnbgHkK3eIYYT1XOMknC5D
 d3z52hx/Vgsb+29uoAg/qSvsejo1CUL+v6dg81gDoUhHrSt9MsGUDQsNCosOOYP1tsRA
 BCcIAkrEK6dWN2IE2blRqBPtgzUnigkLLn2bC9gmbzoHyTkwukst8Pxnh5ggUGEf7Pf0
 Sy2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBHpRKoLtEU1VvZfZroKQ1t2keeTm5doOna+F/wVZjkWFEyCDHbH6lMndhirQDfmud/gcCMy6IAg==@nongnu.org
X-Gm-Message-State: AOJu0Yxne7nAI5pDy0UMKVim41XvBibm9CpBxbPjEnzOhZdC0J2eA+YF
 Sjc4CGjkHJQXI7EpgqYhgrdS63SIJMBivhWcX06EBbUjwMY/S6180riDL4KqeVK/+Skcb4JktAj
 HPf8/YOs=
X-Gm-Gg: ATEYQzz52MEx1Q3m3DpPn2R1TNLUaDS3vWV0njXjL80seL1IhXrvVfEe5vEXHHRB9Po
 ON4aH0FLGFQ0PBCaig9TJsk3Omsmvqvap+sv1u4ayIj+PUkBNNPbjwjvkIAYg72LbGmxsrUoi3X
 GdI+mszgnL017rNkH/3b3aXOoeQ0syMuBQYQUuhn8wFLVwTISf/PnM8keXt2+7C46UiPQedG2Qd
 lT2uFCMoQZ8doUfryAl9Np5l+1Irqt5AGUB0t4/7tLimFdkMEhHzjBoRSF/dCD5a2hT/OjoyqA3
 PpHvYIQC8UxycPxXCOKgx5lMIw+36yAxeOV1K5gEmI37C+5ouPSj0YteEldtypiMDUy9pwhHKS9
 cFF/1rjZfXS/DdDp6ZBvysUWE2LcthVjA4FQjmoYbrhDAV8Xs+RvrzfyfSSmqeXE6NYUf4OOByS
 cAJuGILWwyHi+jEnqkqNOeSj6fs7TkH2bO9josbaFSPS2pyzr/jyd6
X-Received: by 2002:a17:902:e5c8:b0:2b0:5320:23e2 with SMTP id
 d9443c01a7336-2b0cdcb73c1mr4688795ad.34.1774568412238; 
 Thu, 26 Mar 2026 16:40:12 -0700 (PDT)
Received: from [172.16.11.156] ([103.100.225.140])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b0bc8f3b98sm38267675ad.70.2026.03.26.16.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 16:40:11 -0700 (PDT)
Message-ID: <58afb28b-3811-4f77-af65-ec622a35f0da@linaro.org>
Date: Fri, 27 Mar 2026 09:40:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/7] target/arm/cpu: Add FEAT_MEC object properties
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org
References: <20260319022335.22523-1-gustavo.romero@linaro.org>
 <20260319022335.22523-5-gustavo.romero@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260319022335.22523-5-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

On 3/19/26 12:23, Gustavo Romero wrote:
> Add 'mec' and 'mec-page' object properties to the Arm CPU object that
> allows setting at machine level the memories used by FEAT_MEC.
> 
> Signed-off-by: Gustavo Romero<gustavo.romero@linaro.org>
> ---
>   target/arm/cpu.c | 20 ++++++++++++++++++++
>   target/arm/cpu.h |  4 ++++
>   2 files changed, 24 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

