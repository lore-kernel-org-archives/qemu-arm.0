Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571E0F01835
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 13:32:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyVI0-00048O-M3; Fri, 06 Mar 2026 08:32:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyVHt-00047n-SI
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 08:32:18 -0500
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyVHs-0004WT-C9
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 08:32:17 -0500
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-649278a69c5so7986108d50.3
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 05:32:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772803935; cv=none;
 d=google.com; s=arc-20240605;
 b=SbrOqKAfVE33RMmQ2MT6s3upq894k1odgBHqxSAcPDyoPCeTiBhxV6XRo3FSXIGex4
 1FsUMZBV4L+WXnARB+MbXRXmdK1n51B6qJLN8yTUaatcnOwX7OwJriLfBJ+zllIxmBDE
 hBTfE7RwgOIPbzhblyohx61kXbkax/DV6Lzqe2yCNuJTVn4sUL29OV+W6N37YKX3vVBd
 Z+z0f4c92PfY0A439IqzpBAyX0wJuShWlhK2FN1Ijo+TOFuqSZoe4BIPhmEKt3PpfPEY
 /mBSU5koHjPCKDzqe1C16gUSMmwsEsAqMGMU8Q5Zhg2hv+mbgZ/U3Z5EpYGQLMQZsTCx
 dX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=/2aL7EZzHA1Hp6SzmIMbOvN3v1QTlUg2peaZ7iAtZDs=;
 fh=Ozu+PpjXvYMWQUF6AuPQ3tZdVJ8J4joOaHFW37zJTPI=;
 b=ktWwNBr9VjUz3IR1ZWNJek/UYUCZzCWuKQkVpI4ByUAFaarHzOupetMo1q95S+Ku8I
 NtNmQ/XVa6tJs8ejy/HoKerlt6hHX3uNklAUoc038oxa/x0xEGpejyg2OfBo6vIxEqcp
 EoEZpO4Xo3W0a4jXDAUfUmLy46VU5r3RcMyKEpkxEoIaTTquOnUpp/w96S65Nmr0UQCe
 kd+xT2NBVQVbnEufUy5TMuTQtj01vAyAk45VOd/qDq47i3pAVQCJ+L6rtlBueMD17fiZ
 ILakPNgEa31WJKggnFSxl6N5zxcJfZUUA5vI4ybIzonx27uoBJC6h/axTikM1bTbIEQj
 vjmg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772803935; x=1773408735; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/2aL7EZzHA1Hp6SzmIMbOvN3v1QTlUg2peaZ7iAtZDs=;
 b=L0R1vFyxIin5wLCjVqcFmmJL9uDYiXP3rr0wQ6BYf4vdeDVb2EvqiZz0ATDKtdbyYP
 hqjeDb/KmE6K4LeZHAJt/OtXG9hDGCKd6BO6vV4Eb2KSbUng+YTL3kI9kN2riDh6hpfs
 WIiulIsIMjy2eprG/qJMhvMHfXNUii0qWbaLV1oM0kSZt/gch2OIgJ87V43hNAm3CjJJ
 4H3PvojfhnqNa03Ir164UZ2hxhXGMjDGOPKLsXFwS9oJcjdQFKubv8+txxuODAvDbyiE
 oxierzngh6MeZxH5Ng+AmJ4rptPN5cAeD4wmwNpJAu27B+nVgr2XCIfDoIKD/BBIs5iC
 7wew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772803935; x=1773408735;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/2aL7EZzHA1Hp6SzmIMbOvN3v1QTlUg2peaZ7iAtZDs=;
 b=eRhr+sg+iNyFq9XkYg6SHhhWDG6sfrkDcfMJYyj5a61BFOB08Qkojg1E2ntt9IZuoG
 KuQPt++BfAXEhYYpKvZnJSfzdSt1AFMjthgrUHeo+hRmbk48MVi9JHZMnP4x5eJR15eM
 YJvxRVfCZaZpuz2SEDvna1atDUfT4RaI7XnN/Ci1tZukSgcUaFUGJqlv5maTY9jj1qmV
 gNB6gTqNeq//06KuubehVp/wtEikmNfhT4osnAK+sH+3KOe013j8sM/cVUgdH5h4g1Fw
 fMHDFwfLQyMwJqsv0cuyY0Vq8jzuYvRbDdKeTWSGY7XpieVQYnlQe1oXQjSj4cD6jTMP
 UxdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV2UE7BJ3oV5+tLZYWSHeLwXEvTW01MzpxEeL0TAlcjszDHxCB+Qo6Qef6/v0ntEw4RSGwuQ5Wbw==@nongnu.org
X-Gm-Message-State: AOJu0Yy1ImLF18Ld2ecAhQ3wBFJwbPNjpBh15YMQnWTk0UbSYeVg4VFv
 U3KBFVin5z6lLX0vc0Q3Bwdmw/aN/J01rjKdA4yDhndkJLAZEvGucFFezZYJwFSVqMWWxX5g52w
 hrLShcJUGUeicK8u/Kl4Mm6Ue5SI0kcE8k6oEwwKvRA==
X-Gm-Gg: ATEYQzyWgtD/fFFYnVT8Y1jMCW3GLBuN59TZVFhpqpqIXWdiYuJIHl4XXyCftWa8DXk
 s3xVvTbhGALDO/KgQd65Up/gShu3KcN0ecuaDqT3sVLHnBlY/TjTqUszRmXXfsfPtDT742BDh+w
 VS4GLReWuflXFSaNIy3Dfdx8qIyAw584jD8soc2qw65N1QVh32R3ayZGD4j2N2aaM+FfbEtG5sG
 GHea2nBF+A6U4KJkb6YQA5CDEWWk9z/KS+ghOmmHz9mCbgTmRbuKG+7v7JDVq8Df1+RXfPl2Rjo
 Yunq4NNBI/RhkakJKRG6KdoY5l0ReWbOlbsFZlgY8t9aqZF2hMRVQ9FXrUhsQjNepN8=
X-Received: by 2002:a05:690e:11c8:b0:649:cd05:c518 with SMTP id
 956f58d0204a3-64d14279849mr1817458d50.44.1772803934741; Fri, 06 Mar 2026
 05:32:14 -0800 (PST)
MIME-Version: 1.0
References: <20260306130107.35359-1-mohamed@unpredictable.fr>
 <20260306130107.35359-17-mohamed@unpredictable.fr>
In-Reply-To: <20260306130107.35359-17-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 13:32:02 +0000
X-Gm-Features: AaiRm50XBVwi8EKKem2F8piMsmWRsUTVvToqOQBCkYFYKgT46LOwJMseXYcO7Kg
Message-ID: <CAFEAcA-bh0s0mkUEsunwDRAjRsCDJaJkzHToUg77e-6X=ejbyw@mail.gmail.com>
Subject: Re: [PATCH v15 16/17] hvf: arm: disable SME when nested virt is active
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 6 Mar 2026 at 13:02, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Currently, Apple doesn't support the nested virtualisation + SME combination.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  target/arm/hvf/hvf.c | 3 +++
>  target/arm/hvf_arm.h | 5 +++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 0183dd8a60..61ba5acce4 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1181,6 +1181,9 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>
>      if (hvf_nested_virt_enabled()) {
>          FIELD_DP64_IDREG(&host_isar, ID_AA64DFR0, PMUVER, 0x1);
> +        /* SME is not implemented with nested virt on the Apple side */
> +        SET_IDREG(&host_isar, ID_AA64PFR1,
> +              GET_IDREG(&host_isar, ID_AA64PFR1) & ~R_ID_AA64PFR1_SME_MASK);

This is
  FIELD_DP64_IDREG(&host_isar, ID_AA64PFR1, SME, 0);

isn't it?


thanks
-- PMM

