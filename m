Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3529814lfc;
        Mon, 1 Jun 2020 16:12:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeLZHhsoMvTMTCPZoE3QGCIn1hLLeVzOkOwZsiKkSpaw+N0sQDdN5bQWBCncVjVpoC25mz
X-Received: by 2002:a25:800b:: with SMTP id m11mr36089643ybk.35.1591053138418;
        Mon, 01 Jun 2020 16:12:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591053138; cv=none;
        d=google.com; s=arc-20160816;
        b=T/foEilxQ+SDeyoqeOvFJWZjVTSc+FgoJTlwTZExKH7rNjKyAoJOw+WwW78TSR1ht+
         6iZsj7n5ZtNPL6T02T2T7jjnVHdgn/aHJYG364v6oO2xTE9yyrz/OQxKYIx8kUTWV2FF
         XOObARqroaPiStwl38I5oFaPoAN4oBSnBQfx3CC0tVbMiIJrHT0uqlaPw9QfGC7HaASI
         DUsym9ZrqvcvE0cpU9BZC6VdNj33Us/vtp0/7uy3lsRq121EwgxFLc0SyBjBj0xrjXOs
         ASbm/y2e3gfzS2Mi7mCqShEMHor/kn320Yq5CsE/TmLU/t/X1D3jX5wm19pYny071Jcv
         CXaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=u2/Vj0j1EEKQPznyFyx0ehES/i7oODuV1pAlFlwOYic=;
        b=YHAYCjtau5rndf7HY34bGbAxHf53dL1m9fxNPGE5a/DmVUaem7KwOEblw//zCKnkyD
         ZTZmgbhq3GIioK6hzdR4X9PfSqRAEo7GoGLcULGjtHZyQklZfeOogunWjdlsLbo3pHI6
         VkW6ehSyqtkXEysmYY/cpII8qkkT1jUZYDzQfnu4cWSjOyaJLomDIQ89R7jv9c13Xj81
         FT59HMxM/K8RLsb4Z+8nDb1DoYbMhkq6Td645kE0O3cHYTZzfKX9ytG8bpKvIjI5Igzx
         AKoFModoh/n1E2ZRBUXTiAZDJQNHylizR/j/p9S7pRAq3G688867TvvbfxaEkh2z/asE
         5M4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BmPTUV7y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a96si630589ybi.245.2020.06.01.16.12.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 16:12:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BmPTUV7y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jftbN-0008FV-Kr
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 19:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftbE-0008Ej-1z
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 19:12:08 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:46981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftbC-0005Gy-Dg
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 19:12:07 -0400
Received: by mail-pl1-x643.google.com with SMTP id n2so522754pld.13
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2020 16:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=u2/Vj0j1EEKQPznyFyx0ehES/i7oODuV1pAlFlwOYic=;
 b=BmPTUV7yUkyOroADapH8Tsf0bAHn+k9qXMmKq6nH+ZZb3e7hiO71Rm52dkx3nGkxoJ
 fReiSUp5/jKnx7Rqj2DWZxm0kv6T886y3FUpRC2W98h5N5iWc+PHxC/oLPnfJ4GaTmFu
 HfgbrT94BUyfS2OGjuSaoS5AKz2PRMglV8XysGFtLOwRBIZV3W5DaSezc3mqAIzQ0R6I
 tz6w9066Jt+PhMP40WrISJFg1WrNoAd69ZrIaDO7V6BbVuX+a7eXiiqs4Y/oii/1eRJr
 NsmGvWy+PB6pbbsVfMQ/v+NcmDjMbGDUuGLAyqYC0NHoyNK8d+1NDqXVxmRLuqMwB+ed
 1BXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u2/Vj0j1EEKQPznyFyx0ehES/i7oODuV1pAlFlwOYic=;
 b=ZKOK/6wRxRD6iY/4osILuvgp7c/VCiUiK+7q1Vttn6yHT28hTQZLGk5zxHJYc5WNd9
 Iwx/ozVrCTzIvfUmyH/6az+GB2LFItiPhURShIf+JqL5FLZLQu5xarRHnUML6Fqajztr
 hrP777L4fjmOCmXKHXp/S5rcOljF42CxLP8fvXoITka2OOa+7JeJ4WV1O0jRAuNfpKPU
 51VUKw7PZ8PHGiIbUa9a3fmIIc0dotvSaJtu914zKkNLymqwxBTSnL/9qJ++3z59iJ+y
 Po7di6kxbO5ybHUPBBIXK7XIA0oUYCiCINzW8bGoLz+JzeqoLujDRaODN4dm/opk4Bn8
 HJ8g==
X-Gm-Message-State: AOAM530qOZXHUpLaNH4828iXDP9EMbupkkppVKZqvDF7aUH3CxBPbNLw
 eq3v9y/7qwv67xqz25Ba6aNHbQ==
X-Received: by 2002:a17:902:301:: with SMTP id 1mr19899643pld.65.1591053124595; 
 Mon, 01 Jun 2020 16:12:04 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p4sm385046pff.159.2020.06.01.16.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:12:03 -0700 (PDT)
Subject: Re: [PATCH v2 4/9] target/arm: Convert VQSHLU, VQSHL 2-reg-shift
 insns to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200522145520.6778-1-peter.maydell@linaro.org>
 <20200522145520.6778-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8bbddda5-3474-38cb-5a7f-0663586f645f@linaro.org>
Date: Mon, 1 Jun 2020 16:12:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522145520.6778-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tx8ICOUxMHkS

On 5/22/20 7:55 AM, Peter Maydell wrote:
> Convert the VQSHLU and QVSHL 2-reg-shift insns to decodetree.
> These are the last of the simple shift-by-immediate insns.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  15 +++++
>  target/arm/translate-neon.inc.c | 108 +++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 110 +-------------------------------
>  3 files changed, 126 insertions(+), 107 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

