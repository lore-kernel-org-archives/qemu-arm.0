Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FD7EFCD6E
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 09:47:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzXCc-0004wD-0E; Mon, 09 Mar 2026 05:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzXCV-0004vc-93
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 05:47:00 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzXCT-00006S-PE
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 05:46:59 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-64ca09f2170so11668773d50.1
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 02:46:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773049616; cv=none;
 d=google.com; s=arc-20240605;
 b=S1DQ9tr6b9Dsk42VrPnRwZFFuquTWdPW1OGACbC6uupTHNQqqyddgHoZg/FsZSodIA
 KRsaxg/5gL5QGWENoCYVqrPbWcP3kqHMC9nzR591zaa14PBVBpR0aC9X8VorL0pMzS5M
 NBLk1yELKlIMPyG8OZUm76+RFMWq/kX18lf9CUkJJvHHkyv36g7UkpvajBrdrSsA0YrO
 m5bZCSlTX2Mw9jmZ8Zuoc/4fdDpOBbdHNO0p5hJSOgGntADu2KNd3L6e2RHEPQJyw21n
 Q7MSARSBguULzH3B0+CTbCdVXgi/yW8RArLZQTj3WIqKWbX2CTmwgRHWDcwict2FBLu5
 GB1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=WXTKPx6DOn8tj+ElBjv8zsF6JK0+oHmjWzFt5qs1PH4=;
 fh=zbkup2KuJgX43eRk31AIuklGc6Ar7i2YiwoeSwJ423I=;
 b=JoGsWc5hh7PwHkY6If3peiIVlUVRaYvKZl+zhqHuUloKzftRBJQi+pBnhPe1kcyPEN
 TTHTNaKunfF4OTRcy4JSC1pPUqer5syiYAoDgHaub3vEADQ3rYpx68iI5GMSEqDDG48G
 NuteP2dqydaDnF3qCokz8rwujWyhP3srTPyTP7pbFzLGASaM3X5ne+btrD/vQ0VexKiF
 1xvVhKIZk3pKcAFBgT0Jj5mrFB34NqhpJZnzIedOupkBeiZI6ll1I3n/RW4bh5D8sVI8
 58f+3q6we/tG6t0R9eep3IgBeVxxT4US1goP+jpi4naHfITPVTMQPb2r4xpiDxMpHcvC
 svTw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773049616; x=1773654416; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WXTKPx6DOn8tj+ElBjv8zsF6JK0+oHmjWzFt5qs1PH4=;
 b=Rnsqv3s7cfV6YeT5IeQQkGQGbMrG5/AvvPWjJ5/+0QBk+ensgXGY+gC4GuLJq8zmt+
 thD4GU7TNMQPPQkbGsF6kkwtq+nlbODO39rjr0JyEIAhVFbRlhuBhb861qz94mFD0Rio
 aVBBN0SrETOXRp7u7cwQ+if1yOTNCWptfhBVgHi1hoxMLFxh+OsyMFzvF5YkZTZq4EPt
 GY30tfBh6BzfOwSLVWMBWShQFkDjwnwHtJaCAAJSIym/cW6Dtw6/d5Sj/n1f7w4vxvDO
 TByJ2bwU0+L5gpUC0c3/waRgDsrH8Vzg4d8Bf1lww+JTT4dKKN8U6cVzC0A2V5dZqPu0
 6jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773049616; x=1773654416;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WXTKPx6DOn8tj+ElBjv8zsF6JK0+oHmjWzFt5qs1PH4=;
 b=vMubwdwyS8vV7fj9CMv6W/p+2UbhPvH0WO9jOGMLUZ9s8RcKsmNcglr3Gh+G9NVXbb
 W3jCsTREGCCVxmGUczlVe/Xo6AdhdqNhKu2AM1f87Hd6lq2EAAOvnmUj2iQ2U8iItHVF
 H0Ad2qaFc4dieu/TvLJJO0uAzZaIGlXyFH827tpuDI6t9teinQRDYEubpBgtVobPQ9dQ
 H2A3Kmhgmxx5MbPx6lZsuN2aC5t0Hj5sTGEyWbuiMdNd42TTvhe4tReIGlJjbIVbqS67
 fvInlUR2ec+KaXI5stDKtnm3RO8Sed9J4mI/ZiAR5MYEqma4XAWNyhXDk83qaC3yNGRj
 1vmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvw4cxiRGFWEPdv1i5l2XS8mkwY4aw7UMEnxC+xCQsavBQFQpHrDZZOJcByMbpz77BpXPPY7n+cQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw1YOirWjEkRTCjFy6rHPz5978PfzvkR8dYGIdcVlaHHwBsa+ql
 gOV/tlIcMG4yMelTAaP8LRtIr9/2I/abcJma11J0ZERl/QncZtRfCDBaKMRgTaRqH5orkNd/ouE
 gBZkEqyFy+jtJu3QD9wuFoCUK2YUQiABIKG0VG7+nAg==
X-Gm-Gg: ATEYQzwqtgRP+MZecI6ky6UD6Ig4Fa+PITQ+NbjkvJeqgjPX4QHsmzrSi1Chdlh4jwA
 Fu5nhnx70YkxDUpaHGZkGS6/BUOcdN/tN1B8qPY3F+3maRoNKI3WFgiPFbnL6H7/zNRgry4XYhW
 iT0GMAQJosdCxFMXtWObIWWVCUUuIWiwMnuyMNRhr2LNWTigDSMXR9yJnMVvX1ysyPrhQuILkiA
 lzO8ao/xlDdjjfExH3yzuh98IxRbnVF0rUzTinESsaOkMuaZDA9sHASAXnQPQN0NC9c0Ppv7Qns
 Q5rAw3HasFzVaOv1V/r8K2WdFzrgIiPcquj6DifE0U8qgI6B750junpm0uBFtgLF9zg=
X-Received: by 2002:a05:690e:e0b:b0:64c:a4ab:e4da with SMTP id
 956f58d0204a3-64d1409677emr7935798d50.6.1773049616006; Mon, 09 Mar 2026
 02:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260305220911.131508-1-shentey@gmail.com>
 <20260305220911.131508-14-shentey@gmail.com>
 <cf26c35f-a508-45bd-9398-5b4e7140d743@redhat.com>
In-Reply-To: <cf26c35f-a508-45bd-9398-5b4e7140d743@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2026 09:46:44 +0000
X-Gm-Features: AaiRm53VwoxCUBDt84uy8e7dWDXh6WYso9faRE0QiNfous25fYrGqq0rSlmzPi0
Message-ID: <CAFEAcA_cZbp4FW4SLxdRs4doE8ZkadNGrADe3tBrbXDpy-DC5A@mail.gmail.com>
Subject: Re: [PATCH v3 13/14] hw/char/serial: Inherit from SysBusDevice
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Troy Lee <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org, 
 Helge Deller <deller@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 9 Mar 2026 at 08:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 3/5/26 23:09, Bernhard Beschow wrote:
> > SerialState currently inherits just from DeviceState and serial devices
> > use SerialState as an "IP block". Since DeviceState doesn't have an API
> > to provide MMIO regions or IRQs, all serial devices access attributes
> > internal to SerialState directly. Fix this by having SerialState inherit
> > from SysBusDevice.
> >
> > In addition, DeviceState doesn't participate in the reset framework
> > while SysBusDevice does. This allows for implementing reset
> > functionality more idiomatically.
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> The lack of support for automatically resetting children other than
> buses is a pity indeed, but I don't think that this patch is correct.
>
> SysBusDevice is for devices connected directly to the board; a device
> should not have any children objects connected to a bus (unless the bus
> is part of the device itself, as is the case for usb-storage for example).

We also use it for various other things beyond that, though:
notably we use it extensively in SoC objects, which have
child objects which are almost always sysbus devices.
Very few devices really connect directly to a board.

I actively advise against people creating new devices that
directly inherit from TYPE_DEVICE. If you also advise against
creating devices that inherit from TYPE_SYSBUS_DEVICE that
aren't directly connected to the board, then we are jointly
saying "don't create this device" for quite a lot of devices :-)

-- PMM

