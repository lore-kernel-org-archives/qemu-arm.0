Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C09FE81BD3
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Feb 2026 14:59:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpSjb-0005T5-W8; Mon, 09 Feb 2026 09:59:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vpSja-0005Ri-1U
 for qemu-arm@nongnu.org; Mon, 09 Feb 2026 09:59:30 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vpSjY-00080X-1W
 for qemu-arm@nongnu.org; Mon, 09 Feb 2026 09:59:29 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b8871718b00so484669566b.3
 for <qemu-arm@nongnu.org>; Mon, 09 Feb 2026 06:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770649166; x=1771253966; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3AcAorsrXsp+S3nB5onb9YV5cu7Z6kn3YGrGK1EJFqo=;
 b=TOkdaXNEXH4giH5PyHdrBqr0rp/QGhJGsSxlabj1BTdr3cm604f8TlAI5Kkzp2qvkk
 NXmwTo+hAwE0pE3L4X2bW/U/ymqEAR7zYAegI1f7EKxgzFcZnVe6EeNMAHynwX4JBXJr
 64sijlPPEFwG198l42USZtDl5RdJ3vwBRHaN6RTa0qu6DCLd8XVW0rFb6tCPWQWyZcHt
 Xl4+cv9yos9WseKxwQZnm82+Ba9YHycl9xsHMes+rowKgJgg390Us6XjH4wBbKKNQsKH
 3XIoK2KhslFT4/Fsk2qdM+4qaFHfovhuy0z0zHiTO8YTVGrVfdqCKREEM5hVLkgPH2dV
 27tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770649166; x=1771253966;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3AcAorsrXsp+S3nB5onb9YV5cu7Z6kn3YGrGK1EJFqo=;
 b=BM1L3Atxm9P0WIhBsZw7ehrC6/oIYYgDVZiPbXKao9n2z2KFtx9US89nuCPqertDj/
 KPyYUAGCDJUoSW1OMRzvW4nq30SFEaqg3HX5czjBDvKdkTnhRXPs0axQJKtRM2eEUhON
 nrqAyaX28+ch4yAWbSU+y8PDJQdpuxN9ptaMFMN4EKrZ07y/Qf7QPvYIUdI6OH7Sz9Ei
 eawgLSnko9m6NAhsfAdDmVwoknGrvk+Z746g8AUPiO50284LNkfpgxLzF+MvPo/8GM3i
 5jppwm/uEF+W2v7cC5lfWxYam/vHQLJIysUhRcTl90JMLVN4ITuvcXCBpUxworbLDjTU
 he7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHI4bCQVTnLK3/cXlgsl57XqbAHjfgBgx9KK6jxgnMNMTnyCQTrmCRgoLfSJ9y16GUTQfX8RS0dg==@nongnu.org
X-Gm-Message-State: AOJu0YzD/ohxh+eoInnOSiTWPrkzq/H36OYFCq0WLuUroFU9uBSWmFHE
 U+D94pPYhFhR+I18TDdD/cGjwndcSTVv9JM2hHgRY+CsTP58iN60sA8A+jes2iH03dQ=
X-Gm-Gg: AZuq6aJR9+/EcIl6/GFLbj94AwHdKWewPgO0d0zYNma73du7Fq3zBobAEwMPWu3V7EG
 yc6xfA2i4FKdRhyYPArWNgpbC1HJy2Oah4OE4FDSoNIwrqm5XXLCxMZB7pDaI2gqcpADmzEJ2co
 zSMYtrnZlLXrS7AealXJjSjuyDTNdQXoOWGqrLSIBJQwPTge4GvMcVaCU4eEw5dl145XODAZzRa
 mueOBDOPqo/28Klq4FRP4GoCPTyIsGBTGOKPyuC8YAbY93jJnNWNY66BLC2UOY4zrxamX84mRWS
 dwZtTYGfrdUIbiTgVWvrBMxTkX6bg+7m0sOC+F7VCjbSEOwH02BmE7xbwZFuOz+OVaP7lDHSk/C
 8GXjL7uTL9sWyD8Qhglrjl+dgBL9wZ/ii4U3CrR4NkawwDApZe1ZSDXTZ6L76EM7edlsdSGBahC
 nx2dmnGozhT1w=
X-Received: by 2002:a17:906:7315:b0:b8e:4790:d7cf with SMTP id
 a640c23a62f3a-b8edf344040mr659045066b.53.1770649165573; 
 Mon, 09 Feb 2026 06:59:25 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8eda7e2ca1sm397975866b.29.2026.02.09.06.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 06:59:24 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 16DF65F80A;
 Mon, 09 Feb 2026 14:59:24 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Eric Auger <eric.auger@redhat.com>,  eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  cohuck@redhat.com,
 maz@kernel.org,  oliver.upton@linux.dev,  sebott@redhat.com,
 gshan@redhat.com,  ddutile@redhat.com,  peterx@redhat.com,
 philmd@linaro.org,  pbonzini@redhat.com
Subject: Re: [PATCH v6 00/11] Mitigation of "failed to load
 cpu:cpreg_vmstate_array_len" migration failures
In-Reply-To: <CAFEAcA-gi42JObOjLuPudABX8WRdWf5SzSbkzU-bd06ecF1Vog@mail.gmail.com>
 (Peter Maydell's message of "Fri, 6 Feb 2026 14:15:12 +0000")
References: <20260126165445.3033335-1-eric.auger@redhat.com>
 <CAFEAcA-gi42JObOjLuPudABX8WRdWf5SzSbkzU-bd06ecF1Vog@mail.gmail.com>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Mon, 09 Feb 2026 14:59:24 +0000
Message-ID: <87h5rqyncj.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 26 Jan 2026 at 16:54, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> When migrating ARM guests accross same machines with different host
>> kernels we are likely to encounter failures such as:
>>
>> "failed to load cpu:cpreg_vmstate_array_len"
>>
>> This is due to the fact KVM exposes a different number of registers
>> to qemu on source and destination. When trying to migrate a bigger
>> register set to a smaller one, qemu cannot save the CPU state.
>>
>> For example, recently we faced such kind of situations with:
>> - unconditionnal exposure of KVM_REG_ARM_VENDOR_HYP_BMAP_2 FW pseudo
>>   register from v6.16 onwards. Causes backward migration failure.
>> - removal of unconditionnal exposure of TCR2_EL1, PIRE0_EL1, PIR_EL1
>>   from v6.13 onwards. Causes forward migration failure.
>
> Hi; sorry I haven't given this series any attention before.
>
> (1) Yes, this is definitely a problem we need to solve.
>
> (2) What are the requirements we have for this?
>
> This series sets up CPU properties controlling this, and then
> sets them in the virt machine model based on the machine
> type, but this seems awkward for two reasons:
>
>  * using properties confines us to using a "text string"
>    way of describing the behaviour; if we could implement
>    the handling in code and C data structures in target/arm
>    we could potentially do it in a more flexible and
>    readable way (e.g. being able to specify the register
>    via something other than a raw hex value)
>  * different host kernel versions isn't really related to
>    the QEMU version, so tying it to a versioned machine
>    type doesn't seem to fit
>
> Q: Do we need the user to be able to control this (e.g. adding
> extra registers to be ignored) on their command line, or
> can we say "you need a newer QEMU that understands how to
> deal with this register if you want to do migrations involving
> this newer kernel version" ?
>
> Q: This series adds a "hide this register" option which
> stops the register appearing in the outbound migration data.
> Do we need that, or would it be enough to have "ignore this
> register in the inbound migration data" ? Assuming we're
> not trying to migrate backwards to an older QEMU version
> that's unaware of the new register, that seems to me like
> it should be equivalent.

As I understand it these signal to the guest what services the
hypervisor supplies. I assume the guest kernel only reads these once at
boot up rather than before invoking any particular service?

If this is the case then things would break if a new host couldn't
support the guest's request of the hypervisor service.

>
> (3) Categories of sysreg that are causing problems:
>
> a: "controls" -- like the PSCI_VERSION pseudoreg. Here the setting
> controls what the kernel is exposing to the guest, and so we need
> to be able to have the user tell QEMU to use a specific version
> that's not the host kernel default if the default isn't one
> that's valid for all older kernels. Sometimes the new kernel
> default is the same as the old kernel's behaviour and in those
> cases we also want handling of "if you see the control reg in
> the incoming data and its value is the default then it's OK to
> ignore it".
>
> b: "things exposed that should not have been" -- where the old kernel
> exposed a register but the new one does not because exposing the
> register was wrong (i.e. a bug). The handling here can be
> "ignore this in migration input if present". Examples are the
> TCG2_EL1, PIRE0_EL1, PIR_EL1 regs that shouldn't exist if the
> corresponding feature was disabled for the guest.
>
> c: "things not exposed that should have been" -- where a new kernel
> exposes a new register that the old one does not, and so migration
> from a host with the new kernel to the old one fails. In most cases
> it should be possible to handle this with "ignore in migration input
> if present", or "fail migration if incoming value is not some safe
> default, but if it is that default value then ignore".

Shame we don't know if the guest ever read the register. If the old host
provides features the new host doesn't but it never probed anyway then
neither the guest or new host needs to care about the register.

>
> Have I missed anything ?
>
> (4) Mechanisms for handling them:
>
> This series provides two mechanisms:
>
> "safe missing reg" -- these registers are ignored if they appear
> in the incoming migration data.
>
> "hidden" -- the behaviour here is that we effectively entirely
> ignore the register, so we do not read it from the kernel or write
> it back, do not send it in outbound migration data, and do
> not expect to see it in incoming migration data.
>
> The "arm: add kvm-psci-version vcpu property" series handles one
> specific "control" register, with a specific user-facing cpu property.
> If new "control" type registers are rare, this seems like a good
> way to go, because it means we can give the user an interface that
> is reasonably clear about what it does, and we can provide better
> errors on the migration-destination side (e.g. pointing the user
> at the need to specify the property on the source side to get a
> VM they can migrate to this destination).
>
> The only use of "hidden" so far is for KVM_REG_ARM_VENDOR_HYP_BMAP_2.
> However, I'm not sure this is the right way to handle this register.
> Judging from the documentation, this seems to be a "control" register:
> it would let QEMU enable certain things to be visible to the guest.
> It also is odd to treat this differently from the existing
> KVM_REG_ARM_VENDOR_HYP_BMAP register, which has exactly the same
> semantics.
>
> I think that the right way to treat this register would be
> "if this is present in the incoming migration system and the
> host kernel doesn't know about it, a value of zero is OK, but
> any other value should fail migration".
>
> In general I'm not convinced that "hidden" is a useful thing
> to provide -- it should always be fine for QEMU to read and
> write back to the same host kernel some sysreg it doesn't
> know about, so what "hidden" is mostly doing is "don't put
> this into outgoing migration data". Do we need to be able
> to do that, or can we instead always use a "ignore in
> incoming migration data" strategy?
>
> (5) My preferences
>
> I think that assuming that it meets the requirements, I would
> prefer something like a mechanism where we use some kind of
> C data structure / code in target/arm/machine.c to represent
> "this register needs some special handling", where the special
> handling might be:
>  - ignore if present in input
>  - if present in input, value must be X, otherwise fail
>    migration
>  - maybe some other things if we need them
>
> and this is not tied to specific QEMU machine versions and
> isn't something we expose via QOM properties.
>
> I'd rather avoid the "hidden" register idea unless we
> definitely need it in addition to "ignore in incoming data".
>
> thanks
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

