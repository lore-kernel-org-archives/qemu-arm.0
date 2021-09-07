Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4917222lfb;
        Tue, 7 Sep 2021 10:03:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJ2+zP6S7ayI3K/GvEGlaMBfK0TvVlWVXcx1OwnsM55CGnrXwQEaDV8tCIVLgpV8ABWGc6
X-Received: by 2002:a17:907:7704:: with SMTP id kw4mr20095086ejc.23.1631034202008;
        Tue, 07 Sep 2021 10:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631034202; cv=none;
        d=google.com; s=arc-20160816;
        b=l9yGgZ+1N3ZcXnjojvea0r9PeFNdsj4LVeAZGrvRPobAYJZSA4Sd8E1/s1FlpAZAY+
         WQTJ/osPpGa9nU9ag892wbFUdzzQJn7Z57tmsK1zLHSCi+mjJiTJbWdUfkxzoOe0rPE0
         Cl7XXEj9W6e4cFE28W3AtQS9iQGdvsWoBZm9rVl4ohho4R1k9qWOC63x/NT+DIpGMKgU
         +895oNiTeO2VTzWQMyXKdGRER88QMqp4p95m9Si7z5xO9ulTbt4ySdczbo7/iTvUFnIu
         Q4e1SX5om+o/0Mq3UeTYyhwfUFupV8kM79qiKOW5LVF1byWs2hj+PYsOxE5l9cpye2lo
         eCZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=ClN0luB0ZRk2lqqt/Z+VIZ4d/ETc9jimEnqReouJTXc=;
        b=WXPtcM8Li/23B1Nh8zGl0P8QL0Py70RzdMYeFy2dYKc/8V/BlyGq8Y4aPGbdh/Z2vd
         0XgHnsSDDxBgDq9OT+LBYeLwgoEyqmLls9LExucDcn0WXP+t1N/bxPBX0EX6epXFK+wo
         CvZ2b9Fs1+5P9gpoNEldxBGDz1+iQWXPAeXpK0WrIqkKE6UzRQyC7ozxq9wXc9d02w6n
         6aeNx1VXgnH9eC77WOnHzv9f6VcMYRxF5mNheulrbS10gC5UOGpGAYsrH/aWveTEEoFQ
         E53wOdHgI1KhhY9+bb2HIDRnddPg4PgZpldTryUZsXVRedk2aW9vRroIzeAIrUI1Uy/I
         ygIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=mvLy++Jf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kv8si11084217ejc.676.2021.09.07.10.03.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 10:03:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=mvLy++Jf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNeVF-0003fu-0Q
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 13:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1mNeUm-0003fd-7q
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 13:02:52 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1mNeUk-0000Su-6h
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 13:02:51 -0400
Received: by mail-wr1-x431.google.com with SMTP id b6so15498144wrh.10
 for <qemu-arm@nongnu.org>; Tue, 07 Sep 2021 10:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ClN0luB0ZRk2lqqt/Z+VIZ4d/ETc9jimEnqReouJTXc=;
 b=mvLy++JfGibX+zXaWUIdz8qz10fzlvo2Yo3U1rIqiHHtZ5o8Jy1Dr9qhqxKDdDBQ7B
 hy9dJfSQ40N6pYC0ntVMfrtOxcR2ituy4uASP6ann0v2jeCC9tCK4lUiKj2P3qfLy+24
 oJBOamrJ7hC70RBpbq3qSOUKFEFpmaaaJ2+jd+rJtmMJhJIH5b3jLG/SM+chioDvX/RO
 x0wwFvtMg/6I//1fx9KS1hDogUbLfmLuMTH4Qz5LIsk6ZleiYKOV8Ok/n9QL8xXhjWOu
 TWdhO4USycSNaOPhYkS1IQpWQEGU23i/AfhsnXnG+2vlIyhYVAC6klux64pv88crbhS4
 NRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ClN0luB0ZRk2lqqt/Z+VIZ4d/ETc9jimEnqReouJTXc=;
 b=2LSgFxaPnWx8NVdfVXh6bUF2Aa8tzAjZEHK51GTYvhqGtiVUM7twGj4k944UpWrtuW
 +wZFMSc2rK6zNb88a2v8x/FI6vgW0Imb125srirURNf09fjDohylc2CegWWa9fygbV21
 P+MjcD7C6W3UovBquhEbUGtOVNFtdCz01vmYTV1RzrDv9gS3DJLO2vyslcM4IPHckjOD
 1VGgsG5iBaf+EuxGcbiuqAv3vZZVhzlemWk4WdTqp1Tj41AicibLkEKWB+CaP6v/iglE
 UPTv3Kc5ZmuEJ7EFl6PUuCg9hYstrGYm/zbZE7ECz6d1Ic1Tl7+ME73UnCfpMwyrd8+O
 gS4Q==
X-Gm-Message-State: AOAM530PCmDt+1Mn5u72Zk944u8toiMJuKpmD5ry6cGrdGQRsZXx3qB7
 87uEE0wlqEAIBCue9N9x5+mF6A==
X-Received: by 2002:adf:d214:: with SMTP id j20mr5047858wrh.119.1631034167571; 
 Tue, 07 Sep 2021 10:02:47 -0700 (PDT)
Received: from leviathan (cpc92314-cmbg19-2-0-cust559.5-4.cable.virginm.net.
 [82.11.186.48])
 by smtp.gmail.com with ESMTPSA id v13sm11788817wrf.55.2021.09.07.10.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 10:02:46 -0700 (PDT)
Date: Tue, 7 Sep 2021 18:02:44 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v5 4/4] hw/arm/virt: Add PL330 DMA controller and connect
 with SMMU v3
Message-ID: <20210907170244.hg6g6bk2hk47griu@leviathan>
References: <1629878922-173270-1-git-send-email-chunming_li1234@163.com>
 <1629878922-173270-5-git-send-email-chunming_li1234@163.com>
 <756203c3-76ec-62ea-beca-91a245059536@redhat.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B0114302BA7@SHASXM03.verisilicon.com>
 <4ba6223c-f239-ccd2-e4a8-eb912dd4fb58@redhat.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B011430A69F@SHASXM03.verisilicon.com>
 <19a5f05e-1984-095f-67de-a10f0acca947@redhat.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B011430A757@SHASXM03.verisilicon.com>
 <CAFEAcA8B2cDXqbEStyZfV1F_3cOSTj-y_jyZkjuG3uXYzTqpAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8B2cDXqbEStyZfV1F_3cOSTj-y_jyZkjuG3uXYzTqpAg@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>, "Li,
 Chunming" <Chunming.Li@verisilicon.com>, chunming <chunming_li1234@163.com>,
 "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ulFMLmrQCKEo

Hi Peter,

On Tue, Sep 07, 2021 at 12:00:45 +0100, Peter Maydell wrote:
> On Thu, 2 Sept 2021 at 09:23, Li, Chunming <Chunming.Li@verisilicon.com> wrote:
> > Eric Auger wrote:
> >> On 9/2/21 8:46 AM, Li, Chunming wrote:
> >>> Eric Auger wrote:
> 
> >>>> Then I think you need to bring a proper motivation behind adding the
> >>>> PL330 in machvirt besides a testing purpose.
> 
> >>>> After this series you would get a single platform device connected to
> >>>> the SMMU, the PL330. What is the actual use case?
> 
> >>> The actual use case is this:
> >>> 1. We will have a SoC which has SMMUv3 connected with our owned platform
> >>>    Video Encoder/Decoder and other IPs
> >>> 2. We plan to use SMMUv3 stage 1 for continuous memory allocation
> >>>    and stage 2 for memory protection
> >>> 3. We are developing our own IP QEMU models now
> >>> 4. These models will be connected with SMMUv3 in QEMU
> >>> 5. We will use the QEMU board to development IP driver and ensure the driver
> >>>    can work well with Linux SMMU and IOMMU framework
> 
> >> I see and I understand your use case for system modeling purpose.
> >>
> >> This raises few questions/comments though.
> >> - supporting platform device protection from the vIOMMU/ARM makes sense
> >> to me globally. But above use case does not justify (to me) the
> >> introduction of PL330 in machvirt because it would be just for testing
> >> purpose. Peter may validate/invalidate though. Instead I think you
> >> should try to illustrate this feature with DMA capable platform devices
> >> such virtio-net and virtio-block sysbus devices as a counterpart of
> >> their PCIe flavour.
> >
> > Thanks for your suggestion. I will try virtio-net and virtio-block sysbus
> > devices in next step.
> > But I hope to keep PL330 because it's not just for testing purpose.
> > It's a good example to show how to connect platform devices with SMMUv3 based
> > on this patch.
> > I assume other developer may have same requirement.
>
> I agree with Eric here that the 'virt' board is not the right place
> to put this PL330. The 'virt' board is not intended as a dumping
> ground or experimental testbed for every possible arm device or
> system configuration -- we try to keep it at least reasonably
> targeted towards the "generic virtual platform or VM" usecase.

Agreed.

> The "sbsa-ref" platform is intended to look more like "real hardware".
> It's possible that "memory mapped hardware that sits behind an SMMU"
> is something that you would see on the sort of system that sbsa-ref
> is trying to model. I've cc'd Leif who would have a better idea about
> that.

I don't know if there's a glovelike fit there, but I agree it's the
closest fit of any platform in QEMU today.

Most DMA on an SBSA system would normally be expected to come from
PCIe, but some have certainly been released with random platform
devices, and it's certainly conceivable that some platform devices
might wants to make use of DMA.

The potential conflict I can see with what this patchset is the use of
a qemu-generated DT to describe the hw to the OS, whereas sbbr-ref
uses ACPI, generated in-guest with a few hints from QEMU, to abstract
it.

It looks to me like the hand-in-glove fit for this use-case would be
an ebbr-ref platform. (Or I guess SystemReady-ES-ref this week.)

But if the ACPI thing isn't a showstopper, I don't particularly mind
carrying an extra peripheral or two in the address space.

/
    Leif
