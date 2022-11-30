Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1167072ejx;
        Wed, 30 Nov 2022 04:27:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4B2L7GBJiie9S5SQmVWbOII1PwcblJ80CkgapUoJHceKI2lQCAkK5tM979tYA2nyz/AL1A
X-Received: by 2002:ac8:764b:0:b0:3a4:f45e:fb12 with SMTP id i11-20020ac8764b000000b003a4f45efb12mr57100654qtr.462.1669811266279;
        Wed, 30 Nov 2022 04:27:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669811266; cv=none;
        d=google.com; s=arc-20160816;
        b=d+kZwEllV/dEg5DCuA/nnM/qgpQRNm2/tMm9mB88l/Kt/+QChD21vbZWpFyyIxr4/4
         uauuSJb2fpuHBt8Uy34uwlBmEu9syBm1fUclQo7FhfVF0YRHIcAX1avdfxJMe4tRNPj7
         fL4cG89lP3xJ4urbJaLxcBnp0f+y+vFckzLJJTmRmCixUOMuFflSNl4gvFd362PAZUZI
         zObY9iuxE8jo5iHX6Az0U+Tq1p+HxhigCoT13BETSAlvsT8qv/f+aadZcx4mQBIyJoiq
         wd9cXb6QzFsgRArExgM0eTZPCc8W3XbNDVSbET2GNvUhv2xvgCIuu5ssGEsKCn/WypcS
         GB0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=W1I1E2iT1+JKOXqcl57Z9EGt3zZ+m8Rf45KNpkzA5VM=;
        b=Io2RrroobzLkClFj7VHaUhl9iiHFFaqOAUBKrEFvUfEAFlOOcsRHmbrYZ/8t57U341
         UEKg6F0BFFOGosOLsAxnUdwpISe2C37oGPKOteAECqZl6huCw+C7+/TgrcZqA5vDD+RY
         5SM7seEzuUBYOjyazR33oQ9Nakx3gWrU051rPxLDWviZknjNFKrqgU+89RMLWd5gJD/R
         0T+V036w2n3QNr8y6iauS33Gg09Y5wybuElOBWnxowKSQ7siIXnlxIXNvAsokbrCXHrk
         2yTk5oToFd18NEo0bdEF8daIehRJt6N1C/qyvBPXntyhjhyDOG2HI/aJ2936vrSIP3px
         S8MA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ik9NVAaX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z201-20020a3765d2000000b006fb4b8a711asi625570qkb.448.2022.11.30.04.27.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Nov 2022 04:27:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ik9NVAaX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0MBg-000202-Q3; Wed, 30 Nov 2022 07:27:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0MBe-0001yq-6F
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 07:27:38 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0MBc-00038z-HL
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 07:27:37 -0500
Received: by mail-pg1-x531.google.com with SMTP id f3so15907314pgc.2
 for <qemu-arm@nongnu.org>; Wed, 30 Nov 2022 04:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W1I1E2iT1+JKOXqcl57Z9EGt3zZ+m8Rf45KNpkzA5VM=;
 b=ik9NVAaX2DGfGRqnErPK0VWejFTsgwpXr38kGtaNmIN8NQR99Mol72nLAYDLeS/ENs
 SKOOCSbl/myBAJPLEFemK5pmGsJP1ZPeO9/qAd/hGaKTbsnI0qHhGoCVOVpEv6YUpAUi
 QhFJh6BzPatx2JhF8zRbCSovpFLwQeI03TTo7EUAGazj3yB3DdwPJL+z3XmA5Jx7QNI7
 f2SgF+mtgvzMrJed3a21K4iCc6A9DhHx7kJALLHgqenbkjemuSPzxk3jz6qH6VN0jmEn
 tH50TLvxacyzVQC8Dj59FWMwSDGBKpFaKu80ZhrEcjZmjj3GqmKHH0bKXovsDdfhFTu8
 BNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W1I1E2iT1+JKOXqcl57Z9EGt3zZ+m8Rf45KNpkzA5VM=;
 b=XCrL34q5JNZcd9cbxKK+BW9LHjN1RgDkmJybzxM38oINMREzXRE2eOGOqBPa9+6mk2
 qc/o0j25eQbF/OZRaGTLtQ2JJWza0Y7YjOQf7AvRY44v08fevamcyySNJKNNWaoA68SI
 SVwOKqxzVQUptmNXZukLtbzcJXf7/7EpPRwxpXUvmnAg/1DauQdL4EShNtT6P/OfYTju
 MmVqBSrrB8m3R/t1qsvr5D+cIrPUugWxjDwSENAdk33b2bmNEy5kZWt+51W+SE0oIQn4
 /tx9NQe0J27fzqBsmpcnUL2BZJM0Erex1Tm/SezCKSMZWy3L+ATszSt0P/uYkmVtwUfL
 MNUA==
X-Gm-Message-State: ANoB5pkCSHIVuULJd2mWSYCmM3olQ4Yd9UnHcHzxmJH/nmrZNetnqgDX
 +txScS8FXM6+FE2lpME+pUEkVVigVrGWGtk8g2uX0w==
X-Received: by 2002:a65:45c5:0:b0:46b:2753:2a60 with SMTP id
 m5-20020a6545c5000000b0046b27532a60mr38483621pgr.192.1669811254948; Wed, 30
 Nov 2022 04:27:34 -0800 (PST)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-6-jean-philippe@linaro.org>
 <CAFEAcA9EqYi0LdXtz84_-8r1L3DUNWdnNL4LTHrm0n4cub4ejQ@mail.gmail.com>
 <CAL_JsqK+NngZMheR7zR2oTVmgNFKKUhZtOAys=NmPQK_FdSq_A@mail.gmail.com>
In-Reply-To: <CAL_JsqK+NngZMheR7zR2oTVmgNFKKUhZtOAys=NmPQK_FdSq_A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 Nov 2022 12:27:23 +0000
Message-ID: <CAFEAcA_t2hRPLcG-dyg4U5EzBX16FWWRzqMGy=ovnQpC1iB6Vg@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] hw/arm/virt: Fix devicetree warnings about the
 GPIO node
To: Rob Herring <robh@kernel.org>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YYSJST3oLTQa

On Tue, 29 Nov 2022 at 20:56, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Sep 27, 2022 at 6:25 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Tue, 27 Sept 2022 at 11:12, Jean-Philippe Brucker
> > <jean-philippe@linaro.org> wrote:
> > >
> > > Since the pl061 device can be used as interrupt controller, its node
> > > should contain "interrupt-controller" and "#interrupt-cells" properties.
> >
> > It *can* be, but this PL061 is *not* an interrupt controller.
> > I don't see any reason why we should claim so in the DT.
>
> Taking another look, it is an interrupt controller. The GPIOs are
> connected to the 'gpio-keys' node which is interrupt based (there's a
> polled version too). That binding happens to be pretty lax and allows
> the GPIO to be specified either with 'gpios' or 'interrupts' property.
> The Linux PL061 driver happens to work only because it always
> registers an interrupt controller regardless of having
> "interrupt-controller" and "#interrupt-cells" properties or not.

No, it really isn't an interrupt controller. The interrupt controller
in this system is the GIC. The PL061 is a GPIO controller. It *has*
an interrupt line, which it connects to the GIC, but that doesn't make
it an interrupt controller any more than it makes a UART an interrupt
controller. It just means you can use the GPIOs in either a polled
or an interrupt-driven mode, same as you can use a PL011 UART in
either polled or interrupt-driven mode. And the guest knows it
can do that because we've told it "this is a PL061" and that's part
of the PL061's functionality.

The gpio-keys stuff is just "here is a wire which is tracking
the state of an emulated power button". This isn't an interrupt,
it's just a wire that has some status the guest probably
cares about.

The second PL061 which this bit of dtb-generation code also
applies to happens to currently be being used purely for
output GPIOs, so calling that one an interrupt controller
makes even less sense.

thanks
-- PMM
