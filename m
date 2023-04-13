Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp851411ejc;
        Thu, 13 Apr 2023 00:13:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350aikKTsaKr3gX3k4dSw5BDregg3Jqq0TIkgni1mP8crUo7xvftDXdC4HyXBUScNcTze+JNX
X-Received: by 2002:a05:6214:d42:b0:5e8:374d:cdb9 with SMTP id 2-20020a0562140d4200b005e8374dcdb9mr1877715qvr.10.1681370029054;
        Thu, 13 Apr 2023 00:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681370029; cv=none;
        d=google.com; s=arc-20160816;
        b=s+LvhYG5DGRS6Up62K0YtmfVTm9zpGjb/07z44Bzbn/FbBCQpasghIQCxGqjA/Ov/t
         t+lpB8iQ4z8CU5RoHyckfO8MSbMkDQPgDYdsyT0ipoYNJYtd0r2qrHcPsq607TOONO6n
         Jyua4+pG6WolQmvqL/irk2nvqlCiD/rq6RJTHllDKdrLfHshRbher4s9h9svWro0JH2W
         eo3KQmONO+bnuf2pQuFrw+VNd+esasKE6DE0abPBy4cX0cQ6jyyTsMu9hm61VZp3Ze8x
         vDG1CkR3ZyWC76/DkQ07poLXQmenzHQYfLtf5b2nwPl+IpIWemsEfvNxQfu5zkD8oq7Y
         oWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pS7KTwo3EKGYszSCfQOkm9OGM/K03PZYbWWOmcWi/RA=;
        b=L+C17+ntUvetWVWZZxHXtDfPXvv6lQqQQHF27p1AhVWrHomYACA2oFu9/pgBBTafn5
         9takdkP3mFev4kxBIygClYNfc6zksWbXXqURo3101pvYncIWgyokUZTazaiSv8uB+uw5
         /cgj3YS/FGF6P+/ZymPOMVR7Xw3qm9P6D86KrYQUXDgR6zeKeMUc3I6pkLdpW8GNAJOf
         1IAOAUdr+VvYEzSq1d1VQM4+68TWtfWqb/rrVfV194L5A97lMpP0pUYEYlqc2fvf/SHR
         VKGYS2pjWSlYypytgwso5FstFrl/gGPVHoomAVRv32WDnep6UerY0Dm3LopPhcpIeMCh
         vIjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FWHq5cWG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3-20020a0562140ac300b005ddafca81ffsi595976qvi.219.2023.04.13.00.13.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Apr 2023 00:13:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FWHq5cWG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmr8s-0007t5-TM; Thu, 13 Apr 2023 03:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmr8n-0007r9-85
 for qemu-arm@nongnu.org; Thu, 13 Apr 2023 03:13:09 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmr8a-0006gb-9M
 for qemu-arm@nongnu.org; Thu, 13 Apr 2023 03:12:58 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 he11-20020a05600c540b00b003ef6d684102so5745544wmb.3
 for <qemu-arm@nongnu.org>; Thu, 13 Apr 2023 00:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681369974; x=1683961974;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pS7KTwo3EKGYszSCfQOkm9OGM/K03PZYbWWOmcWi/RA=;
 b=FWHq5cWGA/Sy23YtuM4qEEXSGQoyj5izRZj08Fk4UjiocYvW9JI7+tO5Urbiprp8uq
 4Yn08jTwVzNtviKKYuplDwqfMDXNqeMvaH84EatmN8V7IgsmS6GXLund3YR3kLZJWuNF
 fkwrp/+US12cTT53epHcjkCqjFmSXy8SnnxYT9XGzQ95IEQekl4TmMzgcw9Sb3PCA9It
 qu2+VW3al1gwVaxMLk5ju2C0x14pvMQG+YzV/0FVpYAoE5JUiFqQFyLvNxVAA9ybzP39
 FNrAJAxMhogztnsc4mnTRNMRo21p72KLyIQrHqO7E7a4tQTrIRCxdgDzpdW2oHh/f04J
 r9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681369974; x=1683961974;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pS7KTwo3EKGYszSCfQOkm9OGM/K03PZYbWWOmcWi/RA=;
 b=RplsJMleZKsh3rL+eWVRbvPRwz1xBlXiBdoE5Jtq8hxIEuqkcuEsBD/EM9PU8uGWo2
 eTxk6d0vPSFm8I1UAyICI7bmCwXEucHy9lMEEqpAWNumK0wWKiOrN6NJ10HtiKzXjuay
 5DdJxmAr0BBxTAu0OtcGNrWk8pQEWXD/naX7aS4mRl12Y4JODQwNFopVt/S3wLtA4wDs
 DnYr+5Agnuc4mM/aa+L+6F5U2y7fqrXQCXAWbMXBlPRgYoO++qNeImX8Dkibk0A25LxA
 PpLRrWYEHqQ03Efdn+x2Ux0lOSmUpz9LTMeEtV3WBGeIzsPAqO4byCGCWIvpyg9OawCH
 5+1Q==
X-Gm-Message-State: AAQBX9fH14Q0k/iBxsrUJaa5z2hY1r1RrmE/rqRQ4JOSQBpcYpGooNKR
 c+Ef0NRuykNTvTRNwntacoJMyQ==
X-Received: by 2002:a05:600c:2152:b0:3f0:3d47:2cbe with SMTP id
 v18-20020a05600c215200b003f03d472cbemr1075522wml.10.1681369974175; 
 Thu, 13 Apr 2023 00:12:54 -0700 (PDT)
Received: from [10.0.2.69] (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c35cd00b003ede03e4369sm4643913wmq.33.2023.04.13.00.12.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 00:12:53 -0700 (PDT)
Message-ID: <ff9cbbc5-d900-bc45-ef15-0da56e53547d@linaro.org>
Date: Thu, 13 Apr 2023 09:12:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 27/54] tcg/riscv: Require TCG_TARGET_REG_BITS == 64
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-28-richard.henderson@linaro.org>
 <c696a2f2-48fc-88f3-bc30-81d31a0fead8@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c696a2f2-48fc-88f3-bc30-81d31a0fead8@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.083,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: pFwhAqnJY0VU

On 4/12/23 22:18, Daniel Henrique Barboza wrote:
> 
> 
> On 4/10/23 22:04, Richard Henderson wrote:
>> The port currently does not support "oversize" guests, which
>> means riscv32 can only target 32-bit guests.  We will soon be
>> building TCG once for all guests.  This implies that we can
>> only support riscv64.
>>
>> Since all Linux distributions target riscv64 not riscv32,
>> this is not much of a restriction and simplifies the code.
> 
> Code looks good but I got confused about the riscv32 implications you cited.
> 
> Does this means that if someone happens to have a risc-v 32 bit host, with a
> special Linux sauce that runs on that 32 bit risc-v host, this person won't be
> able to build the riscv32 TCG target in that machine?

Correct.

At present, one is able to configure with such a host, and if one uses --target-list=x,y,z 
such that all of x, y or z are 32-bit guests the build should even succeed, and the result 
should probably work.

However, if one does not use --target-list in configure, the build will #error out here:

>> @@ -942,9 +913,6 @@ static void * const qemu_st_helpers[MO_SIZE + 1] = {
>>   #endif
>>   };
>> -/* We don't support oversize guests */
>> -QEMU_BUILD_BUG_ON(TCG_TARGET_REG_BITS < TARGET_LONG_BITS);
>> -

I am working on a patch set, not yet posted, which builds tcg/*.o twice, once for system 
mode and once for user-only.  At which point riscv32 cannot build at all.

I brought this patch forward from there in order to reduce churn.


r~
