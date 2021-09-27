Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4037144lfp;
        Mon, 27 Sep 2021 09:53:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYqhr4PLm6On0TPsckxa1uziUIgQLxoVkBFMbCDsV8AbtRvaGkB1U69E5p8p31YEIRcySN
X-Received: by 2002:a1f:1841:: with SMTP id 62mr1066155vky.26.1632761595473;
        Mon, 27 Sep 2021 09:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632761595; cv=none;
        d=google.com; s=arc-20160816;
        b=wXsjMEPueaCUod0ZBg7PWnAgSsAnEzOV7rICuQEVGCturcnaKPZGE3ZRf+AVEIrzNF
         +7nH9LIS834hm5QtILuvGYEx61UpfQ8MV3PiiDNNnXIw+xNLX4iHEGE9mnBK+Cp9spxC
         tECRZ3RqbLTOpkaHQESX5IIGa0NGqfzbfXSq+3UdOzZTDZm13sDuOUnXZNWfANLDRAEB
         C1wQ3jg1bS1d+YUZtTWiGI8IQ/c5g3EDMV1rMaGOy8rCo+4pbjG0yhh9JNxJjmIpPzmD
         8Fimv0fLOlSogPrO/fqMT9MmGg9X5+xja9W5iQHmqUCe187sJgoqxDZEPFk7Q4YfxMIr
         T+ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PFzgva5z7PTn4Yiue0fku/vXW64seJT1Ki+A6C595O0=;
        b=yJW0NcdmHcpyILP7c6TvDr3Un57/dQVbqKsw16pWOd68p7S1SlPTs2Y6e3gnk9AoQf
         a6Hibn2vxXaU7qUoo/IvgiDDGHarOy8QhPmB0Pe6ZLYjk1ej8jmy6SshthCv9FUON0yr
         kh8Y8qNpQs3U9vhnGiinkfOD5s3JaOGftKRma2wI667UB9m1Z7uHf1WPZdOxol3lkLbC
         gn/WIci6HXzRK1yo6bfPYOqo0t68hzCg23AVSZ2tJ/zKA47ei3aquIwgMAIMp9AaOzdd
         QFRGDYGvvsDckwH6BgKZiXX8r0NUkRTrM2eowRMF4BrVcL0e0jgn9OPel8Hgbq+7DPiC
         KBwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F6mBdYn9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21si909569uaw.74.2021.09.27.09.53.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Sep 2021 09:53:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F6mBdYn9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUtsQ-0004Zu-Qp
	for alex.bennee@linaro.org; Mon, 27 Sep 2021 12:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUtps-0001Tp-6Z
 for qemu-arm@nongnu.org; Mon, 27 Sep 2021 12:50:39 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUtpo-0000tV-SL
 for qemu-arm@nongnu.org; Mon, 27 Sep 2021 12:50:35 -0400
Received: by mail-wm1-x330.google.com with SMTP id b192so1062765wmb.2
 for <qemu-arm@nongnu.org>; Mon, 27 Sep 2021 09:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PFzgva5z7PTn4Yiue0fku/vXW64seJT1Ki+A6C595O0=;
 b=F6mBdYn9LGp2LFUvAB8iml8c9PgKmx5f48FHPC8EhUvpdy8aTLNoROGB2pcdcByRU5
 rd48TMbo6XpBxHWxZV+kkWiReahrowtLhSz41px/pIwbBLDjGNkDVhCUtTRlJDZYKwy5
 nx2VJqsfTvXBpOnuEcQRCVBp8eu9VOEirkeuFITvE9duz48X1AG+sw/BGTuzLYuQlut/
 qf4Jek4rEIb+Zwogj4xw/Hj55IxLLbefQxqZeolCSuzOBoTAf6+D55O7jVyUfLJHOCtZ
 5wlHJzRtov6SIF6rdP1l5JDoWz1aQ5P1hb5mDkWMOLH3/wbHPdiAzVhPCkBk4juXzs2H
 roFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PFzgva5z7PTn4Yiue0fku/vXW64seJT1Ki+A6C595O0=;
 b=6aJtgKtcnesKz7K/HDn2GRjn9fj8UiPbenFqJ06eJSCGWI58rZNA7CaiOuMyfkeZ9S
 cm7PgZkI5ZrXnb13GSjGAdfeys0H6pGLGbg0f5DLoSvetx1u3+k0kIcUYStjSzZ8gJId
 WVMX2aHaHMmjEBV13tu0c8ilvfcIRLAzd3zttRevB5GpVFeSo1JHCLdG6L6fZRj5+U99
 55hnh0mjH1faQb/d6W9zT0noMPQJWlmOygXnSDiQ0lGb46em0Mn6WxxgJJ5heXyoor5k
 BuuH8j1Nx8eiVhoW/8foLW2CkBVXT424Unx+iPJSfpujImFXKPw1jdNc4taGzbEmKXXK
 HAhQ==
X-Gm-Message-State: AOAM533NojsYX+sIzsQ75zKbwt4gjd86YCav3IwuvV0ovbGF6SqhoqqT
 /8FQ3nFzxmn2Ct2EnSr2ZQ2d5HS0BwixjKH2fXA0Dw==
X-Received: by 2002:a05:600c:1988:: with SMTP id t8mr59669wmq.21.1632761430937; 
 Mon, 27 Sep 2021 09:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210926183410.256484-1-sjg@chromium.org>
 <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
 <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
 <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
 <CAPnjgZ1AO8575LYbwmuouNR5=dgNam6EFDC1_bai=8xAHdw7-Q@mail.gmail.com>
 <CAFEAcA8FsPcBELEZxiRMuFbKtmKTFgDHABePQ33hdxYRq0C0ig@mail.gmail.com>
 <CAPnjgZ2S7SXxHYd_bkcf+GcmmgEew3vpJkw+DRPqrpb44eLgcA@mail.gmail.com>
In-Reply-To: <CAPnjgZ2S7SXxHYd_bkcf+GcmmgEew3vpJkw+DRPqrpb44eLgcA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 17:49:37 +0100
Message-ID: <CAFEAcA-bk6PF_P3JOxQSCXo7Fh2K5AVygB9WwDUiK2fV9Fx5jw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: QlGzbDkatRTb

On Mon, 27 Sept 2021 at 17:04, Simon Glass <sjg@chromium.org> wrote:
> On Mon, 27 Sept 2021 at 09:46, Peter Maydell <peter.maydell@linaro.org> wrote:

> > My take is that this is u-boot doing weird custom things with
> > the DTB that aren't "describe the hardware". You should be able
> > to boot u-boot by putting those custom DTB extra things in a
> > separate blob and having u-boot combine that with the
> > actual DTB when it starts.
>
> Well this is how U-Boot works. Since it doesn't have a user-space
> program to provide configuration / policy, nor a command line to
> provide parameters (except with sandbox[1]), device tree is what it
> uses. All of its driver model and configuration comes from there The
> 'describe the hardware' thing has been discussed to death but U-Boot
> needs board- and arch-specific policy information about the hardware
> so it can actually boot successfully on real systems.
>
> It has been like this since U-Boot started using device tree, some 9
> years ago! I can't imagine it changing.

> As to a separate blob, isn't that what I am suggesting with this
> patch? QEMU doesn't support passing two separate dtb blobs to U-Boot,
> nor is there an API for that.

You're suggesting "QEMU should have machinery for taking two
blobs and combining them and passing one blob to the guest".
I'm suggesting "the guest should combine them" (and the second
blob could be provided via several different existing mechanisms
that amount to 'QEMU provides some ways to load data into guest
ROM or RAM'), because as far as I know no other guest has this
"combine two different bits of dtb for me" requirement.

> Even if we did that it would require
> code very early in U-Boot to process, which would make it infeasible
> for anything other than QEMU. Ideally QEMU should work the same way as
> other boards.

Well, real hardware doesn't provide device tree blobs of any
form to u-boot, right? u-boot is just compiled into flash, or
perhaps launched from some other boot ROM, as I understand it.
Where does it get its dtb from then ?

> As a related point, I am looking at how we pass things between
> firmware components.  If we wanted to pass in some initiate state in
> some sort of blob, is it possible to set that up in memory (along with
> the binary) for when QEMU starts emulating? The code and RAM might be
> quite a long way apart so using a single image would involve a lot of
> zeroes.

The generic-loader is quite good for this sort of thing:
https://qemu-project.gitlab.io/qemu/system/generic-loader.html
You can load raw data files to specific addresses; or you can
load ELF files (which can have multiple segments which get loaded
as the ELF header specifies). You can specify -device generic-loader,...
as many times as you need to to load multiple blobs.

-- PMM
