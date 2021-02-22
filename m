Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1436892lfc;
        Sun, 21 Feb 2021 20:18:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzia/epL6MIpRLCuevIDFqRqZKZlWRWVdcI6HfI27+w6DZ2XC87Gncm9DbcrRNeRNQBlU48
X-Received: by 2002:a92:d1c9:: with SMTP id u9mr13631618ilg.125.1613967506571;
        Sun, 21 Feb 2021 20:18:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613967506; cv=none;
        d=google.com; s=arc-20160816;
        b=q3vVdOFi8Na9xlihXASKLSbBZACAqAHhHYykr5w6kq9eJ9fRZBM5Ae1VEhmBT1g13e
         6hkxLTABW5jPxJ50E036A64Xhj3NqwYXbgWgsG2l3vaZQvhbZWSUjJ3ZsgReWhMiY1e4
         4kIOcj/DmYoOnpR1NU8qRbPa6aOYn1wTZY5ilBAT9z3g1qzaZFCDZdxeUn6alt9UkRYF
         gPmuqRil4KovRQjfk6HDud1z4Z4j3mr7UwSlGVNfWXVZPW3I12YVmyTyqHihG9wF49pH
         8iP+ogKIVSUjZWPvmuuqRw7mf7FOaBg8YGPU4gQR21iDuPf9PPnw7hIpfZjbs65F17gS
         nyPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PalK0wdWgYPLF3gz0Qkedt33h46hfDnQhI162BuZA8M=;
        b=wOME0A3aRs5n973M7t5CXVpOMCULmaHj7Gv7PZ6+vAR5uR1RMrvcQ9K1vk2lAO0oce
         lKYbl//u6ZWeAkstgVITk+MPl9N1VALkKsJidGPEc5/o8OLcRb4D2X94t426/9Cn9gjo
         XfEXtWvH8x3yUaVO+tA9ziJiMwxFKNuoG9ZR4GhsmVjD1Q00YHDgGcWAr7czbv3hLf3H
         r+JAb5QTqVPesOAN0ZH+sI44FlDSOONBWH+kFOXcYOheeBDGHer5oiqMdHwNIvXHezVj
         V2jBY4q+7IDzZvDU0uv1AT4OKZgMRKSoc+KtjdtZyWJFdZrY/tG9ZV/4KPxNWsQvHIcB
         nRlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=azFVUK0u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si14799850jak.32.2021.02.21.20.18.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Feb 2021 20:18:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=azFVUK0u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lE2fx-0002Yc-SP
	for alex.bennee@linaro.org; Sun, 21 Feb 2021 23:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lE2fp-0002YI-9N
 for qemu-arm@nongnu.org; Sun, 21 Feb 2021 23:18:17 -0500
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:34199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lE2fn-000114-Fs
 for qemu-arm@nongnu.org; Sun, 21 Feb 2021 23:18:17 -0500
Received: by mail-il1-x129.google.com with SMTP id q9so9688868ilo.1
 for <qemu-arm@nongnu.org>; Sun, 21 Feb 2021 20:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PalK0wdWgYPLF3gz0Qkedt33h46hfDnQhI162BuZA8M=;
 b=azFVUK0u+6I3ypRDVFfAZjcCppebzaICtw55njJGpmdENqiF8NFXULPbavy3lDy0yO
 IFGbJMmdbmDCX1vufIUIaikE1Md551s/pcMMahLSPfoLey5RG/PC0V7Za1Med2l18SE7
 PNS4BO+JvCbdoM484BgOAHxfTYD6bOPxLDSM2qxZYGBaSY79WC0hPtzyig0PFXB+1JFb
 kZtp8syeCghJ2iPgXV1Pbj65TRruzYG4st3NgJB2EX+Zcb4qPAXhhufpDXm8satxlAgm
 aY7hkRe4bfvNeWuXAJvpf6tEtgLVzqTz6MI4wYlEoZO8fcC8WXZ7oqX2cCAnA8KCqTV+
 CjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PalK0wdWgYPLF3gz0Qkedt33h46hfDnQhI162BuZA8M=;
 b=NMnuelsEa0UEj+uVxje5QNWmg8MWPcIv1fk+H1M2G+n46XZpTBSpkFH8iLBkzTJqRe
 bj8UDHp7zpkztwZvB3Lp5/YkRmZv/wYTiYmV+jhxMZzNpNXg0NuIOMRQ2Nz/N2BfDuu+
 gih7gpAfCaYh+Tl+x6QcmVKOBVDj7FtHweGGL5T/kCEK1N9CGIEzP6fbxINN0D0aZdU5
 2U0J2tx5jYLiBtncmzQrX0hd/uWQj+VXx58s+ZaXcMML5tcDL90uneMsSWabumfAVV3d
 s/e7/ePQpAH2dYd3KkQn9thzzyGlIuIEcg0P8pFSLwsA8RMjA+7fcfAmz6blEDbdcQNn
 r61Q==
X-Gm-Message-State: AOAM530G0BlwsmGD6blzpQDdrpGENxx2VMGs3z5IOyMjaELKQ4SenVBS
 KO0BHopXlMHbFzIPM83Fmfdxj07INGTA7Z8W+Y1o
X-Received: by 2002:a92:ad09:: with SMTP id w9mr13266827ilh.23.1613967493415; 
 Sun, 21 Feb 2021 20:18:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1612747873.git.haibo.xu@linaro.org>
 <CAFEAcA9ex-yxv82ixBahQSuYphiasGtGB59nmpYZR3WXgSqw6g@mail.gmail.com>
In-Reply-To: <CAFEAcA9ex-yxv82ixBahQSuYphiasGtGB59nmpYZR3WXgSqw6g@mail.gmail.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Mon, 22 Feb 2021 12:18:00 +0800
Message-ID: <CAJc+Z1ENDPcBf0ezxSpCaOV2WOVs4E1b3OSnwEapCLuDUdaWzw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] target/arm: Add MTE support to KVM guest
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z3Jg/8g/CS3p

On Tue, 16 Feb 2021 at 19:20, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Adding the migration maintainers to the cc list, because
> the real meat of this patchset is "how should the migration
> of MTE tags be integrated into the migration/ram.c code",
> which is pretty well out of my area of expertise...
>
> thanks
> -- PMM
>

Hi Peter,

Thanks for cc-ing to the related maintainers!

Regards,
Haibo

> On Mon, 8 Feb 2021 at 03:20, Haibo Xu <haibo.xu@linaro.org> wrote:
> >
> > This series add support for MTE(Memory Tagging Extension)[1]
> > in KVM guest. It's based on Steven Price's kernel KVM patches
> > V7[2], and has been tested to ensure that test case[3] can be
> > passed in a KVM guest. Basic pre-copy migration test also passed
> > between two MTE enabled kvm guest.
> >
> > This is a RFC patch series becuase:
> > (1) Need to add some arm MTE specific codes to the ram migration
> >     loop. There may be better way to do that in a more abstract way.
> > (2) Only pre-copy migration is supported and tested currently,
> >     post-copy as well as compress/zero page migration are still WIP.
> >
> > All kinds of feedbacks are very welcomed, especially for the migration
> > support.
> >
> > Note:
> > (1) To support MTE migration, tags for one page are appended to
> >     the page data during ram save iteration which make it easier
> >     to sync the page data and tags.
> >
> > [1] https://community.arm.com/developer/ip-products/processors/b/
> >     processors-ip-blog/posts/enhancing-memory-safety
> > [2] https://lwn.net/Articles/842827/
> > [3] https://elixir.bootlin.com/linux/latest/source/Documentation/
> >     arm64/memory-tagging-extension.rst
> >
> > Haibo Xu (5):
> >   Update Linux headers with new MTE support
> >   Add basic MTE support to KVM guest
> >   Add APIs to get/set MTE tags
> >   Add migration support for KVM guest with MTE
> >   Enable the MTE support for KVM guest
> >
> >  hw/arm/virt.c             | 44 +++++++++++++-------
> >  include/hw/arm/virt.h     |  2 +
> >  include/migration/misc.h  |  1 +
> >  linux-headers/linux/kvm.h | 15 +++++++
> >  migration/ram.c           | 86 ++++++++++++++++++++++++++++++++++++++-
> >  target/arm/cpu.c          |  2 +-
> >  target/arm/kvm.c          |  9 ++++
> >  target/arm/kvm64.c        | 31 ++++++++++++++
> >  target/arm/kvm_arm.h      |  2 +
> >  9 files changed, 176 insertions(+), 16 deletions(-)
