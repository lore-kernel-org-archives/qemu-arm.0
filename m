Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBDFCCF2C7
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 14:24:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI5Kl-00082F-W4; Sat, 17 Oct 2026 10:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI5Kk-00081x-PS
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 10:24:26 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI5Kj-0004An-22
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 10:24:26 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-8b06c0794cfso7067567b3.0
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 07:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792247064; cv=none;
 d=google.com; s=arc-20260327;
 b=lmRjRszI3TitlLHgX01X3LVRhYkGK8KenCBymshLaUOAWmoHlRDQAQFDJ1yr9Fwuae
 +EDr8RPFuxCGAq2XbMJfdp7Dt4StL+eppKur4yua+vLwC0QR+PXYtZRJO4y08dV9E+2Q
 K0NIrrkEu98zRWtRcyvTAOYdfsIGx0jBLybXZJ4voZw9lpmEynx7Q/DMb61ELgwr7Vnd
 9YIuQ/eaDNSYfhN2/Zk6oKxVVj9XChUbbI3Yl9vGSrECnKB5EdqpJJPvjzxrfSq42eZF
 PyOW9B7hXOkmzAsYqN97X3tMga6powb/4AIvXe6qL/QTFAGWqlGzVNK58IqQ5+kIyyBU
 XHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ieq3MEnIyhgTgRDAHtB/ZzfBeWohs1MqH0Kv9sOpM1U=;
 fh=h91hsNxFjY4/Ag9u/be+H097z5gnDU9itfPTsvZF0lY=;
 b=fFc3D9Vn2jlxV3P2feuPUFGniOJAt3daXq9wTQX/kiASqj/ZQFjFxpHWZJbuy4+hZG
 5W3hZhQ6w3qgWQOGrbw+ui2WNGnx3jbgutdf3tO7H9uhjsLoEkpeIb5JufHVtDo9MhlZ
 Psi4YbKvtCj72L9HfdFaBrBu/iGz1VzYd5KOXldwUiQ/egM5A5gCodnHvLhP3pZPEFM0
 Iyim31B/aSpoTqoxvj2adCI7q7HiCqEB7ZFwzcTQLkDTCIiEeQN4815TkDoN6B0n600C
 tuJbJ+nCA7NwEm/Gu5k5i9lepSyjnzha3poSyUF/KJCYu7uMquRovPrl6tEMgpjjdpjl
 ifSw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792247064; x=1792851864; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ieq3MEnIyhgTgRDAHtB/ZzfBeWohs1MqH0Kv9sOpM1U=;
 b=EDhtaKxfOIMtbvtQmTCC/0I5E7w1CoE8ozmeyIj90qm2oUhzxC84vv4HYFQSyNk26z
 iqq+1yOHfVQ/MRJqAoq6bEZwhof3IoeQ79bMBcIeZr9oDnYoWMjIrQFMxGTeUg2VOgWe
 nw+/p13/vbvE2stk4Wj4K/qCm34RpLM9spJInDXC8iwRgbYTXHIF70baq0HwcE2q6j2p
 RRje6c6xnNjAqpWDSrgioRqoCk+pLEWGzgi7K2sX1G8Mo/ox15fynZx5qLtuUGp/58MD
 IDVNzBxkT4NDlFOGyxlcWr2OQOUp5oPyYjXze+5Yf1jWcCFT0g53WERI2Xnaha5fnpLc
 P17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792247064; x=1792851864;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ieq3MEnIyhgTgRDAHtB/ZzfBeWohs1MqH0Kv9sOpM1U=;
 b=F0SdjmZj9HfJMex1KyUxTcBQzQyBtMtu2VmCvWEa+OpTb1J72ZpCrETnx/bzsP5C7l
 RdXuKpKkuhZGjdLKDKGmQQsNlWAc19NrpjjP+HL/qq5XoZgsj2zSlyQ28D5THltuA7Si
 fKBNI4rkLMS/MCQndW0JABsdG3MOkfnukKJEqY7t7jqkX9xD7eLGen0e7+lEsMC/WenJ
 6BKt/vilVx4fY5PQ8XiYTjjPQ9uPlhYVid7O3j+JY38YY6xRBVItvfrxj3Z4Dq2KJcRY
 CeaFrlipYqYEalm2a9NS/ferzKT7NHASVLJ6yRp/Yl7f167Fok9iZ9IrOwX9+VLdBNMQ
 OTuQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByleJemNk4uJbVRG7BGYJ2afh910RRoGHihUnu5Qz5Y4z90Fx63RksJUJjnAQ/GBHwvV/0phkDPKA==@nongnu.org
X-Gm-Message-State: AFq9FYLfxXq4OG9uSq7SPhIVJe0aLV4QEtNt/shoFYpnYhG202uqeMEm
 018Xh/XnNN0lnJ+KxnePY9ji4gx/O5tKR9WQ0vtKXBWhw0sE4Bks53x2TGCL0Lp19zphW+uKfPR
 pjizkXe13c5O3IU7huhcD3O8SyWpY09zudIscWbE1+A==
X-Gm-Gg: AYBFou2RRVYkrX8DZ9X+g14AlLj8KPkD0rjZEVPpv2d/4mqO6/c/xyru64NK5oKaOGi
 o2SLuMIqd6rsSxMEUCUNRGp86TNgG/bBYp4wJBLgGAYsbIez54JAkmeOfqCTem3DVluipGU5HgL
 XumXdkp3cQDxKv3DXbUlkMWiVINjNCDU4LqktXgk4/aTd11FMrdhbD6Qo9FuFV1UzzDnoPl/9vq
 O90XyCpEeiVMWpH496b5sZj7bDWbyjuQJM/LOjVcl5MNzzV7fEFgOf3eN/gO3tWgK5Q57/jsziL
 JTm8yUw8IoBl5LtihLjl1yrwSCy2rU7dmVVChbm8f89sNnpsJx6tR4Z7nP6J/ERCDxlDYqBDzOs
 2g/m3tTcxpXgr544usvdspaTTHAXTupgyL8eecm4=
X-Received: by 2002:a05:690c:fd2:b0:8b0:ccc3:27d2 with SMTP id
 00721157ae682-8b0f2176552mr11256367b3.29.1792247063433; Sat, 17 Oct 2026
 07:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8qQ-ORtpoD4xsytbqFBOi0+cqE5Bkbv3m6mi+ZXwxm5Q@mail.gmail.com>
 <CAGaQodKNRm54DnrnaS56E7YRYoss=Ts1fEP5oayqik3T3bTd+Q@mail.gmail.com>
In-Reply-To: <CAGaQodKNRm54DnrnaS56E7YRYoss=Ts1fEP5oayqik3T3bTd+Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Oct 2026 15:24:11 +0100
X-Gm-Features: AclHuK9GPrQI8kknDtNH2JGVnSg7NN9PVRcf3lEc_oVa4aCvpimBYjVSyuGLDb4
Message-ID: <CAFEAcA85iTUU=Pf8h-Ojc3jiBbW44V-1XRheVW=JqN-4xNLc=Q@mail.gmail.com>
Subject: Re: Re: [PATCH v3 15/16] docs/system/arm/raspi: move PCIe/GENET from
 missing to implemented
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, philmd@oss.qualcomm.com, 
 pierrick.bouvier@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Sat, 17 Oct 2026 at 14:31, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> On 17 Oct 2026, Peter Maydell wrote:
> >
> > Do you know what's missing for the MSI support to work?
>
> I think it's the controller's built-in MSI receiver, which we don't
> model.
>
> From the Linux driver (drivers/pci/controller/pcie-brcmstb.c): the guest
> programs an MSI target address into PCIE_MISC_MSI_BAR_CONFIG_LO/HI
> (0x4044/0x4048, bit 0 = enable) and the message data into
> PCIE_MISC_MSI_DATA_CONFIG (0x404c). A device's MSI write then goes to
> that target address (0xfffffffc, or 0xffffffffc if the inbound window
> extends above 4GB) with data 0x6540 | vector. The controller is supposed
> to catch that write, set bit <vector> in its MSI_INTR2 block at 0x4500
> (STATUS 0x4500, CLR 0x4508, MASK_SET 0x4510, MASK_CLR 0x4514), and
> assert the second interrupt of the pcie DT node ("msi") towards the GIC.
>
> Right now none of that exists: the MSI_INTR2 registers are plain backing
> bytes in regs[] with no status/clear/mask behaviour, nothing in the PCI
> bus address space claims the target address so the device's write goes
> nowhere, and the "msi" interrupt isn't wired to the GIC.
>
> I think it needs a small doorbell MemoryRegion in the PCI address space
> at the target address, the INTR2 register semantics, and one more SPI --
> on the order of 100-150 lines. I left it out of this series since INTx
> covers what I've needed, but I'm happy to do it as a follow-up if you'd
> like.

So if I understand right this is because the SoC doesn't implement
MSI interrupts by having a GICv3 ITS or a GICv2m, but it does it
in the PCIe controller ? Let's get the base support in before we
think about implementing that. (The aspeed pcie controller also
handles MSI interrupts, so we have some existing code models to
look at if necessary.)

Does the system end up with the "msi_nonbroken" global set to
"false" or "true" ? I think since we don't have a gicv3 or gicv2m
we ought to have it still at its default "false" value, but if it's
false I'm not sure why we need to explicitly turn off MSIs
with msi=off,msix=off.  (This isn't worth spending too much time
investigating, though.)

Anyway for this patch
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

