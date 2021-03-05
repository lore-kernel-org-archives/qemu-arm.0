Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6725934lfg;
        Thu, 4 Mar 2021 17:02:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzS8x8Ls12t6G5iBpQLMrMarMkZhGs0J7xgmjUWTgoJCMVXIeGf1BfazVhuJ7AIQR1PslDq
X-Received: by 2002:a1f:324b:: with SMTP id y72mr5072327vky.15.1614906125637;
        Thu, 04 Mar 2021 17:02:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614906125; cv=none;
        d=google.com; s=arc-20160816;
        b=oVDOvxrVsXgBo/4L3BIv+Awr0KUIPKyuvjaYsfQOjzJbSvP+r5csouYS6yYyrc2Nf0
         CCrYZrk/o55dSGxW6nHE0nYjnWlqCYdZL4zWVFzQUXdQU8Qh3xPW4sRHnAyhxLAljUg4
         tvTklSR1FRU9j42bdFxstj/NC3gXiOnM+vJMHiSYWcs1JHh/3lPVdiRGfZrNFlR0j67h
         Eomgfl09OqwEFFEuGb9xXZFL+ocP8q5XGTw1mpC3lddGVGA+Iejn2dbMXfdDebxycn/I
         cg/L0VFz0VaY48NCQyDWKySM6unPgBGwV+py7tKX+5mBE6BJNo885x6f8hQbGBp/rx69
         2jAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=26ZkORpArUY3+nB0gzlG6aUCNu19Oj9RSQzSwutzoCY=;
        b=E1eM9D30vua9otu2pdCefq4Hjx4drqNmClY71qALjZgX8eR0xmJyO5YwGA/OM83Mgz
         vUVQCz7KDlxQqtmuDLzp+q7tPgGOjsFnAJsntQ506iZgDYYDW9IOw99AEMtk4qE1auUs
         NHJVnBixQaScWmCaiExSS9+V7hepWqMa5xq5SBIK64Ir45jAf/jgSdZugkx6Vr6B4Bfj
         dPHpQBbg+W2a4Tz9yVALIiHKuMFpy/r3mbwrBCOJm8ToEJYNmLP+3RkE3E5PbOFtLyLr
         1q5YdfMhmX+2J3u79y0NymZaDX7VV7TwQxQ7OndFAxLzloLL8XVRVTL/ScMukkEUwIFW
         Nlaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h+zC/k3E";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17si263920ual.228.2021.03.04.17.02.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 17:02:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h+zC/k3E";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHyqy-00013U-TG
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 20:02:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHyql-000139-5h
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 20:01:51 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHyqj-0007Mn-BE
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 20:01:50 -0500
Received: by mail-pj1-x1035.google.com with SMTP id l18so853659pji.3
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 17:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=26ZkORpArUY3+nB0gzlG6aUCNu19Oj9RSQzSwutzoCY=;
 b=h+zC/k3EllOplqdq0wyykUBdxmviXXuQxHgUxsBZgWnklyBOKYXbK+t/eH6Q+xWrSu
 wCsTf5+eX09DRlKNq3IWBGUHPS/P3D/aipu1L8NKrnb/mJMqDh0+OexZhBh8OIiGszqT
 OnmmSgSFIOJShXrapRPqHU/b8qI0scbXUvbl3onIfrHFq1TFiSfXXUVhU4KV0OQAoyRa
 aqoXFb5nMv64VUCKgNOQ4f7fLNZKaK5eW2+KlXl4dilaNFCpAtPD0gSn/LjI1yAxJmtT
 geoKHCVg2B3BsNJ/xpLcbH7ybd3ejs7XtjTRqf8qYEVbSoweiXrGEI1ZrlpvCCmArCdE
 w3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=26ZkORpArUY3+nB0gzlG6aUCNu19Oj9RSQzSwutzoCY=;
 b=lTGE9Fh/yYbAMdF5c9p/OK1cElZ84eOD+EPkjbWTZXtRfPzyxqSF5CXxj5fPyhbvwd
 OQzOf3rCtl9iF7x0OtAnGvTMgoAn0CwOIUgh+Gz2XWObw0kHT7BhnRcYz9Pg05lsHL7z
 Aore/xs7y7JuUFuPB9DxMEUSQ2Hk5OI99aCZ5txSVWQerxiO6OYcWJ/m4NuWrNN1bDpI
 TJUEiksnCjMbCCOFCoUjgV4Bf1miuDJ68XFczYrHHDXFUIkyfPSz75mfrLPFpgfw6ATj
 GzKWp2NkN23JIxVAGeEOtWW+2nNBZRKF+yZHD4uQ8ojsSS50MNC6F1aTmbKP9PyjfT1V
 XYOw==
X-Gm-Message-State: AOAM5323YPx+aUSJWFLBXxs1w1zCo9x1Jz4D4rP2QWzQm8rpOuP+Wsbb
 USd89RysQ3Agoke26+C2L4Zt6g==
X-Received: by 2002:a17:90a:8901:: with SMTP id
 u1mr7188604pjn.21.1614906105962; 
 Thu, 04 Mar 2021 17:01:45 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id x9sm399533pjp.3.2021.03.04.17.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 17:01:45 -0800 (PST)
Subject: Re: [PATCH 40/44] hw/arm/mps2-tz: Support running APB peripherals on
 different clock
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-41-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a38e3500-7c3f-4646-dcff-e97e496a4ba1@linaro.org>
Date: Thu, 4 Mar 2021 17:01:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-41-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
X-TUID: 4fY1lU7GKLNs

On 2/19/21 6:46 AM, Peter Maydell wrote:
> The AN547 runs the APB peripherals outside the SSE-300 on a different
> and slightly slower clock than it runs the SSE-300 with.  Support
> making the APB peripheral clock frequency board-specific.  (For our
> implementation only the UARTs actually take a clock.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
