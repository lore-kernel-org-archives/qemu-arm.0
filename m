Received: by 2002:a17:906:e18:b0:a38:6d10:c5dd with SMTP id l24csp630296eji;
        Wed, 7 Feb 2024 12:04:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCViz/8/HBo159nqHMu8rDsiCyYPdECmysSO9mLY1v9yh1gbU322wnQXRKzro15SxIltG2FXOSnZZ7pkmwctjhMZmazzy71O
X-Google-Smtp-Source: AGHT+IGtubrGRdPk75/dc4EKJwJCHOPvPu/o76Y5J3llQyMMHnSn4b8xkrzseA2TtlWoJcWt4LVi
X-Received: by 2002:a05:620a:2993:b0:785:3749:7cba with SMTP id r19-20020a05620a299300b0078537497cbamr9538205qkp.65.1707336265413;
        Wed, 07 Feb 2024 12:04:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707336265; cv=none;
        d=google.com; s=arc-20160816;
        b=jiejn9NNiMha2l0TL6eIsLbllV2w9r+R1jAAdSw9iKjgl269ztJzCAocDGPAPwrEEC
         3tCbmLxbKoppQXbrkXxJEY7XcjausA3IGGyViFj+taYxm+3l0Vkwopqgrcu0WmTsRn/U
         0XBkh0T8wkCEJ8hsWdY717rJKALHvu3mfXbHpSGMnWyRUKYwthf5WhnaiJutq+vfXLs2
         6i7OCtW8qd2acRUHoePButFTEwvDhczIbwYyuF+RtOlcHfC2xyuM+PsRGHb7qnHaX4xu
         WtZkxf74HwtARCOUMhfN4Q+kILV46Fa7/pBa1TNArS6J7ix1ViI5jUTvKILk8A50asST
         0RNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=ioKl1Fdwa9P3L3uKTM+GqEAzOADfMNO4SBTyXhL2C0I=;
        fh=0L0tcfby0BM2NC/CVhyj0VzuGYWx04QyiwjW01OR8XE=;
        b=K+MKBquA5qhsEpYI9WltHGQ72f4ykdlQpwVXYpbhuvEIhsFGRGzhsssVfQ7DBGgcKV
         MWdWorWqpg+4dFjW4v6ciG/8rbQCVjWEWgVKLKbSt0qgRHo14CrHthQ1RbDDJbZRx5Vb
         lI6w1IOR/Zq9UcalzNcHr9LCzBhjq0KU8JE32Izdy36cJoG2VC1F1akwLpZkDH4Zbiln
         e5MWablOQEOWTAhyYp8+DTolbqf/k7TCtFOGgxvyqyEjbC2lz3G2S9JwnmMHWYu57Jsx
         I6OIgxJgqMsSOZHkRvK5Lfumx2VZRAf1YoD/aKm3bd4+G3p/Pb9ErThI5l5044UZJE4j
         n6Qw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y4l4U8Ps;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCXXC108hWw05EyisYhjtJnFb9saPJtjwbiRve3NDlw+dZITrgqxo4USvaVe3cwKIYKSyokdw5evHdhQLqLPxpGJVQ+5Ip69
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7-20020a05620a04e700b007859ebf2434si1474332qkh.599.2024.02.07.12.04.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Feb 2024 12:04:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y4l4U8Ps;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rXo9U-0004ei-0s; Wed, 07 Feb 2024 15:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1rXo9N-0004cN-Uf
 for qemu-devel@nongnu.org; Wed, 07 Feb 2024 15:04:06 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1rXo9M-0003hs-4A
 for qemu-devel@nongnu.org; Wed, 07 Feb 2024 15:04:05 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1d98fc5ebceso7039325ad.1
 for <qemu-devel@nongnu.org>; Wed, 07 Feb 2024 12:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707336242; x=1707941042; darn=nongnu.org;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ioKl1Fdwa9P3L3uKTM+GqEAzOADfMNO4SBTyXhL2C0I=;
 b=Y4l4U8PsDQIKtBk8+nQ/MKnVSe6jhpGyJEINZd4Rkm0IqSkR9FSkPdC0BAmvqek5pk
 Ib4NIDvq1oC6/dz9LFHJlXOtdisRFmXHBUMxMOY65wHmLpoPDkORWzEQSM34iwPLbqN7
 GjTDH+B6g4U39RDVoek02z4mgBO8/0cVeCzVe4SAPCm7L0i27ocDuBydN15OLOWZYJFr
 +kDnzzIUmfneeYWyYYJ/Y7k+Q4RbBghox6+1mFRWUDEiUcccz6EN0O/nVUenqCd84baK
 YJNe29LnMQzixBEYxWuPiYQSQ6W2f8N/9+B8SNbHXbnn++nBMqynn/+vjXWoI6XQECnV
 qMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707336242; x=1707941042;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ioKl1Fdwa9P3L3uKTM+GqEAzOADfMNO4SBTyXhL2C0I=;
 b=nQHvJ8yX5xC0lbqnNbdk39pvK0PKiPUi/f46yZDo+dDY25laUWCORgpogYHCepPZ3i
 /ioFo6n4X9IrxCMB99XwWsJsjLcE6y9yUqCMUYkY17KdbjRvJpJY97b5kAP+Z/lhLib8
 nMToee2MxSB/UymjFeXIO4aLhfTk41AxG8x7Dac0SZ6reLga+EzPo0bpYwEeeSlRe5YQ
 l+QYhMBo4eV47szXzfCVTlkXgQbmnVDkF5I0Qio8mxs5NaEmbt7v05FpqQFO/P6/3DC0
 WbN7zbG6b1iVW0I8RLY4dxAye8uR0lH26ZXEfT23e85BQYK9cMC1Tm9oSa9/XQQ8qpPd
 09jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmsTtwkw+xJIzlZH2R1cjEi6KFMHHFIUkyNWo0WY0+tJfM/O2+BeCsd4kDymx5lK1KOEmLJBvztfjPqSfIlr96Tvy1f8M=
X-Gm-Message-State: AOJu0YxxKFabBfP2ND5EnoBYhOMXaf6eraDcfRVuQBsd48EeJ9CicnQF
 ZQq828N7YY3fnomNd9rQw005xTAefE28h/nDNt3zfoPOmy6BtUkHOFmEoC6aXBc=
X-Received: by 2002:a17:902:7406:b0:1d8:ed67:c360 with SMTP id
 g6-20020a170902740600b001d8ed67c360mr5378051pll.65.1707336242093; 
 Wed, 07 Feb 2024 12:04:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVvG2sxrEFk4s2plYd2i4SEUnAZieGcyi8AKybQxlwUeo7THpbF09KuEUacakoE1q7A8/CNHE/EFOMXG0vpvD1syfu7IcPPTVZotyKCKugI0Vi3znE7UlONSQtoX0M=
Received: from ?IPv6:2804:7f0:b402:df90:2add:f1b6:5717:16e1?
 ([2804:7f0:b402:df90:2add:f1b6:5717:16e1])
 by smtp.gmail.com with ESMTPSA id
 jz4-20020a170903430400b001d8fe6cd0f0sm1844373plb.150.2024.02.07.12.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 12:04:01 -0800 (PST)
Subject: Re: [PATCH v3 1/6] linux-user/aarch64: Choose SYNC as the preferred
 MTE mode
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org
References: <20240207025210.8837-1-richard.henderson@linaro.org>
 <20240207025210.8837-2-richard.henderson@linaro.org>
From: Gustavo Romero <gustavo.romero@linaro.org>
Message-ID: <2ba0228b-fec3-0710-11a1-18825bc1476d@linaro.org>
Date: Wed, 7 Feb 2024 17:03:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20240207025210.8837-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.632,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: W/72wgFkFM1z


On 2/6/24 11:52 PM, Richard Henderson wrote:
> The API does not generate an error for setting ASYNC | SYNC; that merely
> constrains the selection vs the per-cpu default.  For qemu linux-user,
> choose SYNC as the default.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/aarch64/target_prctl.h | 29 +++++++++++++++++------------
>   1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
> index 5067e7d731..aa8e203c15 100644
> --- a/linux-user/aarch64/target_prctl.h
> +++ b/linux-user/aarch64/target_prctl.h
> @@ -173,21 +173,26 @@ static abi_long do_prctl_set_tagged_addr_ctrl(CPUArchState *env, abi_long arg2)
>       env->tagged_addr_enable = arg2 & PR_TAGGED_ADDR_ENABLE;
>   
>       if (cpu_isar_feature(aa64_mte, cpu)) {
> -        switch (arg2 & PR_MTE_TCF_MASK) {
> -        case PR_MTE_TCF_NONE:
> -        case PR_MTE_TCF_SYNC:
> -        case PR_MTE_TCF_ASYNC:
> -            break;
> -        default:
> -            return -EINVAL;
> -        }
> -
>           /*
>            * Write PR_MTE_TCF to SCTLR_EL1[TCF0].
> -         * Note that the syscall values are consistent with hw.
> +         *
> +         * The kernel has a per-cpu configuration for the sysadmin,
> +         * /sys/devices/system/cpu/cpu<N>/mte_tcf_preferred,
> +         * which qemu does not implement.
> +         *
> +         * Because there is no performance difference between the modes, and
> +         * because SYNC is most useful for debugging MTE errors, choose SYNC
> +         * as the preferred mode.  With this preference, and the way the API
> +         * uses only two bits, there is no way for the program to select
> +         * ASYMM mode.
>            */
> -        env->cp15.sctlr_el[1] =
> -            deposit64(env->cp15.sctlr_el[1], 38, 2, arg2 >> PR_MTE_TCF_SHIFT);
> +        unsigned tcf = 0;
> +        if (arg2 & PR_MTE_TCF_SYNC) {
> +            tcf = 1;
> +        } else if (arg2 & PR_MTE_TCF_ASYNC) {
> +            tcf = 2;
> +        }
> +        env->cp15.sctlr_el[1] = deposit64(env->cp15.sctlr_el[1], 38, 2, tcf);
>   
>           /*
>            * Write PR_MTE_TAG to GCR_EL1[Exclude].
> 

ok, so no ASYMM in QEMU user-mode, plus if both SYNC and ASYNC flags are
specified by the user SYNC is selected. Contrary to what happens by default
on Linux, because of the mte_tcf_preferred value, which is ASYNC, and the
final value selected is define by:

resolved_mte_tcf = (mte_ctrl & pref) ? pref : mte_ctrl; [0]

where pref is mte_tcf_preferred (CPU, the value set in sys /mte_tcf_preferred)
and mte_ctr comes from the process, i.e. is the value specified by the user in
the flags -- hence the default on Linux if both flags are specified is ASYNC,
not SYNC.

(just some notes for the records).

Thanks.


[0] https://github.com/torvalds/linux/blob/master/arch/arm64/kernel/mte.c#L180-L186
