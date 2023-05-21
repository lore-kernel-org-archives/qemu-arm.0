Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp622404ejb;
        Sun, 21 May 2023 04:22:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5tR0uNsq/3/KJgeiZHXQN22VIM6C2nuka7Cyl+sD4nU3VnRFgHmXybmmJfTUUy/UwR28gD
X-Received: by 2002:ad4:5b84:0:b0:5a9:1bd5:375e with SMTP id 4-20020ad45b84000000b005a91bd5375emr14411123qvp.21.1684668135839;
        Sun, 21 May 2023 04:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684668135; cv=none;
        d=google.com; s=arc-20160816;
        b=kkOiHzzVgo5ugTmY/eOQjTaUmo4IUe3mLYmwqZM5Mf48UQ24B+wP0rm/bdz6RG7HAf
         h6P9NkPErQHvWj6rNieFyLjqSsBCixUSOt46uLhWjleaC5XUPjYq7ixCC766X0JPa9vb
         nO7zv6GNWXDsqBpFEE+arlq4SEaJURf/7YNQHXdsnoTOkIvw7CXeR0NPqq+ZKSO+U/5X
         A/NNAYkLh9vhH1Ivr7FhAzgZlNP4w0Y3OgDX2Su03lS8MkUTlN6R10m4o7CssBeH0Je5
         p2n5RiFxoF+yp4YJn5TbLTTB+NgvbUzOWYAQofJPA2VmZcAZe7mNUDUfQNlbGYpTOYB5
         sSFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dCh+hlTdEWNjJQJKuUCqGkPVAOw7rrMFajVBY7eVVvQ=;
        b=ZdqjJRvGfvJG6AfWgfEmEuX4gJNRNNZMUew42N0EkvVvh36UgKYWKy6D54rY5zwZzJ
         vhcBfTjkS3yDSMppNsweR23leD68/Xi15LD9HVVQYPvIMwLCydPz5UvIX/c5SDu/d9GO
         saUs8F/jQLR63CN+Ehq3rjX9xq2Idpl8wTrvOaA6TSiLqZhdJMruc+3gRAjm2scg3XWT
         rgZbbLHVBuhpB7hXko2j5XErzUaRXOLxy0vwt1D1cpA6+irjM4Bryuq5fu5eE3A0D15i
         5jpke6bOtn55ekMmZX61sp+SI5COdnN45zftem/ybS4kVw6CN52YPoZkTH+h4XPAE5B/
         vAJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=waUiS0AK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u34-20020a05622a19a200b003b9fc920075si2305456qtc.199.2023.05.21.04.22.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 May 2023 04:22:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=waUiS0AK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0h8E-0006l4-4k; Sun, 21 May 2023 07:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0h8B-0006jz-R4
 for qemu-arm@nongnu.org; Sun, 21 May 2023 07:21:43 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0h8A-00066B-9Q
 for qemu-arm@nongnu.org; Sun, 21 May 2023 07:21:43 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3095b1b6e02so1043840f8f.2
 for <qemu-arm@nongnu.org>; Sun, 21 May 2023 04:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684668100; x=1687260100;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dCh+hlTdEWNjJQJKuUCqGkPVAOw7rrMFajVBY7eVVvQ=;
 b=waUiS0AKM2I5Y5F/DqPysrAgcH7cEPo0AaBlLAqaDhJlmFLF5GU7abE8NjD79Fehpk
 x8zie3Ww1GLQucOCIwcdFcxyfHg66FWdF/lwR/kT/IHX9CNdU4hfpQyfkUJ91UOMv2cR
 OAfVfNAGgMkN1o8G2lD07a+xaE4mgFsxEcK8AeAXKq0IPRa8nEXLPQn/VBfLZFcvYvyq
 TTLYqtpBKwTAepk4bGBtew/oYpIGNxRgpYOzN4U/jSY7Rz/1isMp7fcWQyF30L5D1NZD
 BSqs0vfrlHvwDeuCubkaPW3S3xKJOuIIrNLHvK/xXUJWcovUuXj/ULAJXbZtCYUd/eSt
 i+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684668100; x=1687260100;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dCh+hlTdEWNjJQJKuUCqGkPVAOw7rrMFajVBY7eVVvQ=;
 b=TFeTXD0mU3WlFRF2evVDiO8lGIIvHcGGvmwjJ9WVSQVdR0sahM1MnGsCvKSfffMtxD
 HYA+BcZ8tkzvOWAU2PhVb46gpsLWjR1G+YIvVatwEzmRAEe1EfNkv3jD4vieaessXAX7
 2d6XZpAOjMLifT4sd4QPLK2XsUZ6UNjygu0zmY3hUBDq1so9hWS1Vr9Wx0i+YxHhbuhr
 YjttLgniYH3D6+/488uSaAaKXulDMwfue7oWkZYYD47Lmdxv8/cbD7GOdVRsfZrDmHlt
 khYtgmsu/tDkkLtL7rygtiyWgik/engrZ/JP8RMFRpAunfcx5fjxuxxf06qecpCD9g5X
 ACCw==
X-Gm-Message-State: AC+VfDzByp+IPkrdmB1xO7xecIJBuVNgnQkw25tQ0kw8AmoC03gQZzx8
 ZNkeZM83t58gc+tWPXNw5HMLOg==
X-Received: by 2002:a5d:5448:0:b0:2f5:8e8b:572c with SMTP id
 w8-20020a5d5448000000b002f58e8b572cmr4663335wrv.49.1684668100557; 
 Sun, 21 May 2023 04:21:40 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.177])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4d10000000b002f6176cc6desm4370836wrt.110.2023.05.21.04.21.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 May 2023 04:21:40 -0700 (PDT)
Message-ID: <a56f5acc-5716-8598-e49c-d1f6c19e144f@linaro.org>
Date: Sun, 21 May 2023 13:21:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 17/27] target/s390x: Use cpu_{ld,st}*_mmu in do_csst
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
 <20230520162634.3991009-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230520162634.3991009-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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
X-TUID: XHTE9MzybpIv

Hi Richard,

On 20/5/23 18:26, Richard Henderson wrote:
> Use cpu_ld16_mmu and cpu_st16_mmu to eliminate the special case,
> and change all of the *_data_ra functions to match.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: qemu-s390x@nongnu.org
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   target/s390x/tcg/mem_helper.c | 65 ++++++++++++++---------------------
>   1 file changed, 26 insertions(+), 39 deletions(-)
> 
> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
> index 0e0d66b3b6..b6cf24403c 100644
> --- a/target/s390x/tcg/mem_helper.c
> +++ b/target/s390x/tcg/mem_helper.c
> @@ -1737,6 +1737,9 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
>                           uint64_t a2, bool parallel)
>   {
>       uint32_t mem_idx = cpu_mmu_index(env, false);
> +    MemOpIdx oi16 = make_memop_idx(MO_TE | MO_128, mem_idx);
> +    MemOpIdx oi8 = make_memop_idx(MO_TE | MO_64, mem_idx);


>               if (parallel) {
>   #ifdef CONFIG_ATOMIC64
> -                MemOpIdx oi = make_memop_idx(MO_TEUQ | MO_ALIGN, mem_idx);
> -                ov = cpu_atomic_cmpxchgq_be_mmu(env, a1, cv, nv, oi, ra);
> +                ov = cpu_atomic_cmpxchgq_be_mmu(env, a1, cv, nv, oi8, ra);

Why is it safe to remove MO_ALIGN here?

>   #else
>                   /* Note that we asserted !parallel above.  */
>                   g_assert_not_reached();
>   #endif

