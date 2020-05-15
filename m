Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp877087lfb;
        Fri, 15 May 2020 15:09:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZTuu+USTbdN0G7nA5ftuqmp5Qj7K+OErqf0Co5j78xl4heEhrt/2NwOzAC1c8ETXJ0Fuj
X-Received: by 2002:a05:620a:1432:: with SMTP id k18mr5390510qkj.71.1589580551912;
        Fri, 15 May 2020 15:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589580551; cv=none;
        d=google.com; s=arc-20160816;
        b=sC0Tx9IHOqU8KqTpCta7rjDqzkYkXsoE8UEgdC1gptsVaPIAuNajiz+kwngXlm3qh7
         JPLp08O4Kw+eUjfPiDItPrYn/35FGgSp0Bl3IHfDkXCOInlUhF/A3DEKCuqFHYjpWwWC
         7kyI/Yw60a17ZhEosxR0n9Wh5QHHFWM9OvJONruoT1M12bE+F4+bhYpHwqeuOB/x4YlF
         +4wLQ5CH+fSi0ubMe1fKQAtJfgE/rCzBYXZZJKXaE5I/jbIATMe1HeeQn31kMeSA/6+t
         1DZnOXaEEdcV6dCLP7kIuKubQMwi5ZE8LDMYQNk5QmClmeYjFSWs8bK4b9/2ULLASW4Z
         6FgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=egcT/KB/x2MAiympOufSwwaKnGIEtjx4KhCKJZ/QYeY=;
        b=UXysU+DorZj8mMacyKB75JzL4BDtVIdbxxA3lUMhpY+Aenx6fUn6MqB8JK4qgacMA4
         uwRDIqMD82kfa4whReF0ZVbf6zj2pJoE66Cc5CpuogfwxahABYd3PE2liumaENw7HNiB
         RKa+cwItTQwOatgpNdx6wpcb7KhbFxUM28LbSrOVALmz2OoKxpKkbf/71je7XHPyCcAu
         njTz2No/ThfDkgkei94TgoeZmcjoEzbio6sTi13EgrHlHiYJuYMKZesj3lgWtYqBvamX
         9bykqS/th5YOnnQbaYESabo+OqhiIqk0soUZ5UFtk8/H4Eyat+t6nFNKK5YcWRkI2sB2
         XFJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EdIlwz/q";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o54si1961731qtj.10.2020.05.15.15.09.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 15:09:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EdIlwz/q";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZiVz-0003J1-DE
	for alex.bennee@linaro.org; Fri, 15 May 2020 18:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZiUs-0002CH-4T
 for qemu-devel@nongnu.org; Fri, 15 May 2020 18:08:02 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:34016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZiUr-00011R-6i
 for qemu-devel@nongnu.org; Fri, 15 May 2020 18:08:01 -0400
Received: by mail-pf1-x444.google.com with SMTP id x15so1657290pfa.1
 for <qemu-devel@nongnu.org>; Fri, 15 May 2020 15:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=egcT/KB/x2MAiympOufSwwaKnGIEtjx4KhCKJZ/QYeY=;
 b=EdIlwz/qqGjw3MvNDpPsixOnOpMvFmDCa82yIH1a7ggG2imIIGswuiBSou6wxBAPen
 hMt6QiJOon25tDD0FuHF23voEyLGCzBCQJCRivE/jSJXBqqXCyEKqHlPuIPpSr3U6PQu
 ykWLTH1m3VdnyjZjyog8BeR9yg59GtNJRN3k5XNKDl0pVpSrtsmHMx8JAC0A3hVOMO2V
 4mGT2BAPaKRq8y8+gt5nUmNJdznMwfQUSZZENf/TXfoCTYYtaBJTuEKy5zEjbwb4WpFz
 cGWB7KjAnlM3vFt+bpfRro5R4L0s2Cp5K8sqdsX+HmdAgcGNY3rfgu1cqMuqX7yO+SCx
 2eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=egcT/KB/x2MAiympOufSwwaKnGIEtjx4KhCKJZ/QYeY=;
 b=nSjJA7NXnCM1jEtjM8NJx+0ksXBoR8RHTfAtu0BEQx9FQTmD5TVJBhAEEROM1qKr8Q
 J2ElDCqeNRaLt2MIamM4zhUxLwTcBtUOCN/Fw/CBq+9mwbrpFGtqlGHX8zEx3H/cjsNL
 LrFa4rOECA6V/MGH5K+ajBaKdefAtj3ktkrWP6aIxVaLsg7nZqiEu97FDuEvkSjJ3PiP
 nXEzbzCnqbf1X0/DBqFMbLsUv/GEfscTfE0ZczJl8IlUjcn9cTMY8AD9GT3ixiskQT2R
 WVkKKPI9QGv/W6AxxTJGLP6CJCMW0A+zQCCOzEmr5UaeK/cK9nck/DbGokX40NnHtWv8
 PhlA==
X-Gm-Message-State: AOAM5334/3eSJd1k5E/SwM5EtvHWVR0bzBxjoyK8Dx2wSmju1e2uLiWW
 /iFMqq/LLYyRUHX08McN/GZz6PQQdaM=
X-Received: by 2002:a63:3286:: with SMTP id y128mr5145127pgy.323.1589580479059; 
 Fri, 15 May 2020 15:07:59 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm2869860pfo.27.2020.05.15.15.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 15:07:58 -0700 (PDT)
Subject: Re: [PATCH 01/10] target/arm: Remove unused GEN_NEON_INTEGER_OP macro
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200515142056.21346-1-peter.maydell@linaro.org>
 <20200515142056.21346-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2f1f4b64-55c4-5559-11aa-3251b6773155@linaro.org>
Date: Fri, 15 May 2020 15:07:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515142056.21346-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HcjxsDQtuCnH

On 5/15/20 7:20 AM, Peter Maydell wrote:
> The GEN_NEON_INTEGER_OP macro is no longer used; remove it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Between Richard's cleanup and mine we deleted all the uses of this,
> but since neither series on its own was sufficient to delete all
> of them we failed to remove the macro definition when it finally
> became unused.
> ---
>  target/arm/translate.c | 23 -----------------------
>  1 file changed, 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
