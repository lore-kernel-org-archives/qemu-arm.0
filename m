Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp732193ejb;
        Fri, 31 Mar 2023 08:53:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350a8o5IDFeyc96FRlkYdDfwpacT3JlJ5bzR7HN23Ce5QBMymoJ1Tpv8oKMsj28ixSXMUTUnX
X-Received: by 2002:a05:6214:500e:b0:5ba:168d:d3fc with SMTP id jo14-20020a056214500e00b005ba168dd3fcmr50508895qvb.4.1680277988104;
        Fri, 31 Mar 2023 08:53:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680277988; cv=none;
        d=google.com; s=arc-20160816;
        b=o+jkHXoVAQfrjiIryChx5tSL3H586QFwwFrqbss+CmfEGMGdzuAPaCiicgmq+HbkdK
         fndo8/F3yfEFr9anJw9XVKxQb3sd/6bj/BOv3e5ioXHX5PXaewXovkER6oUr9nTV29Me
         H8NBnoyC3e8yZ6wflrJDNHw1aO6lFSfXLvnMGT8pkvhTsyiKkhdevNTnqJGx7xY/kKFc
         VWtumIv3/c9LTzYlU6mNAv3qppfKPijhq9PfRv1oFOCcYtM/HGnWvCyR6048bm27a8f8
         JpmO6d41UX+ZOqLeTcBRx5uP3NX8MmVG/FuCRWZUitfN0/MxwCFZ0uAhZvo91axlZohF
         1IUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=bfdeVul6vDAmWGjkkF5VpPQlN0RUWNKkqs2Q9bedPQk=;
        b=VaijLzFRvSr5Cmu7z+685Znp/nY4iRxZo5rwKQF5khcOqXE2rICO6Smr//Wv45llPo
         eX+lQoj2krM7OopO0ag1BsjdTZ6o4iUKdRqlkaW4zDcZBNN/z5d3wSqgiovJ9zbVmyr3
         pHwParkEl6/jW+1yqbLtfDlzlCAKVXQjU5LC1L9DFP8ME2MybA+/N2nzBO/g3aKKDr9a
         D14LYATTY5+XF6IWLiMtgzIDw4dwll1E0sqe/91pk9pZoUt7xovFGjTLW34LGiEVbgyU
         h40SE9E61MwKjph7JUVwt2lz+M+BeVNywtruWW8vxAzcuoWUn+wPcO1ir/dQebjeoVCZ
         ZZ4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QFP+1nO1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv11-20020a056214262b00b005e14204a878si1605813qvb.480.2023.03.31.08.53.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Mar 2023 08:53:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QFP+1nO1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1piH3Q-0000yg-JT; Fri, 31 Mar 2023 11:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piH3O-0000yC-TD
 for qemu-arm@nongnu.org; Fri, 31 Mar 2023 11:52:38 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piH3N-0005GN-EL
 for qemu-arm@nongnu.org; Fri, 31 Mar 2023 11:52:38 -0400
Received: by mail-pl1-x630.google.com with SMTP id le6so21601423plb.12
 for <qemu-arm@nongnu.org>; Fri, 31 Mar 2023 08:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680277956;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bfdeVul6vDAmWGjkkF5VpPQlN0RUWNKkqs2Q9bedPQk=;
 b=QFP+1nO1u+MZYCJEK3KQr7aOPVYmFM6mg4OJCibeor1QVCnxOVEh7xBh5jrKu5TO5x
 IH/r4PMPJK2g9i1u3DpjYzgKrsAVZ/G+uwyR3K/F5CJdBrlAIxWIkdhbKuINWw20Nfj7
 YmbSIfgmYHHUERnXtpbQMGEf02Fuyw5RGsINvv0jISOqE2GNNEpsByn3UcH8UaeBIZ8p
 AeXWpDcmMaNVJLG1teeGjbbtzhQ59t5lBiymPTSKXgbruHzU9grDUjyVADYJN0QowEz7
 ZAI0P9Ek+3JDiq/xP8Mta4gSALR7HYaIO4pHkPFXnmr6NljBcrdkUQzkqto/jTLR26Lq
 7eRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680277956;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bfdeVul6vDAmWGjkkF5VpPQlN0RUWNKkqs2Q9bedPQk=;
 b=mo08LdBKW4HXuDl4uA8ktESGURv5yQTI6KgVrm0hdddvQge1pQjzgfhBvHSy7rFOa9
 riRWsUasBqTenCZQcbZQQLEpNtfXRm4Y692B+R2QxRPoeaUSmu3BCtpDVcBARFFhHWcW
 GrrfcwLILGrtwT41fSRSg2DgwBLkwJSrxQSkLs5q8sXOERC5ta2S8J1qoTFElpVa3hUh
 pyqmDgwHaov2fHmNCco3JdsAEPuabPjS3Y8b/za8OZ2QRV03g82p7mcJpEuHib2ScsUu
 JPTo66NvccXkRlreUi/6rfTWxntc2g035g0tEFzOxSAKhSPUHVZwlmGskchoGnJdzd7g
 ZPpA==
X-Gm-Message-State: AAQBX9fCY2sfqshDyLmSQ5impbLJr34MUkL/qCfz6wFxmCKPPQnANq6T
 J5DAhKO1NMrbXT43xEvDvsFCcg==
X-Received: by 2002:a17:902:e54d:b0:1a1:a90f:6766 with SMTP id
 n13-20020a170902e54d00b001a1a90f6766mr33792641plf.52.1680277955832; 
 Fri, 31 Mar 2023 08:52:35 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a631403000000b004fb5f4bf585sm1756108pgl.78.2023.03.31.08.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 08:52:35 -0700 (PDT)
Message-ID: <37117d92-1670-5274-cf3e-d542e8c530e7@linaro.org>
Date: Fri, 31 Mar 2023 08:52:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/3] target/arm: Don't set ISV when reporting stage 1
 faults in ESR_EL2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230331145045.2584941-1-peter.maydell@linaro.org>
 <20230331145045.2584941-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230331145045.2584941-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
X-TUID: fmNrLVA48mN3

On 3/31/23 07:50, Peter Maydell wrote:
> The syndrome value reported to ESR_EL2 should only contain the
> detailed instruction syndrome information when the fault has been
> caused by a stage 2 abort, not when the fault was a stage 1 abort
> (i.e.  caused by execution at EL2).  We were getting this wrong and
> reporting the detailed ISV information all the time.
> 
> Fix the bug by checking fi->stage2.  Add a TODO comment noting the
> cases where we'll have to come back and revisit this when we
> implement FEAT_LS64 and friends.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/tlb_helper.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
