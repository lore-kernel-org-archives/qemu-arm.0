Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp815255lfg;
        Wed, 10 Mar 2021 11:38:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyx/GEbDedX3USVuWZBO2xPQmmjLi4V7ZoM5JEjdYwl/r2r/O0aidaeiFkNUde/8ZRFLVII
X-Received: by 2002:ac8:4412:: with SMTP id j18mr2239617qtn.387.1615405108973;
        Wed, 10 Mar 2021 11:38:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615405108; cv=none;
        d=google.com; s=arc-20160816;
        b=Yf55i3rh7YNUT2lnxk9eihTxb6CIw5W+p8vjq+cWuTU9RtgaBWSOW3tVn/7iybieeP
         7fF9p596rsCX3At9W6BXlUliei1KuhIcg/3WEDTAVB2t8PzmsFII23UeqpIW3MKukFvH
         L51SDhDMcckqWGaG7dWzlSiz0gVKHhXuRLFg6kF0MvUI8AtH1kRUWekyx7ijInB1MegJ
         st9syempV9m0ufiEka0oi7+m3OHdrBzuWDurIzPXrR9Sl05bJl0YvcW6La2wfvpjF6Ih
         gLYJuPU/A6I9Irm7xiTYGBU+sUIxAR9vLPZMiP5iYAlQ4FWMbmVqC8te6ylL3VuqAuWL
         4J+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JtZKRh2UsOElWIAk1qHHSMWl64Z8ka/eIN54BtnGXnI=;
        b=VAEBwittVs8iyigqcgbPliUXJDQ0KeAOZSgW89Y5yzzUTt5qPNmf7q8vNpYQeE4CXq
         fHqtdLLDKY/76kV2Wj2Tdhyokyht9af7glCPq+E8FOpCLg/qg+hf1Bu0GsS3XVVxyBe3
         P+PXy1YGnXt5+g47wvEYaenHHodEJ+Y2GZNch3ZNM3+Qj3MyPYQul0Pk8TxnMmUYV8oT
         mkrUet/j/h41iT2OqoUZpbewMDNyzKjgt/OCxV95VecNmdyYYxK+V6aRQn5B8sjYxJwu
         /z6Efn2eII7/QH9kgfG3xK7g0RcNWJbRND/9z8PabgagShb3tdm5+rt0yI/rm9DyqDQB
         B8tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p142LVxS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l195si307006qke.130.2021.03.10.11.38.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 11:38:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p142LVxS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lK4f6-0001Vh-7N
	for alex.bennee@linaro.org; Wed, 10 Mar 2021 14:38:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK4bP-0006mP-Jc
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:34:39 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:33349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK4bN-0007IP-1W
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:34:39 -0500
Received: by mail-oi1-x230.google.com with SMTP id d16so11101958oic.0
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 11:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JtZKRh2UsOElWIAk1qHHSMWl64Z8ka/eIN54BtnGXnI=;
 b=p142LVxS6yNZb0pJnMV0I+FibC+wZG8HLpT2liK6osEDgrbEateRUITad0ryDaKcHu
 WdvZUz5g654JljoHWGMfD8br4Ebqr7mdH6cQnJqT+XFt8YaMQ1J5VEAxHuFrHuniBDks
 7mfRUViuGaH01uuQ5aINv6RZ3kB9sZ1BeirzfLoUzMsFDbys5OSgC3jUW+kfcqEtgoyh
 Bu6d7CV9bzKqVpLKHxS4yR+G2gljWC+P6ark9Q+CLU+ZBXf0mGOEVrWnZkm5k5cQSwAU
 XcBVMJ8gJCJGUpqIqK6Ba7q6kk8ZeY1A/6QYDHptwnpvAlKFWwikt7HFezLrbZikgU05
 YPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JtZKRh2UsOElWIAk1qHHSMWl64Z8ka/eIN54BtnGXnI=;
 b=W9R8aCk4zG8eCMgFgFjNhjJQU4nnIXYSarR9mbPs9gl6CBO1lXbliwA3eFLoS7XqGA
 xu6JMjp/5b/dKX1PVCmpVFlwahEhd84QoJkEtAzb8eFpHfGbZT7MUvVSCcLpomSODhiY
 AuqCq6FGsxSggfpLnX6rvK1tW7ls3K1dhBNch5LFImJeHD75dpWUoI3bdx/lpqCUlaAF
 HD8cyKe0CYYoz+V4PXHNc+6juc/lRRvV8gt1jyiAksOrm1wbeog7V3iJ26mvmvRvCqBN
 OGSbl7aS0PBZ5ZU7UKav8vvrnz80zRJc5Q+Jgf4YZKvA6SVu4zWkzUbWd8X8ijPhYBX7
 o1TQ==
X-Gm-Message-State: AOAM533JQ2i20HtqZaxavTdzCISNa/X5SbEOj0cBFs4JfTGvvYu+HaCg
 2L5uwApT4iReWSwG6TWU3LopZ8XyrGQsD4fq
X-Received: by 2002:aca:1b16:: with SMTP id b22mr2049301oib.153.1615404875903; 
 Wed, 10 Mar 2021 11:34:35 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id r126sm80714oih.12.2021.03.10.11.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 11:34:35 -0800 (PST)
Subject: Re: [PATCH v3 3/3] target/arm: set ID_AA64ISAR0.TLB to 2 for max
 AARCH64 CPU type
To: Rebecca Cran <rebecca@nuviainc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20210310002917.8876-1-rebecca@nuviainc.com>
 <20210310002917.8876-4-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <98ff038f-75f5-3488-4562-59ddaa39220c@linaro.org>
Date: Wed, 10 Mar 2021 13:34:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210310002917.8876-4-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eTtxCi2N+89d

On 3/9/21 6:29 PM, Rebecca Cran wrote:
> @@ -651,6 +651,7 @@ static void aarch64_max_initfn(Object *obj)
>           t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
>           t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
>           t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
> +        t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2);

Just add /* FEAT_TLBIRANGE */ on the line here.
Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
