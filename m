Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1862293wrp;
        Thu, 12 Sep 2019 01:43:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzwECJoLauXeDc2ZABWdj/7CuEIJBlz7clCqCZdpcgXuXA6PtLrE4NNM/OlmObfiIBVD5D0
X-Received: by 2002:a50:c908:: with SMTP id o8mr40986115edh.187.1568277793764;
        Thu, 12 Sep 2019 01:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568277793; cv=none;
        d=google.com; s=arc-20160816;
        b=OWFoM2AEFL7iWtx1rnrBBMJZD3ZdA/JTut9HllWtQ85cD2bT1BVOJrkKDhSv6V5oJ0
         wTE5ByMV3T4heKVzGG/tdjhhkAg2WPmrVPTsCeD16K/Do58G96s/BNiK30VvGmTKeCoj
         9YdDGsc5+jvsc++bU3kWlzKhHtoQa1hYHmcntmp8S6+XXRXNRraexqZ+9Ngys9FmVlk0
         Dnld59mZvsp6eSu263/Uu1TheeakeE8bSV0dIWedKI9G/KvRKtnHdr+VkJFd1GDrxSjH
         tOwSzsE8UUDKiTizrO4fAfsTshnf41BSg/IEg6ZpG8x4Sdyn+frUV4xR8OF/SS4Q1aOn
         g8Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cI65MUPveMrT7l9BraFDGQca8s8WLn5iaBchREhiiec=;
        b=SPyQ58loULTVv0n6HTBuddFLH4QhvFMjO43VTzr5CddL0MCRWD8VwYt0wXcwaycriA
         P6szJ4DVZzurCw85Fq6Z2BRBLtrHjtzzWhxsXsKvne3fVWID3L3i1SWYSqAEHFlXThQB
         E00lAzuiPD0dBOTzz4CV1MWY4BPFTLnfMb41pmYAVAPKbWDbe+hKQZwGYd6vbDzdLFoW
         90NZu8P1J6In5vvYnMbqR8/JNd6nUX09x3DqWaJx0MN7C20Ju+ffa/X/WbXJvyEuMdNL
         u1of+4VSF3FcwwEXxw4NCu9QVRuMYiyZ6tuazRLxtNbwMGk8c06+CPcmsHgpv32b+zAx
         BIVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JbyC+GGl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si15715820ede.311.2019.09.12.01.43.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Sep 2019 01:43:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JbyC+GGl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i8Kh6-00026v-29
	for alex.bennee@linaro.org; Thu, 12 Sep 2019 04:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i8Kgg-00025S-Qs
 for qemu-arm@nongnu.org; Thu, 12 Sep 2019 04:42:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i8Kgf-0005Ej-Ni
 for qemu-arm@nongnu.org; Thu, 12 Sep 2019 04:42:46 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37614)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i8Kgf-0005E3-IP
 for qemu-arm@nongnu.org; Thu, 12 Sep 2019 04:42:45 -0400
Received: by mail-oi1-x241.google.com with SMTP id 11so1160947oix.4
 for <qemu-arm@nongnu.org>; Thu, 12 Sep 2019 01:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cI65MUPveMrT7l9BraFDGQca8s8WLn5iaBchREhiiec=;
 b=JbyC+GGlMBQlXXj6xmmLQmX2KSrWKYa3SCabOW8AsVyHFDlm1oKS2iL3fO5/7htszG
 +5mCwLH5HYlzSAbKaOPLb0oemGt+e0rYbx+fFPg7MGxo/RXFpqMX/Di2A06W4mJsfBia
 K15ABN1z/kIY+pzdFeuGRpkxC4C+aSUBWS2W+P/6FokVYVhWFw5+8g115wNgLH/y/czK
 7Arsyhl/ah/x5tDPhla1mwOF3BK8G62+p9EVtbRwRmXPnaZYQIIyaQl8xKyIPoMcpf+6
 9JLXZmsqTms6A91KrN/xzMr6TztZtk7QRG31HB2MDk0UBwZVcifCHZGJy4277kFwpikR
 IsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cI65MUPveMrT7l9BraFDGQca8s8WLn5iaBchREhiiec=;
 b=CtF0joahol+287Mmd/JkKHVUXoAJjmZyF+L5HPokOknDbjbUdaqvvkJ/RfKBZiI89d
 MiZCcFhV8C7PHX5xRfl89rFJq8I0rFH4HTHqsmFONkZIKbLocE1/krxV7QxTS2HFHIBD
 cBohNc7MdtOTD0ct8L5vF3QpihPa0LFE+PYvzkMwvoJudMvvS6W2NNLtrSh8zUoCLMOd
 osz0H7nWFufMZzwf+ffml3+Z8J+lC22zsYkUclciyu6bNTlwQTvXWkFIDauSzFq/pEzQ
 yTAakv2x+THOfLwdsLD7hSG/V2hkpQsokP8JU97RfoainVakC/DpLZRW8dZDH6uo7pLw
 4vlQ==
X-Gm-Message-State: APjAAAWmTqkeTSGR5UOrE3cNBJGhTj/fIDmdtS1Y5KLVArEeUposP3jq
 c0sWk/ADtjBylO2TrDx8WQdxPiKc/e7g2XY8xQ5Mkg==
X-Received: by 2002:aca:281a:: with SMTP id 26mr7693853oix.163.1568277764510; 
 Thu, 12 Sep 2019 01:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190911155125.11932-1-eric.auger@redhat.com>
 <20190911155125.11932-4-eric.auger@redhat.com>
In-Reply-To: <20190911155125.11932-4-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 09:42:33 +0100
Message-ID: <CAFEAcA-tZJ2C8=ZH5e7tXzigPu3SGjSJbnLybZTG+hZO-7ZV0A@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [RFC v2 3/3] virt: Check
 KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 for smp_cpus > 256
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, Marc Zyngier <maz@kernel.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r+2xIbt5Llcs

On Wed, 11 Sep 2019 at 16:51, Eric Auger <eric.auger@redhat.com> wrote:
>
> Host kernel within [4.18, 5.3] report an erroneous KVM_MAX_VCPUS=512
> for ARM. The actual capability to instantiate more than 256 vcpus
> was fixed in 5.4 with the upgrade of the KVM_IRQ_LINE ABI to support
> vcpu id encoded on 12 bits instead of 8 and a redistributor consuming
> a single KVM IO device instead of 2.
>
> So let's check this capability when attempting to use more than 256
> vcpus.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c        |  4 ++++
>  target/arm/kvm.c     | 21 +++++++++++++++++++++
>  target/arm/kvm_arm.h | 15 +++++++++++++++
>  3 files changed, 40 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 0d1629ccb3..465e3140f7 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1575,6 +1575,10 @@ static void machvirt_init(MachineState *machine)
>          virt_max_cpus = GIC_NCPU;
>      }
>
> +    if (kvm_arm_irq_line_layout_mismatch(MACHINE(vms), max_cpus)) {
> +        exit(1);
> +    }
> +

Is there really no place to put this check in common code?

thanks
-- PMM
