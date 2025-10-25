Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9618CCD1BF
	for <qemu-arm@archiver.kernel.org>; Sat, 25 Oct 2025 19:27:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCjv7-0001Jc-Cg; Sat, 25 Oct 2025 15:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vCjv5-0001J9-42
 for qemu-arm@nongnu.org; Sat, 25 Oct 2025 15:27:19 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vCjv3-00039m-CU
 for qemu-arm@nongnu.org; Sat, 25 Oct 2025 15:27:18 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b6d3340dc2aso718240466b.0
 for <qemu-arm@nongnu.org>; Sat, 25 Oct 2025 12:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761420434; x=1762025234; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7t46aHdwi2u+ocHrknEDU09h+Ad/TXg7YFYmx+cXj28=;
 b=fiZ93HMCvZvAZxzS6alFuXl+zJ1RcBaP58EMY6TmV52jF8XXMHAa/iwjQoHSFG4/+g
 ovVtiI4QAx1z24UCXBQpi4CvlKsBkTNefPPxCRD1IfwTnkEfIzUsfqiPc+NDv+tm8TbX
 WdNNt35KST95qeGuGys2ylKMFz9lhIXB9sOBtSZsrqyYEhGgdlcNgiCYLASEcKCk73q6
 FXqiKaX2f31x8LJqxLfx8am3r4AqjoL/VscMfbsJWUIhU8OAegUhJRvFv3oSXiEQqdTc
 QbPBR/4HmHdmgkCGBBVELLWwGPn9gT9rWq8ehRaxSFMC6nyKH1DxnAW4w5pCoK0HtI3B
 0/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761420434; x=1762025234;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7t46aHdwi2u+ocHrknEDU09h+Ad/TXg7YFYmx+cXj28=;
 b=nsxgLIS3ZdLo+VN4DCmpT2K13Xvp9PNpAze7K7bijobKVa0rA0VuKdsHU+3HfQvp1z
 9LwFGp4LiIZQHjW84QT0p7kslvU0L8p/drD16GxVsAt6tl4WOkIa53h2f8OCot3Klr7p
 iDvQUH8DolvwXG5jlRbb7V4+5Zu+ngdCEdaMPHNqbFQY6hkGWIYt0n2z3w4XvnHmL84Y
 myKHXLcG/lwMCAyOyR5DIO/nAibxkPoSOx3PChiMAZtb73YWJuTjJv5bfLi+hTIK8Mb2
 h0UoIf+lqRNdnaOvU3+ucbjkTuVpl/hSJT8tC+p9DXc92oecoKQr8dMuLR/iVI6TweUI
 rErw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuFfPDuFXqQnIvogK6XOTR6MuWoGNeEOV69cWX7AcsOG7JVN00DbyKKOTObAVy1v9Bl+1ReYSAlQ==@nongnu.org
X-Gm-Message-State: AOJu0YxxWuKT3uL9c87Q2JE4OwPJMpNYPM+ZGBBxnb+9B8xuManq8Vm4
 ZUNjBHKZBsw3U1QgujY5JXWIdxnCQGrNLd0RQEmXNfvh7xeYCU+eg9XVJVCvxrKtcpw=
X-Gm-Gg: ASbGncsoLOxNhETu0VmY/IJ6sZjmIz/1bhBSRj3q/VSx7RaK+7h0pyXvnih9ziOx4fk
 mdRndk8wvUSR6OnMK3FGVsr4VhG6XYPdlKu6bos6AyPubbEtq3yra62UM+tYKhfzRai8xdFCq5y
 I3fVNHid1886QE73xv8aTI6WLkEdX+7iQdzIZeX2btPQ8Y69RosmGWYvzzNsl72W7egqTtYPEgm
 kFbfKwZuIHj0fbj24+Tx2atdYv5XSo+r7y/yvhNdK1nH74DawqwsgaeFaXqzaOekWlcMYAe3mIg
 AjZtERggbgYCyj+RulnmiD9VuXwRbDgby3HkCQHkbBgPNqa5KN++BO5I9xIDVZ0fhfkAfSYkQ0p
 6AU67fuMBpLzpRyxVkeG+80mKphhMY6xYfb81jg/H+F0eE7/Y1+YmT6Q8dWdlf5nX9FvDvVmGt6
 0buYf9bAFwpaQjU8G2mcnJmoP1ALEVpdVU/sP9yPwi/UHBwp5xUmHFmygvuNcMyEo=
X-Google-Smtp-Source: AGHT+IGbLao4fff6dgi/d/NLWKP9Yuq+HBURBq0obxPgYYbpiQ200zL/c9un01B/PUypiAKDMgkYow==
X-Received: by 2002:a17:907:9629:b0:b4b:dd7e:65eb with SMTP id
 a640c23a62f3a-b6d6bb96071mr723531566b.25.1761420434387; 
 Sat, 25 Oct 2025 12:27:14 -0700 (PDT)
Received: from [10.240.88.227] (ip-037-024-071-028.um08.pools.vodafone-ip.de.
 [37.24.71.28]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8541e99fsm268026966b.61.2025.10.25.12.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Oct 2025 12:27:13 -0700 (PDT)
Message-ID: <c50e3ae5-44d0-440d-b0dd-19a7c0459594@linaro.org>
Date: Sat, 25 Oct 2025 21:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 46/58] accel/hvf: Have PSCI CPU_SUSPEND halt the vCPU
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Stefan Hajnoczi <stefanha@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>
References: <20251023114638.5667-1-philmd@linaro.org>
 <20251023130625.9157-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251023130625.9157-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62d.google.com
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

On 10/23/25 15:06, Philippe Mathieu-Daudé wrote:
> Return EXCP_HLT to the main loop.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

