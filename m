Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4930242lfa;
        Tue, 8 Jun 2021 17:47:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8dMNrYgjKFVrtI+OESZswfW18oqlMqEu9V6KQP6MfLE8iAZ8UrT3A1trRz7pksi9rHF/8
X-Received: by 2002:a05:6214:d8e:: with SMTP id e14mr3243557qve.15.1623199661766;
        Tue, 08 Jun 2021 17:47:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623199661; cv=none;
        d=google.com; s=arc-20160816;
        b=sEkZzUTe4Izob7+/qBo4UB/etUn+h2PzfqvOytj21bzvSiFcz0+84hXwR0hqGXMW5I
         9U/OryYIDjEJxMXlsnD4ugGDVO8FrxBV+o6N09054bFoR1IqSPnz06Cdo5w44nk7dtcf
         S4hZcr6iiWDPsYbGOFmi1V3vgsxoqtAUhVEvqrlg6y15aJp6Kx/Jl8lsY5XNiSnuhfH7
         7s0DSXUHWvq7LaNOuqMAzNbP+5i4EcIkMLvPYRP7I9i0aBkc3qJY5Zm3XQd3sjE7xnzm
         MPBXMhBhunv8nj/48gC9h+1ERcDkwEejNY5q4y8xKQz5MpaqVkr1P3OdePtVjuMKW9mx
         EkJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1ykM6Z2utEQZ78tPW+7EqoYSum1t+Ou/k7AmrqdaySI=;
        b=qYwPrDZf1vUba7fYy/NsKvlXADJdVh6ziHtmRCxRG8P6u3P7FW/ObgZ/WTlwxJylPb
         ZFGFTH83VPdbMF+PhcexSL+dW8jyetZXIzpOjdMXxGgoha35r9mSyvZayb95aLss+ylW
         515bGdw8k69tNvmI9SBlb2SZ7uVRvp/tyWJfKP1xILhlX2tBrisGM/a3D9HDIVIj1LZc
         GJqLn511yVqg8t82BOqPhLbWV7W5AvG/52VWzDiJES6e2Nqj5B+w7mi2cz8u+6cMz+Im
         S2EoVLplSM8BAO9s3BcIEz1Q7J+xLyXhAnUfNh/kkt+3GxVFOWEzlk/OW1ZW1wUL6LAS
         aqAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zXlm4MR8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a22si940128qka.280.2021.06.08.17.47.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 17:47:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zXlm4MR8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqmNh-0004JH-1A
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 20:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqmNY-0004Gc-FN
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 20:47:32 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:41970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqmNW-0004Tn-Uu
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 20:47:32 -0400
Received: by mail-pl1-x636.google.com with SMTP id e1so213996plh.8
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 17:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=1ykM6Z2utEQZ78tPW+7EqoYSum1t+Ou/k7AmrqdaySI=;
 b=zXlm4MR8dQpJ+uyZkYrp1plJi+7MnV62+6Egf7gHtlbYod+rESFPj8p692xLGpt2lo
 ursZ3IXAvRMVdhW+UCS/6xzizS/gGem62B/5vMvUV4hCBOv4t8es27oaOFiqtANkJSwP
 r72FDhIDqa14qCHb+5mWQ3ic/RD/xg3a+Nry5qACvZ38TFKMHY5YC4fYMbNd5UyfAthp
 tgElw6NqC8R6wrxT4lVetaxFZUDG+KvbudQJx1orZYb5+SxPV7UvZFZ4nFeXwja8eV9X
 /xPWoYDcWWwxajSv2/6N02K40/9eq0bi9FNFvTsvmfMg0Q1BJd8WL3NcOCoVeWMiWZF5
 HoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1ykM6Z2utEQZ78tPW+7EqoYSum1t+Ou/k7AmrqdaySI=;
 b=k7vpDJCvEY9Udj6GD2m6PaxiNozNye5zf3IL60fnzRk08Y6chVAWI3gXsLxljFcj0T
 pyEQ6pekwSPiJltK0GeyddZSj5kxZ1JNoJC+QTm1ZbGWwt+hM22PMCafe9n/8naOCNZ9
 j/cjTpdPjCDmbMjbSqELjKVQpD8XIrYD6AT3IPID4NlXAzLtyyZo6izK2crN8L4bMsqk
 5Oz7diWTghq0tS0yOW+ZwxAlasLTqDCG+IuMS/+SIeKTJYgQnlxcSh/WVqS/sMt6reRJ
 /q2LrNVpqeoz2fUtWTItOyeaKmP344hNsKBRuWb31PHYpB9VQMqAqUBcjLYjOqowEZPU
 0Vlw==
X-Gm-Message-State: AOAM531w9yzyaALELaouV/HxUfRL5M8iblgwSltVdLqxkVSrWRiasKT3
 OtAZvNjExAlEsI8gxTNt32b/gA==
X-Received: by 2002:a17:902:bd87:b029:ee:e0ae:cf0a with SMTP id
 q7-20020a170902bd87b02900eee0aecf0amr2474516pls.1.1623199649629; 
 Tue, 08 Jun 2021 17:47:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 x19sm11874531pgj.66.2021.06.08.17.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 17:47:29 -0700 (PDT)
Subject: Re: [PATCH 30/55] target/arm: Implement MVE VMLSLDAV
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-31-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5055566b-e805-c8cd-9549-66726701174e@linaro.org>
Date: Tue, 8 Jun 2021 17:47:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-31-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S/TnQP7q9zCX

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +static bool trans_VMLSLDAV(DisasContext *s, arg_vmlaldav *a)
> +{
> +    MVEGenDualAccOpFn *fns[4][2] = {

static const, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
