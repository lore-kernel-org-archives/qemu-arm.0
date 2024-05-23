Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1085371ejb;
        Thu, 23 May 2024 07:06:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2vUi7fVmx8zRmvBQGpenweXwcoxOlqVG4i7BSahEasx+NFf/iGJGz6m2Q8zsDR0uTAOSEmQ3UrPVtJa7RIdhTwdAJwGFJ
X-Google-Smtp-Source: AGHT+IFsVVUm/i9hTpe+uNwCjZVgyCcm0UfbBjZ0AxTy5Fp+J9h9MzUynBvY1EDai/dRuLy5jDfH
X-Received: by 2002:a05:6214:4a8e:b0:6ab:95ab:b005 with SMTP id 6a1803df08f44-6ab95abb336mr10862726d6.19.1716473210849;
        Thu, 23 May 2024 07:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716473210; cv=none;
        d=google.com; s=arc-20160816;
        b=iPPAs96iXULpc8/ym/BgrpERmhTjlwKRsrq9ZXoiu/KO1tLmSA5K5QRLTGa6FzssQH
         IsEhBQD4oYIa7Ju8URzbqiGDDnfPVdNy+j7vdEk8TjNXusYCr4MYrsoeWNEvWoLcopq7
         8TBT9nrEqoXPLDxRCebnnaAuFSQjQGMpGbc4Q/nCgEF7zsj/8AQylwwPuXHROhWR55S9
         +U7tL1KtPfHywUFcnd7DMFbSuvsTH7AtalJ8+/juEKICwShWnYnYHHjA0doCPaJzDyOj
         jXsUApHQIuSLwvTIqer7uK77RZhbLrCQbmLe1cTxnV+PyRX0REfY09/UikN6cdirGXPo
         8d5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9rFSUfimECnsvmjfdVjPqkmnRMPFPCgoStLOvy9N2Rs=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=Uv1ldItRpglfVbGGpZdZUedVh8sqdOBJhsGzfE+Sq9cpk8aQ/Yamy2PJ+7BBOzoBH5
         UkYg27t1upX552kmCFYBNA92V/aVnNuIHemlCTKlgPY3QNLC4nutsj7ADczWFsImC6Ir
         JOuPflSJHQtnObPDMQrknYCfbfNFErx7A7sAxtRK+UqV9FjBQZv5ZBFP9KUo2rLbCP/0
         vkSBoBlfQ2qO4AG8rHLj7EpAqSIZCQQ+F8D+OR2rHzGMbH4YNFGN5rT7EVtqQq+9+287
         xcFGOMOtDEGzIjpM8l3PmZ/tbnHeoxuBu2MVfNfK+/xRoEDK+gH2PVE74GQciq47EO7I
         nkzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RKIibIPj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6aa9d31a721si100596936d6.163.2024.05.23.07.06.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 07:06:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RKIibIPj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sA95T-0001LP-6Q; Thu, 23 May 2024 10:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA95R-0001Kb-M2
 for qemu-devel@nongnu.org; Thu, 23 May 2024 10:06:29 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA95Q-00027K-4V
 for qemu-devel@nongnu.org; Thu, 23 May 2024 10:06:29 -0400
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2e6792ea67fso95066351fa.1
 for <qemu-devel@nongnu.org>; Thu, 23 May 2024 07:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716473186; x=1717077986; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9rFSUfimECnsvmjfdVjPqkmnRMPFPCgoStLOvy9N2Rs=;
 b=RKIibIPjvphB4IfvZ3ei8I3Joe3HKUjXAkJAA2QeICfq5Z9U42yglwDDY19GMxJR/e
 61pnpqeCmQIJ2/84exGjJZxsXF8KIHQ3V4vX1c1YLyoZAsPVDdG/+NTHbrCQJzTh5kF9
 TSrgtGJnt2+ebq90eoL7I24Fq48BlKHJYVq+K65zvkFOkH/ZYdzXJjvR01S2JNzhTFW+
 GfR8CgbC9RDdNTIctWqZAq+GCbzaP7OhfRqz8kEjcpbQ06qihOn8aSqTmkcef9QqtwnK
 Tg/9YHc+XNXbhUs0Pw0bZOtjxBxePaYo6n2pES1U931TGWFmAQxt7143Ob8CtB0a04Aw
 OYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716473186; x=1717077986;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9rFSUfimECnsvmjfdVjPqkmnRMPFPCgoStLOvy9N2Rs=;
 b=qsaIOHVJqycXnTcLaMnNOIdaCO8GvxL8wxc0GszOtDTI8AE3tacp621OyViYwPAI3Z
 FDAurkMWirhHnm3cYow4hTt9MJzcH68FkJ9CaQPum/3HR4QpuPoAuy5yj6bkPjvrE5sj
 0EOImPiJwqkemnsdaz83mDV7C+npvMoii5/CIUnjVuc8dV067nupdtj5bIsOStOO3upq
 Zr42KC3cHh6QNRqJ4rONz1LVGsEFhxvGuLvmiBez17Xcoe8nGb1PILwBlb80X8jMeR7a
 hZxq7+lNGzg5Z9ImPHNSOESIf7Y3BRUA2YWs7pSTlmpIo4gWK9YVblKYXravtYQEyEDi
 900Q==
X-Gm-Message-State: AOJu0Yyi5nOFvi4iHIhfB4wVCvbj/PPB0Bn5Ku65uIYKIZRJCLIB/WlZ
 8rlTOjWnD1lAuxO/KGlQ62CT1sMew+YmyWmZpi6QM+xUv3L/2eBvD0HThvsNw2O08xes14n1mNx
 XcWD25FuGkHMu69Hhlf/ymIqxyIsAa38P0xDs5y8QVRCt1hJ3
X-Received: by 2002:a2e:914c:0:b0:2e9:5389:f4bf with SMTP id
 38308e7fff4ca-2e95389f520mr10678061fa.7.1716473186397; Thu, 23 May 2024
 07:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-29-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 15:06:15 +0100
Message-ID: <CAFEAcA8pt44cfB-f+2F4J7du+MvktZfBozUvjJoeOug7Q+FUyw@mail.gmail.com>
Subject: Re: [PATCH 28/57] target/arm: Convert FMLAL, FMLSL to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J8NXwqfBUbS/

On Mon, 6 May 2024 at 02:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  10 +++
>  target/arm/tcg/translate-a64.c | 144 ++++++++++-----------------------
>  2 files changed, 51 insertions(+), 103 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
