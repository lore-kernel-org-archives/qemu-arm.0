Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90919D61011
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 12:23:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlR3T-0006Yr-PW; Thu, 29 Jan 2026 07:23:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vlR3E-0006U0-RA
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 07:23:10 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vlR3C-0002rZ-0Z
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 07:23:08 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4806dffc64cso6980185e9.1
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 04:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769689384; x=1770294184; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OflDjJbC9BCFelMOrZAF0NArorAVkNUhCOBK+TfLL4c=;
 b=wkw71OvfAi8AM7SFoZJt/dlE1kxQo8dJw/zf3HweOoYOZIVPp0ZpMFnBSxOykN94QY
 xhjgaQlmyC/SEg0Xx5n5th/l8uV94kGIVp2p7JofrA7dLr6XLOexiF6kXSt/W1p/Lacs
 N+wxRtXiTzUQiJvDKvgDg3a439WSl2cs8g/6hsP2XFDduN6YzffpdDJ0KubfhNuavxb2
 C8fTFB59qr6Pygdi7yxsAMZQT+avOVMFBvTWreoVGFr10lmtblf8dkCkb47O4ZiDvUsy
 V1ZytRrWlne+6NKJ56ieyOwxKbbmkbHFohdRyHY9QNp6siEuCwzm7Qqwg1Y641EG1MrY
 7DTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769689384; x=1770294184;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OflDjJbC9BCFelMOrZAF0NArorAVkNUhCOBK+TfLL4c=;
 b=kfNTcxEVmeWsFBzby+YFa96kRXYi4DhZymiZTYLHxrny8VLQ3KHO5w0BtLc3iPwSGX
 EdTe/A9TkPS6TPtrLMd4cl7GaAiVhOUYpBqD/d/NEc3r+lA+NpPdzmrVnirfs9bFpL7z
 gH37EJlWyXhZqIHJsRmnCVWDyUFDCSk/OVwMJ/FmcW1RmtzmIBRDBh5HkzDUUrBefJAs
 d554GTgxdrCVdm3kBHCempiuIYNSdNVpRgk7EHRyGorUR/kcFIKcQ08BNb8c7gQSxR1i
 fIsJ/et7K4m6fR8JQvzDGg8+op2B6Or+6RO3y2UJmc2B3qaZPa2Qd2QIL7E93RFHqI2r
 ag0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZL45OR5rXL0pnKR1GAWK1jKDNkoNJfb9Ube9MEuGrHEtHYjqLXBTiPUy2ee14VPK8ga4NLcKXxQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz1ESd1Bm4p1i6r9tcKqOrpZ57IU92A7M3b+Xpd8TIybylfnXDx
 RmiTRUH3ifAz8t7LVsgqllhRUDdDApdtTE1sn9oMjsc82ibH25eARPMsZf+twLfJy2Y=
X-Gm-Gg: AZuq6aLZHSFKORvI4BepTYujnXVufkxCf/8T5Vvkw/Q1qllCdqLLmj2Nt1U5h4Nz1Xa
 0AIHB+vp8t+iZ8oIEZg5Rt6o6scQEzuU9RBJzFsMVgiuaVaTbh4ylYVtFimsW0ESXSxXnZCtcL3
 Y7KjgQb4qxbjs7YryeAKgGI9FtoueFPDzWweKAb30debl/AnxCCq77+/ZuiZwI+tAFCtsrxV3q9
 ofdhEXBKva6uExlRXXz3R2VJv6EmOoT/G+ACMzI+Z3C59TXe5URVtGlR2f25lMjDh9JEBUyg+RD
 KLtBaWSohKXhdqaVOWp7PZXDnNSLvryA/J7JBQHIKqdVGfNcdunXkjeeSejMigxwPZp4QrdGV2E
 JSvHLL8GC5BWs9uuHO3HD6RalVCjW1s+pV2cs+4uhm16zKIxSZAOfq1JBzVNZjmj+rxfxQlAPqO
 Yo6QdQW7IEyW6y+2D1iJrTFA==
X-Received: by 2002:a05:600c:c0dc:b0:480:4ae2:def1 with SMTP id
 5b1f17b1804b1-4806c00c0e0mr91187315e9.13.1769689384081; 
 Thu, 29 Jan 2026 04:23:04 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-481a5dc9367sm2666675e9.12.2026.01.29.04.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 04:23:03 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 74E4A5F809;
 Thu, 29 Jan 2026 12:23:02 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Ruslan Ruslichenko <ruslichenko.r@gmail.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  qemu-devel@nongnu.org,  qemu-arm@nongnu.org,
 artem_mygaiev@epam.com,  volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,  "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>,  Ruslan_Ruslichenko@epam.com
Subject: Re: [PATCH 00/27] hw/arm: Add generic FDT-based machine and
 infrastructure
In-Reply-To: <c2224358-ed7e-1bb9-5eaa-7ae1bafdb37a@eik.bme.hu> (BALATON
 Zoltan's message of "Wed, 28 Jan 2026 22:41:30 +0100 (CET)")
References: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
 <CAFEAcA9NEjaUBX19sdw9TRCKcKn8CQfvoVNZ+VaXOcNZ8kf24g@mail.gmail.com>
 <CAN-aV1EjYwSRfV87YQdtfqU5CH8Bsssr3EvStPWL2_VFOs4N4w@mail.gmail.com>
 <87ecn9aas7.fsf@draig.linaro.org>
 <c2224358-ed7e-1bb9-5eaa-7ae1bafdb37a@eik.bme.hu>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Thu, 29 Jan 2026 12:23:02 +0000
Message-ID: <87zf5w8v6h.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Wed, 28 Jan 2026, Alex Benn=C3=A9e wrote:
>> Ruslan Ruslichenko <ruslichenko.r@gmail.com> writes:
>>> On Tue, Jan 27, 2026 at 11:03=E2=80=AFAM Peter Maydell <peter.maydell@l=
inaro.org> wrote:
>>>> On Mon, 26 Jan 2026 at 17:43, Ruslan Ruslichenko
>>>> <ruslichenko.r@gmail.com> wrote:
>>>>>
>>>>> From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
>>>>>
>>>>> This patch series introduces new ARM machine model, arm-generic-fdt, =
and the underlying infrastructure required to instantiate a QEMU machine fr=
om a Device Tree.
>>>>
>>>> I'm afraid this has been a feature that has been suggested from
>>>> time to time, but which I don't think is workable in general.
>>>>
>>>> Device tree files are designed to provide enough information to
>>>> the guest kernel to allow it to find non-probeable hardware. They
>>>> are not designed to provide enough information to QEMU to allow
>>>> it to create and wire up all the hardware present on the system.
>>>>
>>>> There are specific niches where it can be made to work -- I think
>>>> Xilinx have or had a setup where they were generating an FPGA
>>>> model and a device tree and a guest kernel all from the same
>>>> single data source, so they could put everything necessary into
>>>> the dtb, for example -- but I don't think it works in the
>>>> general case. As one simple example, the DTB doesn't generally
>>>> have any information about how the Secure world works in an Arm
>>>> system, because Linux doesn't care about the Secure world. It
>>>> also doesn't usually have information that the guest OS can
>>>> probe for itself at runtime.
>>>>
>>>> There has been periodic discussion of more flexible user-driven
>>>> board creation, but that has generally been with the idea of using
>>>> the QMP monitor to orchestrate creation and connection of device
>>>> models.
>>>>
>>> I agree that a guest Device Tree is insufficient for describing a
>>> complete QEMU machine model.
>>> However, we separate the guest configuration from the machine
>>> definition. The -hw-dtb option allows the user to provide a
>>> QEMU-specific system description.
>>> Those hw-dtb would not be passed to Linux Guest VM.
>>>
>>> The fact that this workflow has been successfully used in production
>>> by AMD/Xilinx demonstrates that FDT is a feasible format.
>>
>> Where are the extensions to the FDT used for hw-dtb documented? How does
>> it deal with PCI devices and the Secure world?
>
> PCI devices don't need to be included in a machine description as they
> are not part of the machine only the PCI host is. PCI devices are
> plugged into the host with -device as with boards defined in C.

But if we are talking about a general purpose HW description DSL then we
do need to describe systems with embedded PCI busses and soldered on PCI
devices.

> For
> PCI devices that are instantiated by default on some machines
> including a node below the PCI host should likely work. I know nothing
> about secure world, that may need some extensions but fdt is basically
> describing objects and their properties so if it's one or a hierarchy
> of QOM objects that needs to be instantiated with defined properties
> it should be possible to describe it in fdt.

OK - hence I was asking for the documentation for how this is done. You
can't just assert that anything can be described in DTB because its
original use case is purely for OS descriptions. If we want to explore
this series further then I would suggest including some hw-dtb's in the
series to replicate some of our more embedded machines in the next
revision.

>>> In contrast, QMP usage may end up even more complex and less
>>> maintainable for the task of full system modeling.
>>> To my understanding, this would need to generate too long configs,
>>> which may eventually require some intermediate format by itself.
>>>
>>> I am proposing to use FDT as a serialization format to describe a
>>> machine configuration. Theoretically we can use other formats, like
>>> XML, but in my opinion FDT perfectly matches the requirements.
>>
>> The QMP interface is self-documenting and introspectable and used for
>> the management of QEMU including things like hotplug. It is also QOM
>> aware so a natural fit for dealing with the underlying QOM machinery.
>
> QOM seems to be more about operating a machine rather than defining it
> for which fdt is an already established common way.
>
>> Previous discussions have entertained the idea of making the parsing of
>> hw-dtb an external script which would then translate into QMP commands
>> to build up the machine.
>
> That would be possible but it seems that directly parsing fdt in QEMU
> could be done with very few code and with some additional support from
> devices the latter of which is probably also needed when trying to
> interactively define a machine from command line, monitor or QMP.

I agree QMP would need some new APIs to support this - and also have
some examples of how to replicate the existing machines over a pure QMP
interface.

>
> Regards,
> BALATON Zoltan

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

