Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1023115ocs;
        Thu, 29 Sep 2022 06:34:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM595cN43ohvwfHvfG+oBb17YX84tLUrqe2DDtiocGKBNwWFnrjdb3zPCfDS35nBYiMXryL5
X-Received: by 2002:a05:622a:11c9:b0:35c:3a5a:1ca3 with SMTP id n9-20020a05622a11c900b0035c3a5a1ca3mr2393928qtk.476.1664458463033;
        Thu, 29 Sep 2022 06:34:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664458463; cv=none;
        d=google.com; s=arc-20160816;
        b=ozEOHzT8ND5YTEt6LmwpY9/j8zzVG5/CbPrlW3BChg5Pa/dnI1oeP8AZs10p0HBED5
         074ha/vOreeLYIhOn1vdst40JZvZIQK8GDKx/kU8hSkOzwvpOpkd/d637zbXV7rcmaoH
         eJTRqsXKjR2GhmGoHLOlr8vprL9wiyVZLdBPBQrnY4tvMWVO2O6vi+IVBCX+v30f7dCU
         rK9D1KIGX8qBx2gh7WiamknTi3QPXxwfkw81Cc5fLz5/u5CngWfvX6suRy3gCIWea4sI
         f1uWv5gzXl2TXKEsGLaPfIg015IHTdLsZBQq1edupsOD+Gpb+bJsXT/ce2fC0l2EGyxm
         z+1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=fMBWKQnKlque+yg1iP5gYIddEr5TT78g0MXvgWDdVGI=;
        b=ZVgfEFFYzXwUdh4mXUnyhOGF3w/R6Qz/HKWN1uioPrUK5/5j5grClvvDB/qrlleqMl
         rh5e12bdJKWqn/8aXTfgOXXC3llrgGF21BWm96gp6kVt1KnQgvYvcHSIdZx46yDV7h+8
         gjhgS1ewxpfI5V9FwEfBLhgNwiaLcWBsshqnis5My7muKbAMSny+Xajk43ECSYxweDiq
         9qLf6xb+tCc2rVX6LsNMfos6MBZf8ZDOF5axvJqhEulqt75kxVh7XdzPtJ5i3VozGebR
         am2L+uUBF4GLxBpuTCM+c4tXO9WGIkHCwAytTWi4VWjHoxrIU/qS+yYFP1hZ/cULH84X
         FYxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DFsOqgn/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2-20020ad45be2000000b00498f8f3b809si4545965qvc.127.2022.09.29.06.34.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Sep 2022 06:34:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DFsOqgn/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odtgD-0006NH-Gd
	for alex.bennee@linaro.org; Thu, 29 Sep 2022 09:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ods1t-00084K-4n
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:48:39 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:36590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ods1p-0002Ej-W8
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:48:36 -0400
Received: by mail-ej1-x633.google.com with SMTP id 13so2251202ejn.3
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=fMBWKQnKlque+yg1iP5gYIddEr5TT78g0MXvgWDdVGI=;
 b=DFsOqgn/nywVLj5TyU8m2EjpzkxwD8kvGHoOQscZMj9zFy5KdF563kSFGCOjYce/H4
 J1wTXiJRM+A7/xYHT/ZKpXSR1eVRW/JSShJr6kq4g7iMfFkEAbQBbCRKIIuCBO4yssNr
 tlsvKtamtbhvQVvTF7yT3nDiCNBDUpG8IvGjdfrLBgXN8dGU8ZIzpCBGNjBasEBVpROh
 r+MuJoX6CEyQV4TV/0AEclQ6wZ05PVXSO4lNYQPMpKVJ6fopxLHQ8CznSj3WmKh7Zpfv
 nOy7j0Y1V2mpAvJrq4GfQplg+xUTdQRme68q/pQoclctGdm9rTAc7vviDDlaYijY3/Qi
 dYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=fMBWKQnKlque+yg1iP5gYIddEr5TT78g0MXvgWDdVGI=;
 b=WNjNMq0BdB3W7BB6pCq7a4IzUxI+UIYxarL/lQIi8TYCSDbrcQaQPqgvb7qws5JuPv
 Vif7W1s+rsULPQ798nLEzPSxoTv07RVYIlIHUAiI85VNXCXmxJfjLnYJzqTQwzqQxsv3
 3yRQf3Y/ZaXv6lcE7X7NFbpc+zEdiby0eZQfEQMv6bWt2hqKNVwznrYsuraZhCNs42AH
 g2fzbRxPBMqHOl8fjeGSQf/BXMzVxX/5tDvbEWWw+1gYq395SBuKo23Dy3skWAo1fC5g
 vRo+iK+bb0kSp7cwq7Msl0tya9PmWYPfCy9Nuu2l50R4HPATidFcCFbhwpG4J6TrW+rx
 ORyA==
X-Gm-Message-State: ACrzQf1v684tae7LzERfr0GVympJ4AUkNqcXUBWP2JHA5tY8BWr69k2X
 4sQX8B2jEMut1FdPWpGAF90BolJVzvLUn5G3Ggu79A==
X-Received: by 2002:a17:906:730d:b0:782:a4e0:bb54 with SMTP id
 di13-20020a170906730d00b00782a4e0bb54mr2492516ejc.659.1664452111602; Thu, 29
 Sep 2022 04:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220928164719.655586-1-clg@kaod.org>
 <20220928164719.655586-2-clg@kaod.org>
 <CACPK8XeiadO=ACQdpFmvy5cAGe0C_LzC3ZPjPVMs_22bUDTcFg@mail.gmail.com>
 <f3d289d5-16db-7d68-0ae0-b2003190b06d@kaod.org>
In-Reply-To: <f3d289d5-16db-7d68-0ae0-b2003190b06d@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2022 12:48:20 +0100
Message-ID: <CAFEAcA9RhqzHjUb6OSLxuzyVvUQjsVCVvzN5fEwhi_haOcsgDA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Disable VFPv4-D32 when NEON is not
 available
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: znjouuk5Wjya

On Thu, 29 Sept 2022 at 08:20, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 9/29/22 01:00, Joel Stanley wrote:
> > On Wed, 28 Sept 2022 at 16:47, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
> >> @@ -1684,6 +1684,10 @@ static void arm_cpu_realizefn(DeviceState *dev,=
 Error **errp)
> >>           cpu->isar.id_isar6 =3D u;
> >>
> >>           if (!arm_feature(env, ARM_FEATURE_M)) {
> >
> > Can you explain why the test is put behind the !ARM_FEATURE_M check?
>
> Do you mean the setting of MVFR0 ?
>
> because it was close to the code clearing the SIMD bits (NEON)
> of MVFR1 and it seemed more in sync with the specs :
>
>     "When FPU option is selected without NEON, the FPU is VFPv4-D16 and
>      uses 16 double-precision registers. When the FPU is implemented with
>      NEON, the FPU is VFPv4-D32 and uses 32 double-precision registers.
>      This register bank is shared with NEON."
>
> (That said, M processors don't have NEON, so this part of the code
> should never be reached )

They don't have Neon, but that means that cpu->has_neon is
false, so this part of the code *will* be reached. The reason
this sub-part of the "disable Neon" handling is inside
a not-M check is because M-profile has a different assignment
for some of the MVFR1 fields (check the comments in the FIELD
definitions in cpu.h), and zeroing things out based on the
A-profile meanings would be wrong.

thanks
-- PMM
