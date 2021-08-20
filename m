Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1112624lfg;
        Fri, 20 Aug 2021 02:16:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYDnH3SILE40Uks+8/p2+W8H65Ds2LEGcRFH6hNo881V3QRCYGbW1f2hJ1WPyRthdVQC16
X-Received: by 2002:a25:e7d0:: with SMTP id e199mr24874718ybh.203.1629450987130;
        Fri, 20 Aug 2021 02:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629450987; cv=none;
        d=google.com; s=arc-20160816;
        b=WVyU1uNGz5XY/KEpJRsWZ6QQKWOzlBQ61y4dpVKW8VhUF9DevA3uRCkwQHKz3LG1Eb
         TanEAAhFQbJ98wl+dFjvi6dNGeKN4c1cu9E9ATjz4sIDm5f6cwM/JUvIPqHpEv0Pty1G
         6VBYDt33lTptY0VRf8IJxW1pIBWP8SZKh0BFgTcP9Y58UgXhSGmDBzUiHxDmqH3cuarM
         cEDFvSMVjxXsM2q+bnmms4Ut+ctp639LrTOYGyy1DdV9iZ3m1LfE7EjaATTeB8ydfBhh
         +SoQnLc1YmWXOJXxA6k1bAXGadAw55z25x5I2clLu/baVLM5OwqanFOLd883h31ISXFP
         04Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eUdAcmcpc+9M3VpWdDaT19cYEgvqN6Ya6/ceWZyGAlE=;
        b=qaIR4YTdyZ2D6KbhuAHFSVHjERujPn/gis9i92QGNck4Yp4r28otoCQiC73ktDAxIN
         +SjqtfFfaBg34Rim5mmVNs98AD370tN7W45K6dJxP5Kuqymt7duTBIituss/71VIytq3
         f4yS9GUv+iQSn7JO1AbcSgiDpIOzk/k4vZyaa6dOifwRebyAmDaaFMc060Ly2vMpDzws
         +z/avYJelxKKiAGiWR3TqfJt2xrDgg+a522nq2k5pa7kBAtK2swGmi7L4zZGmzVQpsDt
         /ZyXEnBk03JflGw8OnIIXDqoTd0zxZsPmw4q4HWDRI2bUitmeu9O7M3rq2jzGSoBdyqK
         +g/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KHx08BkL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4si4875716ybl.339.2021.08.20.02.16.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Aug 2021 02:16:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KHx08BkL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mH0dW-0007qz-HX
	for alex.bennee@linaro.org; Fri, 20 Aug 2021 05:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH0dO-0007pB-JW
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 05:16:18 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:39580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH0dM-0000eM-Nb
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 05:16:18 -0400
Received: by mail-ed1-x52a.google.com with SMTP id cn28so13018176edb.6
 for <qemu-arm@nongnu.org>; Fri, 20 Aug 2021 02:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eUdAcmcpc+9M3VpWdDaT19cYEgvqN6Ya6/ceWZyGAlE=;
 b=KHx08BkLTNvWuZECdy0I61wkvfUf0QXPPusurYPFjfxjvRkak9NeyKWX8Pd1EA7kmL
 ljHb0/4HGsNI+7rK8mQmHrCyZTqYB9PPJ4M2pje47KXC4JkAkeFRc7/D2PJRWVC7H0Uf
 WQg8vJLsfqlCKJIPZb7WFH6wUF+4wmODfI2CFAZc0eerTIyUT34bRDJ8c3XV5hQJ4HnI
 fOc4PFU4357EXaWePD2hMrHgwQvq7eziUrL/TGtTCSinqgA/Jz91meGQM5jdBc6ewKdX
 xW9rx/a1Y8BCPQ8SvT2rfcVSRpn9M6OP/XIO4eysS/LksakLCrbO1eNG12MoXOBIYx+t
 x4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eUdAcmcpc+9M3VpWdDaT19cYEgvqN6Ya6/ceWZyGAlE=;
 b=LORfnnsom2ckOdn/d37tEZKaSjJyqWBxu4fF1szQGhF6fXxAhKYLFy2bMuzZc9drow
 myrH7idwmIzIy8AbS+6Vwl4rrtiB9vLXaJQBjhKfpKZt51g2RjmH6YEt6pDm46DEsph7
 Pt7ZhJ2UQtr19Tgj0CsVonn5jkwb1Ivcm5HfiY34X7eoBJZJhVEtXbmwurlhk+uR1EPY
 ievaLjx8y5HjVzNfzd0m1e9SzTn1JLpupkefaDFK6OyaeQSvP1T144VDdbua0Ia/g0Ue
 IWGY3fvuQ1/cL0m5NeRJNMXrWscsJt0vx6ewNe+y5xRAJm5ddvDlXzKV/axXfLGm+G5U
 0VPQ==
X-Gm-Message-State: AOAM5310OeNWG3xfTkIrwVRvr3QgP/Z4SOaGp6aCZ6nhrTwcdylMEXL1
 TLFwRh1JcvmT9/fdYqwtoncxBClhEflVDZmsGI87vg==
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr21164531edb.52.1629450975093; 
 Fri, 20 Aug 2021 02:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5748@SHASXM03.verisilicon.com>
 <CAFEAcA-L-9AjGGLCynbDbF=apQe4J_CrWE7RFKddHiD1L1qKHg@mail.gmail.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5A05@SHASXM03.verisilicon.com>
In-Reply-To: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5A05@SHASXM03.verisilicon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 10:15:28 +0100
Message-ID: <CAFEAcA_g59GdK+X366xkWj+znz8B_TTufBMvgvND9TS+dnjEdA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmuv3: Support non-PCI/PCIe devices connection
To: "Li, Chunming" <Chunming.Li@verisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: "eric.auger@redhat.com" <eric.auger@redhat.com>, "Liu,
 Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wST8HnkQAX91

On Fri, 20 Aug 2021 at 10:04, Li, Chunming <Chunming.Li@verisilicon.com> wrote:
>
> > On Fri, 20 Aug 2021 at 03:36, Li, Chunming
> > <Chunming.Li@verisilicon.com> wrote:
> > >
> > > The current SMMU V3 device model only support PCI/PCIe devices,
> > > so we update it to support non-PCI/PCIe devices.
> > >
> > >     hw/arm/smmuv3:
> > >         . Create IOMMU memory regions for non-PCI/PCIe devices based
> > on their SID
> > >         . Add sid-map property to store non-PCI/PCIe devices SID
> > >         . Update implementation of CFGI commands based on device SID
> > >     hw/arm/smmu-common:
> > >         . Differentiate PCI/PCIe and non-PCI/PCIe devices SID getting
> > strategy
> > >     hw/arm/virt:
> > >         . Add PL330 DMA controller and connect with SMMUv3 for
> > testing
> > >         . Add smmuv3_sidmap for non-PCI/PCIe devices SID setting
> >
> > Please don't try to do all these things in one big patch --
> > put together a patchseries with several smaller patches,
> > each of which does one self-contained thing.
> >
>   Got it. Thanks for your comments.
>   Let me try to split them into several smaller patches.
>   But all these updates work for 1 thing. They are depend on each other.

Yes, that's why you send a single patch *series*, which has
a cover letter that explains the overall purpose. Then each
individual patch in the series has a commit message that
describes what that specific patch is doing. As emails, the
patches are all sent as follow-ups to the coverletter.
"git format-patch" and "git send-email" should handle this for you.

https://wiki.qemu.org/Contribute/SubmitAPatch#Split_up_long_patches
has a little more discussion of this.

> > If you have a patch that depends on another, it's usually better to
> > send them as a patchseries. I was wondering what the reason for
> > that PL330 patch was...

>   I need a non-PCI/PCIe device to do the verification. The old PL330 DMA controller
>   cannot configure its memory region manually. So we update it and provide path.
>   PL330 patch was reviewed and will be merged in target-arm.next for 6.2.
>   The virt.c compile will fail if there is no PL330 device patch.

Yeah, I accepted it because it is a sensible cleanup on its own;
but it would have been a bit easier for me to understand why you
were doing that if I'd had the wider context.

thanks
-- PMM
