Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4956505lfc;
        Tue, 1 Sep 2020 14:35:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeZlbtCpzsQelShIb2J9LfHp1OlLMtfftPqCz1J/P6sgIHcwCL/vKc/rd/zpVQ1BpJns/a
X-Received: by 2002:a25:abf0:: with SMTP id v103mr5791215ybi.203.1598996109552;
        Tue, 01 Sep 2020 14:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598996109; cv=none;
        d=google.com; s=arc-20160816;
        b=LrvRkXdCAEdHwMhJE6jVdOgQY1/lWsmII1yN5Eo9YlV4H2PJ0r00QfHqr37JwxsFWf
         m5MLMDMkkmnKLMkMX0lVwSksXvy7jxkjhQ3t8lMARkXOksY+ahF9dmxLJB6pYajxwp83
         WuUmvM9Otma7VJ3ZKR7l/SYngE3X/jZaFjQtvCUMyTNAgTMshlFbZbkatunVDvQoOnbO
         28mPFNXQQj9wZY3t1WyB0UvNd+hm7xFmw+Mxc+V8TiFogvMTIR0CuCCRVvyZiHFWPLPH
         59iCq4DmzbbCcU0jIlWB2z2RNWrR4+o0xFBCHjQXHHoqHOWrQrJ4jkW4cNXWI+4ksmmD
         578Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=8nW5NS6j3gBAYiRTtVWo9ouAU2pPd4jJH8ZgD9DSfAE=;
        b=UwYUoKMrml4cQ2d0xrsALpg5jX4TGVDEbRAt1h3hnlau901y+iq19/WiLMHOarb4j2
         hUZWKb3oRwN3ThGc8yxooUdCdmbN9Wqlo2NaQXhuU0kr+yEfPDD688MHIpmPpGBxUyto
         M5Z0RPa6PDXDu3GEII/BkOjSdwaCNph2xSBNucCFOhXYWZ8+2F44nLHUEmuY02DgW3ex
         28vZbsIJ2RUoAlZ4Nq3pyXDgsr02vAgR4pgGcTR3Y81kdq/8HJ812p5/j7cFEAZTuJL+
         bzbl8gVNexCEcZCQ7WO9MwKo662CUbnlZo0P53V3uYQ4Nbjln8sDrfj9ypOr4IYLYDj+
         TC9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LsWHfqT5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w192si2168441ybg.487.2020.09.01.14.35.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 14:35:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LsWHfqT5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDDvo-00072a-Us
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 17:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDDv5-00072B-OC
 for qemu-arm@nongnu.org; Tue, 01 Sep 2020 17:34:23 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:36088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDDv4-00041J-7E
 for qemu-arm@nongnu.org; Tue, 01 Sep 2020 17:34:23 -0400
Received: by mail-pj1-x1041.google.com with SMTP id q1so1269992pjd.1
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2020 14:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8nW5NS6j3gBAYiRTtVWo9ouAU2pPd4jJH8ZgD9DSfAE=;
 b=LsWHfqT54oFHhrOnrcm30t3a56X99TKSJf6YvBUJWYwRpJ2AhAqX6o2MAzp0ifx2yj
 f86u1JQ49TV99FEidCqzggorYkOS90oY5XtLTYOHow6jd27V3XR2VywPp9O4VK/EYVia
 OQaDbSnq0yR2duBCD0l1CO0ICYzRYweOUW5s1ePfvWquAssGHOKsYagongJbL+MIlCvl
 LNpCQBRAjthJhaoenjsGWijxhC5zRW2J3/O8ZpFyDuu+qI/ltyDgwOa3sOhLoFj35kw7
 lS5UFEP8nPff1ZioB/4dUPeMqjCXxVEdv4eTiy+WMeTf8zLhepClhx2GLvI3pLDddjBR
 kzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8nW5NS6j3gBAYiRTtVWo9ouAU2pPd4jJH8ZgD9DSfAE=;
 b=lnZfxMNcPbHE0hByEvDansFxaRzAnvM7/PeUyHCCN+X1LbYpOxU66K4nkcmQ2cjOAv
 G+f/THSiBqSIfxMw6s8s95d9t4+VYVHYlecRlZs+Js/Kk6M1F0qX2HwCyej38Chh5zfN
 0xcg2GAqcOgZQWb1QhfuNCF6lYE6bMbJy5NmtASZitPhLTFTm8XODjsrLAs1aHMRv6SK
 cxBgnLJdV3z+vi4GIlcS5ZSVKH/f/Ut69/Ay3vk1MDV5a8SCXFrA/pQtG3qV+lu5OF2D
 kUqhNGjgnaEkOaWktjD28xW920KTtHAJwpWye4wN4604dSZlT8y89KPuEV1CaFMgzBAk
 qolA==
X-Gm-Message-State: AOAM533yJ/hn0qV1/LocfD69y12qnZQ/Ll0uHMouGEGMx+IHCIRhcXDM
 rEwxvct5BknQa3zc7S0b8lC7qb7k32/A+Q==
X-Received: by 2002:a17:90b:1b12:: with SMTP id
 nu18mr3380996pjb.126.1598996060321; 
 Tue, 01 Sep 2020 14:34:20 -0700 (PDT)
Received: from ?IPv6:2607:fb90:27d2:4b79:8545:2b44:3b48:7db9?
 ([2607:fb90:27d2:4b79:8545:2b44:3b48:7db9])
 by smtp.gmail.com with ESMTPSA id m19sm2391644pjq.18.2020.09.01.14.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 14:34:19 -0700 (PDT)
Subject: Re: [PATCH 0/4] hw/misc/a9scu: Verify CPU count is valid and simplify
 a bit
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200901144100.116742-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <451946a7-835b-1f44-f3d1-ac5a3aa6aedc@linaro.org>
Date: Tue, 1 Sep 2020 14:34:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901144100.116742-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.13,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uypWL82CbQfS

On 9/1/20 7:40 AM, Philippe Mathieu-Daudé wrote:
> Trivial patches:
> - verify the A9 CPU count is in range,
> - simplify using MemoryRegionOps valid/impl,
> - log unimplemented registers.
> 
> Philippe Mathieu-Daudé (4):
>   hw/misc/a9scu: Do not allow invalid CPU count
>   hw/misc/a9scu: Simplify setting MemoryRegionOps::valid fields
>   hw/misc/a9scu: Simplify setting MemoryRegionOps::impl fields
>   hw/misc/a9scu: Report unimplemented accesses with qemu_log_mask(UNIMP)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
