Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30F4CD4851
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 13:31:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMnDB-0006lA-F8; Tue, 12 May 2026 09:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wMnCf-0006bg-Ok
 for qemu-arm@nongnu.org; Tue, 12 May 2026 09:31:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wMnCa-00083l-II
 for qemu-arm@nongnu.org; Tue, 12 May 2026 09:31:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778592666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+TGpaXGbdxrL9XSTBvrmovfO+9XIeMta7Y4Ueu0qyDg=;
 b=b4RnbBypugWM4mb9wkfQ9d8oaA5wkXslWtVjE+6PnrZz9sOOpuIJYvaoQPNAPVD72bXOKJ
 i9hsXtT5XNynEVERHTj5qooZMfvLBIs2ObsNUj/2ggcPxZzpBY825g6U6yCgSG4RyWxHQA
 hFUAiEzBR1jaGLD7hix4iWsFlXKb5DE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-S-hdE0UpOlWUE51ozQgfGQ-1; Tue, 12 May 2026 09:31:04 -0400
X-MC-Unique: S-hdE0UpOlWUE51ozQgfGQ-1
X-Mimecast-MFC-AGG-ID: S-hdE0UpOlWUE51ozQgfGQ_1778592660
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-48d05e7b117so43769405e9.0
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 06:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778592660; x=1779197460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+TGpaXGbdxrL9XSTBvrmovfO+9XIeMta7Y4Ueu0qyDg=;
 b=AqdGJQnz0bANIHuG9+is6/u1E0MexvNpbMkWVyYd9O3f2a19UAwHDmGZFlpz3ahBio
 qJe5MZMFBmx1j7OnmMN+s7Ro1KJHItgP64A4CjtiLTzbfIANkUAyz7q3ZXzVeECVKFtP
 fwYw76yUT+zsUzLrigrHAcbb/ws9kIgNCVDEYdXfu8zksv3119voVTBWaSFC1HkFa8+5
 YkKbhhpZwAaT1YTjMeyJV8skZau0y09nmojpOiP4E4cOd8Dxny+ZA1AKyuIGxX4GyYq+
 AE3gnkwDyveooaipi8dvhulVlnA5nuZYUlxfo+YGgEiXBsnYwzwZHt5sFNZi8wxfwg5t
 vO4w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9A6FN2TU77Ar29ShXGsyUKTda5cy72xerLIoo0TBTSL49doZvg5Ct1ooe/Stlu/EngHLRCFjLZ9A==@nongnu.org
X-Gm-Message-State: AOJu0YzTiCIRnAuYFCAITqRqD+UEbuYO3uzAjmm4lLS3O1hzQlGjuXK/
 8waGQcjHhr+SM1NOyP/+Zm0zWBjw+B0f36P1ruh5CZzB9UjEfoz8Qoz6lsVacwi9kPndovLpShC
 Ufs6KA1IboeRUQGLnTyMt7LbkI7hF8L+AFFM/G+ytjqGVppI+AAsHAA==
X-Gm-Gg: Acq92OHLx0xFbiJX1+cHZK9upT3DAMfP9KwZURTACPp8uXmvUfdo4k5zsJnsdZMkq3d
 efXgF6iFQgXluMBvrEJdie2YZr0RIRbew1EPHrG2iqOgSUDjP8k+MM5355kwnP+2efCAPo+BNln
 9SUQqZPUS18vQ+jj3oT3ebDm9+Hlur3+XRlLT8tTfG/UuC6HuEsAeedfc6M60LmqWOKzk4ZPJIF
 cjo29qdD88CxZ2p6AoyX6wrmh1xK49Z0ki6wRPA7/WvbBiCUfbSz4NVjKYhzSOufOqao08koiNb
 5EdY9u8UrYEe7IKOltncChP3RKs12ByDyCfxbbi3RQuMs/mAyA756SmKjW4zFVBIMbaTnh8O2y/
 PgcrLhw==
X-Received: by 2002:a05:600c:a30d:b0:488:a2ac:a334 with SMTP id
 5b1f17b1804b1-48e51e08228mr316495255e9.3.1778592659653; 
 Tue, 12 May 2026 06:30:59 -0700 (PDT)
X-Received: by 2002:a05:600c:a30d:b0:488:a2ac:a334 with SMTP id
 5b1f17b1804b1-48e51e08228mr316494985e9.3.1778592659176; 
 Tue, 12 May 2026 06:30:59 -0700 (PDT)
Received: from imammedo ([213.175.37.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e9052c9fesm101578855e9.1.2026.05.12.06.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 06:30:58 -0700 (PDT)
Date: Tue, 12 May 2026 15:30:57 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, anisinha@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, philmd@linaro.org,
 zhao1.liu@intel.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v2 00/21] Introduce ACPI watchdog for Q35 and arm/virt
 boards
Message-ID: <20260512153057.1a353c3e@imammedo>
In-Reply-To: <20260428161215.49cc1c0f@imammedo>
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260428161215.49cc1c0f@imammedo>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UxJ591DiO0LlqI0WKVSeUBVuJgnJoWcTuZebjowxXPw_1778592660
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 28 Apr 2026 16:12:15 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> On Tue,  3 Mar 2026 10:25:11 +0100
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
> > Changelog:
> >   v2:
> >      * ditch generic '-machine acpi-watchdog' option in favor of
> >        board specific variants:
> >            x86/q35:  -machine wdat={on|off}
> >            arm/virt: -device sbsa_gwdt,wdat={on|off}
> >      * arm/virt: add FDT and GTDT ACPI entries for GWDT when it's present
> >        and hide GDTD one when WDAT is enabled.
> >      * arm/virt: add test case for GTDT 
> >      * [18-21] optional GWDT cleanup/fixes in handling WCV register update,
> >        make QEMU behave according to spec (at least the way I read it and
> >        it appears MS also read it that way). It fixes Windows 11 reboots when
> >        GWDT is present (without WDAT). With that fixed it's up to MS to fix
> >        their driver to set sane timeout as with the current one wdatchdog
> >        will never trigger.  
> 
> given merge window should be open by now,
> gentle ping

2 weeks later,
yet another ping

> 
> > Windows doesn't ship built-in TCO watchdog driver, and users are
> > forced to install vendor specific driver(s) if such exists.
> > However the OS provides a generic watchdog driver that uses
> > ACPI WDAT table [1] to abstract actual hardware behind it.
> > The same applies to ARM version of Windows.
> > 
> > This series adds
> >  *  WDAT table tailored for TCO watchdog that Q35 already
> >     has as part of ICH9 chipset and a knob to enable it.
> >  *  SBSA GWDT to arm/virt machine with WDAT table tailored
> >     for it and necessary tweaks to GWDT to make usable
> >     with WDAT driver.
> >     * in addition to WDAT, it also adds native variant
> >       with GWDT described in FDT and DTDT
> >       (broken on Windows/works on linux).
> > 
> > Guest OS WDAT support is present since Windows Vista and Linux since 2016[2].
> > 
> > One can test it launching VM with following options:
> >   * x86:
> >        -machine q35,wdat=on
> >   * arm/virt:
> >        -device sbsa_gwdt,wdat=on
> > 
> > to trace access to TCO registers one can add to CLI:
> >     -trace "tco_*"
> > to trace access to GWDT registers one can add to CLI:
> >     -trace "sbsa_gwdt*"
> > 
> > To verify that guest uses WDAT (both Windows and Linux would use it if present),
> >   * on linux make sure that watchdog service is configured/enabled
> >     (use wdctl to check what watchdog device is in use) and then
> >     trigger kernel panic with command:
> >       echo c > /proc/sysrq-trigger
> >   * on Windows kill svchost process, running cmd in admin mode:
> >       taskkill /f /im svchost.exe
> > 
> > Tested with WS2025 & RHEL9.6 & Fedora 43 (aarch64)
> > 
> > git tree at: https://gitlab.com/imammedo/qemu/-/commits/gwdt_v2
> > 
> > 1) http://msdn.microsoft.com/en-us/windows/hardware/gg463320.aspx
> > 2) https://lwn.net/Articles/700524/
> > 
> > PS:
> >  previous revision:
> >   https://patchew.org/QEMU/20260206131438.1857182-1-imammedo@redhat.com/
> > 
> > Igor Mammedov (21):
> >   acpi: add API to build WDAT instructions
> >   x86: q35: add 'wdat' property
> >   x86: q35: generate WDAT ACPI table
> >   tests: acpi: x86/q35: whitelist new WDAT table
> >   tests: acpi: x86/q35: add WDAT table test case
> >   tests: acpi: x86/q35: update expected WDAT blob
> >   arm: sbsa_gwdt: fixup default "clock-frequency"
> >   arm: add tracing events to sbsa_gwdt
> >   arm: virt: create sbsa_gwdt watchdog
> >   arm: sbsa_gwdt: add 'wdat' option
> >   arm: virt: add support for WDAT based watchdog
> >   tests: acpi: arm/virt: whitelist new WDAT table
> >   tests: acpi: arm/virt: add WDAT table test case
> >   tests: acpi: arm/virt: update expected WDAT blob
> >   tests: acpi: arm/virt: whitelist GTDT table
> >   tests: acpi: arm/virt: add GTDT watchdog table test case
> >   tests: acpi: arm/virt: update expected GTDT blob
> >   sbsa_gwdt: reduce code ident
> >   sbsa_gwdt: move all foo_REFRESH logic under REFRESH condition
> >   sbsa_gwdt: reschedule timer on direct WCV load
> >   sbsa_gwdt: limit compare_value to INT64_MAX
> > 
> >  include/hw/acpi/wdat-gwdt.h            |  19 ++++
> >  include/hw/acpi/wdat-ich9.h            |  15 ++++
> >  include/hw/acpi/wdat.h                 | 118 +++++++++++++++++++++++++
> >  include/hw/i386/pc.h                   |   1 +
> >  include/hw/watchdog/sbsa_gwdt.h        |   1 +
> >  hw/acpi/aml-build.c                    |  14 +++
> >  hw/acpi/meson.build                    |   5 +-
> >  hw/acpi/wdat-gwdt-stub.c               |  16 ++++
> >  hw/acpi/wdat-gwdt.c                    |  92 +++++++++++++++++++
> >  hw/acpi/wdat-ich9-stub.c               |  15 ++++
> >  hw/acpi/wdat-ich9.c                    |  90 +++++++++++++++++++
> >  hw/arm/Kconfig                         |   1 +
> >  hw/arm/virt-acpi-build.c               |  65 +++++++++++++-
> >  hw/arm/virt.c                          |   2 +
> >  hw/core/sysbus-fdt.c                   |  32 +++++++
> >  hw/i386/acpi-build.c                   |  12 +++
> >  hw/i386/pc_q35.c                       |  18 ++++
> >  hw/watchdog/sbsa_gwdt.c                |  65 +++++++++-----
> >  hw/watchdog/trace-events               |   9 ++
> >  tests/data/acpi/aarch64/virt/GTDT.gwdt | Bin 0 -> 132 bytes
> >  tests/data/acpi/aarch64/virt/WDAT.wdat | Bin 0 -> 260 bytes
> >  tests/data/acpi/x86/q35/WDAT.wdat      | Bin 0 -> 308 bytes
> >  tests/qtest/bios-tables-test.c         |  54 +++++++++++
> >  23 files changed, 618 insertions(+), 26 deletions(-)
> >  create mode 100644 include/hw/acpi/wdat-gwdt.h
> >  create mode 100644 include/hw/acpi/wdat-ich9.h
> >  create mode 100644 include/hw/acpi/wdat.h
> >  create mode 100644 hw/acpi/wdat-gwdt-stub.c
> >  create mode 100644 hw/acpi/wdat-gwdt.c
> >  create mode 100644 hw/acpi/wdat-ich9-stub.c
> >  create mode 100644 hw/acpi/wdat-ich9.c
> >  create mode 100644 tests/data/acpi/aarch64/virt/GTDT.gwdt
> >  create mode 100644 tests/data/acpi/aarch64/virt/WDAT.wdat
> >  create mode 100644 tests/data/acpi/x86/q35/WDAT.wdat
> >   
> 


