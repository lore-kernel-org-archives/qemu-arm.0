Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8336A60A3817
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 15:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qaB5a0Di
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xM5T6-0007VJ-6s; Wed, 28 Oct 2026 11:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xM5T4-0007Uq-1N
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 11:21:34 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xM5T2-0000uG-HJ
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 11:21:33 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-8b0d126f631so11256087b3.2
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 08:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793200891; x=1793805691; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=dPyCokPohGPIogydgBp2fV81KAH6fawUp4d6wg0dYjM=;
 b=qaB5a0Di4RZG/E1Pq0cg3LW3ruYMu7XPAAs+UvcL2Vz/BUXXKxb8gNrUUROy60vC8I
 vtikkjQR15hiaQn+qBTJ9aL9a8k1+eLWTUt2lnymhVH3vDOt3aka+SZxSGNrBETZw09R
 X2LS9wS4LBCYGM0fXz1uGCSQ0OK9fLJ2zOz3h/XW8MYJwq9W/no0l+LX8VH1i/rX5IEM
 z6tOdTH+0yaca+9wxUnH5u8K1loLsJe8nTpGlawNbYZ/tSsgmYzyfsTJnNTk9fl9S7qJ
 QN9pEU/rfukTtdHZKkXVDchyoaz/vCokwxbFIIesDIV7xb8W9EfZ39QN0ZDqnMkDR0aC
 6gtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793200891; x=1793805691;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=dPyCokPohGPIogydgBp2fV81KAH6fawUp4d6wg0dYjM=;
 b=2LF+TeLIo+O6NuQ87jGhUjwqr+fPuy9VwAy8c2iZ4PDjdnc2CaQYdu2xahG4vLnHyb
 mqRk7eqMxXgRhKaLabKv+A3VSXIM0BSGbeTwFqU1pe84qU1m5c0f3k3/2pMx9F6mWu8K
 EPQ5TCb56QvS7kc3gAPsF27miZjzofGWZBcTFmq+G7WtwsnUCWWDvtLNxpVnHQTR6Teo
 0l8im2WruCvxkeuXJrXNE1swgeJXWs1tQUjc1r+Xqj/Cv9hPfDegO3vTP0znBdHhGHUQ
 EAxUVvUbn7cJ2uEI1gFymEggu48Qd+Eat2zZd3qeJ83vEHDo4wQmS9vAt+R4MbVPh5yI
 pCxQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy3H0DNNxLcQkPd+c7oUKgbjLMQtZzpLpk+6XCxFTuyyrJFyaHGJLlZsFQN43l6TY7Ulxt/x/uyWA==@nongnu.org
X-Gm-Message-State: AFq9FYJEgpr3q0e94/8oq9vm5c4RfNZN+DPZRZ72wJwBu9CCgczb/GYa
 CQFqIkmC5FjpnhFTzN2LURsXdifvH2fSVc166PXncJntWCLXw4E/sy8HObNJA46KSeo=
X-Gm-Gg: AYBFou1hsNqc+qo3dqWFjIOsUGClL6J3sr2+Ugjuh8r1BaquX+aVU3uB1roF7vam+y4
 VLnRo819ZVFgaDxfHO4yMaHwgAlte3k8A7HCeLrfeJPeSyVVPX7yC0VvLYYELFUpK2wmMecgYrM
 bJH1dZ8t/IY8mttn54aDSaFOiPHgDzQrCzvNIP1b6XiYscB9GNBK2IGdwU2Xv3k2l32Vtb4fWT5
 0Iy86c4+lW7ps5sJW/Tc5u2ghAAcG9vIMzsEovZEtGgkKmWpR1Ce8gIQRwv1pgoghTeNMR5mNYO
 d/+2jvxdBM1Vs1UCGOqtOf1BaB1LT1zkqPSHbjsZYzIJ2wplj8Fym55b42/Omf0J3OLEgypsIL/
 QalBJ+T+LXLnONAJo/qv8KZFbVYG1wtC2Maad+s00qSqpzxtoLm01iOMrn2xEwzxRPShPpXl4v0
 7uDQ7Oiu+N9QS1ms7eietYXJBi+XfxDOhhj26iyhRNPPu9pLjCyZBWPfgL9j3GuZF6bDqN4r+0t
 HgD2IqdxzowfwsCJM5LpP18w3Aatc9sa6cAAhpMXz1ZoMogmBVb9THIU+a0s62PM7oNa04wpZWs
 6Xg7y1w3cyoGjWHUsAoNGoOaid0rD5BRWXM2td9QTKfyBVXfs3QGPxxcAjLPLUJXQk/0b0oz3oV
 3IB+o+bmr/Sw=
X-Received: by 2002:a05:690c:ec5:b0:8b1:368b:392f with SMTP id
 00721157ae682-8b1b5d3b138mr19379487b3.49.1793200890507; 
 Wed, 28 Oct 2026 08:21:30 -0700 (PDT)
Received: from ?IPV6:2607:fb91:2c2e:8a8c:60fa:827:925e:3bb6?
 ([2607:fb91:2c2e:8a8c:60fa:827:925e:3bb6])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b19e53a239sm30407137b3.15.2026.10.28.08.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 08:21:30 -0700 (PDT)
Message-ID: <c513ddd3-5b24-41f4-921e-75a9c26cf1da@linaro.org>
Date: Wed, 28 Oct 2026 10:21:28 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/86] hw/intc/arm_gicv5: Make IRS_IDR0 reads return
 actual value, not 0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <20261013083933.1024405-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261013083933.1024405-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1134.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/13/26 03:38, Peter Maydell wrote:
> IN the code for handling reads of IRS_IDR0, we carefully construct
> the correct value starting with cs->irs_idr0 and adjusting it.
> However, we never actually write the final value into *data, so
> the guest will always see zero.
> 
> We didn't notice this before, because Linux happens to not care
> about this register value except to check for the presence of
> virtualization.
> 
> Cc:qemu-stable@nongnu.org
> Fixes: 405ad2e76f13254 ("hw/intc/arm_gicv5: Implement IRS ID regs")
> Reviewed-by: Jim MacArthur<jim.macarthur@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv5.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

