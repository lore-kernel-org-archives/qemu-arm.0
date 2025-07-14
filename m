Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAE1C83F1A
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 18:14:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubNgZ-0008CY-6I; Mon, 14 Jul 2025 14:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ubMgn-0005Ab-8R
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 13:10:05 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ubMgi-0003Eg-Ah
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 13:10:04 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2352400344aso42296405ad.2
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 10:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752512998; x=1753117798; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pNN1lvm+Y2jpleCJEcqOLiMG8jaqVBdTzjyRJ3A18tc=;
 b=vDGtgfYwpmA0BLbe8o2T4nr2ebzi9ljTFvXQVhyctl72tPu/S0NtvL8vwAckr6TUJr
 oc+gAmxsyS4H0PPi+lxwfpuPnGiE6pdKYdTnb3F6yoDXvcIL+1VcPtLUr3/SFn1Bf22S
 n7SWaGnv92K566iT6HTxFqqJfVLAiKSCutv0FprMcFeRuD8oAwmQzMdpgZabtAN1Ew9o
 mGYZDN4FuMqOoAtpEe/7TgWSI1CoHZlgSm46CptQTzXTf0Rz+lJmL1EM1kjKld8wHDXu
 d5WeO4dq3EE8mKNUvgE9iLVKHeXbgLy1pnfakpmQU4m34Au6PwWdmdJlNPqF+uCrNk0P
 YMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752512998; x=1753117798;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pNN1lvm+Y2jpleCJEcqOLiMG8jaqVBdTzjyRJ3A18tc=;
 b=DnuVEq/cBz1b0mMuKoCji9ap7YcmnD4Mug14jUHka1pds76KwL7dqJBgbuffNqzX4H
 36YgKdjtQ6bkoQZ0UeH0B8VW8nTkvTcpCVhWJk8mr10dBLIyTZ2WJD38appRgTTILPi/
 lJJgfJ91l0jU44uzLvTO7byhV412P33aYIrItpX77UgsW/aTUwA8Hyt02wDfGuBEud+v
 G23NGWnkIfuKBYFmsfdARK4Yp3VLA9sny7t5pZZRuGmhLm2mDnyieqmIqLiGZ55P4pUD
 HqWg8QcAGo+zk0WQfAAXX511A+u1f4VBDgLCWCHKwKz/3eV5GjAxbUnsxAUwrjTfNI3D
 5x4Q==
X-Gm-Message-State: AOJu0YyYTxxWWDV2ts9cFZ2DBkcWd3RH66zGQM70rAFwZMVQDWNkjBGV
 3j5wEiGMw3IsexByL1C+JwEPTHJO+O9Al+gtbBRgR6pCodrSbxYTeVaC6QgDrzJBuLs=
X-Gm-Gg: ASbGncuqFETEqlPzMzAynvwgGrSYXXh8HVD/buNJnteaZ5QUzuihDFDaFgLQJDZVE1z
 hKnYCcpOWqWGe0FMSAs9l2wWC492ExLT7gqbT2+5b4gCxbJAs1bPB3AC7oAzgW5v9om4MIEcB4y
 yRdZQH8TeeneAqXS2SJ2Bm9WhIZj2yqMo88TIi6gMVZWK0XxSN3JKRLgkdHfBttvvB9eWzW6NSS
 48YwH+l+PntQj5/o6+O78jcwhv+ENk8l2C13kSt2z//8ka826V3pHpMU4mZ8huQs0YCGBhiswl1
 SxCdChgzXuBkDoHRKmWAudRvinXSMh2pTpFhSL6qNhAm4XwDd28bllpM8wbYtOj31NzoYMHPJVT
 e0xhZRygOmGCuGvtn+vyUA2scnc5aHj1NZwM=
X-Google-Smtp-Source: AGHT+IG6sXBZYTHHFZUmPuGrI304YdOobQl274T8IcD6F7DDcC0FCASMIyNZsoChpVkR1jtEL9SqUQ==
X-Received: by 2002:a17:902:d584:b0:233:d1e6:4d12 with SMTP id
 d9443c01a7336-23df0807799mr139975665ad.13.1752512998382; 
 Mon, 14 Jul 2025 10:09:58 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c220f0be0sm7239405a91.0.2025.07.14.10.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 10:09:57 -0700 (PDT)
Message-ID: <97292e35-b7f2-40ca-aed6-34ef39396433@linaro.org>
Date: Mon, 14 Jul 2025 10:09:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/4] target/arm: Add FEAT_MEC to max cpu
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, gustavo.romero@linaro.org
References: <20250714155836.1514748-1-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250714155836.1514748-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62a.google.com
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

On 7/14/25 8:58 AM, Richard Henderson wrote:
> Changes for v8:
>    - Re-order SCTLR2 and TCR2 so that they are independent of MEC.
>    - Enable the SCTLR2 and TCR2 enable bits.
>    - Squash 3 smaller MEC patches together.
> 
> This still fails the RME tests, because we still need TF-A rebuilt
> with ENABLE_FEAT_SCTLR2 and ENABLE_FEAT_TCR2.  Pierrick, since you
> have just done such a build, could you re-test with this series?
>

I tested that on my local Realm enabled setup and I can confirm this 
solved the issue and current series works.
Both flags are needed in TF-A. ENABLE_FEAT_TCR2 is needed to boot host, 
and ENABLE_FEAT_SCTLR2 is needed to boot nested guest.

As I'm off today, I'll update that properly tomorrow when I have time, 
and not rush things. I'll update RME images for sbsa and virt tests + 
device passthrough test, and post associated patches.

Thanks,
Pierrick

