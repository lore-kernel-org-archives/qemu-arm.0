Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2902838ejm;
        Mon, 24 Apr 2023 08:46:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350beyhUZf8O3yALxXcKOuW1d92FxLaqcw+08A6wB0F5s6LgMQVyqVCkXHtQN97aFopFHT08z
X-Received: by 2002:a05:622a:1106:b0:3bd:1a8a:8015 with SMTP id e6-20020a05622a110600b003bd1a8a8015mr25384727qty.16.1682351181821;
        Mon, 24 Apr 2023 08:46:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682351181; cv=none;
        d=google.com; s=arc-20160816;
        b=b5AqBiMAbm21Cyvia01BaHhHnH89Ddh/1FStD/z32UGMtKY1uLFMYcexy5m37a0Bi7
         3VNC3ljMMGR+Q+nk0SwcJIeX2IJJGgwtbD2tWQbjSjhsd6nT9hvbZ/QjCNilKAT073O9
         ac8TIo7PCbo/Atv7UafF5eCJ2gZtSu/TnXPV7eI9yQWMaPosDKUDTQbYhxWTmDEfVtKt
         +EHyb5IEIh6A3spP3MCdgD1Za8GiTQVhiRGc/6O+rZYmzHozkOkxh0SA/w0AArcoyk2J
         +e1dNgabeDIDH1q/7ZvwBKQJT0SBaVyVSbmNRY1ya8nLq1SlC5hBpnSYxLTOojonQYzG
         RACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qZEnce03Wb3am1843wXiyIal5RVICiQ57sSNrOTXOOY=;
        b=q+fZAecIvEdmszQwvi6qGkdoeMMiwYLsWv/A9w2mAeZKoN6Wrax4I9coV5rtjmCope
         JsK6SDI0IegLAB41eddcJ/tSbO9dRutPTN6vrgNWDFwVSWghf494f8zCXPQLbVZtx7uY
         +mIy1LQM0t/YLCOAST1uiz0cxni+zTN3ui2bTSzLyoUntZxYePpIcHDXHW9fMgRT/lbz
         tcmQB5Dzkma0oL4PBIGthec9XkhLi/D/Jb7evHkqrKrHEKVdYmLew6oqjYrNQ+24qezL
         5wFUs2net8nQApCQneguEmUfwhHz9nPAfQVs/CUs5euG/aY+Ibg1n+zzt/L72GNXCmW6
         L8+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R5LcA6oq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v39-20020a05622a18a700b003a55b624080si7456089qtc.48.2023.04.24.08.46.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Apr 2023 08:46:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R5LcA6oq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqyOD-0005N8-TW; Mon, 24 Apr 2023 11:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqyOC-0005Mv-Lm
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 11:46:04 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqyO9-0003JN-J8
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 11:46:04 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-506c04dd879so7929723a12.3
 for <qemu-arm@nongnu.org>; Mon, 24 Apr 2023 08:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682351159; x=1684943159;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qZEnce03Wb3am1843wXiyIal5RVICiQ57sSNrOTXOOY=;
 b=R5LcA6oqsfMO4AaVWgca6jDcRCJ4nMktBlRVoB7Nx3Pm1kX2TRBwY3rp/FF70PY9Gp
 3UMXHyQFpblOckYnWRPnc7yCT5FrccpiiPRISfyB6lpmqjj+ue59Ko/ky3LuGscFAlLF
 KB+HYe4OfsXt3bVwigL4EpQYonUZNO8SsQks3zmkrUQ03/L+SFM000uYdHcey8ASrsVI
 lNwtagB9nGmD4v5IFh3XI8NG1UpKeSaIdRpLDLWyOJw3ZDcT9OUwNH19lv5OV7JAKYdJ
 y56V3U/bePu/BjK98q+t1k43fE11Ad3PipeOhEtABtgPH6kmQaHpjgDW8DocYSUhdaPv
 z53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682351159; x=1684943159;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qZEnce03Wb3am1843wXiyIal5RVICiQ57sSNrOTXOOY=;
 b=mGut1evoTUu1BBBg4+8gY9fhCiXbVrMfqHxDqGans4laTdLxnl11IKA4lwwrSx0/In
 XXXQQokWn8UXySvZ3qBcRFHKRz8dktHwC98FYgR9HZo5BtwoModX+V0bRSNbcG50mFnP
 RqywtJaOSFV/bg3seBoqVokr7LDzvMXi2Q7uw3lEzrH9FvZTAg+LJy+QwnHlw6nVYIKq
 +b7fr54Va1DSVm31+SjftZmGisa2w0YYXMzwEByB3HTXKWwMUpFDYxBWxqUbf7l/obMa
 2TeoZZZqnKzoVYosGi4OnCT6EGl6UN9rQBMKZxK4jBkubd0utiss35CT0OQNmEps8Pla
 WdvA==
X-Gm-Message-State: AAQBX9cKOJn1wJRex9A6tytD3+2XiwzBiabziPqKlsYieDOWOFDCEtOA
 JzZAwbVIEXMeI56VLHvIdsAiNAHfxt5eZHsh9KF60g==
X-Received: by 2002:a50:fb97:0:b0:508:4ecf:2407 with SMTP id
 e23-20020a50fb97000000b005084ecf2407mr12936792edq.14.1682351159383; Mon, 24
 Apr 2023 08:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230421165037.2506-1-Jonathan.Cameron@huawei.com>
 <CAFEAcA_DB=nNdiMRwn02mUAATKLvV0Nzs2dCYaM+2fwitac5sg@mail.gmail.com>
 <20230424164058.00000a3d@Huawei.com>
In-Reply-To: <20230424164058.00000a3d@Huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Apr 2023 16:45:48 +0100
Message-ID: <CAFEAcA_2JP=cM-SCGVhnhnP_6zYr748=A=G=Sh+BH+gkFmwnZA@mail.gmail.com>
Subject: Re: [RFC] hw/arm/virt: Provide DT binding generation for PCI eXpander
 Bridges
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Fan Ni <fan.ni@samsung.com>, linuxarm@huawei.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /oKiRHXur9JD

On Mon, 24 Apr 2023 at 16:41, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Mon, 24 Apr 2023 10:28:30 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > So, not knowing anything about CXL, my naive question is:
> > this is PCI, why can't we handle it the way we handle everything
> > else PCI, i.e. present the PCI controller in the DTB and it's
> > the guest kernel's job to probe, enumerate, etc whatever it wants ?
>
> Absolutely the kernel will still do the enumeration.  But there's a problem
> - it won't always work, unless there is 'enough room'.
>
> If the aim is to do it in a similar fashion to how PCI Expander Bridges (PXB)
> are handled today with ACPI (we could look at doing something different of course)
>
> We have one set of memory windows for assigning PCI bars into etc. In the model
> used for PXB, that set of resources is shared between different host bridges
> including the main one (each one has separate DT description).
>
> So for virt, VIRT_PCIE_MMIO, VIRT_PCIE_IO, VIRT_PCIE_ECAM, VIRT_HIGH_PCIE_ECAM
> and VIRT_HIGH_PCIE_MMIO are split up between the host bridges.
> Each host bridge has it's own DT description.
>
> For ACPI, how to split up available memory windows up depends on the requirements
> of the PCIe devices below the host bridges.  For ACPI we 'know' the answer
> as to what is required at the point of creating the description because EDK2
> did the work for us.  For DT we currently don't.  What to do about that is the
> question this RFC tries to address.
>
> In theory we could change the kernel to support enumerating PXB instances, but
> that's a very different model from today where they are just 'standard'
> host bridges, using the generic bindings for ACPI (and after this patch for DT).

On the other hand, having QEMU enumerate PCI devices is *also* a
very different model from today, where we assume that the guest
code is the one that is going to deal with enumerating PCI devices.
To my mind one of the major advantages of PCI is exactly that it
is entirely probeable and discoverable, so that there is no need
for the dtb to include a lot of information that the kernel can
find out for itself by directly asking the hardware...

thanks
-- PMM
