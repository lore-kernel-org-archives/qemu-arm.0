Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2000944lft;
        Sat, 2 Jul 2022 07:19:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t9IBEFoW4O0jwtKZfFlgZHiFG4xLLw4AY1KF65rE+/FjM2E4NBF6FherjLABPmefCWUPnz
X-Received: by 2002:a25:cd07:0:b0:665:746:3318 with SMTP id d7-20020a25cd07000000b0066507463318mr19658194ybf.639.1656771573659;
        Sat, 02 Jul 2022 07:19:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656771573; cv=none;
        d=google.com; s=arc-20160816;
        b=pGtWN9DdW77P0KmmKX2QS2sD4DRP68iGJdnP2Y+4AnnUrSqUsQt9rjAaRzxpXaG5wT
         iPPEzwW6nBUjJSq9kb38QFqdKWvdjk/rdP8B915W18yxtpx5dZo/v0S2oYhuJTff6p+q
         cRxpQfp4Yzf27HyB4i/of8lCFYopoat95FdHTYEYdHsUonUqCqvgV6UJpwkQZzrH3U9/
         V1wYrPyqST7sRrj8QMaP0wxkPTswHLrPLVKw7EYTJOE5GfG8FWb1ocTa9bQXK8lwgrjl
         p1+5BF1jsbzWc1Ci+NsBxwwAFMGyENodSAnk8oiPgn92f9oWqS4VeQa5YalKKi/j6pDF
         baEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=GT5IfMzGhhomlVr0z971ZqCoxbu+8r+y6wjvqyCj4mI=;
        b=Yqa2VXQdEUtx583sXapXlObRkBLgAcpEUoDASMy8h3pdeJd3dcWFtobJnWAHeK0wQk
         /H47EEckIb073gX5/+lE9oBUajXa+CcMNXESLW+iznZU6EthLH3LKs+zakFJXorEkaSr
         HcZGZYfqn7ftrqh6zOati8ojVf394paEY5UY+TMNCYLH/OS82kYoHmXXxdDC8epO0HOq
         r+hMQnaYSYJse/KrnIbnqFtlKbupLRrrUcoJ4kEF5/QXyLZE2kLPz9ha+eb1jcCUWN0w
         J2e6ZH95pfl6lGiXPJrOM8oGoxV23hboiXvFqqeigm+KqAfOXMs2CIpQslYBQvCgql3X
         A/Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WV3f2BgA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5-20020a056902124500b0066de8361b8esi8555628ybu.408.2022.07.02.07.19.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Jul 2022 07:19:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WV3f2BgA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7dy9-000748-35
	for alex.bennee@linaro.org; Sat, 02 Jul 2022 10:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7dxx-00073M-C0
 for qemu-arm@nongnu.org; Sat, 02 Jul 2022 10:19:21 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:46851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7dxv-00083i-RX
 for qemu-arm@nongnu.org; Sat, 02 Jul 2022 10:19:21 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so5343695pjj.5
 for <qemu-arm@nongnu.org>; Sat, 02 Jul 2022 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=GT5IfMzGhhomlVr0z971ZqCoxbu+8r+y6wjvqyCj4mI=;
 b=WV3f2BgAgECAhgQmbNR0vbTnKMlH7yi9jM8RHdPJJ1HETYC+V6/gS5eaXGsCGy5Nom
 /FnkVkj9ZDXKOeb2xC1TAxy6uT1ShbG5Y2INUxgbEXXdETpKfSpwAvmVs+LuvpyzttoL
 4u4Beyz+QOAcb4nzLPDNXwDLE+BQwM9f2Rxnlg9RKrd6afQd/jOG2j3F5wDIq0jcQ3Sp
 z6yTF4qjT0iPv36Gi5NauBwv554XF3IK0w9ernkR1YAYZzfYDFSaWtLgx/OhUgo/2Yoq
 vLaXMvHqB24XifrQB4GklHZIh+lkOGcil6dloUms+AxOrjReycF0tRu5K5J8rHYJET2j
 L1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GT5IfMzGhhomlVr0z971ZqCoxbu+8r+y6wjvqyCj4mI=;
 b=gEMtk9KhG0HsN0JQzocv4p9h6Kb/p6ywvVmr2ptqEr9YkPS4p3LKvMHfIcmY2OrVDr
 PCHC+41/LVz5lHcsUm49QiwkLBDWs9JGdWX3Ofwrecfq8MgdMiT3rAIXcuOwS/CExw9v
 dwEYv2wgZ9N6esLGr93INwtvGl7vPzcAk5pPPYI8NcdolP8KhuEbb4sNOIPNwICO3tib
 IHxO+Mh7Ri/3IDgH1oK4UC0tBzzI/c2Niiql/UThjS8lN5WjRfIGgg/NWt1ntMzbEbAI
 08XDImhnjIGDqXLOPLBIQAOpozsMd/7tAbCe9Ch55CAcYAFAduWPjqqeztG/sXYuIpmQ
 w3Jw==
X-Gm-Message-State: AJIora+v00sDW76Z5mf+3McDaExgN6haNe6Y9uleCbHo2IM6l50Rl3TX
 jkaSUPfoE7onMTAvFivR9u6Nqg==
X-Received: by 2002:a17:902:cf03:b0:16b:a91d:aff4 with SMTP id
 i3-20020a170902cf0300b0016ba91daff4mr15979952plg.66.1656771558242; 
 Sat, 02 Jul 2022 07:19:18 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 g189-20020a6252c6000000b0052833322760sm3428523pfb.187.2022.07.02.07.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 07:19:17 -0700 (PDT)
Message-ID: <d717bccb-09d1-99e5-f15b-fdecb2b224f6@linaro.org>
Date: Sat, 2 Jul 2022 19:49:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/5] target/arm: Correctly implement Feat_DoubleLock
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220630194116.3438513-1-peter.maydell@linaro.org>
 <20220630194116.3438513-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220630194116.3438513-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: /p9Lk0/kRvbY

On 7/1/22 01:11, Peter Maydell wrote:
> +static inline bool isar_feature_any_doublelock(const ARMISARegisters *id)
> +{
> +    /*
> +     * We can't just OR together the aa32 and aa64 checks, because
> +     * if there is no AArch64 support the aa64 function will default
> +     * to returning true for a zero id_aa64dfr0.
> +     * We use "is id_aa64pfr0 non-zero" as a proxy for "do we have
> +     * the AArch64 ID register values in id", because it's always the
> +     * case that ID_AA64PFR0_EL1.EL0 at least will be non-zero.
> +     */
> +    if (id->id_aa64pfr0) {
> +        return isar_feature_aa64_doublelock(id);
> +    }
> +    return isar_feature_aa32_doublelock(id);
> +}

If you're going to rely on this, you need to clear this register for -cpu aarch64=off. 
It's probably easier to drop this function...

> +static void osdlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                        uint64_t value)
> +{
> +    /*
> +     * Only defined bit is bit 0 (DLK); if Feat_DoubleLock is not
> +     * implemented this is RAZ/WI.
> +     */
> +    if (cpu_isar_feature(any_doublelock, env_archcpu(env))) {

... and use

     if (arm_feature(env, ARM_FEATURE_AARCH64)
         ? cpu_isar_feature(aa64_doublelock, cpu)
         : cpu_isar_feature(aa32_doublelock, cpu)) {

since it's just used once.


r~
