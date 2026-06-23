Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8500CD4F26
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Jun 2026 08:43:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wbwim-0004Mf-Uz; Tue, 23 Jun 2026 04:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wbwil-0004Lm-CB
 for qemu-arm@nongnu.org; Tue, 23 Jun 2026 04:43:03 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wbwij-0005Nc-6u
 for qemu-arm@nongnu.org; Tue, 23 Jun 2026 04:43:03 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-662c360aa73so5708828d50.3
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2026 01:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782204180; cv=none;
 d=google.com; s=arc-20240605;
 b=iIShQE3RWd/Ctg8eEo3orIGSMS0oNUnYfP2vLUluO8GBOYVL2EedmyjZr1dxnAD+nI
 F82GyYNtT3n2Tm+1QrzuY+163bJUowfEQrIB39yMb0E7C0bD+D1XBW0nGI9gnDB9g6zE
 J/iRsA85pwualyVfCW13jTEQMsMbXoLTFkljVLEGY7qXfNkjXPoUJ5UBq6FsacSUxPFG
 esyyTd1W0QlFVtqyo9VtOFOzrtguI50Osoc+9z+gtY5OkgB+hyoG5Lf0phjO4ziQesP/
 Rx3DRzxWbZ0VOqKNxPE5sqNyhwp/Dw7nfk09ajSpYAvqYvnpzq53aqhsHhI0FIMacrQr
 /KCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=2zRSd9G2WDJTnbEtZqqhadZIfQ2dChkGojlRazGuCpg=;
 fh=vu3m1OUJ6tQcIq/zboRPBOJ6ewGRU6m18BOTCN/RMQE=;
 b=If99mA18YgqsDG9wLf6gkwq0yWXFnZszi3JioQoPwu+24LQ5ALLdaxbhUdQY3bDowv
 GClL2UpSN5BBKo4vPH/plyj8WwsDGy9sZ4GYRTCMuAU1MQd/HJM3tEPsLPbe+Pmcxaqe
 zTII/wTELrq8XW1CHt2qMZ0fbARpnzhyK4oNdVHzvE1UjuRkDPOdjMPEyQY+bcm4+wZY
 EFUg0woErsoXe7SAGLFhinJCKWF1uygCZPPSGgSaUsjg6DOUIeXKWFJQ76iGLerCeZSB
 RSLEz8GN8m8puK5Rdmwton+ned8vpBgM4OAsrs7HnK8pMgCgTTT6EVq+NW6CLR1D96s0
 Nwvg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782204180; x=1782808980; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2zRSd9G2WDJTnbEtZqqhadZIfQ2dChkGojlRazGuCpg=;
 b=InwoQPNXFPNQTIx57XdGn9zmuiS3VgWx2UioQiFBcb8NIS7RcVIynV7u5gRjfyPfXC
 osyrt+eP0+AfrJMGmjJNbFB78TBIVZrXX+YsVzGCVJoliqejslU33nFAd5JyBwyvn/Td
 VcZNaP0FyJAEw6WzfqSir0EaqVzJFTYV420YkQ/zQI+nECqnXuwI1xbgj1ciFkZgho9F
 kocSmQzODcdqTThiABTInRKM7uxLv0aLc7Ygi8kGz/YRRhiHyQHKiJJJL1agDI/ZhBfL
 cfYIFFEBPEeIZj0s7ttzwfWR+91p6xMosUlQ3anMhDHUb+3s+Ra/OqG3C6uPaNUTREZ5
 u/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782204180; x=1782808980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2zRSd9G2WDJTnbEtZqqhadZIfQ2dChkGojlRazGuCpg=;
 b=k0ClzRvT7YVOW3HOWRaxJ4b/LRtA3B2en6XAZeLnCzn2EodjfFGzctqqYVniRNtoik
 6yGszYKuJ2ZvYnRlsnXIpX8j3kNk5zk5tJjdcjL8ur64A/MpVKMQGVNyG8ZyoCLkpNm+
 PlH4ZxTEy3Rqflgbom7l7mOK/Bn/hWXXWwcPYEzP7sgnA4h/aSrU3LMlZjTtJzhR72gK
 kStOUkGzmc5kuh2i367BpeHPlLMNumIJY9QWWvmn0nOI8LwZI+Wd90TtUOJnxnmWekIx
 7dv9X5+qcxkZj9zdDZ7UFHh0elr8GOmLk+t4TJbVTyFaCqmkIuoazPb8PyUo7kkFl6Vk
 saBA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpMolpF7MH3SSyEQsP0HUFj19/XtPUapttiraY3s1WdByW1hyL4+3rnfGkKQYP1B6pvra1pLY/1kQ==@nongnu.org
X-Gm-Message-State: AOJu0YxQCyu6qDJg8zKOvte9YXbUzCGybu7yYhH9kThtPVxUBTuFwIrU
 fothn1asvz/Fk7olmIr6x/nrDKJ2MiMS5p2pPjy1y7MnJN/ObgyE8TObBnRB90Ti3thCbDpgZtp
 Tl01ZqZDRlX9v1ZadxmEGJpNKE26nk5HzFA9kCXcxhw==
X-Gm-Gg: AfdE7ckkKmhSl4p95l0svC6TKjjTwaZVB6NHu1M+hsHdTpMZOr29BQLP/1CD2vtf2oF
 vIqKf99zWcchihSR6Erkl5g45hXvDDOrS9priarepKkhVizUsXMNG4/hD56Rn4QJm7G418rPWn6
 cBs9giAMzeHvRbxn+reZuKEcCWttHYQJmbJdnj0NMv1zWO+o4o1MqqoWbqdpbvnXRK5/hTA1O/u
 6LznS5BtXL5Xh7QCTekwdWtLdLsoad6D3Na3Fslz/OgdpVYio+mnAPfEF2M2WwfOoVyd/7YIix4
 0uZnIZngQzwE4F8D8TgdSsXKB3ytwYOELmm5HoId3yJIGZCiay/hsp85
X-Received: by 2002:a05:690e:1c1b:b0:660:5df1:f243 with SMTP id
 956f58d0204a3-662ffdcaad5mr15338897d50.50.1782204179568; Tue, 23 Jun 2026
 01:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260529114723.42040-1-peter.maydell@linaro.org>
 <20260529114723.42040-18-peter.maydell@linaro.org>
 <745e66c7-2a9b-4185-bae7-77e10623332b@linux.dev>
 <20260607182221.4357-1-wrigjl@proton.me>
 <CAFEAcA-xEaA2LM=17Q1pKOF6L=rHhaDimXeSmLe=BtDqeaBeFA@mail.gmail.com>
 <aibmIdorcTobj2yo@Jasons-MacBook-Pro.local>
 <CAFEAcA85HahxFXoDVW_xBZEtG2SUd_3PseYLrpUXE6P_Hb_5mA@mail.gmail.com>
 <4e00be29-25b4-479b-ad6f-b79beed78dd1@oss.qualcomm.com>
In-Reply-To: <4e00be29-25b4-479b-ad6f-b79beed78dd1@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jun 2026 09:42:47 +0100
X-Gm-Features: AVVi8CfxDDgkRxCbGJhis44NoGfqlrFVh1PtvWrfL20oQc5Fe9dD8AfhavxS8lE
Message-ID: <CAFEAcA_XPGPLeH6DtcKDv-o7AkrX4dEFwLX4L+tSQ4wJA=Xnhw@mail.gmail.com>
Subject: Re: [PATCH] target/arm/hvf: manually sync ID_AA64ISAR0_EL1 on vCPU
 init
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: "Jason L. Wright'" <wrigjl@proton.me>, agraf@csgraf.de, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, zenghui.yu@linux.dev, richard.henderson@linaro.org, 
 Mohamed Mediouni <mohamed@unpredictable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Tue, 23 Jun 2026 at 09:27, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Hi,
>
> On 8/6/26 18:05, Peter Maydell wrote:
> > On Mon, 8 Jun 2026 at 16:56, Jason L. Wright' <wrigjl@proton.me> wrote:
> >> The three methods track different requirements, so I matched
> >> the closest existing pattern for ID_AA64ISAR0_EL1 and left
> >> the others alone.
> >
> > It seems to me that you've added a third thing that's different
> > from either of the ways that we handle existing ID registers
> > with an isar.idregs[] field.
> >
> > I think we need to figure out:
>
> Should we revert the commit until this is figured out

I don't think it's difficult. Somebody who cares about hvf
should just do it, and submit this patch with whatever the right
approach is.

-- PMM

