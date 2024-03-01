Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1321093eja;
        Fri, 1 Mar 2024 13:08:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVgbY4AXbebsZ3o0oXiSv5be66XGksTZCPYGlCHwFPYN4AoB3v+V9gTSgrhriF4Tc+Hip5H7tVhfeAw3cq4faV+sTt+z8Rm
X-Google-Smtp-Source: AGHT+IGhnpdqPHxVTRaf5pMYcAcxi6g2pKBadrBb5G5Ogb9zaeWChIeSh7f0023mWsUStail0hyh
X-Received: by 2002:ad4:588e:0:b0:690:51b5:7475 with SMTP id dz14-20020ad4588e000000b0069051b57475mr5040635qvb.4.1709327327921;
        Fri, 01 Mar 2024 13:08:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709327327; cv=none;
        d=google.com; s=arc-20160816;
        b=GYPy8JSB7ZF1onsBiMO+NzgbCgE60m+m7vvBJpO1kXvsslBglsvt2w6RIn2ZR0q2ic
         gx6VyFlwiwtGDpOTJI/ATyIOdYT5f4ZO7mYSRNy5bVblgmphdiLtuTPgqwzp19oZKF4L
         3kEKPTZuQqYFfBYYbjZqP/6omrubj2ClYt0ioOhzKrlbrk0YByBE/NZK1ZVQOPBNn8er
         j6nRIK6QXiN1c2RfvYMuvz+y0n1YU2wbueKhYy1H0aypTbMbCtTpnOoFddfnPU/IT5V0
         smmlDkmQLcpPaLGnJigo3uXjuJd3tS+dRrDbxiYzlsrx5ahJQ/XpXx7cQHam4YCz71dC
         BqOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TGz4UVDmEifkdLH9N4nbvPrzT6XDUxPriUpEC0rx4Q4=;
        fh=NMNDyxTCQdIMtCwgdpBypSaIgfOE8JZg+SPY/GkzPbk=;
        b=imsIhyWFbUJuQHe9PyxP6XQPtOnnTa5dSc2v6rJNpTdo2xx3LdY+EVvhXte5OeiKBv
         Ofr+Ar+bdo8mO2Ptqsj3Z/InNAdtW5CZ6rkN1WDEk/kOwkbJrEzwXaWLUenFQvFrzy6w
         afxa3uiWVAMDCAeoJJ6G7UsVMFM5g9tsLZK3SAA5aprK0nyy8VptrS8O9Q6/OV/HikK1
         WSi9znssiryg6nSg4g133VKQJewN/9UQ+JrX8XRb5IVblaJOJiFH8DR37dQnotneKjV/
         0kxIt291cWAkb3kBaMuHHff0CxAjcFP0MXckMbaawuALeBAOo+fdVJQFCXyAqnRxXT9n
         7PHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wv1hIg5r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020ad45b88000000b0068ffe6c5191si4109101qvp.284.2024.03.01.13.08.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 13:08:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wv1hIg5r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rgA74-0000qE-A5; Fri, 01 Mar 2024 16:08:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rgA71-0000pt-Me
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 16:08:12 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rgA70-0004Cx-5W
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 16:08:11 -0500
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6e5dddd3b95so295180b3a.1
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 13:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709327288; x=1709932088; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TGz4UVDmEifkdLH9N4nbvPrzT6XDUxPriUpEC0rx4Q4=;
 b=Wv1hIg5r+dgD6unnbEnaf8+hSwU+iQ03uZVRbOCz9H23XSJ2fJV/RkcpjfqXIWZnAE
 tjrUypU4ZoDBlrakR8cCq7Fzfppatb9SiKWivVACs1LvyCG1ZaMKmL07uzk6ivS97wS/
 DEw7YzoYuZs1uC9R00JWkj+89W6w1q18bGPt4PpXHJTMb9S0z2OrpvwbKbHCzQeAyYYT
 w8Xaf9v6pkx31/UelrILBdLXUvuYpnbwKYdwXzeMKieKX8QtX2fXr+7Exa0398GAEBbh
 8BkMxCrw+ejUbaVe99tWXBRZTdaYYnt2sIhJXPVFIR4WDiESDl3I8Jlqw7o5JnRRo2go
 LHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709327288; x=1709932088;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TGz4UVDmEifkdLH9N4nbvPrzT6XDUxPriUpEC0rx4Q4=;
 b=Jlv6ueNG5OqTdG5YodD95JWfTagA//haBJsbzTV3Mv95WCp+Cj7B1qgmNxEsDwBMxJ
 1KaTBmySPnJaWp1fAbzUNJE6RLe0xpQ/2EXfmdJMWckRmJn7W5gXkp+vV/4p8l0NpJ+z
 qEfS9nWPT1NJtB8qTTNtpG6xdQobHTPuRGZGKU8Ga7YjDRIe7F/pWYuTkMoBIKzpYQNv
 nOeLUiOk4JF9j6qA+Av3LBiFL5kFKp4B7dTv0EKbf5RUCFh5Xp2f3gVCDszNoAKg9WEV
 vEdYR7P8h0sMt9BYvc/t+TE+Or01Wgj5QDZ1HXLqO2Ej3MOvz5RwJoOYnRnhbzmNAFzv
 3I5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX3enbSUrAb3Jn/w4xjOjnDLzCxc6vI5ORle79xzvxDqes753i1Rrf1hVCFCzEaZoPDQEBBKSYuYUle4Wr4jkksolS
X-Gm-Message-State: AOJu0Yx9UhW67hwFn5vj3s0qlzlRm6fPzzZ4zNr251K5mDodaJRYl58f
 ACJ257amH1pDjYs5xQTvRpKdUDbL40CeVGJrJMSijinvAgD+EecdftUHBf7DMlw=
X-Received: by 2002:a05:6a00:b46:b0:6e5:3434:d5e0 with SMTP id
 p6-20020a056a000b4600b006e53434d5e0mr4040467pfo.2.1709327288118; 
 Fri, 01 Mar 2024 13:08:08 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 d18-20020a056a00199200b006e56c8f572esm3496205pfl.141.2024.03.01.13.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 13:08:07 -0800 (PST)
Message-ID: <3f093460-91db-482e-8b58-3aa71f6d8e03@linaro.org>
Date: Fri, 1 Mar 2024 11:08:04 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] target/arm: Timer _EL02 registers UNDEF for E2H == 0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20240301183219.2424889-1-peter.maydell@linaro.org>
 <20240301183219.2424889-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240301183219.2424889-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 4cWIVGrtVoCf

On 3/1/24 08:32, Peter Maydell wrote:
> The timer _EL02 registers should UNDEF for invalid accesses from EL2
> or EL3 when HCR_EL2.E2H == 0, not take a cp access trap.  We were
> delivering the exception to EL2 with the wrong syndrome.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
