Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp81605ejb;
        Sat, 28 Jan 2023 16:07:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvPxmCZq8AoUQRJjwcwHawalYrAJORA9Op7SHqj/EOqSBt1FhBk/acMzOmfCjsv/FqTjqBH
X-Received: by 2002:ac8:5485:0:b0:3ac:57b4:8af1 with SMTP id h5-20020ac85485000000b003ac57b48af1mr60604636qtq.48.1674950864771;
        Sat, 28 Jan 2023 16:07:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674950864; cv=none;
        d=google.com; s=arc-20160816;
        b=SWL8yAojHbDfrOtbua8EZFTM5ecq+8pw+TyGVkdq4WuqsdpsUqcZ0m3+kjUfNB6uCL
         i83NlkYjlKqVh+MW3CypJPLMMFxTlt3j0lF58osqoGhLLTKcRLFUMLOSHg2VofaMIm5+
         Rx15bkJhhZeHohNXG/UTgB7nK5KbyanNisOXKvYwwKmZCkXBwU1bZrjX/0Lgpg6OWJ4O
         Krj52pto3WJo/l/Ny+Sm3XKnhhNw/cvdS00+Gaf+CsY/Hw0O22rPOJcNpSvIaCjh2Czq
         tRlfD1PxlvXed7EeP2Sfc864bSb75GfoX6ih+CHagkvxYM2Yz2dnFSWq0h7V6zUUgbF6
         16vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=k3FdDi8WJySA7s5UETVGBXB8zN9tMg58CyYsTHaFCDw=;
        b=kY8HraWm3gLTPyoC9RR+LT+qKx1p0FuwNyEOynka+WAH/9fmgbtqlhDRMg3A+hdeNf
         lmIYDXUQIbBa/wzyOAIxWNpn0i1BP03xY8JVMpmjRFPp9WtEbOERENJHTEe+h9tWkmZn
         WSb6DDHIt4+BwMpcldgsl7Wl3dg1/bDiE99FS7V2dRRC4jeN/CARZ0wv29/V7SBaTX6P
         Q3RKyjIDG5+Pq15syazbWidy5iikljWyBnjMnYYMFCt7AfJjJdAHIc3P0Hq5yZzDAjIi
         ++KIqVG2QZUQ/0hnztOORF4McPucnWQQGAHJjXlU6ev3sxGJzkTOXQBcRwwMh1/be3jf
         curA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=egK85id0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z20-20020ac87f94000000b003ab85b57870si4878031qtj.463.2023.01.28.16.07.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Jan 2023 16:07:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=egK85id0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLvEU-0005wT-1c; Sat, 28 Jan 2023 19:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLvES-0005qu-3o
 for qemu-arm@nongnu.org; Sat, 28 Jan 2023 19:07:40 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLvEQ-0000eS-Ks
 for qemu-arm@nongnu.org; Sat, 28 Jan 2023 19:07:39 -0500
Received: by mail-pf1-x42b.google.com with SMTP id z31so5545410pfw.4
 for <qemu-arm@nongnu.org>; Sat, 28 Jan 2023 16:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k3FdDi8WJySA7s5UETVGBXB8zN9tMg58CyYsTHaFCDw=;
 b=egK85id0wYEIAHROH7WWvfSXjoEXxOJkTCQDG7zTomXpcdvZ5z33immChF9+phS5P+
 gbyNqve21kL4VbMJU6YajX7AHeV48l8krachsR6T01/vYFBgOmrsaHsSJ7gRHRBvbLbV
 ZsO+T3YztHPRJBeiqK+2pB+FCtKua4a6mc3OCGnUkn11v0VPGSjx5WLRw9NoLabo+aTp
 KH3haqHgI0I7SD3f1m3cz6bPvtV2aRd4P2KjprD4IlkdCYpO0nDWBc5fTq9pTpNQi9d6
 mZEIGfr1alwBh1aeizxtYJyxD6+MmJxg3p4XFdIz+y9kdNND156bXOJQwEamEcopzK4N
 KbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k3FdDi8WJySA7s5UETVGBXB8zN9tMg58CyYsTHaFCDw=;
 b=CHNaTtXvieQJZsDa4HtbDipuRgvpA42ebsW58AVbc7Xno9j+tMaO+g+XZ4uq/OyiKO
 voo/UqYf70BhKSTNJm2K5wTnJ6w/vTKGvZnLVgxYzEl9rxahGI53jMNf/nl3vAsuvRcI
 XD6L8Ylu/nW8Kd8EQet/QFFY53xlyn37Zu045Ai08QkcidVLKXHc6EnxKNd7nfYK5gua
 k6E0eVsOZ9Xp4TkqwyLAWBmepZqDPjjiInmxxEEVi31ML8C86v/h99qf5hu/fpXYGtwc
 NQvGvAFh1ocKmZEqN0CD1489QM+nV6ntYDraWAymRx2GpFmde+EiRxQ8/7WFaVFMxowo
 kJUQ==
X-Gm-Message-State: AO0yUKXbhBJqaKBB8zyEzp2FAE+qpA47WXDzczQRJ7wuWG0D7VifHnIJ
 4HHqyhiUCUm6zdF1pHz5MwgE3w==
X-Received: by 2002:a62:7b08:0:b0:590:74f1:8c8a with SMTP id
 w8-20020a627b08000000b0059074f18c8amr12957930pfc.15.1674950856522; 
 Sat, 28 Jan 2023 16:07:36 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 t13-20020a056a00138d00b0058d9730ede0sm4779021pfg.210.2023.01.28.16.07.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 16:07:36 -0800 (PST)
Message-ID: <233cfd61-75ea-b0c4-bf48-8b632d4d85d9@linaro.org>
Date: Sat, 28 Jan 2023 14:07:33 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 23/23] target/arm: Enable FEAT_FGT on '-cpu max'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: IqdNHlCOhnCx

On 1/27/23 07:55, Peter Maydell wrote:
> Update the ID registers for TCG's '-cpu max' to report the
> presence of FEAT_FGT Fine-Grained Traps support.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/system/arm/emulation.rst | 1 +
>   target/arm/cpu64.c            | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
