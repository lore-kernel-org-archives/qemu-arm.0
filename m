Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1855683lfc;
        Fri, 28 Aug 2020 16:16:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZXq2UmLmvWra9qeQmidRb78redRJUgQhk/2Gr5OXtcGkAVatQbJwDN/fTFC8wBjYCXqU2
X-Received: by 2002:a5b:a87:: with SMTP id h7mr5248692ybq.333.1598656611809;
        Fri, 28 Aug 2020 16:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598656611; cv=none;
        d=google.com; s=arc-20160816;
        b=kwaz7W1lSUCy0AVuS7paM7G4oFs6hhEnQYxtjTE2mC/BUd37F2CsMEAbP+RhKUpmpY
         X0PtuErHEhs6JNCIGTD58HMbn+ELJMn0XSDox/1wnFzcUNW9yx5DfoPoV1SeRAMJQ9wB
         vzo0E3hClSpovhm/kInKIy5hSKD8JjwqXmxu5+IcuoE4MDYLLJ8ZPq1Cw9vy3TYBfwck
         xDltQ3q+povfBSVqGi0cnE4GQ/jMhg92ciwY7UYGntVJhQX2OWkbd2OC7BVO52PXL5Wp
         ZTj/906Zw9y/NSB8KVNCoauhBSKxw7tSjy0O4cPtBXUdw+zzja7ZqQ4Mvi99jpVshmih
         jFsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=VtckSC4J5ESSKhX8mNtlXCkaS1T6N5QWZi8gz5Gvo0Q=;
        b=TIDfndjOCYcqDZ53yXZcQkI0qiHO5QtP4A/i9nKTWHfJvDdFwhzczccFSeV7XH5+/F
         3VavvGs2BcW7j1QvUgTPtqlBLj07FdXgmn9DYtFE8U2MpqNbboaPmf+81KZUEdQlphqA
         2hFNMjFNDILH89W9CQ2T2wQ/qhhQgtv8/BxYaYkzLJ/DT5c9cL5d0LaFtExxOLFaTkfM
         L3b8v5W37bbdqsjxDejSsMdYyjukZsY3/VUH70Mb8diS1GkBDCv7ZaL4eIXoUdCoUR5o
         QXoMH2UVrrmlY/IUxpcg0WJzA7YS6TVd+JA0Bx5TuAt03fi8QiWk8xgkx0q/YDrB5u48
         wFEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yh9fczxL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 73si642366ybn.416.2020.08.28.16.16.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 16:16:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yh9fczxL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBnc3-0006U8-7G
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 19:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnbv-0006SP-Al
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:16:43 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnbt-0005l8-Py
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:16:43 -0400
Received: by mail-pg1-x541.google.com with SMTP id i10so1146285pgk.1
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 16:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=VtckSC4J5ESSKhX8mNtlXCkaS1T6N5QWZi8gz5Gvo0Q=;
 b=yh9fczxLex/rwo5yGF8VYNAbgplxbLSzmp8HutI1ih5ZispRh6DBG6d1VHuEkJAWgp
 djAnE9NVid2Sj++zOvP+uuwMmhr5SYZfrc6sU69YoYKMFmDBZFqv9RxuyXcsMDfRILAl
 YbTV2NCf660rZr1qDulv93dcUNEuA7ySr8yop/SMv0kICffqblx7uMVK+jr+dXdvcP8l
 1Ei9D/KM1oGU5oh0XoBA+U4diFNJzYlBI57EfvxHxauecoLzQrsixQOdXJy0axSatm6e
 XPPiCOjXPh1a0f2f06djWKpfGqrIGhsZmitDAGlroz1K9L2lDJkfeeWe/ozZ+g2OaQCH
 83Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VtckSC4J5ESSKhX8mNtlXCkaS1T6N5QWZi8gz5Gvo0Q=;
 b=rdtJZNJOg7uYFWoU+KfrnaMg6JwZPQVN63+ikqHCTa88+21+5oICw2641cYUiMGFNN
 YGnN42YZlP+/XvcZmm0gxZv3YGsb5LrxyawOBv58IWtvk1psTioluV5h+kz1IbY0BHDH
 1Rc9enodmAQgXalkaO4J9FgUWpSMrhXCRnafRd5mFhwF6MIR2KfMx/HsRBchqSOuRMRc
 ByBWPWdEdYKDfvoEitap+EcV+S6HIdRg/KKYAUFUo0sZx4JyBqLxMVbM8gFMXuYuxuyi
 1+8EN4nYUUt3bhGh2ywRI0J7sPhMzRrHap+AiUXS2lHkChx79e+WfnGQi/pZe+B0/U/v
 07NA==
X-Gm-Message-State: AOAM532pr6IsOclLBlsVpbhoOLhKJ+MtcZD/1SxUfAP1og8irT8p215Z
 CN/5PaOg8j1+T6d24C6BmJUKXJfQP/DAKg==
X-Received: by 2002:a62:4e09:: with SMTP id c9mr1054905pfb.223.1598656600431; 
 Fri, 28 Aug 2020 16:16:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id w6sm483204pgr.82.2020.08.28.16.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 16:16:39 -0700 (PDT)
Subject: Re: [PATCH v2 41/45] target/arm: Implement fp16 for Neon VRINTX
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-42-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <88a92ccd-57bd-c456-bea7-c4f995c635fa@linaro.org>
Date: Fri, 28 Aug 2020 16:16:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-42-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-TUID: tL0HSbOvrb/X

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Convert the Neon VRINTX insn to use gvec, and use this to implement
> fp16 support for it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h             |  3 +++
>  target/arm/vec_helper.c         |  3 +++
>  target/arm/translate-neon.c.inc | 45 +++------------------------------
>  3 files changed, 9 insertions(+), 42 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

