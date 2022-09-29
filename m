Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1184023ocs;
        Thu, 29 Sep 2022 10:38:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6R0KxezctwuwnHI0ERI1/Yb5X1JZBi4347oo78WZUfFjTRYCYj/6LSrGA6LA6DPo3pS9cg
X-Received: by 2002:ac8:5b06:0:b0:35c:e066:b967 with SMTP id m6-20020ac85b06000000b0035ce066b967mr3431053qtw.233.1664473083489;
        Thu, 29 Sep 2022 10:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664473083; cv=none;
        d=google.com; s=arc-20160816;
        b=i5hkzW/OpXzKEcktIN063F7cUUxfRPsIYvT3mo2PEcp92atRq2SijdcoWJkQmRyizf
         RPuFFSYyrF76nDh5xID3CYMgLhbtpo6WzTe1IP4XRIACHfLH7BloZAaDYKmxzNpWzQOS
         Og/3Xkn959tT6SSnMpF6FyhGPApkSScdqXieZQF3yiIIuofQ4rSLx0NP+mfPhlpq4DQf
         T2FJeBKPjzNEEItsg80u667rk4VvK1HhH4JiCGd0EmMXzhoLTs4EeV7qo/+zdK9vAToq
         K92nid9hcQC/eOB5q6SD+cd86DPAzPxI+7iPrME7dJxk8k7Pyp0RHNvpXuAzJ9sQ0Z/w
         Hm4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cqQBTOYNa/mf3P3HSzg6fb00V0GJS8bk5eliMmLjCBU=;
        b=KURYKCfIYnI+IZPhTHkM04pR3h2u0VPWX2Tr2apXV0Y78GyCyaW9o3BOlq47N9Jgi4
         eX6b+aYIeceNqf8R93COTSqmrss7Qr33WAHAjDvlPJddtKB/IG/mGx6F4W7pXnhSZ20v
         OgsRXjr70rReCzTX2A7o7wOOYVCkhUrBJZTqjlohVfLeUtVtgOjn7GotSJaYjFNZmYO+
         kdAlR2iXFMJ8tjpta0OII5Cz6Ic6/r3V7h0RZeMHsorCVw0UxHm+VXfdur3fQdbMb4wJ
         m29vfvQxspbLYSXxoc6VtEl8GanmdDA3NKfbsMTnCuCZxSua9ikgV5NWmLM40Xl6Fwnt
         vFIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ybP3VqQF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12-20020a05620a080c00b006ce4019cee5si1292323qks.496.2022.09.29.10.38.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Sep 2022 10:38:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ybP3VqQF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odxU3-00046Z-0n
	for alex.bennee@linaro.org; Thu, 29 Sep 2022 13:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odwn9-0003n5-BT
 for qemu-arm@nongnu.org; Thu, 29 Sep 2022 12:53:44 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:42659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odwn6-0006xV-SM
 for qemu-arm@nongnu.org; Thu, 29 Sep 2022 12:53:42 -0400
Received: by mail-ej1-x633.google.com with SMTP id sb3so4021439ejb.9
 for <qemu-arm@nongnu.org>; Thu, 29 Sep 2022 09:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=cqQBTOYNa/mf3P3HSzg6fb00V0GJS8bk5eliMmLjCBU=;
 b=ybP3VqQFrFP+rEMHM8p7SkNTbgQpKc9hO3jekPy9SgAb+T3NbsIhOQXSn8Nk7mIOhC
 jjql4f/80b8RuppxAx0CSNibKVrRpKvjowjQisSh+ZL7/FDDsGvkN0ip45t9WgdaWMXl
 kuJRtw7geK4DE7UffUJYtB3oGjwblB1SaQubsa8dFR1dURGv0G8iWKU1oKdltMLZsW3L
 g/7cReLz1+4wOYsYqFo9+HG/ONZuhOn871Rw511yC/aOXqsSTXOJR4pWhnCFr7YG2+2x
 /YP5IR2JHxu2OMHrwoFWshCCWthe8kHPeFyXwmf6x/tVG8gvpfuZRtIC+po7zv5ew1o2
 aG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=cqQBTOYNa/mf3P3HSzg6fb00V0GJS8bk5eliMmLjCBU=;
 b=YGrfFLFw29przoxJaai9wSvpcP7ozJYqGcXOgYaxf+uzbHh4n61QYVdjq74nPJORho
 q7VqFDPlydMFdMHAQFz8T6MtdnBRDBPBetlTbRUKzi00suuq9759XaLNz9piXGkiM1RX
 Gad+IXTK2QWBnTFwA0LPh0fK54inc2iwpzbVykkP5ux7XmC72R1jKMLJex41TqBJ+kUM
 MTksvYmgaAQhaIGroGxltq4nqey22VOFfoPCXYOnFX1JPxPjEpH2gi6Cf5BtW0yFlk+G
 4VjDpzxoxJDTB5q6i8BZeCZN94AmLTNB7A8yuSAZJxnWF+dxDLgOF/nYtsoyZ+irTepU
 d89w==
X-Gm-Message-State: ACrzQf0zfxkjMLx/QD5PSW9Qsd2Lptcsgz1cpCgMVBuBEY/l5MiErss1
 SKtxEE1JFnAEkfItK0m4GfV1poEwCjyFRAvAP7vEjLRfIVg=
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr3323068ejc.619.1664470419015; Thu, 29
 Sep 2022 09:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
In-Reply-To: <20220927100347.176606-1-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2022 17:53:28 +0100
Message-ID: <CAFEAcA-X=rm6xB9kp7u7UPudTZQEUGskwSaUD8y+tKGx9QRsiw@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] hw/arm/virt: Fix dt-schema warnings
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eXTPcDbMI94K

On Tue, 27 Sept 2022 at 11:12, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Fix some warnings thrown by dt-validate for the aarch64 virt devicetree.
>
> Since v1 [1]:
> * Submitted more DT bindings changes where appropriate [2]. All of them
>   applied for Linux v6.1 so I dropped the related QEMU changes.
> * Grouped all node name changes into patch 8
> * Improved commit messages
>
> I'm testing by running various virt machine configurations with -M
> dumpdtb=qemu.dtb, then running dt-validate [3] and dtc:
>
>   dt-validate -s linux/Documentation/devicetree/bindings/ qemu.dtb
>   dtc -O dts qemu.dtb -o qemu.dts
>
> [1] https://lore.kernel.org/all/20220824155113.286730-1-jean-philippe@linaro.org/
> [2] SMMU interrupt order https://lore.kernel.org/all/20220916133145.1910549-1-jean-philippe@linaro.org/
>     arch-timer compatible https://lore.kernel.org/all/20220922161149.371565-1-jean-philippe@linaro.org/
>     virtio-iommu https://lore.kernel.org/all/20220923074435.420531-1-jean-philippe@linaro.org/
> [3] https://github.com/devicetree-org/dt-schema
>
> Jean-Philippe Brucker (8):
>   hw/arm/virt: Fix devicetree warning about the root node
>   hw/arm/virt: Fix devicetree warning about the GIC node
>   hw/arm/virt: Use "msi-map" devicetree property for PCI
>   hw/arm/virt: Fix devicetree warning about the gpio-key node
>   hw/arm/virt: Fix devicetree warnings about the GPIO node
>   hw/arm/virt: Fix devicetree warning about the SMMU node
>   hw/arm/virt: Fix devicetree warnings about the virtio-iommu node
>   hw/arm/virt: Fix devicetree warnings about node names

I have applied patches 1, 2, 3, and 6 to target-arm.next.

thanks
-- PMM
