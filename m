Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp433595ejb;
        Fri, 8 Sep 2023 06:43:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBflHtxruT5v0CfThTk8PPpJwfheu+rJzRPLiBfhNQ8YqKiISNQCBPzoX2UcLdmUsG5Ks7
X-Received: by 2002:a1f:c742:0:b0:48f:e2eb:6dd9 with SMTP id x63-20020a1fc742000000b0048fe2eb6dd9mr2681654vkf.8.1694180614753;
        Fri, 08 Sep 2023 06:43:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694180614; cv=none;
        d=google.com; s=arc-20160816;
        b=ieappkmCqCW1PhZBLwC27sSDX6rdMHdWgaxKyYYhygNd6ekZAuukVELDQXkdCic6fo
         dJZbVzIjSP+7JYQhqbDMlURRVpRBT5a1n0lVbSA564D1tj+NgMt7QhB5rxm95rz5zwcI
         QADzLG6M9xW50eJblV2oO12LuVlBrFSdV8Y/jVwzlh7l7hYujS5hNf7TMBbOw9bvUMjc
         Qy/ithE6j/1Twlh5pZcSflgqAUrWeKji/RoxQRapl2r+84TMUobaYOEKh3NYOi1d7XJ8
         oZX5LP7wBMkTNphZVqSTUtVc8K1bPpx0AZsAOBly9chVmJKTr01ttYN0Im5h+yIM03Oy
         0Fvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nRX8puxy9wVPB8+ZeOjrrhi7EZjOnzEgpEc6gfutF4k=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=eJBbSvplgM9vZQYUew5ds2bhQsovohTHsfmIyWD2NdXi+1umm/35jnpmMxZiYqG4C0
         imF19E9Tgj4jHDv5ZAlfAoGd+JeClWx1rvr26z+xOSD2NCwfujCzw7wMM+gZw/d7CVv+
         8Hvvm4DbIHd5fyxRDoGIOgVvU8lN/bqoh80jGxbU8wCFQ9fXgh7Ito52Ccfkkyi1eUUQ
         k4cOlxf6a7K5BLeHswx7RnMs0DivxuLWCMSPnIZhOxam2H52q2rm4DtmMBbuhj+DOc4R
         lLtzOxn+2L/jVBOeE2xmC7GXEKX5WnoAvpTG4jbLOs0UyOk4F0/qJLYhcz5o448mOspl
         q/Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JYX1myjO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12-20020a05622a024c00b00403f0c86a85si1231243qtx.397.2023.09.08.06.43.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 06:43:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JYX1myjO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeblm-00013K-4K; Fri, 08 Sep 2023 09:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeblk-00012A-QE
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 09:43:33 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qebli-0007Rs-FH
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 09:43:32 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-529fb2c6583so2774187a12.1
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 06:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694180609; x=1694785409; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nRX8puxy9wVPB8+ZeOjrrhi7EZjOnzEgpEc6gfutF4k=;
 b=JYX1myjOX3C3SK7bNdq0MhrKy088qn/Owrm1WP3h9rR5bi3mzn62uwmlNd0CQWbruJ
 HJE5l89j7bRm11vPalMtY81ZF00KqrpBZ8TbijRm/xUy2egzZ/Y5JUBWP5ubrsfWg5Ck
 yaz5A2Ag3c3FMh/Is1S5HuWnAI6oa2C3OcRBOkcmfkaaGKVxZlXd9rQqjUizrELdBrFd
 I/Y5zGE9T7giXM7i8CjSjfDLAC6RyfuM4rD8ihjNcCgLESvPwaI/ZRhZ8pbzJJDthdxu
 qNGzMcnwjsaoNPHPrrBTCRdOppNGdySMylP296IX1pxG8egaHICrbAblcPFml2ziXN72
 hJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694180609; x=1694785409;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nRX8puxy9wVPB8+ZeOjrrhi7EZjOnzEgpEc6gfutF4k=;
 b=SxzkY3bvg13aeG8ZA6XNLiucUR+RhxMD649XN3iR21Pc6oeSZWq7I8GI+D13ECla1s
 Di+V3cZl2s068irRW7wpTJ7D8kUPlscEn0l0LrgtH2lU5JNyMscdBjMO/VVcV+cnUt5Z
 XTUHSNlUGivNIB8d28RtURe4HONq98uPn5huyonSS7Kmy3w+teantyGop/xnhHlV9876
 tqPnKNi6OC68sMOBWTNyjWGtsQjhXCkXoFlrhg1EWr6/s8qZAk2b2Sggo4AipB8uVeiF
 vowu/E5abmFlDiE/4Eqrv0hBsnEnrdlY1T+R7TSqIDGNWrUHxZ++aB3ylqkl4M2g3SUW
 KAYw==
X-Gm-Message-State: AOJu0YznKQDp2RVCMU/iHJMgD7vlQ0hxiz8eckRFbtVNg6t0iUIEr9Qb
 1zjvsL4ZDjphE9H0syvjmn3lwRWvyWf7cmsbjmdwzw==
X-Received: by 2002:aa7:d1c6:0:b0:523:b37e:b83c with SMTP id
 g6-20020aa7d1c6000000b00523b37eb83cmr1999743edp.37.1694180609036; Fri, 08 Sep
 2023 06:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230831232441.66020-1-richard.henderson@linaro.org>
 <20230831232441.66020-6-richard.henderson@linaro.org>
In-Reply-To: <20230831232441.66020-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Sep 2023 14:43:18 +0100
Message-ID: <CAFEAcA9q+ie0Fuaeu4RVU=wX8+JEw=u+i-YuSkW-j+rjPkeUOw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] target/arm: Enable SCTLR_EL1.TIDCP for user-only
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: eWCxLTj0Vd5a

On Fri, 1 Sept 2023 at 00:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The linux kernel detects and enables this bit.  Once trapped,
> EC_SYSTEMREGISTERTRAP is treated like EC_UNCATEGORIZED, so
> no changes required within linux-user/aarch64/cpu_loop.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
