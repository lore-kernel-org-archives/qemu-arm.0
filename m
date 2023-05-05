Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp422804ejq;
        Fri, 5 May 2023 06:35:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Iljy05678eLdBnclXPL3FGSgGdIRFokxhHZcV/tw+RnwHSznR0U+UMIOf0RnAhEiMGHNH
X-Received: by 2002:ad4:5aa1:0:b0:61b:5d38:b736 with SMTP id u1-20020ad45aa1000000b0061b5d38b736mr2186824qvg.35.1683293711449;
        Fri, 05 May 2023 06:35:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683293711; cv=none;
        d=google.com; s=arc-20160816;
        b=ERaB6GY0Q2xwPR2H+53UfwpTftlOhP/nfzoAa76Jf+ANHMvYlqt2NPp0w9gcrYoK+1
         LOm3uPURWYnhUEUe/e2SJESJETyQ2jJD777fSRlstBUQj+5CQm528xtkc9DILb7FpJE6
         kHxforX3GajppTOAtwX+PRfB2vFMTLSRjoh0+zk2em+8dSiM4gbZcGEMlf9+nqzaKF0n
         vTpmklBJvcI9MAhHiXDnwiBR727owcZ8pbXn9MjVnzsP9x98UcGiIqGw/5dghRf7LGCk
         ZMO6fld2Dpp+AeoH30YU0DeffLshVTUMHwHjXZkSxuKv3Q+mdDVuazKRlgAynmvz4Ydr
         RWAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JiFvrogM9FNyydo5CDO77mDwZeLm4Zeu80VVzg83FQQ=;
        b=p9mq05gGZqj4N3nrNK7jnu4Y6C6oM/u5AHZf8zcs2mYGRWVsIUQwJAkBYmBbZRsh80
         mU4vnPTUtgSDkIRXsW2QyYQkzB2/iNnWalCB8Cvz5bS6VXNcLLeopvUuye8Z75Mjt0BD
         ow+vl2OhVodpPubBB/o8vZz5wfJGfNiS+JjWEeNAgABIwTBhKDQhlZoyxqP9VrdCx3Ue
         zBVEX1qce3GkhzP9GbcQBomojM0AjIjJN8IQCTlIW0HKwKrEdaj3dXkF9n5BI5+8zbvr
         HeKQc+lFnLNYbELmXjIPEGttugfw7HbdsKeHdXqjUYs+dhoClVEBBVsawLfqJhw9dk55
         t2Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MfS/3yTJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jm10-20020ad45eca000000b006165a0e3785si612051qvb.544.2023.05.05.06.35.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 06:35:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MfS/3yTJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puva6-0003xq-Ow; Fri, 05 May 2023 09:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puva2-0003vn-Is
 for qemu-arm@nongnu.org; Fri, 05 May 2023 09:34:41 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puva0-0003cb-S3
 for qemu-arm@nongnu.org; Fri, 05 May 2023 09:34:38 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50bd2d7ba74so27047920a12.1
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 06:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683293673; x=1685885673;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JiFvrogM9FNyydo5CDO77mDwZeLm4Zeu80VVzg83FQQ=;
 b=MfS/3yTJzsT1NxRogUvsXhH7SUJ9wfhn/XfzSgi+/o0P9YBIk7BBluRNLbCZKm1aP4
 N2CixsA2I8nRD8kIjcWhJzkE01j7ho29mg+f0J9PV33BYtu/yx+/LsMzAiBACxz2zXFV
 ncdiuUnU7fwt0viakcFlcPhIJbVNqx01TyKA+Nzd2osacMoDcrswph3Pouqp8szZmFl7
 4suQPlOMJ/zFmxDtfW2faqRYMQanHtl4HJyLapqSY17wI/SW1+WvEhrUbFxQ+5uNuhnX
 MhF2LO84NrlLpth8D5gwuZON4gSFjs31dnBreOwkg/4IuLRBshUmkOCfj2B6zhyzkpIg
 tPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683293673; x=1685885673;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JiFvrogM9FNyydo5CDO77mDwZeLm4Zeu80VVzg83FQQ=;
 b=cUkjeayITAMVbCZ4a98BoBy0otTMc5eS2CiOcHi6aOA06kA0uREi0NfZcYksT8X0nx
 CkBdmdxU30GZzqDlIVo+poNi5Jb6qjw0CXVViGOXAxoq3Ot9kSfkOJmfjO3UtnsSkhpo
 WkaSFnRE5OK6Da0nxKaqlPQhIl4qNp8UMWyASa9irDwXODh7fI7Z1LHbX/68ZC65z08u
 nHyHTCSf735XjL3vOKyRugI/P5mtg5FnWI0kRA50dp7LsLfVEvPGOleyUWSMJ1NoabWL
 4pT2SOONmPhQQyD9xr+jJHeVYRS9Wo8GkEGUbAAC24/FBzksC6O5fiwajOy/BJDup48b
 8tUw==
X-Gm-Message-State: AC+VfDzdtVUPMS+MZU9sq8/P2q9h8zPIVQpCN9uNYMTFomwHZBfZj4rr
 cmaMWpBCNwfXhfwJrlgZC4jdvTiUC9zgsKd8i3Rcz/+Hqt/Db3Px
X-Received: by 2002:a05:6402:5202:b0:506:bd27:a2f0 with SMTP id
 s2-20020a056402520200b00506bd27a2f0mr2333862edd.15.1683293672734; Fri, 05 May
 2023 06:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-54-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-54-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:34:21 +0100
Message-ID: <CAFEAcA9s+_XsbiKEaapmt0Wi_F2D9fykmuFdvRh3QRFDRsinMw@mail.gmail.com>
Subject: Re: [PATCH v4 53/57] tcg/i386: Support 128-bit load/store with
 have_atomic16
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8cuOuJ+7b6A1

On Wed, 3 May 2023 at 08:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target.h     |   3 +-
>  tcg/i386/tcg-target.c.inc | 184 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 182 insertions(+), 5 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
