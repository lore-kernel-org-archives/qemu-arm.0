Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DABCCF9EC
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 14:26:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDO9w-00071R-Qn; Mon, 27 Oct 2025 10:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDO9r-0006yf-4Y
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 10:25:17 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDO9n-0005pH-Dy
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 10:25:14 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b403bb7843eso1037575766b.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 07:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761575105; x=1762179905; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nojDqCwiKtTLuZ6X7hw4qtskXxzMlRc2e8FUZ4KQJIY=;
 b=cguU4F93R+ujkUKg+uj3EvZ/Id1kNdwh1gRxuoxVaKnVr/H2jVMPpdZu6wGVfNXb/0
 YOH4PQR4W/Psz9NHG7x7QdWstiKeGc9lwpglehHzIkmZXL24D7ikrNFh76gIUteJ8kyi
 oaXT9q6WuqT7R0eVkb2N4zmI12ZBBimT40HYxLjYhPLA2WWpjLSL0QOJOckxYmAj1S9Z
 xJxKz0MMEt3zu424/qnFZotxA+g6XLMCQX2HeoCSeet9ICYlIK5DG8A/AfrzXE+vo/A/
 eTGG3vzdPm29vSPvTqSD2mOh3j9RqTbrh/rm/1xhUEWVNPQD1R5ACvZbJC00eiHy3LXS
 HL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761575105; x=1762179905;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nojDqCwiKtTLuZ6X7hw4qtskXxzMlRc2e8FUZ4KQJIY=;
 b=d1Ezg1gkmYxZrnCu9u0F75PnPR5K5R30gD8XDjNtezwyHDPry043o8YQpmQTcOYohw
 O+ZT+xSnBQJUg9Ff9EHMbwaciNnqozRdTjoVr1GR/e3gfbr4HXx9RAr62+bYAxvyl1fU
 5tfVEmffhuaxExIfaOzZT9BOs01IPutH+lG52wmn9Mrvm3y5Ptzxe18by9I2k0Wuw+rh
 q4pGVh5bDxMveJr6wa9idKRFI8bxcNk5mbtKpCCfJWzZrQ6lBvj8iJnaMFa+inUvVwat
 cqf5fRv6sDk5jAYw0sSvYYdGPIQ85Bp2bBTPXO0ucd8sJHbRG0YEGRMgU1/e59eddqgM
 HLAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjzLIISU2gu5MMpUUG47VTjjzUOgMpxlnFy/D/ifSE59iyhZHe7hPVpCzWoOqK7969TJfaCksv4w==@nongnu.org
X-Gm-Message-State: AOJu0YzMPdiKQzZATlGrnsNPcQptCLHbemFEHSKUXyqZvij8XwTDtLvT
 1FHQaeiER5Hh9aE9Z/xQCRgsWcTTa6dnxiTAuY38PoMoAZWfyDBNO/fiRsdlIGUcea4=
X-Gm-Gg: ASbGncswGJXez+nWC3rFg9jb2FCNFr3gTdAlAyWY7nttycf/fi9D63VomOIonvAkNk7
 zJfUTXGVhVrisHvszawedd03WJwYSPC1xBA61TrR4JeC/rixqj1uGwMQB7FO9ZbWyBLyedh2uoR
 x+5whJCgwQ8NeFBaduHs7hfwnMi5IJ3C0mL4iPqNCfscVPxeB7y/ncoTROlsvIF6LHh4Xz+qh7r
 QR96p3NkOo1HvHTLnrONX8NgLAA0c5HT6SnW4htmZNMHPGx9iBcJlBdnT/tCwZFrlZcb94Q5ey3
 1uhLuWQ6tsopjoS0d2MO+rl/17FEMQTeCVYpGWeU7gufbEzIqJodcJyBozUJjQGtS8T1ZzK9NY5
 ajUG0Ji+0GAusHdPkGaKW2wVeButS1nw0575ND4jEtkvIN72wLWIn4s76/YX2g3RaVCzYD27t43
 EKGaO5sePbnbI=
X-Google-Smtp-Source: AGHT+IF7oM6pm8nrnIaCIIwZFHg5iU8dFFMIXcYwYXaMmMvDJstWunokzuEY8jy1DL37KLcWYOqAVw==
X-Received: by 2002:a17:907:60d4:b0:b6d:5bc1:4859 with SMTP id
 a640c23a62f3a-b6dba4b2085mr11871266b.29.1761575104754; 
 Mon, 27 Oct 2025 07:25:04 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8540807bsm769323366b.54.2025.10.27.07.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 07:25:03 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 973205F829;
 Mon, 27 Oct 2025 14:25:02 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  qemu-devel@nongnu.org,  qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,  Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Fabiano Rosas <farosas@suse.de>,  Laurent Vivier
 <lvivier@redhat.com>
Subject: Re: [RFC v2 0/2] hw/misc: Introduce a new SMMUv3 test framework
In-Reply-To: <efe21350-fe9d-4bc9-acc1-8f761a875506@phytium.com.cn> (Tao Tang's
 message of "Mon, 27 Oct 2025 21:32:06 +0800")
References: <20250930165340.42788-1-tangtao1634@phytium.com.cn>
 <87v7k6lyp4.fsf@draig.linaro.org>
 <efe21350-fe9d-4bc9-acc1-8f761a875506@phytium.com.cn>
User-Agent: mu4e 1.12.14-dev2; emacs 30.1
Date: Mon, 27 Oct 2025 14:25:02 +0000
Message-ID: <87jz0gxw01.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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

Tao Tang <tangtao1634@phytium.com.cn> writes:

> Hi Alex,
>
> On 2025/10/23 18:06, Alex Benn=C3=A9e wrote:
>> tangtao1634 <tangtao1634@phytium.com.cn> writes:
>>
>>> From: Tao Tang <tangtao1634@phytium.com.cn>
>>>
>>> This patch series (V2) introduces several cleanups and improvements
>>> to the smmu-testdev device. The main goals are to refactor shared
>>> code, enhance robustness, and significantly clarify the complex
>>> page table construction used for testing.
>>>
>>> Motivation
>>> ----------
>>>
>>> Currently, thoroughly testing the SMMUv3 emulation requires a significa=
nt
>>> software stack. We need to boot a full guest operating system (like Lin=
ux)
>>> with the appropriate drivers (e.g., IOMMUFD) and rely on firmware (e.g.,
>>> ACPI with IORT tables or Hafnium) to correctly configure the SMMU and
>>> orchestrate DMA from a peripheral device.
>>>
>>> This dependency on a complex software stack presents several challenges:
>>>
>>> * High Barrier to Entry: Writing targeted tests for specific SMMU
>>>      features (like fault handling, specific translation regimes, etc.)
>>>      becomes cumbersome.
>>>
>>> * Difficult to Debug: It's hard to distinguish whether a bug originates
>>>      from the SMMU emulation itself, the guest driver, the firmware
>>>      tables, or the guest kernel's configuration.
>>>
>>> * Slow Iteration: The need to boot a full guest OS slows down the
>>>      development and testing cycle.
>>>
>>> The primary goal of this work is to create a lightweight, self-contained
>>> testing environment that allows us to exercise the SMMU's core logic
>>> directly at the qtest level, removing the need for any guest-side
>>> software.
>> I agree, an excellent motivation.
>>
>>> Our Approach: A Dedicated Test Device
>>> -------------------------------------
>>>
>>> To achieve this, we introduce two main components:
>>>
>>> * A new, minimal hardware device: smmu-testdev.
>>> * A corresponding qtest that drives this device to generate SMMU-bound
>>>      traffic.
>>>
>>> A key question is, "Why introduce a new smmu-testdev instead of using an
>>> existing PCIe or platform device?"
>> I curious what the split between PCIe and platform devices that need an
>> SMMU are. I suspect there is a strong split between the virtualisation
>> case and the emulation case.
>
>
> Thanks again for the insightful questions and for sparking this
> valuable discussion.
>
>
> From my observation of real-world, commercially available SoCs, the
> SMMU is almost exclusively designed for and used with PCIe. Of course,
> you're right that architecturally, the SMMU specification certainly
> allows for non-PCIe clients. Peter's point about using the SMMU for
> the GIC ITS in a Realm context is an excellent example. I've also
> personally seen similar setups in the TF-A-Tests+FVP software stack,
> where platform device, named SMMUv3TestEngine, was used to test the
> SMMU.
>
> However, from the perspective of QEMU's current implementation, there
> are some significant limitations that guided the design of
> smmu-testdev. At the moment, the SMMU model does not really support
> non-PCIe devices. Two key issues are:
>
> - The IOMMU MemoryRegion, used with PCIe device, cannot be used with a
>   platform device, which is the primary mechanism for routing DMA
>   traffic through the IOMMU.
>
> - Internally, the SMMU code makes assumptions about its clients. For
>   instance, the smmu_get_sid() function explicitly expects a PCIe
>   device and has no path to acquire a StreamID for a platform device.
>
> Given this, the decision to model smmu-testdev as a minimal, PCI-like
> device is a pragmatic one. It aligns with the most common real-world
> use case while also working within the constraints of QEMU's current
> SMMU implementation.

OK that makes sense. One of the main use cases for a modelled SMMU in
QEMU is for developing and testing FEAT_RME (Arm's Confidential
Computing Realm implementation). In that case everything I've seen so
far expects PCI. I guess we can put off any generalisation until we
actually have some use cases that might need it.

>>> The answer lies in our goal to minimize complexity. Standard devices,
>>> whether PCIe or platform, come with their own intricate initialization
>>> protocols and often require a complex driver state machine to function.
>>> Using them would re-introduce the very driver-level complexity we aim to
>>> avoid.
>>>
>>> The smmu-testdev is intentionally not a conformant, general-purpose PCIe
>>> or platform device. It is a purpose-built, highly simplified "DMA engin=
e."
>>> I've designed it to be analogous to a minimal PCIe Root Complex that
>>> bypasses the full, realistic topology (Host Bridges, Switches, Endpoint=
s)
>>> to provide a direct, programmable path for a DMA request to reach the S=
MMU.
>>> Its sole purpose is to trigger a DMA transaction when its registers are
>>> written to, making it perfectly suited for direct control from a test
>>> environment like qtest.
>>>
>>> The Qtest Framework
>>> -------------------
>>>
>>> The new qtest (smmu-testdev-qtest.c) serves as the "bare-metal driver"
>>> for both the SMMU and the smmu-testdev. It manually performs all the
>>> setup that would typically be handled by the guest kernel and firmware,
>>> but in a completely controlled and predictable manner:
>>>
>>> 1.  SMMU Configuration: It directly initializes the SMMU's registers to=
 a
>>>      known state.
>>>
>>> 2.  Translation Structure Setup: It manually constructs the necessary
>>>      translation structures in memory, including Stream Table Entries
>>>      (STEs), Context Descriptors (CDs), and Page Tables (PTEs).
>>>
>>> 3.  DMA Trigger: It programs the smmu-testdev to initiate a DMA operati=
on
>>>      targeting a specific IOVA.
>>>
>>> 4.  Verification: It waits for the transaction to complete and verifies
>>>      that the memory was accessed correctly after address translation by
>>>      the SMMU.
>>>
>>> This framework provides a solid and extensible foundation for validating
>>> the SMMU's core translation paths. The initial test included in this
>>> series covers a basic DMA completion path in the Non-Secure bank,
>>> serving as a smoke test and a proof of concept.
>>>
>>> It is worth noting that this series currently only includes tests for t=
he
>>> Non-Secure SMMU. I am aware of the ongoing discussions and RFC patches
>>> for Secure SMMU support. To avoid a dependency on unmerged work, this
>>> submission does not include tests for the Secure world. However, I have
>>> already implemented these tests locally, and I am prepared to submit
>>> them for review as soon as the core Secure SMMU support is merged
>>> upstream.
>> What about other IOMMU's? Are there any other bus mediating devices
>> modelled in QEMU that could also benefit from the ability to trigger DMA
>> transactions?
>
>
> This is a great point that I haven't fully considered. To make sure I
> understand correctly, are you referring to IOMMU implementations for
> other architectures, such as VT-d on x86 or the ongoing IOMMU work for
> RISC-V?

Yes - generally I think having a single test device that can be used to
test multiple models will be useful. I guess each qtest will be very
tied to the SMMU it is modelling as it needs to program both sides but
if we take care to encapsulate the programming of the test device and
verification of the results we should be able to ensure good code
re-use.

> I'll admit this is an area I haven't looked into. I'm very
> open to ideas=E2=80=94do you or others have suggestions on how this
> test-device pattern could be generalized or what would be needed to
> make it useful across different architectures?

My only initial thought is the device might be better called
iommu-testdev (as in a device to test IOMMUs, of which the SMMU is one).

>
> Thanks again for the great feedback.
>
> Best regards,
>
> Tao

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

