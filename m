Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2703999ejn;
        Mon, 17 Oct 2022 15:04:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6xOZ1kLpL2QI501eMOoAilLefy9fTAwTK2Q6duoUObDMQInfVbDOn1iEw1RHNge0P3flV0
X-Received: by 2002:ac8:5c45:0:b0:39c:dcea:c552 with SMTP id j5-20020ac85c45000000b0039cdceac552mr10419075qtj.128.1666044290276;
        Mon, 17 Oct 2022 15:04:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666044290; cv=none;
        d=google.com; s=arc-20160816;
        b=DXDcljiVtYOuqXxB1En1x5nQEjdyg1IcLK4qNbaYz/fvwrePmVWCTLZXx6Tm8veJeM
         YBRYX0K6Js6rgW845G1PvdmwSyV2/s+rZBV6yUGftSTz7vG3aDOcdCHI1EmfGHCCm3G/
         tiGL6n/HVnIQoP+RNcaAC8gPxLbjvwRgeD8NrDqnshrEhqmBfgj1Ds/gPCciq6LpmzYj
         qiiyQbLx8grhnD13GtZ4iV7+jXxnEPZSAqJqV8nhBarujYwtCZPdWc/3KX6NgXmuKaml
         DdjGj4punr4Hcsgg/+3ucjp6wah7Wt1dgE0TX87XGETpH3RQk6M2w5pTSUIizlMK3FUQ
         gaLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YSDH4zi0/StRIIVDTOoiOmf50RC9g5KEf1ziWa+XPf4=;
        b=oGJZQ+0Tz0EtbljUpQITUSsEGDhqW2GfIFf5s4gAAW2pfByaKPvP6O0zr5JG2zvKJy
         c2ajd2SRIDZ2XmwIbGhnZy3tQGhf4D7T3/iBv3rjmjWO01KIs5CxW1xbYGptcK6jZfsN
         0REo7BksQ6mQQyHxRnUvxqggQTkaRxW6swEFxYntA2r0Z24o6GhqV9PZFr83TQhxczOr
         QJxq+ozoqkTRTJ/ZcWE4QqzjKCaPO3QC4GFjV8KX2UsHs/Pu96T5+NeBnyUi19RRTzL2
         VNt8jnCTa8wXCLsfatQiVdrQjbzelEejXRL227zgzm+WkOvwfgETN3Vm0f8MtiM/POlg
         e/og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MBAJ+fym;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14-20020a05620a288e00b006ce401c798esi6768816qkp.709.2022.10.17.15.04.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Oct 2022 15:04:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MBAJ+fym;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okYE2-00021U-O5
	for alex.bennee@linaro.org; Mon, 17 Oct 2022 18:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okYD6-0001zp-Ux
 for qemu-arm@nongnu.org; Mon, 17 Oct 2022 18:03:57 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okYCz-0002RZ-Ph
 for qemu-arm@nongnu.org; Mon, 17 Oct 2022 18:03:47 -0400
Received: by mail-pf1-x432.google.com with SMTP id y1so12346855pfr.3
 for <qemu-arm@nongnu.org>; Mon, 17 Oct 2022 15:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YSDH4zi0/StRIIVDTOoiOmf50RC9g5KEf1ziWa+XPf4=;
 b=MBAJ+fym9fihkb1CJfFyQtjhxu3Hb2s7dNnDGD5oDu6oQ+uRcz/Zntava8KpR3PnXo
 ObOM02NCGqJ+Z2hsa0XcrnZw7mI+P2QcqT+AxE0Jv4B4CjooGgkGAwhpe4ttKbx0uiUi
 xolVzTQUgI+jKOCgJnT++CKTZqyMbzn8/KEPWg4wnnuk7Zo89FxrLFA4hVpPESwZNAgZ
 Qy1fDKMTzCYMTY1x3rsouTw3bjfEsvens81xZcEhzOheiH8dgWpqLYndbITf7YKdoCJU
 TOfCZNOASdzXCGxMbugTu1L7DtuKcnDqo6/ryvYnFsL8LlQhgDqwg5jLkEK++8Sd5iTa
 d50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YSDH4zi0/StRIIVDTOoiOmf50RC9g5KEf1ziWa+XPf4=;
 b=q9n+mkorpdR2L9zjDDK+x/1QsMr0hI8yEqmCzK/NTeEBcglMskHr37qDIbAib6Zr3C
 nH/IhFgD4lAlyunPnzNLKfs1AKchpO8S3Ndd/hfIkeadDjTPvHRHQtGvg5ESjgEJDcns
 RQLDBC6a6WIfu7bBpO9XfnTRQhl99KA4RgMfJ0KJKDFpCQ9gaixDCxr9xCjXExVxYoUu
 MdY0YRCnkkxYWLwXzCXomcvzhZt6kL63E0O0wJqTg4pKrDRzVaWKnYTRB8UIf6byDnDv
 MKMcxEyfrifmx3P8aXb16hUIg+rubAmskYjybr5LUVnrk3fXRUp6L2CArE5Py6mrivo7
 +XOg==
X-Gm-Message-State: ACrzQf3I7OwJ3r0R70fKZ/OeSVZTjQ8sWQ12w6hGSU1RctZCZC+JxN6J
 WYinOKZ2nzLgNlbL/MfA5BXcfw==
X-Received: by 2002:a63:ed0e:0:b0:457:4a30:cb8c with SMTP id
 d14-20020a63ed0e000000b004574a30cb8cmr12169154pgi.161.1666044219628; 
 Mon, 17 Oct 2022 15:03:39 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 jg4-20020a17090326c400b001753654d9c5sm7093560plb.95.2022.10.17.15.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 15:03:38 -0700 (PDT)
Message-ID: <48d0c28c-30d8-56e0-7fb3-c074c2ea72e2@linaro.org>
Date: Tue, 18 Oct 2022 08:03:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 9/9] target/arm: Enable TARGET_TB_PCREL
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221016220932.274260-1-richard.henderson@linaro.org>
 <20221016220932.274260-10-richard.henderson@linaro.org>
 <CAFEAcA9i6gXEcQ2F6=Yq70iCx_XiRdHRu0V8pTEurXYDotmA_w@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9i6gXEcQ2F6=Yq70iCx_XiRdHRu0V8pTEurXYDotmA_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1GxJjfVpD1YO

On 10/17/22 23:48, Peter Maydell wrote:
>> -    if (use_goto_tb(s, dest)) {
>> -        tcg_gen_goto_tb(n);
>> -        gen_a64_update_pc(s, diff);
>> +    if (use_goto_tb(s, s->pc_curr + diff)) {
>> +        if (TARGET_TB_PCREL) {
>> +            gen_a64_update_pc(s, diff);
>> +            tcg_gen_goto_tb(n);
>> +        } else {
>> +            tcg_gen_goto_tb(n);
>> +            gen_a64_update_pc(s, diff);
>> +        }
> 
> Why do we need to do these things in the opposite order
> depending on TARGET_TB_PCREL ? If there's an obscure dependency
> then it would be worth commenting it, but it would be nicer
> if the semantics of the functions were such that they didn't
> need to be called the opposite way round for the two cases...

For !pcrel, we can skip the update to pc in the linked case because the destination knows 
the full virtual address and can easily store it when needed.  So we skip the update when 
we can simply to reduce the dynamic instruction count within the TB.

But for pcrel, the destination cannot easily update, i.e. with just addition, the full 
virtual address without it always being up-to-date on entry.  So that's the rule there.

A comment, then?



r~
