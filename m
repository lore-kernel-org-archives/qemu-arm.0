Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4191899lfg;
        Tue, 11 May 2021 10:20:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw64lv9/blhJBjx8jPwtw5wQE5/JlLrF6gsefRHv+3HG9gEHEELkyku30dzSMgty+gASpWV
X-Received: by 2002:a05:6e02:8f2:: with SMTP id n18mr26029276ilt.299.1620753649626;
        Tue, 11 May 2021 10:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620753649; cv=none;
        d=google.com; s=arc-20160816;
        b=L2eGrQYoYbxJWcLYFp1MTL5j+jDgcXuFHzDfG8nRHMSnyS5wAiVjy5M2jPHwboLfmg
         mGysObu9z1wSTqjLG3vp1zeVTHBbcAfFBD74b8yWFa0H6eeKn+H2o3TBrFPcnmqG9yQy
         FTjAMCvRPeuyanK1bzEXJJ5K4+3zuMuU6gTEw5Jw7Eq5TsFEaoSs6Dhntau8wQpjnGmq
         WziKfFVF0VcWxAIhJAJbBLSSaWUVGonV5oID1aKMQuzEjuD7Rb2gwISm1fMKdAanbsWx
         s6FJtmkh1yLUOw8/zVs7o8h5X2sD83c6aiP1koow/beIbegDbuBk3eyKVbJRgVW/EX51
         f6cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CaE9gn3AVaxncY51ngIkNIadUHwWN1jk8eoUKCRdeDg=;
        b=gJwisHnNCZ8FCfrsvrtgUVsG2en4OYR5MbT6VNuqlyITRrfYiC5YMEqYNOnXrpB0sY
         xxBWBln7FrJ1Eq7S10a+qJuVv0SFHuqNorfJJ0oj5/CymXn7v9BXcJB0Tds7eRCkpSJG
         mEhKSrID8XnVQCpI5dJdGys5GalkE3ykyWtWxaNtgr8E/khH2n8ezKWtOacev2Z/4DiT
         P33x6M6doMhxjNEj2mPutftoWmNzFCuox669CF4eDHkPWdjVgMth0haQKcQevIvlto4j
         v89XHTNrcBTH4eXBrKa3oHmoe4m2kcMVeqZGS7y03q2lcgGC25fiSExbWm9DktNzLa6+
         gujQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PJMd4Pz3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c22si9300441ioo.82.2021.05.11.10.20.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 10:20:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PJMd4Pz3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgW3s-0006yu-Sb
	for alex.bennee@linaro.org; Tue, 11 May 2021 13:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgW3Q-0006wQ-TT
 for qemu-arm@nongnu.org; Tue, 11 May 2021 13:20:20 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:35530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgW3O-0000IT-G0
 for qemu-arm@nongnu.org; Tue, 11 May 2021 13:20:20 -0400
Received: by mail-oi1-x231.google.com with SMTP id v22so14823441oic.2
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 10:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CaE9gn3AVaxncY51ngIkNIadUHwWN1jk8eoUKCRdeDg=;
 b=PJMd4Pz3pWx3h2YO/LIyBuj6cX3HsiFmm/sJxdmVoKmb6qpgOIgAuEuI4hFFUJA/HN
 Y1BUuTAhTLNF8yC6zkmNdswvpwNh6nPT97RYAHjw7WHaxKYHfdX3B4G+pZ66fdObu6B5
 DTDlXFdxNb9Rem2/NCp58AYFVkLC9sJvAVDeme5S9FkEFgR5jUnQO4X4oWzbj+F/5wsM
 tOuDNJs76alSWXI6XgjDmnLOBaRfEWtBF8g7X9hLxuKX7Wyy/mPl9aD25vIY+oNWkuad
 vNNuS36BBNOSKo8iE8QFtsUcinEb+PKz0cCU/xrgKK65Kge+WN2gSbFeP5K+h7wUdryz
 lLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CaE9gn3AVaxncY51ngIkNIadUHwWN1jk8eoUKCRdeDg=;
 b=onlv7HdqYjMzYr+S5jKW8rjI33xSsW+QwOQVa6Z7i4tqA7kkeqgxoSUhKgolxgt+J2
 5hIEtymfXuT3l2Pg5J10ZjBcBEyUyobYmR0FG+pRuWnYCrD5pJsUO/a+B/RhRNvYyUXS
 JTNFtqM+PoXeov4K3rJFnWSKOOjg3b7l5c5ZfhOYFSjpPvVHAVxmig9QHxcQIVCqB++K
 qjBKLf207w8X71mv6ANsNdaqvGx2P9XliTCj82MPNSFNcpZGdCFHplCm7vFLchhfcbyI
 9Amr5qL3HQElWpi7PRSB0guJYgoj9Sk/k8n/Qxw45bRjZaN5zc5d8w/sas0e+ruFaH8D
 GiLw==
X-Gm-Message-State: AOAM530Kz7u9X3WtTSTcI3d1KhgFpZyZwBmzsg8QP8wZdIKllrJicoV+
 7PCegb3gq90YZNiIt1wM3HRXjaO1jU2cr+N0sNc=
X-Received: by 2002:aca:497:: with SMTP id 145mr9844434oie.108.1620753616909; 
 Tue, 11 May 2021 10:20:16 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id q7sm2440057otf.10.2021.05.11.10.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 10:20:16 -0700 (PDT)
Subject: Re: [PATCH v6 01/82] target/arm: Add ID_AA64ZFR0 fields and
 isar_feature_aa64_sve2
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-2-richard.henderson@linaro.org>
 <CAFEAcA8ovUnwOkvHWC8G-Dd38JUgpssj9ttDqi-+aCQd_1VkOQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <389776c3-6e24-92b9-253d-5a014a29e339@linaro.org>
Date: Tue, 11 May 2021 12:20:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8ovUnwOkvHWC8G-Dd38JUgpssj9ttDqi-+aCQd_1VkOQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /IP15ea2MoJ9

On 5/11/21 2:55 AM, Peter Maydell wrote:
> This code is earlier in the function than the place where we
> update ahcf->isar to set the "SVE supported bits":
> 
>      /* Add feature bits that can't appear until after VCPU init. */
>      if (sve_supported) {
>          t = ahcf->isar.id_aa64pfr0;
>          t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
>          ahcf->isar.id_aa64pfr0 = t;
>      }
> 
> so won't the condition here be always false ?

Good catch, thanks.
I guess I can test this running kvm inside tcg.


r~
