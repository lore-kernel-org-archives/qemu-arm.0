Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp508717wrp;
        Fri, 6 Sep 2019 03:16:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxWn0WDCcWKvTZv67URCYa1D+p8uHzcI095jyrjQxqsEg/S9Vzno0NJVajIEk0s+dyoZgZ8
X-Received: by 2002:aa7:c1c7:: with SMTP id d7mr8629556edp.34.1567765013416;
        Fri, 06 Sep 2019 03:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567765013; cv=none;
        d=google.com; s=arc-20160816;
        b=X2HNjNTNIplXgd7FPPVAms9kYp8E2XQbxvS48C1S3RFeO6mepT26YmZztc7FuNAvYL
         hYQtBU0WXmiWFH6416PNyC/VOVHyEs+F4TZPW+3f7tbw+nqScv42ef+DiCLKn7vijfSr
         7pW6vdmTling7xuyoJNY+OfxEA1/hVUvvgJVmAjC1s8hr3ZyDOliYGQ5rbGdPxzSO2E2
         78TzKd1qsdIDFZxOgbW7p6e1zRBuG+XXL5R+N0VMzXy4bf77MrfjvVHv7Eqe0p7is+QO
         sUP5j2ZxAi4TmZ8gbbYL99QAW70udgIvUXD6bLyOfFG1RpnRTELIUnt+tjxpNK2vzT2g
         QEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JhYDg3Hv4gco9LB6XeZ1unYrJu/xgj/tQEkCfCDtBNQ=;
        b=KGRrC3nleIwTfPHjhIouIVUM763WKKhUHn9DKn/Wq3YoNBfFwTouuwlSwT98usGnIz
         fgsNE9Sby3hW00fGOTKkt5zu0YsBxmXSAbl1G49IwTb1NYWdcgfHjnWxiiv6ver5j0Gg
         eH3fz75+0KIIduNeucFlNzda4ityHL2fBr4woy6gwZeOcLz4MPFEhGWxG5Td9t0dl6li
         uKU9T4tS8NJtfbgGif67pRWrNoo+xbynzMglmWtUzyntLZ9sTVW8hcgFPh9XOGInPpQv
         2Nfy4Up9FQHsN3QrupSm6EB2kZjlrTRUXLp2OVmFhCGo6yr+NErpFUGb5RLGEXwHjSYN
         BcCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qtowk1Nf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q19si2646967eja.191.2019.09.06.03.16.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Sep 2019 03:16:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qtowk1Nf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i6BIS-0000vG-GY
	for alex.bennee@linaro.org; Fri, 06 Sep 2019 06:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46014)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i6BIK-0000sX-FV
 for qemu-arm@nongnu.org; Fri, 06 Sep 2019 06:16:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i6BIJ-0007a7-I4
 for qemu-arm@nongnu.org; Fri, 06 Sep 2019 06:16:44 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39041)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i6BIJ-0007Zp-DB
 for qemu-arm@nongnu.org; Fri, 06 Sep 2019 06:16:43 -0400
Received: by mail-ot1-x342.google.com with SMTP id n7so5219148otk.6
 for <qemu-arm@nongnu.org>; Fri, 06 Sep 2019 03:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JhYDg3Hv4gco9LB6XeZ1unYrJu/xgj/tQEkCfCDtBNQ=;
 b=qtowk1NfwnkLW1Z4RhFXze1ftyz2OkOfplJ0FVOzV3oCePLurshMigXlAdVh4WV5vL
 fLy9HRQ53YMgNmTKIEbbCOAB6qbkIw1nIbQbtKW6mFwt5pTa03eRk5sZYi59eQjZtxgA
 u/igyYMpzAl87TLCi5qNFmOUFZAn8ON2Jy/xX78L8mXezt/9CO1F8KyL5jtV3JyHyhbg
 KKL2Lw/9D5gerA4I/yUfKay5v6S3UwnmThy+vBA46GDhX6LbRkAaoLSd96Q0ri2dGAdM
 TkyoOWVnnTqwy0lcrLxQiyu53jFhPNbu4IbOpMtkX5tTL0fA6Q88zssReEEUCM805wbL
 QA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JhYDg3Hv4gco9LB6XeZ1unYrJu/xgj/tQEkCfCDtBNQ=;
 b=F6+vGgTZ5sxWRcbNf10gGWNxMjGFbo8itYppej6Q42vKPwMjnS8KFT4evM0IkmfZ9I
 n59EmX638kq/ksNCWouL4kqp6xP7TuHvo+wD7Ey2loYGe+soBU/lIUmG+XoPy7IoQKyQ
 seaSGBX+JcexGsDpz8YirRRq/cXLRj3mxa+d4IJnge186GNmVIywiYTCEj1rzEMWnhw2
 BTWL5H1KIubQQ/CAYXUVXSMTrGvASGlg+9GhRPAj1kEZOOICjtHLuMvDsEXRS9Hzlgfh
 9NRnsDUe2GDPFwUxlFtIjW3d/66vY9FJlIAlKrZ2hnif0yTfNICh9YTcLdjwYH4uhRG1
 8i4Q==
X-Gm-Message-State: APjAAAU58JoWh6kllVJPh8KHQvDxk1j8uJc7XjdLtU5FEGybbIGnorkN
 OlLbS3n23ZwBMZ67U9qmmq+x5H5U9FCiVPx6hdn7Gw==
X-Received: by 2002:a9d:7504:: with SMTP id r4mr6253648otk.221.1567765002624; 
 Fri, 06 Sep 2019 03:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190827160554.30995-1-eric.auger@redhat.com>
 <20190827160554.30995-4-eric.auger@redhat.com>
In-Reply-To: <20190827160554.30995-4-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Sep 2019 11:16:31 +0100
Message-ID: <CAFEAcA8PCRxTnfhOuo2e4C2xVnn7EX1RWEcKurhNohi-WS+qow@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [RFC 3/3] virt: Check KVM_CAP_ARM_IRQ_LINE_LAYOUT_2
 for smp_cpus > 256
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
X-TUID: z7NXKBcSRdBf

On Tue, 27 Aug 2019 at 17:06, Eric Auger <eric.auger@redhat.com> wrote:
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
>  hw/arm/virt.c        |  7 +++++++
>  target/arm/kvm.c     |  7 +++++++
>  target/arm/kvm_arm.h | 13 +++++++++++++
>  3 files changed, 27 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 0d1629ccb3..bcc8d64384 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1575,6 +1575,13 @@ static void machvirt_init(MachineState *machine)
>          virt_max_cpus = GIC_NCPU;
>      }
>
> +    if (kvm_enabled() && max_cpus > 256 &&
> +        !kvm_arm_irq_line_layout_2(MACHINE(vms))) {
> +        error_report("Using more than 256 vcpus require a host kernel "
> +                     "with KVM_CAP_ARM_IRQ_LINE_LAYOUT_2");
> +        exit(1);
> +    }

Is there some place we could put this check that isn't specific
to the virt board, so that we don't need to duplicate it in
any other future KVM-supporting boards we add?

thanks
-- PMM
