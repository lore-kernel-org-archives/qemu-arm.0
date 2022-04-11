Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1593049lfq;
        Mon, 11 Apr 2022 05:42:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1R0ZQwl68XFIO/yS+qMXczR7eQdPsyvaI5GEI5pIW1Ztui+lIK/L1FlhtciZYlISjDRJT
X-Received: by 2002:a05:6214:da2:b0:441:4623:945c with SMTP id h2-20020a0562140da200b004414623945cmr25909514qvh.62.1649680954397;
        Mon, 11 Apr 2022 05:42:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649680954; cv=none;
        d=google.com; s=arc-20160816;
        b=YU9boDIlbOYm1f1W0o5Tm1jjMZqQ4UMcWK7c3MWalDnMLVFKD6GP8LWqJRLZc/WOAT
         szsUvj9CUILT4lSWpiyhATKEeSTpjvKXGZQFO6FmN2wGB24WLefJUMlOEqwja5KmAkPE
         xXB8B3twO7ZtGQ6at6fvB/bJpk1721C/Uo/lVkPMyegUqad+P9J+py88XRl94HusHv9Y
         q4Uhti5vfBDI2BbnECrNL/7FwBI2bZXKdF1p+skUo2V3bS5mzmLHd8rjzNUitXYh5pRN
         J4HeBCOgw+jcwMAy761SSh/sHd8KMQVVQ4csC568CILDrakBQoxG8VcdLJ5PoVVg3MwG
         /N6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJceF+Fjbu7tooPerwpQur+R/9RqC5tB95zFeSFsN9A=;
        b=0AS9PaVyaXwbJjaew0/AgSk0sYfFGEoPZ+0eNj3lMmGyIsuwCZ4Xz24qJJq5nHMDWE
         /FCbD2HrL3IkLD9EuC++K7lAxhPkhNizXn7z8EIanN0CpwJ2TCeOBd2OzmU454LP2mFS
         /5MbGbjPyiYBhHKjtGddu650i5xZPd4FeXqGztbZi5wIn+TJqw7dkWfjjd56jdVdsV39
         ndbdMCmjUcxBL2948PRfvVnxvLmlmjuAf9vlG0ptGNZtxpIuabxEgXD7p2S3F6nmOFuu
         bSzrTkrTQPOwrqvOKe/guR+XDBsDboQIHencYanzdWtZyTopkQS1VqlLWfIyQC9xs6yj
         ByAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XcJCMpCA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 20-20020ac84e94000000b002e1fbf3c007si613815qtp.504.2022.04.11.05.42.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 05:42:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XcJCMpCA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndtNJ-0003yp-UH
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 08:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtHX-0007Tg-FA
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 08:36:35 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:33405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtHV-00063w-Rb
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 08:36:35 -0400
Received: by mail-yb1-xb35.google.com with SMTP id j2so27292088ybu.0
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 05:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tJceF+Fjbu7tooPerwpQur+R/9RqC5tB95zFeSFsN9A=;
 b=XcJCMpCAp2MzkYHVZIZGlknYSpDjMIXxErGkpJN71EEOso/Ps1IBifYPc9ba+X6QMF
 E5dhw5rgcBNKUGtHQVQwJMwhZzmCJKc6vpi56tXp9VROW4vlxduVSFvgjMf/iKiCRmfH
 UUTdjuXv9C2ba1QlARx57gC4gvURiy4LGXeNt8FVD+7yTg8lHV24IX9LP7WfQeBKuGjf
 E1Z0jlYWtSqc5e67yfVuZ7ZRXrRlP/NF4folxH7S6brmaoJ0vcp2yWOV20EsVmae6Gua
 KO9PcMWAAvlTl1C9jjLI7io+KeKIXd9OamVu/vgXjzjY7cqhuLhBMniqA69ighr0sljH
 XaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tJceF+Fjbu7tooPerwpQur+R/9RqC5tB95zFeSFsN9A=;
 b=SWmLDD4zKwXlMa0y30y8F/MIy9DBgLdQeGdMnfd9K+xFygNmgQ6JbWD5XR29IR/CpC
 yaXjqWio5IDlvmiIt6pL7hi+CZNTcaCejBhJTocJQMYrOjxjkZtczY2PUkRS8yMEjPED
 d5ateDaHNiO9atD+XdR7e67wgMV0pn55lWhpOMBr4c+jM2lqxVzedBZ/ESIhvSAMEwmW
 FHfNo4vQzbkTDS5ybbz/WsHjTW6KQqdKC6WLzoD0pawu0rqSaNegQrnG7EX85D1w2YRC
 8HjMzEDGIfV6KI0XKbAQXJXA8hB3mWDWLSXfLlaFeLIWogx7m59RsiT6qnjAJNe6+qpY
 A0oQ==
X-Gm-Message-State: AOAM533WACYtXtEyDJKOkFr1dUaoJHudlCvctNzyANFmi9++Y8ZFlZUV
 CXZZXytP1CVqlF0Y6HjqxsvkFNGHuQERGrW34kmohQ==
X-Received: by 2002:a25:d4c5:0:b0:641:1569:17a8 with SMTP id
 m188-20020a25d4c5000000b00641156917a8mr9123385ybf.85.1649680592544; Mon, 11
 Apr 2022 05:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-5-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 13:36:21 +0100
Message-ID: <CAFEAcA_T7nP6iGNuAQ=zLZ1HZ35e=9D-MEWtrkhKW4=PgEs4tQ@mail.gmail.com>
Subject: Re: [PATCH 04/16] target/arm: Set ID_DFR0.PerfMon for qemu-system-arm
 -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YmCTIPGisHSx

On Sat, 9 Apr 2022 at 01:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We set this for qemu-system-aarch64, but failed to do so
> for the strictly 32-bit emulation.
>
> Fixes: 3bec78447a9 ("target/arm: Provide ARMv8.4-PMU in '-cpu max'")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu_tcg.c | 4 ++++
>  1 file changed, 4 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
