Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp339298njb;
        Fri, 7 Feb 2025 09:07:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVCfmQgP4FW3Wu8Fe82H6nF0PzDLFQUh0uMaIN4+47SKNkdL9pkwZORHikq7DquTWznWS0HSRb2uqRY/A==@linaro.org
X-Google-Smtp-Source: AGHT+IHG2wYDNJyYzyO9xS07FRgc6EdBDYA3rq9qr+I8linONp57o+3Y9ziqO5sZ5mY0ANzlyRkx
X-Received: by 2002:a05:6214:4108:b0:6e1:700e:487a with SMTP id 6a1803df08f44-6e4457447e8mr40592506d6.40.1738948042047;
        Fri, 07 Feb 2025 09:07:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738948042; cv=none;
        d=google.com; s=arc-20240605;
        b=K34JpR2Vjrv33ks6qji1GDt9A4RJbOXpEtJombj1dudhlxecLunRS9hFrSFKvz6HEE
         /1ex5RQtAD6qs9OAZM3Ij5zAytTPPNn+DB1CRqOlxRpgh2kPxjk7Y5UdHP+DOj1AUYDe
         41gGgXRnPemRUeONOiFj32DHHH0vt1S6ulzw8iAODswsWeeCh2lSRdfhoMV/d9qR7iw6
         QyLL7DbW/L2tNdliSecstPXDIn9pJHSJRfZla6R5CPlIXPz/YiK+UBGKJbMNJA2+MV3+
         8NVYXeXwBCethiBeAB244IYtk79SnBkGbI4sW/KOhXCfjrePvEjcxJP4FUBc4XjdUZlb
         HiLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=x2EcrH1tEE3g+8S1bArdiH3Vlk3ipieMtmlaoFSIU/k=;
        fh=5nu6AELsoFg1uTMlZebTkV4PU/jyjdYtwraFzdfQQSE=;
        b=UJzB07Ama0JjCbiAETQeM1DcWm42oRUY4IyClCXxyTCvbhj7VMBg9UcV4gkO2Rf2qe
         JQE4Ml+RTY6madaWEnMU3CbhvpFP6/v9CcEN+4G08sZKivbwung7jD8i0YfseIQlJ6F4
         R7D4P9gMmEB6zzNzLjfydCyQk8+OPskaboo04Bf56OV58BftoMhhJXREWFUxcCshBtUP
         cbXOuMXjS418lKII/TZGLVN5QoRmtIVE400ty3DQ+HYjhNEH8V9DuS8NaH6vT6jx8rBm
         JHLNe+O6kslsezGr49gyVEQ5dOSXHB+TytgcMoFtcbAPL1XmsOp8rxbmlSyFeIAYcrKc
         r7Tg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q7fXDXNb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e44db430b1si9542396d6.124.2025.02.07.09.07.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2025 09:07:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q7fXDXNb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgRoV-0006dv-55; Fri, 07 Feb 2025 12:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tgRoJ-0006dM-7W
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 12:06:35 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tgRoH-0003fP-K4
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 12:06:34 -0500
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e587cca1e47so2090845276.0
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2025 09:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738947992; x=1739552792; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=x2EcrH1tEE3g+8S1bArdiH3Vlk3ipieMtmlaoFSIU/k=;
 b=Q7fXDXNbJnKLfGZH4948+2z42p6C1r/sGsRLvOxYbQlnOULDdZ1ke16qhjGAlk+R1d
 C4DD3Zn0sVbMw90q+WzlAppCzgGLN4SqcR6HgNKQkMiP+SFZb8+E0w1QzSB/2OdRA782
 pVoQTBEoaaU9torQgk/BOAVUDhRi2fqCAnnifNUVWdPq9XCRL/5AcCES8h5gG+bgSBJT
 HombPZrS5BGQNjoM9Wn3bKbexs0HpoCrVZ/K0jg2xc6zbT4w6je7rn1c7Oa1z51Irm2g
 5tXDUfkEFF/KNvNBZWprPYSrKEooPIVwEHVF4skU7kKwZhjWpNa80a61PMQ2de0fTdfP
 ZNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738947992; x=1739552792;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x2EcrH1tEE3g+8S1bArdiH3Vlk3ipieMtmlaoFSIU/k=;
 b=TXw6NzH7cK50Gz3BRr0SMeZXfY/s7rF/3sZxtmG/kF0fPuIVKAavB8cnCELAVlNAiP
 KUTib8xYOp8OK1t0fCkLsucb2mzrCL6/Qh8Tl//ntTqATJZAWo1l/aDp4PF2Hn+jWPoz
 jHpXtIZJlBWV38Xa8swehDePUnnvP2mRCn1qZK7AS8XVfRba8DYE+QhQAlTqhWj+Y77I
 fRwKshWSklJEHLMXIdBBBOR1m8rAs/A1oiC92T+HZ42YoHUASRs9GfXBMJlmNkRfocbw
 zWI+a5G7j5yDsMpMZgZG4kxdIqt+GPSJjxyvy/Tlsp9JG7cC+ljooncsVE3yd/2HCWJy
 ha4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9iVeHmpakfjrgoE1r9JuOnAYE+7aYQ2oqMqOreIkN/mbn+EYPKN+o0E2Bv2+wrLBMH2M1y+UGlA==@nongnu.org
X-Gm-Message-State: AOJu0YxhZ6Pyc3NONXUqtrJZDgSq3Lzbu9+riGIZjyO52e5Vn3Dm3lHK
 2p6vL3zGIZHT2SZHfhjZAll2iyz9B3FKhX620mPUh2yuZUjDZUXX8PXdReDsdsZeltoc5J1BlKb
 gjMnFKt4BxNv/NXQaBERMDrLHA36/bT/FDPXetA==
X-Gm-Gg: ASbGncuR6S/9zeonWXCi70nx3QYJ6iHxvjqNaO2BZkCuDq0c4EW6D+CdWUfr4rqc9hZ
 okBLYy9B/hV3ihgcc6Twml3nyeiLkhR1ReVRnCFByRVCPrWnJ+JJChLUXp/GeyTd22BrxgEcIKw
 ==
X-Received: by 2002:a05:6902:1101:b0:e57:3a77:99b9 with SMTP id
 3f1490d57ef6-e5b4629db09mr2525588276.41.1738947992033; Fri, 07 Feb 2025
 09:06:32 -0800 (PST)
MIME-Version: 1.0
References: <20250206142307.921070-1-eric.auger@redhat.com>
 <Z6Y6sf064FBWT5G1@x1.local>
In-Reply-To: <Z6Y6sf064FBWT5G1@x1.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Feb 2025 17:06:20 +0000
X-Gm-Features: AWEUYZkGCgiYExZB1YkWnc2NpY21qlJjthqeofmkYckNTIsX-HskZnMDN8FOS5A
Message-ID: <CAFEAcA9ETg2+Xa+e3quJhGG3KsNuH+DW3puuWaJi-q1psUdw6A@mail.gmail.com>
Subject: Re: [PATCH 0/5] Fix vIOMMU reset order
To: Peter Xu <peterx@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, mst@redhat.com, jasowang@redhat.com, imammedo@redhat.com, 
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org, 
 zhenzhong.duan@intel.com, ddutile@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2I487K+TrLZ6

On Fri, 7 Feb 2025 at 16:54, Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, Feb 06, 2025 at 03:21:51PM +0100, Eric Auger wrote:
> > This is a follow-up of Peter's attempt to fix the fact that
> > vIOMMUs are likely to be reset before the device they protect:
> >
> > [PATCH 0/4] intel_iommu: Reset vIOMMU after all the rest of devices
> > https://lore.kernel.org/all/20240117091559.144730-1-peterx@redhat.com/
> >
> > This is especially observed with virtio devices when a qmp system_reset
> > command is sent but also with VFIO devices.
> >
> > This series puts the vIOMMU reset in the 3-phase exit callback.
> >
> > This scheme was tested successful with virtio-devices and some
> > VFIO devices. Nevertheless not all the topologies have been
> > tested yet.
>
> Eric,
>
> It's great to know that we seem to be able to fix everything in such small
> changeset!
>
> I would like to double check two things with you here:
>
>   - For VFIO's reset hook, looks like we have landed more changes so that
>     vfio's reset function is now a TYPE_LEGACY_RESET, and it always do the
>     reset during "hold" phase only (via legacy_reset_hold()).  That part
>     will make sure vIOMMU (if switching to exit()-only reset) will order
>     properly with VFIO.  Is my understanding correct here?

Yes, we now do a reset of the whole system as a three-phase setup,
and the old pre-three-phase reset APIs like qemu_register_reset() and
device_class_set_legacy_reset() all happen during the "hold" phase.

>   - Is it possible if some PCIe devices that will provide its own
>     phase.exit(), would it matter on the order of PCIe device's
>     phase.exit() and vIOMMU's phase.exit() (if vIOMMUs switch to use
>     exit()-only approach like this one)?

It's certainly possible for a PCIe device to implement
a three-phase reset which does things in the exit phase. However
I think I would say that such a device which didn't cancel all
outstanding DMA operations during either 'enter' or 'hold'
phases would be broken. If it did some other things during
the 'exit' phase I don't think the ordering of those vs the
iommu 'exit' handling should matter.

(To some extent the splitting into three phases is trying
to set up a consistent model as outlined in docs/devel/reset.rst
and to some extent it's just a convenient way to get a basic
"this reset thing I need to do must happen after some other
device has done its reset things" which you can achieve
by ad-hoc putting them in different phases. Ideally we get
mostly the former and a little pragmatic dose of the latter,
but the consistent model is not very solidly nailed down
so I have a feeling the proportions may not be quite as
lopsided as we'd like :-) )

thanks
-- PMM
