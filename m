Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5188006lfp;
        Tue, 11 Feb 2020 07:01:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqyL0a5nQCT+YUFDZ5do+RWjgx9GOkj03KwX6WWVWIMaiDK26kueBws+xHbZ2EO8jlyvtDhG
X-Received: by 2002:ac8:1308:: with SMTP id e8mr2835318qtj.242.1581433287408;
        Tue, 11 Feb 2020 07:01:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581433287; cv=none;
        d=google.com; s=arc-20160816;
        b=wBe5V7ivSxMLfVP7xs8z/d2SN5Laf17S7M1FgiwU82//n6x1WUjI85iatRziVrfTm6
         ssn7rgNxotjUIYLv7NlmpFx118KYtdUFSkpRTGOOXfPAW3VHmkrwyn9uv30R2qRoFQvw
         PMJxiFQveRIid3PnEsOkMxABxXjfgO38Ljx8WhtfsLk4pPw3inwIVfXvxTjcHg6RSmwo
         rwYSY2ZFuTHyc97uRsDO01VC0YmYJW2XvdxDaFrksKdYaKMzipG3h4DwTxA+LHGOgcVL
         26E/w1ZLzrEetGYRog74G9XMRA1FYlvz+7fEF8ICFpo3TkrH8yPPYHncIdc/r41bneNK
         /UHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dg1ZntJ0odfx180IJjC55r3FJw7O0CbXboN/z9izZtg=;
        b=k6vIU1eFeWnuvPa1Fj5sNSnnTwFlKJ64IKkkJBYerpe46kiukvoHJA6HfDJITjY4xb
         rlgWLIYPz/+/n0/heKhnLPQisPO0UtCuFY9hmsLCZdQ/SPYPGUAX2oNpUZu+HPtKeRLC
         rWFzEIFXs2x5LksqUxEX+UetdWhcI8GeuPJqIIlix1wYUldubzP/zjCmCPYkzaj37tPU
         hMm/n4EmAMfiaRMlhEu3zzl2UPLuVLKRTRWR4Drv6kBiJsYgCwiiSRvu6yA7jfgDq1Et
         xgkMIlRs4DoFnIW9cOOPP6AndF0FN8CN+9N28YPWeb9LM8oJ+o05763YP9WPfS/rFIp9
         RGPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ZbWY/js4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v78si2051191qkb.58.2020.02.11.07.01.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 07:01:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ZbWY/js4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1X2U-0002Sw-PP
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 10:01:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33366)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1X2I-0002Qc-5d
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 10:01:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1X2D-0001NR-0w
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 10:01:13 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:33093)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1X2C-0001LF-Pw
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 10:01:08 -0500
Received: by mail-ot1-x343.google.com with SMTP id b18so10392841otp.0
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 07:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dg1ZntJ0odfx180IJjC55r3FJw7O0CbXboN/z9izZtg=;
 b=ZbWY/js4jQMacsZFsWv5G8TNEnWVvuqzuppI+3TcFBeV1KCNpdBuhVAbLu31Ggj4Uo
 5PmODA4bBODolEJgisU3YhsHTMPgl/ri97q4DTDn9nlP1liNT7UpDwTio16Tdh5JNmpU
 Ady9znQl1ukSO+zIe2foezD+PEwZkeHsNbvFZBLcCSmu6mlc0xYHXTcTD8xgbV9vCzyS
 +5JK84rAGqx0/Hu1m2hbJCaPVoS/ijCcdO1K6EnhwabrPy8aZxw5NdlUakaw0XJ0EoIO
 keSN67J5pYE08mpVp3isdYySI6sSBKxR4UviIoTimUA4BATSHUo2HLhGk72lRzRN80Ht
 IRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dg1ZntJ0odfx180IJjC55r3FJw7O0CbXboN/z9izZtg=;
 b=gCOAKwru8W/X1/jRLZfeBwfxXl0qmxBxdVdjF7AZzpO4o2DJV6E8PEWUi71KKg7cF+
 0AsDuiWB00o60FmWO+SRUsSNsmmtEZdyDuFpWpdavbQ/vPmziYrBEWOr5h7jqAvUf+wF
 XeoCgQuWmx4w/MjLy9UTAui3BOIHHg0L/MsYdcWvK89GjHU0IFAozF1TXALQRiU7w380
 vehl6PSy43Ryu1BRT5RTMcCephblpzrFlYZy0lUe06+M5d1U24cZ+FQuEeSlnLEh7zth
 ZVHqr/W8Y/OaSb3SOsPGXkmYYzn0n1/C2dNDsEd+fu99JcheQVJQZL3njZB8LBTqo3hO
 7+CA==
X-Gm-Message-State: APjAAAVbHHN5gEazU8AAYwExNxEkfMpU7hdlaqbW/jLrwy/AE+Y0FpRl
 aTlcPuisqzZsTTYkdQY/3k8R4OpzqdyNuKeAX8gVnw==
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr5186494otq.97.1581433267780; 
 Tue, 11 Feb 2020 07:01:07 -0800 (PST)
MIME-Version: 1.0
References: <20200208120022.1920-1-eric.auger@redhat.com>
 <20200208120022.1920-9-eric.auger@redhat.com>
In-Reply-To: <20200208120022.1920-9-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Feb 2020 15:00:56 +0000
Message-ID: <CAFEAcA-n97LKaQo9haLdEv+c7k8QkK=LegP_gORr9z4WrBU2Ww@mail.gmail.com>
Subject: Re: [PATCH v15 8/9] hw/arm/virt: Add the virtio-iommu device tree
 mappings
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: jean-philippe@linaro.org, "Tian, Kevin" <kevin.tian@intel.com>,
 tnowicki@marvell.com, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 bharatb.linux@gmail.com, qemu-arm <qemu-arm@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2KP8sSJhItfq

On Sat, 8 Feb 2020 at 12:01, Eric Auger <eric.auger@redhat.com> wrote:
>
> Adds the "virtio,pci-iommu" node in the host bridge node and
> the RID mapping, excluding the IOMMU RID.
>
> This is done in the virtio-iommu-pci hotplug handler which
> gets called only if no firmware is loaded or if -no-acpi is
> passed on the command line. As non DT integration is
> not yet supported by the kernel we must make sure we
> are in DT mode. This limitation will be removed as soon
> as the topology description feature gets supported.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> +static void create_virtio_iommu(VirtMachineState *vms, Error **errp)
> +{
> +    const char compat[] = "virtio,pci-iommu";
> +    uint16_t bdf = vms->virtio_iommu_bdf;
> +    char *node;
> +
> +    vms->iommu_phandle = qemu_fdt_alloc_phandle(vms->fdt);
> +
> +    node = g_strdup_printf("%s/virtio_iommu@%d", vms->pciehb_nodename, bdf);
> +    qemu_fdt_add_subnode(vms->fdt, node);
> +    qemu_fdt_setprop(vms->fdt, node, "compatible", compat, sizeof(compat));
> +    qemu_fdt_setprop_sized_cells(vms->fdt, node, "reg",
> +                                 1, bdf << 8, 1, 0, 1, 0,
> +                                 1, 0, 1, 0);
> +
> +    qemu_fdt_setprop_cell(vms->fdt, node, "#iommu-cells", 1);
> +    qemu_fdt_setprop_cell(vms->fdt, node, "phandle", vms->iommu_phandle);
> +    g_free(node);
> +
> +    qemu_fdt_setprop_cells(vms->fdt, vms->pciehb_nodename, "iommu-map",
> +                           0x0, vms->iommu_phandle, 0x0, bdf,
> +                           bdf + 1, vms->iommu_phandle, bdf + 1, 0xffff - bdf);
> +}

This function name implies that we're creating the IOMMU device
here (which would be a weird thing to do in a hotplug callback
for some other device), but it looks like we're only adding
device tree nodes ?

Given that we write the FDT blob into the guest RAM on bootup,
how does making changes to it here on hotplug (which I assume
to be 'after boot, whenever the user hot-plugs something') work?

thanks
-- PMM
