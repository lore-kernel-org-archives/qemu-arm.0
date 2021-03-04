Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6559371lfg;
        Thu, 4 Mar 2021 12:31:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzA33+32mpCdhhX4rfwgP1N9K1HZ73Y1X8LqWmHIGJKDk767BxHRGn0im2PYioSXoC0UobF
X-Received: by 2002:a54:4708:: with SMTP id k8mr992364oik.22.1614889907099;
        Thu, 04 Mar 2021 12:31:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614889907; cv=none;
        d=google.com; s=arc-20160816;
        b=x9RUJ3wz0/36FoOqbF/RZ0b+8WGAk9WwtwX5R2HBpsd1qeedbdlS/XmruiC7tnp8LN
         DIwCJUSIfiA9L1SUJ2soM1hMfFo8Vxd5T4IGSNC1/IFsHLNhzKROm9yWENMpBLd5WWI8
         8KNmdp6DOkv4Bukv71CEO1k74FS7S9//8lPxfqtM8T2+6hNAQtvsSIvjpLtSzYUCnZ5K
         EZHofO49mpTkuk+NvOuwIT+bZL4vMkV5mIepSxIrNAKY31QtWwKBmKov+JArHyOeecN7
         VGgEeWEzhF8LeGp3G9J6IeDR4Qn/bFCRP3kKsckhjX3fHIX0DCUJe/DNGpNOqwSrAxee
         Wm+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=5elVsMH9HikvBYpynJ+zyC3Krg9QqtADRoVC5wkhchg=;
        b=Qd2LuF2ZABYqvTdIbYUjwpeFKUqmymDbPzMmKIZITauO6bD0sQb1ABpQDnwrGzTlwt
         WLb5EUIu3ZKL7Z8aUFyfxsCl2LRkYm15iWVgLPjsy8OahIKBVFxKxJJnvDKCOcX9OuiP
         mqAJtyUb4GOcYWYpUj4WJpkrq6cvqULSK3WtXDt+i/CB8mmttG3a/EqDmzePu2aLi7Cn
         AmZz9l3cAQEtBOj6/0eEMPn3Lx3T1XXCk2idQ1SNq3Qmk72LcwU+PI0uTFlem6wHD7DV
         Tmp0+5JRxTdRbWNzGHdRbEBgM4btj2jcrfMpYQ1AeFtmhkE8bU0Ni2QJv/tWSlorMxbM
         6KLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BNy32NoQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z198si451608ooa.22.2021.03.04.12.31.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 12:31:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BNy32NoQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHudO-00062U-AL
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 15:31:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHucQ-0005fg-0G
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:30:47 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:33479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHucJ-00032F-Rh
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:30:45 -0500
Received: by mail-pl1-x62e.google.com with SMTP id c16so7351499ply.0
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 12:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=5elVsMH9HikvBYpynJ+zyC3Krg9QqtADRoVC5wkhchg=;
 b=BNy32NoQ6jhDYq/bCdDDiDtC/jln9296lEh0pxXxXbrS79qCGvUyZJkIY8DN64i4gA
 QlU1xjD69Fh4OxNGVVKFSwiQWQvdF4v+jLW7ufMdyxFezDtXGY75hRD8R5DR1F2NwUb/
 6OUlLrvFTxCcwFY0llUnXNbSvOzSKTjWOWMF8BGa6Ojzech8Mjxijid0akgR5zsZxLQz
 cJrrqoo5MjhJ200g01S4wh3I/9/3B55MVVCRk5Y2C5AtKuGfcIRXvGLB7xqvXhyJ/sKX
 I5klbtoTmvWwHhRnmAf9jcBSiSYWnBxGNonaWlz1jpeFyJrNaZlMWQji0NpvMhiQUVw8
 iZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5elVsMH9HikvBYpynJ+zyC3Krg9QqtADRoVC5wkhchg=;
 b=M84fYo5yVlaRPZr8rCYOsGqjguuWiXsdN0F757OY/i4RqzoCiGzNCr+8WxPbNF/mX/
 7S9eKXdaFdfSlErvZhRIZEeU02E/ZfPIiH0g4GGlj6r6pOmDrOgtongzAptlhgVm5MX9
 nkXffBTpo55SSJbxEpsv+Iss46C5q8qgkxVrf+3g/AqYaziljxwiL38W+Lv7KIHVGKpv
 TRDAYVWwzhQf9NbS9fatQOVo7MMR0KBWgjob17lMmIeFTnAyLTEZJNQZq9/Zix2OwpDy
 IAvupmxApPe9R4EFsg9PfFndTdL6TfcW1G6Ydx96Q0za1PtvmuLw0yDJZZ86nRScAK9C
 enYQ==
X-Gm-Message-State: AOAM530jPvtOwj0aD4ELzDoN7OEJAaV4+gumEHohBUs5jWp8mCA2WJZt
 Z1cSC3O/KnscBi/OHtf1ZvIwqA==
X-Received: by 2002:a17:902:e810:b029:de:45bf:1232 with SMTP id
 u16-20020a170902e810b02900de45bf1232mr5512327plg.59.1614889838409; 
 Thu, 04 Mar 2021 12:30:38 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id ml17sm134284pjb.45.2021.03.04.12.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:30:37 -0800 (PST)
Subject: Re: [PATCH 32/44] hw/arm/armsse: Add support for SSE variants with a
 system counter
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-33-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <38bc9545-606b-83d2-ec92-2eb61ccd818e@linaro.org>
Date: Thu, 4 Mar 2021 12:30:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-33-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Z5M3NcwnbWMa

On 2/19/21 6:46 AM, Peter Maydell wrote:
> The SSE-300 has a system counter device; add support for SSE
> variants having this device.
> 
> As with the existing devices like the cache control block, CPUID
> block, etc, we don't try to make the MMIO addresses configurable.  We
> can do that if and when we need to model a future SSE variant which
> has the counter in a different location.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
