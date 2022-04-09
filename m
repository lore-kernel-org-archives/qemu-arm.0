Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp596650lfq;
        Sat, 9 Apr 2022 11:24:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqM6ObzVXVhMwTbr8w4/1SeourqDb/FEcU5zdrHWQaUeqH7YX9Mjt3Vnyv4nDO28Ajyuqi
X-Received: by 2002:a05:622a:286:b0:2e2:2b3a:3a07 with SMTP id z6-20020a05622a028600b002e22b3a3a07mr20415216qtw.411.1649528639850;
        Sat, 09 Apr 2022 11:23:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649528639; cv=none;
        d=google.com; s=arc-20160816;
        b=a9sM46I2dA9zJVL2TJh5kLZiFytEX753Q1Z0kYWO3wG4dPVAglNKUzjI2VU/bTEIk5
         NmdW+Z2huOsjSKuyclBlx/TX5ezeTzSqcwoNPKEws0szYzYkuVDcxvRUinNRqQc/2W2H
         DSJ7msqEXEf7wczYBp11iOBsVoneh5qYZX0Dw4LPhIRDccMOi8WAkM7LsbN3GYav133e
         tOBZ2Bpypfh2SaEZIpLEpyqNbGS8QZPZNubqPMdeSyvv3m8tcfoktqd+G8anw9tu20dS
         BJHVn6vc0AYLpNPiFxLUaW4U796tSsYp3+miHMqHp8Zs1ypGN2vqr2K5Q3m8dLF6ECr5
         uT6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=x6v3sg1pLlMaqz708Us4VjAbMk8mldITPBsiqa640Mo=;
        b=chX2OPI6nB7AQ4LBDueTKw1seHsmUC9r1GuREhqZp4xYkHh2zR6nAbSt9BrQMngfyG
         4a3qv1VWo2ZTjwHv6IQfkFr2FGG3iieIHd9JgAqrh9BKKHVY25VKxHw4DmME8ZFJUd4W
         161aFne0qD6sPXpt9S07fUA2jRuR1ERbpkHtgUUhJzP8+Qw6dnYxmZKafq+jtgaZIMsQ
         Y35Yj896HzSGvbs6NxaNXLNjFQ/kRu9TKyso3pxXAffkfRvqk7QTiXhWTuQEZYTy5MZ2
         hFLVODJq7/h7L/CK8qW9btFcSmTFaDd8qXkBjA9CK2N7/nn4A9SwY/p+S/BDbbAjbK2a
         ZX5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YB1+zcAg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw7-20020a0562140f0700b00443e18dd849si2471201qvb.251.2022.04.09.11.23.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 11:23:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YB1+zcAg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndFkd-0004Qd-BS
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 14:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFk6-0004P6-By
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 14:23:26 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:50853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFk4-0000xa-Vp
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 14:23:26 -0400
Received: by mail-pj1-x102d.google.com with SMTP id u14so11522572pjj.0
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 11:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=x6v3sg1pLlMaqz708Us4VjAbMk8mldITPBsiqa640Mo=;
 b=YB1+zcAgeLZvlSrZj4VaPKb+E1B71f8zToVdfuVFkyp/6y34WiV1+oz+fHPyMOKXUF
 lkdajtjMb6/eF8GwENHeTyXfW0GEcg+X0OoawxW1WnRWVvZDmpygCrtf26Cj29guSyXc
 9axTG7xKsS7iz3U3B2hjJeunp4SeE0kQQf1WC6c/fAawKkhkVntUPefsdFoWvlDkCVki
 89HOYePgM2V9MhB2G+5bjW3Dc8RbQpAjwHxaOA7LcSUyLAee6iw+HN+6gFsbtjMFB71f
 Ng5WmDl43jYThKmg/n5SOIiveUF88GVlxi6+ZAC4tGJfisn/HQg0DOdjOE10oge7ut2f
 1IXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x6v3sg1pLlMaqz708Us4VjAbMk8mldITPBsiqa640Mo=;
 b=DQa6I+Q/qg/lnydCnGK9UbOa1DWoXlOPGhWLzMbaFeCvv8y8jHccwJtdPkg9XsEiaw
 yZ1kFwv4bLbwUMqlJf6DjucJBcg0WyjiKhNafEGFSAod5eCE7ZksG5AAxXuj/aqakbAb
 S48q42L1awYIWCEw+ZQ4M4OBBW1pk3+LblNFArzdROXScMTRjjCkCxlG8KWUdo9bd+lq
 rLoqmcWZJGI7StBGREKrtqTkucsiThvhRYKOguaODzq1MUyp55frNr3yxO0/cOPH39zn
 OkzDFKadtBXmryNqbLDNe/CwGS6UhLZhBg4EjYEOw8KdJTOLgxWfeaYSPS5RDOKZ/9Pz
 QmMA==
X-Gm-Message-State: AOAM533bbs/L/Br3I7GYpMXxD9b+WEZ4tkpzkaM6Cj5PQCU86aUdWhQP
 llxCm9HWNPGk5zJln/JDXmBD+w==
X-Received: by 2002:a17:902:c945:b0:154:5215:1da4 with SMTP id
 i5-20020a170902c94500b0015452151da4mr24921020pla.169.1649528603750; 
 Sat, 09 Apr 2022 11:23:23 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a637c18000000b0039cc6a3f73fsm8223214pgc.41.2022.04.09.11.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:23:23 -0700 (PDT)
Message-ID: <b27dbae6-a48d-33c5-2382-c4cdfd8e363e@linaro.org>
Date: Sat, 9 Apr 2022 11:23:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 19/41] hw/intc/arm_gicv3_its: Implement INV for virtual
 interrupts
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rr77pw2p3HGi

On 4/8/22 07:15, Peter Maydell wrote:
> Implement the ITS side of the handling of the INV command for
> virtual interrupts; as usual this calls into a redistributor
> function which we leave as a stub to fill in later.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h   |  9 +++++++++
>   hw/intc/arm_gicv3_its.c    | 16 ++++++++++++++--
>   hw/intc/arm_gicv3_redist.c |  8 ++++++++
>   3 files changed, 31 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
