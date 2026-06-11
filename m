Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09BACD98CE
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 12:49:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXeqa-0006e7-RZ; Thu, 11 Jun 2026 08:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wXeqW-0006dg-1r
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 08:49:20 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wXeqP-0002eZ-F8
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 08:49:19 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-6603246b66dso8181777d50.1
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 05:49:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781182144; cv=none;
 d=google.com; s=arc-20240605;
 b=JiY5Wfy/imIEgjfpMotwtzWcXgisBMD3Te68vwvMfZtLb5ToI0bv0NlqDen10fvj8+
 bLJeFkvZWHomS0z9eAQLBVCktqvIL0Xt4CJvlrtS1gmv89U94eSuW4RdffrWuqVcPbZH
 Tv+yHp6wLJej3lwo2Q32oDi3r/hHY65ZFMhd1NzNGmzp5paWXEDHWlWz6TdodK2RyhvJ
 QIKEFouxN0IBiOsxZUDlA6kPSPUGz2DLr8H95n9gKBYrdyNYT3m+uWZeI/M+d/NhMkOS
 PqvQRPDMCr/JN7aE7RJDsILo6g88jynpfJaFgXzsijZATLquVdpkwCIcDKLQpxFfl90M
 RDUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=qqycDn120OGbgsejPQp28DpSYFYsYk8AKQpL68g/OVM=;
 fh=eZPE/uJ3qwPV9hi5zObMG4Z86qe9zvy785660R4bwlE=;
 b=QWuF4M9ZibbuBzfNXQnGLsXQGM1EblVO5qs8vYQwV3g15n49qVgLpgUJygDulj0iUP
 kS+EOuxJPi7gr/SEsvwQJO7IrKQ14gQkD25nQQxpqNnsVayG3rKNPQMPztN653mFzbMX
 4ezs7vSr9ZZ9ImAxfV7J3hqg+eVn3ehc9fahH4ts5ymjNedXWcPvAmLZlNOrm/9vJf/q
 3HTTGUJdI1xfDd5pj024LOYqdbKYsSPWhQNrCIIKSPoFmXm2vZCCE2oTwtPFDb0ogBdz
 foKtDM7JRfExGThbTYNa96Oc1THgJzFCu3KWQUqV5CR4yCfW4g6oR3J1xgDX2bBBl1Vs
 tbOQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781182144; x=1781786944; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qqycDn120OGbgsejPQp28DpSYFYsYk8AKQpL68g/OVM=;
 b=uQ6pJcfLZjE5kTZVhnvFsGH3kf9e6PD0vzmIrgiDSfxwk+/PDdaM0KUrRqBul5cC1N
 nrgAmWOMHViKBjjBiO8atPqSVzF5BsW7FN4hRQY7T/d1ZRZyT+A2oTAOusIW5RSp89GX
 Ay9qejnJHhdsEzyDy4z1g/3s4X2+JYkManw1NHGh1alf5KKwMQRbJ144IrHWj3UARGVb
 NbleHRwny/iU9gq6KYfI8sWx9gHYc8XDQrGukXqDpTSYomByh0ZS4GlNSFKQyF5W1KEG
 FWP8dMdxE487wtBvnUV8doPScH4kRBh4QvgMVEWxB+t1OfH2gthzmOwZWVVSNgkdgIbA
 v6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781182144; x=1781786944;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qqycDn120OGbgsejPQp28DpSYFYsYk8AKQpL68g/OVM=;
 b=PO5xTQ3OfKdFDMQpqBaeK9xusPJH5C82XL5cNZ2P+FrOuY/HRzJFEl+gGpl3k52j/z
 9ua54Hh/j5gXnWVbUIfdKFVfWHCJHRRkocCG9fpbsNESWfySc7UmnQ3NGKmvPs6DXXg4
 KUEFjDpaKzaTf7BxbaLF5271hg5aM0uz6HalaJqJnfHbP90jnm8Y6JbgpfYCiISzHKsK
 EyPVdh2Ryhd5bd0K3OZ/BTAPBEj2iv5u1zCuArFRaHepFwrHGp58aGHSN5+5gcn1MoxZ
 Zzu7pUh3tGdz0O412BuTKmrGGb01kuUaE3pRKLu/9SBuwu22coF+yiIRNfQd5Foipy5v
 oG1g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/UtCDygBanKlnrg0tzknjHCNCRvzchIdmbackni6xiODimQGatZR+ZrQExq48PiK3o70T0Y7GClQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy7m2jFTQUsVTERZ+X1VuDLzbsMCmkDhnjNT39qg50fI72Bx92+
 ZKIHwF6JCtxxt76yYSc92KB/35GCI1JZDll/WuqYSRaM1zjIjjsCT6SL3UIX8iPU03oON3HMDra
 75pZ5E6tNJe+vp2zLDvir/g2eO7hvDezomP9X1Er5Jw==
X-Gm-Gg: Acq92OEC6nEeEldaxEN+X+olox682lvli3PM8BgeSflR9dqVhQGFnO02VoD/x53Ec9V
 pvbwo3tzOGH3WrcRflUSXP6NJLt4bSgJ586ducBY0StzGAQk2MAhart8p8CffLWqlh9qe9Cd2Yr
 GdQ9TdbLFwrEb6Ik1ktHgtTrtygT40OE4Oum5lQuzMiA2csGnz/amprp91kMRYomS6OvTzguOee
 PSxxZg7ateKGEjWQJGzWGKFR6Wam55blzLlb0M2rSfFjl9M+zclwQw40r3D1STNQS2Uj7lujevI
 hjAq39pHF6Chxksr+a2nNZdDXlpKFtkCJfIG7y5zui+wRpjW3U8L3UppMNj3GHOma8iKBMYxY4g
 O6Q==
X-Received: by 2002:a05:690e:d4a:b0:660:3426:3ff4 with SMTP id
 956f58d0204a3-6626969054fmr1966311d50.18.1781182143729; Thu, 11 Jun 2026
 05:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <eb0f0da1-11dd-4437-94fd-a65af55851e1@redhat.com>
 <20260610082637-mutt-send-email-mst@kernel.org>
 <5d8cbd4b-3725-437e-88a3-e0af32164815@redhat.com>
 <e7cc9f2d-ccb4-442f-a1ed-7c5474395099@redhat.com>
 <20260610095712-mutt-send-email-mst@kernel.org>
 <aimEl9QQ_LTRPLtd@x1.local> <20260610121026-mutt-send-email-mst@kernel.org>
 <1e9515c9-7e32-4d95-9b73-aab8bf10bddc@redhat.com>
 <20260611012217-mutt-send-email-mst@kernel.org>
 <3726a607-6cac-41f1-b402-0eed7c4e3fe3@redhat.com>
 <20260611023428-mutt-send-email-mst@kernel.org>
 <0c3f1dba-3b2c-43c5-b181-1426f6da0951@redhat.com>
In-Reply-To: <0c3f1dba-3b2c-43c5-b181-1426f6da0951@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jun 2026 13:48:51 +0100
X-Gm-Features: AVVi8CdkA_O0e4tTX1ZuiWwP5ApvcjMvfT5ewGYi8PdSYO2s37C-Y3yrY1yYGZA
Message-ID: <CAFEAcA8Q9qEaZS8wCpZQ-4jpAnQ9JXvnb7iSeRTdhJ9Y3BcCRg@mail.gmail.com>
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
To: Gavin Shan <gshan@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Pavel Hrdina <phrdina@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, jugraham@redhat.com, 
 shan.gavin@gmail.com, Alex Williamson <alex@shazbot.org>, 
 David Hildenbrand <david@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Thu, 11 Jun 2026 at 13:34, Gavin Shan <gshan@redhat.com> wrote:
>
> Let me try to summarize what I understood. As VFIO is concerned, there
> are multiple memory regions for one particular PCI BAR, and they're stacked
> up. The memory regions for PCI BAR#4 of the GH100 card looks as below.
>
>    (qemu) info mtree
>               :
>    address-space: pci_bridge_pci_mem
>      0000000000000000-ffffffffffffffff (prio 0, container): pci_bridge_pci
>        0000042000000000-0000043fffffffff (prio 1, i/o): 0009:01:00.0 base BAR 4          <---- (1) VFIOBAR::mr
>          0000042000000000-0000043fffffffff (prio 0, i/o): 0009:01:00.0 BAR 4             <---- (2) VFIOBAR::VFIORegion::mem
>            0000042000000000-000004379fffffff (prio 0, ramd): 0009:01:00.0 BAR 4 mmaps[0] <---- (3) VFIOBAR::VFIORegion::VFIOMap::mem
>
>    (1) Its MemoryRegionOps is NULL. No data accesses are routed to this region
>    (2) The data accesses routed to this region is handled by pread() and pwrite()
>    (3) The data accesses routed to this region is handled by memcpy() before
>        commit 4a2e242bbb.
>
> There are identified PCI devices who have quirks, see vfio_bar_quirk_setup().
> Accesses to part of the PCI BAR have to be emulated by the extra IO regions,
> something like below for rtl8168 PCI device, where two extra IO regions are
> stacked up for the quirks.
>
>    address-space: pci_bridge_pci_mem
>      0000000000000000-ffffffffffffffff (prio 0, container): pci_bridge_pci
>        0000042000000000-0000043fffffffff (prio 1, i/o): 0009:01:00.0 base BAR 4          <---- (1) VFIOBAR::mr
>          0000042000000000-0000043fffffffff (prio 0, i/o): 0009:01:00.0 BAR 4             <---- (2) VFIOBAR::VFIORegion::mem
>            0000042000000000-000004379fffffff (prio 0, ramd): 0009:01:00.0 BAR 4 mmaps[0] <---- (3) VFIOBAR::VFIORegion::VFIOMap::mem
>            0000042000000010-0000042000000014 (prio 1, i/o): 0009:01:00.0 BAR 4 quirk[0]  <---- (4) quirk[0]
>            0000042000000018-000004200000001c (prio 1, i/o): 0009:01:00.0 BAR 4 quirk[1]  <---- (5) quirk[1]
>
> Access on 0000042000000010-0000042000000014 should be routed to region (4) quirk[0]
> and access on 0000042000000018-000004200000001c should be routed to region (5) quirk[1].
> However, accesses to 0000042000000000-0000042000000020 are routed to region (3) before
> commit 4a2e242bbb and the data transfer is done by memcpy(), bypassing region (4) and
> (5). It's not the expected behavior and why memcpy() isn't expected on device rtl8168's
> PCI BAR due to the quirks, answering your question.
>
> With commit 4a2e242bbb applied, the accesses will be routed to the correct region.

The way I read 4a2e242bbb's commit message, it isn't about things being routed
to the wrong region. It's about the handling of areas which aren't in the small
quirk regions but which are in the same 4K page as them. These have to
be handled
via the memory subsystem's "subpage" mechanism. This does route
everything to the
correct region, but if the region (3) is marked as "direct access is OK" then
QEMU assumes that any kind of direct access is OK, i.e. this behaves
like true RAM.
It then does a memcpy access to a BAR that's really a bank of device registers,
and this goes wrong.

> Back to our case (GH100 card), there are no quirks for the PCI BAR (0009:01:00.0 BAR 4)
> so it's fine mark the RAM DEVICE region as directly accessible. We perhaps needn't host
> to export the capability (VFIO_REGION_INFO_CAP_DIRECT_ACCESS) suggested by you. It's
> safe to mark any PCI BARs as directly accessible if they have no quirks attached. All
> the devices except those listed in vfio_bar_quirk_setup() are capable of this.

I still feel like there are different kinds of PCI BAR here ("this BAR is
true RAM and can be accessed arbitrarily" vs "this BAR is full of registers
and can't be handled that way") and the vfio code in QEMU needs to set up
the memory regions differently for the two cases. For your example I think
it would be fine to have direct-access even if there were some kind of
quirk memory region, because for the parts of the BAR that aren't covered
by a quirk overlay the underlying BAR still allows "entirely like RAM,
any alignment and size is OK" accesses.

-- PMM

