Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3880405lfg;
        Mon, 15 Mar 2021 11:58:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEUevH8XZmQeiJruLi86hM3RfHWzpi8ZbDCnnqp7FwRsqCqCoaUDqoJ27W2x1UYxTCkAZH
X-Received: by 2002:a02:7f8c:: with SMTP id r134mr10823475jac.95.1615834709694;
        Mon, 15 Mar 2021 11:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615834709; cv=none;
        d=google.com; s=arc-20160816;
        b=hUwi3HC7d+vO6JnIb+jLm4Ir+B9zxeAAPfaqgJXKSTmQb6ysTy2VsaJSIR19NSkaSv
         6V01QyGOLrv2dLonEoUSEeBqydOL9Q/kghIVbf4uACE1MeM25+LgHM3d2hsAGr35cCVz
         KL05rnRg/ZtzgY4JdaYnNKshNYghMjiz/GRqbOS0kNy5TliCSUU1bXCsSLHSF+eXp7lA
         0LaE0RfFS6PyKQEE1POcrcR1Q+eWzr9nNtiXUo50VGErZKp8raiPALmYsmTJ9pQ1CJBE
         OS4zEyjMbh4Iyr+VUZa9b15wePh0qXMEL0Te2tWCqoXnzyB4BunvPIZL4gMfus6y1Kqr
         q3sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Ll1twSIfXiyVJ4dZR2FAB4DAEuKbXE8Bmhu2sOphazg=;
        b=JlMdusnqw/ghrGWaeWrD0CiwcJD3reKkl6Gzp/jjcXcGdGTtB0Z17OQZJbueoNk01t
         82OtHdsdafes8R10KuKhOuxRuto/Q3tmRqZE/kRfx5qZeAM9U1721Vn4wojZ2FExYigd
         w4HvvnpAGA70MuttYzjhfvnv2+31OYyNxFGPAKkFG0hn5bf//q5UzUH9OVybrlN4y+4a
         5lOVasynXydfMPVvJ/vx3C3VK376BqKKZfwym/dF14btCRDXfu+WwJwQxWLcssXKFtTt
         8Rpjn4sBp+o39h7udsI5wamr1MmQiT8QHkuM3ie1l54opNZ+ccYOspKkITdeHInS3HCo
         ScQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lUx/IkVz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1si11581167jak.55.2021.03.15.11.58.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Mar 2021 11:58:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lUx/IkVz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lLsQ8-0007Ir-Sd
	for alex.bennee@linaro.org; Mon, 15 Mar 2021 14:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsB3-00015H-5M
 for qemu-arm@nongnu.org; Mon, 15 Mar 2021 14:42:53 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:40875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsAu-00088f-DC
 for qemu-arm@nongnu.org; Mon, 15 Mar 2021 14:42:50 -0400
Received: by mail-qk1-x730.google.com with SMTP id l132so32718207qke.7
 for <qemu-arm@nongnu.org>; Mon, 15 Mar 2021 11:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ll1twSIfXiyVJ4dZR2FAB4DAEuKbXE8Bmhu2sOphazg=;
 b=lUx/IkVzd6183VeQv0FHckl/2N7b5AmCy7YimVM6xsxpOdZRabM/NiFvGyi1IQBrdw
 VXbeI1s743JzBDk3G7oN08Xpz0T5rrVp18mGVwPsgyXwCNLQvHAutregxdBMTsDWOKuO
 KWXD+suj1dN6fYQXl/EZYdUqU05TYU/Sz0eQIvFcuNlYNgdBqfClNonq+jg1d2fQGPpW
 b4Dpw9cGrrVyJH7qNRQ7y7cx9rzNMGTfE/RLvqIx5+rAYOgQVXO7unUWN02dIHOmPqwj
 C7zq9R/NYC13yPOiB5eHvi0jTE9h4qRzdXwnQyA7xAKJr8PXG22LfTcpdk0gTYWnVkEg
 /Wdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ll1twSIfXiyVJ4dZR2FAB4DAEuKbXE8Bmhu2sOphazg=;
 b=i0aY+oGpWavusenzOBVdKnhqg7HKteM8Xl4ztwQaYaFcSBD8nBqNlYfV4vn8wqNOoH
 v4awOo+VTAtI6BFD87tK6cK+p1xowMC1Hh370LY08QneuB9Kme3571Hq2hP2aikvFd9T
 OBdYzONu1Khz1nfGeZReuu6Z8CUEqwDYD5sRmMGOuT+gnKwYSaXsRlA0JwzTD7NG/3PB
 KwRdbIpYH46FPTmEeV5SZFD0Y6lcAYlPkcki4C/3voLMVD6X44GeIS0gP6ZkHxmpXoXg
 crDxIm54zODMFggm265fIXCCjRE9+/xD3s7fqvJMNSkPyRrC/Mdsl75K03KsD7Zk3uEq
 2E6w==
X-Gm-Message-State: AOAM531WM6y1pBJZbdVMjVCOSqTVW7IWZdOzQ4tCbGMBJ+zsCvBVgdPm
 ftlnEiCqS3ORISwl2vSNt+lHBg==
X-Received: by 2002:a05:620a:16dc:: with SMTP id
 a28mr26435176qkn.442.1615833758043; 
 Mon, 15 Mar 2021 11:42:38 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a14sm13143044qkc.47.2021.03.15.11.42.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 11:42:37 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] target/arm: Add support for FEAT_TLBIRANGE
To: Rebecca Cran <rebecca@nuviainc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20210310002917.8876-1-rebecca@nuviainc.com>
 <20210310002917.8876-2-rebecca@nuviainc.com>
 <3930c2d8-8972-0acf-7a48-71803072a559@linaro.org>
 <a1fff12e-eef3-f742-be40-3eee395972e7@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6edef34b-215c-6c18-1400-16dea21f4555@linaro.org>
Date: Mon, 15 Mar 2021 12:42:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a1fff12e-eef3-f742-be40-3eee395972e7@nuviainc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yBL3dZgPkwzi

On 3/15/21 12:34 PM, Rebecca Cran wrote:
> On 3/10/21 12:24 PM, Richard Henderson wrote:
>> On 3/9/21 6:29 PM, Rebecca Cran wrote:
>>> +void tlb_flush_page_range_by_mmuidx(CPUState *cpu, target_ulong addr,
>>> +                                    unsigned int num_pages, uint16_t idxmap)
>>
>> I am not keen on this interface.  I think you should take either start+end 
>> addresses (inclusive) or start+length (in bytes).
>>
>> Using num_pages, and as an unsigned int, seems too easy to fail when applied 
>> to a different guest.
> 
> Do you mean pushing the knowledge of the number of pages to invalidate down to 
> cputlb.c?

Yes.

In particular, your interface does not allow a single call to invalidate 1/2 of 
the total address space.  Because the type for num_pages isn't large enough.

There's nothing else in the cputlb interface that is page-based, except for 
"flush one page", and I thought that either

   target_ulong addr, target_ulong length, unsigned bits

would be a clearer interface to use.

> Because I'm thinking there has to be a loop somewhere that 
> invalidates each page if a full flush isn't being done?

Certainly.

r~
