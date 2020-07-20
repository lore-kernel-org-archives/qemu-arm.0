Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2102785lfm;
        Mon, 20 Jul 2020 03:17:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+q6h1LVfk3uDlczo+zpxe8jTjfRYMOtqMwf2zjIv2YNu+GBa8IY9Xsw6AAG/+qx9TLyQP
X-Received: by 2002:a25:7453:: with SMTP id p80mr34152353ybc.451.1595240224101;
        Mon, 20 Jul 2020 03:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595240224; cv=none;
        d=google.com; s=arc-20160816;
        b=OBGaclHVbX7gCBAKKX87j3u0c6pI4+kpmt/BKyS96HVFui8odnPAg1g4B2Zc7AxkqY
         P3IuL+g34l6kfs1RC6wmLpcPODIL+AiJE1Lnbe1w+OO5Zywm5gQ91H0ocpGw27QqGIVT
         9mzdTRJ27cd2zEz6o1H7ZGXvM4LBHMNA4ZTpsljlRNwcmk22FLsDjzlblU/Z/0caUYa5
         twSqzMF59SOnAiB+56v3xg20ZlVyJcHPApoqBm2Ahl1AanfZpvYJ061hTE1CPFKVqMhP
         UVrWeXQcga8oc863XTMT53F5f6NuGLiHGWZSNF2MP0TyFt3VdyaxTOKW3cE0cgetNrrR
         PQ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d22r45gYornC+aj8Wxf5zyEsQLelQikNBkLiinXRA4A=;
        b=e3VppWBXRFfr/jLgZm4Eize3nu/hAXgmc9DZdr2274oAqAID/aVQ76VrQH9ZmgfRHH
         t05ghbvta+ejCN7/SzryaFvprz7m9jkpwP99ulVz6YRVuidIlmQRwkRysBq6cPvcZ6UK
         DqZIEvgjO76G30EN/XeddRflWmIaW8abRnRhi0XEfizT59YN2ZtMQjfwSOSILAML6bFq
         R0OQtsjavTKFotLTujFeNXKlgOFvY3dQb4X98/WTKrpO8ZTfq53Spfbw+darkVTDS22H
         KBbx5CP+bmL8atoVNZeRxrw/dxB2A9XKbZjPuSytmnbtxbeCWbi8Fj12E+dVQsJkZYcM
         nsiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jZGX5X6z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15si16175115ybj.489.2020.07.20.03.17.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jul 2020 03:17:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jZGX5X6z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jxSr1-0005I8-Gi
	for alex.bennee@linaro.org; Mon, 20 Jul 2020 06:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jxSqu-0005Hz-1V
 for qemu-arm@nongnu.org; Mon, 20 Jul 2020 06:16:56 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:39681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jxSqs-0001Ng-Ez
 for qemu-arm@nongnu.org; Mon, 20 Jul 2020 06:16:55 -0400
Received: by mail-oi1-x243.google.com with SMTP id w17so13989480oie.6
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2020 03:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d22r45gYornC+aj8Wxf5zyEsQLelQikNBkLiinXRA4A=;
 b=jZGX5X6zVCm/MNvaV8ZqLchyE2fip47xrEMTFJQEhLLPUilK89DbMvARSfYunDwOUK
 2AmBbkKkusOdp8OKI7U7+tP6mZyJr0h3hta6SAsUD1AgYVdcwXIISoENh3S+saIKg6R/
 wwEgrD3bUwXjj2SHeWVw0VN2CI4dYTowy4x79wv9qd01qJ9DtMFHvSeSOMFr3EA4ELN0
 RAodUgyQqIQTiDT7d/Cx7ktTae137y+m7mQjOylwkXirDLH//sN49cYv+XR1Xvn2umP3
 TuiSri/q8yiZoPD07yzHBCmqvdEwyhOKNPCf+HhfY2Wz0biThfHDNY3tV4SEdbDPDOaS
 i60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d22r45gYornC+aj8Wxf5zyEsQLelQikNBkLiinXRA4A=;
 b=I0K1nmFTqlH6G6E+rzmSd+2PeuZuqeT5q/rZPxUuB2Vp7u1oIoA6Zi/PjRRq1ytV1a
 NzPZumCTJIvk1F4ezHynz5O0a9Z0EhikkgE2j2sSpJO9nQcMcUn7NNrK/E2b75CKYZON
 u3PnGaMDljU6PlB7z8Cii5A9cXpY7aMsQNfXZQBw5rb69T92FuSSdmSbuxIN3WdMyOSq
 Z/FbMatwy4kB3KYFpYtzUhoI9eepQWlfI+WCb1tCjJavHVyXbOAsK0AtOqzRMThmGzAF
 8q8bCFHD4R6DG8C1zoZa6PXREv+/epTwcI/tQ79cPICXY9I9ZyvCFOzwfg7SZq2cAvTc
 B5JA==
X-Gm-Message-State: AOAM530187DmlO6nu+sDHIJNJZZgnIHuGio6EISccJ2f4NiTFgl0lCgR
 tIzlOyxz83+kqkDTF/tWkdezH+Vax4MLMhQYexlD2Q==
X-Received: by 2002:aca:1706:: with SMTP id j6mr16331853oii.146.1595240213005; 
 Mon, 20 Jul 2020 03:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200711101033.47371-1-drjones@redhat.com>
In-Reply-To: <20200711101033.47371-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jul 2020 11:16:41 +0100
Message-ID: <CAFEAcA_F_zJESdsZbsQaD+SLN5HDuL1x9Z=YrxC9kXw1XGvrcg@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm/virt: Introduce kvm-steal-time
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Beata Michalska <beata.michalska@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hJAYjq4mgIO9

On Sat, 11 Jul 2020 at 11:10, Andrew Jones <drjones@redhat.com> wrote:
>
> KVM supports the ability to publish the amount of time that VCPUs
> were runnable, but not running due to other host threads running
> instead, to the guest. The guest scheduler may use that information
> when making decisions and the guest may expose it to its userspace
> (Linux publishes this information in /proc/stat). This feature is
> called "steal time" as it represents the amount of time stolen from
> a guest by scheduling out its VCPUs. To enable this feature KVM
> userspace must provide a memory region that will be used to publish
> the information to the guest. The memory region is typical migratable
> region. The GPA of the region is given to KVM through a VCPU device
> ioctl interface. This feature is only available for 64-bit hosts
> running 64-bit guests.
>
> This series provides the QEMU support of this feature. It will
> be enabled by default for 5.1 machine types and later, but may
> be disabled with a new CPU property "kvm-steal-time".

Just a note that this has missed 5.1, but I'll review it at
some point for 5.2.

thanks
-- PMM
