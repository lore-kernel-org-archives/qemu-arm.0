Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2696939ejq;
        Tue, 9 May 2023 05:57:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7m1q2xFw5MmBNULKgiwjiDaSoasPp1re89drq375GspF+VSUAN2+4YmSSZNuwiF4WS/Yvf
X-Received: by 2002:a05:622a:15c4:b0:3ef:54c9:9869 with SMTP id d4-20020a05622a15c400b003ef54c99869mr21631579qty.31.1683637074935;
        Tue, 09 May 2023 05:57:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683637074; cv=none;
        d=google.com; s=arc-20160816;
        b=O8w6HYLs17yH0U3PryKw+CcGBsxpYVT/V6X4AetD6m39AmeBC0HY23F57zgD2nO0EB
         wDSoqT1ryqgN1tAcjz08EfQfoEXAVxRzP5E373eV2TWx+Yrxt9kTOuDdAXxHxCGMHftR
         1P6SVbCVf75EDl1O6DLeJEfZOdytmlT1zt0oR/447+e3bNwgtCcZR+hk/Fo8LwLYmQxr
         0xC2JyFMyCVNR3YxqYYjNW/arifLHTYQ8RI5OH1wTaul4H0VCX8RqJ6IQE2BwKWNXwFm
         DQA2gSIUGBf2yRoF+zDzva6SROFZohitNKmAFArHpCcAaF8jzQ7LMSQJaz1NOU+HbfCR
         SJlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DdkgmnSHaeTsxvAVe1eOiLRyYIM/6lU4T+nKMkU1rfM=;
        b=CqMELWNqA/QLTVOfoO2V2Wyp2hfconaAz94SpD40qJES/zrlZb+dZLL56IxRIsuer+
         O6N/TcyTb2KvUfq++1QVlLYQDMRyRcTzch0NrB5xee0CcEXS8RIs5q0Fe1Wh7xsDfjGd
         kde1VNjqzb1MuIzkk45CoG4YqGZ53MDntb61vbOLOFK2x/hrI1ELQICAGIPGSzU8HvnT
         lSQgvh0vNOcagdUCahGEczvKkmsrwh5ZcerqBGE2ZgWVYHR3NhSUZTSFPrzVrj9kM48S
         8tW9ajmj+x6srCVECmpEQvDdHvBJ3pRXVcVTJebb3wDe39fSnK2iKGpL9urbuz26VUaI
         8Fow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e92IWx+a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9-20020ac857c9000000b003f0a40a9f08si495708qta.278.2023.05.09.05.57.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 May 2023 05:57:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e92IWx+a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pwMuZ-0001Do-Uo; Tue, 09 May 2023 08:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwMuY-0001DD-OF
 for qemu-arm@nongnu.org; Tue, 09 May 2023 08:57:46 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwMuW-00028A-IG
 for qemu-arm@nongnu.org; Tue, 09 May 2023 08:57:46 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bc4ba28cbso10643604a12.0
 for <qemu-arm@nongnu.org>; Tue, 09 May 2023 05:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683637062; x=1686229062;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DdkgmnSHaeTsxvAVe1eOiLRyYIM/6lU4T+nKMkU1rfM=;
 b=e92IWx+azXcaXYjPho+p5L4quBSKq+aEqmSLTnBEjXGmF/tmb7J8uZnxYYToR9/oHX
 37LCi5/gbcVVu7HQYX3MtlczxANMA552RemT9rCP3XvyfEk8TlIJidkD32EokPUGJcpE
 DHZkbugAM23L6nz23bsUBhNepcWYPA5tL811euA6JUe005JjBfpdEhy0elN0fdE+JOWQ
 +oT6+qwm8QwD4ptSryNtYp/5NYsN1VeAtr6WpX3azt6lAybnagHH1zbSwnBaZiCkOvU7
 ejr2vx7WsaS2LrfL1CXBJwFxam1r3Y/2IvdwZc+MtA19ybH3pubcaWHLUDn3IrI4Rc5u
 sm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683637062; x=1686229062;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DdkgmnSHaeTsxvAVe1eOiLRyYIM/6lU4T+nKMkU1rfM=;
 b=bq2aSqZ/F+ySM65edVD4Y7HXUjOE9kRJnbOHWLAFL4uxQm/a6CnL21ZqeTcitiZ1N+
 F5zpX/6qW3N90AFhYHD56p55uzeI8OKtzK9jHvW9GX1dKZXohn0CCbVSpwbTmLl8562E
 XEbf4KJQN0G+q2oOtGpSZ3iTogB26vlHKsw9evadSi7Z/3OIP95HI5SGZR1bULv9Sbis
 ruSQMEIHANO7uJYvx7za3uFfao0EiZEcFnbGhpu7XI5ozqDvD+ULQ7cE8dda9lr3Renl
 sqtG9cWX+NJRVzmjmRexmdXYeTXDz2u+EKlxrXN1VsT3YFZw1gqEC6h87AeVoWjci7Xj
 RMCQ==
X-Gm-Message-State: AC+VfDyhIlFh5lzii7ruatL1AVBcATVPTWmz6wK/pqjqHG3lFG27bGTh
 kMmkh7mSZebR+D3aBAf2FrAYqOuDKCLbUzqgnilTsQ==
X-Received: by 2002:aa7:d7d4:0:b0:50b:dcf6:8e6d with SMTP id
 e20-20020aa7d7d4000000b0050bdcf68e6dmr11437829eds.18.1683637062028; Tue, 09
 May 2023 05:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230504110412.1892411-1-richard.henderson@linaro.org>
In-Reply-To: <20230504110412.1892411-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 13:57:31 +0100
Message-ID: <CAFEAcA_+wv+K-_uB8kdjiJtbjT1fYF1OZcDMqvR_u9QqnidJng@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: Move more files to tcg/
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: thgk2gtzxquJ

On Thu, 4 May 2023 at 12:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move 7 files to tcg/.
>
> r~
>
>
> Richard Henderson (2):
>   target/arm: Move translate-a32.h, arm_ldst.h, sve_ldst_internal.h to
>     tcg/
>   target/arm: Move helper-{a64,mve,sme,sve}.h to tcg/
>



Applied to target-arm.next, thanks.

-- PMM
