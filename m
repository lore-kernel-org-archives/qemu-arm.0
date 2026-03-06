Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE0CFCB61C
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 15:57:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyXXy-0004tb-PL; Fri, 06 Mar 2026 10:57:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyXXw-0004tF-Ux
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 10:57:01 -0500
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyXXu-0003Yl-W9
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 10:57:00 -0500
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-64c9a6d7f81so8505358d50.3
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 07:56:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772812617; cv=none;
 d=google.com; s=arc-20240605;
 b=lCDqxOrnmBE/38xQOJq2wbbIH8k/Mr3XcTb28wg7L8L7hZ2IOXYRFci8so2Bf3u+2C
 RKIOsmzl+1hsr4TB0kwIIVxJYK5RvBukSZ0DtOAS+ZnqVi6+SMBWfwA6vQPMWzs4+Gcq
 n6PXpMY3ZvOK4/Mx/UOF325CmlGTgKrRSC29OrCTNqffgIeu7K7h9gel3bkTq+FiFDxc
 qNHBfZfKvacmepCDqGkeVN4yOewxtCNXXYISK7owMAFw9ttq6WMfn+XvuPMHmZBu70n3
 h9temC730lhfKkQqWXAzJmJj8mhsKVUK7UyTcoS392yS0MRO8QMVmS4bOtw3ZhL7Th+Q
 dKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TI86w47GcBsT+8qlk2zMPDGXUsmClK0NLen5N7Y5DTg=;
 fh=ATxerxSHXW6arjQK07/mGCFcetNniLQoifKf2Q4Ir/Y=;
 b=dS+hD9d+74+MRuaoAVVn2ce6orvolyhMKlSNVi3AaUKGRoPlPiHqeHrG0Qb67h18LL
 Yha3Rzi8s5pSGRs8fEp+b2BmQrFW+djZP3enJcrKp330mTUo2tbDYTVMUJYJ1NF/Sg0e
 c2m5OoeXJRjaOM/FHIjmhgoaeQhfrehoKikb2g4oUX2YPqzdmBpDWHzjRI0ZRJ5Bty0h
 v2gFopIZg8eMaJi7uWGiry86r4mSV4AjiKRffNQAh1VJzIwEDbgLta8N86qj8g2d+HiQ
 Ztoqe0Qenq3L26dISma/xwDoChlCDjqbWATG3V5YQILAmwVOBBHlEBlloLSeoNcdcwME
 sjIQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772812617; x=1773417417; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TI86w47GcBsT+8qlk2zMPDGXUsmClK0NLen5N7Y5DTg=;
 b=UET4chjcDV8v91Sr8IhrNNRJ6D2J/oGjQus2Zk098SCpOPb0XsZjWCqA5VxjN5uct2
 4Cg+GWzu6HeBlJP8m/VQi6N6fv7lEJeyNI62njacbiOO2GuMqTZQDGdEfA23sv7Ox3S/
 16PmUCdv/YpBH3XVrR2IrjCOVQx0I8C+Gx1xIeZZRy0eMEIA/XjL24hdQ9YKoazTveYt
 mTbNZ9f4PfJJCefLoZyGhxWBij7+BqzIIbWyHqkMyG/JjJfYyDg1VLMxJYzH4vz9J+Oc
 e7PqOi4y2zQXZY7y6OwyFy5GtpK8ClQymEMja1aN0fUguCQYV9xpWAhvA0X5MiZ6E+vO
 bKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772812617; x=1773417417;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TI86w47GcBsT+8qlk2zMPDGXUsmClK0NLen5N7Y5DTg=;
 b=voEay+nhI2wgVm1AavCucVfk11xMjpk9CH1LFEYs/6Why4AyMPqeCveicuaxixcpH+
 5AfLiJfHlal80ZofXoR2A0X6Imtvgth8eLKRmjyCWukxaQR3NQP7Y22ScIkK6K/235p9
 fJcZUfp3gOBPuj5K4f1DqyTEZqD5DltAIrP7l6uD3bPavsHwadWN0f0u2hf/N3nteW0s
 HIqkKHnLscdLXpzCA1O/yisNi9rlX0fYfwkD69vpn8VY+UpoVMpRd+OrR6v+mTpkUTmJ
 bM9yjWWhXy34z0RMxluqAVKJe5F5m/4Pm/w6pw8BHkgrCfxlZkJPwQZz+ijdQQ7gsg8k
 9sNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCyYhN+axpb/V5K3JtuB82pOi5KCgNlTBBtqKveUKH89bwny+F9VdspuNOzMSzJqzBuU67O4cFeA==@nongnu.org
X-Gm-Message-State: AOJu0YwauvUEzWUGMpvRiAZ1hA7/wCi+LrmRYWIy5TbLABc6Qtu2SEGT
 ob+MPpzM/EU4aereqq2OwmsXjkeuV1IkukXbHF8PlAVrCwZ/lxiL9ZnBMMqgqbBNDG66m0ZANNl
 u8Eqt9QFi1y4wq413v8MjPnftfSGGHoHDSEIHPf4Z7A==
X-Gm-Gg: ATEYQzy5dmAt2xGIXPP6eo0PvJnT2T+XJJgolModaSCOFeVOt+RztkAi1xicFz+EbUp
 G97lqHlJ+n52Dw57kF+guxHe6zWvL0gSX3lVFP0f3Y8HkZuQWmdrDbsuZMAC55oN4jqGxpMOS/O
 eJaWOr/ss8FFa0Ws+/nO970fLYdm+5HM3RFbW8JuQIHonihJK8Ygy07FfI7dH1eZmD9WNb6rSFe
 zWn23jUuAO9htxWxO3DAr9CJTgNGBQ/e/FefQbINpFU7soMmph71OiJm+sfZvRbLySknGGmy/9P
 8RUYQqqQeKZzAE/+MP6MbzNPnD6pDoI+rYGtp7WhcvRU0LKsciISAU97cJvt13n1es8=
X-Received: by 2002:a05:690e:1286:b0:64c:a0c6:da93 with SMTP id
 956f58d0204a3-64d1414c6damr2365243d50.28.1772812616732; Fri, 06 Mar 2026
 07:56:56 -0800 (PST)
MIME-Version: 1.0
References: <20260306130107.35359-1-mohamed@unpredictable.fr>
 <CAFEAcA-e4GZB_TRG7Jm3O-RNJneUtk_WufiXNn6=UDHsgG4kdw@mail.gmail.com>
 <CAFEAcA8gB-36c1TvJSwJ0MkVMy5z_dqKpVY7KTJ-cMV5rAX1_w@mail.gmail.com>
 <83E62271-E3F8-432E-8499-D1D8D065B162@unpredictable.fr>
In-Reply-To: <83E62271-E3F8-432E-8499-D1D8D065B162@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 15:56:45 +0000
X-Gm-Features: AaiRm51OemnN3-qba6GW8zVSKnnWuHGbSNPKbvIidLvDoxuza-4HX1dCCJ5KLUM
Message-ID: <CAFEAcA-uxtCoawErLdM0HVuy_h-uxxcmFjJsZf1rTgNiov-JWw@mail.gmail.com>
Subject: Re: [PATCH v15 00/17] HVF: Add support for platform vGIC and nested
 virtualisation
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>, 
 Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Fri, 6 Mar 2026 at 15:53, Mohamed Mediouni <mohamed@unpredictable.fr> wr=
ote:
>
>
>
> On 6. Mar 2026, at 16:44, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 6 Mar 2026 at 14:58, Peter Maydell <peter.maydell@linaro.org> wro=
te:
>
>
> On Fri, 6 Mar 2026 at 13:01, Mohamed Mediouni <mohamed@unpredictable.fr> =
wrote:
>
>
> Link to branch: https://github.com/mediouni-m/qemu hvf-irqchip-and-nested
> (tag for this submission: hvf-irqchip-and-nested-v15)
>
> This series adds supports for nested virtualisation when using HVF on arm=
64 Macs.
>
> Reviews would be very welcome :-) It's maybe a bit unlikely that this wil=
l make
> it to QEMU 11.0 I might as well try.
>
> The first two patches are from the SME enablement series and are present =
for the
> series to be buildable on its own.
>
>
>
>
> Applied to target-arm.next, thanks.
>
>
> I'm afraid this failed to build in our gitlab CI job for macos:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/13388426185
>
> In file included from ../target/arm/hvf/hvf.c:489:
> ../target/arm/hvf/sysreg.c.inc:174:21: error: 'HV_SYS_REG_CNTHCTL_EL2'
> is only available on macOS 15.0 or newer
> [-Werror,-Wunguarded-availability-new]
> 174 | DEF_SYSREG_VGIC_EL2(HV_SYS_REG_CNTHCTL_EL2, 3, 4, 14, 1, 0)
> | ^
> /Applications/Xcode_16.1.app/Contents/Developer/Platforms/MacOSX.platform=
/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks/Hypervisor.framework/H=
eaders/hv_vcpu_types.h:312:5:
> note: 'HV_SYS_REG_CNTHCTL_EL2' has been marked as being introduced in
> macOS 15.0 here, but the deployment target is macOS 14.0.0
> 312 | HV_SYS_REG_CNTHCTL_EL2 API_AVAILABLE(macos(15.0))
> API_UNAVAILABLE(ios, tvos) =3D 0xe708,
> | ^
>
> and similarly for other registers.
>
> I'm going to drop the last 4 patches from the series, which I hope will
> fix the CI problems.
>
> =E2=80=94 PMM
>
> Hello,
>
> Will submit a new rev of the last 4 patches with a workaround for this th=
en=E2=80=A6
>
> (Ugh @ compiler pragmas but there aren=E2=80=99t better choices unfortuna=
tely)

Unfortunately the problems aren't in just the nested-virt part:

https://gitlab.com/qemu-project/qemu/-/jobs/13389185563

still complains, including about hv_gic_config_create().

I'm going to drop everything except the first 2 patches.

thanks
-- PMM

