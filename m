Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1571836lfc;
        Thu, 11 Jun 2020 09:20:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5EW3vykdokkOigI0nFAOtzHO2/SheFE4TD0VwX7OKAFNgg5Ta6dEEowLKUzzw/tsrWk7K
X-Received: by 2002:a25:41d2:: with SMTP id o201mr15021668yba.516.1591892432378;
        Thu, 11 Jun 2020 09:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591892432; cv=none;
        d=google.com; s=arc-20160816;
        b=piQ5QkmhZAv08nMaqlTkULdxSQTL2PRRXVIH9zZoVrmH6J0TwE+e67zzgSmcfI9/3L
         UKbu1atsZlJk2SCp+MVF3Tx+jTI9Gpu7gx7pSc95wfIlKa+G8ACoI6YRktpnZT4/Prd0
         Q0mklLVThjPW+0CeuXzyPkqA3UtqkbA74mkgNxP8J22B76Rw/Y2cmqM57WlultnYXNc6
         lDul83z3CeGNPvWebliNxnjOyeSlFqSZadpSIr9akOkdG81ygSpOjJZCTPvlWlLzB4ef
         pZrA1q9uwiDhs6wDdQfAfn7KE+YLfjNyz6h9rz0Li69h1r3vmJx8kZUxjKfRRwtekmSC
         eN6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=7Zu0xo3avEWbt3KpCW7LHSm4MRzPIGpUmUyz+EeUMAc=;
        b=qUfLQZGv+dUOZklr+D61KshEpwQFP2xC7u4yyeBxeUyLZnDdjGLsqqBdy8waNpIFj0
         BQ7CxeONS+nee0ORF5KS7/AtuUaU8+aOHK2D5x6sm+IUbRHDXM23GDA+qgS29uPcPetJ
         RCOm0X1rpprMbxSWhpBlMFy12R0+htueyHGDqnZai1jhEeHLQRyz013J3CN3a9dXMKnj
         0SqCquyBlpVsn/rki8c0M8/1/V3+uW3HirdeI+BVr50H7dEocS4AkBSgSMPga6BEiUUL
         C1eXdczsyepDsteQ4T5L8RXxbqX551Y1qdDEGglnvS4DDOK3WgcbNJqR8I3Qq4jIn9/G
         UuKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EGMEBIj7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7si2592607ybp.320.2020.06.11.09.20.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 09:20:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EGMEBIj7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjPwN-0007MQ-M6
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 12:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jjPsB-0001gr-41
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 12:16:11 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34080)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jjPs5-0004Bo-Ku
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 12:16:10 -0400
Received: by mail-pg1-x544.google.com with SMTP id m1so2744490pgk.1
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 09:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=7Zu0xo3avEWbt3KpCW7LHSm4MRzPIGpUmUyz+EeUMAc=;
 b=EGMEBIj7FHF7+AJDv0qKKx0B5WDS4e+RGdrGILgCtENH8rHLZne3MX+AX1xhDKF/D1
 9p8+0Fm5uEN7Djs7o+Q00LgIUZ5McrdWGQFTLB3Mo40c2rHpawCb2DX7f83tHzkVjedf
 EiJ7o5eqGt9JyUBfkZj3TVIcDK/K0Ejip9rY+HGsoUpEhHdGOFhkdlDUCZ2FSa08Noba
 jDazNSQBAn9lJIEnKWm6TN3orOqQd7aHy2mRpZpcEaHdQljk5DBBzuPzAgoOZo7Ndx/c
 kBFEwtm+65BNMdWngxsjEKHgUtWxnrj+dS8MxKabKG0s1hGYAAR36q5IqM1f/MXgtPhh
 jK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7Zu0xo3avEWbt3KpCW7LHSm4MRzPIGpUmUyz+EeUMAc=;
 b=FBmeU9DcjSnDrtUFyDjUaFdAiID2xhg1P7vhkfFQousVQ7yzwPAswo4t0VOothOwnW
 y0WUF8Vlk2HIxPitHYCrq9txNUVC3zWSAGAPPNiodlhOaolfvrJdBDn/MbUBIrM+XEZe
 om4mIe95+Hm3mxgwbaYKig64BKqmsE2mp+w2f1qDb9Fx4tPj2EcTUDqHmEBgqcS9P3rp
 lMWDEl3KJ+cpZtXneYEPKXIkZbRoMyVbDNs8LgePnAeuHh4Qq6iNe/F9ygpAQt3AtL8U
 J6RERekUu3ygYTXotg1cIr3LWDN2nh3YsTTbigbKbX/Q3asAG80VGusl3JszahYrvmt9
 XIew==
X-Gm-Message-State: AOAM532TY0Qc4sc3JJT+uIhcHqNXe4OUFTMesN1hmE4HBB01qmhk0olw
 jXrGmyw95Cs7sy5CbHJibEiuNg==
X-Received: by 2002:a63:cc0f:: with SMTP id x15mr7111169pgf.84.1591892157542; 
 Thu, 11 Jun 2020 09:15:57 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id i63sm3305910pje.34.2020.06.11.09.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2020 09:15:56 -0700 (PDT)
Subject: Re: [PATCH 05/10] target/arm: Convert Neon 2-reg-scalar VQDMULH,
 VQRDMULH to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200611144529.8873-1-peter.maydell@linaro.org>
 <20200611144529.8873-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <771166bf-06a1-ff05-47b6-cc2fa63c66d4@linaro.org>
Date: Thu, 11 Jun 2020 09:15:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611144529.8873-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: TuTEj6u5a4qE

On 6/11/20 7:45 AM, Peter Maydell wrote:
> Convert the VQDMULH and VQRDMULH insns in the 2-reg-scalar group
> to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  3 +++
>  target/arm/translate-neon.inc.c | 29 +++++++++++++++++++++++
>  target/arm/translate.c          | 42 ++-------------------------------
>  3 files changed, 34 insertions(+), 40 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

