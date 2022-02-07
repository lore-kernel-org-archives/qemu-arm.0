Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp92103lfk;
        Mon, 7 Feb 2022 09:37:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHoB5ktftbUVgmL3Fq7TQgc5jyL/ZDaphRHtlPUa/RkyO2QAA8G74p8p2HCinjrelZuxMZ
X-Received: by 2002:a81:eb05:: with SMTP id n5mr921271ywm.496.1644255421376;
        Mon, 07 Feb 2022 09:37:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644255421; cv=none;
        d=google.com; s=arc-20160816;
        b=fdhgNVVviRIhw6R7311u3Ep0+CGetNpeL14tJUbTGuzTq+UKj9q6HVe3gaUCEZZgbA
         SdLEDd10FdxIeYcur/940iCzV7/o6J0m39N8NaVTqtGDMWuor/jKPXU+XupzE0AX6cZu
         qXPkGNX9OE3CBBwMLODeZtCsq515uNFvBWAXsv2de95z2feUAdd4HKhNQnhYzdfDLBTp
         pF4bXnIMTmZBYoccxjqXnxc/TS7y4gf44RyJpcDIYMPhESwZjRjkFwF4IXYMEOyX8ey9
         dVlUcLMRDmkI1F233rA39V65dUwpbZmRAa0puWBU3OU8z4OMIklQ2AyTXVXsfuTW2hJw
         xCsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GBBB/DBKZ7uUyw5CLkBoPlXKiTRYdO7D4mtZoMOhgNI=;
        b=E5CiN5UbBa+baK2T1NapQoQyvHvYO3eewpKUq2vxJH5EDVt34WqtaVmjo0CP0EuhFZ
         JU3gJQM8FPCQ5st3aW2E2SzBuMQYJgceK8tcejVlamHxlSfnhnbblNg3JGS1BSD+izIo
         h/mbbEfJF3dCcQ6G59maB7UzVlJ9KhooZdmIiu3kjFk/Vur19J6RphK37zYtP/blpkGS
         inxSXhl8YeIkvBXpyOLmBT4dkM4eMqRMH9lnxM0LMvFiZASWlsG1kI/MP6SUg4Mm6B4I
         1CA0ZI5Q1dy+Bv4vB34oVAaec412OfL3dybPCt9uo203A/16SDkJ5r9+1/LmZfZU/228
         wocA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="rot+/G/J";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8si8416438ywg.143.2022.02.07.09.37.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Feb 2022 09:37:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="rot+/G/J";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nH7wi-0001oo-Pa
	for alex.bennee@linaro.org; Mon, 07 Feb 2022 12:37:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH7oj-0000MK-2w
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:28:45 -0500
Received: from [2a00:1450:4864:20::436] (port=47061
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH7oh-0006sN-J5
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:28:44 -0500
Received: by mail-wr1-x436.google.com with SMTP id r29so8182499wrr.13
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 09:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GBBB/DBKZ7uUyw5CLkBoPlXKiTRYdO7D4mtZoMOhgNI=;
 b=rot+/G/JD66wqz01r/R3C7hIjSm5K/qCs9N9nZoFr7XWBFTTtxgQPIn4g5FrvVt2ct
 QEuU/MSLzMtG4MxvbZxrBuY/bpewGKwykF9nJpzNVYwehZjB/Pmp0uLqk37sKEBj5FuQ
 SPMy6bfOXt1ilRPr2vMwhF3Yr8qyKJfqXkuW9maPtFYImpxT0+76HNdh4INWl/W9NWcU
 FRPWwBolHCpJ8DBNVaqxuKpcBg4YfAmUv3pwmyVTWgr2oWl2gYrpqmXetF+vTHnh3xEZ
 m3pr7Y+/cUcDFUGQivB77relkSgrU9x3mAg0KKmYRFPKkU+x7Z63qKK8LEM1T6GqIU3B
 dONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GBBB/DBKZ7uUyw5CLkBoPlXKiTRYdO7D4mtZoMOhgNI=;
 b=oNy7IiQLHKm4/vOyTfPbQgvbnF+A6iN8da7imogVQhfZyU9ua6m0+Pluh0IENuGO2q
 tjdEvWQ0+e3g39K5gM3/x46+Cbcqfbl23TG1wDQCOIRVuruQ/kyARVe3TUYuQHPJ7gTN
 ANtcysdPGCTVB3bksaxM+dLE8L76KrQnmudUr7H3rzkrQMdSK1Oyx9aoePX18xxe4bsO
 //aHwCmBi7uV44ETMKN/BFeb+w69FlB7t+xosUH/xK4r0QdFJ+eMF/WuH2iwqvO/N2UJ
 gY7PECSLBGdgKYWt26NOwyDmK2pODGTRqqBZ86XX7npMwG03oKDWWDfgC2CpSbB5Xjdx
 BuDA==
X-Gm-Message-State: AOAM530V4bGy3uIxTZmJEmuNeRLMf2bO5jgDZx0QFK/gZFAesT8TNhK4
 W4UvMj/LmV1Uh32jFMTJvYiagTcDeVtG86FLDLi00g==
X-Received: by 2002:adf:a51b:: with SMTP id i27mr423250wrb.172.1644254922273; 
 Mon, 07 Feb 2022 09:28:42 -0800 (PST)
MIME-Version: 1.0
References: <20220202111602.627429-1-eric.auger@redhat.com>
In-Reply-To: <20220202111602.627429-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 17:28:31 +0000
Message-ID: <CAFEAcA8EEB51ok2dsVbXsb3iAShCQA0EwazhtcWqd+dK1MUEMg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmuv3: Fix device reset
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3SAX4wN+E8vC

On Wed, 2 Feb 2022 at 11:16, Eric Auger <eric.auger@redhat.com> wrote:
>
> We currently miss a bunch of register resets in the device reset
> function. This sometimes prevents the guest from rebooting after
> a system_reset (with virtio-blk-pci). For instance, we may get
> the following errors:
>
> invalid STE
> smmuv3-iommu-memory-region-0-0 translation failed for iova=0x13a9d2000(SMMU_EVT_C_BAD_STE)
> Invalid read at addr 0x13A9D2000, size 2, region '(null)', reason: rejected
> invalid STE
> smmuv3-iommu-memory-region-0-0 translation failed for iova=0x13a9d2000(SMMU_EVT_C_BAD_STE)
> Invalid write at addr 0x13A9D2000, size 2, region '(null)', reason: rejected
> invalid STE
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Fixes: 10a83cb988 ("hw/arm/smmuv3: Skeleton")
> ---



Applied to target-arm.next, thanks.

-- PMM
