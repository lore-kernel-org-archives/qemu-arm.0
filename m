Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1170978ejc;
        Wed, 27 Dec 2023 13:11:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHq5Guc0z1RG+mFImtz4fWpilRsmpsen5oMU7gV1APfagc6AZD/rT6v/Gc/QLYrQhln2asU
X-Received: by 2002:a05:620a:a99:b0:781:17de:80d with SMTP id v25-20020a05620a0a9900b0078117de080dmr9468396qkg.80.1703711511243;
        Wed, 27 Dec 2023 13:11:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703711511; cv=none;
        d=google.com; s=arc-20160816;
        b=uBA1jdFV8ZpI1PoS5hnG4fIYso/0FfNY4xarhpBOGWSJD7ZzxCP8HNOkjL5sLsvhiP
         XcGXyri0tQnZbuM5GoFeD8/Fuk5nN17rMRpvulHmDHtax+31k+hqU7wAm+SdwQWH39ss
         S64irgeSQH0mPJMI9mY+y5jPgKoTWZkvclPnpxyZCevtO5Zg/3J/M0UcBWSqlWV9tbaS
         BhktMODJXQ20um3dRlmaD5wE5mJ3DeKxsK3lMlC92GhOQKXxNtnpnP18QJ58P7ZnyUEN
         uwOds7YoQWeV/R41z/E2SQerFeAgyfY5mxLbpseblc0JxpylS5OonTT9C9cvWuiKyHn3
         rprw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=kXA8OAYNk0kogjfz9fCzOHBuLqDotHgmBlZWJFA20d0=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=A2084ZmM6LsSFi27ps5ziSiwEE6xYLVweqMA7mswGuh+XXg8UjQuFkjM+fk/4FQiCA
         aRkzYNuLJ3Y/RvLCnPw1WNwxWEyChmfvyCy/klJKX3Gv36Tu6cxIUxYyNtY6ZZ9mTwpy
         zlYtTVbErxAQY0u0TUHEwYiYqhXVLKDCGelvAQI2OsXsAvYWvpM5/hSQz/pd3WYurPhb
         mFSOKXRJ7/Ur+opMZv6Yxf0gh4zeAPn8JH0ykVvfR4qbqlyH0bgdCoEylG+boHTOJfBL
         +JFHT5DUAshr3DWclwePS7O+ob7QebI+tVHu/FIEw+gdw1wzU9NVNVLrghqbub6afGAL
         aTmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X5aWNAEj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020a05620a280800b00778fcee30dcsi8713029qkp.173.2023.12.27.13.11.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 13:11:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X5aWNAEj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rIbBc-0001pP-R2; Wed, 27 Dec 2023 16:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIbBa-0001oS-G8
 for qemu-devel@nongnu.org; Wed, 27 Dec 2023 16:11:30 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIbBY-0007VB-RK
 for qemu-devel@nongnu.org; Wed, 27 Dec 2023 16:11:30 -0500
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5cd68a0de49so4011099a12.2
 for <qemu-devel@nongnu.org>; Wed, 27 Dec 2023 13:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703711484; x=1704316284; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kXA8OAYNk0kogjfz9fCzOHBuLqDotHgmBlZWJFA20d0=;
 b=X5aWNAEjNsu8CiMl51pb5OC4vbB6KTYZYA7blPTY+tN/eKGiY2HAhE+CqcJoUcFYZA
 DT/Px+2GxbBoIoo2YKbR47OWCyQPVfhOZ3MjZIdmD6wtv8orRMiXNJ269ZofJn3BU48o
 +N9o121D8kEG32F05fibYp+OACeHZslwU2D0QM40aTrFPwGBlr4aqz8tPAi9GW5CLSdE
 BWILIef9EGluv9EGCxtC+tX7wTghVFBcQtA9IJ6hnmBlQnQRB2qHErCYYxT2wgMWe7Sq
 Asxz1U/c+ke/q7jQ7TdimftlKEWvQPZyB7gWqtExAB1G+h5tj+SZhjt4FI/GAPWQ/sHY
 etKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703711484; x=1704316284;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kXA8OAYNk0kogjfz9fCzOHBuLqDotHgmBlZWJFA20d0=;
 b=p2K3ImWdL73+ykFxUOrrGSiN/0q0GzDN+secjqlJa6d6uw7kPAbVg+sUwKEgXbn5fS
 BJMm1GrkdvB3ed9bvnEIJ2V0z7aglyQWpK5BBv9KgOsZlzjfdr849sZ6ZycZrjeYnR8W
 bf8rgue3TIi9gO/MQ7RMkxd3wYGXLt4nqLE1x6xk4ihj5KfdpUbN6Z1UrDkmUSeZwjHl
 yW+rhhXBH7k//5N6Gf7UJVG8d2Rpf40U8aIkB+adWYKmnZ+MV0wbjNlp/tAvhWoGnoEa
 fiFnM6W1dNt7dO8k8ZS0fT27Qk1rgod5ejQPFiJkBiFb2/LaDfiLGuiHawAdelH+aEeW
 6Eaw==
X-Gm-Message-State: AOJu0Yz8QPw6IPxaSSq/vBx3ryRHX7GU+9En5rp/TcuD1Wblfj4U7m6P
 pFb7OLtWTO1YUJO0P5oUjKB3NES/MIVc/w==
X-Received: by 2002:a05:6a20:b907:b0:196:436f:a4cc with SMTP id
 fe7-20020a056a20b90700b00196436fa4ccmr306531pzb.2.1703711484164; 
 Wed, 27 Dec 2023 13:11:24 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 w65-20020a626244000000b006ce48a0b7c6sm12632650pfb.109.2023.12.27.13.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 13:11:23 -0800 (PST)
Message-ID: <d50ce2be-f1a1-4a43-856a-ea2cfbd9d2f4@linaro.org>
Date: Thu, 28 Dec 2023 08:11:18 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/35] hw/intc/arm_gicv3_cpuif: handle LPIs in in the list
 registers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FJ5Bi9YA8qdS

On 12/18/23 22:32, Peter Maydell wrote:
> The hypervisor can deliver (virtual) LPIs to a guest by setting up a
> list register to have an intid which is an LPI.  The GIC has to treat
> these a little differently to standard interrupt IDs, because LPIs
> have no Active state, and so the guest will only EOI them, it will
> not also deactivate them.  So icv_eoir_write() must do two things:
> 
>   * if the LPI ID is not in any list register, we drop the
>     priority but do not increment the EOI count
>   * if the LPI ID is in a list register, we immediately deactivate
>     it, regardless of the split-drop-and-deactivate control
> 
> This can be seen in the VirtualWriteEOIR0() and VirtualWriteEOIR1()
> pseudocode in the GICv3 architecture specification.
> 
> Without this fix, potentially a hypervisor guest might stall because
> LPIs get stuck in a bogus Active+Pending state.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Weirdly, I only saw this being a problem when the hypervisor guest
> was an EL2-enabled one under my FEAT_NV/FEAT_NV2 implementation.
> But there's nothing FEAT_NV specific about the bug.
> ---
>   hw/intc/arm_gicv3_cpuif.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
