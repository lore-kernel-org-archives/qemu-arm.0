Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp700040lfy;
        Fri, 14 Aug 2020 12:03:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVjvnqk3/TSOcsP6RbeX39tqJ0Y3Y3U0hupuozIiqFq/4BVOXlgZ5NqwFI1ogaMWSusX5j
X-Received: by 2002:a25:ac6:: with SMTP id 189mr5509677ybk.120.1597431817649;
        Fri, 14 Aug 2020 12:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597431817; cv=none;
        d=google.com; s=arc-20160816;
        b=JUGW6qgpS4OR/nLoCNyU8KePiDMovTZnSisi3juZvJdB1EGQGodiHCKX9Bj79ZfPnV
         Op6K9K7AQ7KuJXWsYnPfL1Xz3sAdkIf6xU9Q3kZL2wCkKPdPSaQzy33uRq+F+lmk/Sg6
         GR+GKXzG7oUOALwpP4Hvftr9r/Yx2hZRWe7sagBv72dEa6JZqUbLqFpTp/HOEMGiXUO6
         GfzTuPU9JLLm5NB3qrKPtNDXh+4H+2tRti5Nqss0/w0wrefK+D073zJu5eRb9jCyYjjO
         10RvPTcCrma7tzNuhwUTV/Gw7jiGGwsmpYiWXwSEGVDaPHLqD1OGzzK/Rv/lshKAdu2k
         FMtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CeVWo1oyLHlrkCpHXScojQj5RFMRVg5d2AH7RmCjzYY=;
        b=PAXa3oavpEP16p4Y0VJC5I457TXer6TAHnhxe2FmjgVpyqjGNCsZJfHORG6VU43Q82
         jJ4Xjwyz6EfJQgDPb4ydOOvsG5KSlC3p/HEDxdspSG15l6/mzUzUDYkhrLdtaU82fz+8
         xgysOKcXMu1rAJt0+85niQ3BKwX/HrKMTz1KO68TqySrIt/IVK0ayJLGPKKfckU1j82g
         DBH1QdYs1h3i4NfSSquu+Lk04Gegp1vSAvQCw9Hr71yD9luMXoPwVDTljwXpmT8cXths
         JlRGJGWfUESQXs0Vv6wfneS2+cue8PVv3Jbvw9PIeF4sjHryqEHVGmKcg476oomy5zf2
         0XTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Or4lqbqw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m196si9048068ybm.384.2020.08.14.12.03.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Aug 2020 12:03:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Or4lqbqw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6ezJ-0004nl-2V
	for alex.bennee@linaro.org; Fri, 14 Aug 2020 15:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6ezB-0004nS-3y
 for qemu-arm@nongnu.org; Fri, 14 Aug 2020 15:03:29 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:37924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6ez9-0002BF-GU
 for qemu-arm@nongnu.org; Fri, 14 Aug 2020 15:03:28 -0400
Received: by mail-pl1-x643.google.com with SMTP id t11so4595456plr.5
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2020 12:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CeVWo1oyLHlrkCpHXScojQj5RFMRVg5d2AH7RmCjzYY=;
 b=Or4lqbqwuVOuKCM0tL4c3quysXaXvaIz8OoW+Ivb3qFJ7orFklbDtGWnn3H/b6uUhU
 Ka2XXBuL7JQ/hC8FMYZglbmttF3bzpNByFPKoI++JL5r0wX3NPm9shLRvZXXDRMJGfY1
 aHVkNIxm6wB+eXnDAjLJk9yMdBSTZHwDNsj3s8OC7U1dpRuIAMu30V7M+OFxdtR0W/KD
 2psV0BXtxlAnGogQcnr39GckWpM4T+43H6/pxRWMomxPQvnATKobAiQ6xDU5Xo/5gKd9
 V02tf6wv0a+FCpQrdHnFvEbSYlAgLjP79LITt0Ti/PnCi3Z6GDTluR+NeyPmjLkfsg8m
 0mCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CeVWo1oyLHlrkCpHXScojQj5RFMRVg5d2AH7RmCjzYY=;
 b=OSxeDuKs8yS32QDCDgmVfQZiJldx6sdKyWZ6FClDnFeOjN/1SpLS/WyTKZiAUS52gg
 j2iIocWsOaAv0/CTuwtwJP+WVtN8tBlS+1BUaizW/rsN73cIh9FbouAqrymtMdQenzlF
 XUjjhAOF9Xg26yHad2KWcHQSevHUcxKF/k95wqKMHmbnTJVq3T5mH0J8fswVSOo0lrNk
 XTwVyYyLOKq+otx/3A6gRksQ0FEBdmWjyUaYs9c08g1g0hWUfC5iP54lOUI2qvug5094
 cbtq/I2t3cFJrbes21r+MLJEXYuuXvcYAgguVIMT11fzhUy/KRZ77bka3ts7XU5jr7+2
 uE5g==
X-Gm-Message-State: AOAM532wD58COgqU2zP2l6DaA5oohHB3N9NjN8eR0b/H2OsYhnFZxl9h
 WekZrk46KWXTvrV+mZYFYxLP/w==
X-Received: by 2002:a17:902:7291:: with SMTP id
 d17mr2928083pll.141.1597431805813; 
 Fri, 14 Aug 2020 12:03:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id s67sm10752350pfs.117.2020.08.14.12.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 12:03:24 -0700 (PDT)
Subject: Re: [PATCH 3/7] target/arm/cpu: spe: Add an option to turn on/off
 vSPE support
To: Andrew Jones <drjones@redhat.com>, Haibo Xu <haibo.xu@linaro.org>
References: <cover.1596768588.git.haibo.xu@linaro.org>
 <c4ab709b684bf6505a9721163564d2223d06c49d.1596768588.git.haibo.xu@linaro.org>
 <20200810105056.v33r35x6rex2ywdj@kamzik.brq.redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2259b091-369e-1090-1bd4-e09cf425ac56@linaro.org>
Date: Fri, 14 Aug 2020 12:03:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200810105056.v33r35x6rex2ywdj@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YOfR9jtq/ZKX

On 8/10/20 3:50 AM, Andrew Jones wrote:
>> @@ -1959,6 +1961,7 @@ enum arm_features {
>>      ARM_FEATURE_VBAR, /* has cp15 VBAR */
>>      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
>>      ARM_FEATURE_M_MAIN, /* M profile Main Extension */
>> +    ARM_FEATURE_SPE, /* has SPE support */
> 
> We shouldn't need to add this feature bit. SPE should have an ID register
> bit to use instead.

Yes indeed: ID_AA64DFR0_EL1.PMSVer.


r~
