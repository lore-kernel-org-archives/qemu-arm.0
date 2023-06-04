Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2044111ejb;
        Sat, 3 Jun 2023 18:28:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4J7J3WTb40wYIfFQkmYGSH0aHQY7Pz89YSuMMEZOFKtwzO8xyEHZwplIOeuSbP86iDlTIm
X-Received: by 2002:a05:6214:c4b:b0:625:83ab:8a42 with SMTP id r11-20020a0562140c4b00b0062583ab8a42mr3462515qvj.46.1685842086316;
        Sat, 03 Jun 2023 18:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685842086; cv=none;
        d=google.com; s=arc-20160816;
        b=OQfYhmX/BF1Sl356R0PuSeTV2hyYgj4IlQ3chOhDArtGjJYu+6xnA1J7wE8a9Y1Qbd
         ll0FZwtmARSgzIdlAuYRTDFQ6Cv/xpKcdyrYG0Q/nP/utzcWqml3gDMV2Tnrq5ConSjF
         Vo/GbmkgSMhHsEhiB0uI3mtFeVtlXgHDXLm5txq+A3CwsPmI/Z2m3xOsOaoGZEvHuBYD
         xt6gQyGWBixnaDS2PX2TRQ+wseqosL+13W8hC4e3O7H8PyXDhH+KxCbglBYl7G4f3GAt
         Y3HWS2QDK6ocBK3NKIcFlL92RXXLcY1pWiGZF7B96UZSZD4e7BUFN/UN41ljBNn8gb54
         lZTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=l8/PVqrzt+xSg8MZGMP0A6uTQ13mbx7w79tDibjgQls=;
        b=uAtuDW264NCZsDhwmkxzudcAsfVSdwX9PFUF3eqDd/aRw4a/t/LXQyYO4AL59Q8yPZ
         epFU8udZbapmEITmu1YJmEbswC8UDEm6wIo6suO4RKyU3MOceuxm2HFkq2SK52twcCrp
         bLUsVgBdFXyoLuBpSxUA5xmoSAidrClq88yemXSK64llKuHwHUotosYH6iY1QLHDqy3g
         WyU/xFB3f31ztKxdSpepStue64JqGpjwYGqsJBW3IzuBHdX70xD/GycJy5o8rjsOD2eI
         RS7QfCiUMToNuviWNBLJ89kpkgpigO4EYmoNW0T0BiLqCxDDL6WyyU9OthIwte59HJha
         Mq9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h6KCOAo4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8-20020a0562141bc800b006262396df91si2990451qvc.362.2023.06.03.18.28.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Jun 2023 18:28:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h6KCOAo4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5cXB-0006L0-Pl; Sat, 03 Jun 2023 21:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5cXA-0006KE-8Y
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 21:27:52 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5cX8-0000Nr-Gg
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 21:27:52 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6b1576c2f6eso570574a34.3
 for <qemu-arm@nongnu.org>; Sat, 03 Jun 2023 18:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685842069; x=1688434069;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l8/PVqrzt+xSg8MZGMP0A6uTQ13mbx7w79tDibjgQls=;
 b=h6KCOAo41JH1LkgvEgKP9syVSqorASUD/OqB7Ge9PpTh9YGfc58RG5vtmSLCTc4/eU
 UuDWfde6y1h1v9RzmzGsQfH97tT2faFabofoSVxGHIKPraZmn9HEhpjDTeKpnFAVBR1G
 il/hq/CCXv6eLqng2oLTQ6NqNZi/hW5nHaSclUPTA6sbLB4iF22MFHgg0Y3gptB7s9PQ
 v+O2D6b3Tn+GiDdNeDoW7qk4shAnxpg0DfsD97cBffTYzFOhDdsjqzbuazIFJdxa2ms2
 xeL6M+dZTdigPDNOQIvYgkWr+3bV8vPkOcVAG47BvHwCzQlDWua7l6RyxKdokIUwOQAL
 l3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685842069; x=1688434069;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l8/PVqrzt+xSg8MZGMP0A6uTQ13mbx7w79tDibjgQls=;
 b=NHsAzGhKIVprePLLwYOyqArkDfPjA6rsk3QLFvAyhMD2mVJeCsfi4nAEqX9WfHn8P9
 dgEnuGi2Di18Ve/2wiJAUsqSaeY4pYps66kUV5GGvYOy+rd+wd56PoAhaJoIe9nMiB9z
 n9aFjBj0HOSpKxjZ1Mreg8q4OCuKy7AhOh2VY76HGuHfo/T3egnRoo95uI+KbypSY0AW
 ZYZiSYLEhxV66upg6nhlcvAYcqi9xADAXrII5YeC1SG8d5DbJgfPHTrFiYA6QIfdoG8P
 b/0ps0L7sOppiTSKALwFy+dRBztK5nHD/l2sQMKAa3nm169PeHg579TkiIaou80Oaxxn
 WlhQ==
X-Gm-Message-State: AC+VfDxrhdRpSLmlqgtdZVsIdwfJ//FkIgBb4Md7XR3Jj4n0DEYq46Vw
 XsbAXth5hElHL63fY+V2+4G4Eg==
X-Received: by 2002:a9d:7497:0:b0:6af:a39d:b5ea with SMTP id
 t23-20020a9d7497000000b006afa39db5eamr6703870otk.32.1685842068800; 
 Sat, 03 Jun 2023 18:27:48 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:9a37:84b6:b3f0:f301?
 ([2602:ae:1598:4c01:9a37:84b6:b3f0:f301])
 by smtp.gmail.com with ESMTPSA id
 v19-20020aa78093000000b0064928cb5f03sm2960798pff.69.2023.06.03.18.27.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 18:27:48 -0700 (PDT)
Message-ID: <4bb70c74-e002-a3d7-b2b0-edd57e9238b2@linaro.org>
Date: Sat, 3 Jun 2023 18:27:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 19/20] target/arm: Convert load/store single structure to
 decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
 <20230602155223.2040685-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602155223.2040685-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
X-TUID: NBSF+1IK4KkA

On 6/2/23 08:52, Peter Maydell wrote:
> +# Load/store single structure
> +
> +%ldst_single_selem 13:1 21:1 !function=plus_1
> +# The index is made up from bits Q, S and the size; we may then need to scale
> +# it down by the size.
> +%ldst_single_index q:1 s:1 sz:2
> +%ldst_single_index_scaled q:1 s:1 sz:2 scale:3 !function=uimm_scaled_down
> +%ldst_single_repl_scale 10:2
> +
> +# We don't care about S in the trans functions (the decode folds it into
> +# the calculation of index), but we have to list it here so that we can
> +# handle the S-must-be-0 pattern lines. Similarly we don't care about sz
> +# once it has been used to calculate index.
> +&ldst_single    rm rn rt sz p q s selem index scale repl
> +
> +@ldst_single        . q:1 ...... p:1 . . rm:5 ... . .. rn:5 rt:5 \
> +                    &ldst_single index=%ldst_single_index_scaled \
> +                    selem=%ldst_single_selem repl=0
> +@ldst_single_repl   . q:1 ...... p:1 . . rm:5 ... . sz:2 rn:5 rt:5 \
> +                    &ldst_single index=%ldst_single_index \
> +                    scale=%ldst_single_repl_scale selem=%ldst_single_selem repl=1
> +
> +
> +ST_single       0 . 001101 . 0 . ..... 00 . s:1 sz:2 ..... ..... @ldst_single scale=0
> +ST_single       0 . 001101 . 0 . ..... 01 . s:1 00 ..... ..... @ldst_single scale=1 sz=0
> +ST_single       0 . 001101 . 0 . ..... 01 . s:1 10 ..... ..... @ldst_single scale=1 sz=2
> +ST_single       0 . 001101 . 0 . ..... 10 . s:1 00 ..... ..... @ldst_single scale=2 sz=0
> +ST_single       0 . 001101 . 0 . ..... 10 . 0 01 ..... ..... @ldst_single scale=3 sz=1 s=0

Wow, that's hard to follow.  How about

%ldst_single_selem    13:1 21:1 !function=plus_1
%ldst_single_index_b  30:1 10:3
%ldst_single_index_h  30:1 11:2
%ldst_single_index_s  30:1 12:1

@ldst_single_b     .. ...... p:1 . . rm:5 ...... rn:5 rt:5 \
                    &ldst_single scale=0 selem=%ldst_single_selem \
                    index=%ldst_single_index_b
@ldst_single_h     .. ...... p:1 . . rm:5 ...... rn:5 rt:5 \
                    &ldst_single scale=1 selem=%ldst_single_selem \
                    index=%ldst_single_index_h
@ldst_single_s     .. ...... p:1 .. rm:5 ...... rn:5 rt:5 \
                    &ldst_single scale=2 selem=%ldst_single_selem \
                    index=%ldst_single_index_s
@ldst_single_d     . index:1 ...... p:1 .. rm:5 ...... rn:5 rt:5 \
                    &ldst_single scale=3 selem=%ldst_single_selem

ST_single          0 . 001101 . 0 . ..... 00 . ... ..... .....  @ldst_single_b
ST_single          0 . 001101 . 0 . ..... 01 . ..0 ..... .....  @ldst_single_h
ST_single          0 . 001101 . 0 . ..... 10 . .00 ..... .....  @ldst_single_s
ST_single          0 . 001101 . 0 . ..... 10 . 001 ..... .....  @ldst_single_d

LD_single          0 . 001101 . 1 . ..... 00 . ... ..... .....  @ldst_single_b
LD_single          0 . 001101 . 1 . ..... 01 . ..0 ..... .....  @ldst_single_h
LD_single          0 . 001101 . 1 . ..... 10 . .00 ..... .....  @ldst_single_s
LD_single          0 . 001101 . 1 . ..... 10 . 001 ..... .....  @ldst_single_d

# Different unnamed argument set -- there is no index for repl.
LD_single_repl     0 . 001101 p:1 1 . rm:5 11 00 scale:2 rn:5 rt:5 \
                    selem=%ldst_single_selem

This is similar to how I handle similar situations in SVE, e.g. PSEL.


r~
