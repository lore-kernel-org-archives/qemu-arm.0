Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21B6CCF2C7
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 13:08:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI48u-0004iD-Fn; Sat, 17 Oct 2026 09:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI48f-0004fR-5U
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 09:07:54 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI48V-0006ZJ-1T
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 09:07:44 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-8ab37e44643so4843637b3.0
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 06:07:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792242461; cv=none;
 d=google.com; s=arc-20260327;
 b=Q2pQATzgh7FIeMIIfYJObVwbWZ8oCjfsfQzvWKBsgpgd1iJl0vRf/olYgyL2bIBOnW
 fn9vl14c7+NvXtrDL+WfvFiZ6JA5S00yVp3Inyep9nAVN+2Jxd44yGdII3n0AToOEdai
 AM4cHeqr2K+e1R28H3LdmLLQUjiy2NeveX3j8tqugzAb7vkuGEYleCx3NU6btraumykl
 wA7/dxBzo+wlmvjrbANVcTTRCEvQOlwzIPTwsrd41RHzwjacc81XD1qCDGmVvEpBuAHi
 RsM8DTECnKHwcDbpmP+OW+Y4n0JOl4nPvwGltrgJ6LvlHvplndEIv5Rqasd9K442y2sT
 7mjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=gmiTC2ovd1haOAXnrjVhMpjmF2lXclW91wqNhe8idaE=;
 fh=3qukabu/o6wpsikF/KTxAQ2ISWV3FWh0iQaTGAezOE8=;
 b=XWz6bprbC1y+vIWtU9e2fvqBz0T8rW9xWFMRWqea93imFmAG2B0c29dtNXF+lNrfqm
 jIewEK2JtKf7J9j2QLPqsbjFwJkVQxIIZA+IETUNn+yJlb+M5uB/iZmwH5RzRIqwXCFC
 ovsfmoCW6gGANEZGa4efrU+ut5cOkvNxod0wNcG8QAv6Tr1q7zC+npHsj1AFVajz+/5y
 j7CxwEE0CazLn88k0PTyyE5e0FhAVIu8nx3rBn3rab4k7c4o832kvr5OT86Cc9+lzFPg
 I2eEFC8VOQbSovEJrOHzaqDv2HVP276GpY7ECWtUOG5QcMROGvjVWDAgdCWctW1k3kMj
 MZyA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792242461; x=1792847261; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=gmiTC2ovd1haOAXnrjVhMpjmF2lXclW91wqNhe8idaE=;
 b=NV8n1sNqd5cxOf2seg7/NJD8P13/kJ6q5qMKzuvK3J9AOwbnHmZkLJiOJBzwET3qlq
 nOf1NzR0KlsPCBIvEVdkwBQCn2yyJRHUeBKR1jnLq6nJNwEA68GqtsQFWb2dFKe7KQZ5
 tQpg5IhI/2bw++ur4lpg3YdW5fUQsz79Able7Ma8rFqZIo00Z2aNAFTMD1jKuT1pZjz2
 dLzn0HLb4ao04oIFRuxGzTyhE/bkPF66Mn+2tKjuggSiJ/2yQk9FLfH+LEBFxunhmMdj
 oLtgfpWhqBVzGWtpVc/2qjVnA8ZrCTPSCI9DqjisQ3lXM9iyzgOdd9llwk6BM7L/PA58
 NEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792242461; x=1792847261;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=gmiTC2ovd1haOAXnrjVhMpjmF2lXclW91wqNhe8idaE=;
 b=xBP65RSX6SgU7ghwRAV3MPXmpRNHdQ/M+w8L+oKj/02zaX7CmqABHeI3x31/iGPxUn
 odAj9N41whkeFECLUjC4xgLn21dUVdah2+0bo9oJeJmD/xoC8lSFbqZUQwiWNITzEENX
 7x6xg5fd7Xr1L+J6iBUtb2wuXACaSaHyddg+9/bKha1exiU3oa/zFQgN/e/Mf3+jKr+c
 Q11bXHh8+IZY2Sr6CgtGUjEYQoEPTbSkYUEMR76iTAJH4JDnV5+JGUHRZWpthxv7R/1A
 XwNjivlKHceCgt04jf7J4yBoAC0q+EoWBb25JljpgZGezeqyrPt3tmjLq6cBnl5NiEKX
 sSYg==
X-Forwarded-Encrypted: i=1;
 AKwUvBy/Z345cNN4reuHvXXeLtDI+MEpOsRYgn79Jk4UiV2Bfl2ttEc/TetX9TPMv1/YGmOffumWlgF/4g==@nongnu.org
X-Gm-Message-State: AFq9FYIbM7n8y5sZVq8wFxgX2OV4YhlGtdtdnwaiv2EUdwrLaNs+Myvg
 8yrc4ArdbV7QS20ZUsjgnLnqXt7GsgxUM4sJkqggu6Hi/kQkUxRwALNhIjYiN5DoQbv6vVyJT/k
 gxKkLPXeoIA/05VI5f2JP6yuZu9DKYEppeIJrEYKqaw==
X-Gm-Gg: AYBFou01KXS3cR93uGFfJBczrRFOLvDhqTh0x7bjsZCevu9CRlz26pWiH4IhcImCi0g
 HQ/uGwla0TOQLAJ6DApq5MQLpWFVfgOto/EyLBAJaOBibp1cLVjcl6/iusANHx9XLSAvRWlMNkN
 mOSWqhp1DaR2GYSGSg9lAnJKGMlyeHf5pKPWxasQHGkiBBZaabAcjZ+/D/zBBEcFMIxpWamI7Ql
 tDcDTi5HgOOWnqnuG8oNR8XTtOBqNRe3kxmz79TeiJvcx8QL+ERKDrHAIwblFN93X4dfGpUs/1C
 g5N3fLAiHN6HEZMK8wJzz8SlQjiZVC0Fx+gsnVbAHaFiny/jhkwaOThaLA9x+4RtqF5PFhLZUFY
 HPJFQq1wAz0Dxq5RZNqli/CzBY2O1eZHvxXOGVS8=
X-Received: by 2002:a05:690c:348a:b0:89a:63da:fab2 with SMTP id
 00721157ae682-8b0f2433c1dmr9391057b3.109.1792242461296; Sat, 17 Oct 2026
 06:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <20261015181122.60608-1-marcelomanzo@gmail.com>
 <20261015181122.60608-3-marcelomanzo@gmail.com>
In-Reply-To: <20261015181122.60608-3-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Oct 2026 14:07:29 +0100
X-Gm-Features: AclHuK_o_kC6Ybzm-ij6RkeeMdvqbPyCIBbx1uZ08x_m1GRYzgIfvCT2WANZdzc
Message-ID: <CAFEAcA9rc=7CYSeq1AL240WjO47=t_1OJDEnfD_FU0NkHKUM-g@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] hw/arm/bcm2838_pcie: add BCM2838 PCIe host
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Thu, 15 Oct 2026 at 19:11, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> Add the BCM2838 PCIe host bridge model: config space, MMIO window,
> and register access for the root port.
>
> Per Peter Maydell's review of a later follow-up series, fold in what
> was originally a separate bugfix here, since this device isn't in
> upstream git yet and the bug was in code this patch itself introduces.
> Four defects fixed, all on the enumeration path (none of this was
> exercised until a later patch actually attaches a PCI device):
>
> 1. bcm2838_pcie_host_read/write computed
>    "offset - PCIE_CONFIG_SPACE_SIZE" on an unsigned hwaddr, which
>    underflows for every offset below 4KB. The root port's own config
>    space -- including vendor/device ID at offset 0 -- therefore always
>    fell into the out-of-range branch and read back as all-ones, i.e.
>    "no device present", so the guest stopped scanning immediately.
>
> 2. pcie_host_mmcfg_init() was never called, yet both accessors
>    dereference pcie_hb->mmio.ops to service EXT_CFG_DATA. Once (1) was
>    fixed and the guest actually reached that path, it touched an
>    uninitialised MemoryRegion.
>
> 3. The root port overrode PCIDeviceClass::config_read/config_write with
>    plain pci_default_*_config(). That bypasses rp_write_config() ->
>    pci_bridge_write_config(), so programming the bridge's memory window
>    never updated the bridge's address space and BARs behind the root
>    port stayed unreachable. Drop the overrides and dispatch through
>    pci_host_config_{read,write}_common() so the device's real handlers
>    run.
>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>

> +static uint64_t bcm2838_pcie_host_read(void *opaque, hwaddr offset,
> +                                       unsigned size) {
> +    hwaddr mmcfg_addr;
> +    uint64_t value = ~0;
> +    BCM2838PcieHostState *s = opaque;
> +    PCIExpressHost *pcie_hb = PCIE_HOST_BRIDGE(s);
> +    uint8_t *root_regs = s->root_port.regs;
> +    uint32_t *cfg_idx = (uint32_t *)(root_regs + BCM2838_PCIE_EXT_CFG_INDEX
> +                                     - PCIE_CONFIG_SPACE_SIZE);

I think these read and write functions have endianness issues.
In a read/write function the values are host-order, but we are
updating the regs[] array by simple memcpy(), which means that
on a big-endian host the guest will see the wrong thing if it
writes as 32-bits and then reads back as 8-bits.

You probably want to define that the regs[] array is bytes
to be treated as little-endian order, and then use
ldn_le_p()/stn_le_p() to write an arbitrary sized value into
it, or lduw_le_p()/stw_le_p() for fixed-sized accesses, etc.
(pci.h wraps the latter into pci_{set,get}_{word,long,...}
accessors for this kind of "access config space" purpose, but
has no equivalent wrapper of the ldn/stn fns for "N byte access".)

> +
> +    if (offset < PCIE_CONFIG_SPACE_SIZE) {
> +        /*
> +         * The first 4KB of the window is the root port's own PCI config
> +         * space (vendor/device ID, BARs, capabilities). Serve it from the
> +         * real PCIDevice, not from the raw regs[] shadow buffer, which is
> +         * only backing store for the controller registers above 4KB.
> +         */
> +        value = pci_host_config_read_common(PCI_DEVICE(&s->root_port),
> +                                            offset, PCIE_CONFIG_SPACE_SIZE,
> +                                            size);
> +    } else if (offset - PCIE_CONFIG_SPACE_SIZE + size
> +               <= sizeof(s->root_port.regs)) {
> +        switch (offset) {
> +        case BCM2838_PCIE_EXT_CFG_DATA
> +            ... BCM2838_PCIE_EXT_CFG_DATA + PCIE_CONFIG_SPACE_SIZE - 1:
> +            mmcfg_addr = *cfg_idx
> +                | PCIE_MMCFG_CONFOFFSET(offset - BCM2838_PCIE_EXT_CFG_DATA);
> +            value = pcie_hb->mmio.ops->read(opaque, mmcfg_addr, size);
> +            break;
> +        default:
> +            memcpy(&value, root_regs + offset - PCIE_CONFIG_SPACE_SIZE, size);
> +        }
> +    } else {
> +        qemu_log_mask(
> +            LOG_GUEST_ERROR,
> +            "%s: out-of-range access, %u bytes @ offset 0x%04" PRIx64 "\n",
> +            __func__, size, offset);
> +    }
> +
> +    trace_bcm2838_pcie_host_read(size, offset, value);
> +    return value;
> +}

> +static PCIINTxRoute bcm2838_pcie_host_route_intx_pin_to_irq(void *opaque,
> +                                                            int pin)
> +{
> +    PCIINTxRoute route;
> +    BCM2838PcieHostState *s = opaque;
> +
> +    route.irq = s->irq_num[pin];
> +    route.mode = route.irq < 0 ? PCI_INTX_DISABLED : PCI_INTX_ENABLED;
> +
> +    return route;
> +}

It's not clear to me if we need this -- most PCI controllers don't
seem to call pci_bus_set_route_irq_fn(). I have a feeling this is
only relevant for PCI passthrough. Eric, do you know ?

thanks
-- PMM

