Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F72FED2F7
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Mar 2026 09:13:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0c6c-0006CP-U3; Thu, 12 Mar 2026 05:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w0c6N-0006Am-Rn
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 05:13:08 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w0c6J-000334-HA
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 05:13:07 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-64ad9fabd08so1043286d50.2
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2026 02:13:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773306782; cv=none;
 d=google.com; s=arc-20240605;
 b=EnZs6rl0y+d/9kJ/1z29caUBhuJxpok64xGlm3m041+52fvV8GGel+QpgSl+03vEup
 Y/hmE1CrKwTNfbcJSkgz8JfnUWzMyX3diPA4CKqNY74PL5/4HvhdksN3vdzmrRVTWim5
 mh+gG588BZRwCBc7r5Xjqn+MkG7BlTkqfe9RM4NQcPu7XK7J4eK+xvcPiiGJTzNc13DK
 2Vo+pItL2636L5K0UqXuP5GfoTWblZazsfsErpr62nCWUnVOQTN2eM6aAGagP4dKYFDN
 l/cYIbTkLZw78pPfdBdqtC3BKYbYbUWXR7x1eDP7izHaeFZVHIIAZmK2KzPRl0NZa/WW
 r8Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=gCe4XlwRhzcIv6mM5XeuDVH3HXdR7LmPtkbb/B2PBBg=;
 fh=tLP/gRpi7Iczn5ziGL7f2zBG1RdOSHMz6mExSpHcScY=;
 b=aUJPob+EeQkzIbDce8YfwoyFlvFyKrtySiFmQdEMOh3ExWCntS7ymBkg2tgQB5bPFi
 QwYDXrJAbLnX4XSRYF6rXuYNRYlecW8zveFCQl1nstWWsaxxCU2IhRLGj+MIo10LNGlb
 Hix9oDluozmyLM7gX+vpCBGTmfx8GKgCLGkLcd4RUmnOQlX+H71gNuoX7JUUHXIG9EHx
 9JS2pzvmn4Q56Ggq2vKRpsHV/UJb6ENtQpHQ47Z5I7JoFVdwuOezCu7k1VEAV7ViZLQD
 o++UA9CU8ZhNfFAm2/2eeaffScw+XD2V/rOqvq2cA+N+xeOCoVm0uYgE7f7dNV71uA/Z
 y02A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773306782; x=1773911582; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gCe4XlwRhzcIv6mM5XeuDVH3HXdR7LmPtkbb/B2PBBg=;
 b=yM2MgcB7+p9iuSUxJ3wLjGnhBz+oT58l6N0XuluKm1EgYvA2X/FQQdgkHSL3lcYZn+
 STiKHoKQ4SLovvcmIrUk3e5T2UzSL1omezMPnGC5fVOymndhGoTIGgMhBamHkcuBTYDC
 KDR6WQ1lDQxndA+QwT7ivf5hxElDQ6pDhJHjw7TeZKucs/FBGqK5uZwg1gazHAks9w4p
 JOjI4OFLaFEAblMPW+y3BBH1lk1wUkUkWSHgLcq2ua0HSz/7tzWwBN1EDaH3AfV8RS+U
 zIkVBZhZEIxKeso41EPJVFq+LmQr/k1PlEEnZ8hDM6QeQ8ZphdaP15ZKgr7nf0VTNKBd
 5IKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773306782; x=1773911582;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gCe4XlwRhzcIv6mM5XeuDVH3HXdR7LmPtkbb/B2PBBg=;
 b=MAyALMluNhwY0KsN9CtuHZrb42oL5Q0ePq44BTZtjRDXte08CCOglfBfSnpT9aiCix
 bSwZBNNUSX8/lVy1LPeV1jInN/aZsyzNtNd0dq+wjc3+rYNLlnaqaEKCQ2xP2HcTvirg
 1js2KtnETB/yfrI/awkEbGYScg6a5StKv27PnvAX0dhhW3T9gEJW7w4A//2Re1eUL6z9
 DEnrcw2m4e2FKv7fTrvQ1e+ev260Ffjq/uEF0YMM1hypUd7/lscpfG3CC4vhWLcLf1zM
 4eLQxnhcW59T1On/hxmR8AqMVOWg+Oie8a+J6c8so1qhdadfbRkf78i8aqsddnjxd6BX
 MXvA==
X-Gm-Message-State: AOJu0Yw9SIa0u2K6ogkqvvrCJq9dI6H6ZHG+zjyRGjc2DPuMkTsBg+23
 sSUSe2JRep7Iynraqh+Oxaan2sFU6z/M1vqOgJl+6rPmQod7OWMb3DwWMPaHQMLfUnvKla1PLC+
 3fMLQLdxmUxggwgChNmRKrzEsvWyoM9em9Vrz7t5Rug0kba1YX/xo
X-Gm-Gg: ATEYQzxLIWtRCwKK3BPKH2ih4YP8QRspUvav2mfXcQawIrEOCyF2JP3fLJhVwhEE9Sw
 gEYAoz40CbMDxdbjoAlKkXCTG/+LX8HFt3cWZcbwpzGJXtC/8Sd+NEDbSEdf/zuWhcMzSMl4ej1
 YBqoo53IW7k6otMiDz9MciyspPY0sO4xvcIffJD/4af+gbih7UUeONNX7Gohqy/kcpb742N7Ckp
 LD+syyPWjYJdjzP/fgCUs464JfZ+vnzsq3vSaOu+n+MKkVS6K3r6OVzNOTzpT086eLke0D7w2oi
 mOOy7mGoJfG+Pl1G40rJpPY6zetbaP/KE1uuRZMQu+NXZw9PgkBtVfRprtjuywcBzbE=
X-Received: by 2002:a05:690e:1643:b0:64c:f871:6524 with SMTP id
 956f58d0204a3-64d657ec44cmr3746843d50.81.1773306781921; Thu, 12 Mar 2026
 02:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260223170212.441276-1-peter.maydell@linaro.org>
 <20260223170212.441276-56-peter.maydell@linaro.org>
 <20260311175456.00007788@huawei.com>
In-Reply-To: <20260311175456.00007788@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Mar 2026 09:12:50 +0000
X-Gm-Features: AaiRm53LXM9KGJ6oRdIwk4XjtNEptJj1W4c8gWw6P6EEoFF4hxT-XAWtnXCi5V8
Message-ID: <CAFEAcA8S3JyKRBkvNBex20M2QQn04CbXMTr-1GriqQzXcQSP2g@mail.gmail.com>
Subject: Re: [PATCH 55/65] hw/arm/virt: Update error message for bad
 gic-version option
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Wed, 11 Mar 2026 at 17:55, Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Mon, 23 Feb 2026 17:02:02 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > As we added different valid gic-version option settings,
> > we forgot to update the hint in the error message produced
> > when the user specifies an invalid value:
> >
> > $ qemu-system-aarch64 -M virt,help | grep gic-version
> >   gic-version=3D<string>   - Set GIC version. Valid values are 2, 3, 4,=
 host and max
> > $ qemu-system-aarch64 -M virt,gic-version=3Dbang
> > qemu-system-aarch64: Invalid gic-version value
> > Valid values are 3, 2, host, max.
> >
> > Update the error string to match the one we use in the help text
> > for the option.
> >
> > Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Ah. I was going to say what is is this doing in here? But I see
> you already sent a pull request with this in it.
>
> All good but for anyone else reading you can skip this one :)

Yeah, it's only in here to avoid a conflict with the next patches
that also adjust this string.

-- PMM

