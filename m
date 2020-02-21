Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1848242lfg;
        Fri, 21 Feb 2020 06:10:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqws/hERvEyhhaGByAInAsls33824cFwUSe0DoSj7PPc/uQSwH8G7h92Vq3ewGpDpw1rsaQ5
X-Received: by 2002:aca:ebcb:: with SMTP id j194mr2179899oih.154.1582294208612;
        Fri, 21 Feb 2020 06:10:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582294208; cv=none;
        d=google.com; s=arc-20160816;
        b=w7OPk7PX71CtOEcovjQy/gP74MgHNykyt8KG4OKsZrHIvUONNCoI+YVsc7M/pAizhE
         7HB9vBJT88VC1mxp+6dBBksX9mI7tpfJZv4Nt69HAMYBudMDjv6trAoV7oSNGD1GYsA9
         KFh2gmLf+5r3Shdfsk5S3ueL0CSglR+9GDl6ri03WKqMzsTA6Z+I1Pp9Eb2aSUSVXaHl
         RMfcF+AgCfS2tlTq8hhcCwnRs97ZG300JodQF1jvJXPfm5yZ66Yv/EvbDH19MdDW8nZO
         J+30g2wkwlPs1Af/a5n9nSvtkbA6kZKGq6JTuk8wBIdwcHlkexDK+1lFXrhv2sRIzDya
         RuuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FWVDkmsgLpByHs3eCi6sKclY4YV1R37ovc1jJnUhQAE=;
        b=tsNc3iZnyvJk8pLSRdjBvdacJGe2jcbXnRXFD3wNlZ7a2792hXjNqEBBA2yaCrqGXE
         21v2ATrDj5LjX5nxp9P+uIIfKYr8yoDg2aor1LlAn1Ev7YhEch8bLycWMjrzyS+9Mdo0
         Y9IeomLuIBEfvdm/bdKZPxfJ5ZwxR7HVJVXl2rQf06+VpT8az6B+yudNIhrFkXNzdoq0
         FTpmRS+hrhDSmIsvgbgxTTrejxO2SskmDu+AhVQ9Ht+ec2b949gipvtK5lCkONJqRD0d
         dIX6lN+rRnDNCQvfRfJKphTtzOlTRF2WQ2S7YtzULjhWwNmhm7x3+/IE9tACpl1Ik6jr
         1wVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sYZNsPMd;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d12si1494300otc.307.2020.02.21.06.10.08;
        Fri, 21 Feb 2020 06:10:08 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sYZNsPMd;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbgBUOKH (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 21 Feb 2020 09:10:07 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38443 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727836AbgBUOKH (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 21 Feb 2020 09:10:07 -0500
Received: by mail-oi1-f194.google.com with SMTP id r137so1677540oie.5
        for <kvm@vger.kernel.org>; Fri, 21 Feb 2020 06:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FWVDkmsgLpByHs3eCi6sKclY4YV1R37ovc1jJnUhQAE=;
        b=sYZNsPMdslZdcvPHvQQcr0WltYjiT/Uxn2SLB7obLof1d3EgJ7b4163UoteGPlJyI1
         +s03NrPStjcs/pVGnIHr9ChIdcfXtK6BRPBd1Cp+mL8gjozESrb3QD8N1Fx1nL/MwLKa
         pAzdzPqEtcG6RROcunEocDFvsspFUuVkJZd73lXwyt5e0llpr8oyujVqnZGKseJXdE7s
         16ZFclOcmt6UjH8NLi0wkdjpxq76TL/EdfKJbXfCUIy88AC2t2O9c54P4yRnRISlE7eD
         mx3AOfZ/SmkSaZOefFkfg3yyxutIppFJXE/2zrjoZtoAVP7kultq2C0dsqJzbVNwGtkJ
         WYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FWVDkmsgLpByHs3eCi6sKclY4YV1R37ovc1jJnUhQAE=;
        b=HgVmE+EC5zazPil2i1WNTJitMq23qen1DZFBwWPlmDYRGibrEd6h1KPDPE1RpXes1j
         vl2+No16LAkjUSyo2kfYrm7T4GUiizB0XFGva73IwoVm8BpPqhAR9oESfZZdz3wusWgG
         uwsdYbGHb42OidNUGL7B0HVJZ811dQDAjR1aPhAATT8MNC62UoVHs8aWJTiUafG2Gtzu
         +QrR0a5X34NkrmO82MEkNXhEFWqavoV1xroD9W163NVXWFrCvv2YFjKiRwHaCMueLUN+
         g7jdD5/fpr5656cAvNa1EQr6vsgaaVgrQVC8zKIAo/JhRc9bXV5otOnRlyiYdnhwnB2x
         F0nQ==
X-Gm-Message-State: APjAAAUAGO1Rh88CA7U+WE8mRSAKzwUGp5tmdChB4XXR4fk/SIbr1J4v
        ac7jHfOeoFAgvWo+5Wa9DdhI/ixM7IM+ek2kHX4r1Q==
X-Received: by 2002:a05:6808:289:: with SMTP id z9mr2098991oic.48.1582294206446;
 Fri, 21 Feb 2020 06:10:06 -0800 (PST)
MIME-Version: 1.0
References: <20200217131248.28273-1-gengdongjiu@huawei.com>
In-Reply-To: <20200217131248.28273-1-gengdongjiu@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Fri, 21 Feb 2020 14:09:55 +0000
Message-ID: <CAFEAcA9xd8fHiigZFFM7Symh0Mkm-jQ_aGJ7ifRCrXZvFY4DqQ@mail.gmail.com>
Subject: Re: [PATCH v24 00/10] Add ARMv8 RAS virtualization support in QEMU
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Fam Zheng <fam@euphon.net>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        kvm-devel <kvm@vger.kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        James Morse <james.morse@arm.com>,
        Laszlo Ersek <lersek@redhat.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Shameerali Kolothum Thodi 
        <shameerali.kolothum.thodi@huawei.com>,
        Zheng Xiang <zhengxiang9@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: f2rqy2+Dwti6

On Mon, 17 Feb 2020 at 13:10, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>
> In the ARMv8 platform, the CPU error types includes synchronous external abort(SEA) and SError Interrupt (SEI). If exception happens in guest, host does not know the detailed information of guest, so it is expected that guest can do the recovery.
> For example, if an exception happens in a guest user-space application, host does
> not know which application encounters errors, only guest knows it.
>
> For the ARMv8 SEA/SEI, KVM or host kernel delivers SIGBUS to notify userspace.
> After user space gets the notification, it will record the CPER into guest GHES
> buffer and inject an exception or IRQ to guest.
>
> In the current implementation, if the type of SIGBUS is BUS_MCEERR_AR, we will
> treat it as a synchronous exception, and notify guest with ARMv8 SEA
> notification type after recording CPER into guest.

Hi; I have reviewed the remaining arm bit of this series (patch 9),
and made some comments on patch 1. Still to be reviewed are
patches 4, 5, 6, 8: I'm going to assume that Michael or Igor
will look at those.

thanks
-- PMM
