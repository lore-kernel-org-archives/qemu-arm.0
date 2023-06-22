Received: by 2002:a17:906:d8da:b0:98d:c41:35ab with SMTP id re26csp356915ejb;
        Thu, 22 Jun 2023 02:10:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7C5FPqmXrWXQdkGr8xRNSG1ua01ZKHY5SHfgD3cNIpudJJwd3oEA1ddLYm87eASQVhC1nK
X-Received: by 2002:a05:6214:2685:b0:626:17b2:5583 with SMTP id gm5-20020a056214268500b0062617b25583mr24093557qvb.0.1687425001820;
        Thu, 22 Jun 2023 02:10:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687425001; cv=none;
        d=google.com; s=arc-20160816;
        b=gYyuubH4b0AkIiUTSE0TBg4BtyNzIpMbtPdoYmX2qqDz0k2p+CVHiB4WGBO1e1/vDD
         0ku12yh9Ns1qhe29TJI0osvqBP/iQQ7L6hpr+TreDxjGdXjfSCL0EHvNh70JEg8YQE9q
         hs6ypgeOlZ2+PYVdrT1pL9aqmNcnUCC1gF5jP7cUwKDyfsuRrixEP3I4CepZJMsucImu
         URITJfQpS9KeBqlmHtx3P30CEsZ1OXVv66xfFQyiCqQUTOBsYQpUwjKRirEip1Fo43eD
         qN5D+/HpXxa7Tgt8tychFIk7Pd5Ge5+wIMXVwwodLpQn4VrripF0YnCDjW8Y/FsBmGOI
         WURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=k/EKZiQd1ey9p4aWa6JWppu/xXDSntzofpZsOMYMFlg=;
        b=DfMX/oAdslvXuJqtpV++jamAjOcswe851QBNVnwHQl04ZHamuBK7R6xpAwypyJ3oUG
         FrPYLVPE3K7/iEYJzED1f1SapleGgjYkE7oU7RXnXUO9LWyayb73QtUlVwhWrDEYCwnK
         Zg3uie7ZosbbOTb1T+s5eIYoleankCjtiLqDL9DSFUI38QO0LClI1q4X2BGOLyiwKVdN
         cA0A4Nk52W6LIqVTjrfLpRFYd7UEs/0RSMr/j2UAoZcK4WyQ6Cu0xixhJe8N4JH0sT9K
         rGPj2e7+91nEJyb68SeEql1iRz6XJvt59Z+CixccLf9mxC46P7WR+O2LOG3WCpnTUh3m
         s4nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DdqjcZjy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6-20020a0562140d8600b0062596e0fb72si2531295qve.121.2023.06.22.02.10.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jun 2023 02:10:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DdqjcZjy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qCGK9-0003I8-3H; Thu, 22 Jun 2023 05:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qCGK7-0003Hn-SO
 for qemu-arm@nongnu.org; Thu, 22 Jun 2023 05:09:51 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qCGK6-0001SA-Fp
 for qemu-arm@nongnu.org; Thu, 22 Jun 2023 05:09:51 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f9c532f9e3so15266425e9.1
 for <qemu-arm@nongnu.org>; Thu, 22 Jun 2023 02:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687424989; x=1690016989;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k/EKZiQd1ey9p4aWa6JWppu/xXDSntzofpZsOMYMFlg=;
 b=DdqjcZjys6K0mOTtuFVKrnCK3L5OnsH6q7Ko/s5ncO+luTrONwdD4rOjM+b5G/AkhD
 jb4ht3+CvfBelY+LJko4ju415w+F8HtRla1+cezkZn3IN5tdu9Vu+DbUd+Mut1zl/b+1
 eD/BmE0ZHg9MwksK//9tU75HTNhv4RCddMRzAlWxj3KSzeaKFmvgg05DzNPCQC3m9IgN
 uwix3v/UhJ5FfFr6p8qo3FuQxZyc8DjSAjHcztDJ6EcEEAS3gcj+bqBT+BNu/IgEBOZE
 HqHdCXm5rjobLuXnPOsua850azsRLRJGW0MiWQXHCTZmJYIfNHecrLv9Xel0N9DBylCr
 1VhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687424989; x=1690016989;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k/EKZiQd1ey9p4aWa6JWppu/xXDSntzofpZsOMYMFlg=;
 b=DfaexeAENe4hqXwIvXCGDNrvkTxNAgROj2JmvAKrQsXrqHE1WT3AV6boD+RF0aQP3N
 D2fcXgk+w1t/j6T3/hjJESr8PLKfR4FEJOyEhoUT4Hvh9/L+VRYi5NmAoWVK2m3Xebsm
 E9cBfW0/i+m3HBCB859tt5qjlP3aFs95SH6YzagY49pmtStt211hwFUXTmYTLOkXDFBO
 kQm/xeAaNhvrrtcCDubIm1Ld/8HVP8svKHE32X8BgGqhxNWHbBGaDo68lXBQUGlvSSfB
 Hg4ToqMv2nK1+LsPo9OvNviRNNxdP5tNnEspd7yM0ywi4aSMyfOfO+Vbj2cdZe/vDih5
 koVg==
X-Gm-Message-State: AC+VfDwQ7qeL5TRFN3wIGAwuwkGGsIKrQSRu+T6QwZhHJubuls/tJu54
 ib/gvhuxGelP5Yi+CG5VUTeg7w==
X-Received: by 2002:a05:600c:204d:b0:3fa:7810:8cca with SMTP id
 p13-20020a05600c204d00b003fa78108ccamr116127wmg.26.1687424988809; 
 Thu, 22 Jun 2023 02:09:48 -0700 (PDT)
Received: from [192.168.69.115] (che77-h02-176-184-42-18.dsl.sta.abo.bbox.fr.
 [176.184.42.18]) by smtp.gmail.com with ESMTPSA id
 z3-20020a1c4c03000000b003f9b3ccb815sm8947191wmf.1.2023.06.22.02.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 02:09:48 -0700 (PDT)
Message-ID: <712f1d4b-1ce1-2c6f-1279-ab88d5adf3c5@linaro.org>
Date: Thu, 22 Jun 2023 11:09:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/9] accel/tcg: Renumber TLB_DISCARD_WRITE
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230621121902.1392277-1-richard.henderson@linaro.org>
 <20230621121902.1392277-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230621121902.1392277-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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
X-TUID: EZ2apHmWwDuh

On 21/6/23 14:18, Richard Henderson wrote:
> Move to fill a hole in the set of bits.
> Reduce the total number of tlb bits by 1.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/cpu-all.h | 4 ++--
>   tcg/tcg-op-ldst.c      | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

