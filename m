Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF538C88E50
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 12:17:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x65cT-0000xn-B3; Mon, 14 Sep 2026 08:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x65cR-0000x6-3J
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 08:17:07 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x65cP-0001IC-Er
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 08:17:06 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-66c70f69d3fso2995620d50.1
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 05:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789388223; cv=none;
 d=google.com; s=arc-20260327;
 b=G4yujckTb34awPz3ScUhk0wjuW3wYvdY0OAavvnjtOG0vBi2shukAjvNCzOr+PngqJ
 XFcTkL6TuBglPBl7GiMwNSVc7hcBSZ6YczpXdBUgD7liGozHALF1doGzwttYyLYEJgaa
 M7FFNjxZB3vS/m8s1C+E2O5YMEXIjG3KPzKR9R5Q0BgaweNyZ+lVURsSsnG2Ty9A2Y8S
 EMuOkp7OE6QuCAieNd+774JOWpglxPAxXE3I6aqLZlqRKzBHNAC4YlJGaNfmDQOSvq2K
 wr1QtEzt3tVoX9z7QVWaSE9JtmMDZ1wt/nCzljd0EGRICoSREVwXxYTLVcvji/381aAf
 xtoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=JcaGD9CD+W/ivWBfEUgg4X0MaxjX3d/zpeZO65l6kuk=;
 fh=GC4xIbiBiOnW0TEURhPVa3dDTMkJQZ0mQvnePplwCo4=;
 b=kXtNOusMTQy4Qs2gIT4iPT/tIQOWvae2JgiWFYdOB+ZN5eKBQPcCUq3VRpuKqRTqRi
 LfbBZzRvmG6ROVswRAoInG4ln4mzXpZ1nl5FoKPfqXgO86OhjUDkKmhwuCRPZo/BEEAx
 2Wj1YWuyLMoubOG21GOUvZOM3RfGwMW4TE4bMbkky2sflYDx3KY0yTN2OwHEcUeankp5
 GljtML3jGcx5Nl/1ib3ejCf25AF5wT3t/BFJsGmk0T/+eiHnZ+p6T22i10X3SqhEIgVs
 2FzZZCj3+s4bzFenI++Oxf/l7evw3LLTsFsI+0EoTCAZ1EcV78P3oR3Jw3Qqsy0SdTW7
 fUQw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789388223; x=1789993023; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=JcaGD9CD+W/ivWBfEUgg4X0MaxjX3d/zpeZO65l6kuk=;
 b=GxmUBswfqvopg/qpRRQ47x1a90hqeNwOZQm/uwfTeT4GAJCtTwZMgHrn6BZ+mVaxU1
 8zz2ya5djJudD3HE3DHA5+fcB8mVAQy7AbmDTA71/KLpHICPq+DgxOI9sN323gRkYi7E
 caR43/gd43AlYVzl4dy1PFzYfO8cAoj/vzX0NCEWIwGKOrJp6XoSxif63fb6I/kdsawN
 1K5e5AgLSV5Nz5ZBZVmH2HKWHtsg5ZTU064UWAaexcBWEoCX2RcUhyaI2bZJf2Bpe4r9
 o9TcsnFUjeY8ThBTsocbE86EECgibG6uYEYm6lnaP4o5lp+28WVUdvXSmcil3u1vcJv5
 fhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789388223; x=1789993023;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=JcaGD9CD+W/ivWBfEUgg4X0MaxjX3d/zpeZO65l6kuk=;
 b=mukqMvuaCkvFnLMrZWaQDHvX8w2cwezL+rZg942rO2pPP7TRpTDzvwfmqcGlI2Tz0h
 AS/7c8f8YNp8r+/p/vkiiytOAsu5/pmMJJ8qD6aZjv5XA0I5k70BcvlArNyUql/g9ClL
 QFcKKPuMvFzScluUBFcuFxp6TsvtWUULSdl/AFkb4mMhQ+gCmkr7AfYLoSQvRy/5VtUt
 DTYqkxVvZD4w6SX8W07ZlKnOnD7Rk7P1yh1Y1r1E0afzfqipfY+hh4Bx8oE2dlukY1f7
 atD639w5zZluOMDZ8bv6ysnAfLaE49NwDHZn/wsj1SUnaWROQ5kkBzJsr87rjJQL2ShP
 u0bA==
X-Forwarded-Encrypted: i=1;
 AKwUvBx8cs8fWd1uGPzo8NxljucLeHe8vbMm4+r9dE3jRSLAOrFhHOY25qAm78fvv18IjkWlsFM4glDTYQ==@nongnu.org
X-Gm-Message-State: AFuF++lXn5Lf//bBiijPiMg9VGqn4uLzE7qqYKWX3hLnT6uZS8mEQ0Ng
 +7zVi/g8yUmRn9ARwv2mLlY260pnvBL+C4oiK+07CBejHYDv94uuZSb86LCYS0KWZcXMXQwndIu
 oE73ygu75bJVTcjUuxAfTcs+421KQqo2ucp26NV/z0w==
X-Gm-Gg: AYBFou27IHuSDnunIe7hMjKBO9lkcLY9UlVwjNdXKSG+ATUtZrBXqHzsMrJu4Qe4APb
 UodYDZBAOQkXhP92qgpncLSJeLppBhEuLlBnrntjdCzmuXT/TCVYnFsOZ944us5Y2g1Iqqeulfq
 xI3hOuI+dYBpEN50NK0qPYEHr70V65/SYjYFQU5wdsVdyvrGNFdS8V8VFX7sDy8ymZSJsnRtj+5
 Xccz8DxNyiqpBsCgeG44tvCmi479Vt/sGIUreDjHFx0iJKtP/ny+clPD4oy4SFwzdddJs6yeFr2
 pzrxB0S+GuVQzeBFI4Dm2CpSwqAcSm1QvN/ZfSApoKL6Szy71mkfCxeDhELiPrk5doH8rK4FpYj
 9FwIq2/1aSmf9rubmgWbV7diFj1ZY6UKKgkEhZjY=
X-Received: by 2002:a53:cac8:0:b0:671:1a5:c561 with SMTP id
 956f58d0204a3-6714e1bebb6mr331988d50.99.1789388223248; Mon, 14 Sep 2026
 05:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260909144151.26803-1-sebott@redhat.com>
 <20260909144151.26803-4-sebott@redhat.com>
In-Reply-To: <20260909144151.26803-4-sebott@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2026 13:16:50 +0100
X-Gm-Features: AcwNN1VjWCl3r1TgFgbFV7Y0VJR1-LUKemc_Mp9GXe9OwSykgUQbU7A652Ju89g
Message-ID: <CAFEAcA_ikXxw+J10+3mbhJxa_KoAd3PeyT+0khqVo_UPOJL2Cw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm/kvm: get demuxed ID registers from kvm
To: Sebastian Ott <sebott@redhat.com>
Cc: Eric Auger <eauger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Alireza Sanaee <alireza.sanaee@huawei.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, 
 khushit.shah@nutanix.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Wed, 9 Sept 2026 at 15:42, Sebastian Ott <sebott@redhat.com> wrote:
>
> From: Cornelia Huck <cohuck@redhat.com>
>
> We now have the infrastructure in place to handle demuxed ID registers
> from kvm. Use it to get the values that kvm emulates for CCSIDR_EL1.
>
> Tested-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Sebastian Ott <sebott@redhat.com>
> ---
>  target/arm/kvm.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index ed99be7fd8..1230acaff0 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -244,6 +244,33 @@ static int get_host_cpu_reg(int fd, ARMHostCPUFeatures *ahcf,
>      return ret;
>  }
>
> +
> +/* CSSELR values supported by kvm; used to index KVM_REG_ARM_DEMUX_ID_CCSIDR */
> +#define CSSELR_MAX 14

This is a bit misleading as a constant name because that 14 limit
is KVM-specific, and doesn't apply to the architecture or QEMU.

Somewhere in here we should document why the KVM number is different
from what QEMU has and why it doesn't matter (i.e. that neither KVM
nor QEMU currently handle reporting separate MTE Allocation Tag caches,
so CCSELR_EL1 bit 4 is always 0, and that a Level of 0b111 is reserved
and so CCSELR values 14 and 15 are never valid and will always make
CCSIDR read as zero).

> +static int get_host_cpu_reg_demux(int fd, ARMHostCPUFeatures *ahcf,
> +                                  ARMIDRegisterIdx index, int subindex)
> +{
> +
> +    struct kvm_one_reg one_reg = {
> +        .id = KVM_REG_ARM64 | KVM_REG_SIZE_U32 | KVM_REG_ARM_DEMUX,
> +    };
> +
> +    switch (index) {
> +    case CCSIDR_EL1_IDX:
> +        if (subindex >= CSSELR_MAX) {
> +            return -EINVAL;
> +        }
> +        one_reg.id |= KVM_REG_ARM_DEMUX_ID_CCSIDR | subindex;
> +        one_reg.addr = (uintptr_t)&ahcf->isar.idregs[index + subindex];
> +        break;
> +    default:
> +        return -EINVAL;
> +    }
> +
> +    return ioctl(fd, KVM_GET_ONE_REG, &one_reg);
> +}
> +
>  static uint32_t kvm_arm_sve_get_vls(int fd)
>  {
>      uint64_t vls[KVM_ARM64_SVE_VLS_WORDS];
> @@ -454,6 +481,10 @@ static void kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>              /* Read the set of supported vector lengths. */
>              arm_host_cpu_features.sve_vq_supported = kvm_arm_sve_get_vls(fd);
>          }
> +        /* Grab demuxed registers. */
> +        for (int i = 0; i < CSSELR_MAX; i++) {
> +            err |= get_host_cpu_reg_demux(fd, ahcf, CCSIDR_EL1_IDX, i);
> +        }
>      }

I think I would favour being a bit more explicit in code about how
we're converting from a KVM-ism to QEMU's underlying format here:
have this loop go from 0 to QEMU's maximum CCSELR index (currently 15),
and then have get_host_cpu_reg_demux() handle 14 and 15 as "this ID
register value is 0" (with suitable comment). At some later point
if we need to handle Allocation Tag cache ID values then that code
will expand to "read cache index values 16 and up, with suitable
fallback to 'is zero' for older kernels".

thanks
-- PMM

