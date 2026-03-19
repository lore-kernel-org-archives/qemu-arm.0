Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD081091929
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Mar 2026 22:29:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3Lrt-0002rz-OG; Thu, 19 Mar 2026 18:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w3Lrs-0002rq-T5
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 18:29:28 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w3Lrq-00053i-A5
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 18:29:28 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-7d556c1a79eso1490002a34.3
 for <qemu-arm@nongnu.org>; Thu, 19 Mar 2026 15:29:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773959365; cv=none;
 d=google.com; s=arc-20240605;
 b=U2yM56rj32iv+gDOBiSO81wfStcSufE9IQvUVuftBWGKRm3NE20INMW2GkR6vzm4Lt
 VRuLdWixFFWO56AVrGBPGwVzr54iuotdjrhRH3P/i8BtAMf42MMvzJLJmecW99z3LtWF
 sNChGFIZgIOHwQfBzLgxXhBasop/O0DFOuSOiKrl4ty+M763zEvzAxKe27uFZW/LFYEH
 SxA+VW54Q4eW6NMzcqm1M6TmeJVM50sF1JaWD6Vd3/70jWJrvlfiNhGEhlrWNkD94ZHI
 cSNneJMDlZIis9K9FeJklhFgX84kWVCc3HtwPbwjbSi+vUid8c1eQdZceIL3O2GHOQKd
 AN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=zSo8NjxK1kjRVJe+MMsvA1/YI76pZtWxBrvNv1Slaxo=;
 fh=6zFhzDPStZt4Qp2w7noSeSFAlSqXOXKJm1SvsIbZFRw=;
 b=O3NEQJdJIuK7C5do1YSVIFhtl/8MgWVahu38Q48Y4+O48CIJD7e6zVMnmWZyweshmd
 1Pc7pQ9AcADBRO1trSB93lX7AC0PLS6oookk++XyoHzv7OaUQ5UHV/N9Ba3s/fahO/bZ
 H72RMLF5UdgeGgoP1GCiHGU1NDnXAiePIIoJazI/aPV2imdsKRpK8pxV24TFPzYNbslL
 3tCXPkXFNFBvl1uj+ZjDTlUhumUHQPN9ZPhl7NXLIDojRnjSwy5QZ7wyAfKb4ttPdz6Y
 dHNfWViOG9G5kn0HesOl/pAy93QnGqQUFelZZNAuIRvCJTOXszJW3N2dB/WS3iw0+AFb
 f91w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773959365; x=1774564165; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zSo8NjxK1kjRVJe+MMsvA1/YI76pZtWxBrvNv1Slaxo=;
 b=ZxPSWwqM/LS8rvu+BbmQ35DBo+/YPj3w3x+1sAHYmPqx4ca8FZGnV2Dx4PJfZnAKw6
 yyW9u4g5+czImb3d7jlMQl9QYB/+zXp1Dh+JmLrS/B6oPTv2GSyv5kugd2MoFzDS0tXj
 TZBYS85hPTbVvn0hArAlVqKRYDJ/Lsap1tpeB1HzF+Mxu8EMyKMklUoMg725UcMk70N1
 Jnbltrp5/tUiG8dPuzFTtKRzRD4PK+Gcft/Se/B9qgk3D7Gsb7n/jbqXlbpmC1H5GGtO
 4tIYjL7SkBjlo52hQectscU3QHqqFZ45gfS17/B7V6qA+VmqeCrg/yFWKtDo87nqbnQI
 I5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773959365; x=1774564165;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zSo8NjxK1kjRVJe+MMsvA1/YI76pZtWxBrvNv1Slaxo=;
 b=QtRzPsXlv1SWE0VCBBZrrF+3ANnbOnPuhkmDXVqOKCvQt1ACm9axclo+7KYmedrIP9
 DfNiPm+Oh35JdbNllDz7NiG9ODswt1GTLCnwJJRTYA6z+//CtZZ6hA4OyRdnSsvsFLqg
 ZI8bS5yDYDnz/8NzuEWycP9t+l76lQAwfsxYxft13+5OLzQQGta15zGGBMH6GDoK2Lfe
 rBauP8Y19q5IX164ik8j3OMvgcuj2h2REi7aoUwVl0NtmO0w6R2gEiUUqShVvInT07/a
 MLy/SbrbgGTORYsyjfgaCtdOzt5/x/bc4PVJE3YRRDpkRdJ78c77YzHUUuscmzRE8Ps7
 Lcmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuLKSo2JgHT+yPjeCOlVMTBuKw94RdcuXFbG7UHakIro5OQyRaui2Pz/Du1w6XL3wlINYWGazoYg==@nongnu.org
X-Gm-Message-State: AOJu0YxJnt9xXGqoI9tH6LURAYqsgMLp5ISa2Us+P+GsPCt9LtNoGa18
 Bjwp/ktEu9ewxzjCZbq1ZwZVbVxqNh9rgTb5w672pelBPKtmOn7NHONAtsV/Yx59BbQGPDFdpj7
 lAWe8g0IUgole6LujKcw6GwgEZRctKqM=
X-Gm-Gg: ATEYQzxrSWd7Bs8sfxL/k44GTu0n+myi3UjPmt73tr0UIy4Obmd3YnrCs+PwGctmVGI
 ov3wEXY3KrhlMG865DMfljLRSLA/JiQpG3ZK+pwXJXB+IExt8hkGWb5qhTGTjzYAj9SNwurksJR
 dwivvVKO/V1YDwknThgnNU7TbQ+arvbFmywJTgz+xARse3l0AISyZY5odTwydkrjgfa0GZQ8vJa
 RhsBZbBffTjeN7u8enHqql7tm7uySXxMZxKeknGRFf5sLFA6ymXfiFcuFuT+J1yOX507g94Y4/y
 UvmGWVH6
X-Received: by 2002:a05:6830:7107:b0:7d7:e8e6:b8b4 with SMTP id
 46e09a7af769-7d7eb033576mr765049a34.34.1773959364768; Thu, 19 Mar 2026
 15:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260318104640.239752-1-ruslichenko.r@gmail.com>
 <4e8f4e6e-e9d2-4457-af3d-755ced6d2a45@linaro.org>
 <CAN-aV1FER7w1rqw0zM=L2z7MT_RKsBhFg7m6NijxyQa6t5JNqw@mail.gmail.com>
 <4d2d16df-0047-4b96-8312-46489ba0f1bf@linaro.org>
In-Reply-To: <4d2d16df-0047-4b96-8312-46489ba0f1bf@linaro.org>
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Date: Thu, 19 Mar 2026 23:29:13 +0100
X-Gm-Features: AaiRm50wvdoYSXCGkD2fSP9lcr5PhsU8m0dcoMn6A9vp9AVygfxHIB4cV7xgB5E
Message-ID: <CAN-aV1F6O3dv5F1946wEugdLxkYDp0BW6QZPxwye02A5-HYz9g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/9] plugins: Introduce Fault Injection framework and
 API extensions
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, artem_mygaiev@epam.com, 
 volodymyr_babchuk@epam.com, alex.bennee@linaro.org, peter.maydell@linaro.org, 
 philmd@linaro.org, Ruslan_Ruslichenko@epam.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ot1-x331.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Mar 19, 2026 at 8:04=E2=80=AFPM Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> On 3/19/26 11:20 AM, Ruslan Ruslichenko wrote:
> > Hi Pierrick,
> >
> > Thank you for the feedback and review!
> >
> > Our current plan is to put this plugin through our internal workflows t=
o gather
> > more data on its limitations and performance.
> > Based on results, we may consider extending or refining the implementat=
ion
> > in the future.
> >
> > Any further feedback on potential issues is highly appreciated.
> >
>
> By design, the approach of modifying QEMU internals to allow to inject
> IRQ, set a timer, or trigger SMMU has very few chances to be integrated
> as it is. At least, it should be discussed with the concerned
> maintainers, and see if they would be open to it or not.
>
> It's not wrong in itself, if you want a downstream solution, but it does
> not scale upstream if we have to consider and accept everyone's needs.
> The plugin API in itself can accept the burden for such things, but it's
> harder to justify for internal stuff.
>
> I believe it would be better to rely on ad hoc devices generating this,
> with the advantage that even if they don't get accepted upstream, it
> will be more easy for you to maintain them downstream compared to more
> intrusive patches.
>
> > On Wed, Mar 18, 2026 at 6:16=E2=80=AFPM Pierrick Bouvier
> > <pierrick.bouvier@linaro.org> wrote:
> >>
> >> Hi Ruslan,
> >>
> >> On 3/18/26 3:46 AM, Ruslan Ruslichenko wrote:
> >>> From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> >>>
> >>> This patch series is submitted as an RFC to gather early feedback on =
a Fault Injection (FI) framework built on top of the QEMU TCG plugin subsys=
tem.
> >>>
> >>> Motivation
> >>>
> >>> Testing guest operating systems, hypervisors (like Xen), and low-leve=
l drivers against unexpected hardware failures can be difficult.
> >>> This series provides an interface to inject faults dynamically withou=
t altering QEMU's core emulation source code for every test case.
> >>>
> >>> Architecture & Key Features
> >>>
> >>> The series introduces the core API extensions and implements a fault =
injection plugin (contrib/plugins/fault_injection.c) targeting AArch64.
> >>> The plugin can be controlled statically via XML configurations on boo=
t, or dynamically at runtime via a UNIX socket (enabling integration with a=
utomated testing frameworks via Python or GDB).
> >>>
> >>> New Plugin API Capabilities:
> >>>
> >>> MMIO Interception: Allows plugins to hook into memory_region_dispatch=
_read/write to modify hardware register reads or drop writes.
> >>> Asynchronous Timers: Exposes QEMU_CLOCK_VIRTUAL to plugins, allowing =
callbacks to be scheduled based on guest virtual time.
> >>> TB Cache Flushing: Exposes qemu_plugin_flush_tb_cache() so plugins ca=
n force re-translation when applying dynamic PC-based hooks.
> >>> Interrupt & Exception Injection: Exposes APIs to raise/pulse hardware=
 IRQs on the primary INTC and inject CPU exceptions (e.g., SErrors).
> >>> Custom Device Faults: Introduces a registry where device models (e.g.=
, SMMUv3) can expose specific fault handlers (like CMDQ errors) to be trigg=
ered externally by plugins.
> >>>
> >>> Patch Summary
> >>> Patch 1 (target/arm): Adds support for asynchronous CPU exception inj=
ection.
> >>> Patch 2-3 (plugins/api): Exposes virtual clock timers and TB cache fl=
ushing to the public plugin API.
> >>> Patch 4 (plugins): Introduces the core fault injection subsystem, IRQ=
/Exception routing, and the Custom Fault registry.
> >>> Patch 5 (system/memory): Adds the MMIO override hooks into the memory=
 dispatch path.
> >>> Patch 6 (hw/intc): Registers the ARM GIC (v2/v3) with the plugin subs=
ystem to enable direct hardware IRQ injection.
> >>> Patch 7 (hw/arm): Registers the SMMUv3 with the custom fault registry=
 to demonstrate how device models can expose specific errors (like CMDQ fau=
lts) to plugins.
> >>> Patch 8 (contrib/plugins): Implements the actual fault_injection plug=
in using the new APIs.
> >>> Patch 9 (docs): Adds documentation and usage examples for the plugin.
> >>>
> >>> Request for Comments & Feedback
> >>>
> >>> Any suggestions on improvements, potential edge cases, or issues with=
 the current design are highly welcome.
> >>>
> >>> Ruslan Ruslichenko (9):
> >>>     target/arm: Add API for dynamic exception injection
> >>>     plugins/api: Expose virtual clock timers to plugins
> >>>     plugins: Expose Transaction Block cache flush API to plugins
> >>>     plugins: Introduce fault injection API and core subsystem
> >>>     system/memory: Add plugin callbacks to intercept MMIO accesses
> >>>     hw/intc/arm_gic: Register primary GIC for plugin IRQ injection
> >>>     hw/arm/smmuv3: Add plugin fault handler for CMDQ errors
> >>>     contrib/plugins: Add fault injection plugin
> >>>     docs: Add description of fault-injection plugin and subsystem
> >>>
> >>>    contrib/plugins/fault_injection.c | 772 ++++++++++++++++++++++++++=
++++
> >>>    contrib/plugins/meson.build       |   1 +
> >>>    docs/fault-injection.txt          | 111 +++++
> >>>    hw/arm/smmuv3.c                   |  54 +++
> >>>    hw/intc/arm_gic.c                 |  28 ++
> >>>    hw/intc/arm_gicv3.c               |  28 ++
> >>>    include/plugins/qemu-plugin.h     |  28 ++
> >>>    include/qemu/plugin.h             |  39 ++
> >>>    plugins/api.c                     |  62 +++
> >>>    plugins/core.c                    |  11 +
> >>>    plugins/fault.c                   | 116 +++++
> >>>    plugins/meson.build               |   1 +
> >>>    plugins/plugin.h                  |   2 +
> >>>    system/memory.c                   |   8 +
> >>>    target/arm/cpu.h                  |   4 +
> >>>    target/arm/helper.c               |  55 +++
> >>>    16 files changed, 1320 insertions(+)
> >>>    create mode 100644 contrib/plugins/fault_injection.c
> >>>    create mode 100644 docs/fault-injection.txt
> >>>    create mode 100644 plugins/fault.c
> >>>
> >>
> >> first, thanks for posting your series!
> >>
> >> About the general approach.
> >> As you noticed, this is exposing a lot of QEMU internals, and it's
> >> something we tend to avoid to do. As well, it's very architecture
> >> specific, which is another pattern we try to avoid.
> >>
> >> For some of your needs (especially IRQ injection and timer injection),
> >> did you consider writing a custom ad-hoc device and timer generating t=
hose?
> >> There is nothing preventing you from writing a plugin that can
> >> communicate with this specific device (through a socket for instance),
> >> to request specific injections. I feel that it would scale better than
> >> exposing all this to QEMU plugins API.
> >>
> >> For SMMU, this is trickier. Tao recently (6ce361b02c82) an iommu test
> >> device, associated to qtest to unit test the smmu implementation. We
> >> could maybe see to leverage that on a full machine, associated with th=
e
> >> communication method mentioned above, to generate specific operations =
at
> >> runtime, all triggered via a plugin.
> >>
> >> Exposing qemu_plugin_flush_tb_cache is a hint we are missing something
> >> on QEMU side. Better to fix it than expose this very internal function=
.
> >
> > The reason this was needed is that the plugin may receive PC trigger
> > configuration
> > dynamically and need to register instruction callback at runtime.
> > If the TB for that PC is already translated and cached, our newly regis=
tered
> > callback might not be executed.
> >
> > If there is a more proper way to force QEMU to re-translate a specific
> > TB or attach
> > a callback to cached TB it would be great to reduce the complexity here=
.
> >
>
> I understand better. QEMU plugin current implementation is too limited
> for this, and everything has to be done/known at translation time.
> What is your use case for receiving PC trigger after translation? Do you
> have some mechanism to communicate with the plugin for this?

Yes, exactly. If the guest has already executed the target code, the newly
added trigger will be ignored, as the TB is cached.

For runtime configuration, the plugin spawns a background thread that liste=
ns
on a socket. External Python test script connects to this socket to send
dynamically generated XML faults.

There are several scenarios where this might be needed, mainly for faults t=
hat
are difficult to define statically at boot time.
Examples include injecting faults after specific chain of events, freezing =
or
overriding system registers values at specific execution points (since this
is currently implemented via PC triggers). Supporting environments with KAS=
LR
enabled might be one more case.

>
> >> The associated TRIGGER_ON_PC is very similar to existing inline
> >> operations. They could be enhanced to support writing to a given
> >> register, all the bricks are there. For TRIGGER_ON_SYSREG it's a bit
> >> more complex, but we might enhance inline operations also to support
> >> hooks on specific register writes.
> >
> > TRIGGER_ON_PC may also be used for generating other faults too. For exa=
mple,
> > one use-case is to trigger CPU exceptions on specific instructions.
> > Supporting TRIGGER_ON_SYSREG as an inline operation sounds like a
> > really interesting
> > direction to explore.
> >
>
> In general, having inline operations support on register read/writes
> would be a very nice thing to have (though might be tricky to implement
> correctly), and more efficient that the existing approach that requires
> to check their value everytime.
>
> >>
> >> For MMIO override, the current approach you have is good, and it's
> >> definitely something we could integrate.
> >>
> >> What are you toughts about this? (especially the device based approach
> >> in case that you maybe tried first).
> >
> > I agree such an approach can work well for IRQ's and Timers, and would =
be
> > more clean way to implement this.
> >
> > However, for SMMU and similar cases, triggering internal state errors i=
s not
> > easy and requires accessing internal logic. So for those specific cases=
,
> > a different approach may be needed.
> >
>
> Thus the iommu-testdev I mentioned, that could be extended to support thi=
s.
>
> >>
> >> Regards,
> >> Pierrick
> >
> > BR,
> > Ruslan
>
> Regards,
> Pierrick

