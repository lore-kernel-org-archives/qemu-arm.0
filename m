Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7D9606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Oct 2026 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Jh6ndRPO
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLN4k-0008Aj-GC; Mon, 26 Oct 2026 11:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xLN4i-00089I-SX
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 11:57:28 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xLN4h-0006X3-B4
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 11:57:28 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-8ab3d3c5761so26952017b3.1
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 08:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793030246; cv=none;
 d=google.com; s=arc-20260327;
 b=jqPBuaSce++vryHIvFxtysi/w5oB9xHGCQvUvaRVx7zGc6TpYtg4l/VkJOKTjb1h+m
 Cn4P1zUTd8RCTuUpsFtJS4+yKfBfejyMC8snIV8KgrjOMRZUtHQGZAv+Diqnq1zS3pP3
 GuSjyJixXe3enqN8a7L3DlQhuZe8EhxXZSqGIriPJyReLcy2FZnmR9XzDmyfVHNytWXq
 e7Utg9tuP3G58k78OtiY+WErBWtz/HiJVC9JATtG8ksVEWuuFds/WzET/124zFx2rTdN
 aubaK8ErnQElLEaWEDlfsGoHq5nyfcm6kKi4cbXr8F3cm0/fI/7VgvZUJ2vQATumLw87
 lj/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=im6QOESZ0sJsklj0p6HRXsyXaD/1e5fOfam1nGU1YHw=;
 fh=JhdLcSbUn98QWn+/p8+hQ4rpDH/EGiWwyvo/eVvfYIM=;
 b=Z0+0SSHR9qv27MqRjVWGHYwZMD0bOkdJ+YQt3Lsr5iqb7idx4R4SwVlBUPncwX5nnm
 Ox6b9ugDTrv0pZbSSGGzyg/jvbx/oEDGzZcM7GaR3Z+jbT0tj5lxfL8CW4gyJXO07PHO
 EnekXGoXIOZDNv9RVft+kvnovBiYue9a7OFS2b80MhC/y5s+mMqb9zD05Y2wS540EYdr
 Qm6uW6BzCXrNOxbCPz8XwuIujmMYBodJBqsX3ewV7RXpIOX2pwqQJuh3Yif0nxf/zs5v
 JYS2/tVaCt0/NUbH4WftSpmWrAajuTtHf2T11hE9Evh8yr7zgVbN0TvPkNktMgEU5l6v
 dcIQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793030246; x=1793635046; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=im6QOESZ0sJsklj0p6HRXsyXaD/1e5fOfam1nGU1YHw=;
 b=Jh6ndRPO1uxtLdJw68NkfyqSWLtBNREaLIQBGpBo35C/FlmoYu1XvwrOfjqCS0X6Vt
 vsUCAxUn//zWX9wq8SroYWmI4BJ7p80ZNL1QyQZS3Mt4oOubIYZ8SaqI6ibJ/uVBT7ZP
 CHJ0ar9Gnj84SqfkjdzXxTbVih2YdCGVOTRY+XgWMbwtHZYUeNjmqY0CZkfqwEUwhFXp
 XIYnc5jxFhG39GZ+DpG2vZpwplaIKO4LzOPQ0O896zpl1OZ8aHIEtqUX3rphCMvZnH09
 JD+TfQ2ims2YoiQgkRdCkW07cZwgEF8nXZVnLAXUkLK/vIa3XYt2D/HooNXSymhaVfHk
 8a0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793030246; x=1793635046;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=im6QOESZ0sJsklj0p6HRXsyXaD/1e5fOfam1nGU1YHw=;
 b=fNF+L8lY/V5htlLLq847+xcRpdn4yLYUW9AxTOszNgGyLU1HpPe7TBRGhFoSe0ZNi3
 F1sbdCsPrHlMGOYGeZ7olrwM/NkWy3jNKe9ObG6CcpVxqqLNkEsqFNsh7S1f8+0ZT5gE
 +9dRXmNm0U961bTQ5T7x97f4YN2gdKU+ZWZEwsetIm7jy+UKAxJYS4EKzAbedB3KnVXG
 2zJahZIbmKTLgDIpqHQEDHQLPGWk3dqcLZx1lN1McXZIp813MVgDn/5kTMIWqWjCTYWf
 RxBV8GcFDcgiZIHJJWuNvS2/16vQAHU5fjs+/OMf1W4XFRNT/A3SbKUSeQoUFZtak2+D
 j5yQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzYPgFklaEyeETUdL3E2UdW3Nm+z1IzHSEW22/FomjaWtCSV0i+Z+QIU3iqVcgYMP6Cd/jW4jNMYg==@nongnu.org
X-Gm-Message-State: AFq9FYLdhII0SsZgmrlefI46avd60VxXh1y3O2rHgOZskDSNrfagusqh
 f6ARQgaID9ajfCLQgEQOtnjyKjhW2XymbbD/5tPGPaV0K/5HwccmFwtX4WsLX51YzvD0H1eVQSJ
 baAUU8+YLS0+9Brbt2pI6HIQwnwuMtafsdcGhVAwd/Q==
X-Gm-Gg: AYBFou2xcCgmp2RxWNlWqz2pv0SxKQzC9Gxl1vJ7aTQu7nRZb5jQk2ONFvbSfx8wv+F
 8BQB73ldj6cnAlKQOJjHDDhTbWoFlLbZjncyZikXW1b0q14Ig5i75TZw+F1ixSS4gEtjSwiQx1+
 YfavwkKu+nhvm+U0UCQJQieAu43wfeBCpaKTBaeNwfJVsDm2R3GjmKnrf1Xj7iEy6a309D2l8mL
 ISKA7rjVx3VY5Ef6/ByyCgg8vOUDeF/oIaKFGN/b2pBTumkTXiLAv7NfBx1DD70HjaQuIFnXxMi
 3Qs0USoj2H6sh06UPx/23R/xzIF4GR79uLTVK4/m3TiTrxxT4TWBqcLg+eBUobCMbAQn9HEwQtV
 gL5Ngt5MBjVzDx0emixBkNMQhIAjtiV6sw+lLzRy2ELzIgIu9nSMEaUpsEqEBeSWNgMHRmfdqwx
 BGa3T6oaOx5SAuZB58dq65
X-Received: by 2002:a05:690c:3142:b0:8b0:9def:97ff with SMTP id
 00721157ae682-8b166ca50f0mr43279247b3.46.1793030245990; Mon, 26 Oct 2026
 08:57:25 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023135924.64990-1-marcelomanzo@gmail.com>
 <20261023135924.64990-4-marcelomanzo@gmail.com>
In-Reply-To: <20261023135924.64990-4-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Oct 2026 15:57:14 +0000
X-Gm-Features: AclHuK-mA1Ex0-QoEAcpGRqERiiTcgWw9R6pLos357ahtw5mvi1NvyVRpWgdgts
Message-ID: <CAFEAcA-Mq+qdxC4sQS68mF0bLtYADizUzo6PdhrrSTr6awADqw@mail.gmail.com>
Subject: Re: [PATCH v5 02/16] hw/arm/bcm2838_pcie: add BCM2838 PCIe host
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, philmd@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 23 Oct 2026 at 14:59, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> Add the BCM2838 PCIe host bridge model: config space, MMIO window,
> and register access for the root port.
>
> Per Peter Maydell's review of a later follow-up series, fold in what
> was originally a separate bugfix here, since this device isn't in
> upstream git yet and the bug was in code this patch itself introduces.
> Two defects fixed, both on the enumeration path (none of this was
> exercised until a later patch actually attaches a PCI device):
>
> 1. bcm2838_pcie_host_read/write computed
>    "offset - PCIE_CONFIG_SPACE_SIZE" on an unsigned hwaddr, which
>    underflows for every offset below 4KB. The root port's own config
>    space -- including vendor/device ID at offset 0 -- therefore always
>    fell into the out-of-range branch and read back as all-ones, i.e.
>    "no device present", so the guest stopped scanning immediately.
>
> 2. The root port overrode PCIDeviceClass::config_read/config_write with
>    plain pci_default_*_config(). That bypasses rp_write_config() ->
>    pci_bridge_write_config(), so programming the bridge's memory window
>    never updated the bridge's address space and BARs behind the root
>    port stayed unreachable. Drop the overrides and dispatch through
>    pci_host_config_{read,write}_common() so the device's real handlers
>    run.
>
> Accesses to the EXT_CFG_DATA window are passed on to
> pci_host_config_{read,write}_common() for the function that EXT_CFG_INDEX
> selects.
>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

