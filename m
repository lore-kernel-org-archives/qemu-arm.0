Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6558480lfg;
        Thu, 4 Mar 2021 12:30:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3d057WZpj9nTdOx8DJDeG+fsimSdhtAiZy9ap0jo5wtl9FLHg+l9rYUq2yq+YTINEm1Uz
X-Received: by 2002:a9d:6c88:: with SMTP id c8mr4964129otr.87.1614889829484;
        Thu, 04 Mar 2021 12:30:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614889829; cv=none;
        d=google.com; s=arc-20160816;
        b=NM6i8x8v090lBP/sxkRLIJ46CNAldOjf0hXu2D7i7bkJ89ujuKs+n18mEfh5UTdPZD
         oRFGE+T5J2/A6dW13yaKS59Nnw0c5rCbUdOoqulTHsWwxhHkO+eMxBqs1vuiFe8RPyEm
         95TaM0aOGv6dJIFY82YMXRhDcqTJC/6/v7bhNGbz8yDL9TioWJypFOoR1BdUNTxMlkX7
         FC9buoaK1pu4uahjU8AlSE474soJ0ab3usyDk6x3kHqodqUU0PIptLpOiOaDxMZGhRqH
         ni3aBgePX/sNGnsaciANajft8wt1NmeRnCX84PcwFUBc4PoZwI2O+LoE1kOKK0jETbOL
         3Kpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dadidNNwg6C4uwntvqv8rWVDz4L5aFgOmUZdv8nJOQs=;
        b=g0gxC2EZCLFRm9WlGYBbGTrwt4sz8Fy1bPe9MJLJLOQJGKiuf/qPLg0ubxf1MVXa6r
         0A2KNonztM4xyhgG6xUlexqYEO1fJ8DPD077QX6B/lGqPI5ue5ZfrMIWwObWCzbnXlQb
         zQ31c1dETxFyVzQ8i3yKz4LslMvg3AY1A69MyKrBp8bGvrYV+zDOX5eHxIPVPHPZrV8H
         y+qKX9+LcLWVvkm1kv2ajOdQfLn8JEw1WCT+Ml0qltKUZIN+mPnW22bLro4WydSizwur
         0C2yAZS+jzRjOFMG1DLGLNRxb0A3RxzZZp2Cwi/V95F0XcLw7pw+tsNGQt3bz0O6uiLu
         5AjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U6Dkm4WO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si512234oiv.123.2021.03.04.12.30.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 12:30:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U6Dkm4WO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHuc8-0004yh-Oh
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 15:30:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuYa-00024c-Es
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:26:49 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:40003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuYX-0001HC-TV
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:26:47 -0500
Received: by mail-pg1-x529.google.com with SMTP id b21so19662484pgk.7
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 12:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=dadidNNwg6C4uwntvqv8rWVDz4L5aFgOmUZdv8nJOQs=;
 b=U6Dkm4WOSeON8E0+ZvwvUjVWuGhWG5IRbveKawkgNLAfNdzm+YZvt2Re9HuDdVn+6a
 Y2eyqZPDwNepY1YN2ujynlIeQNunLa1mFigG/bvLf56E0uD1/6beClmGHZndSQo9hKzU
 FrOdqcm3IG29tDZwZkD2hX7klhXsCyb7HOnTjlV22PjwxuTVs0RCcKrKK6K8ruP18gFk
 4oU+FVdEGOENh5NNV2QVVriH9rlx71Wzr4x6k2UKFGS4tt4XlovIFYyNGOIZUYXcRuIz
 OMMrNMZsFTXYLJpBxGS5vpaVqQmaUShR3uCc8//pejYSuz9O4JcNM42i5CkU1Bu7Wr9X
 PaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dadidNNwg6C4uwntvqv8rWVDz4L5aFgOmUZdv8nJOQs=;
 b=nv4uLIuwkWTN8rsJo+fSSq0bavrSQ2RNPawO34kPcpDhOiri075zj3Yr3MdtD7zVvY
 FEvTQde1dUL0xH79QBk7Q0rrmBLnZnFfiDNqol7gh4x5C0rLvAkBd0kU0xoHnQEif3mA
 maD0jYwkh5RMIZwRaTIdpjsiHmCSChYxMFuZs0DYQ82bQv+thxGyflG7WSFDZEwmdojT
 VOFA3OLD96A3NJEC/pd5h36p86FYVD4/Q0iwMOlCI56DVD8s5Gl6lrRe5B3iPmY4SPGN
 +SCRzNcoPs+vVT2BCmt7T1O3xmDg4GAaEf0SI8P+3XU1zR0humLfwkJJA+pOV0oJnNl9
 qsVw==
X-Gm-Message-State: AOAM531djobgNqSdh35QKxfTcDwXl5ljaNsRdXQYGO64dQCMZcsnV7Ka
 HaokNpLapoL9Dv2BSveZuKaEiw==
X-Received: by 2002:a62:2acf:0:b029:1ed:5dbb:717a with SMTP id
 q198-20020a622acf0000b02901ed5dbb717amr5239950pfq.39.1614889604400; 
 Thu, 04 Mar 2021 12:26:44 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id y202sm224201pfb.153.2021.03.04.12.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:26:43 -0800 (PST)
Subject: Re: [PATCH 31/44] hw/arm/armsse: Indirect irq_is_common[] through
 ARMSSEInfo
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-32-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <64d49b5e-3c0d-cc56-a498-a346c7766851@linaro.org>
Date: Thu, 4 Mar 2021 12:26:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-32-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
X-TUID: 2VgESGa1+pdK

On 2/19/21 6:46 AM, Peter Maydell wrote:
> The SSE-300 has a slightly different set of shared-per-CPU interrupts,
> allow the irq_is_common[] array to be different per SSE variant.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
