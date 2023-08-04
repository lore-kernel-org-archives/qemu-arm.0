Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1922448ejb;
        Fri, 4 Aug 2023 10:55:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4POn+H5bEvcoNHmufxAKIn7UWoLfbxoejgzun//6qFMwgDgLxQ9Qzc+1DIqIXska4KRgZ
X-Received: by 2002:ac8:5dd2:0:b0:40f:e176:ddc5 with SMTP id e18-20020ac85dd2000000b0040fe176ddc5mr3523438qtx.34.1691171732761;
        Fri, 04 Aug 2023 10:55:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691171732; cv=none;
        d=google.com; s=arc-20160816;
        b=bbKXcVI4FZQ73EppzVVXip1HJ3sdntnjVShy9bS58cxLpFqJg8/TqnFqB7cIHgtTKC
         VyYWDtFCMVT26hZYo6m31HXOCCNrZpkBirvgbu8GQH3sTFs84699JRCsf3CrdW4YLfNe
         WqG7CLqqGAhTZu0TIJq32A1tSSAg5tG8j/JS0DR+qRloh8zBYD3IozFQbgsS0YUjic1m
         4RPiDmCSTUSgWWM0yJbqX/uhgqNTaWHP8lgGRDnxkhCc0ZGk/6y09WeNMpe+b31tz9/F
         hVU1sEHOvJKtyHyRFw/RW7duro0nPtOKVw0ZmLU3hr3PxZZOanXhKb0fjvsn8zfW/CJU
         Zhvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qpSkj9Wt2GgvEGZFPe+U/mpLX6PkdwpuMMae8lgDl6Q=;
        fh=CEa3UdY0L+UQ/2T/5R8rkDkdq4jlW1F1hWJjDNQD42w=;
        b=lOgrcOsNhPZXrxG67GbmJjaCYwYWzgc4qNbOuiGv6SJ1ftGzlvdxBdpWwKcBifbXy8
         3oB3DwyEqAm2CH5DCghUH//wp+DaKfmJikC7gvPieC1zV354JYDvwWRO+pL6KP5wZ0hm
         hleDbXopRWtUx38D7jJMlaI2dt/C+GoauqERjU4OrYgcRGgmATZBk1wH3TpsgxgTp1Cr
         3wSa9BgxXpQoLJgzhqAWIgCelzrO/6dxm+k8Y8y4UseTSjobNsp8uiLO41s3EgLFbX2W
         JA2PW+F9coDVBbBs2mhflTM258b5ehjhox374PzWeZkIockV8GfCsoK5gXpna/Kn3pMQ
         P4Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="p/bxFx4l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020ac84e88000000b0040b53b4583esi1562331qtp.447.2023.08.04.10.55.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Aug 2023 10:55:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="p/bxFx4l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRz1M-0004V9-Mc; Fri, 04 Aug 2023 13:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRz1M-0004Uu-5j
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 13:55:28 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRz1K-0004yd-KN
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 13:55:27 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fe383c1a26so4121859e87.1
 for <qemu-arm@nongnu.org>; Fri, 04 Aug 2023 10:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691171725; x=1691776525;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qpSkj9Wt2GgvEGZFPe+U/mpLX6PkdwpuMMae8lgDl6Q=;
 b=p/bxFx4ltoiazj82R8NEKkF1F37bgiMDqC0nbd1aW1JuFWW2wTA3QFxzhAj5SLdwz1
 g55DArupcB6M+ePyqHfBlQ2afqxkDsrpSdHlSc+m4cI/FQ1jWgE+Zavd59clNISz64iX
 gwuyZnsDVZu5QmKJnrAmeVXOj0uTg82UFM3qK20PP1v0jXvTQPcceIryMSgTvIpOMQgz
 IKoz51JUeNj+NLdOZQ6AKtDjn4EG5jTs2FjWEYx3vzTxsQZPGY+rkDw4wtYdjXi6jhZ4
 VFVgmuQBaHGEMueSmTN42t1Vux2NENuQUO6UybP1RCoAbQGlhrfYoaDrr9WpGrT97dRP
 bXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691171725; x=1691776525;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qpSkj9Wt2GgvEGZFPe+U/mpLX6PkdwpuMMae8lgDl6Q=;
 b=G27bNbc+RBTAQRpnOm/V/JfXMHFqFB9EyrzzL6mIXQEGvbIL5v7jGQjb83g38X7SKA
 vUDGOp3e9l4acEEh4iKcfVCD/czCsM1dpODVsRAWl+sUAPLfmWG5BgGEzk9P9Xfj/P2x
 2n2XV7K3WivQaihw0OH+gOL/3wCQ1eiCQggXgz26dd2Zxa026VEpmPo7NL8cAD3ziEXH
 hK++ToSfmTjfnWFlXbjf9/EbnlG04JVgi5e18iUmUIYgoXe5mpi8yb6LdXSO/4r5JFG2
 m9inkTF5bwWHAcKOrW2wwD2uscO9GqRB4xCX/9mSjMRGWGs2wz66wY76gtyVCd8EYpT6
 Fdug==
X-Gm-Message-State: AOJu0YxuLiPdZdT6mnFM/fnDJNqjgrqaYQK/Ha/0MTmFDOhzY+qhGnGH
 KFTRe6B7h6j0WMv7xa6U7+Scf8hfjDIhahw7iZzzSLqLssWpFzia
X-Received: by 2002:a05:6512:4c5:b0:4fe:ca4:7cd3 with SMTP id
 w5-20020a05651204c500b004fe0ca47cd3mr1640898lfq.23.1691171724151; Fri, 04 Aug
 2023 10:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230802170157.401491-1-jean-philippe@linaro.org>
 <20230802170157.401491-3-jean-philippe@linaro.org>
In-Reply-To: <20230802170157.401491-3-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Aug 2023 18:55:13 +0100
Message-ID: <CAFEAcA_PwcBQYQqwJHpoQQoQ-FmdDzeYpcmASpD=piBscTrX=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] target/arm/helper: Fix tlbmask and tlbbits for
 TLBI VAE2*
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x130.google.com
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
X-TUID: h/geYj8dqn+N

On Wed, 2 Aug 2023 at 18:02, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> When HCR_EL2.E2H is enabled, TLB entries are formed using the EL2&0
> translation regime, instead of the EL2 translation regime. The TLB VAE2*
> instructions invalidate the regime that corresponds to the current value
> of HCR_EL2.E2H.
>
> At the moment we only invalidate the EL2 translation regime. This causes
> problems with RMM, which issues TLBI VAE2IS instructions with
> HCR_EL2.E2H enabled. Update vae2_tlbmask() to take HCR_EL2.E2H into
> account.
>
> Add vae2_tlbbits() as well, since the top-byte-ignore configuration is
> different between the EL2&0 and EL2 regime.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
