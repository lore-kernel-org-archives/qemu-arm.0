Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3467124ejb;
        Tue, 21 Feb 2023 09:33:56 -0800 (PST)
X-Google-Smtp-Source: AK7set917sQkyvfzzHV0kdlPsZXIq6eurMJePmsHVWv3t2mVGkH9BveVMNKRrOe9AHChc/abc8bF
X-Received: by 2002:a05:6214:19ca:b0:571:6ac:ec8e with SMTP id j10-20020a05621419ca00b0057106acec8emr12104208qvc.13.1677000836128;
        Tue, 21 Feb 2023 09:33:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677000836; cv=none;
        d=google.com; s=arc-20160816;
        b=nbvzzsnfwZgOdzCKBgmSyVpnfDJa96Z1IryyP/79zNIuuZFrlR/xzxKnnaSqFcKEXY
         CT5h2egpLMBfeGzmKhH0Da8vDgdKdws6tPGd9rVE6b41GKggLI0S1GnQiJr4fpemtC+i
         2PYCHYUT0/VF78WkqatfffO0Z2dTTgXtmwGhslSUw+AAtf6l/6+Z5Gf9pHF8bKoW4Qi1
         IWug/Ba6H9DvsEC9Jw6JGGZpRUpju+mw1ZXIMzYp8LzIn/0ZeSsEogc/kWXwLMA2fvqE
         qzXmnft+InOUtQkxiPhammQqy4wu7SV8obAmw52b8JTd4TeEO2gqe6dRxjOeHfJU9X07
         EjiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Vd7ChOI1Bgg8685Hw6NtaZOVDOqN2cdUHMRSaf+rP5U=;
        b=kRp1DfwyhpfDFJekIwMjwMDytmPwVwj/bb36HkGz1y/cKE/HLm3EvH+EGzTLNWuoJJ
         FfLzn1jhGexSIjfgS8nFeGI560KIfBrwUTDbSj0KC4UgBp5WXgMXZKmyn5DhzbXn1UpC
         rHLlxxUmvYC1gx3YKlbHLzYhWvKwwlRUDecuiAAUloJK3MU++7XQh9tcgGdy+Fun4wkd
         3dGhn4tlWkLP9mo843sf1kB3IPhrLhlWY2/ah4ehEgE+HEYJsaMgnu0BgnUS+7Ly+fq7
         rrqv6wWc3SWRTg/N5+THbV+UvobyRY1TZlzwqB0BtFylAU1qpMFLf2fWihGonsYIlU4D
         c7QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aLFPhKPj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9-20020a0cb189000000b0056eb47532bbsi6311605qvd.583.2023.02.21.09.33.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 09:33:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aLFPhKPj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUWWS-00028e-RV; Tue, 21 Feb 2023 12:33:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUWWR-00024C-Ap
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 12:33:47 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUWWP-0001uY-LT
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 12:33:47 -0500
Received: by mail-pl1-x635.google.com with SMTP id h14so6001422plf.10
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 09:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vd7ChOI1Bgg8685Hw6NtaZOVDOqN2cdUHMRSaf+rP5U=;
 b=aLFPhKPjceMWxWmGh4VKYrYK39uLxsx9YpPVGC0yI4gP42D86KKXtP/22ramGKBViJ
 bnf6GBpCSAmOZrAVR5H7WlMhNLhS2aFVY5wWDrNf/Dqt4JRD0tt2y8TUi6mI6IUp2Htn
 S3vvADTDin2669OwS52OThBaogzohl2wnwElCvj25+TX/PwXmySa13u/dbb5wJiBiEo+
 YCr6JX5jRawt+WPKrb8uv+vFyQdpbE0+xMkHQ3DFEx73Tz+JrKcn7mQ8thzfr/zOHvI1
 By4RW1D+EQeqolcRLOHhVDQlyzE/WNynlUkEpw9GyA2lzEWordd1CeoYszTpPr1XfGyU
 PZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vd7ChOI1Bgg8685Hw6NtaZOVDOqN2cdUHMRSaf+rP5U=;
 b=Pi7XkPjU7qRA0jJPj+wm65hkxHBMKO4XNjSJP9PVfl/et1fFKgsANyhiWxQ0y1hXnL
 gCucD13AWvVlPf7+JQVNqMdFb512FXRjHkLdbpxPHoU6ZtSon5YxqKRGt11CD901lFS/
 b5ctSsfubNvtZwRkJKgIMeK8OObqEEkR3jMePiN64JG8ShpDTDqz/W9SE2x5fOX6qVFj
 4EqtYDHIbHxS1QB0cIc9fBozNbq+FKTrqzCyL8ZmjkOlu2kx6mXfhDibwi00kDrbKUqj
 5GCp2HEv4QK4jFvOc4kI0fim6vxNEueK27I7QYQyKdF0fOfzC1vq3HL+EVJXbBwnPOPT
 pyvQ==
X-Gm-Message-State: AO0yUKWySIduAeo0qNv+mcwXzQyYXAPHwa8UOweSJsY8AIxh3aNixZj+
 ErW6SvUdJ5bjJbfKr9JmEbP0xQ==
X-Received: by 2002:a05:6a20:3d88:b0:c7:6f26:c85 with SMTP id
 s8-20020a056a203d8800b000c76f260c85mr19490610pzi.36.1677000824026; 
 Tue, 21 Feb 2023 09:33:44 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 z192-20020a6333c9000000b004fbe67bab14sm4486696pgz.0.2023.02.21.09.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 09:33:43 -0800 (PST)
Message-ID: <c7234c83-3e53-6867-55f8-7e9ab97a5c2a@linaro.org>
Date: Tue, 21 Feb 2023 07:33:40 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 14/14] target/arm: Implement gdbstub m-profile
 systemreg and secext
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-15-richard.henderson@linaro.org>
 <CAFEAcA8nexWsqRKfjR20_OhNr5d54LMHCsGwZHrZmkng2jwgOw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8nexWsqRKfjR20_OhNr5d54LMHCsGwZHrZmkng2jwgOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ILs+L9PJnN/0

On 2/21/23 07:25, Peter Maydell wrote:
> You also want to enforce the RES0 bits on registers like
> PSPLIM, MSPLIM, FAULTMASK, PSP, MSP, if you're going to
> implement writes. Effectively you really end up wanting to
> get helper_v7m_msr to do the work for you.

Ho hum.  I should have known it was more complicated than all that.
I should probably just drop the write portion of the patch again for now.


r~
