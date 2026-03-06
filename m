Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4F9F0182F
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 13:36:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyVM6-0006DE-FH; Fri, 06 Mar 2026 08:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyVM4-0006CA-Mg
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 08:36:37 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyVM2-0005ST-2J
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 08:36:36 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-79827d28feaso93341037b3.3
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 05:36:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772804190; cv=none;
 d=google.com; s=arc-20240605;
 b=L3iicSq+HKR39aByutoj8C27Uo+JVcnT5W1x73iiTMPzRc8kqG+JqZJpo7aY+CbITq
 HuV9XZeR8KOuNdnIushb8ZioWAY+z5kYlwedPF5Eon0IO8VwJs4eHdzG1xInfvnChuoo
 npXTbDlob3dt7r11ecSbiWL3ZAEvyVDc+lGscIBbN31znFtHyiUKzfEKu6zhRWAMwvcZ
 9awqxNicPOrdeyhwI0sxRayvVcTMs2Uf6jGSgjkSP680wA+qwLqJAh7/yW6tC9Br4qT2
 +5WUPSd7Vn5eJ5PHAzvuAkwCUt4KnJFrs9rSId7IMmoqob8+HBzUjc9iyw0T1fqdzmXs
 Z0ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=HCQLd+EiglPdY8lR++J1vWDeZLDuOmfJaUc4kL430Hs=;
 fh=eQkyJ1jqgpDhYQJihqZKXliQV+vSCz+/O+rvmhTE7HY=;
 b=aUwmNhdfumuYe9cvWWWgAdExxldiUccVhkfAuo38moj2mi2x8pOpEZ/sWRmTC9PzBp
 cTYieEfgdo9Q9u8Nj7xjiP/O01+6baUaQfGzed+BL4FXRTdJDODW/4ohgII2Xdv8c9HK
 Dxv0xvpKjt5GTlQOqfGQhFpqrimMT2erPJmqnqB72uLJ+6nCmw+d1DOFS050PRHNMLXc
 LBpcKxQ6Ch27YhqC8qv7m4ii81I7soVhy+PHB/3LGWI3fj2AcCIf44ZAxKYXKT6ou5o1
 aNBRNrsMKmDEYpdRf7ExjB7qMoMFR9JpgphOcbr+K0L1zfhrYxMvxoZjCzQrVjxreeE7
 PZpQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772804190; x=1773408990; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HCQLd+EiglPdY8lR++J1vWDeZLDuOmfJaUc4kL430Hs=;
 b=Po3taHwgFmdFr879NBBHWdjw/8SHGYBpWC8fPrZwJU4QwPbQn2BRIUf5R9e80I8gRr
 uGLcanxdyRFGCT2QhX+JPTDX2n39asAtOI1t1FoQYDozphiWZhbCeN2xfzzODLxePNeT
 llRrVS0I0HTwz/42SUVawZip2W+uonjO4DU46WNyfhA9fKy8wTbWlyUfdu3dBmY4rew1
 mlSbR9GT6eyI+zS7eHkhX25/fkh8XsIRjw6+abAwxpdibZz0DldL6DBjfO9VmBJ7sMdJ
 zMSi58/xdkp7n9XX9Wa6vI3gUaQ34DWvZjDxja087LgLoW4mV5LatWnNCjfKwuEC3fKZ
 T+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772804190; x=1773408990;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HCQLd+EiglPdY8lR++J1vWDeZLDuOmfJaUc4kL430Hs=;
 b=nWgG81pYJRiQ5xQbTRf4oyJQC6G/+EgTRjAYGRRpgOTNiW7nKHYb9PEc1VLsQmz13V
 Ox4edYM2eHp4Z/5F+cn66iQD48rfPD6GBjcDCdoLMIN4nFXGGzPNx3NwToUBSkqj7Tz7
 yquHNC6fxISd3zYqYobPfdoKcxP0EP+H41lhkXl4h2FNpXxQCRAx+P68AY9e25pgdO12
 btM3WgHx94rQu4bECXVuaQljSE9nz1GKAsp1eIjaFZufpKymKF1ugyTSscwWDUEhrXm7
 kckIUL7lhk/sWUKFjLV9GtBE44E1P/3goLFPW5x9qkeBeTEFhoJubnRTHganuoYX8vcE
 miSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHXhBsGYfYudr8I1/5ZB1dklxxQUdRpmaCeBeYsQSr5IbBw6SyMTpBQVB8MIk0J6OR5yJy4/D0mw==@nongnu.org
X-Gm-Message-State: AOJu0YxFyasfPAtLEo2ER0wdApGb93J1cKmLax5zgxDHeKnkbSq8WqvX
 p+GqpKog9rWYu59us1M0MJ4sP/h7o6jsYg6a5+Vf2Lh0XnW0gr7CFJ60rYJ7ejt3bgDI0fS4hyO
 RH8iggq3maGGcMZ2aHQ8wVpXi5RTtiqvYj9zwQk7/bw==
X-Gm-Gg: ATEYQzxDi3rUIyvDhvjUhd7SxHvVWnXwEM4XI5PX3xstVbNrKwmyvLNUus7rAOiFgH7
 ccGX3CWEmjGciqRvTurA26GCjPaK8YSJeRjZ62UkEsWpCCWbsd24zYWJFkx5ElMnkVfN3n27Dy3
 sCzVvb2RHE9fZq+VgZCHnR2pfIF78SUwXoDfJ+Z8sC9r+toCbdnBjVoya+GlW5Sg7XJGO89CTmj
 DGhwbTWQrmurKbzem37+kSjLD23CcbnzI1487jI0HdVA2pHJqoZp7fRdp5DszA/fsuC2IgKHDXk
 N00MkHM9W6pZXRPxLZahTfHUb04j24FNExp9EbKn76jiGA2uPERB1zKB+XRKYG9L9H4=
X-Received: by 2002:a05:690c:6d83:b0:794:ede8:16c with SMTP id
 00721157ae682-798dd7d07d5mr18565807b3.60.1772804189543; Fri, 06 Mar 2026
 05:36:29 -0800 (PST)
MIME-Version: 1.0
References: <20260306130107.35359-1-mohamed@unpredictable.fr>
 <20260306130107.35359-17-mohamed@unpredictable.fr>
 <CAFEAcA-bh0s0mkUEsunwDRAjRsCDJaJkzHToUg77e-6X=ejbyw@mail.gmail.com>
 <38911692-67DC-4212-AF8B-E647F488390D@unpredictable.fr>
In-Reply-To: <38911692-67DC-4212-AF8B-E647F488390D@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 13:36:17 +0000
X-Gm-Features: AaiRm52CPQ59ijZV9yxcu93XNoafMzYAV-is9X3aSFUE-_yXXGf0SGtosf0SR3w
Message-ID: <CAFEAcA_dzEjy8knHkARmAhCqc1rRxAK8S5ptaj3kzu54rT=x0A@mail.gmail.com>
Subject: Re: [PATCH v15 16/17] hvf: arm: disable SME when nested virt is active
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Fri, 6 Mar 2026 at 13:34, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
>
>
> > On 6. Mar 2026, at 14:32, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Fri, 6 Mar 2026 at 13:02, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
> >>
> >> Currently, Apple doesn't support the nested virtualisation + SME combination.
> >>
> >> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> >> ---
> >> target/arm/hvf/hvf.c | 3 +++
> >> target/arm/hvf_arm.h | 5 +++++
> >> 2 files changed, 8 insertions(+)
> >>
> >> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> >> index 0183dd8a60..61ba5acce4 100644
> >> --- a/target/arm/hvf/hvf.c
> >> +++ b/target/arm/hvf/hvf.c
> >> @@ -1181,6 +1181,9 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
> >>
> >>     if (hvf_nested_virt_enabled()) {
> >>         FIELD_DP64_IDREG(&host_isar, ID_AA64DFR0, PMUVER, 0x1);
> >> +        /* SME is not implemented with nested virt on the Apple side */
> >> +        SET_IDREG(&host_isar, ID_AA64PFR1,
> >> +              GET_IDREG(&host_isar, ID_AA64PFR1) & ~R_ID_AA64PFR1_SME_MASK);
> >
> > This is
> >  FIELD_DP64_IDREG(&host_isar, ID_AA64PFR1, SME, 0);
> >
> > isn't it?
> >
> Hi,
>
> That's an equivalent sequence indeed. Should I respin for this?

No, I'll fix it locally.

thanks
-- PMM

