Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp408384ejm;
        Wed, 26 Apr 2023 06:18:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350aUu3ogYSrXQsdSsZ6FpD85v1ngizdVJ7y+N+dYrI1EBlsrSAkE4aIW6fL6ytHCutHWRogM
X-Received: by 2002:a05:6214:5184:b0:5ef:8c79:fe88 with SMTP id kl4-20020a056214518400b005ef8c79fe88mr32562476qvb.2.1682515109508;
        Wed, 26 Apr 2023 06:18:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682515109; cv=none;
        d=google.com; s=arc-20160816;
        b=wLbHTf8nUBaGZSsw56bvkQJ9YOTteIFww8RVoEkqT0wAcOhXNo56w2B0ZSNZsDFYjM
         5RxRj9NOHkCe/5ZZO25GyVHZlUM2zbmPE3Ol4Iea8r6D0HXcSwHI4drgUFW5cZ8+7ctb
         C7VHBuGzV5Iku2x0fBnHXPfn+hR6hKHyFCBRrFkdvEczRhQQKEBqGGWngiQ5izWutP6r
         AVpgEnl2sTiEk5Sne/UA+PDNQzVAVzT2i2NEyPtmvC4dk+yk65/d/ePNQJCr2RKyGDxj
         VjfxlewztZo7Js222lA0SLVCWTPkmolxI6F4+tAQ4sk6vbzfyJ+nP9x9+wK9urPIHlNW
         0J/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=d+9NRtRRe1F92I0Fp1msG2G1Ckza8Pe6D2HmQb3l4Kk=;
        b=KW8WBQ5tvFpd1gtFbn7vXQvdCYTrj5fZn77go0ZZl2cAg/A1kB9PUAY20M+Eq2eoGp
         TeDzbwr3S32tWxKpfvCbL20BesJez1a6E/0qlk51Mg6tBTvha5r+DEFNb1dbTv+s08Df
         Q13taYuDMSgfgIsicCn5aQ0HQCjjepy7dqUcJZ1m4cq+650rv14ORC3wP5p1zowgfF3J
         FF0zEuMb8zdfRDJkA8dYy2iG82D7dKWZU1iMhv7TRLjBZjynM0rB6sARKC+8P9agrWai
         sBiQPrZe29Lu/olgFoVhdJZxz1Y1aWp09hbPabSKnDvn3wD3f/I2UUfBogC20qwl5AJ4
         xdjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dCFJ2XLy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9-20020a056214194900b005ef5f8cdd18si10186256qvk.257.2023.04.26.06.18.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Apr 2023 06:18:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dCFJ2XLy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prf2F-0003VT-2N; Wed, 26 Apr 2023 09:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prf2C-00030M-9X
 for qemu-arm@nongnu.org; Wed, 26 Apr 2023 09:18:12 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prf26-0002A8-B7
 for qemu-arm@nongnu.org; Wed, 26 Apr 2023 09:18:10 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f19c473b9eso119513575e9.0
 for <qemu-arm@nongnu.org>; Wed, 26 Apr 2023 06:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682515084; x=1685107084;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d+9NRtRRe1F92I0Fp1msG2G1Ckza8Pe6D2HmQb3l4Kk=;
 b=dCFJ2XLyy+KfMBjIVaWFqd/E8IYymhq0nmtJHXHxVPWINgnZxYFpLyXBGYvaqwuM/m
 XAM0ToDUiko0ICwM0h1MczqkX/1oTi6ngxHeaFkrss3zQYWKvMfmc/2UKigzfmqTs5cq
 SnoVaE31GxKAgpoAfhSCxgGrQCRJRU7yJemNP7JJ7lctb4nEixXAs/yoLL2DRejVR9yh
 RyJV44OC/CaK7e1zAG1owv9PKJukCmbJP0+ct/hvU5AAvIoYeXbpOhULdNgk92GlKerv
 oQVfoT0jXZCS5LkGxFmXXtlSKzgXHgIsj67BMPZwIMupZUcrDtz4KETrWjwyVl1jef6N
 QvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682515084; x=1685107084;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d+9NRtRRe1F92I0Fp1msG2G1Ckza8Pe6D2HmQb3l4Kk=;
 b=DdC6nSoKLZ8dzPrFzUQtA9cn9Zi56ubAggaHnAu0QGQCBfa+cqCpBNYyFxOzMewICF
 ESOMPMAWvFUkpOoaDPaH2BMjYWwlEz37JrBECjLpiMsCKyE28+yLfcKseVxLscNjGa+I
 DIiEf4ei2VA860H5ZKNKsiP6o9jVetezyEpbqsdsRDlZpJfMRWldiwngpw7rT5LBh7SC
 7PihKfnepy8N8UXAnGx7gD5N/emXVu9Uf1wmDe0WzQplWaP07Pk8B2ENagBlyHR84JNd
 ctH/b7OLcapL4UyATGFdEV9nVx7yxCohhobZsXuRzLcuIe7tJMWJjIE09/hG4QeG7ibl
 NhNQ==
X-Gm-Message-State: AC+VfDxvQo7+iBLUMeRqMTnmPMVUiFjsr0/hR1U90P9ZLedYo59ZIzb+
 vwYhdYugmJUtY9XxIwvQxtI2Zg==
X-Received: by 2002:adf:e710:0:b0:2fe:c8b5:b5da with SMTP id
 c16-20020adfe710000000b002fec8b5b5damr1786537wrm.13.1682515084404; 
 Wed, 26 Apr 2023 06:18:04 -0700 (PDT)
Received: from [172.23.2.237] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 f3-20020adfdb43000000b002efb2d861dasm15865834wrj.77.2023.04.26.06.18.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 06:18:04 -0700 (PDT)
Message-ID: <87674a24-5df1-568b-025c-f88cdf5ada9d@linaro.org>
Date: Wed, 26 Apr 2023 14:18:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 34/57] tcg: Move TCGLabelQemuLdst to tcg.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-35-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: s53QRHrCAo9n

On 24/4/23 07:40, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c          | 13 +++++++++++++
>   tcg/tcg-ldst.c.inc | 14 --------------
>   2 files changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/tcg/tcg.c b/tcg/tcg.c


> +typedef struct TCGLabelQemuLdst {
> +    bool is_ld;             /* qemu_ld: true, qemu_st: false */
> +    MemOpIdx oi;
> +    TCGType type;           /* result type of a load */
> +    TCGReg addrlo_reg;      /* reg index for low word of guest virtual addr */
> +    TCGReg addrhi_reg;      /* reg index for high word of guest virtual addr */
> +    TCGReg datalo_reg;      /* reg index for low word to be loaded or stored */
> +    TCGReg datahi_reg;      /* reg index for high word to be loaded or stored */
> +    const tcg_insn_unit *raddr;   /* addr of the next IR of qemu_ld/st IR */
> +    tcg_insn_unit *label_ptr[2]; /* label pointers to be updated */
> +    QSIMPLEQ_ENTRY(TCGLabelQemuLdst) next;

Missing "qemu/queue.h" in header, otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +} TCGLabelQemuLdst;=
