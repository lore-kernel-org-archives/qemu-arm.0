Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1994914ejb;
        Sat, 3 Jun 2023 15:33:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7hgiUEcqneaFHcAVJzAro4QRXcZ9OWo3s/eTJTCd7Aow8uUej40iLERJYEj8+gB1EkHzQQ
X-Received: by 2002:a05:6214:1d21:b0:61b:6a44:5f03 with SMTP id f1-20020a0562141d2100b0061b6a445f03mr3406414qvd.33.1685831585680;
        Sat, 03 Jun 2023 15:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685831585; cv=none;
        d=google.com; s=arc-20160816;
        b=mOkciq6JOpCE8Vh8Ztb9OFosp7Ql7Q6QU3itPdnZAUD7bsY7iZD2eT8i60bi5kHVYC
         ZMD4jgNb+bAaMgWm31V7Nj4Q1f/bRKdVoju7NEYGs5TSBoOJi0DkNQsgLp1VrooaEIq6
         KI8vT0ALluaI/JAvIfcDhY6G25mg7GoXIVrBr+/7f0Zq8iRmxoBZCsdqOo/JHVfAC5gF
         JerkQkycG6jTencw4xTU5C5TGWLCcP9tt4twlCE2ZcQQEqZiqi7R/8nVxWk97PjLImUs
         ESZQeAwas1Hx85EO0slpYGLqkuR36W5ewIuxejD4vqI34lB9UmXqeci/NN1NPVMoNhHS
         mJ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=BBu7fFWdcmFaKomwmhRM7bSas7K76l10adFKiwZSZn0=;
        b=n9jFTmhiExfkCUI676maP6jntGItQwWS10LutEFmR93VBN0KQtUhPo6vnQ8s8OWiuv
         PHk3CC3tBwKm3rhPTocO9nkSAsnmb3ta0KK1bUePrIfumFM4QZOirq21fajdfvAf5Q1o
         Xk0zPkEQsZGdQby76GaVnDPmy0+D7Z4whHO8lc/VEkTK+l12NLI7ERg5c8RUXlg/9Pnx
         Gg6N41iqdHzMv3A+AeX9HQ0/HK/9x9GekCOJTGt6CQqi/lJFdBEmBg6R8rqw4Ou1PGib
         PY04r6TdSvb5Dia+eS4pjJYWWpUPCZGJzB3Fkn3AiilsP8UdYwgM3yfxbe3MPDUbo+zt
         NUGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jigYizfa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13-20020a056214224d00b006276cb7e9d4si2932066qvc.62.2023.06.03.15.33.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Jun 2023 15:33:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jigYizfa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5Znj-0000ce-8m; Sat, 03 Jun 2023 18:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5Zni-0000cJ-AA
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 18:32:46 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5Zng-0006j9-PJ
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 18:32:46 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-19f6f8c840bso3274432fac.3
 for <qemu-arm@nongnu.org>; Sat, 03 Jun 2023 15:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685831563; x=1688423563;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BBu7fFWdcmFaKomwmhRM7bSas7K76l10adFKiwZSZn0=;
 b=jigYizfaVLLbwoSVKJ0TIz5vMrq7+HEgXFcJXcBPgGYLMumbYiFgbztEwffu78WTLu
 MaaECSQ7B87WQx2dZvsoghYXWS4fyeAN/REggfGjJnq7474mrxZLpaw2iCRi+yAme3Nr
 zXZ63ygdMBH0jJRPbCFMDZ/a0VuXlBliDUbdSvsONoty56gEUolLSxAxb/eliRJppE6R
 0LMyKsq9TR1Iqwu7e9Yk+wHxVCskDaOeZK72YcEeJHWMxIxD5LgEkQgezDIolUFINs+S
 MEu7x6OKlyGVN/nmtVr31HtxF92wgX0g27Z1XeQuXI3iVDbsqlXgRUHZtAsUvJ8RvlF4
 9pJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685831563; x=1688423563;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BBu7fFWdcmFaKomwmhRM7bSas7K76l10adFKiwZSZn0=;
 b=QeSqZbV7gL17p8D/hGC6SLJLyRxTFHSx2nMpY/ZK3JLG9Ld2hBTbjgJcMKVNNpidT0
 6pwvQTlP38z6jEbWH+05eIf2v5wikCT26h5lCRiQda+EUff/TVsZp6W+pHbYibNm/vHW
 Gns1bXWyzanz+VffsqZ+s2dIo5IupJ9QV4XtSqpVmVaSdWCDKVD/PRTBPMA0IEesovg0
 El6GyJbx6urgPsZ5U4QIaPWAPO/A/I3cQPWDAyztbcFUO0MnbykWlWj8IGdKuzgHVHvV
 2ciLw/RQwm7lGtfSlkzIVnY00v+KNEQQIjGs1TllWtBZ3dL1CGNLLXjI2jusASehYfFT
 0JZA==
X-Gm-Message-State: AC+VfDzWjyL5nFso4SnKIt8gOvmRcj3yTNnFJ5DrtJTtgCnOzkoMOuZW
 BRLXMuXM5VtosCLkvvd+T4WuKw==
X-Received: by 2002:a05:6870:37c5:b0:19e:c567:6020 with SMTP id
 p5-20020a05687037c500b0019ec5676020mr5699991oai.38.1685831563542; 
 Sat, 03 Jun 2023 15:32:43 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:9a37:84b6:b3f0:f301?
 ([2602:ae:1598:4c01:9a37:84b6:b3f0:f301])
 by smtp.gmail.com with ESMTPSA id
 6-20020a170902c24600b001a0567811fbsm3660706plg.127.2023.06.03.15.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 15:32:43 -0700 (PDT)
Message-ID: <37e65b77-8ad9-c6fb-d45c-714af02d7435@linaro.org>
Date: Sat, 3 Jun 2023 15:32:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 08/20] target/arm: Convert load/store exclusive and
 ordered to decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
 <20230602155223.2040685-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602155223.2040685-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: p8cIyr3ssj6v

On 6/2/23 08:52, Peter Maydell wrote:
> Convert the instructions in the load/store exclusive (STXR,
> STLXR, LDXR, LDAXR) and load/store ordered (STLR, STLLR,
> LDAR, LDLAR) to decodetree.
> 
> Note that for STLR, STLLR, LDAR, LDLAR this fixes an under-decoding
> in the legacy decoder where we were not checking that the RES1 bits
> in the Rs and Rt2 fields were set.
> 
> The new function ldst_iss_sf() is equivalent to the existing
> disas_ldst_compute_iss_sf(), but it takes the pre-decoded 'ext' field
> rather than taking an undecoded two-bit opc field and extracting
> 'ext' from it. Once all the loads and stores have been converted
> to decodetree disas_ldst_compute_iss_sf() will be unused and
> can be deleted.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  11 +++
>   target/arm/tcg/translate-a64.c | 164 ++++++++++++++++++++-------------
>   2 files changed, 110 insertions(+), 65 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
