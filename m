Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9ECC43458
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 09:37:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfDrg-0000sU-Ty; Thu, 02 Jul 2026 05:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfDrf-0000rv-Aq
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 05:37:47 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfDrd-0005Rq-Im
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 05:37:47 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-664a09bc459so2120837d50.1
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 02:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782985064; cv=none;
 d=google.com; s=arc-20260327;
 b=ctctAMg0aVGonmuqAjNlHW9Ac9S2UZWlkEMdv/gjq1B5f4quytfnpdQPmvJtDrP+SV
 UqR8XVjWbAwxnwJHhaZ0aQ4hoQwlzUqRGxo4gSI32fJjGFqLIKPqNM2MqIjdOaEaGWN9
 bxfIw/ep7UEI81lbcInYAVim6rYWIo6CVaYlq6W5/pMD07c3JK23x7z8Veqg/hxMjK2F
 4ePakzFX1Xhu+3Yhrr8QKf0ZbCjajxdGOGj+hlbvIZzvYYw30yN3b+51rZnA4UWIhVYu
 IH/PxzDbl64OUYXJQv9oJCfzDsZGXtVlk6oAiiC/Hq6H80WyYe9ZMF6SdWOlbPRQbZMQ
 1yrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=AtrQ9mwL3IOXQm02TskZACPvLmDZdCUNgt7U5ll7UT4=;
 fh=8maI3F1Cd09aWmtypVpVpUSWt88Ar/ZdVxpXkWQVVeM=;
 b=HxP8aKFTRQ41lye0gEuarYpgGGUHnPUL95MYfUgGoZTEX//dDuQRrtwseJqfV+QSIb
 dcRHYOcnRGo4sPcJZRIcMyXuvqZbhBJ3ujaw4/gYOOf5VBV4cSLXlUgZC6Ej9aoYzuGY
 BItjFq7ok3jG2Dwl+9MdoZtwmFRTtLM4+oT+oH+qkzlBfcHwnnsI1JoZtGXOaAPJi8n5
 V8aKy2nZa5skP4kftY9RW7z1ox8BVvP1oTzsbF/smjGsfVLNPXzcYLJQVy3fAPmK7s8p
 MyIEQE92VY7ax50hrEgLbzi4JAXm+WS+ENO/yY35C3Es7p4VFtonZjGbYaUuvjxrIgS3
 t7tA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782985064; x=1783589864; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AtrQ9mwL3IOXQm02TskZACPvLmDZdCUNgt7U5ll7UT4=;
 b=QWxFaUW8cXVgSc2a26tU1z0YgR7PjpWKBanyrj++c93ycJiE1iNmQMXaMJmHVZp94j
 HU9sE7MKrWMm1w9XfkTMuwQMi49/GLBJWVzO4VrBYMuQJra5oZLX0OFmrbohQkmf5ORJ
 UiaoJhybTibSHfmz7i8nogyCHeSLTkV1Y2WwSjDNFhV3cdCmEvJr5rnf0LU23bPP5uGA
 Ak3DfBbvN7+55TAK9r6W0Md0wt3ZaaYCrt4yPq5sw6uLYzRQ1/fZe1n+fVpSwyZm5Gez
 vCiO3ILZQFBryKw9Le9MnvSjSIAn/1WHQe2DDSu+YnO4jitfxjerr/kCcLdJCg0d1gTY
 bATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782985064; x=1783589864;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AtrQ9mwL3IOXQm02TskZACPvLmDZdCUNgt7U5ll7UT4=;
 b=dwDk/0v0yyKQKJgPWff0XYiSHbUxHiQZfdV7epwtEQQdrVBYYQ2/j3SabEThJHIGRm
 bQiR//Ks7VFLMb5o7OU/WYM8wzSQrR9l0CUWGYi4QKHkV1A3cfD45fYWdbWeCZP6HT8y
 BTx9qyup95Pb3JNV/f3C0B8kcBbmPL/W4Wj3SSM62uX6M5PiATY5yoNVDZ4CsS5TV4Ft
 mVG7OB7UpErM+36TQmOBMLwBa11LNpNevPzOCHbPI0jn6Ccx/ntD7G4jq3vSi9hFrAJZ
 R1yCj1qHUTf1csY6SFyEakzEZpCQcdTBS77/xO7ho/QsrebVeoqM/zN7zmdmXFAf6rMw
 fr4w==
X-Gm-Message-State: AOJu0YzRbYAZuW9xcPQ/61h/xY8Jtp5iVOeZ2zYqk/nsW0Rr5VOvY2zi
 g74Lz8C6AwaCjwiu23vbkftcaT2B+IaBvHNE5iBcl9//LuWjQCWfgpGSzaxIfNo7AV6JuLCQjTE
 wjD5jErNRCXjIaPwspjUaGs/hFzzJhRoqhohkffMGIg==
X-Gm-Gg: AfdE7cnht0tZWBAw2l8kvKrDO9eCr8omwlSFc56zlPBqV/v8hvk6UQ4DWF6PZiMU9qO
 0yFpOWSlbgi8+n37g8Q+9pkMPZEdUtQTPLXyCLk2t/NaQfQBU7lRP2HdRJae6a/D3dnbm2ozGNj
 +WhsduSap4QcITrd6zCtZ01vYCv1dZ7T8Hq0GvGeShqkDz/qzd0MuSrQ+pjODh/CAq2+lb5ccXL
 /L6SNQTUHK+2mWRH2IDe6QkwZzLZIhNoKspihI2vi4C+6DrDTb8eQpTZsfVXHUJKwoKf/6E+CQv
 flZXp1iJBMzmqixswSogU7NpuW6ZJdWUbnJvhx42nMukFlAhj4OfNN8G
X-Received: by 2002:a05:690e:1182:b0:664:e2f4:52b9 with SMTP id
 956f58d0204a3-66521ad0e00mr5620015d50.28.1782985063698; Thu, 02 Jul 2026
 02:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260701231224.106850-1-heinrich.schuchardt@canonical.com>
 <CAFEAcA9Y1Mfsdn=tQXA=QJqa14JbjhnexPhnem1oi9vyeDPVpQ@mail.gmail.com>
 <0111db84-e090-4ea5-8c15-0e9623c9c064@canonical.com>
In-Reply-To: <0111db84-e090-4ea5-8c15-0e9623c9c064@canonical.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Jul 2026 10:37:31 +0100
X-Gm-Features: AVVi8CfcJO5ooGUfdjKWY3gfpJmm-KcQy9DcfC1dw25oEk1Ykyb0ZKR2ghTbMN4
Message-ID: <CAFEAcA_TVJ_kEutVXZAuOmv0TQz0jmZ++AqQMtrzb3=_FhoRTg@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm/virt: define initial aarch64 TCG CPU
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Thu, 2 Jul 2026 at 10:28, Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> On 7/2/26 11:05, Peter Maydell wrote:
> > On Thu, 2 Jul 2026 at 00:12, Heinrich Schuchardt
> > <heinrich.schuchardt@canonical.com> wrote:
> >>
> >> Function virt_get_default_cpu_type() is meant to return the default CPU
> >> type. But for aarch64 TCG it returns cortex-a15 which is a 32-bit CPU.
> >> This results in failures to boot if no specific CPU is required by
> >> the command line.
> >>
> >> Return neoverse-v1 as default aarch64 TCG CPU. This is the aarch64 CPU
> >> with richest feature set.
> >
> > The default CPU type for the "virt" board is the way it is
> > for command line backwards compatibility: people may have
> > existing command lines that this change would break.
> >
> > I agree that for most people "cortex-a15" is not what they want;
> > the underlying principle we were trying to follow at the time was
> > "any command line that works with qemu-system-arm should work and
> > do the same thing under qemu-system-aarch64". So the virt board
> > has the same default CPU for both qemu-system-arm and qemu-system-aarch64.
> >
> > If we were going to change the default, I would probably suggest
> > using "max". Picking any particular fixed CPU model name is a bad
> > idea, because (a) it won't work with KVM and (b) in five years
> > time that particular CPU model will be an old and out of date one,
> > and we'll find we still need to tell people "you should specify
> > a CPU type because the default doesn't have XYZ features".

> Using 'max' as default for aarch64 would be fine me. This would work
> both for TCG and KVM.
>
> I last encountered the issue when running a VM via virt-managers. We
> cannot expect the default desktop user to know what CPU they have to
> choose to run an arm64.

Unfortunately the user rather does have to know this kind
of thing, in the same way that they need to know which
machine type to specify. The x86 architecture is a weird
special case where essentially everything looks like a PC
and defaults are workable. For other architectures
we've tended to find that isn't the case. More generally, if
you're executing QEMU directly there are a lot of command line
options that are not default but might be either necessary,
important for performance, or important for security hardening.

For a more "user-friendly" experience, users should run QEMU
via a management-layer app (e.g. virt-manager). That layer can
then pick what it considers to be reasonable defaults.

> If a user runs qemu-system-aarch64, that is typically not for running
> 32bit software but 64bit one. A user wanting cortex-a15 here is not a
> very likely use case to me.

I agree, but it's hard to tell what command lines users are
using out in the wild.

> Changing the default does not have an impact on existing users of 64bit
> software as they are used to specifying a CPU which will override the
> changed default.
>
> Please, indicate how to proceed.

I don't think we're going to change QEMU's behaviour here at this point:
it's been like this ever since we added aarch64 support to the virt
machine type.

-- PMM

