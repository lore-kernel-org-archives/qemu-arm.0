Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1026961lfb;
        Fri, 3 Sep 2021 00:26:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0CObLtR+VAHG17+oQLfVPY5PT1uMuGSj1wGLQ5j2mTGBj55+/2Gr5ggcP26a2WhkFPstU
X-Received: by 2002:a05:6e02:d43:: with SMTP id h3mr1655061ilj.112.1630653988885;
        Fri, 03 Sep 2021 00:26:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630653988; cv=none;
        d=google.com; s=arc-20160816;
        b=Eb6Qv0++knaoroZMjyXXGyRANXO3X09SQgTBGYjGHD0feA/zMiihqyexXEURCOAG5i
         oFmbuoJPVOFIZ9+yEPtkNEUzfjp+wRzhAK0jJmmi1qA+aZqWkPFJ5xsmLA3Im6NUs/Ok
         h8DJ+jsBMMG/s7hmqOm1g2KhXEBfqhDgp6AdhPrcG2+V/aCRivfj9mvsvhYFa3Mt0jsY
         nszcUUlY1sjXdFgQVJGlf/pkyc6rFdi2+D9r9ZhtxN2u9gJ19POYY7Nm8PSIvcM5kOCz
         dEypPtWl/s6gkoYQ59keeCcawLm6Cz2SI8Vkx8eLAUgpDuHg/YhOOSTZmq31T/9hOF6Z
         2BZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+02VQQ0alDHjiHVIOWBVvOPIvILJXREZBa9dwDD6RI0=;
        b=HD1fNphVBOr+6HqFc+qv/qYzBD5rikbFSYDCp6htuWgqk9JDvLmXIme1DubFNnbQSY
         +3qxW9JyY9b5dgXKEKB44vf9JavL29hqc0TZIvScHBpdtnlbFXWwqEvblNVQ9Iq7QRQu
         Qfnt0TddZ3M+tRzS7PN7tng0sqiGVa20DY/fhkjkbW2opgII98BVrsyd1Oc855SAahLu
         0FRAi8KAZ/PDwLWTUaafLXZkf0wTzO6AwminU8akMgpqGuHDAP5mijisyGprLAixKCNr
         QbeOQPXbNsBTRAMdh5y1JjVE4pFX9UdinKQ4RAfmLsWMAZj758H+Pvbfj3eZIH3bmGyX
         LlGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KOhdQT9u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l19si4549166ilc.102.2021.09.03.00.26.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 00:26:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KOhdQT9u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mM3am-0001Gr-9A
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 03:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mM3aa-0001Df-Uz
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 03:26:16 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mM3aZ-0006Pl-Be
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 03:26:16 -0400
Received: by mail-wr1-x436.google.com with SMTP id v10so6810090wrd.4
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 00:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+02VQQ0alDHjiHVIOWBVvOPIvILJXREZBa9dwDD6RI0=;
 b=KOhdQT9uSsUdmqICh5xI2RZQ3a4iN1zLBdUUQRtXC/42PjpP/j82/e4YzMyABVj4/f
 6aMNa2s5Bb7h1NzsvGhKivdqhVu3wPhUkrdq6XSKDsodP0yKps9ywpEqYhGk4xjV7K3N
 XLE6WHJO1CSdB+ivBRNVEY1Egs5PKgZp9L04yJH4HeqHrTcf6Ulf1n+p9/7grkoDQ5c+
 f9ua17uxy2GU9QdZIMx0MZoPeuw67yv3Wc8C0TDqTcpAtlItxTEWhNX20jnwonUPGDga
 77Ujs9adzT/bBiz+xdC+nuExWDLHHdNKoWN4+WWy2YfGKuVXnY7y6TnSSC3U1O1w+xiF
 0Kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+02VQQ0alDHjiHVIOWBVvOPIvILJXREZBa9dwDD6RI0=;
 b=RFVWcMoLhU7dhEO0w7eH7R9FRyL8Zq+bR/hXHg+OPErjCJXcSPndCldR7NzrXnVD9b
 1CRNhQyif8Qog70WV09X1XmjLfIX3q2K+FTyY8O69o1QF4HV4j3/QpBVSNKWj3MjsUUE
 CamYrZ3n0AYoxx3RH9/GoazKBoSmj6SCKFq6bBID1VIyQA6askVs5yLhMiE4sYArbbYA
 pIFAf1ZyqCSL8NS8s5RiKFJswqideqQRows6GK2wBiYsD/sE1IuA2MOf8rv85f26PGQy
 qpb2sifLP277eLHdXt2Hd09m1cu91Z1JRzeUWBSU1mum200rhzxdFz2+t95Y0R1W7ya7
 QENg==
X-Gm-Message-State: AOAM530h7zVtUSYQnOQdgmTfioKkycjTp25D/nmzOaXFZKsvWhJ6UK0l
 Z1kmQHyRM/IWptJwJB/SiWtlyA/EBsy2Q50qlXjkuw==
X-Received: by 2002:adf:b748:: with SMTP id n8mr2311230wre.133.1630653972914; 
 Fri, 03 Sep 2021 00:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210824122016.144364-1-wangyanan55@huawei.com>
 <CAFEAcA99urPQ4ZnmZrOG4JvL-sO-=kTGXF5Fuz-FoVHV6+J=pg@mail.gmail.com>
 <77ee3e41-e985-74f8-8510-1c47903689a8@huawei.com>
In-Reply-To: <77ee3e41-e985-74f8-8510-1c47903689a8@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Sep 2021 08:25:24 +0100
Message-ID: <CAFEAcA9n10wZY5vO1ZpwO-P3u=dV2G4J8j3xtSjzfA5YX0oouQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] hw/arm/virt: Introduce cpu topology support
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, wanghaibin.wang@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, Salil Mehta <salil.mehta@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 771crx7w12Z3

On Fri, 3 Sept 2021 at 08:05, wangyanan (Y) <wangyanan55@huawei.com> wrote:
>
>
> On 2021/9/2 23:56, Peter Maydell wrote:
> > On Tue, 24 Aug 2021 at 13:20, Yanan Wang <wangyanan55@huawei.com> wrote:
> >> This new version is based on patch series [1] which introduces some
> >> fix and improvement for smp parsing.
> >>
> >> Description:
> >> Once the view of an accurate virtual cpu topology is provided to guest,
> >> with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
> >> e.g., the scheduling performance improvement. See Dario Faggioli's
> >> research and the related performance tests in [2] for reference.
> >>
> >> This patch series introduces cpu topology support for ARM platform.
> >> Both cpu-map in DT and ACPI PPTT table are introduced to store the
> >> topology information. And we only describe the topology information
> >> to 6.2 and newer virt machines, considering compatibility.
> >>
> >> patches not yet reviewed: #1 and #3.
> >>
> >> [1] https://lore.kernel.org/qemu-devel/20210823122804.7692-1-wangyanan55@huawei.com/
> >> [2] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines
> >> -friend-or-foe-dario-faggioli-suse
> >
> > Hi; this series doesn't apply to current head-of-git. Is it
> > intended to be based on some other series ?
> >
> Yes, it was based on the -smp parsing changes in [1] which hasn't been
> picked yet. Given that [1] somehow affects the topology parsing results
> which we will describe to guest, I think it may be better that [1] can be
> merged first and then this series follows.

OK. I'll ignore this for now; please resend once that other series
has been accepted.

thanks
-- PMM
