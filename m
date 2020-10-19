Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4295243lfa;
        Mon, 19 Oct 2020 16:27:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0Lq/S60urlsXhDUoU6padWX2J3S9dsKfPv9G/pDbNd1DOweEfLf5goBH7JAxHTqpKTVZ7
X-Received: by 2002:a25:ce8b:: with SMTP id x133mr332148ybe.91.1603150052624;
        Mon, 19 Oct 2020 16:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603150052; cv=none;
        d=google.com; s=arc-20160816;
        b=QQpNRR3rtaGg/WUlQleQEP4fL1cAtmPbKjXur+VQ5mNyVyRZyxksNM0jCEO6IJJf5W
         eecBrfXrw2oo0lfTXejAvj1w4mtVkFTsCjBh2bRV46X5tulovKWXRKjgM9XyweIh6jfz
         YV4vOiW7h/k1pnTyct5HtwqkVcOBY4YE4lZy5kGX8Z58vYn/uQZTUWHXvS0W3B82PigY
         42h8NsBWG9NKWRqGfsOjmedEy5VwmEIV5m7dfAeqwdhmBXhpISIOJ7wnb91sKu3XJJJs
         MxuXDHNNtCAFSNohDFw+I13qnFLLeG2iCpW8XAfZngY9NxcTx3dE7Revw4kNYFJoqZS1
         xQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=I092C3thHU0Dt4M3lwY7S4zpzAxG9EpfDsRM7GWUPtM=;
        b=B0hwiRSPLzu65P/hFhVeTjqJCBqY6MV5mVoWiOG4fipdTkkA+mohPF1r0til2PJ871
         TGexxeMu04hJYHC6RD+YSHawxecdY3n2BNzWsyWoUGoqbEbcIQZfQ+A6rjNyftrkqY+e
         f5FqoYHYUbKyZjQgeqHwCpxKVtPHd7TSQjXqf93K5LLWyxd6h5MkAqYwJJi6hYMy3m13
         TaRMhD41xjd7Av2lBsfS8CEH79mwUHb6419YKLnp4/BpEaqyQFtTxJ5NP+oT/dWa2r0r
         a7pyBmWL587k53uf6mJoXUJXUgEFFeLIY5KS4iq+ClznzipX7nWICki21Z3cBJJR7Qwu
         pVXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tacSmC5d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11si1334387ybm.416.2020.10.19.16.27.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 16:27:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tacSmC5d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUeYu-0003JS-29
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 19:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kUeYm-0003Ic-CW
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 19:27:24 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kUeYk-00019h-Gy
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 19:27:23 -0400
Received: by mail-pg1-x541.google.com with SMTP id t14so942204pgg.1
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2020 16:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I092C3thHU0Dt4M3lwY7S4zpzAxG9EpfDsRM7GWUPtM=;
 b=tacSmC5dzXxmyc2g9AgjLn96ku4bSSYh3BMZAm564L3gtSRwQHygtPdZ1Uh6Q+ve0f
 0GjT+IQY02NfIUWiMRbDPoQYGQoAHxYKLuIH+meyyjBk6jlZi/QINmre7P24uh8WIW8I
 xG26uiwqsDGh+Ejnf/TGBPHwIVaEsauHDwWqRhXQs9mczmve9YA5dPkp2/YLB3rYTdQI
 dMsfuOWprYi9SvqutTtDgrWECMDyDJQOzR4/UWYP5HMVRIxr8O0c3AL13qiiwuPhEhY1
 CB2WRS5RMv4Fao7R6Y3KipD3c23lUDcFALM0uJ/MNDcfgIDbHVFFIqyhzKLvFJlSSRmq
 6/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I092C3thHU0Dt4M3lwY7S4zpzAxG9EpfDsRM7GWUPtM=;
 b=GGuvoEE745SO5cd1MNnFi0SzpOBsuuYmOwS3oE0HyOl0CQQi1iVHrl/hL5UKZc2nI/
 9yFdimY2E74Qsyi7GfEdoCkfb4bfENVisLZnujBFCd4K+X+6Kvj9MMHCG8vzYokbSQgl
 moKERFGAdNduPTIYt17LG+wK/nIOsiRlG1Rw20qbbd2j+tvsGYpxkwavMl6WBC+srOaW
 qcDR4g0AYtua8fj9lsCmJtahTJCJzVTCQ6BMkGWxx7OkAxrV5pFFamomkiFT/ptCVbsr
 QJzBoWFTGg7P6HCx53p0Iq1AvpWpg42q/to6j2qkMSDRtcB1VgbJSlzyPQO93Vw1Zx1U
 Sc2A==
X-Gm-Message-State: AOAM531ehNwUqmldLJPAnlkQxL6LBuAGfYYPn0SBXq9Jai2r9QKSq4vC
 xj1FR3SYwJICx64vMGsQ43Af9Q==
X-Received: by 2002:a63:44d:: with SMTP id 74mr208502pge.374.1603150041038;
 Mon, 19 Oct 2020 16:27:21 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id m11sm66219pfa.69.2020.10.19.16.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 16:27:20 -0700 (PDT)
Subject: Re: [PATCH v2 5/9] tcg: add const hints for code pointers
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
References: <20201019013928.72770-1-j@getutm.app>
 <20201019013928.72770-6-j@getutm.app>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <11912dd5-2740-1d7c-c691-1174fa7ef390@linaro.org>
Date: Mon, 19 Oct 2020 16:27:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201019013928.72770-6-j@getutm.app>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "open list:RISC-V TCG target" <qemu-riscv@nongnu.org>,
 Stefan Weil <sw@weilnetz.de>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 "open list:S390 TCG target" <qemu-s390x@nongnu.org>,
 "open list:AArch64 TCG target" <qemu-arm@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhc@lemote.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rmoR0kDnj9xg

On 10/18/20 6:39 PM, Joelle van Dyne wrote:
> From: osy <osy86@users.noreply.github.com>
> 
> We will introduce mirror mapping for JIT segment with separate RX and RW
> access. Adding 'const' hints will make it easier to identify read-only
> accesses and allow us to easier catch bugs at compile time in the future.
> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  include/tcg/tcg.h            |  8 ++++----
>  tcg/tcg.c                    |  4 ++--
>  tcg/aarch64/tcg-target.c.inc | 19 +++++++++++--------
>  tcg/arm/tcg-target.c.inc     | 12 +++++++-----
>  tcg/i386/tcg-target.c.inc    | 10 +++++-----
>  tcg/mips/tcg-target.c.inc    | 33 +++++++++++++++++++--------------
>  tcg/ppc/tcg-target.c.inc     | 21 +++++++++++++--------
>  tcg/riscv/tcg-target.c.inc   | 11 ++++++-----
>  tcg/s390/tcg-target.c.inc    |  9 +++++----
>  tcg/sparc/tcg-target.c.inc   | 10 +++++-----
>  tcg/tcg-ldst.c.inc           |  2 +-
>  tcg/tci/tcg-target.c.inc     |  2 +-
>  12 files changed, 79 insertions(+), 62 deletions(-)

tcg/ppc/tcg-target.c.inc:2349:26: error: assignment discards ‘const’ qualifier
from pointer target type [-Werror]
     s->code_gen_epilogue = tb_ret_addr = s->code_ptr;

How many of the targets did you build?


r~
