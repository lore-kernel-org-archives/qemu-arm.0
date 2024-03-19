Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1422979ejb;
        Tue, 19 Mar 2024 09:48:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvspY6ozTxfdZK6FBRRsESTFr8tN5EUKgOxJ2toQwbE9bSyEZXJ/WdKQmImd6Ljn0cTzb/UOIw7M+TwVBYfgZ6zOLWe3u/
X-Google-Smtp-Source: AGHT+IEPPCP19JwNPezs+hgBJEKvw7lln1b07+JGDPTaxdx8jXLzuFYWR1B6hVnyr0lRQuQaCNdp
X-Received: by 2002:a05:6830:1242:b0:6e6:832e:87e5 with SMTP id s2-20020a056830124200b006e6832e87e5mr9463849otp.27.1710866882749;
        Tue, 19 Mar 2024 09:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710866882; cv=none;
        d=google.com; s=arc-20160816;
        b=o61HblUWfeYVwPR/vtiAavsh1Y7uo86WgaslfB0mQud6ElV0hVBqM+NjCCsXAHZPI1
         nu6rGs8KdazG64cJ8XILMMN6fzm8zfaYslbcWRiStY0P81257EH3HM2vl/d7yUIrAlwQ
         xQv5Vl9vFctlVdqEJm5qOcY20jgtSNAI9/PriXrD18TVWY8G9jVa8/NH7u1VFYBDHXOV
         ZcvLRK8DCXvDDDZLnw1xBRbPGpE6/8z5WLeyZm53xL2mZ+0EAP2Lu5FoJldZ6EYZI6BE
         AdgVokUKNIrKUB6datkWK6hEhub25WYFpQFapQ183V/oY0C//CQiXXoLh52niwB3CFfe
         6D4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IBaiRPredbqYgZQPnp8ZalF7vsr6iFg3y624z8HxiP4=;
        fh=Dl6ynlyabGzsFQ5o+dgtXkGZnxsaBF2g4MgEc6WSOM4=;
        b=A4X560+m0CaGbdDiwUYRbkdHlWQ74qxM98dFZTCEQ5AwZ4jAinRCP28Wk7mgvqGZE2
         21XcsFxxxf6ZrTQNG+NVjIY5PeBEFs02pZRtYzin+OdcTUktbjiViKdKB5G5Br2ACXld
         mMdzOfyOGw8a5HqNoBUbTX/6HA+7JwY7KuTY0PBGx7h2ohVNpoWoNivqm/r3iNmErRd2
         QlEC117BgAL8j68HHaWbRTlxaExN0Rdhp47T+aeVwOpK4uRMkBtQGBPYbZx9WmGriPlc
         aYdG6TCrv5CrWqNNbzPGw5NMTw8rzRU5/TVb2MoEkZ+fpNpoG6ad9bxrDK62T4HfJxZB
         q3oQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iJVJ291A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq9-20020a05620a468900b00789ea49f1c8si9446212qkb.563.2024.03.19.09.48.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 09:48:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iJVJ291A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmccj-0000IO-8M; Tue, 19 Mar 2024 12:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rmcci-0000HK-18
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 12:47:36 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rmccg-0000f7-GL
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 12:47:35 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-513da1c1f26so6755142e87.3
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 09:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710866853; x=1711471653; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IBaiRPredbqYgZQPnp8ZalF7vsr6iFg3y624z8HxiP4=;
 b=iJVJ291AO+U+a3FShLV8c5YWjPArzntXat3elJ0qldTuQL71rJuWaFJ7lT9ex9VAR6
 j492L09go6eUJtI5ypqlYczhHrtCfBkv28UM1oEjkMn6C0WDRCxIPdjavwhLPpXpOzaX
 KVg3K+VBWNoYQR1oM209Tlp6NONYWPSNNAOe3SYqQFrHFpFeQHHDcIEFcDsGeDq5pCKW
 v3DkT3t/SPszpKBKrRLHOxmi9kVOND/DLetZLx4RxLFO9jO7lcLuHTCVxnkCvf5byT9h
 JAcIHSh28ymSv/ErPZr2JXVECd8zqXD5YO9MknYE/nJRKmbF3iZNYsihj+B+z7Mw+k5T
 dPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710866853; x=1711471653;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IBaiRPredbqYgZQPnp8ZalF7vsr6iFg3y624z8HxiP4=;
 b=AdvwlrCNVa8zN4JcfdgavGMQB0QHLECvQ8HSGnzy3/0WiRBSN30Ds+FW/369jNfSNZ
 G86OVpAMRDYHDEB/KwK2Yld843XSZig31sXRDh1eU4T1a1Yqfw34taP27oyJGE2Vqu0Q
 MyYcHc2WoD/LwL2UYFHbs0vWh7alTppsxrggCpAWQVd9m0TmcXznWHC8XdfaTrnMV/UI
 fWD2GfNpA+irr8eP1IxsKlUqqokY2gH44UVwQxPQ/bAiMJX7E+GRl/CeyNOh6jdks4yP
 NEneABvLxDJEnlJw65Sn7GwXMkCvB5ka+CKfdd6+pf6sttafGlAOwTptHPZra5LMGwHR
 cXMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe71pg7rRJkZiFTcsFLBMR0BG3fOUZ1R9NeA2voaKYpHbWzn7gO/vH30/Y7cx0NgKm/PiHcZb84jw4xKcFVFdsP9L6
X-Gm-Message-State: AOJu0YxsBAx80oUpqmoJk4i0dDkQtKW519JywrP++G/b/dn4v5XLXHtl
 8sI2j3TN9FiLTQOxCHHkvQ9MhLvgBNwpUq04alJRLjXh3BJgJ+kHWZdA6pTaCCb2eZhpsWkM9NQ
 ytPADGwUpvux4UxUsWrB1dfJlrtBw5mkqpSM+cQ==
X-Received: by 2002:a05:6512:102a:b0:512:e00b:8da4 with SMTP id
 r10-20020a056512102a00b00512e00b8da4mr10010759lfr.53.1710866852637; Tue, 19
 Mar 2024 09:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
 <20240318093546.2786144-10-ruanjinjie@huawei.com>
In-Reply-To: <20240318093546.2786144-10-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Mar 2024 16:47:21 +0000
Message-ID: <CAFEAcA8_2U6bydhixx+j84FUBY3tT5rN8Y4c6KHGjbbAX+1v3Q@mail.gmail.com>
Subject: Re: [RFC PATCH v8 09/23] target/arm: Handle PSTATE.ALLINT on taking
 an exception
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lf1MAwP8uMcV

On Mon, 18 Mar 2024 at 09:37, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Set or clear PSTATE.ALLINT on taking an exception to ELx according to the
> SCTLR_ELx.SPINTMASK bit.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3:
> - Add Reviewed-by.
> ---
>  target/arm/helper.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 4bc63bf7ca..81f4a8f194 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11705,6 +11705,15 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>          }
>      }
>
> +    if (cpu_isar_feature(aa64_nmi, cpu) &&
> +        (env->cp15.sctlr_el[new_el] & SCTLR_NMI)) {

This shouldn't be checking the value of SCTLR_NMI here:
the new PSTATE.ALLINT is set to !SPINTMASK even if NMI == 0.
(The SPINTMASK bit description is a bit confusing, but
the correct behaviour is clear in the AArch64.TakeException()
pseudocode.)

> +        if (!(env->cp15.sctlr_el[new_el] & SCTLR_SPINTMASK)) {
> +            new_mode |= PSTATE_ALLINT;
> +        } else {
> +            new_mode &= ~PSTATE_ALLINT;
> +        }
> +    }
> +
>      pstate_write(env, PSTATE_DAIF | new_mode);
>      env->aarch64 = true;
>      aarch64_restore_sp(env, new_el);
> --
> 2.34.1
>

thanks
-- PMM
