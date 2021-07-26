Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp2986248lfc;
        Mon, 26 Jul 2021 08:42:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaHhoZTUBvTV6c86q0PstLK3nLlm3nB6nlXg2buGqtsgpI0b3SlNoSAJyuRSIdRcwrUt90
X-Received: by 2002:ab0:230a:: with SMTP id a10mr4210101uao.111.1627314149848;
        Mon, 26 Jul 2021 08:42:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627314149; cv=none;
        d=google.com; s=arc-20160816;
        b=axHnuEXPkGqqFv5zIIOo4sYrII1d0IyaHXSCRr9qJJ2PJhW/y/CuZNWitaiYTtpglN
         K3E64Jj4oyXGcs39AChZAFTM6SmBWIVDD5HywKYR5aXfJw+3Q2WF8hlABZnJIeBvL1gj
         3rrUvqF9rBmenBNGWOJe1r79jLEZ3xlJeBPaj6IdtmBppA+c5H0NIwZw/ki3o3xYKHyo
         DVqFdbUO9347MKVGr+fnTClA4FqN4HZC8tuAmjdUqRY3mMewOYKRtnsbucatB98GkSt4
         byrKCTuLSomTUBATjZUZFo+lTeF9e2rDzLV4d53gDFJaznXQNfxTFU8PO7JDcgagLpTI
         B9Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xn17/w/cYHBEpRlaWDRS5HB25/bVhOhpdJGaS1Uhjio=;
        b=Pa85256GOjVs/6DesOnkVjR/66yq9gVRHVwcsE/EoPAUp6mA9eT55Za4UurigOTHdM
         5csn98deYoWTYfRxerXxdOVBxcIMl82c+qKzmtattY7u1acbpJVcotMhIj8znt6eVFBD
         Xlcwxd8v103juJxQ/YtGHaMYWVrKND+ckH0TNHPgc2QBs797XY8b3JNPDojvPFVq19vG
         tw0xC16hXcR3Iq9WuVJO9zJ9DLtUROOZnBJrBewP0J4awWJpJJt5f6uAeeccsfHDR+zg
         5H5T9hL0YBW7MNpdBfkWc1D0hb4QFbRFKzfxmTm8mIGVbvIEHN3RohbocPPrjjUFIDqc
         a4bA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fcmCMs2Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z19si170521uap.185.2021.07.26.08.42.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Jul 2021 08:42:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fcmCMs2Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m82kP-0006GC-69
	for alex.bennee@linaro.org; Mon, 26 Jul 2021 11:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m82kH-0006Fo-TK
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 11:42:21 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:42809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m82kF-0003oi-UQ
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 11:42:21 -0400
Received: by mail-ed1-x52d.google.com with SMTP id p21so4054988edi.9
 for <qemu-arm@nongnu.org>; Mon, 26 Jul 2021 08:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xn17/w/cYHBEpRlaWDRS5HB25/bVhOhpdJGaS1Uhjio=;
 b=fcmCMs2Zv5oZQilxuhbAOfoxQzabTKQDu2pnD/VvFnMoqzCygjpnu5Q3yPRkzcmY36
 XTTzFtIy92b5WQofJIJo50JRoyuIEP8+jzuMzocWaC75piO44PbV4BqFYmFlelaff2ur
 CGQ3e1TcWykM7RIxudxQGy3GMEQ6PLgpYl4nnnOarIiXAmsMVrG4wdl7CdgKxPDs7XWu
 8YLyWLa6KNtjQu+SIajCePEt1e0LgSCio3CkqLfgpu3zTDtKNcFJijw1Zt4k3kMVVyd/
 XJHvS1GMJ05mq5vyvQR4lYQWNzv+Zr4NcHW6H50jh8GjzcZWdzdc/74d/bjOK7616Ljq
 7RXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xn17/w/cYHBEpRlaWDRS5HB25/bVhOhpdJGaS1Uhjio=;
 b=fjkqr/ySf36+7juJ3gsc3yCXC6nMo1TTy0avYCIZ8mHS6f4k3YyOH05heumv4ZcZmg
 WpL1y9XBc8uAK+r0fMxfWA3pbDp23mhwzGYiJJp2tQ0mWthglYF0uVanICAqZf1n+DFs
 Mf6L5LadmmLPE7Izg/ArH3SR/mhmEx/s9F9u6eyoPGtEgx09Rd3/RRDWIVkXUSUHG6OZ
 N7zD3B4yzQLizcJ7G+rUhNuq76KZGPEYqZ2kqqp0GFpf+VhxRc/uP4ntB8OdgXro+lhW
 ywJrAj8NCstza1aZlQITgYF1vua6hrrKpyFbvSGZ0JBVrkcTput/QK1j/Sxx+D5NyoKm
 jDuA==
X-Gm-Message-State: AOAM532abQtUg8lFBCquanR9Za6xcwAbZus6FutKxSyii7MoQ7QPNypt
 22lnaTOlqpAjG1c5t1HAVv1tCuuIVOelZYrDik9DUg==
X-Received: by 2002:a50:f615:: with SMTP id c21mr5770570edn.146.1627314137732; 
 Mon, 26 Jul 2021 08:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210723203344.968563-1-richard.henderson@linaro.org>
 <CAFEAcA_AKpibWQuX4gapGD+u=KCL9-er-ejPGS_cVyNbsuLJJQ@mail.gmail.com>
 <20210726150056.2sis5ssif2l3xjcf@gator>
In-Reply-To: <20210726150056.2sis5ssif2l3xjcf@gator>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jul 2021 16:41:35 +0100
Message-ID: <CAFEAcA8=ve-eDuk43yNV=VKvXX=cq_NswXWayrMkbAJu2VTdbg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] target/arm: Add sve-default-vector-length cpu
 property
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GGiaO2AQT4w5

On Mon, 26 Jul 2021 at 16:01, Andrew Jones <drjones@redhat.com> wrote:
>
> On Mon, Jul 26, 2021 at 01:42:45PM +0100, Peter Maydell wrote:
> > On Fri, 23 Jul 2021 at 21:34, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> > >
> > > This is intended to resolve #482.
> > >
> > > Changes for v2:
> > >   * Split out length bounding fix to new patch.
> > >   * Use byte units for sve-default-vector-length.
> > >   * Support undocumented -1 "maximum".
> > >   * Add documentation.
> >
> > I'm going to apply this to target-arm.next with the following
> > docs tweak squashed into patch 3:
> >
> > diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> > index 4ff36cc83f0..7b97df442aa 100644
> > --- a/docs/system/arm/cpu-features.rst
> > +++ b/docs/system/arm/cpu-features.rst
> > @@ -379,11 +379,14 @@ example's (1), (4), and (6) exhibit recommended
> > uses of the properties.
> >  SVE User-mode Default Vector Length Property
> >  --------------------------------------------
> >
> > -For qemu-aarch64, the cpu property `sve-default-vector-length=N` is
> > +For qemu-aarch64, the cpu property ``sve-default-vector-length=N`` is
> >  defined to mirror the Linux kernel parameter file
> > -`/proc/sys/abi/sve_default_vector_length`.  The default length, `N`,
> > -is in units of bytes and must be between 16 and 8192.
> > +``/proc/sys/abi/sve_default_vector_length``.  The default length, ``N``,
> > +is in units of bytes and must be between 16 and 8192.
> >  If not specified, the default vector length is 64.
> >
> >  If the default length is larger than the maximum vector length enabled
> > -with `sve<N>` properties, the actual vector length will be reduced.
> > +with ``sve<N>`` properties, the actual vector length will be reduced.
> > +
> > +If this property is set to ``-1`` then the default vector length
> > +is set to the maximum possible length.
>
> This file is full of single backtick usage. Isn't it better to stay
> consistent? Or do we need a patch that converts all the rest now?

I just sent one of those:
https://patchew.org/QEMU/20210726142338.31872-1-peter.maydell@linaro.org/

-- PMM
