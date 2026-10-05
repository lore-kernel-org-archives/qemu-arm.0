Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFC4CA5FFE
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 15:06:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDkGe-0008Ko-9h; Mon, 05 Oct 2026 11:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xDkGP-0008G4-Eg
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 11:06:02 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xDkGM-0005oK-SP
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 11:06:00 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-8ab3fd8adb1so17010027b3.1
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 08:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791212757; cv=none;
 d=google.com; s=arc-20260327;
 b=ax8eLCmNKVckf7XxblZ2QMdniCqwl5nTuyeZAu6KaFBPmMsIBVk+xzcunlM5dguFY0
 FlvOvwZEbZZIpsoLgkeRz+XlUXsSv03Ibu7jofZgpg7WxeRqx8Ds5enurspXhvyhZfGL
 UKFWxGkKJCz4RzePbtYJYqe2UH+ikKrDps9fA5rCaytuXiQ5uiF/3z/7c/AKltfV/9yz
 TXiDUmNVQaa10qYoBmIFmy8wQClbzoOlGSqLgwZyQ+ZiwErbC76Xv9ZOhBjra3vXUNor
 8mKD51ghjGlmTdOObfXM098FksoRGcopuhwHZ3moawTxQCYsv9TJ3VSCMa4a+23NkkRz
 qrLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=2sGFBf4wmaMheBhnmNd1s3L4v+PoOPdqTDVFowvlh94=;
 fh=2K4h/cw7Y5rPSfztJ/XE91UxPB0PsscABFyD7dMDNRA=;
 b=PAI4sNRXBeMhOcu2AMnufhHW1sfUOs8ym9UJtBP6EZxIvxPNhCXIJathKkpXPB2diq
 N3CGGoOkKq5uqgSy2AjxLVSrnNERqCt4BPcn0FsxFH3CcoG5fydzoOKSP3Ucu+MGbx9P
 qQ4YQQ1A+++kLej6xmSbiJlCsK6CV7khxu8EXZIUKGCbVvKErsmF0h2a40w0RlvsiLrN
 oKnMOgOf4ld5s0fFc/ATV0sjhIP4VSW/iR7AruClH0VRPxs/VlkX7bI6Qv4CfaQ/5ep5
 fjvP7qgdOAXt5N1MrSy5xjushBdH3IPoepGqxaWXnwfGzyQc+X35GR6k6py9/WU0tXRV
 5iHg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791212757; x=1791817557; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=2sGFBf4wmaMheBhnmNd1s3L4v+PoOPdqTDVFowvlh94=;
 b=LjX8/2xxAe1qbkCphuG3D0tNlXGh5czmBymHtGZya84pQNtshrAu226LBvE26lF2XK
 8HIqRMniTq8qdOq5QbNgCclzBuDp5FUvuNBb8/gYMixE/4+RdAo3jio2O3fPgpefqa9y
 jz5ac/RXshNji2GA7izRXJQ3mmqxfAbOpX3igqLgby7nFt/kCwYSMam4MyybUPP0pdmV
 otBB89WUO8frqYuducN8DM94kliqCl7g/XM5YNscjENmdsF6RNKVMWRIY33qqUnZ/C7Z
 x+hGB7oCvqb499r2XU6yd5HPXfNqihr+h72I4SRGhMB9Kst5yNQGcsYb+QU9ZDOQHHC0
 rvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791212757; x=1791817557;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=2sGFBf4wmaMheBhnmNd1s3L4v+PoOPdqTDVFowvlh94=;
 b=ZL7YHaxPRHjL5I2PRnHMucMuyhlVm1oo5mZEg+r59RNN7ChsE7/sLnd8IJdnspdvGU
 aM6OW4DstaBDcePN3y0BvXAogCVNb5MeXbWdzsyjoDxurVGD0BMbkORE02OmUzagb1Bz
 +3VqJsFc+TTLdTGRg3Q0TvWmU4l38h8HZilIaN67ILJ/toGbfuzNw1UT1tLImW3SsONT
 5/X0uHPyjh4dZVEHWTwPPl00ASvT6MoWuN8yaLyJwmcKWcy0zCaTeJ+zxO51Cp6gta1A
 RgFxSzY3LT5gTSuz3k6CsnRkhYUyIma2ZUDigYtZq6n/yGKBT8zclBswb4RrgTXGbItc
 tnlw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxy5yVEFHEQSOt7HffCx88P3ppSHftQXwJVFwq1HxOfs6gnPaHV4gjzTvAFMjrtONZWSQx+DyMu0g==@nongnu.org
X-Gm-Message-State: AFq9FYJzpEncvewkXQX+M1fzga7I67UYns3FXLKZkPAH+x7jsUx9RaIE
 4BUug0/dL5m5UC0AcORD/OA5WKz4J9RBAqdyMw/oVM6dmT3hpA9RmogaQEpjbi0xTF94YuYmrzq
 +2sNh3YiGfDTuDYPdHnbzRVKyt7LfrR0Uzi88rQTFyw==
X-Gm-Gg: AYBFou2Wc/DWpGWWf4nfY7ok/L+NFzhzaP7eUHiY0dUTO2AHnrUNDO8U3lMSMRAKk1z
 s+wmCc/om2YJ/r47QUTvqP6NFfxSAdH1AoYlACKWL9P+PDrwKp7/zHl3k7bBi9diXZqwdUHUDVL
 XRpSAwJbKE9vukajosMgv+hGyqltKIANGzz2w2TRO0lJf9Kv4z2O3bPbeb1rR0vrdqwfcaPlRZY
 NoK/nXHj61sz7h3VBCvrr/gkY7WtlYXwitrp4HFXkFB1pAOoXUXPZA+qcAUF4g/CToXs+Di4sf8
 UbydAfyzj9G/92rXCQFSvQ6JVZGdxmvZHKZq7W6VLXJilffMG/jcws23E7bKmA/gRksu6QXLpVe
 3i/2yWcB8Mh+Q1nQ0vyDqDNtHRjPSOTQcUQsXAgB0
X-Received: by 2002:a05:690c:67c3:b0:8ac:c329:67c5 with SMTP id
 00721157ae682-8ae94b38657mr28701737b3.6.1791212757349; Mon, 05 Oct 2026
 08:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260921214710.29422-1-shentey@gmail.com>
 <8affd0bc-1c2f-488c-88b9-af3fd7a6571c@oss.qualcomm.com>
In-Reply-To: <8affd0bc-1c2f-488c-88b9-af3fd7a6571c@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Oct 2026 16:05:45 +0100
X-Gm-Features: AclHuK81bz4IOIA3wj40cqGVFSp18As7_4HqW2WIzAYWDo7oZVVP788ziGIl4KQ
Message-ID: <CAFEAcA8n73edkk2PNJO94_yO28Un5w_AYuHU5UW4yNe33P+qtQ@mail.gmail.com>
Subject: Re: SysBus reset and heterogeneous emulation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>, 
 Alexander Graf <agraf@csgraf.de>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Luc Michel <luc@lmichel.fr>,
 Markus Armbruster <armbru@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Mon, 5 Oct 2026 at 15:35, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Hi,
>
> On 21/9/26 23:46, Bernhard Beschow wrote:
>
> > Patches 11-15 turn the remaining i.MX SoC device models into SySBus dev=
ices
> > which fixes their reset behavior.
>
> > Bernhard Beschow (42):
>
> >    hw/arm/fsl-imx25: Derive from TYPE_SYS_BUS_DEVICE
> >    hw/arm/fsl-imx31: Derive from TYPE_SYS_BUS_DEVICE
> >    hw/arm/fsl-imx6: Derive from TYPE_SYS_BUS_DEVICE
> >    hw/arm/fsl-imx6ul: Derive from TYPE_SYS_BUS_DEVICE
> >    hw/arm/fsl-imx7: Derive from TYPE_SYS_BUS_DEVICE
>
> These patches are described as:
>
>    ```
>    Deriving from TYPE_SYS_BUS_DEVICE fixes the SoC object to be
>    reset upon machine reset.
>    ```
>
> This is correct for the current state of the codebase.

Yes, and I think that until/unless we sort out where we want
to go and can merge TYPE_SYS_BUS_DEVICE's features into the
base TYPE_DEVICE then we're better off having devices and SoCs
inherit from TYPE_SYS_BUS_DEVICE than from TYPE_DEVICE.

> However
> I'm foreseeing a problem in heterogeneous context, having 2
> SoCs (like some Aspeed boards), if one SoC is locally reset
> (i.e. a software reset), then sysbus will also reset objects of the
> other SoC, which is unlikely expecting that.
>
> CpuCluster are not impacted because CPU types are not sysbus
> based.
>
> Sysbus API was designed for centralized memory bus and
> non-heterogenous machine. It is good enough for whole-machine
> reset but does not adapt to per-SoC reset domain.

Yes. Even in the heterogenous context, if the only thing
guests in practice do is "reset the whole machine" it will
continue to probably be good-enough. If guests want to be
able to do "the BMC CPU resets the application-processor SoC"
then this is one of the things we'll need to fix.

Ideally our reset API would both (a) allow you to model an
SoC's reset handling correctly, whatever it was and (b) default
to something that is at least vaguely sensible behaviour
if you don't write any reset-related code. (That is, I would
hope we can avoid "every SoC object has to write extra boilerplate
to handle reset of its child devices, and if you forget it then
reset silently doesn't work right".) Figuring out how we get
from where we are now to where we want to be without breaking
all the existing machines is then the second half of the problem...

thanks
-- PMM

