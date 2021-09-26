Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3170143lfp;
        Sun, 26 Sep 2021 11:57:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAYXLU9XTsVzrls1tf4DJfbxskALv42Aeq3/F8dsSLapBXDq1jqgPKDki7J0NxAGRox3c9
X-Received: by 2002:a05:6e02:8a7:: with SMTP id a7mr17435934ilt.246.1632682628082;
        Sun, 26 Sep 2021 11:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632682628; cv=none;
        d=google.com; s=arc-20160816;
        b=Nlg/Qr87uTI/0CUACRCrBM4ESrL9NPVEMR4iv38AFwABcussecZxpSKtWk7+5RBtGT
         e2qHf3EvLBFKls+NF+TS/tu8PXsFkLUb2toLdRgowHGovFuhuKuoyLaiggK3/JavcPWJ
         tcO5m4HmSigkCEMz4yrBiROhd+p1tWv3S5LYosWiDU/CJsuvpK2p0KZkgaICtO+S7yih
         PZiYedJ8M4OWZHlT9mMaeZob+MjNDoREqLKlrHYnqJZqCb7GS1Wd1DZDcDpM7ELQR7Bs
         PchX8Mvbh5liFaWHIeHbHLAxvbxme700OrbEk7/2erZHoJFH6nCxAtF6OgISAsdRTmpc
         aBog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QyG8LUKoiJuona240wxgR1VvYFwuqPXh9SHPqugr1GI=;
        b=FbMRFMdhrsKNitQ6eZ6+5HZtZ/dxOMM+9n8HKwk1bQlYV1dO+tk9Vtb0uxfgb/r3X5
         VEHY+wCkG4goF8Z2VDO0mDfZVSM1zJ1iN67AzfgKrj8GP3gMCobMgF3+vQX0r8Czn/uF
         AAhFWrbjdfobOWVxq8FKCVz/+HjZoUkbeWEXnyp2CwSo5d7uypeFJnWs9Jml+FzfIHmW
         LKCDNqnwGXGy7qhdGrwN9TSHHn+hweVJjzjfQN3qsYFrLh9Mu1Tm/vFAODDvjCG6Az0H
         6Q7CJpeNuGcZ8fK9u3VfQ0wkxZ2urhL8UV9VC+a6DipvbjefwQXaftNAqdIVqJipbSIj
         uPLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@chromium.org header.s=google header.b=en0k4iwW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=chromium.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10si17528110ioc.1.2021.09.26.11.57.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Sep 2021 11:57:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@chromium.org header.s=google header.b=en0k4iwW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=chromium.org
Received: from localhost ([::1]:52336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUZKl-0000tE-Fy
	for alex.bennee@linaro.org; Sun, 26 Sep 2021 14:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mUZJW-0008GE-Qk
 for qemu-arm@nongnu.org; Sun, 26 Sep 2021 14:55:51 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:38536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mUZJT-0006M0-T9
 for qemu-arm@nongnu.org; Sun, 26 Sep 2021 14:55:50 -0400
Received: by mail-vs1-xe36.google.com with SMTP id y141so15764244vsy.5
 for <qemu-arm@nongnu.org>; Sun, 26 Sep 2021 11:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QyG8LUKoiJuona240wxgR1VvYFwuqPXh9SHPqugr1GI=;
 b=en0k4iwWL3frDbpErMim5v3kb8pR9jooEGCd9sDIxOIVdHJboiyCBmTEkom0Efez48
 23LFBtKimCqL3V+6GnXNRfFnuKl5ro3fs4O59eQh0friEwA1/EFnCS9dADVYko95Pu3a
 YAaOYlNFw0aKVsxzPYvQsnWs6gdwb3JqdpdTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QyG8LUKoiJuona240wxgR1VvYFwuqPXh9SHPqugr1GI=;
 b=2o47rV+iVZYeW8n8RrKhuss1RW+yZKbG4pvCXs25JaSyBApdyVsjJy5j/gURuRu3Lb
 YfSXOflxzgtyy5htZX/IbugZK9MHiu7g7NFzF4HDN8Zo0W1L0gRe7+g4HZwZx9POnyRg
 k71DV8w6p64JfEu5Zs5uXJt5qd3b7aaF7B8Ai2qHlc9HdfIOVTwpz2m26d+B5gNmxRWz
 FD/ihhsS/jsLgKv7xhmH4bTdk4SMaWG9EnfhXrRdWRdr3F37QKWuhFGsGcMb46QySHD5
 rRfsd8G0vi1n6LPiTFv3KmeUmvJ5Gb/Tq1qcY3kJk/ePsB5cL3/elfddKmNdtvGdKH8A
 NfNA==
X-Gm-Message-State: AOAM530njv6nr12qLPXuXs+nW3X2bTBRR5n6ewGijFS5HuLspnjmMdqO
 M021cbz9bH4ydXqCNYoiGMczmsdGTIoSZUonP6ufdg==
X-Received: by 2002:a05:6102:3a59:: with SMTP id
 c25mr16110800vsu.15.1632682543607; 
 Sun, 26 Sep 2021 11:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210926183410.256484-1-sjg@chromium.org>
 <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
In-Reply-To: <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 26 Sep 2021 12:55:32 -0600
Message-ID: <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=sjg@google.com; helo=mail-vs1-xe36.google.com
X-Spam_score_int: -92
X-Spam_score: -9.3
X-Spam_bar: ---------
X-Spam_report: (-9.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hYiGihQfUEra

Hi Peter,

On Sun, 26 Sept 2021 at 12:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 26 Sept 2021 at 19:34, Simon Glass <sjg@chromium.org> wrote:
> >
> > At present qemu creates a device tree automatically with the 'virt' generic
> > virtual platform. This is very convenient in most cases but there is not
> > much control over what is generated.
> >
> > Add a way to provide a device tree binary file with additional properties
> > to add before booting. This provides flexibility for situations where
> > Linux needs some tweak to operate correctly. It also allows configuration
> > information to be passed to U-Boot, supporting verified boot, for example.
>
> So, I'm strongly inclined to say "nope" here. The device
> tree virt generates is supposed to entirely describe the
> virtual hardware we pass to the guest. If a guest doesn't
> work with that, then either we're generating bogus dtb info
> or the guest is not handling the dtb we pass it, and one
> or the other should be fixed.

Thanks for the response.

In the case of U-Boot at least, it uses the devicetree for
configuration (it is a boot loader, so there is no user space to
provide configuration). So the current setup is not sufficient to boot
it correctly in all cases. On the other hand, the 'virt' feature is
very useful for testing U-Boot, so it would be great to be able to
support this.

I also forgot to ask about testing, but am happy to add a test if you
can give me some pointers.

Regards,
Simon
