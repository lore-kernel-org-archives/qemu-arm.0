Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2596698ejh;
        Mon, 5 Sep 2022 14:28:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR56Dtl6cFkk6rSF8VbTyBImy7UrIP4eD0xgy0opH4J526YPgt7TG10JPRLVtv6JhPkZpjvi
X-Received: by 2002:a05:620a:278d:b0:6bb:1435:c0bd with SMTP id g13-20020a05620a278d00b006bb1435c0bdmr33928017qkp.291.1662413320050;
        Mon, 05 Sep 2022 14:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662413320; cv=none;
        d=google.com; s=arc-20160816;
        b=rcNYECzhtSU9ZQPeaQlAoKstxULc6STOoR7L8Evwj7cEL9ipMXLwvhc63QemFY91fX
         bmP1RHQRc+fGchDF/Nw9Rkr6HSqGhPc8CNtm44+r6KYr+HCTmbS01UeVLqwPMWxe1Xos
         yXfUWls46v0xpvUiUHZjDwtP2YHuRV2Ymq4ThODLQwBdf7EwUzhqeXqQd5XPmPKfNqA7
         00bIvDPCNRGFfcuKt6pGgL2pjOpFLfoCaZsU505DhUa9os7kaXpnjsaF/aS4n07ZVo+m
         AwgzQsMqtMIDRsOs9MBRnzrOK2BCU4yFftMK1prYRk1n4bz+rMN3GpU4xQ9LC1wLybZU
         qOkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yxHBD12f3GtFHZRjo8/0W4JjePn+0NrFYdK4NL0M0VA=;
        b=Xhr423p8+kcczNS46RyHr/aTWlcrvXuReQhFXwVeqhPjrcKfMEX8ey7fOASmH9bt3R
         cTvc/pl7SG9V7uLbHTXTIDTjguQhO7LxY2PylQaEUzAZvhFQUEv/nHLs8abrXu0F7lvh
         pC72KvWGrk42vBuvYWGwhW2KsqWf7fZps84prIETH5HcPYNaLAZNRHuaCTeAfbTCcS26
         vtnfwc11x9EqXTLwTWtxx5wAB3XjXA8M/3Dp/8rae7jZKrQ/AMzT1zsuzjk9CMCt+pJS
         jmFncZxfwnmqGLQHsbkIx54yUVXHRKPESKmrjJ9p94EF/a4Ju4/SvV6wNTxrmKajw5o3
         D6Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Yb5Wap3k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q21-20020ac84115000000b003449cf821d5si6877352qtl.223.2022.09.05.14.28.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Sep 2022 14:28:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Yb5Wap3k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:58702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVJe3-0000EP-K1
	for alex.bennee@linaro.org; Mon, 05 Sep 2022 17:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJde-0000Cm-Ah; Mon, 05 Sep 2022 17:28:14 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:38911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJdc-0005Jo-Jk; Mon, 05 Sep 2022 17:28:14 -0400
Received: by mail-pg1-x534.google.com with SMTP id t70so3108949pgc.5;
 Mon, 05 Sep 2022 14:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=yxHBD12f3GtFHZRjo8/0W4JjePn+0NrFYdK4NL0M0VA=;
 b=Yb5Wap3kk2hRzpDpfJHiRyLs9AWsLByBI7fQuEmG2eKXL8okbScJ35rRLPrUNpbzFt
 nzZRv+7oBWHQb0S6WaorOPaMGVUIblcQHHk4/HyGPN6lfzdFQC3ZbUPZd40fPy16J2tH
 nPCnlSpHP7mkUwwmCHo7tQrA0SrLo1jXK2Nx3QOvqqU8Ow4uXI8V2FbojaG7DdVIX4M8
 wnmVdaK7ffGeWSAUEAMuEM376Z8JslYYAdTNqn9rk78bE+LbRy9zz/mOqX7l606LGI+x
 h6Yz897520uqzwEjUqmf2NqV5G/tRHau5xd+nmwBEasdSfzJjHytiM/xHola3XdtvMAC
 8Aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=yxHBD12f3GtFHZRjo8/0W4JjePn+0NrFYdK4NL0M0VA=;
 b=U3rnIq+q1LOEgYdy9oaJKN60aZ7Z9UE2mKxCoDxoxf0bwnZ7yzGtKtBdCiKlT6YrqK
 GaU9pljW29nHMKgRpcrwvMqtqq/Vd60InIvRidyHRbtKz0zdKuwzBTBs2YZbJEnLbUO+
 Ws5y41Et2u3ykP22ydgoOQmddPu5KPyKlky3R7YX44ubK4RZbDCcyVVw/h4lKTYPDW7N
 pY3gFjQFmhk0BNyXAwFzFFDg4yin+5et5t3MfOaDxE4eUCvSVULtpyeyxxHGx4Y8IuKC
 3eAZQpNIrTwy9IIY9nqXh1IltBN8ab8b0dXt9MfH/ICjjpH4hB0k9vPJIG59y4LMQZ1b
 zGlA==
X-Gm-Message-State: ACgBeo03bLYWvNbe8O/lghKgFV4iQY+O9ZX/cKI5QD+KxhC7j59fPEW4
 qRUbj/YVvNfokLewu8K8/v8=
X-Received: by 2002:a05:6a00:9a5:b0:538:73c:bf8f with SMTP id
 u37-20020a056a0009a500b00538073cbf8fmr44638725pfg.9.1662413290859; 
 Mon, 05 Sep 2022 14:28:10 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a625107000000b0053ab9c189e2sm8295018pfb.2.2022.09.05.14.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 14:28:10 -0700 (PDT)
Message-ID: <80ce327e-4381-743d-fd63-3b04006e4228@amsat.org>
Date: Mon, 5 Sep 2022 23:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 6/6] include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pbonzini@redhat.com
References: <20220905202259.189852-1-richard.henderson@linaro.org>
 <20220905202259.189852-7-richard.henderson@linaro.org>
In-Reply-To: <20220905202259.189852-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.716,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-arm@nongnu.org>
X-TUID: iaPgbHCuyvAm

On 5/9/22 22:22, Richard Henderson wrote:
> Allow the target to cache items from the guest page tables.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/cpu-defs.h | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
> index 5e12cc1854..67239b4e5e 100644
> --- a/include/exec/cpu-defs.h
> +++ b/include/exec/cpu-defs.h
> @@ -163,6 +163,15 @@ typedef struct CPUTLBEntryFull {
>   
>       /* @lg_page_size contains the log2 of the page size. */
>       uint8_t lg_page_size;
> +
> +    /*
> +     * Allow target-specific additions to this structure.
> +     * This may be used to cache items from the guest cpu
> +     * page tables for later use by the implementation.
> +     */
> +#ifdef TARGET_PAGE_ENTRY_EXTRA
> +    TARGET_PAGE_ENTRY_EXTRA
> +#endif
>   } CPUTLBEntryFull;

Alternatively declare a per-target structure in cpu-param.h
and here:

typedef struct CPUTLBEntryTarget CPUTLBEntryTarget;

#ifndef TARGET_HAS_PAGE_ENTRY_EXTRA_STRUCT
struct CPUTLBEntryTarget { }
#endif


typedef struct CPUTLBEntryFull {
   ...
   CPUTLBEntryTarget target_extra;
} CPUTLBEntryFull;

Meanwhile:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
