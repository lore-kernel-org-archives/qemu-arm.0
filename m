Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1373572lfb;
        Mon, 19 Apr 2021 10:39:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwosHsK2wCkkpXdf5gJayHEDm730lB/UE5RRS60JWYpZjv6Az5MZxcIzg7wu2H5u328bKSP
X-Received: by 2002:a5e:9316:: with SMTP id k22mr15208205iom.160.1618853988286;
        Mon, 19 Apr 2021 10:39:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618853988; cv=none;
        d=google.com; s=arc-20160816;
        b=Di2eSADI65hP/IIn07KjAblioL+a3pJknt0RjABc8VmlHGKL2mTx4JcscYmE3PZF3h
         +ixk0hOoUqZHtcgKl/+QHWrW7snB94cPyMYQiDYbspaA19Nnl7LUuAzozNZqr+K7jNoO
         gM3CfrZ6jvyvP0CQ1WO17znt97JElTxoyhgdhi7LqcwF0k33XBJV2W0aQYiletQqilyH
         WgQ0szCc1bLbWi4gUxyPWdC17AePP+s+2BWrNg+WvA0KxoYIRUTdplARYCwFqk6I+/6L
         TVXGJlnBFNkRKLjL/uV2/ue1cYyeYYQcl6Zmgoo95khZB1jxoVpnsWCcjZCyVq+fYns8
         SWfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=YLvn9Nt2e6/wyC0+bTf0onzCVTduNJel2budRDmQOyc=;
        b=UQPjNUQ+ox1hEE+db1hEI2crj/Cj08Ev6ASLFIbsFWkwSzv1SxJ2tY66uxqbCVen5J
         z/xbdOu40+v+zpp9syYxYpeNOwiuASJcIOLXIT2GF/0DerYdG6e2r5q06/mt4I8s86kg
         7njVx7Mpbl4tiYzInOZ8h7z2Rc5lWIXw4G64e/uBNQXUJS+7uoEgD4VcutsCJ4NgrjvB
         D85DH26UfxPF+9Y3V7SuSR3A55b86yMgmofZnj6lF0ROJkL46BvGTgR4NbjGnlPfIeln
         dsI/xQaVYVWBFWt8seEG+jQHKItdmTBJT1/ZzgOTZU2AOdQeSLmb3C3wuInebiweT/2W
         ywNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=p9gpDJio;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19si13554687iod.32.2021.04.19.10.39.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 10:39:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=p9gpDJio;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYXsB-0008Kr-IB
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 13:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYXrw-0008Jo-2a
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 13:39:32 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:38720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYXrt-0006Gg-Kz
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 13:39:31 -0400
Received: by mail-pf1-x434.google.com with SMTP id g16so10381463pfq.5
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 10:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YLvn9Nt2e6/wyC0+bTf0onzCVTduNJel2budRDmQOyc=;
 b=p9gpDJioTiPzAEma0fNWdzEHuVPh7T4z6sy5+p0CRChnVVX6qM8Pe1/rpBFkVpBFji
 Tp3ZWO+jGbdEH5vid+k4CqfIAEk0urZPlAUC3Tio7bxgWKmtnpIBp+XNQVfthBsBJqnI
 mzWbIZEM+SbdEKGsVsU6ylBywcCno5rMpG4DhTyWv5zL7s9S+MlhGbz493QisHVWc3eh
 d9v51G2dd0xeRraW2ByIzLNn53l8zVMAl0uqCYCrbTsip+tK/JfaAscUr9vbEfKH3uVs
 gfcj6FU/NNNIrkv1fVyeJbxLRgBpOH15fLbwkppmh+y4t8TkoDC0zidlSEodYNVAcl12
 IRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YLvn9Nt2e6/wyC0+bTf0onzCVTduNJel2budRDmQOyc=;
 b=NIl3vCB/Z3kAP+J/uiPxore9UeVeyfoZ1AIgS6qDcBjrCpQJ0fvpTX7YCNBLk7uPn7
 umKElGnFtlVlOYqhgD7ZN87kcsFmgQzTEZAjRJ14W08WL6ts5aJM+xG+hUHNICannAOT
 9g8g9A8mIv8CNAhG0Of0vFmPETPiI5iraV74ysK2FLA8/PDxoHX6MjqzNhmhVduL4DIA
 VgBJaSz2irfUoaCNubh7LWlpD+lSnr9uNRxAToUAMYr7qPK+CBk4Y63OQjSwUD/3BRrT
 9vO0AyJ99Z+xRsPxJDQPzP3ZlmrjRoH8tM4IwtY1O+ZHnHmcPSv2G+gpJ7EBY8JbMZmb
 S9vw==
X-Gm-Message-State: AOAM532u/TpsfuWIgCkqqsfQHh6TSXDgpMxz1VkZm3MyyOvBa+KeLXov
 nesExhrn/N9nilM83dllIA1vjKBZ39qDyg==
X-Received: by 2002:aa7:8d4c:0:b029:21c:104b:f6cb with SMTP id
 s12-20020aa78d4c0000b029021c104bf6cbmr20155659pfe.26.1618853967954; 
 Mon, 19 Apr 2021 10:39:27 -0700 (PDT)
Received: from [192.168.64.62] (50-78-183-178-static.hfc.comcastbusiness.net.
 [50.78.183.178])
 by smtp.gmail.com with ESMTPSA id c23sm5393955pgj.50.2021.04.19.10.39.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 10:39:27 -0700 (PDT)
Subject: Re: [PATCH v5 1/9] target/arm: Fix mte_checkN
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210416183106.1516563-1-richard.henderson@linaro.org>
 <20210416183106.1516563-2-richard.henderson@linaro.org>
 <CAFEAcA_XdxxuDSi7nwwB2JPMYFDxJYWv7fv1f-ySuwWnTmVaLg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <30e8ad67-2d14-cd1e-af8f-a4286d4571ce@linaro.org>
Date: Mon, 19 Apr 2021 10:39:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_XdxxuDSi7nwwB2JPMYFDxJYWv7fv1f-ySuwWnTmVaLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Us4oG9yqarjh

On 4/19/21 9:26 AM, Peter Maydell wrote:
>> @@ -779,29 +779,27 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
>>
>>       mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
>>       type = FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DATA_LOAD;
>> -    esize = FIELD_EX32(desc, MTEDESC, ESIZE);
>>       total = FIELD_EX32(desc, MTEDESC, TSIZE);
>>
>>       /* Find the addr of the end of the access, and of the last element. */
>> -    ptr_end = ptr + total;
>> -    ptr_last = ptr_end - esize;
>> +    ptr_last = ptr + total - 1;
> 
> Code change means the comment needs updating, since we're no longer
> finding two things. Change to just
>   /* Find the addr of the end of the access */
> 
> ?

Yep, good catch.


r~
