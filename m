Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp390590ejb;
        Thu, 8 Jun 2023 07:50:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6fxjMw9hVvooRfbSb9ymGiLpZUSCPypdRhZGFN7CJhP/rvX2eqYzx0zXYQ21Ciavrx+YQd
X-Received: by 2002:a05:622a:a:b0:3f5:1de5:af48 with SMTP id x10-20020a05622a000a00b003f51de5af48mr8742035qtw.5.1686235845854;
        Thu, 08 Jun 2023 07:50:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686235845; cv=none;
        d=google.com; s=arc-20160816;
        b=gSSHEVE9nDjunXfbGv4KNW2BjRmy7ed5+WJJOHOR5zBxrBZf4ZG5+Hc84IusrQzCoU
         tMAElqO3+5W62egsIDdkefar8q4UeoXfHG+yRTH8EVZHo+NMbP56sZf/LqyfxALaRKm8
         9JpySD3+KS13jjIY1X64LbmYRlISXh4CaFmrYkuLk39aSORq7lVL2dWGFi7CqXFKILCc
         ggCMEEHmm911Uyz1riyeVD1fEIAFvbIvt8Q5uBuN9bomo0zkASxp0M+mVIOIMOAKeT9d
         5KDISAVhUEd4vELCJzf/HFcDeQmz0jf0KUlPKeSjF7Aoz1ho1xM4R2nrm5ZSmzme9PjT
         WAow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=IbXypd7Rz1mw0LDVS9aDTyo9REcPEL/pMXch0URhyd4=;
        b=vphwT4QT8FT6j1IMzqq81Zqbz5xsJfnZlfudU7EdNhWo7ajLfTAG0XThSa94kBB5+P
         NGhP+mf0akw5nMlZ+erDhXN8Xrdid0lVuSDBAEiRQ5skec2hTOTJp+E0/IR8wmfNbNSO
         4aaiuSXg6KqniWB56wWzrcMH2M95T1dxJTXe6ufK97tLXGKyXOcze23PXRcR9onEts0z
         gKmU/KNN+OZtgqGBYDFiPS6BdEKW/HCCqgh2z5q5o4SsiQAFh6kNh8lf3VyTUdy1ke1w
         ksqsSl1x6Ta+GroTX2ZvCqA8Rue/Ds1Hel4TXJWYybvh3xdzYn9Ryb6CPGYMrGPJ46T+
         2cyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dzZ16daN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020ac87f49000000b003f5f8d4ac8bsi692815qtk.268.2023.06.08.07.50.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 07:50:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dzZ16daN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q7GyB-000331-Hj; Thu, 08 Jun 2023 10:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7Gy1-0002nc-P6
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 10:50:31 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7Gxw-0001PV-Ch
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 10:50:22 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-516a008e495so1508784a12.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jun 2023 07:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686235817; x=1688827817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IbXypd7Rz1mw0LDVS9aDTyo9REcPEL/pMXch0URhyd4=;
 b=dzZ16daNQE2/V1BT62Djw6aY/J0WvKC+CdPbzbIurnlybb2R2cv5fF7VcT3Q7IS4k2
 64dqCzRK5eiT77FSYPOOLWCy6C0lybWr8rt1fD+UCKwovRgRdngt1r+1v8jxvDBI53fm
 ome09XjI8jnl95pXUsMZoLxNMb/cHgvXW7KGhGvVUD5yBqPiqwsDeFHQfSCB+w4YfQTb
 Upx3SaMBq9hzCqgy7KSLl4i3W7pVcTNLQKQV8c4lD3PjbQtn6AixWuVpiifsC9bERriI
 qecbT/R21O4HWB8fwDzwCKAEju4aLSNFk+FG1Z8zL2wd8wdGm4wMmnT/0M9+I7oRDErh
 tKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686235817; x=1688827817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IbXypd7Rz1mw0LDVS9aDTyo9REcPEL/pMXch0URhyd4=;
 b=CFY+L1FbG/xA7zXUnZbqWHm7SzJcY6zyZo7U7kMpEOGYzpltziO5EPsDk2xKM89Lif
 5uvRo+QYt13k4E4eLQ6bnsUhEZ1B923JYa4xPBTC9iAciirh5uNBAmVmFPPs3mkCa7Tf
 h4en9Ak6h+3+EVd/9G92f0RR7A7jsfNew64wDDI8grF/WPUsn4HTri+ibY79WxrAtfJI
 LKezhbRuiaPGuDAq+Xwqp56ypwxaMJQD8HtlV+c9/mwXazVrGixEzCFvkxH3l0PBuOgl
 tuJqCHu868s3uGkBHwP5LzYR3PeSvZq/77y9NtyWBbxwyt9tNF3fj/3PaljY9z6dQcg4
 T7Iw==
X-Gm-Message-State: AC+VfDxyKJ/zQ5vUTr8tx+5S5e6Jnnugr/kJvpwD1/09XkFyz/ZZ3leL
 gm5sFtA4hMXLHKiShRGzUTrNKL645ikOZCX8jDcSVCa2aOTiX/xQ
X-Received: by 2002:aa7:c59a:0:b0:50c:161b:9154 with SMTP id
 g26-20020aa7c59a000000b0050c161b9154mr2491617edq.11.1686235817711; Thu, 08
 Jun 2023 07:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230531203559.29140-1-philmd@linaro.org>
 <20230531203559.29140-10-philmd@linaro.org>
In-Reply-To: <20230531203559.29140-10-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jun 2023 15:50:07 +0100
Message-ID: <CAFEAcA91B3hyMUqHtdMcdH+YurOy+O73fuhRv-_NvOpxrY6=SA@mail.gmail.com>
Subject: Re: [PATCH 09/15] hw/timer/arm_timer: Convert ArmTimerState::freq to
 uint32_t type
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Sergey Kambalin <serg.oker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-TUID: 63+0tHx+JYSN

On Wed, 31 May 2023 at 21:36, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> In preparation of accessing ArmTimerState::freq as a QOM property,
> convert it to uint32_t (so we'll be able to use DEFINE_PROP_UINT32).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/timer/arm_timer.c | 2 +-

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
