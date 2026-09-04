Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EA1C624D3
	for <qemu-arm@archiver.kernel.org>; Fri,  4 Sep 2026 10:47:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2RSM-0001R9-Pf; Fri, 04 Sep 2026 06:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x2RSL-0001Qg-72
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 06:47:37 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x2RSJ-0005Y4-Gq
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 06:47:36 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-81f3b227a4aso11415907b3.1
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2026 03:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788518854; cv=none;
 d=google.com; s=arc-20260327;
 b=J6CA7XACE0KtPRbdHemVYDiHDOiBmg79KqO+zQ8eAkscjULPTOfD9gDJzEYkfFzmk7
 VtcSn0TD2tPaFEFuIGRhD5Nb/gaw0r30gQv0RcyJOtUzJEwqhozrTo/SKIg4utFrK8Gq
 KBHe+2hffcBwnAyBN5OmPlPvd0rADlTDLtXJsAPJrvSC1Y1bnvpB+ebdj2O8v68aHNcs
 8PJ6UA7HShC+stSnm16ZG4C0tPR+4t5JPxi+f25NmXOnxVf+MU4rh9/03HOv+7icYA/E
 tFB3Q7laE5pnyeLGMlzoYLWoE8U1q8HV5N840n3hLgbmLlB5Nb+fEgfMpIuJqzUMCWNT
 nGyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=bZKKKKThKuOFYAQn80lE6BUSMfr5CRCsbm/95VWf2NI=;
 fh=J75D+OOttzN/2ZtcswNPEALRUHMdC7DQtj6kAj0M4do=;
 b=WaZyZ2ihEc0faC85yUlDvLHKorwPBn65jnz0gpu7UVkY7YMJ4YnqiayF+WDa1RVqMs
 1B/GWF/CckCt/xRm77ESWVn3xt8B6qMjEzKbKwClu0PDfbt7N7c2RTys+7SDwymWrxxU
 CMIzRrQMMzGWLIGGf6cUKZ17Zo5LR8FML7GB89I0JlQDA47KPqhmUFqxXtcZGKePxVTQ
 IZHOELgH3iZxN3125mB/IAtlNLoygEb9C54Wuz4Wf8+8Tfy84fAbi76rxCiIiM9H2ImK
 m4yghdcHblPgGXsL/DLbTmZPjTGamMJc1pvF65Q/vBza8/vc9CScQtrL/61387YsCslz
 /Tvw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788518854; x=1789123654; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=bZKKKKThKuOFYAQn80lE6BUSMfr5CRCsbm/95VWf2NI=;
 b=bl6LNmbq4mVTSV1hLsq1eMnLnnYIegEmIe98VGA5o6Jljxiy94RUwjbieXzdftDZ0L
 pJYueMHSed4sQe9X+RTh76W1WVh8/lvFgyFA6w7H96ofCkNHNNTnsVEsTJwiUKTNaNzt
 UxemeqrQy3o7xOCU8i+VwBHXVrcfR3yChxlZDL2+mEuw4agdx3eiitq/cqhnw0Vui16/
 T3Z0yV98o/P9+361WzwaMmYdu+Um/2LKb32ogbYaNChQbsNTxp52Y5oQXw+tVNbyXV6o
 ol2hlTDI8+AvtWhOZk8LGi9PAq9BPfX9tSWfG5n0MthUexyGLV0IHrs9WmiRFPK09RVR
 HMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788518854; x=1789123654;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=bZKKKKThKuOFYAQn80lE6BUSMfr5CRCsbm/95VWf2NI=;
 b=pOKyxHbNqV8JKLrzq+k4PxuXzIc8EC+LJife1aij9N5v4155UCHiNYM9Us0sgKmH++
 nDqb+uxSGg20WdEY+MVloDORT8QxDg9wu/4+0ef2bvvpz4OnexWIGw5j/JBvjb8J+/0c
 wX5TQvcllz73We2FcSfQkt+M9/aXUXlGmzdQhJ8N8qzcVmKprfvTbqXw47PFTyZ83sy8
 Up2AoJaUGM/1FZtFwZBILcuF5pBwuLpP05UivvMz6B1W2jiOuag0288EOAAFpKx+Dvx9
 z3TuX+R+/6ajierBE0T4kyonB6G9k2bu+gJ5+I4pRaAlYCQ5b0wCqnxQ+DEFA4bVPjAW
 Psbw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwbYihiD0Kkybyo28r9Rc8p4qnhA/6PSJLne6O5tRkNZ0cfso2yJXJqwWb+vj84FIQydQcjP4d8Bg==@nongnu.org
X-Gm-Message-State: AFuF++nueqNHtGe1lUzwRiMwMjHRDkQkIqgdCdXStfJZm+7qJGfbCg2m
 EBUC3YtnpljMhVDZLOyfPlbVnkkejPkjfqLPEpIG7iC/buhU69x2axcDXWFVbobhpvl+rJPZvyh
 xkEpK2YID+MnaPn6fFDn56A3G4FSREJqY4BWbhmcoDg==
X-Gm-Gg: AYBFou085eIFy3SQe0pzXTaQylj6dbKCP5aTcFpsVNon5jfOYryEHw4CeUsZoO54jpa
 LcBrBzMbnHbRgvTFzhwWfhqmlqCYf8bmKILQHaKw1t0Dmxy7a1DPJq+ULYmdjJ1Yf2BpgmqQKC3
 338yHITh03/bc9Dx3g4RuIRvu6I10yLT7mfKSkjy7xlBaiHtBy9YbSgJThn1FCziLchy2mOqCIK
 ut1FU++rA/Q8u7Du3aKM7E7IVKu1BiJ03fmcgWfdip7a2Npk7HbS6z8DRk+GHZGnZWYyJ8TuiJZ
 6fCFZcfEW8mXcvIEEPoVjekk6orPswUjdUi4UGhkPrng7dmOkX5Xgx7DUmNaiBPpoSSUzKhWuDg
 I4CiqMn5FWXKV0GbHOvT38ftDBhRy
X-Received: by 2002:a05:690c:6b88:b0:845:ddf4:a3a7 with SMTP id
 00721157ae682-87126aa77dcmr30400587b3.16.1788518854163; Fri, 04 Sep 2026
 03:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260903112532.3276678-1-bin.meng@processmission.com>
 <20260903112532.3276678-3-bin.meng@processmission.com>
 <0795176d-4580-4acc-a3cf-c40f8d221661@oss.qualcomm.com>
 <CAEUhbmW4h_-az5iBsztzy8Yuu06+WMjOYcrL51sW8VEgyAaSMw@mail.gmail.com>
 <881be57e-5496-41f2-af0b-e21087fa5e54@oss.qualcomm.com>
 <apqcmqpJEEyc7wGx@redhat.com>
 <CAFEAcA-s+zsChqxYa258GOXdjniusdYeOCzGd6OiHWBQZV1Syg@mail.gmail.com>
 <apqfJ58nhZZIH8Su@redhat.com>
In-Reply-To: <apqfJ58nhZZIH8Su@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Sep 2026 11:47:22 +0100
X-Gm-Features: AcwNN1Wy0DVVsjg8Vvrfm11j45usxJZiDKD5N7-gxtDFkJ7u2HJJl1u3kHaqL2Q
Message-ID: <CAFEAcA_ZqLjPxo2GjW9vgvyVHw5iABphE91Dk7u+OAj3Ls3TMg@mail.gmail.com>
Subject: Re: [PATCH 02/33] hw/arm: Add basic Phytium Pi machine
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Bin Meng <bin.meng@processmission.com>, 
 QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, 
 Yonggang Luo <luoyonggang@gmail.com>, Anton Johansson <anjo@rev.ng>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Fri, 4 Sept 2026 at 11:36, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Fri, Sep 04, 2026 at 11:28:35AM +0100, Peter Maydell wrote:
> > On Fri, 4 Sept 2026 at 11:25, Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
> > > We need to use QAPI MachineInfo / MachineClass to report to mgmt apps
> > > whether a machine is capable of using hardware acceleration or not in
> > > response to "query-machines".
> > >
> > > Currently if a target supports HW accel, then apps assume that all
> > > machines in that target can use acceleration. This was a convenient
> > > short cut assumption, but this new machine suggests we can no make
> > > do with that assumption, and need to explicitly report it per-machine=
.
> >
> > That assumption has never been true for Arm; this new machine
> > type is no different to any of our existing boards in that regard.
> > Support for KVM etc is only present for the 'virt' machine type and
> > one or two others. Most of the rest don't work with KVM because they
> > create a specific CPU type (not 'host' or 'max') and that won't work
> > with KVM, or (as with sbsa-ref) because they want EL3 support and
> > KVM doesn't provide that.
>
> Oh, then the problem is already way worse than I realized which
> really makes we think we should consider exposing whether
> machines can use HW acceleration or not.

It also depends on the options to the machine, so for instance
this should always work with any of the hw accelerators:
 qemu-system-aarch64 -M virt -cpu host
but this wants nested virt, so only works with a hw accel
that supports that and a host kernel that has the KVM side support:
 qemu-system-aarch64 -M virt,virtualization=3Don -cpu host
and this wants EL3, which won't work in any hw accelerator
 qemu-system-aarch64 -M virt,secure=3Don -cpu host

Similarly the interrupt controller choice matters, so this:
 qemu-system-aarch64 -M virt,gic-version=3D2 -cpu host
may or may not work depending on whether the host CPU has the
GICv2 back-compat support; and this:
 qemu-system-aarch64 -M virt,gic-version=3Dx-5 -cpu host
is currently TCG-only. (But also it's experimental so you kind
of know you're off-piste here ;-))

If you try the things that won't work with -enable-kvm then they
should wind up causing QEMU to exit with a hopefully more or less
informative error message, but I don't think we have any mechanism
for introspection of the form "if I try this particular set of
QEMU options is it going to work?" short of actually trying.

-- PMM

