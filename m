Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDADC98304
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 20:56:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9U0K-0001bc-Tr; Wed, 23 Sep 2026 16:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9U0C-0001Yo-Cc
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 16:55:41 -0400
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9U0A-0007B2-23
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 16:55:39 -0400
Received: by mail-pj2-x10.google.com with SMTP id
 98e67ed59e1d1-396ccb652d7so1024818a91.0
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 13:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790196937; x=1790801737; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wM0kPJYKtXdJoPtEM/sjyDev4gFkAOekaDOCSGsoMXc=;
 b=zQR3EGnAzhsj/nW8Ie0egi+Pehf5WwexJlYWKO9nWnMUMSgJj1WqT2pIYjpIG7JCdZ
 EEiqroeHITFnSJQOw9o/Z+CCnvzxvBe3WteDW+nR1pZ15J1uL79aNGdh+r3g7cKAR3E4
 xIdbO00MWEYqaxx5876PSokgc3IR5AZpvNAgGgyi61NuA9jgUhaokRJ/ocinqu3tJ+Wv
 hHAB7H++sTKv7Xvp/ofzhSROfPfXNeDJwTA0H+OgkovZuNSaWW7ZY+i6wo7/O5sAqjY4
 dlqAS14KZhHYjeToGmz2plg/ftQ7L4haEs0s5OzNr1mQmNvoGnCiF5suElsdqFPUQRYC
 HJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790196937; x=1790801737;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wM0kPJYKtXdJoPtEM/sjyDev4gFkAOekaDOCSGsoMXc=;
 b=tvVA4Zuc5OAPQFa8xztsTAJxjyY5Agzt+nya+BHbF/zjZK660hQ6WZnxfQT1aN/JOY
 07UN9JFYuRTfYjS/X8CRZ78Y/9+VzPgsxb2qQUhb2MzNP3G1N3GK5VHrwXCmcba3xqIx
 CaVJdBGBgHoF70eK1sMHIMNf15qIB5tKZtFiIwytIUvbMFbOzcvvZSmHi2/XAnuQ2p6u
 zzVyT2GHhJowUEUUzjLjbJnmBHby3eCQcOtERlE/Y+rpXh+q4FD9cW0un8ZcZ9VsjfbS
 byZ+JIYiD32uwEeH70GArtQiuW7f/HLbgaG2yHeWv1jGcw0nJOBoLGa7h+OIu44WPVNv
 9+Ag==
X-Forwarded-Encrypted: i=1;
 AKwUvBwg2iUrZMBsxPCqZMECownH3eAlAIRebLE9X8mXP6pJ9SNkn8yswB1iB/GlIyK451AmDVRUq45sIQ==@nongnu.org
X-Gm-Message-State: AFuF++nXtFVRj4VFSuDsZy21rHzYjOem2HdPG2ZEAg2ZbhXy1sol97eh
 gClg2NExlLmo7u/LoFJWgxBCDHOMseyN/JxD79uvYWKS9frUOeduBwTwZM2m4SS0WTY=
X-Gm-Gg: AYBFou1EC2nflK+uD26PMrxgbeZdPFjUPztVNF/KlZbgNXpwfPksRWF6cEX/vCmXuxV
 AhRDP0/KYuuIF+j3b7p1wdE8Hj+i6HjUcVNrD29Q7MtfOgUTX9GlLKxAH2NRtLLNx0p4gvt9Pdu
 e9UTybju120At6yfewam4dXECbyKnsc1ZGazv+a8w9QhZQ+Qitc81X/2N4HmYYsJ00rYaQ4A837
 69Al/gNWmQegc6u5tRBrmJUORC8KWG5oW3vNk7ecLAKruF7KBQh5CZFiv4bhLwP9nJGq1Z5OKgs
 6il4dDp47m9Ewtwov63rQ8pd0HT6vbSy2xqjuJzZwmsP23UWCW73xEYVtPy/Szhu6yc3IXywLe+
 eOv9OYuSiApges3QJLL7JF5yJ5h4qoUflpFy8iVTmy4DrdyhhAQWm6weIduFTWPdgLl8SJWxp7A
 5wiLH/43yVBjLqSW2xOI+K5aDTlP3ffpQnEYfZlBVxOTEkBo+DyJaPa6x/yXo3hW04+ZoW48c3l
 YiGbLgCJPep5oNnqkzjY6UH00/g4CoM9JSBlDA6fsJ5JIRUMD4=
X-Received: by 2002:a17:90b:4d09:b0:39f:d323:c988 with SMTP id
 98e67ed59e1d1-3a098dff5e3mr214678a91.48.1790196936458; 
 Wed, 23 Sep 2026 13:55:36 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc75f2228a2sm1630634a12.4.2026.09.23.13.55.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 13:55:36 -0700 (PDT)
Message-ID: <84dbe3af-4ebf-40aa-b760-8294d8cfe686@linaro.org>
Date: Wed, 23 Sep 2026 13:55:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] target/arm: Don't register 64-bit TTBR0, TTBR1 for
 PMSA
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Tao Ding <dingtao0430@163.com>
References: <20260907130223.3148989-1-peter.maydell@linaro.org>
 <20260907130223.3148989-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260907130223.3148989-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::10;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x10.google.com
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

On 9/7/26 06:02, Peter Maydell wrote:
> We register the 64-bit versions of TTBR0 and TTBR1 in
> lpae_cp_reginfo[], marking them as ARM_CP_ALIAS because the AArch64
> definitions in vmsa_cp_reginfo[] will handle their migration.
> 
> However, this means that we are also defining these registers as
> present in the Cortex-R52, which is a v8R PMSA CPU.  v8R does define
> AMAIR0, AMAIR1 and the PAR, but does not have TTBR0 or TTBR1.
> 
> Split the TTBR0 and TTBR1 definitions into a new lpae_vmsa_cp_reginfo
> which we only register when we have both LPAE and VMSA.
> 
> This is a migration break for Cortex-R52 CPUs (which we don't use in
> any versioned machine type).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Detected because we ended up with the CP_ALIAS TTBR[01] registered
> but not the TTBR[01]_EL1 cpregs that handled the migration.
> ---
>   target/arm/helper.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

