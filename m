Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp6205855lfc;
        Wed, 27 Nov 2019 06:17:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqxElPs8x8iuDW/V5TPsC+4VCYSuYuRNIX354SbJCrfeeTNKm0GP2qEBM1xKokpL3m6Z04l6
X-Received: by 2002:a17:906:f29a:: with SMTP id gu26mr4472371ejb.236.1574864271254;
        Wed, 27 Nov 2019 06:17:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574864271; cv=none;
        d=google.com; s=arc-20160816;
        b=yMDObWrhNE5/d5HdDB444nzcuUc5zx5Ue9JJFnX6DJbR7RUPZrTyL6GecjmoZwb3S3
         GGT0nUfcAaO7yCAv5CJxs6653ri9NbG82mbzCpNqPj4Kou8juMAi9bOZ1LsCKtqy8yDL
         yd0HHfHLIFQepjAMMYAbYfkHy9PITrNvfvnyXWLYjz/Tmr9jz9kQMDoEB3k+Hrkcs84p
         3/QyOJqGk7KGHLfR7ACnam1US8hNMYMbua6Y5eCveB2XkiMSJZS0J1O4kMisOyyxBW0c
         EVTwOcvittQKkvdA6zIBBsL5bsa4H9UWwPaFgdHGyjEXRy1pn6kff/EsdVf3GKoOryqj
         9XHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rw6SqncViG8g/U65iBJl9Eo11IFYNdAKyB4CIX6LA7Y=;
        b=nT0ntk3DUfn4rTMHYkBUeoLXDPgo9lgXpHMwUnRCAJWuaQZ9/pkLmK+TeDNKMWY6nM
         k3ltBkQcLbAJ3g/9dchbZoDtHr/aFLnyvjk3LciVYuCvEWE0TOWweh0IQOkpU80mQbbc
         12LBkjodVgBiIeEcZjVZJjbpFnuMpBv+Ktv0YNsiKrXDXETNDWm510xSrIti+dk1DiA3
         tEakl/LYoZGAksZ/bioJsgWzOI2nsNJa09W4Mm9N3yGxDuirIUcmBrYOhpQnxQiVUz0H
         SeJ+xq4hOpZQuX9EPVuaac0j8j7PmXxD8Wa0tMmu8KrlfowN7PnrmddPu/IS8g/gZzOj
         Sv+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NkeqXxiE;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id k2si1129946ejq.151.2019.11.27.06.17.50;
        Wed, 27 Nov 2019 06:17:51 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NkeqXxiE;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbfK0ORu (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Wed, 27 Nov 2019 09:17:50 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:37034 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbfK0ORu (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 27 Nov 2019 09:17:50 -0500
Received: by mail-il1-f193.google.com with SMTP id t9so1520327iln.4
        for <kvm@vger.kernel.org>; Wed, 27 Nov 2019 06:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rw6SqncViG8g/U65iBJl9Eo11IFYNdAKyB4CIX6LA7Y=;
        b=NkeqXxiELq3Qla7YMc4HegwW2zKyrSBGtSZW3Vd8bkU1i5AF1pz9fkkJy+xi3xBlXZ
         l1yuRnFXvSaifgVZ9s5oymK/qU6lZoaNCm9UkxC5eqyk+1YjYfP+RlGifFpllq5tvbc1
         bzZu9odtQ8ht/zy6Cj+rlTPtwymN2mtlk8rRWlzcsGYfIGHQjAl13UYFuxwHqA72aKdl
         gZsX+vbYlOT4ER1oB7ez/TTbD18aAykqrndoUZWdz2pUSZKLeM8i6gZixEg4ydzJDh7+
         5hG4uWyoRjvUDenbnm+VoiL6xCJCmEAvx4maBL/bqqgsTrsENC9mqSKcBX4xwNwIcfMi
         ZHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rw6SqncViG8g/U65iBJl9Eo11IFYNdAKyB4CIX6LA7Y=;
        b=V/tJz27UWlaYXPJa5awmEBit61fkrAEA3AL6oZ2tqHmIduNw0McO0I5dp9X3ZrBL4J
         1HTVC3TSYuDsa2n06J8slvgR9ckl8WKqosbNCg+g3aVt/lWit+gi/LjU/aYKuffYs90B
         T3sUIW0cpYnULXQLmCCKL/nHeLQHMRYdVnV2C9KytY29AxDAoQNDl8jITv/ltGZHJZsx
         SJpAB4wZP9YGiPnRP9OKnf9p07j74qVbnaQssGVeE7H1YKatV3BAbEqHVwrfnCe8AkK1
         27z8h9/hRlvFu5zPtjni2EC1ncd++EywgEry+6zBKEWH5dMjNJUThfxuQ0jV/70CMbJY
         Kyjg==
X-Gm-Message-State: APjAAAXNzpkdrliB9rlS7Ynvat5uKlhGAdEiHgJxqvt88s33HBoEC86q
        vvdd8nTW8jS3IDd/FOrDEyUvVQ0rzL+SO+X/+7o6fg==
X-Received: by 2002:a92:4010:: with SMTP id n16mr47263368ila.260.1574864269210;
 Wed, 27 Nov 2019 06:17:49 -0800 (PST)
MIME-Version: 1.0
References: <20191111014048.21296-1-zhengxiang9@huawei.com>
 <20191111014048.21296-6-zhengxiang9@huawei.com> <CADSWDztF=eaUDNnq8bhnPyTKW1YjAWm4UBaH-NBPkzjnzx0bxg@mail.gmail.com>
 <22a3935a-a672-f8f1-e5be-6c0725f738c4@huawei.com> <20191127140223.58d1a35b@redhat.com>
In-Reply-To: <20191127140223.58d1a35b@redhat.com>
From:   Beata Michalska <beata.michalska@linaro.org>
Date:   Wed, 27 Nov 2019 14:17:38 +0000
Message-ID: <CADSWDztu=aP=ckxLsKdP7URmYFLn=JtOcm=zMAGJXo-G_9TOHQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v21 5/6] target-arm: kvm64: handle SIGBUS signal
 from kernel or KVM
To:     Igor Mammedov <imammedo@redhat.com>
Cc:     Xiang Zheng <zhengxiang9@huawei.com>, pbonzini@redhat.com,
        mst@redhat.com, shannon.zhaosl@gmail.com,
        Peter Maydell <peter.maydell@linaro.org>,
        Laszlo Ersek <lersek@redhat.com>, james.morse@arm.com,
        gengdongjiu <gengdongjiu@huawei.com>, mtosatti@redhat.com,
        rth@twiddle.net, ehabkost@redhat.com, jonathan.cameron@huawei.com,
        xuwei5@huawei.com, kvm@vger.kernel.org, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, linuxarm@huawei.com,
        wanghaibin.wang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: pZoBKEVIaDFD

On Wed, 27 Nov 2019 at 13:03, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Wed, 27 Nov 2019 20:47:15 +0800
> Xiang Zheng <zhengxiang9@huawei.com> wrote:
>
> > Hi Beata,
> >
> > Thanks for you review!
> >
> > On 2019/11/22 23:47, Beata Michalska wrote:
> > > Hi,
> > >
> > > On Mon, 11 Nov 2019 at 01:48, Xiang Zheng <zhengxiang9@huawei.com> wrote:
> > >>
> > >> From: Dongjiu Geng <gengdongjiu@huawei.com>
> > >>
> > >> Add a SIGBUS signal handler. In this handler, it checks the SIGBUS type,
> > >> translates the host VA delivered by host to guest PA, then fills this PA
> > >> to guest APEI GHES memory, then notifies guest according to the SIGBUS
> > >> type.
> > >>
> > >> When guest accesses the poisoned memory, it will generate a Synchronous
> > >> External Abort(SEA). Then host kernel gets an APEI notification and calls
> > >> memory_failure() to unmapped the affected page in stage 2, finally
> > >> returns to guest.
> > >>
> > >> Guest continues to access the PG_hwpoison page, it will trap to KVM as
> > >> stage2 fault, then a SIGBUS_MCEERR_AR synchronous signal is delivered to
> > >> Qemu, Qemu records this error address into guest APEI GHES memory and
> > >> notifes guest using Synchronous-External-Abort(SEA).
> > >>
> > >> In order to inject a vSEA, we introduce the kvm_inject_arm_sea() function
> > >> in which we can setup the type of exception and the syndrome information.
> > >> When switching to guest, the target vcpu will jump to the synchronous
> > >> external abort vector table entry.
> > >>
> > >> The ESR_ELx.DFSC is set to synchronous external abort(0x10), and the
> > >> ESR_ELx.FnV is set to not valid(0x1), which will tell guest that FAR is
> > >> not valid and hold an UNKNOWN value. These values will be set to KVM
> > >> register structures through KVM_SET_ONE_REG IOCTL.
> > >>
> > >> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> > >> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> > >> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > >> ---
> [...]
> > >> diff --git a/include/hw/acpi/acpi_ghes.h b/include/hw/acpi/acpi_ghes.h
> > >> index cb62ec9c7b..8e3c5b879e 100644
> > >> --- a/include/hw/acpi/acpi_ghes.h
> > >> +++ b/include/hw/acpi/acpi_ghes.h
> > >> @@ -24,6 +24,9 @@
> > >>
> > >>  #include "hw/acpi/bios-linker-loader.h"
> > >>
> > >> +#define ACPI_GHES_CPER_OK                   1
> > >> +#define ACPI_GHES_CPER_FAIL                 0
> > >> +
> > >
> > > Is there really a need to introduce those ?
> > >
> >
> > Don't you think it's more clear than using "1" or "0"? :)
>
> or maybe just reuse default libc return convention: 0 - ok, -1 - fail
> and drop custom macros
>

Totally agree.

BR
Beata
> >
> > >>  /*
> > >>   * Values for Hardware Error Notification Type field
> > >>   */
> [...]
>
