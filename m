Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FAFCA5FA1
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 16:05:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBDr0-0005l0-Nt; Mon, 28 Sep 2026 12:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBDqz-0005je-3K
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 12:05:21 -0400
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBDqx-0007EX-6O
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 12:05:20 -0400
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a6056ac81fso4571722a12.2
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 09:05:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790611517; cv=none;
 d=google.com; s=arc-20260327;
 b=NOkwzKsZbiX1vRKHG2LtfnLRcA8TsAABgZr//4kOvJnYGjleJG/mZjxR5UR2VYuYQN
 Zmiwr18K+uuXW3eartHChXXtSjrvGbOfgBqeEbTmjNuE+e2walLCiVdG22Hg2fUb0E0g
 vZ06D91dfP/CJLqeU4/CG608cAm5hXvCSnt854cdu9/c7ylL038yjnx6VOiN2YVyjc2Z
 CjOsY2t8G0JaFD1/U7+BHI/2llovit0/1ZTCEg68qX7T2Usf067RhZsUtoRM1gpaa+vd
 XrUQXqO4FfdBYwe34L2cgfX6EwfE5esGFnxoaTQtZs4gbiptKU+E7USSOm8gUZ0oM/+A
 oRuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=w9EzIeFbERenqhymBK9XblJ6PBKI//1Ot9k5xJ9LNso=;
 fh=39st28wUZd+aNsfAD9WLXnCV3MMg3jcLJQv8NFTRgGA=;
 b=WSSiAVMpSb1hq6X7v3ZL1AM35fwgz2JcF0tMugxA7KmyNJl076BuOM6Vr3mTAAFYn8
 hf3HkJH1zi+kn6xeV5bgKxqv14XT4r4UhjsYu6zXvANZnYxv7vOlqEiBRUIADuhFXfQk
 zXZmFBgCkTafGcHu2lqixoyG1/8E1PoK9g/WsW6DrtyOIJwXGViVAokSfc25NffZkBG/
 +xnSDzkIqaLkPu+gwRZPd//haFmR9M68fBZz3sgqVVQsIC8nA8Mr/qKvVrDPfEaEPS/1
 PfaH5I7ymVdAH3ISx0GxOXb4ye7sYDDq0/P6Gdvyu0sNM0VihY3qy8MzLtlQydeYpnS9
 iq9A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790611517; x=1791216317; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=w9EzIeFbERenqhymBK9XblJ6PBKI//1Ot9k5xJ9LNso=;
 b=gDv5TVeTTeUH+4gi4thS2Y5FO9S5VVWqIEEH82BkfiINyYu3x1CcxAtlOKeS6B5Cmc
 jHAyF4xHO9aIoU69W69aB2BJQ4SGRsFacLpDrwwdQEZzcn6K6s/NS1hl9ilwlGBmFa1D
 R+nHpmbVTYh3j7QtrVF7NjV+qQf8w1VcahGqmkVFcs12cy99CKnQTVkM+jPoODzRCtOJ
 6MRfIq2GEleC2ogNKqJGDMeIzWw2kBnL+u0kwv7xy7AWdQCikravjoaRxGjcaq2kX17p
 Wi1jV+jFBhXyVt5sNvMT/hQqzBHXzPLSBEUyNYfDlvSmxx6c3kMT6wv6PCkNL2VDtSPZ
 NJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790611517; x=1791216317;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=w9EzIeFbERenqhymBK9XblJ6PBKI//1Ot9k5xJ9LNso=;
 b=m2KAhEbPjEJMQy3tGCXuko5v7CxGqvBbbUafqSR76LNvTYHFrmfgcXkwKeraSZ58fA
 ncUVQ3jUB7OLHFZBmEOmUSxmT/Mui9+I1M7XIzeVe6alinDmiTASmALc2rErrrEJ9dUe
 uyQEHhF26okf47Jq/h58GtZb3YuNl8M2xCRXfjdCAKU71dGMZPON/wSeMTa/cZh6kvEP
 yJomwm27MPgtapilb1yCDGkiej6V5QvwGqbkasLxdahLy+t8GlV5vNaEVoMR2OZABkl3
 Om/fm6VFo3MDhlY/3QvrpgJRrj/OF5qPR67nQlEZPvLAPXjA4Kcj0laBntbQw2nPTT43
 qbpA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw6C2Rk1vKc2cGFE5yhEpCxDr1ZOutKQlMScdZusPIUhfORSp6aRSuOSD7wqfF1oujq81WK8OD73Q==@nongnu.org
X-Gm-Message-State: AFq9FYJLHJqSyvJHjEiIGkLJSrVafN2W1Iwj/d1+SgJlgzHsUY2oqFBd
 IYsGC6oCNQSwtIq7VtH6+yisCK9nHouhBsddVP2I14sKpAujV28nbQ4i5oalaBEBmeN5y1KtsqI
 z3DOvpbyPxkUL1ovWXyAm/FeEL70qRb0=
X-Gm-Gg: AYBFou3zQMLvwXWEprJt2GyA+ECgJTEn2m+G5LVNf70b3EgDLl1s6cE4hgWE8MeSXsJ
 g66p5zLSEcM9kSb/AmkprHAqSKj/dK0h2MFCv+uOlFn081l39SSPIQhtTqzuPKCoJTlw0ebZgw5
 74fLfvKqT5JwOIxald/I8m+uxd2XfeGB7WgW0aDzCztwSWidEQz+vKiBHMnSv+U8OZbI53UGUpW
 90xIGGssKuB37EKltPHlkCHnfpZZqdsVPnZV2WRg6ZDyK+x+GyTE0hJhVWrgTkWwDcihca7Gwyd
 y0naSV4zadoir/Q5lm/jGJQL/ZswNrGcERMD0l6beRGqEH83pUhSQz0=
X-Received: by 2002:a05:6402:a290:10b0:6aa:e589:87df with SMTP id
 4fb4d7f45d1cf-6aae5898994mr5001332a12.30.1790611516982; Mon, 28 Sep 2026
 09:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260926070057.1234-1-luoyonggang@gmail.com>
 <20260926070057.1234-47-luoyonggang@gmail.com>
 <aro93NuZBXYGbD33@redhat.com>
 <CAE2XoE9AAz8KfJrpErBaZvW5p5COxfE1yveA_AMPwa0j=ghyEA@mail.gmail.com>
 <arp7xUzPHmkgfxLC@redhat.com>
In-Reply-To: <arp7xUzPHmkgfxLC@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Tue, 29 Sep 2026 00:05:04 +0800
X-Gm-Features: AclHuK_ySAh2wUP_ZLkRO-cTQXhVC-RYZXjpf9omF8LYWvQDhoUtMF2fg4CBqtU
Message-ID: <CAE2XoE_Zgs0_Co4ZLZiTRQZrx4DMRo_i-FEN79b+ZbHCedFd6w@mail.gmail.com>
Subject: Re: [PATCH v4 46/55] qapi: add query-targets
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:33::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, Sep 28, 2026 at 10:38=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@=
redhat.com> wrote:
>
> On Mon, Sep 28, 2026 at 10:24:39PM +0800, Yonggang Luo wrote:
> > On Mon, Sep 28, 2026 at 6:14=E2=80=AFPM Daniel P. Berrang=C3=A9 <berran=
ge@redhat.com> wrote:
> > >
> > > I don't think that we need to report machines though.
> > > We already have 'query-machines' which gives much broader
> > > information on the machines. "MachineInfo" needs to
> > > gain
> > >
> > >    "targets": ["SysEmuTarget"]
> > >
> > > to list which target(s) a machine can be used with.
> > >
> >
> > This is my final design for the query-target / query-targets / query-ma=
chines,
> > for consistency and testability.
> >
> > Per review: reuse `QemuTargetInfo` for both target commands, drop the
> > per-target machine list, and let
> > `MachineInfo` say which target(s) each machine runs on.
> > `QemuTargetInfo` stays small; `query-target` and `query-targets` return=
 a
> > derived struct that adds the target's device and accel Kconfig state.
> >
> > ## QemuTargetInfo
> >
> > ```
> > { 'struct': 'QemuTargetInfo',
> >   'data': { 'arch': 'SysEmuTarget' } }  # since 1.2
> > ```
>
> > ## QemuTargetDetails: QemuTargetInfo plus kconfig
> >
> > ```
> > { 'struct': 'QemuTargetDetails',
> >   'base': 'QemuTargetInfo',
> >   'data': { 'kconfig': 'any' } }
> > ```
> >
> > `kconfig` maps every device and accel `CONFIG_*` symbol to whether it
> > is enabled for that target.
>
> KConfig is an internal implementation detail that should not be exposed
> to management apps as we don't want KConfig to become an ABI we must
> preserve.  QAPI introspection provides feature based information to
> the user. eg instead of querying for "CONFIG_SEV", qom-list-types can
> be queried to look for the 'sev-guest' class.

For example, `TYPE_NITRO_ENCLAVE_MACHINE` is available only when
`CONFIG_NITRO_ENCLAVE` is enabled for the target. When I construct the
machine list literal,
I need this information to help me to check if the machine is listed
in qemu-system that matches
qemu-sysetem-$arch. That needs a QAPI for it. What's the method you
would suggest
for? Otherwise, the test for the listing machine names can not be
reliably running for it.

for example:


/*
 * Machines omitted from the normal lists. Merged in when @kconfig is
 * true in the target's query-targets "kconfig" object, which already
 * folds in host libraries and accelerators. xenfv is an alias of
 * xenfv-4.2.
 */
static const char * const xen_pc_machines[] =3D {
    "xenpv",
    "xenpvh",
    "xenfv-4.2",
};

static const char * const xen_aarch64_machines[] =3D {
    "xenpvh",
};

static const char * const vmapple_machines[] =3D {
    "vmapple",
};

static const char * const microvm_machines[] =3D {
    "microvm",
};

static const char * const nitro_machines[] =3D {
    "nitro",
};

static const char * const nitro_enclave_machines[] =3D {
    "nitro-enclave",
};

static const char * const x_remote_machines[] =3D {
    "x-remote",
};

#define SPECIAL(t, k, m) { t, k, m, G_N_ELEMENTS(m) }

static const struct SpecialMachineMap {
    const char *target;
    const char *kconfig;
    const char * const *machines;
    size_t n_machines;
} special_machine_map[] =3D {
    SPECIAL("i386", "CONFIG_XEN", xen_pc_machines),
    SPECIAL("x86_64", "CONFIG_XEN", xen_pc_machines),
    SPECIAL("aarch64", "CONFIG_XEN", xen_aarch64_machines),
    SPECIAL("aarch64", "CONFIG_VMAPPLE", vmapple_machines),
    SPECIAL("i386", "CONFIG_MICROVM", microvm_machines),
    SPECIAL("x86_64", "CONFIG_MICROVM", microvm_machines),
    SPECIAL("x86_64", "CONFIG_NITRO_MACHINE", nitro_machines),
    SPECIAL("aarch64", "CONFIG_NITRO_MACHINE", nitro_machines),
    SPECIAL("i386", "CONFIG_NITRO_ENCLAVE", nitro_enclave_machines),
    SPECIAL("x86_64", "CONFIG_NITRO_ENCLAVE", nitro_enclave_machines),
    SPECIAL("i386", "CONFIG_MULTIPROCESS", x_remote_machines),
    SPECIAL("x86_64", "CONFIG_MULTIPROCESS", x_remote_machines),
    SPECIAL("aarch64", "CONFIG_MULTIPROCESS", x_remote_machines),
    SPECIAL("ppc", "CONFIG_MULTIPROCESS", x_remote_machines),
    SPECIAL("ppc64", "CONFIG_MULTIPROCESS", x_remote_machines),
    SPECIAL("s390x", "CONFIG_MULTIPROCESS", x_remote_machines),
    SPECIAL("riscv64", "CONFIG_MULTIPROCESS", x_remote_machines),
    SPECIAL("loongarch64", "CONFIG_MULTIPROCESS", x_remote_machines),
};

#undef SPECIAL

These machines all depend on the kconfig. When I try to write qtest
for it, I need the CONFIG_* information to be returned for them.

>
>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

