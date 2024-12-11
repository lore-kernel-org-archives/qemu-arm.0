Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4436359njb;
        Wed, 11 Dec 2024 15:45:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXCaNxIhukhsVs6IN+l0VBud7Wlqp2q3+zULIBXLdQ5X3jeZ5kLUGt8Z/OAc26Bf3TA1TW0d00MolbjnA==@linaro.org
X-Google-Smtp-Source: AGHT+IETENyQiAPLy6evrlZ9KjmkUz4dl8rbg+ynx7qURpsTQDkecvu3sMz/6IwmolFwC3RtUmE7
X-Received: by 2002:a05:622a:c3:b0:466:a0e2:ae8e with SMTP id d75a77b69052e-4679615abfamr19773231cf.9.1733960723719;
        Wed, 11 Dec 2024 15:45:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733960723; cv=none;
        d=google.com; s=arc-20240605;
        b=hmuvATCjYOErN/Z948mkL+xnBikYwYrU7xytJGGHPJ8oI4ObhYdpe9avxI4BoKreds
         Qgg1YHKteYjoNC4FkzHs/1MINu9b7/5a/P83C9JUlK40V+nX3bw4Yf/UYvY1oRXbp+DO
         Z6IRlhy1QfglF2sKzjSSu//MFLEkLf4OWrYBFXFT/L9pkmohFlGW5EjSBFYHbsQvijEk
         f20i4QP4OM/W8oSwgH53DotmJiBpMiZHRkhRDnpUoVxr2oPZit78qyuAHgqXlaWXQqGo
         yjX7UJg5c4OmQrIMZ9zLv19TKwRiC7gby7IF6hmOBfDYtZDZxIjazaA6HeA/fweUurDD
         cFqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=asBsdveSZXJzlahZnC9uRiEsUztlvSZanJRY5LQF3x0=;
        fh=3q5WqOVbDofvnvK4+GYVD35rqVtkPft7ZumYm3EIRiU=;
        b=C0HxZ7z8uDztC5zB8kX+y8Cw0ivfp2yVmO7njomDCeaOo5uFUtFgC5nNcWLTnToI6I
         uspURncwtG4pJUozA+ZoTb6lfs4GEbGxEnx1Qmy0JmKkzNsyQn7p/8+5Rh84Ag6MMHI9
         T1u1ZD5vc0pVh/NCXjw1HYBh1TYgvikpj69GzDEVKcxShTzm9ctLgm7Nt894cTrATmU9
         o8vAgNIof3v0cL1VoIgvIhMXAuSwIKWEl8HCDlpaxRvfW4kSaxS+QEY1+xBnSH+eVwVc
         MI2mvLF5zRlECWUOVco0sbkzwhuXuyYwJ4MZFDVBZsB6K8X76dhUtidMCc7ema6+dxRx
         IaVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TiAZcglC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4678d51387bsi22659591cf.176.2024.12.11.15.45.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 15:45:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TiAZcglC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tLWO6-0006MR-Cn; Wed, 11 Dec 2024 18:45:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLWO5-0006Lw-FT
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 18:45:01 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLWO3-0000JL-At
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 18:45:01 -0500
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3eb5a870158so11288b6e.3
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2024 15:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733960697; x=1734565497; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=asBsdveSZXJzlahZnC9uRiEsUztlvSZanJRY5LQF3x0=;
 b=TiAZcglCc3HtIVuqnL0OMLDx3LH+uhYyWFxZPGK37SRRwafB+51mvTVxRC6qUqVMC7
 Hdm1SSufGGieB7MjWIffy6QcMV23x1hPrWkqJznGlOr/o4+13vgwCdr9pfHlPbo3DhC9
 mCXvpJY1MB8KoblrfytuHkpqPoUAvlE7Rh8U5aSwYvyFPV/Ou3sE7IgNqg/d0ESg1iIo
 GfiSdFyartJSDpMRRZHd6u5OTsL+wa8tMddgOpNQmdKaS7lbd+t5LpwZglqeM0jdaabb
 Z6QH5jOGdWQLvXlQwHrMpOlN8fz6L8ZTrtnPT9NC1aphn8FPu7/Y/pmWwzj3VI3MSl2q
 rv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733960697; x=1734565497;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=asBsdveSZXJzlahZnC9uRiEsUztlvSZanJRY5LQF3x0=;
 b=ehD3lWDqzWtksaQzXUQyANo8dBdXJK5C/0QSgmShxwXsR/Uopnj/pzc/AscphVoUpz
 mS5cd2zLlrfSEvg68SJmHK8IQTgbrvRAeOYnD8keHD1iZys1rFm9y3mXA9ckk3j172EM
 y6sv6oUTS5SaFrBhSshw8QBafsUNN0CRIjBQev/ZCVAPhSsCn3/cfFbbnGS3iucSIW/r
 2n+zZDvhEW332vVGuQXkmcSIgVcJXakc9zJPdtga12gLM7TgCYAim1HosPjZPb7QJQSp
 hDF60/7+dwoHVXB/jq7SjjKLI4KQYlqyaVi9It8nR6e9jCppGiDlxH+DrGHdX/wtD5fZ
 E+Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDbL2E8e38jSmpgTmZdg8Os7f864uT1A0Ka9t70LQJORGTHkObFXXbMF6XUdSz5tcNIpdEM9ADWKcu@nongnu.org
X-Gm-Message-State: AOJu0Yw0mL2QgaxQd4go0EonEn7u2Cif+mg93Ysga6sa7tqr7Pqt0npT
 eIZyGhDM/yS987u+IzN1y8aG4N/CZAJaPT8yvsoKFNwKq2nblUGYsdAxQmDkE6E=
X-Gm-Gg: ASbGncuCmUeDuyUBJgqnoXFwhaBkWCnMFk9rX1sfGadLB3xFLZHTcjZ6ZtibuF711Dm
 ITvbazV0DHi4Sw9uGtkESmEcgnhuat6ZkUQQIcOdSAnVX6wqRH2L4/8TXKl52svtA/h+JK/YrmA
 vbd7fNxvFh4WcFJ9ys7VCg55sA/N+cHPtMZotmWEMeKwuMcx0I3ngShds0+DPuLEPrYe2laM1+Z
 cKfQWfYPzgSjUXY5ihb7x2VdxFIKW5WtCNP874HaHncXOEzDQcPZDG0+HnpzWEpWPlE9KAoBO9O
 /vI7gdK9tf8CgQ0uTRrlhUfFRL7JDmKX
X-Received: by 2002:a05:6871:7bc2:b0:297:285e:f824 with SMTP id
 586e51a60fabf-2a3823b5f24mr1150446fac.10.1733960697379; 
 Wed, 11 Dec 2024 15:44:57 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-29f715d7daasm3707234fac.35.2024.12.11.15.44.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 15:44:56 -0800 (PST)
Message-ID: <5c279d58-7da2-4428-9414-488475668505@linaro.org>
Date: Wed, 11 Dec 2024 17:44:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] target/xtensa: Remove tswap() calls in semihosting
 simcall() helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20241211230357.97036-1-philmd@linaro.org>
 <20241211230357.97036-2-philmd@linaro.org>
 <6e1e69d8-a9f3-4a30-83c8-84c5647578d5@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <6e1e69d8-a9f3-4a30-83c8-84c5647578d5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tIC5Cse6+uh/

On 12/11/24 17:08, Philippe Mathieu-Daudé wrote:
> On 12/12/24 00:03, Philippe Mathieu-Daudé wrote:
>> In preparation of heterogeneous emulation where cores with
>> different endianness can run concurrently, we need to remove
>> the tswap() calls -- which use a fixed per-binary endianness.
>>
>> Get the endianness of the CPU accessed using the libisa
>> xtensa_isa_is_big_endian() call and replace the tswap() calls
>> by bswap() ones when necessary.
> 
> Instead read here:
> 
>    In preparation of heterogeneous emulation where cores with
>    different endianness can run concurrently, replace the pair
>    of cpu_memory_rw_debug() + tswap() calls by put/get_user_u32()
>    ones, which still do the same under the hood, but simplify the
>    code maintenance (having less sites to do endianness code
>    conversion).
> 
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
