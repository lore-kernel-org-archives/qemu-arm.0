Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp4161992lfr;
        Mon, 12 Apr 2021 11:41:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdGuw/S8fyDUpAbHh09lU0O0mdjAqC7tCBam4VY/jvH9dhvmoSGTmpgKRqxCxzK4isWgTj
X-Received: by 2002:a9d:6c83:: with SMTP id c3mr7819552otr.64.1618252916029;
        Mon, 12 Apr 2021 11:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618252916; cv=none;
        d=google.com; s=arc-20160816;
        b=jwGbIyc7U/KEhefTmy4fhCI5gwWGucqQYE9XY8Vf3uR7ueMKM9RU0xdN5E+I32y/6h
         7jf+Ke1h3C04oxaQ6v9WJivzuC7lJgD5w4tmDloAc53Cdrh7OgcOiO4JHNsR53CyGhJo
         q+jwz8LG4bIXV37UkpShgR539RG/fjAbBeXz4sIeP7ZeJ6ZC7b+TqBHKzbFdaLQWSMpE
         bPbC3epRgTkHmwdL+ucoQjtnPOikVV8y1X4K6ihiN7tgUWKx7CU3bQ4Ay/dmy3+T1jbD
         jvK1ZwVTkErhH/e5JNevrcYn6GDSuaorjbZJ7R2jpzOOR8ebr4AXrWRH/Euraohs7Icf
         WP5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WXziLO3S5n8+rckARIQmh9FSj8oigDz1AM5WvNFYgfo=;
        b=u38isjoSIFLa6jpQ71PMbE2fvnJVmQJcMSDJe2jSe6Q2p3KldxHsrOoL+tYVqMOShe
         Wk2y0PjwUNDlxj1XKidDvcKyeBM6f/BPPEUDmPl6cizoQdlNuvvD1PK1KFa/FgMJGExb
         yTPeZwE2lLXY1+g3EuQNtxGP/eRhC8YR4OUqKpVVZm5jU88rxSijTklmYaTOMbQTB0Dn
         dv2W/H8ykz0DFNYhMzfp9s3IHz/2qCufPqNpJeOPRUmMIz/5689r9iNhDZmD77e5AHBg
         I+JkH+g3j5BGCmWJSNJ/CBDEpppF3NX5lqzn+Y1Sf3V2tJynRvK4JzNzj30/ND49Cx19
         8blw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h4RN/gei";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11si13651951oti.150.2021.04.12.11.41.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Apr 2021 11:41:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h4RN/gei";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lW1VS-0007in-Sl
	for alex.bennee@linaro.org; Mon, 12 Apr 2021 14:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lW1TB-00075r-VZ
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 14:39:33 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:34378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lW1TA-0003cR-Cs
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 14:39:33 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 em21-20020a17090b0155b029014e204a81e6so2373457pjb.1
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 11:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WXziLO3S5n8+rckARIQmh9FSj8oigDz1AM5WvNFYgfo=;
 b=h4RN/gei0tO9HB4DXhK2J9QINopt+0zMaVYxhiawfmiHjISak3z3dgnAsjel+Smzu1
 G/9y8X7/4Jf1koFyiA9RY4PS6ua3kFXqr404M8BO97jaJOa2LIC/hNLgCWI1IsmH3k7l
 okPRMia51BehCa/EyqxeA8p02j1SEfl0GMYffNn55lChUUxKCOH0O0vdS5Igah/4eivj
 GdRiPwgMPNSDNO/LxugfWWsNI7Rk4DEAOukIVDnlXx+KmlQcQWF41lGCdTJPtOUSvNA4
 XQooebH6Dk4rMw0SeXGpJ3ahYUiTS+vGCrcs9yT3Ko7hc2/1NRMHKjBzYMALmoWZfffq
 ZQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WXziLO3S5n8+rckARIQmh9FSj8oigDz1AM5WvNFYgfo=;
 b=bFvwHplrP3NRK89xOCC676wrhY3nJtZ0l/U2tJFu2yZ65AVO3DYL4G9IGgIOxaJIsv
 gzdG/G2wRLr1bd2wfiviMv6WuO0vZmwwKSHCDn2gdiZ9hZQVAtWBcIFNaLT9ESAsWBow
 ODzZgquYfMQldAG0qm+wTcTwp+weobIVCB1im+2niUnbmLZeYuLno9UNwm/mvJ4Os4fA
 9o6otC3xvAfsSuRikeqTlQ41cKFc4uJSE6dIoaiHSGslySvR6Uk6R4Mjhm1grRmESCFW
 xMxsR4vDj5BEALaaMLF/5KtJjDoXWaAUXrJwQ/Joql5F5eptcSqwsdUBdqT43jyj9NJ2
 jEYg==
X-Gm-Message-State: AOAM531i6OPTh4Pp7NmUh1fmmJoD51BPSo3CAyC1tG7fx8AoSbHBfPE9
 ugYvdG+5IoS/vH0wH2NzX+pwEg==
X-Received: by 2002:a17:90a:bb0c:: with SMTP id
 u12mr584006pjr.234.1618252769770; 
 Mon, 12 Apr 2021 11:39:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id y3sm10544202pfg.145.2021.04.12.11.39.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 11:39:29 -0700 (PDT)
Subject: Re: [PATCH 0/3] mps3-an524: support memory remapping
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210412134317.12501-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a8243495-e357-c80a-ef7d-30ae74ac05b5@linaro.org>
Date: Mon, 12 Apr 2021 11:39:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210412134317.12501-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NctM2s2uj7NB

On 4/12/21 6:43 AM, Peter Maydell wrote:
> Peter Maydell (3):
>    hw/misc/mps2-scc: Add "QEMU interface" comment
>    hw/misc/mps2-scc: Support using CFG0 bit 0 for remapping
>    hw/arm/mps2-tz: Implement AN524 memory remapping via machine property

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
