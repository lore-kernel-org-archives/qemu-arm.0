Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DD5CD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:03:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkKf-0006Dq-GG; Wed, 20 May 2026 13:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkKb-0006DM-G2
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:03:41 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkKZ-0005Pg-Lx
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:03:41 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-82faf871346so4028908b3a.0
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779296617; x=1779901417; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V5OTAMZnH4CljFP2Ceujel7DB1EvDMI7Nk1bLAzzQRU=;
 b=E+/qeXV1lHmWiFuVxwEu9GbMrpzXPlBqx55D5T2QjOZMKik0FK8aj6+yPso40DL6Q6
 ccpWieJvA7d/Mc2jXyARlBpPjBz/Fea1Yn7cOqmfn58eX8p+AiqP811L0C6W086yahry
 P4T98OIESu4oyolAQ1AQVmlYwYuEWZ/jh6LHhf03BPEQQtFJVOYdWS3x5AXpwd5q/Slt
 y1yJ3LXup1tuvg9Q2DPMcPDG8LYqJtDlz4P2WPsrULHzd2sNOsWAZNpYkmIfzk1NkuKZ
 mdG/Keb1WaeErCBjA+itECp8MMNwNSPWuiOWGUu9JA2CVJWZp7V0WFCDX22muZKXCA0+
 WjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779296617; x=1779901417;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V5OTAMZnH4CljFP2Ceujel7DB1EvDMI7Nk1bLAzzQRU=;
 b=WLkcDSvDedGIAIkNvjlwca0HTW1ZB3xW+jxGucR7umnH7E48IbZDMEdZerkk3Uhpxe
 4XZForHBWjBaoai5Cuws+e7ltCgXpVACoYFeTSv6nGZjhHww/y/cl4gE63OJ4YstvXv0
 lsRwQmQZZyBPy9Bof0Cv8llDYBeqdfVxwT12CIHgg8/Qea/2A384xdtHzkbOChVvTzad
 aBgNgb+2ZPAF/C407NsF7QTmPd3qlReNJecBh95ooxtGAwNfmsV+uXbctfTDpLZMwRSZ
 rDuEl9Bvgfs/F2lpLNcvetlFcoSUpLGiKDqM7A+MUSslExBEHMqaMx4IbYWWslF95YDB
 N5yw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Q4Li78//NvABO9jcJkA+IO/WNa+4q+gjiwtbQ9+Jjixj1ck1Jng4Q7ps3MH0uoI0uxJAOEHqf5w==@nongnu.org
X-Gm-Message-State: AOJu0YwRap3kPRUI/pAu0vZFrR4ZuFmvmFc9ptWTUZ7EW7xHpe30oPaW
 Iyq+jOQTo79W/oysM/KPMb9hYt/ILYUTxMwgEzdZOAL9O7LtVw4G0SSJiK49IsiOrAQ=
X-Gm-Gg: Acq92OGn8f8oJwHa4t7DCtEA72xVZUUXGJnhnfDPkauOXOIB84G6I4BDWUm7EJ77+ji
 AP7Xg3RkJ5N4UOBcJfhdHrI/UgUVzIxBC3DYSWB7DjJPgR4f1GumZHKauEuHVUkq4Ptko/Bls06
 GsedV6jL5o0ze9XwYNAIszHkSpjFPM/Kqlkzv0+aMCBPAGQ5lkdpCS9UYErUIxIzAVYYGZz6hvh
 omyTD1e3MkFsYUOlr+WSeV2GaKDL1wicywxRMrSMArjLZhs6gmIdh2Zho78ELOq0xtqfLG2KZFR
 jK9NkD6EB7+TjhXCubdrUpEbbU9NuL/oJ2iFJOg+bTk61pu8GqKtVkwx/7rIOPmlCX0gKSTDVAz
 jNacg3D7XlabMTWKzohwG8MtgCFxaoJE9fKBmQwM98z+eFCHYfXN2oacw2OJ4bSmOF0dXofwkQC
 9RR6uuyI+NOBgTosIX1vhsOOm5XiKxVSaJF4wxBFQdSSfxtMM=
X-Received: by 2002:a05:6a20:9151:b0:39b:c0b5:b0dd with SMTP id
 adf61e73a8af0-3b22e7ac021mr28016578637.4.1779296617303; 
 Wed, 20 May 2026 10:03:37 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c82bb07b007sm20305825a12.11.2026.05.20.10.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 10:03:36 -0700 (PDT)
Message-ID: <3e43803f-b34b-424f-a3cd-e54ce6177c9b@linaro.org>
Date: Wed, 20 May 2026 10:03:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tcg: Factor tcg_zero_i128() helper out
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20260520121644.10835-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260520121644.10835-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

On 5/20/26 05:16, Philippe Mathieu-Daudé wrote:
> Extract tcg_zero_i128() helper for re-use.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/tcg/tcg-op-common.h    |  2 ++
>   target/arm/tcg/translate-a64.c |  6 +-----
>   tcg/tcg.c                      | 10 ++++++++++
>   3 files changed, 13 insertions(+), 5 deletions(-)

Thanks, queued.


r~


