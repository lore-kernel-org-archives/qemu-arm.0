Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1262598ejc;
        Fri, 11 Aug 2023 03:22:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMI0XKDpTdpQKQdMIl2UwtvLtfccWpd5dXlaOYVDK0mONWThmx/LbwIG2r27pe6UhUdxZ5
X-Received: by 2002:ac8:7e94:0:b0:404:a649:879c with SMTP id w20-20020ac87e94000000b00404a649879cmr1918130qtj.49.1691749372452;
        Fri, 11 Aug 2023 03:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691749372; cv=none;
        d=google.com; s=arc-20160816;
        b=zeIJKMn9TchOhvGHzesIIhHK2uRdaSXXP7dZx2vfLKELO7TZEmNarKxqVyCi4bhI+W
         6gAzh/nYfZxN1flTI8kh9GINArTLDXWO1Q99NTGpjLnFgcQaWRFhbbWh1idBy3F5UdfR
         IRrNpXsnLf0l+fcvMtZDBH4joyThEztL9sv8p2kDRhTM/nyJErV3lK0X4JFL78cto19M
         7mFnpD7dEf/p7yyFZL0wVBDWowj9u7yInJdTfgNA+Fhoqt/lutUM5wES7V13GquBh+cz
         zjUQLw/qgGCM7zRsSTYhCgxDHC00HjKqV+jPa7ikK+xARV4rtz07aPdHDvw/fD/HD2QY
         Z3wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XpP3rdBE5w+IiQdYR1lx8C/z1R1Ia26ftCFvEKLRgeQ=;
        fh=2HckukKM1aDIhwR4Gf5EB0R8biZDVGAD3ibhLJ8HTaA=;
        b=sKThpwXhfbWbRv4gZqWrmh5e1IZHftIw0aNn8z8QoRYa4Z/5XYThUJ9PtLJTAbfmUp
         aCva690Pc/t5nQ0IXVnjGbmowo78rg6udxV92730lMYojc1VSf13MXCaUX1STEbTZVAv
         6p/6yBBM/0UEalzVlvNBIps87cnmnq3OixZzLn5FYaz32i4dncPmL33XC2Jj4qq/0uDa
         Muu6fhNhYtOz5jgQ7zPoWFu2TMw7Nq6rSuVNku/JbhzOfCkMy7wzbc4un56RdeannARw
         lSRKaEizhfRd2scC7WPY7VQc1IjRs59bx3EXafsdDgwKbVfxxf7IydRksfgMXcqb7LfX
         da1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BmzdJZK+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l27-20020a05620a0c1b00b007699ff92e68si1919334qki.82.2023.08.11.03.22.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 03:22:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BmzdJZK+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUPI1-0001WE-Ae; Fri, 11 Aug 2023 06:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUPHz-0001Qm-43
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 06:22:39 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUPHx-0006Ud-Ky
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 06:22:38 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-52364e9daceso2289645a12.2
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 03:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691749356; x=1692354156;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XpP3rdBE5w+IiQdYR1lx8C/z1R1Ia26ftCFvEKLRgeQ=;
 b=BmzdJZK+FHLfWnDfBaqVmu3t7qEB05/EjGNWYuR52WrDlaJHkM0MZrY70WNt5m1Ebm
 R4bIVlMTvqFGcD5zq2l1pOTsMuMjNIXw8T5MXgYclaSjavNHQnuCJrZy23Hcd6tSVBmv
 qkBEE8HdKyojADY7e42+O4m1vahuW8zzgvbtzKv6NuOwbGD6PSOhJfhf6DQp4XW3d0ZS
 8poPlRYCm3Ag/tGrqduuBxpAh0IWdAj55Gp3BbsyJHo9SHvPIzbM3/O1EG9UGuPv/zLR
 vVfmJ12tprnEvxe3e/h5WCg0MtpLKwX8K+leLucyR4CQrgojo5GANfu10un7qyeC7PQo
 RKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691749356; x=1692354156;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XpP3rdBE5w+IiQdYR1lx8C/z1R1Ia26ftCFvEKLRgeQ=;
 b=GVa/VEqR5UYcAj32uwg5GhlzlycsEzegxkFUllsUQ5d/uBQcP5D/3DtsDWADXPrg/a
 whBqQB6GeRtn/0YHsxcxJvxMLWMOoSkVqdKrbMgqD90EGMDsbQltP0tiT1C1EHwVP15a
 H680idmb85CO7wwB95BWQl9F8Qd+AhGT99corqG3r39tjizjkX8uGRmnZ2HEnwsDilbK
 JP+rIL9fm+MoYaLtQi0M106ZbQRHVkgwKY35ZXn8sgFuLEWlf99tXp6Nxjx9yBeQup55
 xQ/g3sPTqIqKUGyvzq75nGE2iTu6OZxEt8MKIwEyyBgOvQA4oA/vrs6s3ms6sTxKZpAV
 GBaw==
X-Gm-Message-State: AOJu0Yzg7NgnvOb8scqxY7LpdduzaXgOAqKiuKj/Sg+i+JC2sCFOWTdI
 dKAWnS817A2qRYGtfuy0iR1E0E3YcEUtWEwhKC+XIA==
X-Received: by 2002:a05:6402:3449:b0:523:197c:36e0 with SMTP id
 l9-20020a056402344900b00523197c36e0mr1317966edc.19.1691749355783; Fri, 11 Aug
 2023 03:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-20-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 11:22:24 +0100
Message-ID: <CAFEAcA-Z2rEnyf1Lk6swhBQhUCMLjPvoHYfyk-FkspsQ8f5qOQ@mail.gmail.com>
Subject: Re: [PATCH 19/24] tcg/i386: Merge tcg_out_movcond{32,64}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: A8KNwFO8Wfuo

On Tue, 8 Aug 2023 at 04:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass a rexw parameter instead of duplicating the functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
