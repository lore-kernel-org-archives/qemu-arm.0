Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp2877897lfg;
        Mon, 1 Aug 2022 19:05:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4cA+g/6EFhu+47x+GbKIUcC7tNxR9Fc0CFI53BrFBEUIj2iHUI+9ZkSCGM7WJWSZD0b141
X-Received: by 2002:a05:6214:2aa1:b0:473:2cc2:63e with SMTP id js1-20020a0562142aa100b004732cc2063emr17022241qvb.26.1659405922278;
        Mon, 01 Aug 2022 19:05:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659405922; cv=none;
        d=google.com; s=arc-20160816;
        b=LvSxkWOxezvAewacDGC6xWlo1SvYYV7Jb8Ymp9TnkMO76j/hkEsiVjhD5R4deBN2dR
         VJrJE0noIUiSym+hwlgI7AvHSiZAtP2aoAuq8ocfNjK9DMqrFak4uLBUcp3eIq7UHaPg
         Yfzvv6CVicqf2Za5I18IqnH8tUL9KzQUgdHf3z8ImOP+0GYLrotKBNDp0y64xfrhcSNm
         56HyFpS1H0mI31SMEBX31dDZ6nna9/mjsoYk9k9VWWWM301VsEXGhmd7IJ62nFYxe2O6
         FzVyR0q18CKwLQZAD1MlQTMs2RGji1Pp7BSn4z6aRmkI0CZKSZVaE+q8CaH+vlYb3CZB
         hFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wQ0nu79kXZuZtfNWKFiQAUN093a9q9fkJa0SFWz6DUM=;
        b=gprlluNhaznVPUYGo3L3SpSR6MESw+Jau0davPQd7g+WR8tGRxlZdKykOvE+76H73t
         gzlDmQhqPVEZmN3BawDg7io0zWf/Lt3X3Vdm0Z4xfNk/jLJ3PF9nM0n9U7V/smfha/Fn
         A1YYDdvYkBMVx7s7c4J9iUCJyo/yyR181DDjbW/OljQt5U/4AbkUb0ycXj8aiCmPsBKg
         5wZ5Hyxf3sLpudedApoaAATyCU3pAwa5fmJpdPqSBtTCnL56eKmMgTUzhKNFjvK03mBP
         4aQW6b+dB3W/sMlkv3WCoP8w9diR3IyTcAEmeUpEO6BNalGb6iHr5XATnM32LtGetvIX
         PEYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IGAoKQmE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5-20020ad45c45000000b00474984321d7si8093942qva.318.2022.08.01.19.05.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Aug 2022 19:05:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IGAoKQmE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oIhHd-0004Nb-Pd
	for alex.bennee@linaro.org; Mon, 01 Aug 2022 22:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIhHA-0004K6-ML
 for qemu-arm@nongnu.org; Mon, 01 Aug 2022 22:04:52 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:34719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIhH7-0005Hz-JP
 for qemu-arm@nongnu.org; Mon, 01 Aug 2022 22:04:52 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 c19-20020a17090ae11300b001f2f94ed5c6so309951pjz.1
 for <qemu-arm@nongnu.org>; Mon, 01 Aug 2022 19:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wQ0nu79kXZuZtfNWKFiQAUN093a9q9fkJa0SFWz6DUM=;
 b=IGAoKQmEDK1jmCBDlcrwGWWTJ+ppvkGPWnjZDrSdlm1jsnYInJw0aOCmQdZJB+WNVC
 p6R0s8oJFHEdYfxjvG0MVHuD273qpIUeeOSj/U3cI1TcEHaUyYvDkIQXlYeqriw2wgvW
 D1v2t1uPfgqMQvzzxowki62C+sGelcc2O2dHLVrNpOly04dZ9hrmh4EFB+D5jG6PDMU7
 wpCjgG+TJ25JT+X8wTRRSIH/T2YIBJer5UsLrap+HoBxFTYhAQUE2pd9OdS0wj5u++qf
 4y+phHV/S3b93K+1WA0dC6etliTATck4hsaHfn0kn3eBrSE9ZLDyFCO1sOeTY88lh0jX
 vwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wQ0nu79kXZuZtfNWKFiQAUN093a9q9fkJa0SFWz6DUM=;
 b=QMcEsSvAWweeYV1V2PMk6v4u/x+QkZRgsNBLqPTDUDTm8I+eS0LIxau4kZ/Is8h7X1
 pVugk+bNSh1mEqh+OFCI7cig4e30qJbOMgH4IS5A4zf7cjNu7NEa5a+Mje4nuSVZiILN
 8UCveb4rVZAJfk++MOa2hJGTDGVqM6zX15s6IPBm7lOqrVry06M7ublLRV0UMUe9AeNO
 2r/MYC+Ft2zijxk/aFCKMuguwoYbxarvRBs7P1Knpz1CKnWGiGsh9cN7SfifDVMhAtRI
 3pq5/igWAlT3NW1vBrJT/MGyBLJ2Z1pP2ZydzLKy5tUqFsz2Ap/ZqtB5604cOcNMjqj4
 I97g==
X-Gm-Message-State: ACgBeo05RRvQ2Lq+xVZqdjxBftdFcvrWsE7S42R68pw1NjzhNc8JF2gj
 68mHgZdHV/uGjhVWE7l3WeelAk7YVhZqAg==
X-Received: by 2002:a17:90a:5207:b0:1ee:dfa1:afa9 with SMTP id
 v7-20020a17090a520700b001eedfa1afa9mr21474652pjh.246.1659405887341; 
 Mon, 01 Aug 2022 19:04:47 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:7e91:a3d1:2af1:8c18?
 ([2602:ae:1549:801:7e91:a3d1:2af1:8c18])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a1709029a9000b0016dd562430fsm8164159plp.120.2022.08.01.19.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 19:04:46 -0700 (PDT)
Message-ID: <e90020f3-b41b-2025-f56d-b440ef1cb56a@linaro.org>
Date: Mon, 1 Aug 2022 19:04:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/2] aspeed queue
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220801162948.1920497-1-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220801162948.1920497-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: iAhUj9nhUCz0

On 8/1/22 09:29, Cédric Le Goater wrote:
> The following changes since commit 3916603e0c1d909e14e09d5ebcbdaa9c9e21adf3:
> 
>    Merge tag 'pull-la-20220729' of https://gitlab.com/rth7680/qemu into staging (2022-07-29 17:39:17 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20220801
> 
> for you to fetch changes up to 398c01da9c8c8af5db0b2b4b4888c2bd27218230:
> 
>    aspeed/fby35: Fix owner of the BMC RAM memory region (2022-08-01 15:24:15 +0200)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * Fix ownership of RAM regions on the fby35 machine

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~

> 
> ----------------------------------------------------------------
> Cédric Le Goater (2):
>        aspeed: Remove unused fields from AspeedMachineState
>        aspeed/fby35: Fix owner of the BMC RAM memory region
> 
>   hw/arm/aspeed.c |  2 --
>   hw/arm/fby35.c  | 14 +++++++++-----
>   2 files changed, 9 insertions(+), 7 deletions(-)

