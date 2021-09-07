Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4604548lfb;
        Tue, 7 Sep 2021 04:02:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+W4FM99iAZdQjwtdwann4ZGGkLu5jdd96UIa9iDK9cd/fC3PaulcDY5JCHSlBS/3qhFz+
X-Received: by 2002:a50:998f:: with SMTP id m15mr18074031edb.193.1631012573827;
        Tue, 07 Sep 2021 04:02:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631012573; cv=none;
        d=google.com; s=arc-20160816;
        b=MTa3yZKb23oI7E6WnFegNExaxhyP8ytvLNWSdcymEe6DT1RUImcB9mPXPmsf+PtkOt
         zWRHlBrOx1GHcNKP7rydW4kOq4Z9FPmsrhy+rzZRjA9SvRHH+U2609uU5UvUhE24U41Z
         FyIcZUnBJZOiTZB3SW5elBkXpXN3ZBYuba+k896+BhO2119+LKPy9GjyDhQ4Gnf9bYj0
         mE7p/T98VFF5Ycl0d27BeSvLrJQiKnzUISNzKEDj1oBpdUFkMiU0qD9E25LhxqFB7a5E
         FCJ2w+c1cTdbtbEpdLdN2qLLtD0qLKmwWIeZNqYIBi6Sir/D8aJs4khTaZWNoUDeOMPt
         yPBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nRMXIbLaNYd4oqQWb1nWoA2AE8Mfyui/ubZLkGOdV0k=;
        b=sxMEzUjCgT5zwayS5Gw0/tNVEqpQzkdTui9lDpqK8gkxYsEB/pcZFT8tTH9NuoDvor
         N+M6HJ9ILGwWoK6JXrvRi9bNG/mNHpzpDllfRgAgqz3M5VdgFIeYrIcgJxjaWdIP1M0P
         QdUu8Vp4dn0f2rxeGn622VQTVioMsH2R3WFb9sw1Y+ffqESxH2zx/Uc4sLUPWUixVSgM
         iBNCkSILqEv7pU7MmOpEGuaRZTHibGd5K04zGmDsM53tKEL7GBfOMKeoaYtTV6IGxTBA
         Qq7xMDhY3kDDAfrrJAeFsS2127t6gnU1lfcluNOsHkgcMwSBcCkrrup/fTG5GokgswjU
         p2uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HV2lwnCZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rh9si11980328ejb.423.2021.09.07.04.02.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 04:02:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HV2lwnCZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNYsO-0002Wp-Rk
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 07:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNYrD-0002So-Rk
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 07:01:39 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNYrB-0002zI-B6
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 07:01:39 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q11so13781972wrr.9
 for <qemu-arm@nongnu.org>; Tue, 07 Sep 2021 04:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nRMXIbLaNYd4oqQWb1nWoA2AE8Mfyui/ubZLkGOdV0k=;
 b=HV2lwnCZ6w9u1PrLZNpUdEk+o+X3XpuJdE/LD/GH3McEB894d8Shq71WDmHhzodURi
 QhmWRVnN7ecpFw39iiS52bA4nRN5m6uLXFD2aludLv6lsCDqR/SbMFcwaC6Rx/nzORsZ
 9ST1gKIey3shyZnCUs62OqqQsqKkPFZJhkpnF+6t1J+v5+fBC8MIK9/APYV+aGYZUz1b
 t0jejr2v25NwyRdQeO3HVw7s4UV+mE6snsSVryfPLL4BTAVnTTvMVjvzelW4FvwANdDU
 oQgj/jFIpergLPSA3lbc/2WFDpVlc2297XPowfYqcZ3uoPYQxZiuFg90CUhDKjc6Juto
 pQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nRMXIbLaNYd4oqQWb1nWoA2AE8Mfyui/ubZLkGOdV0k=;
 b=roOZmdBi3rhGATxVS+YtGiHAAi1rLc1+43MrHvHvNIr3uBnlSCiNIsdtlQ2xQoH5LQ
 r2xNthhaSIuMUFzp0T6JTXBTHcBTc9lILF25UysC+ig0givA4iIUMk15H9QjedMye6Ig
 nsgJ7Q8F3diMqrCw+J8w13ZuY84S6zbNfhAjBBpF5VDRGsHuFXURAyCA3jxrWE4arcJQ
 LtSa6oQILOmwSVkpccK5br9r8waq/jXoljzSwYBqYmDkbIfhqt0VmcVPdnBR1eADmMjO
 /Z0+fsX0SqU0lvhoLPXHUPt6ndzL+Cxq+08RsCTOLiKU19Pg4WxRItWXSPpkE28xAoXk
 /Iew==
X-Gm-Message-State: AOAM533P93r45Wc1aNGhIN51cFo3Nk6OB4RNZcQkqHKo2VgVGHBjKZ3i
 CK16yQR6EHUdJ+LEBzfSWlgDoEBgA2BGfgDPXo9CDA==
X-Received: by 2002:adf:c18a:: with SMTP id x10mr18529223wre.302.1631012494734; 
 Tue, 07 Sep 2021 04:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <1629878922-173270-1-git-send-email-chunming_li1234@163.com>
 <1629878922-173270-5-git-send-email-chunming_li1234@163.com>
 <756203c3-76ec-62ea-beca-91a245059536@redhat.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B0114302BA7@SHASXM03.verisilicon.com>
 <4ba6223c-f239-ccd2-e4a8-eb912dd4fb58@redhat.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B011430A69F@SHASXM03.verisilicon.com>
 <19a5f05e-1984-095f-67de-a10f0acca947@redhat.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B011430A757@SHASXM03.verisilicon.com>
In-Reply-To: <49C79B700B5D8F45B8EF0861B4EF3B3B011430A757@SHASXM03.verisilicon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 12:00:45 +0100
Message-ID: <CAFEAcA8B2cDXqbEStyZfV1F_3cOSTj-y_jyZkjuG3uXYzTqpAg@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] hw/arm/virt: Add PL330 DMA controller and connect
 with SMMU v3
To: "Li, Chunming" <Chunming.Li@verisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>,
 chunming <chunming_li1234@163.com>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EPmDeCWVf20T

On Thu, 2 Sept 2021 at 09:23, Li, Chunming <Chunming.Li@verisilicon.com> wrote:
> Eric Auger wrote:
>> On 9/2/21 8:46 AM, Li, Chunming wrote:
>>> Eric Auger wrote:

>>>> Then I think you need to bring a proper motivation behind adding the
>>>> PL330 in machvirt besides a testing purpose.

>>>> After this series you would get a single platform device connected to
>>>> the SMMU, the PL330. What is the actual use case?

>>> The actual use case is this:
>>> 1. We will have a SoC which has SMMUv3 connected with our owned platform
>>>    Video Encoder/Decoder and other IPs
>>> 2. We plan to use SMMUv3 stage 1 for continuous memory allocation
>>>    and stage 2 for memory protection
>>> 3. We are developing our own IP QEMU models now
>>> 4. These models will be connected with SMMUv3 in QEMU
>>> 5. We will use the QEMU board to development IP driver and ensure the driver
>>>    can work well with Linux SMMU and IOMMU framework

>> I see and I understand your use case for system modeling purpose.
>>
>> This raises few questions/comments though.
>> - supporting platform device protection from the vIOMMU/ARM makes sense
>> to me globally. But above use case does not justify (to me) the
>> introduction of PL330 in machvirt because it would be just for testing
>> purpose. Peter may validate/invalidate though. Instead I think you
>> should try to illustrate this feature with DMA capable platform devices
>> such virtio-net and virtio-block sysbus devices as a counterpart of
>> their PCIe flavour.
>
> Thanks for your suggestion. I will try virtio-net and virtio-block sysbus
> devices in next step.
> But I hope to keep PL330 because it's not just for testing purpose.
> It's a good example to show how to connect platform devices with SMMUv3 based
> on this patch.
> I assume other developer may have same requirement.

I agree with Eric here that the 'virt' board is not the right place
to put this PL330. The 'virt' board is not intended as a dumping
ground or experimental testbed for every possible arm device or
system configuration -- we try to keep it at least reasonably
targeted towards the "generic virtual platform or VM" usecase.

The "sbsa-ref" platform is intended to look more like "real hardware".
It's possible that "memory mapped hardware that sits behind an SMMU"
is something that you would see on the sort of system that sbsa-ref
is trying to model. I've cc'd Leif who would have a better idea about
that.

thanks
-- PMM
