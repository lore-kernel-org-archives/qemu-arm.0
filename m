Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44F4F4BB65
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 17:44:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuwRx-0001BD-5W; Tue, 24 Feb 2026 12:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuwRw-0001B4-4D
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 12:43:56 -0500
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuwRu-0004mU-K2
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 12:43:55 -0500
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-64c9f7576d4so765697d50.0
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 09:43:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771955033; cv=none;
 d=google.com; s=arc-20240605;
 b=RlOJw86aWO5s+Md7KavnaYFNbP0dwevP71DUfJQKk+9+As9MkSJDQgrrAjykczrPwS
 evGHTNbyPMHYXJj5PXLB5s8xqm3HX1MUXWQpT3T03oInLgrsx0zzk5tlDre8tsqMNldC
 A661cneL/Red3WED7gNEKbjmMjVmCif9GId0c7sssQ/h+wMvaJRv/y3agT/BD6cHcGHU
 gS3cnXVDcah9epyW0cOv6Mk0/hnYsAcPaoUDDx/qbwUfbzRBqsk+0uvY98bb7feM5VoY
 h+maJ2nS6dEbEg6GxGxyzs4++Z8ytwHXMcbV5km3OwKsfE3gkhf4IdRk7cnPyzSRj5+i
 YCnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=bvlXZJbrhd0UjHZmAuDCJh18ioMIHHmNpbs0qCxkYDY=;
 fh=TlajIxmXYiUUJgZ6ulC2fiUaBmfCVeSOSnDBiX1dnFY=;
 b=H3s/Uo23AV1yhNFK9YCwfbba1J2N4s0e9gO7yo4IkcuL8jnlORdvr3gUC6j/FJWzI8
 ZRn8IEthCcHY900J9CNh/CN7PmDf24ij2MTby+JvNRwHJWcNugaTsrHFpe90Jw7MftDK
 G03ctfKHJJVkGDKbpCHRzx7xzB9nL+jnawbUbi5w+gWqZf11laiIy+A56R0jUizhb5h2
 INX0usNn46ihdB9alDAR0YrSeXV2IFb1kiTHB/eTiBEEQRRCccm2p7tSbxRGE9IkgcxA
 eTNLfCtKdYA7c76nIuXGbAco+Oc6SfvfI6z904PaOUDlwoyP4DdgXPw9BQ6hrtakQiDB
 4FEA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771955033; x=1772559833; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bvlXZJbrhd0UjHZmAuDCJh18ioMIHHmNpbs0qCxkYDY=;
 b=q6Gwzop6na32UIGFha/no5yqlLIL0RBSkaoVfILWdr++3Pa/IzDyZ2c5AL7t6dJRpn
 3w3Gx6GHqqKhYJBGdlkkoKgIuOUcEctIBsVy49ovv2m4UIPCungWDXdGZfmCoMdRmS9M
 6abHaaYzZq5+lNvMMMSymWBbyOKh8ErKz8fzE9pd7Lq6Jz8Y7l+v079FsdTEJyOOMTrZ
 dRgryh62V3oOPRAEZUM0J2+Bq4K2o9s2Xtau0rUwgNmXTuk/kTG+xq6LJ3Skn9U3VDHM
 rXRFofOJXV5bHWhcdKx+6xaNlFo+/e2hffPt4aTrHmHUZthgD8zOfrRGdmyM07RjMD5j
 pG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771955033; x=1772559833;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bvlXZJbrhd0UjHZmAuDCJh18ioMIHHmNpbs0qCxkYDY=;
 b=kVjr2WTThhY8qvoQuW6S6+DzsSnUU/YdnuGMPp54wpjyQym97JA1HPdEMrU03MklDK
 GOy+yinQ//MT6AznVOSZ8GalQ5cNQbuEmUOxNGkKmTVAyTXTI5Hnwlr9X3UhkixgIHoi
 cYG5Z3aHr6DcKFwIxcqp+/TYhmLHt0ibcptz5ZsPc6XxDnqFIAv6jGvjF8vNf3okXto5
 2292qOmRLsoVWc7I2G6TsVFTeNbIZPLC1tGEDs0FN3JyY1uEcB5JhPdT7jK56Axq4y6G
 P0POPvAK4G2iAltuR56fmrQzLwuNBk25NcJ2WLAg720Iu1xRQNRn9rhXPy4EbM04zpcc
 IQHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPHtnvWBqRigXF7SMNZp4JIF8gG6+vKzmHN6wQ/PfbeJZjjiiHxz1ud188rCSpsR3mBEVUPRH7gw==@nongnu.org
X-Gm-Message-State: AOJu0Ywkoqp7NlOP67njaYDyB/SnGzmHZyZeTrH/Rz4I0g9Nvj3JcVTH
 /nsYPnQ2KAqKFFFsDQh/Z5Rt3YMnAZthdLakfBxx3Zw+zsm7Q9y+HM8/pUgHTd5PKTCrfW9hFE/
 dQ2Xk6aztZyCXJY1cV+NqnrtHOqtBf9++V0KBnZvloA==
X-Gm-Gg: ATEYQzwh0hfLj9I8WX2aAyqCCXdStadsL0STyi8LJi9BoTNYfRSDhElJellCtSQGwYj
 18NHEY0dcnLOnvYWub6HjzO4FAyyBh1gfB/dYfWkGFxArbOCiAXK1KD5tr8yHukuZAQslXqtRG2
 LJ+QBPBdp+PBXhuakzGKs2OapPCRQ1SzWGC6H2ziq0Wa5dSaYP29iNOU6Nb6NAOWjwENTFgRNgi
 7AJlnJKxHSEgh+iRPkMkR4V3xXfIND/bHvgnFYcETY1Gz54TD2RxlK8JDdmMocApavmrl+yDDco
 guoZASu6g6qdo/NrP6t95YO6EJvjoedYufpSipnygp3yHwQqZnbS3P1FxgCCiZPVVUM8QJt3SQ3
 EKw==
X-Received: by 2002:a53:cdcb:0:b0:64a:f2dc:2863 with SMTP id
 956f58d0204a3-64c78e3f4b2mr8694716d50.47.1771955033419; Tue, 24 Feb 2026
 09:43:53 -0800 (PST)
MIME-Version: 1.0
References: <20260219171810.602667-1-alex.bennee@linaro.org>
 <20260219171810.602667-11-alex.bennee@linaro.org>
In-Reply-To: <20260219171810.602667-11-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Feb 2026 17:43:41 +0000
X-Gm-Features: AaiRm52TuCRfIzNNGpZsyRSrbSfYPgjiMv87KBHufhgW597nJjYYrby_ozTNI9w
Message-ID: <CAFEAcA8gvXGAhTZ+PuegZJucBHa6pYcDPxZYfUJfUjSKBme9TQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 10/14] target/arm: remove extraneous cpu_reset from
 realizefn
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Yoshinori Sato <yoshinori.sato@nifty.com>,
 qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <huth@tuxfamily.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jim MacArthur <jim.macarthur@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Aleksandar Rikalo <arikalo@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Thu, 19 Feb 2026 at 17:18, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> We already have do_cpu_reset called when the system is reset so there
> is no need to do it here.
>
> By removing this we now only do (smp*2)-1 calls to cpu_reset. Once per
> core as part of qemu_system_reset and then once per secondary core as
> PSCI calls are made to reset them.
>
> Message-ID: <20260108143423.1378674-12-alex.bennee@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/arm/cpu.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 10f8280eef2..dadc48e06e5 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2198,7 +2198,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>      }
>
>      qemu_init_vcpu(cs);
> -    cpu_reset(cs);
>
>      acc->parent_realize(dev, errp);
>  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

though it would not surprise me if there was some obscure ordering
requirement that we run into by removing this. I guess we'll have
to wait for the bug reports :-)

thanks
-- PMM

