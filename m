Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp2248172lfc;
        Sun, 25 Jul 2021 11:21:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD4i5stSLX7BG7Zy+o9HJNsiY4LCyzGuheOqqFm2cHg2cBUowsOLZDWpLY7xKiPlQzUbp7
X-Received: by 2002:a5e:c912:: with SMTP id z18mr11711509iol.9.1627237269126;
        Sun, 25 Jul 2021 11:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627237269; cv=none;
        d=google.com; s=arc-20160816;
        b=Nx06YzhvbJbTeWh0tSvIymOqR/BPrdHVIyvNKJu9x0+sY72Hh4OW3gXx/RtytmeyJU
         +Eo9BH904ooGVoeDhJreDx/b1ijm67ytub2hWlF7cyCmsUUp/xS5XBC4qsDq8QrBNn9m
         hqknYPRt3eP61E+lugE7o7+8ZRH2GqoqK8usj/87KJ1qKrIokT4Nb7NALY1PH5ZTV+1z
         gNqVYrkuIuK3nE5MB0lfx0T35EJG0XQEZ2dSoM0QLVPhwfMW8OHUuimQNCqOpNzQtNPG
         vUNIOWzPujiCQ1MwRINDK/zeweeqBXjnKc7slZ22P4nVENI/VUFd86UFkxJrtY0dm4ac
         RWJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fcGxg3u7OME4V3UwAAbRoowicgb3xl9Tm+EGtnBySVI=;
        b=QAVPrBLlpcva4Vwx2IhWU4PPzbz9BDLD3eZWPPz9D5VZuyvRg3ZqZCXFmJcMFcu/Ka
         /jjdSib7srxYs0iGhjtkA7x+T89Ak6aWH3g6I3u+dIKl0z+gFSeZOmH0HpPcYNCchzFm
         pua3i4TT9rxkSGyqDKtpzKasVAjqTSzXA1NI9DRZ0mCxz/m99fMN2/rWA0ECDO2leJWB
         P7EI415s2cV2kbDKkaYbS/FJ2f2KoWDk4sG73xg5Xs7E7hiW7dIhfyY944UXaxsP3Mx0
         izxOa62C9mHquYgBpNhyRSyOJbHreEB29XRb9yfEiYJj1AZbTPR0mKRBDSMvwj9+uxfF
         nwsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c2Jca7Wd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6si40531128iol.83.2021.07.25.11.21.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Jul 2021 11:21:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c2Jca7Wd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m7ikO-0001NL-Eh
	for alex.bennee@linaro.org; Sun, 25 Jul 2021 14:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7iiM-0007ND-D3
 for qemu-arm@nongnu.org; Sun, 25 Jul 2021 14:19:02 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:37409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7iiK-0004Ku-Sj
 for qemu-arm@nongnu.org; Sun, 25 Jul 2021 14:19:02 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 a4-20020a17090aa504b0290176a0d2b67aso8028865pjq.2
 for <qemu-arm@nongnu.org>; Sun, 25 Jul 2021 11:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=fcGxg3u7OME4V3UwAAbRoowicgb3xl9Tm+EGtnBySVI=;
 b=c2Jca7WdEcyQQWuI5SmhyQq/DNXBIqXzKhp5TMcP+IlOaSVYFCgtfpIeE/w6/cgz/p
 11IxRVmbYSKRwjy2B4ACOpb3hEkl/gPRfT6OkqnerTMyrYFju1/dD43ly5D8zAcmrVdm
 8H0ky4X0Advh5lKXNHX55kvYz1KDZu3wmO21UHrjxsn0x4d+BA5hn7RX21NB1UeNfgzq
 hSMGfA/2VI/VWIDX/FHrIS22+8zdN2bhl/SiSNZy3Bg40USiy33Iuah+9kLRL6LlBjdY
 K3TdINWXziX/hQz1BUq8Y9rQ7rB/fFlUMRy2wO53jfgydMNZExeMvKuNh506zfZIClHk
 bgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fcGxg3u7OME4V3UwAAbRoowicgb3xl9Tm+EGtnBySVI=;
 b=f5olUROaEAYHor3nT+v66HIfBdklDZ62c8TZR+3HPWrMzP2/EjOhj+rkh1kfR+yfzF
 rxqAqfHN954EWIaBKCmPu8kUOFZAvRXjeIFgCTRIU7XAh2J0iCm3cxgMK84CvEhqPTFf
 KpH7wXpKj6uTKMjFvK/jKtXtaus3xPxoU05xJK2WS1UKL6uA1fDDWnqvT8MrxDED3Q64
 MLDbzmct5s9xMeqCfKmW6fTfenyCp7c/+3q/qmpwnFaoH6vg6a69x2N0oEZVgDh30Uqm
 ZhFJgWGh/If8A6N/O+yD1x7aIRXOIT/DmqFH+a5fxIbJBoMtKaQ5nh0xz0Q1lDUF4TEi
 a/cQ==
X-Gm-Message-State: AOAM530GNQ9yjIiIlYcYq5tL+lQLKyoy/FCW5O4JHcJWyqhiyYH/hmou
 m4yxq+yZYpVSdmTYDncXU85OnY9g9veJkA==
X-Received: by 2002:a63:5802:: with SMTP id m2mr14500926pgb.171.1627237139667; 
 Sun, 25 Jul 2021 11:18:59 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id k8sm30665163pfu.116.2021.07.25.11.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 11:18:59 -0700 (PDT)
Subject: Re: [PATCH for-6.1 5/6] hw/intc/armv7m_nvic: Correct size of
 ICSR.VECTPENDING
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210723162146.5167-1-peter.maydell@linaro.org>
 <20210723162146.5167-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9c84a86f-0e28-de6f-f770-65a0586b4738@linaro.org>
Date: Sun, 25 Jul 2021 08:18:56 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723162146.5167-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.091,
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
X-TUID: kCgGThWJ6ZPb

On 7/23/21 6:21 AM, Peter Maydell wrote:
> The VECTPENDING field in the ICSR is 9 bits wide, in bits [20:12] of
> the register.  We were incorrectly masking it to 8 bits, so it would
> report the wrong value if the pending exception was greater than 256.
> Fix the bug.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/armv7m_nvic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
