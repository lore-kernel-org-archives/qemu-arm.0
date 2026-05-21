Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDF5CD4F3D
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 14:06:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ42A-0001WY-Ty; Thu, 21 May 2026 10:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ41t-0001JO-Qm
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:05:43 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ41j-0006CF-Mg
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:05:35 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-65c0bda7f15so6179257d50.0
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 07:05:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779372323; cv=none;
 d=google.com; s=arc-20240605;
 b=RX/heuihQF7x+YBgrgdNcjn3iiHaLLFFG0RJAwQRJQ9m6po/mKUtPM4yAwnNCSYjd/
 1iO6bUcrIlttSABwM4ZQbhFWQvWX4jHmXhy7NOlvy7A4PDurjlysdW4wu7eIayGoWsBb
 zNW08XSBfORBPQ+PIheH2fbK132NI94S+WelBPwytxOVrgYYLbZc2FguxapsW05PrX2f
 3y6ChidyWF9daM0+J1qRiTIIzJ93qzaZb90/3RlwMPJrFhSnnK9zrhuVxKDDPbBNaj4q
 m2Ky8wTArfUqkiHGGoP0XhTcW51TNt6oBCVYFBcD0df61L/+AMrOMVjP5n2sgYHEYqxF
 t+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=glCp+je1rn5P2pXLcdWdgxumiY4iqmYs0GuwWcGNqfY=;
 fh=9uBtw09qSiGCTPmR0ywhooCUZuNjLKKljtqaejKzZGo=;
 b=jJ28VUqM7K8GzfchtzHSx4EjWspDZuaiHGAmBp//9ifrCm8YrPhfvR1Igz/TVJwi+r
 1dxZUqMolb/85aGxCCMa5eg9aq/ltbCYhebg2ukc7VVyqu1y1S0bj/ngQ7YgkNdCM0hk
 H7hVoYjXxiSGMDU+d0dNAKsWQM3kj4lmHGaReDXqoyyJQEwwA2jikJQDUm3+PjMVMHwr
 nMIz+DuUwbmP9v4mtpgYiJygdBL+sAMX3zslZ0QxQViIfyHCTFPUE1Ru6y/nsoFuveri
 qhT5igNQvwHAOMwcKo/MpG8hfaOXFDTsSZrPLNIQfXLJyZ+slqF/tHMIw4azs+pXclHL
 LJew==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779372323; x=1779977123; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=glCp+je1rn5P2pXLcdWdgxumiY4iqmYs0GuwWcGNqfY=;
 b=PEZS7dc8JEnnoWR7aNajrtmaREie3pvp6qdubQrcddOV+TEjUNDtPl6TBILd9vKVRW
 JrSFgz2Ks4YVIFlLdPDE10a34H+NRzOc4w6tQnKb9YqZfIUGNANvd7z9D1UYjYTd8Dok
 FsHGEMVSzW5xmqiaOkch+PJCKxJVSkr1eEp1Mj6YfmZZ1BJHvgrOAKtRZoAxNwTL4uE8
 pAlYQ1I9Zk70rkrbQbhhulL55OrbnT4Sh+ZzFM4jUAKBEw7ocGAMBDOjNjy03Zrx7FHu
 5Zkv+Xt8KIbb1q/Sw5hkvYZEgmFKD/KFaMtw+7G0n3bFbjO3FAryz2ZcZMnFeTCUME30
 Lplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779372323; x=1779977123;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=glCp+je1rn5P2pXLcdWdgxumiY4iqmYs0GuwWcGNqfY=;
 b=SZg12vl4zldSN12NgymYRugIO5DEWPWOxw+yi/sQdl4pW6J3IqscW2bXBi8X+DO7jE
 0Q+w/Oti4iaB3Y9yvKJNw8S2iu9IKt6qzllyGS4syMAgFkXvH2WzFxciGZglVVDmKmE3
 meGmo+vsl3AZvH5KLfSsqxdOfdD2uQnGrBg79OL+zno9XWwlaRQFO9c1hw9lZDzCv+Kf
 I3TsMywQJ634FFlXtxNqr94xrcvzWS/fsioNYrCkIMF0TWrnJyas3FtgI/3swXpHvDhk
 xMXYwvYvB1d5sYSq8w7gWBrCAruStiXhKHZA6D2t1NNalnXUv8EXjcHA0h3yLr+9ZD1l
 vJGg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+OHcZrJiD8T+UGBeq+qf+wqkQoEXjB6KZuUKiQCVNboEZDvLBZMLSw3iF4BWK7za63ZPRB6rPEYg==@nongnu.org
X-Gm-Message-State: AOJu0Yy9gN7X7ZBMfyxJgzgoznFJsishh9ga0ozn2EmkJa+2VoIpHFD7
 JBqrLqM4gnT19zJ1lhnyGJI6gYtPkBHpka49vKCDMMj7tDWweElw5FhvcSjvF410lwMlfqlaHzZ
 4S28PAS30ONuYZyLMKkzTvaDHfSQ2WNzDdUc/wvOlOA==
X-Gm-Gg: Acq92OF3GMAjUwY9jcC6vnyekz3iTKfqExoS15DFzo/kKsV1QYqGb1Zz1KUfqTyUjac
 tyaHbksAOOnYxUcudfa4NublEQPfIwIfx8e03eQxH7/tmfIgkflAOVbEpAZAlAoUMVRlYZLP2h8
 yFSjRVC/ea2W5feGERjg11X4dmPCouDdNtaJADMrAUTpOkF3oF0iLP+q2wKVf366RVc/Yrib57D
 +Gh2UStR0TMZz9CaQ2C++dR5uk0bgqMaEhhZIaM11x9vRLUrdFYeuRDc1vZ0qxoX6cfu5YatETW
 bKTPyYRbKDapAQ7gAMBsUAxDGDo5o0V3q4yT4yJaZ9nTAYESCHwFaMxFMs8kvdDIsoLbLmDCXuS
 tog==
X-Received: by 2002:a05:690e:4005:b0:658:a18:cdf0 with SMTP id
 956f58d0204a3-65eae04b9c8mr2467505d50.29.1779372322588; Thu, 21 May 2026
 07:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-8-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 15:05:10 +0100
X-Gm-Features: AVHnY4LqOFoCm3gjOXHMXDgktw6dOeTzm-XZplVIIAcgu49kGFvP-RoA1aGl4-Y
Message-ID: <CAFEAcA9sOVf-R-3xDmvKYeHdEkCXJnC1P-nDi6h4YZYqdpiURw@mail.gmail.com>
Subject: Re: [PATCH v6 07/64] target/arm: Update HCRX bits for Arm ARM M.a.a
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 20 May 2026 at 19:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 00830b1724..f02d3c6a71 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -258,7 +258,9 @@ FIELD(VSTCR, SA, 30, 1)
>  #define HCRX_TCR2EN   (1ULL << 14)
>  #define HCRX_SCTLR2EN (1ULL << 15)
>  #define HCRX_GCSEN    (1ULL << 22)
> -
> +#define HCRX_ENFPM    (1ULL << 23)
> +#define HCRX_PACMEN   (1ULL << 24)
> +#define HCRX_SRMASKEN (1ULL << 26)
>  #define HPFAR_NS      (1ULL << 63)

We should keep the blank line separating the HCRX bit
definitions from HPFAR_NS. Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

