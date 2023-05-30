Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2196519ejb;
        Tue, 30 May 2023 07:01:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ePIBSzgSf3WJy6d56u5+FSxCxBXi6gBHavnK0Se8952FEw1AlW2cs3b2gxiLcZVVxRoWt
X-Received: by 2002:ad4:5ecc:0:b0:625:833e:8825 with SMTP id jm12-20020ad45ecc000000b00625833e8825mr2367484qvb.4.1685455297461;
        Tue, 30 May 2023 07:01:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685455297; cv=none;
        d=google.com; s=arc-20160816;
        b=ls8zufUtYTS9hL+23EB/x613qwNfpQSPksj6UtPVFRQbf6HOv57URTL/U+xKXUaj9c
         YsV4bBDTjBGouzi6poaoKCI1M22J2LHVvgqlXPaB01NlGWYYdINUZwr2npKT/neiydDf
         Oz33RAfmRIrLWKHg+tEHwFtQBPfhR6e2VGdCTb0Ezh/gXVrZuFLVb+EgsJzR6XDvrTnk
         ZxERCnfGprsG7/51uEL4wIawrGXjV0Y0X/uvRiWkan1Nxzab0jrCeJ7r33hwOuahKlsU
         CxP30vV+3vb9m9eHvfkqjFy9WWniJYoqL/AFc6sfpF9hv82QoMuWRmv+QaLfFwae8A/2
         35Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DHVH2pXxxsms3rIR28hUmggnaPwb/mZUwkYDH+pklI4=;
        b=07CCoz655JO6N/PsAN4VaKJDXdrfDjx2ETlaUHEtgt7+Wnnu8ajfOdAM4OUNynRBCN
         YG62Bg27ekZaELzjHOXom69g7tWKMECw8viPIxbcG7eYUDWH1QOrBqFT3+IeeDUru6lW
         VlKHs2TcCMypWeTXUm0nG9N5MRSze3a013gIuoWtMvwMJ+92tEq0EXD0o02WHSaP4lNd
         0tH4XhaoSRPGWzO54PpDvs0ZRxsp0GYQvdOc9M780vdw2WVSTYFs2taiKpe5aaQ6HR9r
         B7uPFh9QijiWZVWKSt1FRP6OJpi4qxsKmSJFxD9ss+heyaoTPoY/2oZDrK8sVz7S1oG2
         lnKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dYDhBTDg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jt15-20020a05621427ef00b00623837c2602si6478594qvb.80.2023.05.30.07.01.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 07:01:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dYDhBTDg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3zun-00054A-4x; Tue, 30 May 2023 10:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zum-00053Q-14
 for qemu-arm@nongnu.org; Tue, 30 May 2023 10:01:32 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zuk-0003wa-FS
 for qemu-arm@nongnu.org; Tue, 30 May 2023 10:01:31 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51496f57e59so3902242a12.2
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 07:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685455288; x=1688047288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DHVH2pXxxsms3rIR28hUmggnaPwb/mZUwkYDH+pklI4=;
 b=dYDhBTDgaeaWGxmnXG7SKabppwbbuBZBaHUpVZ35qrv/RbXr1FNNyY22E3Lg+xzJWY
 tyxdpubEu8IJmSiTNxkBu3mB97I2HtDIX5NGjfjjpPKGRvCQ/4pxaLuW4+rUyjxauH11
 Zacqi+GLMYUcd5oJIORC2s6laH16rr6NyrJKJZw6sVXT2ukGIXVsiGUiSE8imApLHgli
 0fB0BaATG//EbkJFhKH9F5ICusrxsVqlBG+CkVnlTvX5bnTXozpMian4eZRFu6N0o5z0
 apTqkClJfElealOfFfJp/WiPM5KQfc0p/gF9/HvFHDhbU/l4jAo/cDccTyqT/pXSk/hR
 nkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685455288; x=1688047288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DHVH2pXxxsms3rIR28hUmggnaPwb/mZUwkYDH+pklI4=;
 b=hZj7RXsE+1AVsN93VwB0LAQyUlfE5xK1MFYVNHrPT8fV4xBdkN4XWPwuv5UWp/z2t4
 DtI+WYM6FwV72PHVLeVPUFk4NZ7Krb0+VArcBgdriHtmCQ2Z7yBqH/ou5ItEqO38bzud
 iYewJLJGAJg769v3MTaU3dsF5SRZA0b1qywKML1E7HrUfW+QFuk8rVyL0K4RFxyaOY6k
 XVDIyqZofnvhz7iZ0AzQ62j58U5NfEFfgacCCY6N0T78EvjcOJY7nglL0JFw/R/xwMzt
 ocGMJyDFXUivvxhC91FFFsM1R7ITeiGielac+bgFj7Ni4gLq1FGXpJX82sTOOlVn3FFq
 ZNxA==
X-Gm-Message-State: AC+VfDyrUTiTVR+cSifmCFmdYL6Es0E1Z+aXXqzNUlKFA6ZRGh6HKe/O
 jARpyB1DgIPXTXQ5sP+q7NQZy9eeGnUxcd7BqKwiYw==
X-Received: by 2002:aa7:d387:0:b0:510:487a:ca3d with SMTP id
 x7-20020aa7d387000000b00510487aca3dmr1964426edq.23.1685455288429; Tue, 30 May
 2023 07:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
 <20230526002334.1760495-15-richard.henderson@linaro.org>
In-Reply-To: <20230526002334.1760495-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 15:01:17 +0100
Message-ID: <CAFEAcA_QP0Df7m7ZnLNV+EB06rcAsvEZH+ynvS-3gMB0DhithA@mail.gmail.com>
Subject: Re: [PATCH v4 14/16] accel/tcg: Add x86_64
 load_atom_extract_al16_or_al8
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KuQxTGPPuizK

On Fri, 26 May 2023 at 01:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  .../x86_64/host/load-extract-al16-al8.h       | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 host/include/x86_64/host/load-extract-al16-al8.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
