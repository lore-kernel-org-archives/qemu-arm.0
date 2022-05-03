Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1528603lfj;
        Tue, 3 May 2022 09:26:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXH6JJpGQLqN8+JIA7hmYoSxxDMLTgZq5aF7hVeOf4sc+9cRHMaMiA+6GajqegPgZILtQo
X-Received: by 2002:a0c:ac02:0:b0:45a:91a4:c11b with SMTP id l2-20020a0cac02000000b0045a91a4c11bmr6942182qvb.119.1651595200559;
        Tue, 03 May 2022 09:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651595200; cv=none;
        d=google.com; s=arc-20160816;
        b=IbhVuJ2cBLlcsLGcgBtfRyo+H9h67R/kD9AtymPRxMf8eL8Juo2AcVOtRcnAd2gjdC
         aPot/1E6kgOB1nOi2+G8ZCnHajwqwUC6z8/YLjlqyKf27gw4tEiSvxXXKM29YfC+Rffh
         6HyaULIl2hX9dGHLwUOrEZ6GD2FbJbQ+NslAtHqkOgiVTRuuY+vqTLiq8I1d9iqmMIEx
         aXZ5b75yxNZB6VJ10JdXcFICzzS85XWT2gmPzAqnedsTEp/PLMAqEFqZAmhxDBYMLXlT
         4IrFL9BnuituysNH+HQaGrHpjVyy7qu4cYG34A3YBBBgvGDMcgma5zftfbmBHTw1bPDA
         w4ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qYXrcINYswJrgKxG1tDqrZ2+wZKBZpXSo3N+qSzKHhE=;
        b=pqFHGltrSSYMpR2hKEn2mQ4GO5BHVKCTulmwtUwXrfnlQqbrZ6WCp81bxGXnZ6JAsY
         P9Fg1xJNoaRD2DYsZDl2zIK5c7qkkq94QQ91VLLqx4/7MRrNk7gp/RR0CuVxO4XAoZJ3
         olDJ9TiTmr2VNaiD7/HpYHIb/zvdELdFPuLhdddgXK06CSWcPhgWn1gS+a7uk3Td/8ir
         jjUPPVqN93Gt/jpBhAWuLiHRsfjhOuM9CTSWXIGtU0K+9HkWdQf0ZiL7uGUeUQjNGbhL
         q4OrwPF7uksdapq4C3ZKdjav/1RpcAALlVBMARqNqbFCzOJ2QqjZfexJQ0DIhrF0jGg9
         rbBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xsvnmHEg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13-20020a05621421cd00b0045a9af67f0csi2197522qvh.31.2022.05.03.09.26.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 09:26:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xsvnmHEg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlvMG-0003DS-27
	for alex.bennee@linaro.org; Tue, 03 May 2022 12:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvHw-0005h2-2r
 for qemu-arm@nongnu.org; Tue, 03 May 2022 12:22:13 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:35753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvHt-0007CI-L9
 for qemu-arm@nongnu.org; Tue, 03 May 2022 12:22:10 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id w187so31968688ybe.2
 for <qemu-arm@nongnu.org>; Tue, 03 May 2022 09:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qYXrcINYswJrgKxG1tDqrZ2+wZKBZpXSo3N+qSzKHhE=;
 b=xsvnmHEgCokyjJq6O3apqJ2iFjb/MVlgoPzD9TPMnuyRooH8JYxDYBmFLShjrU5uO9
 cl/eoDuRHffeMOwSvTtGjpoAFt5M1YSm/PIRmEp+KcqMqQo1vlZJ0dMOb3ZF00cYNW4B
 06TfSjLj9UVSG6Rr62lFM/eswshHk9Y4zjh1kpWDsPbSO0spCoK88jkZrFCNUdw+LyNF
 NfW5Idkr8kfn2IIZFC4Y6LOU0OZCEuAy4xbDON+SPYWOVSQOEXJDjQ+PEZz6fvNqKQXW
 N4Vdn3VcBXPFZOynj2UjUU3Uld3zizoVgeII/HX6idSW9DvqQcQMWbmtapP5+YQ2obhs
 neJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qYXrcINYswJrgKxG1tDqrZ2+wZKBZpXSo3N+qSzKHhE=;
 b=N1WJPJk28ZaNhEeinRjbrTEQh7ybvWRom2NuX7qL/ZtNfvwxb8kvuXGQrT2AQ5SiMh
 t9Bdi8i7dVp8p3UMynqMoSHjPF7+u3yMl/IU8E7oETf6AqAL8C4XHZu2mGwhCsDb+jgh
 H7F7+waKC3iUin/kwyIEino5BWsKEvWQGgcc1oxkQOc/SkE4G7uXPECcmY7Og9ai5Uwu
 +0lwI/UGMWIs6D40R2AZUeeHPBdQkpnJBv8SNApuTshq2pE0Bm5cd0zkFu7xLct2a9jN
 sEy5FocGOU0ojckWZDd0kN5IaB670zA/LQkMEDiAkf/RonlEQUES4ZwrfR8L96v57gFf
 NQpQ==
X-Gm-Message-State: AOAM532Sp5g3dQP7uGx8AvvuEaIxt26smiwvAmGTCmMIS30GvMJsKock
 Qp0VbkXlOE8MqAUzZVhAr+Qyy8ygNS2YT0GK91F6bQ==
X-Received: by 2002:a05:6902:1543:b0:649:3124:b114 with SMTP id
 r3-20020a056902154300b006493124b114mr14805815ybu.39.1651594928697; Tue, 03
 May 2022 09:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-18-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:21:57 +0100
Message-ID: <CAFEAcA8GDKyqD9z+Yt7WXJ2o3_F8L8SXHGnZp_huyqThoG=sLA@mail.gmail.com>
Subject: Re: [PATCH v4 17/45] target/arm: Perform override check early in
 add_cpreg_to_hashtable
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: FxLJsfKB++6q

On Sun, 1 May 2022 at 07:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Perform the override check early, so that it is still done
> even when we decide to discard an unreachable cpreg.
>
> Use assert not printf+abort.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)

The reason I put the printf in here originally was that I
felt the conditionality with which we define cpregs was
complicated enough that conflicting cpreg definitions might
be found not by the developer writing new code but perhaps
by users in the field who used rarer CPU types or oddball
feature enable combinations, and I wanted the reports to
provide enough detail to identify the conflicting registers
without having to repro running under a debugger to print out
the values of oldreg and r2.

Still, I suppose it's N years later and we haven't in fact
particularly had that kind of bug report, so it's not strictly
necessary.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
