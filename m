Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09339C43458
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Jun 2026 20:03:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weeg1-0001UR-QI; Tue, 30 Jun 2026 16:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1weeg0-0001Ty-A5
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 16:03:24 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1weefy-0007UT-TB
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 16:03:24 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-6611669cd16so4865173d50.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 13:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782849801; cv=none;
 d=google.com; s=arc-20260327;
 b=QMzxeLoIp7ym/4leqv9Ij0VPrJOAwYe6A2ln5UgxPfUQS92to1Nceu4H+yFRyKhqPa
 hKm7TC2Hxb3CghA4bP0Qq/lKjSxUtbIJbbyT1f0MIyMXoes57ckoW6nsyd+ieeGvebBG
 iX9/Lzv9lpdcVMds1V3IiCCYvJCynqzpP4sS5bAA4bZnx6jjbSHPjEH7PwIsP9EYWSYp
 lLShGz3Z7oHNrXdHJQW0NefgvtTIck0rmbVZzGR3OXT2P2P5tAuQp9zW6z7J4WGo/zVd
 gMJuGQEtFuPubn9Ysspm/Z1NpH+M857xJ4mr4qkseTqeyQbPhG3c7IDwpiN+SVvaIkaM
 3clg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=bXhZ8i7eqVyE6MmcjkVTC+SVyUFICSV6c/GTYl9CE3c=;
 fh=OhAyZFOOYy27jEhqWlMHZGvTXNMRwtZ1Gt1jqLDY0U0=;
 b=ZNysayGuTFXoQsa9IrERRg4KrNZWbfEjrSVoJVd7hnY5CeBIdDF17RMhRUCQdsAKCE
 ZY0fjfHgW/GZSRp081+cfWk5dhML/62lHM3hklbBOnb7rCGrzdipp61whWwS6eZkezLN
 w716PyIA5g8jnC1brwAraIRUSZMxhEAkckuLFlwB8IdxLL7pDfGFKmHfsdDNcxBEz5yV
 P67bb3Q80S79v4MwueB/2/yS0sBjiA0/wPPcjcfYElTqBdtEbocCe8zLqdC1e2i4JT7R
 MmEtWIBIFFvofiDJhPdfD77UXjERGg5Y7WPOt3dugueG2P3G2Xm/67DFNjtrkn+mg2wL
 +V+A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782849801; x=1783454601; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bXhZ8i7eqVyE6MmcjkVTC+SVyUFICSV6c/GTYl9CE3c=;
 b=HrkJnNjyiIesRodNn0+6ibCo61dbLoC4PXxAGh8rivWe1q5t8oMkYiDTrqRvpzhjmz
 w7gE76L5TZ+6Ph0Nsk0VKFTH60XYIqbs7QnDjOGFLKRXnKlh0nJL1XopoYNnCyFRogb6
 KnguWaux109/DIUXXX0+a0DmIZHVbter43jRGmg1rc3UQuVc1vnh029ygwoOx1fvTDpa
 iqNDvBKSLWFtO21gUb6yHlKmE0IZh8PKZFqggQlzZ8VAmKoIhx7a+dqZA68t4zPrRWXB
 C6jukDvigUVqg0NlQqk6kTg+dAkhPyyRh7d46OzbG0O1iI8aneEML5boUTGJ3WtYwDDC
 8gRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782849801; x=1783454601;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bXhZ8i7eqVyE6MmcjkVTC+SVyUFICSV6c/GTYl9CE3c=;
 b=X++jc340MS5Pum3cafQFHd1dCa4LXRqsbC9XQynEsyv6l8mYOZKXcP6aIEUlaTFi4f
 szygV5gWxe2G4/qbliIC8RMexHiJgKgMIGyiREfJRfVVH/PLHdbJT3Gy6PEXJPs/l+sU
 hyAgoziyO9J34+Pb/poJNQGYA1GW6iCmb/fDNEgPdiGHkb9jFCdpNgQRbtc1HUUBOYqD
 S9iw34gjZa74+wLakQtp0BS9k/xFneuz/D3uQtObPObyLtVrX3G3+10PFcy6pXyMNJ1f
 g4xYgBvSGBYIFT271ohioTm3q7XJF3q25eFjvnUBwN/1bkqHavLlicL+aqrRd7KMS8dx
 MKGg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rroc9MwdvKLW/fZ/B0IxluzJ6w3U7Qr07IAjMYR11U6/PcYKb7CLwdI2fFSQoy/Yk00Mmm7N/WMVw==@nongnu.org
X-Gm-Message-State: AOJu0YxeeJxM+yZNcjyjkOg73+bJGIMuCAkkZhfIdsBIrrnP07toiv/Y
 3zOPaR2k2Fss+btN9/TmLeNNDR7KDhy6Lcyth74kr7yc0XbvNWptN4khiay8UKmhNmRNWcsa7nb
 nLc5TLbRmnuCyizwV9ndNmKKFN1OdNQkE7Zwy4RtUsA==
X-Gm-Gg: AfdE7clMV+PrtXP1sGxUa+Y5Oflf+P20jpPQDC6fRyglUIsomcAJJ5f/EqL9ywenJvh
 7LlDt8F1wOFNvr28SeOF5F6w4+7UFM3SY9fZRXeIgS0SitcAgWI4QQ/oQv168xV3Aj6YEvRuNlw
 kn+aUsEAonClNuni4AYAoIXRaz174526AA6t3z2QW4qf1scqtO/kfDS3xodGi3vXXHF1bLpu8Rf
 +ns6gkCHUCrqnc0wPfO6iM6g6ZxrnZwTwJ9hquVRQFsZJmzxX7rn/hyV76/Qrk6cZRPh55zRRYV
 CY3bdO8tW+ehbJ3z+Hqr+d+iZPnemLe32kG8jhC13KKGG0dW72SUH20/zRB1ubGgVc4=
X-Received: by 2002:a05:690e:d4f:b0:664:f064:f66b with SMTP id
 956f58d0204a3-664f97956dcmr5308553d50.26.1782849801265; Tue, 30 Jun 2026
 13:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260630173245.2070268-1-clg@redhat.com>
In-Reply-To: <20260630173245.2070268-1-clg@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Jun 2026 21:03:09 +0100
X-Gm-Features: AVVi8CeKn3WwLouWQSn1WO-k9UfRbjLz7znD4rBG3Dxu-4tKcxs4Ps63L1r6hR8
Message-ID: <CAFEAcA8G2sti8T=u_Sa5HSSNXAJfJMmbv14PVD0y6yn1wDEaHw@mail.gmail.com>
Subject: Re: [PATCH] platform-bus: Align MMIO regions to host page size
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Tue, 30 Jun 2026 at 18:33, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
>
> On aarch64 hosts with 64K pages, the platform bus MMIO allocator can
> place device regions (such as the 1KB "tpm-ppi" region) at offsets
> that are not aligned to the host page size. This causes unnecessary
> and noisy VFIO IOMMU warnings when starting VMs configured with
> passed-through PCI devices:
>
>   vfio_listener_valid_section received unaligned region tpm-ppi
>     iova=3D0xc005000 offset_within_region=3D0x0
>     qemu_real_host_page_size=3D0x10000

Why does vfio care about the tpm-ppi region? I thought vfio
was only for passthrough devices, not for normal ones.

> Fix this by ensuring the alignment used by the platform bus allocator
> is at least qemu_real_host_page_size().
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> ---
>  hw/core/platform-bus.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/core/platform-bus.c b/hw/core/platform-bus.c
> index a2217a2deec7ab0f49b211c6658db02d13c319df..a17a38c1ba5491e2001fec5a2=
9c188de67e93d11 100644
> --- a/hw/core/platform-bus.c
> +++ b/hw/core/platform-bus.c
> @@ -140,6 +140,13 @@ static void platform_bus_map_mmio(PlatformBusDevice =
*pbus, SysBusDevice *sbdev,
>          return;
>      }
>
> +    /*
> +     * Ensure alignment is at least the host page size so that IOMMU
> +     * mappings (e.g. VFIO) work on hosts with large pages such as
> +     * aarch64 with 64K pages.
> +     */
> +    alignment =3D MAX(alignment, qemu_real_host_page_size());

Do we need to tie this to machine versions? Otherwise I think
the memory layout can change underfoot which would break a
guest migrated from an old QEMU to new.

-- PMM

