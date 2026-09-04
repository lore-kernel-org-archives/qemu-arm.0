Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CA2C61DD6
	for <qemu-arm@archiver.kernel.org>; Fri,  4 Sep 2026 10:26:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2R7g-0004SM-PR; Fri, 04 Sep 2026 06:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x2R7a-0004Jw-PG
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 06:26:10 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x2R7Z-0001fx-7B
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 06:26:10 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-86cba60d4f2so6622237b3.1
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2026 03:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788517567; cv=none;
 d=google.com; s=arc-20260327;
 b=dVTqMpSUVxgdYXKaGEtT2dgUXUu+Z0fKHbV0AMtOOLiZnIy022SmSacYYG1rV/SHr/
 tMijH/V1kH3WUqDfGl32kGrvKY+RdTWWlaxOCJQtyH7NlpedYqZYMwgbWOWVkCeg5wv7
 1mDN9KsbQxQCdI/DlgbMJILAmuSi/O91MJ1tPP9oydltTDjVpYxIkCLSeBMTRipWbINd
 G0ZMNEnyzs/lVl+lvwRQq+eV4mEVyVRyAREx9vtYaUJ0JjN3aIMBQPs9SGd2BA0y24vY
 Dx2vdbuWqze2qH8KxNGcL4zMWv66p489n79IK02DKiIgX0YuZ+UTvtqWTQBT7i8GwNO+
 7kbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Oi37ui2jtTv/W9Qpr4OD39SEYTDwVCyUeFHL7g5vmEM=;
 fh=7EAJgQJKSF+951l13dfW2gfBhBaPYVDvMBEpWn7pPN0=;
 b=WUyNTZnPvj+1PUBebErm9FIMyBNhpmga5X7wdsgkMJXuAJELjHrHW6LNKu7vtRtzpr
 kF7r3nsuNivHb0gSE4FwBDrGxPxX158RUXXJ+PmtL3ng250eUQk6bJxQOzYBZG0JYX4W
 A/vRNtPidhXRi/P0dhxI7/tR6tR3UMgt9AXUfTP8fmvaWtcOMzOGdel5/ycdqAoAG+aO
 6ytueGptgVV5ara0rI4z5ifDUR9Qx6hUVgCxLJptOnVpiHABTfiCNhjRtGtEwJ/AHK59
 yKp09+XdW+nzbpAsQB4TunqoJK1GYeshKcoBTXmDIZ0bA4z/W0W1hJAJ+uGPo4yDoqbV
 o4Jw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788517567; x=1789122367; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Oi37ui2jtTv/W9Qpr4OD39SEYTDwVCyUeFHL7g5vmEM=;
 b=awPyc9B86pCxqmROvMk/DYu5B6wO7FTTTaHHXSD+6D3M57owmZSMDnJ3SgL3M/oEWt
 mCkvTKFFFyGoSELK9nJ4GSx93ZoP1PicsYK6tlUjiFW2KUNprL9Hr2q4sbz4hIanfRFI
 OLUDkOGjFUcydQ6gJSiEb8Fb6WFITpKDIKZaboBikJGJ9XPJDHey5w0hLx72IwTEShP1
 CH7OaOucvG6kdSVV/89LxtIqMV3/qOYu0m8pShdus/k6phXde5a4vaxwpO2mYu5lPCQB
 2fp9zTmAQoFDDVJMZdbf/5hDfNECbMoxwQ6qUSEMia3aZ1ou0s0paDEygKAq4zeccvOI
 OMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788517567; x=1789122367;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Oi37ui2jtTv/W9Qpr4OD39SEYTDwVCyUeFHL7g5vmEM=;
 b=X77vOlVJeEHk13F1UtvosApepVyRw9Ey44i4r68MtzwbfOM/jh/YD9hAD9uNLW0T4h
 07PHeEZuxX+lrYErlEJMTQNz+gzHZHvhjabX5M/qWgYaEj9bC4BixqJx3As64qv5IhzI
 efus+rqBgD82lYVUwk7u6YnHTeFJKCjhRlnacAgcHcAJo9l00HdwVHV9J89XKfXEOFc7
 ylA/4mkDj4SxaQwTdYPa/JIW4VWKv5K7vSCNGQqC7lv836DmR4Y5z+Dcpea8GpXRHbR3
 fErg8lm7h/NbdWIc17Ur7+HWbJ1cTgddk8gnAiC1fkrl6DIMHrKrLlgVjd2xAmbT3J/q
 nIZA==
X-Forwarded-Encrypted: i=1;
 AKwUvByWA2aKWHb0pR1nuQP9LkKjbsBLDrQsVOSF5tsbGYU1uU9JhG/zVsCf9uLb/HsqKQfIhhQLWt9msw==@nongnu.org
X-Gm-Message-State: AFuF++lHJDNhV13ALxhES1P7gHyEu574xvPe0BkWxrnXYlUDzwJnh500
 ssb91/RbZdLtjK3vNstkVte53GhH5QzPtIlWnR8FxcCY+pQNIP7iem6sOk91UaL3WeKL33zXFim
 2JEMQ+lug12blOEWfZcpD8UF0Vb45aCOes33I22LqYw==
X-Gm-Gg: AYBFou07gouezfHmRKsUQOFlbj+CKh+iCZJZY5RtNQ5v9RISNBujw9qoAQ/a+ZqQ3T7
 XZkOmBfWL+aM57if3dUXEkuAhT3+DAmp0X1WvOCKCRSV+3EEIqil9PETKqlWMJc5q5M6MxO992w
 meTmzrUZsxNF4HrMQBGiFB3SRnx7nFUjyZ9AcV+o9RuQy6try50/Wl7G8w9BV61pkvKLbneaeS/
 4a4e+RbpLtOFBdak3YK6U3TyblziFSQ+RqzzvGlA1LqVtykG0Ihc+ApK+Xo1E8WrR5HfRjRssN5
 jSj9f6k4grFJLg8+iUXi4omvs2cYnXZQIOS2vriXTOvmSYrnJt9X3oQxj3ALdsJCIXpUIU3lYNe
 eEqi1jgvYS0vTZAZwVshyvmfoQEEN
X-Received: by 2002:a05:690c:e3cd:b0:873:17c9:b054 with SMTP id
 00721157ae682-87317c9e831mr1050437b3.21.1788517567299; Fri, 04 Sep 2026
 03:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260903112532.3276678-1-bin.meng@processmission.com>
 <20260903112532.3276678-3-bin.meng@processmission.com>
 <0795176d-4580-4acc-a3cf-c40f8d221661@oss.qualcomm.com>
 <CAEUhbmW4h_-az5iBsztzy8Yuu06+WMjOYcrL51sW8VEgyAaSMw@mail.gmail.com>
 <881be57e-5496-41f2-af0b-e21087fa5e54@oss.qualcomm.com>
In-Reply-To: <881be57e-5496-41f2-af0b-e21087fa5e54@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Sep 2026 11:25:55 +0100
X-Gm-Features: AcwNN1WimCD3hNUwZUbwn_TqBl72IryMsMCfuzUzn6NxoqPvPf3pq9HujJqMB_E
Message-ID: <CAFEAcA_4uJymq8FM+4QHkeg-m+gkOSXbrmnWLNTEznLNZwgNhg@mail.gmail.com>
Subject: Re: [PATCH 02/33] hw/arm: Add basic Phytium Pi machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Bin Meng <bmeng.cn@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Bin Meng <bin.meng@processmission.com>, 
 QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, 
 Yonggang Luo <luoyonggang@gmail.com>, Anton Johansson <anjo@rev.ng>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Fri, 4 Sept 2026 at 11:15, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 4/9/26 09:57, Bin Meng wrote:
> > Hi Philippe,
> >
> > On Fri, Sep 4, 2026 at 12:56=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
> > <philmd@oss.qualcomm.com> wrote:
> >>
> >> On 3/9/26 13:24, Bin Meng wrote:
> >>> Add the base topology for the Phytium Pi board built around the
> >>> E2000Q SoC, with two FTC310 and two FTC664 CPUs, RAM, GICv3/ITS,
> >>> and PL011 UARTs.
> >>>
> >>> Describe the CPUs as three non-uniform clusters matching the vendor
> >>> Linux device tree. Preserve the board CPU slot order so firmware
> >>> MPIDR 0x200 maps to QEMU CPU index 2.
> >>>
> >>> Signed-off-by: Bin Meng <bin.meng@processmission.com>
> >>> ---
> >>>
> >>>    hw/arm/Kconfig         |   8 +
> >>>    hw/arm/meson.build     |   1 +
> >>>    hw/arm/phytium_e2000.c | 406 +++++++++++++++++++++++++++++++++++++=
++++
> >>>    3 files changed, 415 insertions(+)
> >>>    create mode 100644 hw/arm/phytium_e2000.c
>
>
> >>> +static void phytium_pi_init(MachineState *ms)
> >>> +{
> >>> +    PhytiumE2000State *s =3D PHYTIUM_PI(ms);
> >>> +    int i;
> >>> +
> >>> +    if (kvm_enabled()) {
> >>> +        error_report("phytium-pi: KVM is not supported");
> >>
> >> Why is it relevant?
> >
> > This is because the machine relies on heterogeneous named
> > FTC310/FTC664 TCG CPU models and Arm KVM generally requires the host
> > CPU model. KVM is rejected explicitly instead of failing later during
> > vCPU initialization.
>
> Hmm OK. Cc'ing Pierrick to add to our list of things to think about for
> heterogenous emulation. I'd rather have this handled in a generic way,
> not per-machine. Hopefully TypeInfo::is_available will be sufficient
> to not expose the machine if KVM is not available. No need to think
> about that now.

Explicitly checking for KVM is something we do already in
the sbsa-ref board. But I think you should only need
to do that if your board type accepts arbitrary CPU types
rather than hardwiring the CPU type.

-- PMM

