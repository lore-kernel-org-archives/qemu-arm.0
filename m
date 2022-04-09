Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp598488lfq;
        Sat, 9 Apr 2022 11:28:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynSYCFn5ISI821uuAxs6DMcXRJNWlESZrPJTXhRfiT75qzE1xVW9S48wjFGdP7T3oFJ9vS
X-Received: by 2002:a05:620a:1906:b0:67b:3ac1:8f72 with SMTP id bj6-20020a05620a190600b0067b3ac18f72mr16658696qkb.478.1649528917470;
        Sat, 09 Apr 2022 11:28:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649528917; cv=none;
        d=google.com; s=arc-20160816;
        b=b36ZtxDJZVO0TodaK2271/F5zinUBOGyjM5UBAuQCedrfd3TsFc8dVinLX9/CbQ7rn
         /ERPAp3NCVGy4n/YTvxvYUFoB/88WJBk91oq5FB1wJudPA6MB73Env5Dftf+5/Nb4xbH
         +dDlpK15DNzLcjI5wcMQsQvgoA4spLKs3PSNFbgNRVm8CXPERCCQwXAUQn9+YCZEdpwa
         P1K4tu7Ns3YFl1vG1Esi8Lx42fzTdbEYguQ92Vq0ELV2eUBVAtzD1wrR/fXWQyI8UCcL
         wHz9+JPCHa2brR4x9LNRNCVdb5hHSvQCqfZwY1J/kAJqrimhc9Exz0wvpzFmAaRd4x48
         ADrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=wUlkeDhv7NXit+7GP4IeBt4N9K5HfgvZj8A7hWj5d4E=;
        b=ivFrkSBraUSwuJYutXQL0mBIPFyE1WAxBCkENtalc1URm6SzKQj5Yk0TDu6Ytk369N
         lhferkpr1FyOZu2ySY7lVhP8CichwgpZAwysbfctaHwgsLuGFqMzT+dhaYqqmzkQ74rF
         VjRD/AOIyC3DTHRWvn65a+96fsPm07dUVXWRehYVlk7RT8wwQfhOovs3wNJi1bMeU+9+
         /PC+hkl2ZaBruzSGeqh7LuT0t5LnJPHaKJN+zJNmJpVuHcPdXF+Uh4InL2VnYkpZTQoY
         edCN+eGRzfLvmXXRVr0MJrKrugh0T/OAX3PmfIGO+/ntw0s3B1R0YR/jCcATm9wGwntg
         Mz8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UJgQH3oH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm17-20020a05620a199100b0067e4be23a75si2394002qkb.698.2022.04.09.11.28.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 11:28:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UJgQH3oH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndFp6-0000Qu-UX
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 14:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFoh-0000PQ-4S
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 14:28:12 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:35822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFoS-0001ZB-3A
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 14:27:57 -0400
Received: by mail-pg1-x534.google.com with SMTP id z128so10623329pgz.2
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 11:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wUlkeDhv7NXit+7GP4IeBt4N9K5HfgvZj8A7hWj5d4E=;
 b=UJgQH3oHbpqzFgq8lhQxCxBF2/nS1CmsQsdLB4sMRXb5g7EAsa1Osf78H8DoxZpa3s
 WHVsInvzBXlfiHuDdMXX6k/w708mu9nCjFvf/oeFq9FDrTJy+CffJ42pT8OhYICbIPof
 xiJDDi4EI9SVIVn8EBYZV/lIfaewJkvfVnby4ZVEItnqs151F6R4tQrxzMQMs9/B/BcU
 oYnGx1HUUpqq6xdnrAk6/f+fSKJBuORTZk/cpOmAHH45mFhJ4QMagzRqlvGLKEQ90cfy
 ySZJLGTjeEDz9w1M6VzKayXIupBFvIvR+WCr1wDM+DSx2ogx8Cu8HMDXwjorZ3uhL2JO
 uGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wUlkeDhv7NXit+7GP4IeBt4N9K5HfgvZj8A7hWj5d4E=;
 b=nsn0kHfe3BEXM45LCDe+t9jhN9MZLyH8Oy5eMc7RLmo8RQJVOtbCbPg90Pt/boCUIp
 IRmY26wquo3yJGSEpQgC8EOBNFV/lW3E0MQPTtoIrak3czPTE1iKEOPp/Hr8yfdeEXHJ
 m9amYhRHGw8BnUcnuNURLByPw3aQDeTd6NK9nVb0YO1+LKuBrjpng6y43KHzmPx36x1i
 F/rIttMkMqV721LqEOISq+OalU94JMlYM4VoUujDIQJGK5K963PvDBQIgATCUVEdhP3l
 7yHHkeNBG7B5+2v63W3gLvDHKv0vT5+gz9UJXC6Cbmcl6MEqp1CsJx0yhTImQ3bqvz5V
 HBOg==
X-Gm-Message-State: AOAM530TX7cIL3+ncGBJQT3JiffxGmBpuoU75Acvag4sWCKCbKa8X5/c
 JBOGJU9eHwea+wIiBvgb8bHlSg==
X-Received: by 2002:a65:47c1:0:b0:39c:c448:2712 with SMTP id
 f1-20020a6547c1000000b0039cc4482712mr12270293pgs.6.1649528874262; 
 Sat, 09 Apr 2022 11:27:54 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k14-20020aa7820e000000b004f7134a70cdsm28707191pfi.61.2022.04.09.11.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:27:53 -0700 (PDT)
Message-ID: <2306c281-ac26-683e-e697-e50b1e121b86@linaro.org>
Date: Sat, 9 Apr 2022 11:27:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 20/41] hw/intc/arm_gicv3_its: Implement VMOVI
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
X-TUID: vljM6O8pyb+g

On 4/8/22 07:15, Peter Maydell wrote:
> Implement the GICv4 VMOVI command, which moves the pending state
> of a virtual interrupt from one redistributor to another. As with
> MOVI, we handle the "parse and validate command arguments and
> table lookups" part in the ITS source file, and pass the final
> results to a function in the redistributor which will do the
> actual operation. As with the "make a VLPI pending" change,
> for the moment we leave that redistributor function as a stub,
> to be implemented in a later commit.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h   | 23 +++++++++++
>   hw/intc/arm_gicv3_its.c    | 82 ++++++++++++++++++++++++++++++++++++++
>   hw/intc/arm_gicv3_redist.c | 10 +++++
>   hw/intc/trace-events       |  1 +
>   4 files changed, 116 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
