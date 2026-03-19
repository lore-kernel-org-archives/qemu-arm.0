Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911CF1091909
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Mar 2026 18:21:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3Hz1-0002Ye-PZ; Thu, 19 Mar 2026 14:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w3Hyv-0002Xy-8G
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 14:20:30 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w3Hyt-0003vX-Du
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 14:20:29 -0400
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-46708149af2so812507b6e.0
 for <qemu-arm@nongnu.org>; Thu, 19 Mar 2026 11:20:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773944425; cv=none;
 d=google.com; s=arc-20240605;
 b=P8Z7i2iHrgWx+0PTqF8+dXIvkGiE/L3uCZxJ6NsfqlncS0/QlT6FPphyWxohdDit75
 mLZzrcy87D8uTndk02bduLH/MzB6mPgzZ5MqBWHFOVkVbRKUtmpZQj1L8DzKLuarRg12
 J6otBxVCQb40IIgPolXUIF3XJORxSY3SgV/3pgSbAqQMZcEUGQeO3LokgOxFGMhc4h1w
 sxIWUYV1ZaFaESwUgpqh5KkasbX1PSexekuZb4yviXxomrbCq7MK9B6nhLIVfb2rhvIZ
 TJn21ANeCAqIoP3v95SpX11tt5O3o0HQhmFTzN/j++bNAR88m3nRe7Mmf8uS9/yXlnOF
 +Wcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=HZ2dwR8jhlz6FuGqGwsHXSIftlVo13eRV+oZX8fBA6o=;
 fh=cz1ixrsH4ebhuSQggwnmzSLISxxtPXJehAn63dvx47o=;
 b=KWUXi8jq4HVQZ4jKX2Oy1Am+PAzMgIqWfKKVpKTtScOxWKJogX8poWJVFWqkTk0End
 GyXWyk5BFizu6A8Br3m8YpTQzIbVgQhZ9nh8vK+7sOaN4ce2r20pENvXg836wR1TUgao
 +xDUcvnK+C+5+qRrXDSe0lxq1DEmuev6gqvtuI9cWvjnfxcjY5xCb9D4inP691cNd5hT
 BZ5ZdtPS5dXfd7HptgUSZjjyHverd3HNe6l3RxFldnvxQdYn8cRF2upvAXLT8b0B04mL
 wIVnlv55wDfuioPLhbYp0tyWHrIC/0acSlvzsRX/kRYacHa1CRLy28Dt0u7U4NVwvym2
 Fk8g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773944425; x=1774549225; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HZ2dwR8jhlz6FuGqGwsHXSIftlVo13eRV+oZX8fBA6o=;
 b=h9m0BL3H0EixSg7XTNJpr6Uft7jyYO4uip4xTfbNNWZJmI3UhMd9wBL+nXL5ziunrZ
 vAecdkaybLrtKGH2ywKlFkHMAoA7GMoF3HZd1/iSjvGRFXu/bo9Jh/2rUpI+A8Kgz/ZW
 M0WNNgeRuG2PXYsSuBpMeaDUBAIz7zIIlF/nHdTavLvj8gbEEXXO3jcH14HpcXV9CrXX
 PLMdSCc1GdLyJzEjJn/sq1lo9BzmChVAaGc9ldGZWaT5u03pCvZTsZnwvivoFt8oiLEE
 AK2zJ9HeYlt5cSxzBIHQPT+UEFfjlY+lu5GkL1lKj+klTmZeLx9BnenrGcP3BXCvn5IQ
 CFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773944425; x=1774549225;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HZ2dwR8jhlz6FuGqGwsHXSIftlVo13eRV+oZX8fBA6o=;
 b=Fse7/WEE3zaytJVsKnqP1KJeW6Yr1HbF7dEN7aWspeSyg7OUwDoHvr0n3MhGwgQ0Zd
 1WNze88Z3mqz/M23C8vfxw6L8hhyhMWYBDOHFZrQTqORfTB2VwQd8ck4VrHxOMcYSAYm
 1rK+K8Gcuz0AhlVxhoDSk61WhYTUSjznWFStVejGpP2QOkw07xox7F26VeXrNgk42GAk
 kWwfBo3LfPcMeT4u0hOdh8a8cAE2VhIF/s/z1uZ4/DXjdefJiepuEMaZsqVPmMLeA+ZW
 iIt573qWQcHTAsOP5y+izOn8AW5Tu09BUehsQgxQEbXgGYIcIEOe65ZHEAW2nezy1i7B
 Hd4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZvbRv6CSraCHsL3S8W7JEzgY/ernC75Dw1fk3hL9zOt/ZBE6GGcRaCKICAAhQEuQIpnis/PW9Cg==@nongnu.org
X-Gm-Message-State: AOJu0YwW6hQ2T+tAIOHPPH9Gwnb6ECQtJnn2ZVNPuBZfTmJCAcVIvpoW
 zxCevbj3/TsSnLz2YENmxg1lipWykFYBMl7KaWDhxtt5LfUHpfPdr08eg3fJHNiZlh+aS8U8uFz
 TOoAfjZukpQvQBfhuAV5leS07eJT6hGw=
X-Gm-Gg: ATEYQzzly1EYx59z+o6ETsPC2v4QeGwfdLXKfLHu1IQg0TyfETD8pCZy3UtIylsYDmw
 6LgiDFNlB7K0c5M5R62k8Jx+yAJ6pm7/Itne4EIdegwfdJLKNqXyapUyvqb4IcVyWutq3HEnReL
 nFD8RfpP+PBaUghXm1JpKSKdTbwjtaEjik1kIlyZ26FpsEpab/XmD9jtiqMAlksrLpp7eKb55CF
 uVSKal2XyKGVLgwxGhvJGP8M9x2/TjHwtKX1a55nXnNH3i3Yy5iyr37ky1F/nb1IR2SLx1oiOVG
 V9hwf/Jg
X-Received: by 2002:a05:6808:2508:b0:467:1e5:674a with SMTP id
 5614622812f47-467e5fc5af3mr35217b6e.52.1773944425335; Thu, 19 Mar 2026
 11:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260318104640.239752-1-ruslichenko.r@gmail.com>
 <4e8f4e6e-e9d2-4457-af3d-755ced6d2a45@linaro.org>
In-Reply-To: <4e8f4e6e-e9d2-4457-af3d-755ced6d2a45@linaro.org>
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Date: Thu, 19 Mar 2026 19:20:14 +0100
X-Gm-Features: AaiRm53aVuxsvJd0_9ygqtJDL00A3DdkbHEhGmhyNj7m9QdeiR-nkzsiIYsaa68
Message-ID: <CAN-aV1FER7w1rqw0zM=L2z7MT_RKsBhFg7m6NijxyQa6t5JNqw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/9] plugins: Introduce Fault Injection framework and
 API extensions
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, artem_mygaiev@epam.com, 
 volodymyr_babchuk@epam.com, alex.bennee@linaro.org, peter.maydell@linaro.org, 
 philmd@linaro.org, Ruslan_Ruslichenko@epam.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-oi1-x232.google.com
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

Hi Pierrick,

Thank you for the feedback and review!

Our current plan is to put this plugin through our internal workflows to ga=
ther
more data on its limitations and performance.
Based on results, we may consider extending or refining the implementation
in the future.

Any further feedback on potential issues is highly appreciated.

On Wed, Mar 18, 2026 at 6:16=E2=80=AFPM Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> Hi Ruslan,
>
> On 3/18/26 3:46 AM, Ruslan Ruslichenko wrote:
> > From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> >
> > This patch series is submitted as an RFC to gather early feedback on a =
Fault Injection (FI) framework built on top of the QEMU TCG plugin subsyste=
m.
> >
> > Motivation
> >
> > Testing guest operating systems, hypervisors (like Xen), and low-level =
drivers against unexpected hardware failures can be difficult.
> > This series provides an interface to inject faults dynamically without =
altering QEMU's core emulation source code for every test case.
> >
> > Architecture & Key Features
> >
> > The series introduces the core API extensions and implements a fault in=
jection plugin (contrib/plugins/fault_injection.c) targeting AArch64.
> > The plugin can be controlled statically via XML configurations on boot,=
 or dynamically at runtime via a UNIX socket (enabling integration with aut=
omated testing frameworks via Python or GDB).
> >
> > New Plugin API Capabilities:
> >
> > MMIO Interception: Allows plugins to hook into memory_region_dispatch_r=
ead/write to modify hardware register reads or drop writes.
> > Asynchronous Timers: Exposes QEMU_CLOCK_VIRTUAL to plugins, allowing ca=
llbacks to be scheduled based on guest virtual time.
> > TB Cache Flushing: Exposes qemu_plugin_flush_tb_cache() so plugins can =
force re-translation when applying dynamic PC-based hooks.
> > Interrupt & Exception Injection: Exposes APIs to raise/pulse hardware I=
RQs on the primary INTC and inject CPU exceptions (e.g., SErrors).
> > Custom Device Faults: Introduces a registry where device models (e.g., =
SMMUv3) can expose specific fault handlers (like CMDQ errors) to be trigger=
ed externally by plugins.
> >
> > Patch Summary
> > Patch 1 (target/arm): Adds support for asynchronous CPU exception injec=
tion.
> > Patch 2-3 (plugins/api): Exposes virtual clock timers and TB cache flus=
hing to the public plugin API.
> > Patch 4 (plugins): Introduces the core fault injection subsystem, IRQ/E=
xception routing, and the Custom Fault registry.
> > Patch 5 (system/memory): Adds the MMIO override hooks into the memory d=
ispatch path.
> > Patch 6 (hw/intc): Registers the ARM GIC (v2/v3) with the plugin subsys=
tem to enable direct hardware IRQ injection.
> > Patch 7 (hw/arm): Registers the SMMUv3 with the custom fault registry t=
o demonstrate how device models can expose specific errors (like CMDQ fault=
s) to plugins.
> > Patch 8 (contrib/plugins): Implements the actual fault_injection plugin=
 using the new APIs.
> > Patch 9 (docs): Adds documentation and usage examples for the plugin.
> >
> > Request for Comments & Feedback
> >
> > Any suggestions on improvements, potential edge cases, or issues with t=
he current design are highly welcome.
> >
> > Ruslan Ruslichenko (9):
> >    target/arm: Add API for dynamic exception injection
> >    plugins/api: Expose virtual clock timers to plugins
> >    plugins: Expose Transaction Block cache flush API to plugins
> >    plugins: Introduce fault injection API and core subsystem
> >    system/memory: Add plugin callbacks to intercept MMIO accesses
> >    hw/intc/arm_gic: Register primary GIC for plugin IRQ injection
> >    hw/arm/smmuv3: Add plugin fault handler for CMDQ errors
> >    contrib/plugins: Add fault injection plugin
> >    docs: Add description of fault-injection plugin and subsystem
> >
> >   contrib/plugins/fault_injection.c | 772 +++++++++++++++++++++++++++++=
+
> >   contrib/plugins/meson.build       |   1 +
> >   docs/fault-injection.txt          | 111 +++++
> >   hw/arm/smmuv3.c                   |  54 +++
> >   hw/intc/arm_gic.c                 |  28 ++
> >   hw/intc/arm_gicv3.c               |  28 ++
> >   include/plugins/qemu-plugin.h     |  28 ++
> >   include/qemu/plugin.h             |  39 ++
> >   plugins/api.c                     |  62 +++
> >   plugins/core.c                    |  11 +
> >   plugins/fault.c                   | 116 +++++
> >   plugins/meson.build               |   1 +
> >   plugins/plugin.h                  |   2 +
> >   system/memory.c                   |   8 +
> >   target/arm/cpu.h                  |   4 +
> >   target/arm/helper.c               |  55 +++
> >   16 files changed, 1320 insertions(+)
> >   create mode 100644 contrib/plugins/fault_injection.c
> >   create mode 100644 docs/fault-injection.txt
> >   create mode 100644 plugins/fault.c
> >
>
> first, thanks for posting your series!
>
> About the general approach.
> As you noticed, this is exposing a lot of QEMU internals, and it's
> something we tend to avoid to do. As well, it's very architecture
> specific, which is another pattern we try to avoid.
>
> For some of your needs (especially IRQ injection and timer injection),
> did you consider writing a custom ad-hoc device and timer generating thos=
e?
> There is nothing preventing you from writing a plugin that can
> communicate with this specific device (through a socket for instance),
> to request specific injections. I feel that it would scale better than
> exposing all this to QEMU plugins API.
>
> For SMMU, this is trickier. Tao recently (6ce361b02c82) an iommu test
> device, associated to qtest to unit test the smmu implementation. We
> could maybe see to leverage that on a full machine, associated with the
> communication method mentioned above, to generate specific operations at
> runtime, all triggered via a plugin.
>
> Exposing qemu_plugin_flush_tb_cache is a hint we are missing something
> on QEMU side. Better to fix it than expose this very internal function.

The reason this was needed is that the plugin may receive PC trigger
configuration
dynamically and need to register instruction callback at runtime.
If the TB for that PC is already translated and cached, our newly registere=
d
callback might not be executed.

If there is a more proper way to force QEMU to re-translate a specific
TB or attach
a callback to cached TB it would be great to reduce the complexity here.

> The associated TRIGGER_ON_PC is very similar to existing inline
> operations. They could be enhanced to support writing to a given
> register, all the bricks are there. For TRIGGER_ON_SYSREG it's a bit
> more complex, but we might enhance inline operations also to support
> hooks on specific register writes.

TRIGGER_ON_PC may also be used for generating other faults too. For example=
,
one use-case is to trigger CPU exceptions on specific instructions.
Supporting TRIGGER_ON_SYSREG as an inline operation sounds like a
really interesting
direction to explore.

>
> For MMIO override, the current approach you have is good, and it's
> definitely something we could integrate.
>
> What are you toughts about this? (especially the device based approach
> in case that you maybe tried first).

I agree such an approach can work well for IRQ's and Timers, and would be
more clean way to implement this.

However, for SMMU and similar cases, triggering internal state errors is no=
t
easy and requires accessing internal logic. So for those specific cases,
a different approach may be needed.

>
> Regards,
> Pierrick

BR,
Ruslan

