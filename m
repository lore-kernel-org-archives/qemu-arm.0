Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp688285ocb;
        Thu, 6 Oct 2022 11:39:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Ix/qY2l4+TBOZax77HxA8YWKFBbDXE87B7mntx1KUp6G2iotJY8Y864zjYcTYSMqgOOLr
X-Received: by 2002:a0c:ac02:0:b0:4af:a3b1:3167 with SMTP id l2-20020a0cac02000000b004afa3b13167mr1039424qvb.66.1665081577219;
        Thu, 06 Oct 2022 11:39:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665081577; cv=none;
        d=google.com; s=arc-20160816;
        b=m1cbYRQpd7KG5OkNghN8MLAQvfPy0cUrfyu3V+OneS6FYrzTLvZKNZ/g5iv+QFAcef
         jcZ1PX1RrhPtJ17Hcnf95nl1S91ZaVcZkCjFAwEPbTEiG7GvO3NDEqt96+myQUwOqNam
         LZF4gIUAIDhgY+qTj9vVAfEolEdNUlO4pBpq9BW/Q68Lq7x6H/SZPIgnTQI3p3WSIPL8
         wrJCmtJPHQBFMGddfCzNSMfri2OFEB35r3cUN+b5b9O9wHwetRJS+2PKNF7Ib4HxyNnR
         EHUicW71ch6Ee93q4jlNockGePRRFFn9rdXkMryKdpPBRQGXbjL/sQw7huWCi9QziGuV
         13mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+f0Y2wC21n8RKDK7krwfLGSw5vsiktrZadwpKKzo6+w=;
        b=vfvrst5WlLTczp5j3Zwp08USwi5C3IJ6n0ARoV9mvi6UXe2MoDxFNMfO66/fbTOQlJ
         cdqabx+kaBQ7TysPVUG9qnvCF5FPjpqPRqKCdWzjhOxZ47Z1gi6Guwh0CifG28+PXCoK
         Im9pdMUcOYX9sXNUFpgUrcDgkD/2JH4BRLsXgrSa+kkhBZkZdgAG5ERDgmU2SDcBeWdM
         0wkLgB/p/CB7gpuPn35mUnrg1q6hrcqs/TkjZEI3JtZpWJpkgnmeekLQzXYjSus/qtWZ
         zgzTVhALf1OaW9U4tY1+bUpLi0BSnb+JPkrIPmGyS0mU/r4Bu3onCU2YlrGphxoVTKNX
         R2Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BYcuT9T2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2-20020a056214212200b004b1cf676e9fsi2418278qvc.318.2022.10.06.11.39.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 11:39:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BYcuT9T2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogVmS-0001XP-QY
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 14:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogVUH-0007Ky-3s
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:20:49 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogVUF-0000u6-F2
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:20:48 -0400
Received: by mail-pf1-x42c.google.com with SMTP id i3so2782577pfk.9
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 11:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=+f0Y2wC21n8RKDK7krwfLGSw5vsiktrZadwpKKzo6+w=;
 b=BYcuT9T2EpYM/pEkgHUglRQudhLH6kLoyqkHKesuLAPTmD7Zh7btrUssophkGQXoRp
 SO/gGu/c6jlKETTCmdN+nWTYkOBjIYL7F2LuLpCCSpCGdbZC+XIcHJqJbfghYY2nCIfk
 rF5knR2RebZmKQTQ+jRV7nQ94xAmojtoHeHKrW8m97/XxR4LsJMEZJxS+ZsI5L3Ub0KG
 CbvM2VAzo57rKr4c2TWe+QoycGOo9uglt6qBzmqot5wjatbBJ9gSWpl0vzZj1BlyVeYh
 OmhiX2ef0YMuihmbpHK75CQSOiRCpRwWO1Ug//Waf663p/w7ZOOw0qTkLJ2RNg4gpF4C
 Ay1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+f0Y2wC21n8RKDK7krwfLGSw5vsiktrZadwpKKzo6+w=;
 b=h2O+1qxD/GWFwZ4S5KcY66P1pAWo4oL9vtq1wuWU4t3Uzs4rjPURBVethu4zXHVzkA
 h9GmDsMul7ay/BHUtCnHA1tlpWesrof2SlmhuHRh6ZdaEgXdH52N1FZoAs+cX/x5+BbB
 iE46X+TALJ9dOAhdbj78dwitvqTy+HTMHg5O+EtQnfUC+jo19tkxdUPAsdOjOSg+BDSb
 6ThevIJ6YzCcbzB3L8FAtwWaZtu1eDGXQ3b+zgj2AHbsEM0f0XgKUPirfz2M8iUJB952
 IKoKqj5CdK4iv1gU/ocl133yeIcUt2JK8CPMBqUFvkedvIZctIxegbUVYlsNq7kAN02J
 bcJA==
X-Gm-Message-State: ACrzQf3ajUC4ThHV83W87/4kpboFF3m1pOrE1w/Rky4FFDsM6jwNDcCh
 jY6EbSfmFzbccs4J5t9TOdnuNQ==
X-Received: by 2002:a62:4c2:0:b0:52e:bd4d:50e1 with SMTP id
 185-20020a6204c2000000b0052ebd4d50e1mr1213982pfe.8.1665080442933; 
 Thu, 06 Oct 2022 11:20:42 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:bc82:8006:f19e:85e?
 ([2602:47:d49d:ec01:bc82:8006:f19e:85e])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a623101000000b0056164b52bd8sm8251161pfx.32.2022.10.06.11.20.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 11:20:41 -0700 (PDT)
Message-ID: <7339c803-8cfb-f2c1-bfbf-b07aa4f596f4@linaro.org>
Date: Thu, 6 Oct 2022 11:20:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 01/42] target/arm: Split s2walk_secure from ipa_secure
 in get_phys_addr
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-2-richard.henderson@linaro.org>
 <CAFEAcA_LSd9mPFiDHyofdHVq2kshiL6FjxNG2aSXXc8jkGb3vg@mail.gmail.com>
 <ed6e925a-ea37-5575-bc3c-aee2a887d5bc@linaro.org>
 <CAFEAcA_8Fc5033cRHp9rhgnX4spUsGNPxAdYRNtiE11Beg4w9A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_8Fc5033cRHp9rhgnX4spUsGNPxAdYRNtiE11Beg4w9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.435,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ao49jhmaAzRA

On 10/6/22 08:22, Peter Maydell wrote:
> Yeah, cleared-at-start is fine. But here we're also relying on
> the stage 2 call to get_phys_addr_lpae() not setting it to 1,
> because we pass that the same 'result' pointer, not a fresh one.

I clear it first: that patch is already merged:

             memset(result, 0, sizeof(*result));



             ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,

                                      is_el0, result, fi);


r~
