Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5262161ejc;
        Mon, 6 Mar 2023 16:07:09 -0800 (PST)
X-Google-Smtp-Source: AK7set+O2OqP84Htzph2f1+2rvxnH/fVhYwWl5NQn0DGQhzTqNCCnwm2YJPrF61C1pIfwCSNjM3c
X-Received: by 2002:a05:6214:240e:b0:56e:b91f:aeb4 with SMTP id fv14-20020a056214240e00b0056eb91faeb4mr21606656qvb.36.1678147629410;
        Mon, 06 Mar 2023 16:07:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678147629; cv=none;
        d=google.com; s=arc-20160816;
        b=kcCFxZq0faI8ls2Rh6RxG1FMlNnWDUr2Y+zAePWVw/3jGg/K1qAYWiddV7n2vd9S+D
         +R12jHeiYWj9++hYWAv5ATkLb+u4Jx6EnB7O2ms6eMs/d2QgSWQYlm5h+AyxkAJNUClB
         DBPoNTTg3os4OKmJhGze3T6DfsjisTi/kzROWaxQmHzz3aeBPnUJrbROGSNYrJZrwFqA
         ctaC3hGhhgZ20QrXFDmx0YJeYh0sQ/7xOSFOmIEfB7QBCIoj5JabJW4J5TJdTXQuikef
         oTmfmqLemQ+EY31gQr95cdi/1Px9/78ji4dvIRw4bji8Jr77Otw+IuiHDN9QRSiryvR4
         UfdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Nb+nAnUz9lZ2/jjFMrEMj1uRP0x7SOJzhWUVneScKi4=;
        b=d5g532u9z2ZYO9UMvAYuk8lA3xT2POKXgWIpN7gGPL9rh6H9WW1nn1j4iQQfrkph9B
         fHiAeclRoESOnRBW/dWoSsbFHMBhDfKtTsVXfEhK0tBnzdXRh6DTynz/Ch8eVwyY7Nvv
         e3oNiqqGIXsuIfz4jjtSk1LDcNNkScQzDi3iHiaUNx2AV3UeMUtAIEbLi4lkiZPVZjAO
         Uo6rSj4y/5SE769a3uECVjvjv5in58pz5bdII93KoP4Tf5KWwEF7uOGdG9J8+R1stu4u
         P4XxxuaDzz88uC+vkUE7t4u3AFYSeeiKgGb9ol9h+PkltLfkQCZcBM3uq+CtPFKmTzPg
         xSgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gi7S3jeb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4-20020a05620a298400b0074281704b00si9223639qkp.575.2023.03.06.16.07.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 16:07:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gi7S3jeb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZKqg-0007af-9r; Mon, 06 Mar 2023 19:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKqe-0007ZW-LF
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 19:06:32 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKqa-0002zC-7z
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 19:06:32 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso9402525wmq.1
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 16:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678147586;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nb+nAnUz9lZ2/jjFMrEMj1uRP0x7SOJzhWUVneScKi4=;
 b=gi7S3jebaW3SVJ+4+JHxclH+diKQeSeLqk+01zywQzXBWuVGR6sJjNmNUf1Ze1xfUC
 Bkqm4iRW6yB8iekGxB9dPh9rS9fuXczBuQZ/Ajl4JkIAP4iW/f2YkNwzvdHJH3Xqv8sP
 FKQwgGsbXPtSpoCNzH1xjxOfsKQTgSgjam+D5+C5C5mR2b0BINUA4u+ovfkjoIlj8PzZ
 FdYe8n+pym09QuXCCYC1hk0GZP0lnKjYKDmLp80JrOXDUvzNEUy3ZdReNZfYVg4V/iVs
 QPyEmy6OB9/nfUH7wk8HOdb1G3Ywhtbz3vGQo03arl1ioGdMOd0gSmHqeRmHFDXnRmcB
 JSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678147586;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nb+nAnUz9lZ2/jjFMrEMj1uRP0x7SOJzhWUVneScKi4=;
 b=hJiBen8fP4hftRqlfacA+CLZxfepbojlijX4VGuqv2W5doIJBaCdYCoRTbQBH2r6WH
 h05JNgVxrdJFZxG2nQKDezYMGJHCLERTgqovePUfERwWSXJh6pbFEBf5Pt9H2N2Lb81r
 tGZdQueYQAmH8Mcl0kDW5LiYcCcOe+tLIgFc+RYyBFLMX/YdndqE5K1Nm/cN/GYfRrcu
 1VpvdKGZKWkx41KTzvlJbZFwz2CbzBzQlIkmRFPOJtQx7fkQhdwvMKB91JkZk8IIZDpC
 xC4q2IroGv/CDRULZHZ8nfA/HMBMr4HlN66gNzl2zGe5m/FgAhXpDf1oHcwA1NDFijWt
 +RNA==
X-Gm-Message-State: AO0yUKUPd7BRo3BUpvsxvDhhzO3wfU26QF2J2hnBGtEUOnLaPvkyAYvm
 jOQBjJUSyIQCBm0ME9rTbbAGxw==
X-Received: by 2002:a05:600c:1c85:b0:3ea:fc95:7bf with SMTP id
 k5-20020a05600c1c8500b003eafc9507bfmr11072206wms.30.1678147586105; 
 Mon, 06 Mar 2023 16:06:26 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 l36-20020a05600c08a400b003eb39e60ec9sm11040556wmp.36.2023.03.06.16.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:06:25 -0800 (PST)
Message-ID: <16684583-a3d9-1d73-cfd6-deff44379e62@linaro.org>
Date: Tue, 7 Mar 2023 01:06:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 67/70] target/xtensa: Avoid tcg_const_i32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-68-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-68-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: OGLoGJJCMFhw

On 27/2/23 06:42, Richard Henderson wrote:
> All remaining uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/xtensa/translate.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

