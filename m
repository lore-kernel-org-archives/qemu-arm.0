Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADB2C83F34
	for <qemu-arm@archiver.kernel.org>; Sat, 19 Jul 2025 04:01:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ucylB-0007ZS-E6; Sat, 19 Jul 2025 00:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ucykL-0006VJ-NX
 for qemu-arm@nongnu.org; Sat, 19 Jul 2025 00:00:26 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ucykI-0007QQ-JW
 for qemu-arm@nongnu.org; Sat, 19 Jul 2025 00:00:25 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-748fe69a7baso2570481b3a.3
 for <qemu-arm@nongnu.org>; Fri, 18 Jul 2025 21:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752897621; x=1753502421; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gFoKoFCaEUJpXwD+AbqFjVyMpQj2okGZnQuqNtvCsus=;
 b=fNfMx+1ZR8YDXGexeBJ3jNX3wP2OXUDanQ8hAOloLgXp2U8nRf9txh8IFADdtfLcO/
 seyByiXKXqgTPfXkmaeZtI0iAw4SZdCK4MPCktRcCrxJkjkWDeUpp5KP6WSyz2iXbaU0
 wbSsmdxryYvtXJXHkTvvtMlGwwixxLP5rOHaMEqN6O5oT7ltRstZkfjrPFwKWVTwQ2JP
 nHi0bIlvPuTBh9+4EBlPDAJy7NNSQ+tn8arrgoPA++N6NOKJHhxRyvtf6YyObTPLXQxn
 NmhPzGh35o+nXYCabXm2EqAAHKASEE2qKiFdEN8rj4YwCziKtM/OAN+FVAMlBy9DHwMU
 pR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752897621; x=1753502421;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gFoKoFCaEUJpXwD+AbqFjVyMpQj2okGZnQuqNtvCsus=;
 b=hpms1GG9zVS32/mrvkux8hJtGfmxqolQwgWkbTtUWZhdQZjsR7pe5DwliB92PNEmdj
 sCRvVifpC3lMa2bmOHSUjj4o0jxvJLW1Kg8gPIBSnu5vCAPTFmfdDXkD/d3nRNajtVW5
 X+HkZ99DdYmRIubBZgpqbP/yfw+9WW5bmzr0KEE8o9+iutPqBsxMzkHlgUDm5DHdbLLD
 8DpBk8Zbh/SO5V6gwmYuqbaTHqPZyLyI8OvLeiHLDFEtHNYNLeF9M0oB3GYh6TsP8E7v
 tqTsCeWNPw0dv2ux/eCpY9tUX+PIXsC/+NKJ4MRZDELljX6+MLDDLRcuWGHuRSNzczjy
 QfZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6IBiq/AJd7+nP9H3F+Lz3fzmMbBZJWiS8zOy42NPIAgwNjWpp4Xs5dYUMOv++rWb8ukKC7f6YtQ==@nongnu.org
X-Gm-Message-State: AOJu0YyK/WAvxYEYvsOExSI7nZac72+Iiy6mmM/iZ/kXo0q20s2ceiqg
 MEkwdcQMbXBkZmHlacFlPKynp0FMBwlVxNa2uKZHpkYGt5SL4Lr1eeq97/AiFZwtXx8=
X-Gm-Gg: ASbGnctzNudkTSO/GlcFGVM0HFrnYBABAcMli7Nt/AMJVZOS+M2K/8RHrEpq3b0JnRe
 +Wi6ipiLAYaVha7NWQmsWtoCi5JRcUx6Hn52tJgIunszICP8hVpityan/dSUOoaXOBlPUVFoJRL
 cu//h/vtJGhbITqZdPZQGKW+N37vHivsHaZSwauX9npRrz5oBZfc6vrRvfRFWXqlhmPL+w/3NMA
 zkyquAMHdc44k/a/9P9cXodHESKOtvJ1ezKg48tjL7H1pzEhi7GDM0axbLoQyTMYG3/NWxJ7TXL
 zuJS03GZFhAoh025Syw9yJeepNJvf4zvF/BHLhdyVrEdrYdtsF3Pn+EuU7VHm0nsOgPZpYe4QDz
 g+m+5NykGDLBrkAS1ScrtriVdKD7Q288PPUM=
X-Google-Smtp-Source: AGHT+IHSY1cJbw1opC0onO5qIya+3qxeP1Y9avmlAl7UWXfk5veBYMHnuVhpYNN9kRktusFXwc32YQ==
X-Received: by 2002:a05:6a00:1a8b:b0:74e:ac5b:17ff with SMTP id
 d2e1a72fcca58-7584aa4d084mr12580758b3a.13.1752897620813; 
 Fri, 18 Jul 2025 21:00:20 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb157b49sm2053697b3a.96.2025.07.18.21.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 21:00:20 -0700 (PDT)
Message-ID: <f9e316d7-18c1-4be7-b172-3fe2682e572a@linaro.org>
Date: Fri, 18 Jul 2025 21:00:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] aarch64: update test images with new trusted
 firmware
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, richard.henderson@linaro.org,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, gustavo.romero@linaro.org,
 qemu-arm@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>
References: <20250719035838.2284029-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250719035838.2284029-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42b.google.com
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

Hi Richard,

On 7/18/25 8:58 PM, Pierrick Bouvier wrote:
> The FEAT_MEC series [1] introduces FEAT_TCR2 and FEAT_SCTLR2.
> TF-A needs to be aware of that change to allow accesses to those registers, and
> thus must be patched [2] to enable this for QEMU platforms.
> 
> Concerned test images need to be updated to allow them to boot.
> 
> [1] https://lore.kernel.org/qemu-devel/20250714155836.1514748-1-richard.henderson@linaro.org/
> [2] https://git.codelinaro.org/linaro/dcap/tf-a/trusted-firmware-a/-/commit/c8836cec14213bf92dae79d353bc345254a0a31e
> 
> Note: [2] will be upstreamed in TF-A once associated series on QEMU side is
> merged.
> 
> v2
> --
> 
> - Updated test images with lighter images (only firmwares + kernel + lkvm)
>    performing only a Realm boot, and skipping the attestation reporting.
>    This does not change what is tested on QEMU side.
> - Build those images automatically on GitHub, and fetch them from there
>    directly.
> 
> Pierrick Bouvier (2):
>    tests/functional/test_aarch64_device_passthrough: update image
>    tests/functional/test_aarch64_rme: update image
> 
>   .../test_aarch64_device_passthrough.py        | 27 +++---
>   tests/functional/test_aarch64_rme_sbsaref.py  | 64 ++++++++------
>   tests/functional/test_aarch64_rme_virt.py     | 85 +++++++------------
>   3 files changed, 80 insertions(+), 96 deletions(-)
> 

please fetch this new version instead of v1, as it contains images that 
will be easier for us to maintain in the long term.

Regards,
Pierrick

