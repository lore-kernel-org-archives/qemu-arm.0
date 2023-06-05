Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2999538ejb;
        Mon, 5 Jun 2023 12:20:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5JFyQSIhBgeeEVNLp/BTf0qKCIAfFqXMtQhPLWLMswiAZv+eDKKfo6RpmylpB3NfJiEBGr
X-Received: by 2002:ac8:5c4b:0:b0:3ef:25ad:27fb with SMTP id j11-20020ac85c4b000000b003ef25ad27fbmr8350485qtj.30.1685992824515;
        Mon, 05 Jun 2023 12:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685992824; cv=none;
        d=google.com; s=arc-20160816;
        b=S3CQA8CkTdu3t+hoMxZXxcn8zasnU/fdslB1cv8T6XyWEG8dNkGe+f3eXl2fmVXKTh
         Vw5GH6Ri+gNEjb/NB0LljC2XgCd7z3+zt9a5o60NuKCfHcRISaPy6lm/RejNmk0fMX5y
         WtJal+hcIOpqgBErX3bXRhNF52NF0KnJYh5TupeNZQK26SCzff0NVBAXN/2XXQxXcvFX
         SVxl8PpT2W02IFk1Gce+RDrQlrMDjrfpULayapnl8p6/QvzBlTqTTkkJqeUYVwGDDNE0
         oMElhREyt/iKJu9A6mD9ZbnhtVDF/pSiFjMmuT9k+/m6q9Ki3mCRpIpIdCR5w3uF/utt
         kSfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wVjtOfdTTZieiEBPc31ngjfLd/3pzrP4j2rieJolwhg=;
        b=ptAzxVEa6sKAwbLonHyKUf6lfmDdrcqBTAs75rV/iMYFCBOGCVGX221VbXcD/3r67q
         RUWdL7bgOy+UZ4UAXlAi6j74k5mZS7484qwtx+Zb5MAIIASqVW8yUP/tv4UFmYgkmgah
         Ouzq9zEux9DO1lovOoitWUgrHOKDCpPp3Uahp80DdcaelSf/CFRjMU/yZylbtWePwf8Q
         ZXr6tulH8uT5YIHWwWHwF14mF+KElprZ0tPM3tZfqeXj2IBhqllgCrt4NU9BdL2AMwqT
         p06PuA8bwrdwR72vuJ3FWOuWrlhE9QunzzaM8BTLv3S3+dsUHyUIjyWlfUIGeSK6Tc27
         pIww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YlzjcuRF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10-20020a05622a134a00b003f9addfb455si259235qtk.609.2023.06.05.12.20.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 12:20:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YlzjcuRF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6Fk3-0003X3-HM; Mon, 05 Jun 2023 15:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Fjc-0003Vt-GR
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 15:19:46 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Fja-0007nw-Hp
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 15:19:20 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-651ffcc1d3dso2970749b3a.3
 for <qemu-arm@nongnu.org>; Mon, 05 Jun 2023 12:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685992755; x=1688584755;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wVjtOfdTTZieiEBPc31ngjfLd/3pzrP4j2rieJolwhg=;
 b=YlzjcuRFm40lq7zzuk9StRrSKosfEkaB+urvbpHZDf2np8baQJndsU6AYj6Q9xp+kg
 ZwqOjZeVr/QTM0emtRI9fkMuLLllnHo6FdyZ4dvCQ+5BWx5H5O20TKNsX/ipq68tgwsb
 pIsNGuD/9Kn9SSExbHAeVU+kos6fh/A8myzGz1w6x9ZPeM2rj+a1lXLHhqyUCgfMV8uF
 6jHifZ8+k4EiZ3E/c5/BDpfOzHUfsaPL7D2h/zvyDNjL+HKR1RgV03JyPeTvQxQOk70q
 XQw4En/G7BrDlGVMwIAi8Nu27naSLvuWAU76oyIT2xJflxG2C7KBBtxuq0EfoUQNwDOH
 Ygqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685992755; x=1688584755;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wVjtOfdTTZieiEBPc31ngjfLd/3pzrP4j2rieJolwhg=;
 b=R3cchzAOFgKAEb2s64SoFQyqxf/wM8HZ7wWLV+FQw3lh5wW4Nerl907UXqTmo85tn1
 1TWacWWEsOE22njGaYKq/KadFgRpYK2olNFSFTkx50cv3Ql1Xvavd53mI7jzostHxhyj
 y7LdntepQhNvc2X4e5lrFWA0nRFrplZwSK7teheHxbRPUsD+EkkzVZCuAL/joteKG8lU
 B5BV+oSQkI2y6e7b7kh1n7AiSql7iaJiRu+uPEoTKAhD3z4sJM786IZ2PJG8deJgWvHJ
 zZhgkx5zPsZdgxapeRJdAIR6eeag2UjbZmjnCFlcAEt5T9BzZGohGhscfF7zCQA5gZhO
 f0uQ==
X-Gm-Message-State: AC+VfDyNfWOiIsnTbcTFKl8pFAlBUAPkEuGceEWXY5QQ5+PfrY+gy+HQ
 sRc9eZq2C5rLYlv7AKXt0AfbNQ==
X-Received: by 2002:a17:902:d386:b0:1af:a2a4:8379 with SMTP id
 e6-20020a170902d38600b001afa2a48379mr4352503pld.17.1685992755612; 
 Mon, 05 Jun 2023 12:19:15 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:3f85:a600:6a3e:e465?
 ([2602:ae:1598:4c01:3f85:a600:6a3e:e465])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a170902778d00b001b024ee5f6esm6920789pll.81.2023.06.05.12.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jun 2023 12:19:14 -0700 (PDT)
Message-ID: <1cc5a040-a82c-cffa-1e1e-9a3be004349f@linaro.org>
Date: Mon, 5 Jun 2023 12:19:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/5] util/cacheflush: Use declarations from
 <OSCacheControl.h> on Darwin
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org
References: <20230605175647.88395-1-philmd@linaro.org>
 <20230605175647.88395-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230605175647.88395-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
X-TUID: 0SHEIs4Mf1WG

On 6/5/23 10:56, Philippe Mathieu-Daudé wrote:
> Per the cache(3) man page, sys_icache_invalidate() and
> sys_dcache_flush() are declared in <libkern/OSCacheControl.h>.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   util/cacheflush.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I'll note that a comment in OSCacheControl.h says that sys_icache_invalidate performs both 
dcache and icache flush, and so we don't need to call sys_dcache_flush.


r~
