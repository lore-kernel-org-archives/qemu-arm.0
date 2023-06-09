Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp557640ejb;
        Fri, 9 Jun 2023 11:06:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7vy5CsZmkugemgtywPGJYvTPubCuJ4t1fPEyEphlR2+kl0jIiNrT8BNzaqebjTAnvwpWIi
X-Received: by 2002:a37:ad04:0:b0:75d:5351:e435 with SMTP id f4-20020a37ad04000000b0075d5351e435mr1847889qkm.6.1686333998905;
        Fri, 09 Jun 2023 11:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686333998; cv=none;
        d=google.com; s=arc-20160816;
        b=q99NxnTCoV/SDCy9XwzS0jVI0lJziCMuR7HKwEKyeFDkRYT76FWA0BChnCKsSJVN+4
         xgcQWLzmJ7g3EgDASEYbPUxUPQcjj4DTiIKEh7fvGXZPlVobaMWvvlD1zVltBbkj50h1
         K0tC/aPN1U0VDC9W9yOiu2DASJH7l6c3Gpzw1E+g4+5CFUC8rksQ6k+4hnIpHTcnGsmS
         7dC3jgvJ6xHPb07ypx4+86rdIBJX3onSpfq1UzmhlrVi8XGuH5DpvlfmZj8yAQQOiT7H
         HfCfjK+wTm3aKt7WZwB/7VxZRlkIzaw7EI1It31v+AhGM6xqaRq2EySm6cA2IjrvPWNA
         90zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Z5me2xa+ruM1rriq38vBZUetOjhR2d3Ub4n9gxXOazs=;
        b=mRb/0mSl9lbRtugtldO1lRmuWELtfNyUIN0/weWMhf3LgjD5bPs9ch5pbh0vzuL3cU
         /54WquI+tbLbKjaP3OnH1uTJdBpDWz49Y76WUyFoz7H1vZ+q27lAtsZ1iC+xn7nrU7lb
         /V/aRiaAd1plLn72zGG5T99kPiWxJ2atYN+Y2HpmowGYh4sg7Iiw+4zZb4hCye05YbQC
         xzMbq+8wtHvn/kzXmhE+PXnhgsIJM2WsskWrWDWpcF56Ok119BEDX9ePVKDWMcPRDND7
         wOY1K0+YvfH0CGlrgctd0W1zoah1hvWDJEbPszcpLLdShVcT9jxStBYwylLcJ+wurt0h
         pwiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d+lS0OoN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16-20020a05620a005000b0075d139b77b9si2518125qkt.68.2023.06.09.11.06.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 11:06:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d+lS0OoN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7gV7-0005RU-69; Fri, 09 Jun 2023 14:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7gV6-0005R7-AN
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 14:06:16 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7gV4-0007uS-QB
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 14:06:16 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-544c0d768b9so1006245a12.0
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 11:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686333973; x=1688925973;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z5me2xa+ruM1rriq38vBZUetOjhR2d3Ub4n9gxXOazs=;
 b=d+lS0OoNiAlA4Y4t2Vi9QbKGjC7ynlcCreLCZnCM+51yTEyLNPh0lQNKsTV8CYEDfb
 qfBqErH/jnJJWvCxs1g4ewsdx1CGbKC7s3GJx17hgk+Auwv4UnUsr5mTeYyZVBb30QFN
 YlCHBn8yp2KnauXjySewHjuPCBVl6Rwam/5itEpGO++PZGCmYkpRtt8NdrYNUy5W/zcZ
 12J30x5CDDd3KjlK2F5GFr0OWoCgEzIuVVfAT1fZNkkDLPOcSj0r99r/ukdsiRUFcCyN
 YgD7ZpEdWg+7KwHOrNlc5/vjJT6da4XOW8vV/+6v6ECUg2EIvzITQWmvtj9f3elqB1BB
 V5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686333973; x=1688925973;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z5me2xa+ruM1rriq38vBZUetOjhR2d3Ub4n9gxXOazs=;
 b=EYCOpXmgirZmXIKuUpGNTPg6ZLk85RYZHzEPZWJHnSO+gJ3Cs/1RxgXLAkkCU+codM
 0NbEYqL/O7u5kw5jBRyJu+PFpsvwv8i63AkO4UVqwi+4AFFNH1nYRjhWAgcqpaHSmiSD
 EUNtrOtkDHsPtXcG50OmQzSmm5VWn0MDK3DEWaAQZt9G+htbP0Hnqh+jcIS6M4/G5jkY
 CayqB3/1nuO0qZJGcrhuMhRsAEF1uVH7w7ymkirHcI4AE7HarjFtuQxdpZbVzEuTHenM
 Fzk1WFO+npyL0Tlau9H54DSfhBCOWYeeqHOa5gPkRF+ADKyzYAC6u+95ras6aVFEMjHD
 /AxA==
X-Gm-Message-State: AC+VfDwAUTVIOFsq5tI8OCW8Mpas5ltn4KSqlmYRH4ltw9BJVKtKgBMU
 MKCnPAeibMdMjPphB98WZZC9zQ==
X-Received: by 2002:a17:903:249:b0:1b0:6544:1d4 with SMTP id
 j9-20020a170903024900b001b0654401d4mr2270869plh.27.1686333973223; 
 Fri, 09 Jun 2023 11:06:13 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:20be:c4cb:f609:8cca?
 ([2602:ae:1598:4c01:20be:c4cb:f609:8cca])
 by smtp.gmail.com with ESMTPSA id
 6-20020a170902c10600b001ac55a5e5eesm3564650pli.121.2023.06.09.11.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 11:06:12 -0700 (PDT)
Message-ID: <430f8aa6-bee8-fa29-96ec-3fdfcf008eac@linaro.org>
Date: Fri, 9 Jun 2023 11:06:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] target/arm: Return correct result for LDG when ATA=0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20230609155457.87848-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230609155457.87848-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: zKIIrg6UVasr

On 6/9/23 08:54, Peter Maydell wrote:
> The LDG instruction loads the tag from a memory address (identified
> by [Xn + offset]), and then merges that tag into the destination
> register Xt. We implemented this correctly for the case when
> allocation tags are enabled, but didn't get it right when ATA=0:
> instead of merging the tag bits into Xt, we merged them into the
> memory address [Xn + offset] and then set Xt to that.
> 
> Merge the tag bits into the old Xt value, as they should be.
> 
> Cc:qemu-stable@nongnu.org
> Fixes: c15294c1e36a7dd9b25 ("target/arm: Implement LDG, STG, ST2G instructions")
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Spotted this while I was doing decodetree conversion stuff.
> I guess nobody runs with MTE available but not turned on :-)

Indeed.  :-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

