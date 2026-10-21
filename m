Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964B6606A32A
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 14:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hJVuYNYS
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJXaT-00042j-Ps; Wed, 21 Oct 2026 10:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xJXZR-0003qR-55
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 10:45:40 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xJXZL-0004Og-ER
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 10:45:35 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-48bbb06e746so486308f8f.3
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 07:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792593929; x=1793198729; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3CekQSbFBvqQG9PVcoZJUGLkF4ACoEGRFwVzo4LEq2c=;
 b=hJVuYNYSdMBa7sDsZqhNG220bLl0Io7G/HDNvsWCnuC1GS+nFuJJqsmR403dsy3B5n
 j+01BGrAq+42YfKVf7NLVKY3DtwavGmvZKgtf/167e8S8iiWyxP5QVnjyVOfu7xZ3ysf
 z+NcEIYsJmUORm8K6GJII2P7v/aSvVgBQ1l8a50MYPTjLBNdTfKz6MUR2vhGJK3oo7Gs
 vCQN3gWnLl0MOOQZKFo3qJX4RxpT0O+DOkhuPM1ly3JEIzOnd7xMWbbJRXer9k8npPe7
 oZXn2JFRQRGP29VBgUgdSRtMRa0tGj0ruS743F5uY7NlR/aAbKws3/NqZBFXhH8+Zh+U
 DyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792593929; x=1793198729;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=3CekQSbFBvqQG9PVcoZJUGLkF4ACoEGRFwVzo4LEq2c=;
 b=iAZG8YMeLINT6fqW+AGYBm7xv6SiSbReZLhi5doIBik1HyaQEEnkyb29fapp7P4iQY
 VRtYpgG8ARRLqR6OS1Py8wMOqyzBqrSkFXasxCpSsGYJU6dGGKFSFYf7MDffkZYmyiSB
 lX9l/VY8LJAC3DT3ln+uB+YXTPA09lLCKntw2iL6WN8zEoiwOLv9OfWAgwFCwsal5q98
 Lm/CHsAKhGjLNRaOgFrhhuH4KC2/jQAbj7iMrJtVhX6o9ioSawSEDmjehk4z8Z48s0wJ
 zSo0tGhVbHf4rNSnQYIxaHAdPG1FABUzF3FqgHZOlD/Oj2Ci3qQ6ViglRFKsm4B4SZ0f
 j/7w==
X-Forwarded-Encrypted: i=1;
 AKwUvBySdHXceYbK7K8N44LztomRK4aTV7QYfVJI7C8LHL+qj5l/x3jOHEtPcn2dQu5FyhQjemPHC0PDTw==@nongnu.org
X-Gm-Message-State: AFq9FYJRWdcLUgTUP+8kMyhJ5B+9BH1GclB7FPfl9Pe7zpRrUcdM1aNL
 r1Lwq8nLkOD+LufVWGIMy5qxs8DP4nKpOD9nu241H6qN1TOmR/wZ3UMCi1bzh6wrJaY=
X-Gm-Gg: AYBFou0qPGXHHcuJSCDH/nwDxKAByHGRSLIAujY54CbFDlX6xjMR0HcFNWHExHsi50w
 IXPYotzSvYW7PTyWl3SwQKp54qrWkKNCZh+43RUNrlKr6hXijCal4czbpnocBfIA4apgBaHz3ny
 BWK6870DenRMmndT/W+cG5gKaLzDaEmrOP3cRFhB00E4879tY6Wwb1MHzrIYA2TeG7yCqQVNUAF
 mAtLfeCXi9MFWfZ/aKf+pgvj0tRn0Q/xA6Jx1O2vsKwk+w46P7911cvu7auny+Xv3M65aDQzGQH
 ilVBd6IE2aFkWJjbxkkoTnd9WHZzClxzMhqYh7dQUj+8pr3uFgYQ6L8CtX3zlhluQPA/XhCvoWM
 55LT1tE5WRJBG4AzYHRKHmFltFce9JRUXvXeCC/lqAU74/pEklGYcbIi9Cre9zbwv9JrSmiBj4K
 iZZLHzsIX7BF5l7GPwxPuoTiq6a5v9vRrwbVdyeC6UDLfRimqpA6sNEhJnVsiGFYARtJ99T+7LI
 XXvd7ivbhJmHASPSlic13iUi2clWpeF1mr3f0z8oHGtqL/hGfN9yhV2iBt1RinlxmNX/y8HjAg0
 BetAZBSd2vYJYCO3K5Yce25Svnc=
X-Received: by 2002:a05:6000:4025:b0:48d:ff81:5201 with SMTP id
 ffacd0b85a97d-48e265015acmr4696041f8f.41.1792593928894; 
 Wed, 21 Oct 2026 07:45:28 -0700 (PDT)
Received: from [192.168.2.121] (pd95f64ec.dip0.t-ipconnect.de.
 [217.95.100.236]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e2584c3b0sm6600845f8f.57.2026.10.21.07.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 07:45:28 -0700 (PDT)
Message-ID: <370c9e06-1b04-4bee-8b10-7dab6fadd47d@linaro.org>
Date: Wed, 21 Oct 2026 16:45:26 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] hw/intc/exynos4210_combiner: fix misc range check
 issues
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20261019162217.3272337-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261019162217.3272337-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/19/26 18:22, Peter Maydell wrote:
> Peter Maydell (4):
>    hw/intc/exynos4210_combiner: Fix group register range check
>    hw/intc/exynos4210_combiner: Clean up reg_set[] bounds checks
>    hw/intc/exynos4210_combiner: Make reg_set[] only as large as it needs
>      to be
>    hw/intc/exynos4210_combiner: write default case is unreachable, not
>      guest error

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

