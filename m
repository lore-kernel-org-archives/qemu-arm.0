Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp3753198ejc;
        Sun, 5 Mar 2023 10:20:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8Dk8Se7/ccrYJtZAaLCnXvmShY3+r+/CQ9RNvgyF7Ftsu7YvaEX1CK6AoADs1pvgEruffG
X-Received: by 2002:a05:6214:1d27:b0:56f:a59:bf32 with SMTP id f7-20020a0562141d2700b0056f0a59bf32mr15923030qvd.44.1678040436213;
        Sun, 05 Mar 2023 10:20:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678040436; cv=none;
        d=google.com; s=arc-20160816;
        b=O/XinLzGf76DPLzXl2azj5BWpSDy2wnyABcrRDvntW7Io1EH/ko2xJOnpY8KQSMwyz
         rGei4F39Do49EI8PDuex14Wmz7zMn76Y0oKRzEbiuGIrz43/5RQ8JEe8QNZNz1qqiBjj
         N8xzv5crtD8Xjd4MreXV3fRxyIyH1zvSvPqsPDEDnwtiwccUuCa9k7Lgu8w7BnXLaQPa
         mXiMWQT7MftxgxMe2GOEm9ujcc16A4/uWgWQhet2KdINBursHaz94sD4ItPFMbQHW4fJ
         BRZPgnWA7ZVHZGk+brEeSDzE9hoRO+EAnTb8G+FpX85fnRb6XyXloaMuOWcKDGUGHxdg
         7R8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lyXSLQqti9nE4kw5qxiCnq2I8gdlNlF3gU6pRJMziuY=;
        b=c/+/1xZsNFeyu19HOXzjvKElk4CHK82d1m+7ZSM77K1ZpZ19xZlW926ppQxcDqpe/x
         pG9caU0WGAHrvHlUxQcm66+EiI7Iw3jfmW3vwJ+2HWRE2V/w43GvnRbpbL7fMMxtiKNH
         bwvw2VKYI2hgBbbmGm4IcfvN8kvyMlDJuN674mZMKUH3RKaGEz/xwVFOQyGdHmjimkKn
         OG2ccc71/P38WZfNi26cifirsiTPjVHUf1E9UjOl8dLViS+ee73SFcMNV902OIhUbZ56
         yfmTIoH1qjS/jWRrzhTDfG4N8cZToHEPj1xGJmZTDgFhzziGbCZAAAXzBN6r7E9xrtnG
         ct5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fBkeIiDI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2-20020a0c8dc2000000b0056e8fe0cceasi6369993qvb.25.2023.03.05.10.20.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Mar 2023 10:20:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fBkeIiDI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pYsy8-0006ru-Vf; Sun, 05 Mar 2023 13:20:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYsy7-0006rV-Lk
 for qemu-arm@nongnu.org; Sun, 05 Mar 2023 13:20:23 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYsy5-0000QE-Vq
 for qemu-arm@nongnu.org; Sun, 05 Mar 2023 13:20:23 -0500
Received: by mail-pl1-x634.google.com with SMTP id h8so7854545plf.10
 for <qemu-arm@nongnu.org>; Sun, 05 Mar 2023 10:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678040420;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lyXSLQqti9nE4kw5qxiCnq2I8gdlNlF3gU6pRJMziuY=;
 b=fBkeIiDIIfinFaNSJjhhi4VvfY3WAjDiUjiZ58LPgcUUliOqmOBXT+0hhX3hWfHXCP
 vN/J7grBXa7VU6azXoRHPOMSGUDg+4RkYjK9SK7lejqqjKydPD2OGWvfkL6194jMoDB5
 x8LXCdrWDbJqqbqYIcqLsWOZX16OdoaTt5Ed3ZUoIV5epcT7H0ioGWBvye2ephXpJqaA
 +kn03LPSQDI8tiFT/0SHmMVCZHsLzdjd1ZxLF4cjeOnOyZ8qlwDfv2Z2iFkObvTATtN9
 JLQFz7rvsR96HYkPAO/DYc/5rGbNWMcnNHh3mgxE3Vml6R04poiRuG3mJToYw/NlHjaY
 ifUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678040420;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lyXSLQqti9nE4kw5qxiCnq2I8gdlNlF3gU6pRJMziuY=;
 b=LJNtv+cAvmrPQC1gk7CeHgZUyasXqlrKeqh4kQUGyPl5WSSbQdSv2PoIL1HeNFIhz/
 XCIdF70z+SYwdRSoVLiBemuAzMxcM71hHSWVSIc04SiZ5qJMnjOQ2ULW0Nf7szrHI9q5
 bOSIFvyxhTaU3F3aV0tuQEXbr9ybD8J5fBUHLUu5E5MSDqMuPIKut/kIp/YRcjpI8ryg
 K8UpBrALMKO+VzsrRgdouDe/zXcPyuCj2iwRndZXrnCsAzItFPR8yAdC5jMOYKU99NuR
 J+xYsCJBUkylohOosC8eRN7tQ5N613Nt9/r/wHokiUtxURZUJeNiI7f5FDFH9VRD/SEL
 2A8Q==
X-Gm-Message-State: AO0yUKXIPRIDU2dQaKBIPfKWbQCyS8sL4dFkcbiFBUjfglf28uW4e/b7
 CRaqo8L/p2b8S2uAIVIP7cjE/A==
X-Received: by 2002:a17:902:e812:b0:19c:da7f:a237 with SMTP id
 u18-20020a170902e81200b0019cda7fa237mr10975773plg.5.1678040419910; 
 Sun, 05 Mar 2023 10:20:19 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:2a33:4111:eaee:9caf?
 ([2602:ae:154a:9f01:2a33:4111:eaee:9caf])
 by smtp.gmail.com with ESMTPSA id
 iw3-20020a170903044300b0019ca68ef7c3sm5048918plb.74.2023.03.05.10.20.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 10:20:19 -0800 (PST)
Message-ID: <fc6aae1a-8425-be5e-40b4-f3abc6536b9d@linaro.org>
Date: Sun, 5 Mar 2023 10:20:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 03/13] accel/tcg: Store some tlb flags in CPUTLBEntryFull
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-4-richard.henderson@linaro.org>
 <CAFEAcA9jhHX7r9FcB8ZyGimN3XGLX=rEONC3jYK=n2JTmj+SSg@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9jhHX7r9FcB8ZyGimN3XGLX=rEONC3jYK=n2JTmj+SSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: juxA5ec1WUBB

On 3/3/23 08:45, Peter Maydell wrote:
>> +
>> +    if (wp_flags & BP_MEM_WRITE) {
>> +        write_flags |= TLB_WATCHPOINT;
>> +    }
>> +    tlb_set_compare(full, &tn, vaddr_page, write_flags, MMU_DATA_STORE,
>> +                    (prot & PAGE_WRITE) && !(prot & PAGE_WRITE_INV));
> 
> So in the old code, if PAGE_WRITE_INV then we set up the
> addr_write field as normal, it just also has the TLB_INVALID_MASK bit
> set. In the new code we won't do that, we'll set addr_write to -1.

Gah.  I must have had some sort of rebase fumble, because I know I fixed this, and the 
WRITE_INV test should be above, not in the predicate.


r~
