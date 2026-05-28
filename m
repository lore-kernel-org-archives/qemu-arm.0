Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420CACD4F54
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 19:55:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSgoE-00081I-Ef; Thu, 28 May 2026 15:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wSgo9-000805-D3
 for qemu-arm@nongnu.org; Thu, 28 May 2026 15:54:22 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wSgo7-0001td-RQ
 for qemu-arm@nongnu.org; Thu, 28 May 2026 15:54:21 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-369002b26f4so7768363a91.3
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 12:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779998058; x=1780602858; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XBuSsHiEHgYnWgeNK9Jy+biU6DBsZhKV8neRcmnLcmw=;
 b=ZfSwlDljHJRHyeCFOMgCYoui/+mge41AbvuenqJTTabBUb9jNy/ZfrP1R3voFPuMmt
 rfe9JK5HWJJVaEOXYoxJxN3Olo9Txk7fbkCmcFbsk/Aqr8Dn6xBbfTfI7AzzxCJdoEMs
 06O9BiaOl4XT+jFB7FytwEJXjHQ1otmAYqJUvKn1VtIADLIOyD/VHaxBJA3kQEGG4TSK
 KIAVLjuq+4+5SQJIr5l6wuvchZeRJd8kD0astbMKDlJWwBtZck+P9FtO7tzyrzFJh3sf
 mst9Nq58QA0nFhW5IUP8zX0rU4gOG23x8tjo6bMd4a2Ck9R1YSVu6z0OsrptFEEWb4uP
 05Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779998058; x=1780602858;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XBuSsHiEHgYnWgeNK9Jy+biU6DBsZhKV8neRcmnLcmw=;
 b=l2fOFTnoxWnqO8+IDU1yDdJAkoLpXzu651LJigfMT4w2QxgWrq0WFUbGRxXPVloegl
 ga6uV0bSl6TLvcLhjAGQxg5LguH1jgFRDlzQZac6/jES2nEme2Wy7j/HEwclMYG/9u5G
 xAceI0RR6ENW/N+pwwo+xSqwXm201K7stzt6D860rtaVDD58XJQHrMELciG/TEgFqRw1
 bYTipSIOmKqrcorHuuqDeU7nrnKO/2WCcrAqZXEO96oPb+F8ez1DjzZ0OtFlo2reuKdZ
 SHRhZshjkkhJALWi3Uy3CkGrHh1C3VV1kSvjK4ddzsXNrjXHrm4G8pbem4dqTVogVj9V
 wSlw==
X-Gm-Message-State: AOJu0Yyr0Y/gl//TnWD9AIw89d1W3KXnKwRoz8DSEXf/7pEYPDWR+ajU
 VWoFiBJVL3nf9yrOcsHtYS9TBlydVXL7RWQCOSjzrlKXtHdL/l1ztP63YnQZY716P1A=
X-Gm-Gg: Acq92OEwbvO4Q1mC4t6+UtXN37mBNheEcdv4pgVddPLgKVjExT756jZw08XK4shU5aV
 2Sb2X7mUKksqVrSBfMOj+VrK+lUQxPhEckpZlgFbRjtYmg2Eqt16NQl15gUcd5LD3JgwU6Apw0i
 taUK59nyZ/8j4BMYnVn8D/B8VJ++4WMA3AA49zPiZlMwJbfQtKc9ZHkAZpsmrA7RUtQciw4XzrI
 Clr77raXrd48/wCRqdxNJS+Mj7v5Q4D4bo15rgBtzijmDA8jmy4dKxOopyPbx3rprggD9qg/hup
 CrCbc9xZsvEKqUdySIpYnDDtCAiV97ZchXd0ofgn/iWZngEUUO711mKbhzTeSHio6D520F75cVi
 MYU7/Yx+sutr+4xc09hodQCZjeMk9nEExudtUbcKIZ0ZAEtLLiwXiPLKhMzky4xBMDwPucHa283
 8ioV4bGG4XZVUc+OSL9dOaPyv+JsIG4vaSD9KADYAu6Lj562U=
X-Received: by 2002:a05:6300:2293:b0:3a3:90d8:fd7f with SMTP id
 adf61e73a8af0-3b40e2e8f2fmr219851637.8.1779998057738; 
 Thu, 28 May 2026 12:54:17 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c8573062c4fsm88729a12.22.2026.05.28.12.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 12:54:17 -0700 (PDT)
Message-ID: <5eae07fe-f397-472a-8a49-346471d27d3c@linaro.org>
Date: Thu, 28 May 2026 12:54:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] target/arm: implement FEAT_RNG_TRAP for RNDR/RNDRRS
To: Jason Wright <wrigjl@proton.me>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20260519153249.31100-1-wrigjl@proton.me>
 <20260524002617.69593-1-wrigjl@proton.me>
 <20260528181857.92087-1-wrigjl@proton.me>
 <20260528181857.92087-2-wrigjl@proton.me>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260528181857.92087-2-wrigjl@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 5/28/26 11:19, Jason Wright wrote:
> Add an .accessfn to the RNDR and RNDRRS system registers that traps
> reads to EL3 when SCR_EL3.TRNDR is set, as required by FEAT_RNG_TRAP.
> Mark SCR_EL3.TRNDR (bit 40) as a writable field in scr_write() when
> the CPU advertises the feature. The pseudocode in DDI0487 revision M.b
> shows the trap firing from EL0, EL1, EL2, and EL3, so there is no
> check of arm_current_el().
> 
> When FEAT_RNG_TRAP is implemented without FEAT_RNG, an RNDR/RNDRRS read
> with SCR_EL3.TRNDR=0 should UNDEF rather than succeed; handle that case
> in access_rndr(). Register the rndr_reginfo CP reg entries whenever either
> FEAT_RNG or FEAT_RNG_TRAP is implemented, so the accessfn fires even on a
> FEAT_RNG_TRAP-only CPU.
> 
> When SCR_EL3.TRNDR is set, ID_AA64ISAR0_EL1.RNDR reads as 1 regardless
> of whether FEAT_RNG is implemented; give ID_AA64ISAR0_EL1 a readfn so it
> reports this at runtime, as we already do for ID_AA64PFR0_EL1.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Suggested-by: Peter Maydell<peter.maydell@linaro.org>
> Signed-off-by: Jason Wright<wrigjl@proton.me>
> ---
>   target/arm/cpu-features.h |  5 ++++
>   target/arm/helper.c       | 58 +++++++++++++++++++++++++++++++++++----
>   2 files changed, 58 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

