Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp5274264ejq;
        Sat, 13 May 2023 00:14:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4aYo4e16VbsrErxTAJz8HuZvLm4ToUJVvlFhRfD/lB9rWHEIWEM9gfCUuCaeNgA9Mm72rF
X-Received: by 2002:a05:6214:1246:b0:616:5755:ca68 with SMTP id r6-20020a056214124600b006165755ca68mr52312675qvv.25.1683962046486;
        Sat, 13 May 2023 00:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683962046; cv=none;
        d=google.com; s=arc-20160816;
        b=lj6AO4yvaEmZip2krYwGoc6Z2tnhYYwfZBLWZpuEpqcQyMiiU29LUR5iBnwJC1ONJJ
         hXagjsPkAGkCjPThwYnpUuX3S0WBMRcK+9pS+5k/uKDqsJpdLEqAP5bIhMhcjVw3LjHZ
         Fv/rirv+8v9jB/xH1ZnrekCs895NXodP83BuBn3XTujOmJIc8yntBhMAfO8NkRaKAUxS
         qfGTS5GwXi3D71PJovb2BrzjBkZSXevaGw7RE5HiHQ8qSTT7JhxIUWHVa62lTzR7UIJf
         Fh54jtlaLoP+S+UfFgs2kkLOpJrw0hvutQdmfAMJ9usysp1+LvDj79vQwfXTaHTWdeWk
         YbWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Kft68YGtsW7enD6vkFYY61UTThQw1gZx1T+MVAdMcQA=;
        b=wGrKKU/+z7bmcFpbKPrRAqqGVpK/PFwpms3W2wyNx3FyeolyzRUGcoOBtMghG9bw1S
         7/3mflTcjIiOeW3FJtXszXyqGrvDy3BrYlisYOp5N3y2w2XyNXKfw4PMZMWzi5FQk0ZR
         /PfZgCZONJZBww+LrCtbjK2O3p5CHXhmbhEKnCdlZczKCo+KHUwdMYSHoFVVOLyYMAM9
         0pCKqPswsS0qUW7tnh14RN2qwQmHFwvsMpvhL3mqc5RFCJBhvVtNZTIDdjMOGzDgFCK1
         EynmvCLACRvvlmhBztZMoDJIjYTkUR85pZHYPL2YiVKsRVYB+lItlMptaoVfZiNAcuDw
         QiCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L77nMj0W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17-20020a05620a075100b007577c68be3dsi7754352qki.246.2023.05.13.00.14.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 May 2023 00:14:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L77nMj0W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxjRq-0004A9-O9; Sat, 13 May 2023 03:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjRq-00049x-01
 for qemu-devel@nongnu.org; Sat, 13 May 2023 03:13:46 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjRo-0002xB-JG
 for qemu-devel@nongnu.org; Sat, 13 May 2023 03:13:45 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-305f0491e62so10350237f8f.3
 for <qemu-devel@nongnu.org>; Sat, 13 May 2023 00:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683962023; x=1686554023;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kft68YGtsW7enD6vkFYY61UTThQw1gZx1T+MVAdMcQA=;
 b=L77nMj0WYx8MXs1Vv+skLNn1vdbB48dxgtqqqb7raw25PPET6vv1pr/80SKC1WFR6N
 gTywTxxcP9PFUULYeTCcFTDVvC+s0cEQAVKwnb7OjFp7UPab0MKbnuyf4Or2pTxHkTZi
 B6XZ9mV0wMqFMZLtwMaf34sHxtQpQFd55zXr5dPlltrjKskaKycbR4XHGPjnwwg+sxGb
 hSAJS9TvFfkQvy6paywJK3QaZO5AiJ7I3hWi6X/vIyYf+DvjQBA+S/3KopAT1KZgakkJ
 CpKobgFl96a7RBzp9cOi+SvmNm6xGDy83CZh8BX/AktQ+5GKrJih8I6uEN0pk+6p8dyb
 11kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683962023; x=1686554023;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kft68YGtsW7enD6vkFYY61UTThQw1gZx1T+MVAdMcQA=;
 b=DEQXlZkrtk+1uiJqxHN3d6Q8C2Y3GuAcHmUhaUtUVYXbbUiffycQ0eYDKK8CLSdRYz
 WK6vITeovvNTR9VHBt66+oMgByd83Yo5wvl9eSVCW3h1U/T7ulEsxbLxCMOm5su/b/43
 5NgA/aR+H0+KyKvOdUQaQA9AsaSReEwmaOUaiyBjdxhZ8nTpOILQMSxDnCjBeGqRyVjk
 nc5U8iPtjZBhngL0fvcLcWKNdRdC/aVN/LegaEd1GgzRJisNI5sw1TK8C/jruYqRDtRy
 OTL8x1dxITEk5CkRzkxFQ2n3wOsTNYOR+bwyxFWpXLbWWxvF50gfXcZlir/Rs9l2qenO
 VXaQ==
X-Gm-Message-State: AC+VfDyII49dKQgKMoF6w61F8bKm70c5mPQLjZojUG7z2TPGeSyWq4Oy
 UDjPgsWhYeyWoS5dM30JopiB9w==
X-Received: by 2002:a5d:62c1:0:b0:307:8548:f793 with SMTP id
 o1-20020a5d62c1000000b003078548f793mr19395468wrv.53.1683962023033; 
 Sat, 13 May 2023 00:13:43 -0700 (PDT)
Received: from [192.168.190.227] ([83.98.42.3])
 by smtp.gmail.com with ESMTPSA id
 q10-20020adfcd8a000000b00307c8d6b4a0sm6889577wrj.26.2023.05.13.00.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 00:13:42 -0700 (PDT)
Message-ID: <7f6fc514-95c8-9a98-2565-c3c90d9a0274@linaro.org>
Date: Sat, 13 May 2023 08:13:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 03/20] target/arm: Pull calls to disas_sve() and
 disas_sme() out of legacy decoder
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
 <20230512144106.3608981-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512144106.3608981-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
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
X-TUID: c3pWrKTxw8kZ

On 5/12/23 15:40, Peter Maydell wrote:
> +        !disas_sme(s,insn) &&

Space after comma.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
