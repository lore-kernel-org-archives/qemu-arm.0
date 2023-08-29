Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3648105ejc;
        Tue, 29 Aug 2023 06:06:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhJ3DP2t/utEFWgdEzTHBhGY5u5eA7NOOArg4DRKm9sF5Hd0fXk2RFb8p0yZ+JVsP0WHkI
X-Received: by 2002:a67:e9c5:0:b0:447:7a6b:2c8b with SMTP id q5-20020a67e9c5000000b004477a6b2c8bmr17251834vso.30.1693314399780;
        Tue, 29 Aug 2023 06:06:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693314399; cv=none;
        d=google.com; s=arc-20160816;
        b=RLB2Kjga/xzQeWDIPdfvRTCduZeZ1F7Fahkoq76U3MiXqmENNDV/uXDGSgqUz005JF
         YSUxz1iRyxLyUq4muILE2xUGmwdAF91aOJs5N7caNRVexuB3CSBqYSN7VlXb/Fvvh/0S
         msZzOrPqGEIN+SHZY9BtpdBvYhLn6/O4FaLjFISfvgoNtrA2qMlWeuUziEdDZ/9VPODg
         pxDwBvctJUIZNJqBXEG6APumi4qVr6wALRmghK2Ek1LJkBFAAV3Nw3LL5+G3+yXyp+mD
         qIAdiUx3+tbuqOecLC6Rc/UDaHBN+ZhbdIeJNLu5ZJW8abEM059YgQAy+Sx65tHMIT6d
         yYaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/d+IHKVhjyzzcBoT08+0UZkl6B6Df7hnsYgh7N4Kdto=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=hP8XGzyPsbeNQ/acssvw07ZOFb0dIkFCPQ/3h+aRcuq2xSc7neP17gjvxifkKj+gRS
         he0aNBjQIZ2oH6ummhJLjMkYWykn464AdzWaXQWLyzMtfOYPVeg7n2fz0Zfu5aDyILBm
         TeR5nRGyVcUI1gwfIVCS1LaNuCgAIiOG5HyAIgc2KcaOFV5J9EPGEYu/Tqj6UHdPXEu/
         LC+FrOAzXssvQO6NTQy+TlWdSlCAHkv/Ei0lQdGBz63VgWUY9Bks1CtYQAMBLFvcQ0XE
         HYud2liZyl2eMR5HgYYRuyqV3zGABc3tZYb3z6Qlft1YDyKHG5VaDxE8L8MHO2Tx6JyC
         PCHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gefUOHvV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l26-20020a67d51a000000b004474bf3164dsi901397vsj.245.2023.08.29.06.06.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 06:06:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gefUOHvV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qayQA-00047b-6y; Tue, 29 Aug 2023 09:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qayQ9-00046r-23
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 09:06:13 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qayQ6-0004dC-AG
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 09:06:12 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-52a1132b685so6105868a12.1
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 06:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693314368; x=1693919168;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/d+IHKVhjyzzcBoT08+0UZkl6B6Df7hnsYgh7N4Kdto=;
 b=gefUOHvVcNZyaKDBkur7fFWatjsLhZA0v/AIW5WptmtSj7qPvuQ98VjBr4lZnaknvJ
 Ona6gZrR8EftXLjpoMjwnUOWyaMONL6+JNBb201663I8eG3Mx70J6HxByXkCf7y0ha/n
 CrgSzG6IbxaTa8llfMEXH6ZH7iloj2WAlVPgSaeftGQOeC30ievNkDiqtBnA4C2glFnO
 4qgzFSpT/aAa8/hBfRU+0SRuXfEmaogGtBDV9qIhlc/mNSrLmJ1Mjx+pFctGEbbTEYhN
 NBOkDw1I1amxMWJXlxXaw1tvBJV4re2GUtILsdVtgvRZLbCGezoXaFJHvDD/l9yeB/g1
 /OAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693314368; x=1693919168;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/d+IHKVhjyzzcBoT08+0UZkl6B6Df7hnsYgh7N4Kdto=;
 b=GIXJZPwjLEAtQh/YbSYcJlPah8iVXbESkhZDuxgWYIn+On1suSEuLMCUU0OLzHbuEt
 NH4CUx7pbxmwWg2Jl6TYH/G2kFBJMxEBXAoPUjMxww5M4MYxQZYZybVGNbBr4ij6hOnL
 5CIdO4bUE2uMI5zA0yyqRHG2J+pk+Y0UEDX4PXQhsDcikMoZqftcR1Sae87aGUKao8VE
 4Cp3BYbbUzL6QcleMYamRUqazL3wInFjtm2L7AgALlUAJmuMUp84UyHyMUfwbD70SEM/
 kNG/3js86/3o0B11fEsvjfkgpsfLyAp9zYFUHL/EFmFTvt3J0hoV+tEgqNKJG07sjad8
 5D6w==
X-Gm-Message-State: AOJu0YxNp8h2bBBfUOcFb93nfzkkz38mJ3J6vIkGxqXvCm1bUNWCsMLy
 i0XtrWWajJ9UUa9B8R03skirlofWb//NEMPM5JXOfSHQFuJW2gdh
X-Received: by 2002:aa7:d34f:0:b0:525:4f15:d26e with SMTP id
 m15-20020aa7d34f000000b005254f15d26emr20001733edr.32.1693314368534; Tue, 29
 Aug 2023 06:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230822042530.1026751-1-richard.henderson@linaro.org>
 <20230822042530.1026751-5-richard.henderson@linaro.org>
In-Reply-To: <20230822042530.1026751-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Aug 2023 14:05:57 +0100
Message-ID: <CAFEAcA_1YpcoDvsUgmLhD9c2U49c6coOO3X8ybuZ_cCzGC1wtA@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] target/arm: Don't change pauth features when
 changing algorithm
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 81qV29RHDEfj

On Tue, 22 Aug 2023 at 05:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have cpu properties to adjust the pauth algorithm for the
> purpose of speed of emulation.  Retain the set of pauth features
> supported by the cpu even as the algorithm changes.
>
> This already affects the neoverse-v1 cpu, which has FEAT_EPAC.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
