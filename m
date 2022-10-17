Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2267444ejn;
        Mon, 17 Oct 2022 03:03:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4CxNqr8Ra8ajqWrht6nl+VSpGLblEa9LH4c2HEwM7yijXLnpm5OHkMgkEcHo60ghglk04l
X-Received: by 2002:a05:6214:2a8e:b0:4b1:c79e:d58 with SMTP id jr14-20020a0562142a8e00b004b1c79e0d58mr7721514qvb.113.1666001015005;
        Mon, 17 Oct 2022 03:03:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666001015; cv=none;
        d=google.com; s=arc-20160816;
        b=uMxugcDpXTtT2cwgP4EFuMSxwCJJPa5ZnfAADbbTmOPAktoCzh5Qc06zUZDL0HxdHf
         2uCOsAB9SitXNPwsEK7cL3qlSHOoSWCHFyt4xnQbhzvQBLm23FXUkQdSy0FEIG7wd+Vf
         2GE6fv/PDlno3xeDrbkm0tvAyRy4Lx4NZeyKqE+QReCGRfVWyy5fqCIOVWR3ty1SZa/8
         P8Jm2cTFXYFZxPcOusswgEofRZXcJRxWYkc2dlvPYzrfCmNQpTEW3wmhv3S8gbk5SgXX
         Dabdk9vT5ac+KxRVy48iLoL2CiCIhQ80EnAy+MW51vkGoZx8iyEkeW+cBG+gBUBrI/YA
         VHDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=p+ZMSXTJyDGGWTu6iPzszVJjtq/DklNxtbL7y7+n6nU=;
        b=lm90kXEsiHp7eJyy117HLe5XCL0TIxX/KoR8TMFwejTA47KJy5pRw/T6Ssd4q73D27
         zlINfiM89LOQx2PcS5eRR0wwNmjdTfAcJU2mm5c5maeeBQArGb4aRbrx8xgOI2UhB1WA
         6yIHG9gEph7CRVvGjPWj7IQPuUC04jrnppOXr3Md7IfI1IAzq34nKDjCu4ADe0EAxzWF
         mI8ZMVX8LfCeF3dvtkGNcKddbJvlkicLmip1lX6I8CyDOXF3zWTiE46WbFVTnJ+SqMAb
         /fnD9QDKBM5wsExEzDowWBYmAsDefisS6ZZ09pqvDUYUhE+ukd0X4w5wZ3f7foeMNbAa
         v9BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f7z7lw3u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x25-20020ae9f819000000b006ce1a3b5321si4876099qkh.252.2022.10.17.03.03.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Oct 2022 03:03:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f7z7lw3u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okMy6-0003RS-FS
	for alex.bennee@linaro.org; Mon, 17 Oct 2022 06:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okMwy-0003PC-4R
 for qemu-arm@nongnu.org; Mon, 17 Oct 2022 06:02:29 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:55269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okMwm-0008Na-La
 for qemu-arm@nongnu.org; Mon, 17 Oct 2022 06:02:23 -0400
Received: by mail-pj1-x1034.google.com with SMTP id 70so10510932pjo.4
 for <qemu-arm@nongnu.org>; Mon, 17 Oct 2022 03:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p+ZMSXTJyDGGWTu6iPzszVJjtq/DklNxtbL7y7+n6nU=;
 b=f7z7lw3uewBtqDBFEFPX1iUyGyAeZ5lQF+jY3ugxTESamo4P6F4RnwV4tFQ23VQE8G
 83tfwzkFqKAcd1lJ/ougyTWt/ysOmgocd1l80kwCa1ioorft0jZE8PQwQTvpZiVxhKDP
 ksOm2yZwjRHn77TW4atXYB+Lxjpte6wW0ZINWlS3CGdX3x+vEZonmFQC4AEgLOy8OG++
 LMILc9IRraJUqZ9GkC6JmIs57vb7juiCt/cli+kxZO1mTw17qgzU8Zdq8x4HnVkyx0FI
 JXkpevoD3DLRzaWnLSB+zwUO0/zZBEohQDOQkVhtwT7EQCN+dXvBi+Ecuu71EN75GusV
 lcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p+ZMSXTJyDGGWTu6iPzszVJjtq/DklNxtbL7y7+n6nU=;
 b=KOX+PXTJKp70HDs9eunqjrgB/lxbFHxbl3eQi4DL4UCn0hhC/Cywe0aLEmV9Tw8pYQ
 ovHFU3kA4t1QDJQByUUIY5MoCpYNw+/SzZgXfVUxQTtZCDUru+sxhsn0fNgMiYrmcGHr
 Je8yncIWjLi6PPWHnzsVP6O47yAm4OmgCFsVV3mUf7huIMCnRxk33zwcUhOKFCnkOLqA
 7YEoS1IZiSgDnYhX8kreJT/MZdjeXbYpWOEw4ChFt60uNUTYbhUzTuzbhKmprpFRdZCE
 smT+ZYL8ipOLRt0O041WHmHOk7UlLocwv/xE2jzbSp5VpD1JrOO+bRsuPwSYq8SkgzhH
 hG8w==
X-Gm-Message-State: ACrzQf0iyauLkkSQs3/2IPYj2fTNWLRaerMJVvtZd2P05VQOrAKAqtJJ
 MWxLIeRRjJzlrT2cu0mlYalnhtLtlw+x7R1FHoBwAg==
X-Received: by 2002:a17:90b:4b8e:b0:20a:f240:9b23 with SMTP id
 lr14-20020a17090b4b8e00b0020af2409b23mr12922221pjb.19.1666000930868; Mon, 17
 Oct 2022 03:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
 <20221011031911.2408754-14-richard.henderson@linaro.org>
In-Reply-To: <20221011031911.2408754-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Oct 2022 11:01:59 +0100
Message-ID: <CAFEAcA_Vdc2Cxvwnd_tc7ik_-NMXk_z0URsV=r7eGYy3bqhstg@mail.gmail.com>
Subject: Re: [PATCH v4 13/24] target/arm: Add ptw_idx to S1Translate
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vCbBS+5HxXsz

On Tue, 11 Oct 2022 at 04:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Hoist the computation of the mmu_idx for the ptw up to
> get_phys_addr_with_struct and get_phys_addr_twostage.
> This removes the duplicate check for stage2 disabled
> from the middle of the walk, performing it only once.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> +        if (!nstable) {
> +            /* Stage2_S -> Stage2 or Phys_S -> Phys_NS */
> +            ptw->in_ptw_idx &= ~1;
> +            ptw->in_secure = false;
> +        }

I feel like this bitwise manipulation of the mmuidx values
is leaving a landmine for any future re-organization of
our mmuidx use. Can we do this just using the symbolic
constant values?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
