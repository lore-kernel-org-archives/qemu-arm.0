Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE9710ED651
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 10:27:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w64Oy-0007aZ-7C; Fri, 27 Mar 2026 06:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w64Ov-0007Zw-2z
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 06:26:49 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w64Ot-0003l6-I3
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 06:26:48 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-64ae222d978so1982878d50.1
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 03:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774607205; cv=none;
 d=google.com; s=arc-20240605;
 b=lT8R11/mBF6omv/gm+LGaJd/KkSWNjMRUxfU8rMeWQU4oHqJ5yUiQEvqm3iWgHvv31
 hGxdxhSrBPr/lRQQ9hR2+xSQuXpncd7EyVQEgXvHF0FyAJKuMTgJz4HCufpd8jFsx2Kc
 u3YJIIbCRCRtuRh/JVjXbPDUWpGLRPUNEASvZ7seMZGAJX5XnAY88Zbs0y0BC4QO52+z
 cY1MdEHKAlCkS+kUJpzOKtZemaNkS3xUXyF9KO8/aew+yWEUTCSjuB5Pikl8VBOadusL
 VfLuyaIWPVima32o+u91ocCxw/tQhfc6nBKKQsUAW/pZtRxrl9/CTH6jp89zgv6wNU3S
 qWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=+flSvJOn3RvL77ZMIK5nbQ81WmgCb4SQVDXi0GpJdHs=;
 fh=KG8XqsAmW1YxKTzryJfI+OEqG6BHwg+S7dnmU0oSBVs=;
 b=VMi7XGrekUABrzF6z1A9IIAskUlMGBw7Wuca7vFt33bgZbQBnGsEfzJXDoDvhYHwL5
 eemkNLRF3hpGLMmEXEXAQfEqA5q9wHLL7MAhl+8Uv9cHT4YPzbKiw+Npybaf5p2cPMB3
 lqhACyCLEF7fZTJkeUQEeDLpxfj29orvkgtr7b7F0kAsN2YjUhO7YKrIwqCutFghTCQH
 jQukThsJIUvS8gYCcFfUAZ1IW3eV2Althg5Y0vViH5J3mGU4B92oFsqJscHhT2bAscOJ
 SHr2Y92lYqPPWtH4wtmdzSCDPv/s9UpbxUW3vJLCBobrrE52RroxC0pso1DFsOilc12s
 CD2g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774607205; x=1775212005; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+flSvJOn3RvL77ZMIK5nbQ81WmgCb4SQVDXi0GpJdHs=;
 b=oXrIrH9hmcGJLG+6plzsVAgjbC2ejslUsAU+KyTY03WbnWyAfxi8j/FrMLqJEasFCq
 +gjdJmaTSQ/21sFtObELoAOj+yCT21EmQ97dYzlzdrfOh0UY2ZGn7xXqqQegz1KYz1wR
 2d/zv5JjeWo3H1NaGJRtBclhUOwZ+qJrN6lpdGee5nDPwuGbSyW38PYdksDsdh7y//AB
 FmLybYDkZEc8DjlPsJWchvA/vH/bpyErQGVas4UoXXJPFUu/e2yxrLROTDx77aqMWiEO
 GGbSjWHMCMdQuff4WDNyxNNtrjBC15fazHevmQL8KgUE3QLQNL1cxwCgmJEqaw3vP1uE
 4ySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774607205; x=1775212005;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+flSvJOn3RvL77ZMIK5nbQ81WmgCb4SQVDXi0GpJdHs=;
 b=GsZkhgzDquazgCYhmJVTcg5hEh0Ea791una/zbCz2/BT3j5+ehXAITUKcoPVAoeBgz
 rnt4xZNk0t7BoGuMIkWEqFXGktqX1NpK9hA7QWeCuUDnzikcu6CJhSIuWCE4vr6BEW93
 PEei9FOjDKvrpI5wKagTdWmZFr4MrXYT8GpzI2D5g4dH4jLXKq8IhG0hyAOjkqDLAUgW
 RHM3eDBAW+WRneXtza8oe/MtXHfwroIG51Dnf/Vx15nfvBU7/WmnzIH5DCjiByY4qxdb
 tE0bWMpKt7qnXOzBFA/sh4ChtzfhilM5Sr7YmJE/avo0Pj0aqtxuRTCg1VLVB0qol2C/
 QU9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAqX/vSGi1Bqxok9wXpwOP8/GeH1I5r3ukf1ueoptu1lqduyZgDFFrn7WFopQKpoTeWnLfo8H2jQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxo90SHH8h8iLZKHcf/LjgrOJAORo7MDRUFm+J61DES4I6Ms6vh
 XQpqZ1KWTrCbFI+o7JELWhkLPU+Lc66fvuo8MmncNPdMhoZEkXdnn+h5/eTNpbw/0vnfEUl4GUe
 VZhCSqY4zVLn6alXlokqJGMJzSbI6bXsfhxwrSW5nMA==
X-Gm-Gg: ATEYQzyFET6QqiW1fxgJXorE4oqQh79Nz/vfUQBYKOeY2HpIixSDhwW51kJvDLPPc/x
 7t5wdrAK930k8prWVxSG2pGUlmtvzPtUcxV4Gbm9cHCh6dtbUG9TwA/AgT0jlPS5ptLFrVvrxgN
 cPqPxPb1iZZHFd/IyTQbBT4yJJa401WhrUnCKThLZeY/0G8YGrOe+YtqtFPzslEWlQ+l1dm8kx8
 t5ffZUwy4PvZOzWXqAYBkNYAcmxmMclylmL6dT+yVVllSjzEHNP7yh3EW5INGEHjjoYoF5UaGeB
 m6xuM1eWyGUNhjjASHwHCExWZkUaTUGjoi1PFO3QVlVekUZHac8/lzmQVHQE2hBXtoM=
X-Received: by 2002:a05:690e:4394:b0:64e:dfea:ab65 with SMTP id
 956f58d0204a3-64ff73cba44mr1339988d50.43.1774607205014; Fri, 27 Mar 2026
 03:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260324-tpm-tis-sysbus-ppi-v1-0-e59175210954@redhat.com>
 <20260324-tpm-tis-sysbus-ppi-v1-1-e59175210954@redhat.com>
 <c6830a19-c275-4a83-bb17-4430680b3d54@linux.ibm.com>
 <A2BD2FA0-6D5F-47DC-BF2B-017ABE5F31AB@unpredictable.fr>
 <07ff064e-bea4-4beb-811a-f5f3485836d6@linux.ibm.com>
 <CAJg9Kky1q=5DFDPkh-i1hyxCKmpuEnR02hrHN-ncewY2VO0LQA@mail.gmail.com>
 <EAD6E043-B77B-478E-91D6-863B0E185CFC@unpredictable.fr>
 <CAJg9KkwznOFSzcme_6A44Er7dd6Ae+szWF+Fwh4dw=Hyv3BWVg@mail.gmail.com>
In-Reply-To: <CAJg9KkwznOFSzcme_6A44Er7dd6Ae+szWF+Fwh4dw=Hyv3BWVg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Mar 2026 10:26:33 +0000
X-Gm-Features: AQROBzBrm8UyIFcBtygqCAzUaq0wLUTyciJQKko7Vl_Qa7HkhgvLl4tFVFwA_Vg
Message-ID: <CAFEAcA85B5g0xRExvicBZwW=bADBj+dQFFeA3ihg+=bTYJNZCA@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs/specs/tpm: document PPI support on ARM64 virt
To: Mohammadfaiz Bawa <mbawa@redhat.com>
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Stefan Berger <stefanb@linux.ibm.com>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Fri, 27 Mar 2026 at 10:08, Mohammadfaiz Bawa <mbawa@redhat.com> wrote:
> For v2, I see a few options for the docs and wanted to get your take:
>
> -Add a note in the PPI section mentioning the FEAT_S2FWB requirement
> for TPM TIS on ARM64
> -Add it as a separate general "TPM TIS on ARM64" note since the
> requirement predates PPI and applies to the TIS MMIO region as a whole
> -Hold off until the ISV=0 syndrome support patches land, since they'd
> remove the FEAT_S2FWB dependency and make any note we add now outdated

We could in theory have QEMU check for whether the host has
FEAT_S2FWB and actively warn/error about enabling the TPM
in that setup. But if we're going to land ISV=0 emulation soon
that might not be worth the effort.

-- PMM

