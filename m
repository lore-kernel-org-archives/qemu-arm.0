Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF564D46BE5
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Jan 2026 17:48:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vl9ed-0001C8-M7; Wed, 28 Jan 2026 12:48:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vl9eY-00019m-MV
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 12:48:31 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vl9eX-0001iQ-19
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 12:48:30 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-4359a302794so106933f8f.1
 for <qemu-arm@nongnu.org>; Wed, 28 Jan 2026 09:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769622507; x=1770227307; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bj5ufOGr/9lEHh2xwuGdrDse0fcL/BvnanZmIrsO+rg=;
 b=Dy0km1IDq0O81ntQ3cLsE3wN648ht+iySK6Qj6sH6sXASYIlP277SxKAlbNfW0bDC2
 TU7e1PcTgyVPS4Br2DOUkJVA67SOd0tZ73IEs//IuwEhGGnvaSRZw04pA6XrusxFqYJK
 i4JuiJmkUr9LWV3pJYK3vJT+LDtANqKQq1tunPwDc90Jsd/mLGbtc2pD42wzKMAWhXuj
 FUSA+rxx4s6bhR/6lkCQYrfNvC8PFwTUnyqFbVDt5R4Rvxt+3/FZOXhH3DLapmW2Uzuh
 Epan2PweyZPgynCfv9/KkwkwYC6qzNwQOxBj/2xFyaurv4yAPZJqlubGP4tKh5XWXYcX
 dkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769622507; x=1770227307;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bj5ufOGr/9lEHh2xwuGdrDse0fcL/BvnanZmIrsO+rg=;
 b=JEWlWtAUPlrmIW/eWbVtZ2TT5FxHFwo8EMNv6Ol7hamlAyfXOE2HC33HUqkpWvOIcO
 AKVShXm8g0x9b6hCVfqogeBP+it2tngjo08SpYJesGHR+NsUNQDYetr9Gtxe4Qryebs1
 a7EwgqauUUbkOE8UXmqNpvcBjcqq+rCuVhwLHke5+CGWJDhaQXdyznzMVbvgxVd+X21y
 1UDNe3JY/p5K8HCXkm+Gtm6pKDr4UVvCxK0kUwhnYCUv2XHvh1kThAUZ+uPqSfPOw1dv
 wrTa56l8aJ9cEIfv27Z/cKQiygzR+ng/BIkGbA3udUxtjD9y2Tnl5hyIrzHeQ9XyRthA
 PCfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpta+/Tf0/o92lWyjWzWFMeLDi9IAJH/3tdFO/VUMngc+aDl9WJNlKq2Pip4pGR6CeETnOKIy16A==@nongnu.org
X-Gm-Message-State: AOJu0YxEdLLaiMLvjPyXiLZdVkHPltJoD9HRHr/xuBuhAbk8FxaRlrXm
 Cy5gWSj0Hw2HoV51kzdPyoBo5rIVmTFRM8Xk/owS3EAiAjqV/uQVcYfUInLeTvp6+uLMPhbNVAz
 e6IvUmB4=
X-Gm-Gg: AZuq6aLoH3TvS0JuhC4DHieJ417VpvKzu0/d6UwHoaJYp4yscRFzefmtFUO3tXu/kpj
 Uhmp0gnX1LXoU3PlPc7RJoSfG+YsBcghUIh/GfaKtVeLtwoVrBeKPaSWKVgQrghfpJQuOQhJ2ym
 6MjLNLe4T4kBviWyvpk4psmHgfOyElIVG+mraG+zCGh33g4OB9JY4H7DxYhrWc3uTV6u/r19liP
 qfEGyGF6p7RGIlFCNbmRdrSFoH+Gl1/8Y2hgWtPcjmit5IwHBDXNFDy9yGRbAj6a7kvIc6V8pni
 6Z+0Gk6J2a6rByhgNlI+wv2I310xj9d039goqSPvfptDdYu3480oNtK9rzR3rrv3mcLh5h5za+4
 VI5YM/JegtYTbGkKKJoV7uho0HYsYMwKKz7iYaUg/9g8dUeuejsShirnErNkeQUzgGGsBYIO3NK
 dgRskm1U3qWcJtNl9ipdGJww==
X-Received: by 2002:a05:6000:2081:b0:432:dfa8:e1b6 with SMTP id
 ffacd0b85a97d-435dd0b6a75mr9548688f8f.39.1769622506629; 
 Wed, 28 Jan 2026 09:48:26 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131cfd4sm8218361f8f.25.2026.01.28.09.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 09:48:25 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E3D155F895;
 Wed, 28 Jan 2026 17:48:24 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  qemu-devel@nongnu.org,
 qemu-arm@nongnu.org,  artem_mygaiev@epam.com,
 volodymyr_babchuk@epam.com,  takahiro.nakata.wr@renesas.com,  "Edgar E .
 Iglesias" <edgar.iglesias@gmail.com>,  Ruslan_Ruslichenko@epam.com
Subject: Re: [PATCH 00/27] hw/arm: Add generic FDT-based machine and
 infrastructure
In-Reply-To: <CAN-aV1EjYwSRfV87YQdtfqU5CH8Bsssr3EvStPWL2_VFOs4N4w@mail.gmail.com>
 (Ruslan Ruslichenko's message of "Tue, 27 Jan 2026 19:18:10 +0100")
References: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
 <CAFEAcA9NEjaUBX19sdw9TRCKcKn8CQfvoVNZ+VaXOcNZ8kf24g@mail.gmail.com>
 <CAN-aV1EjYwSRfV87YQdtfqU5CH8Bsssr3EvStPWL2_VFOs4N4w@mail.gmail.com>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Wed, 28 Jan 2026 17:48:24 +0000
Message-ID: <87ecn9aas7.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

Ruslan Ruslichenko <ruslichenko.r@gmail.com> writes:

> On Tue, Jan 27, 2026 at 11:03=E2=80=AFAM Peter Maydell <peter.maydell@lin=
aro.org> wrote:
>>
>> On Mon, 26 Jan 2026 at 17:43, Ruslan Ruslichenko
>> <ruslichenko.r@gmail.com> wrote:
>> >
>> > From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
>> >
>> > This patch series introduces new ARM machine model, arm-generic-fdt, a=
nd the underlying infrastructure required to instantiate a QEMU machine fro=
m a Device Tree.
>>
>> I'm afraid this has been a feature that has been suggested from
>> time to time, but which I don't think is workable in general.
>>
>> Device tree files are designed to provide enough information to
>> the guest kernel to allow it to find non-probeable hardware. They
>> are not designed to provide enough information to QEMU to allow
>> it to create and wire up all the hardware present on the system.
>>
>> There are specific niches where it can be made to work -- I think
>> Xilinx have or had a setup where they were generating an FPGA
>> model and a device tree and a guest kernel all from the same
>> single data source, so they could put everything necessary into
>> the dtb, for example -- but I don't think it works in the
>> general case. As one simple example, the DTB doesn't generally
>> have any information about how the Secure world works in an Arm
>> system, because Linux doesn't care about the Secure world. It
>> also doesn't usually have information that the guest OS can
>> probe for itself at runtime.
>>
>> There has been periodic discussion of more flexible user-driven
>> board creation, but that has generally been with the idea of using
>> the QMP monitor to orchestrate creation and connection of device
>> models.
>>
> I agree that a guest Device Tree is insufficient for describing a
> complete QEMU machine model.
> However, we separate the guest configuration from the machine
> definition. The -hw-dtb option allows the user to provide a
> QEMU-specific system description.
> Those hw-dtb would not be passed to Linux Guest VM.
>
> The fact that this workflow has been successfully used in production
> by AMD/Xilinx demonstrates that FDT is a feasible format.

Where are the extensions to the FDT used for hw-dtb documented? How does
it deal with PCI devices and the Secure world?

> In contrast, QMP usage may end up even more complex and less
> maintainable for the task of full system modeling.
> To my understanding, this would need to generate too long configs,
> which may eventually require some intermediate format by itself.
>
> I am proposing to use FDT as a serialization format to describe a
> machine configuration. Theoretically we can use other formats, like
> XML, but in my opinion FDT perfectly matches the requirements.

The QMP interface is self-documenting and introspectable and used for
the management of QEMU including things like hotplug. It is also QOM
aware so a natural fit for dealing with the underlying QOM machinery.

Previous discussions have entertained the idea of making the parsing of
hw-dtb an external script which would then translate into QMP commands
to build up the machine.

>
> BR,
> Ruslan Ruslichenko
>
>
>> thanks
>> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

