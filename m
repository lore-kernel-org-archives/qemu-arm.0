Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp282779lfk;
        Fri, 22 Apr 2022 01:45:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh7wS/JgCNhFb6FUChEjScTLNnNKWAF29iu/ku7oiIE8EHSEZgIe13HF/BAgsU3RP2sjt9
X-Received: by 2002:ac8:73cc:0:b0:2f1:d735:c9b0 with SMTP id v12-20020ac873cc000000b002f1d735c9b0mr2374857qtp.288.1650617123227;
        Fri, 22 Apr 2022 01:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650617123; cv=none;
        d=google.com; s=arc-20160816;
        b=Ba1TVEBR7Q5xyoHRQXYUs/m2HKh3OGSHHbCz5gmTk/7ZfwfLaL2hshAYiD2RflNlYU
         jphkxPu6+mEgP1ZNoCX4pcASk+Ml88FzL6YHUheRv/Y9XrA4LsjFqv4GzCCGKnamqJ9q
         Ejkn1ahHuId0NBXIVa8XQBv+dXOpyrutw3cDmlL1qBT/w7Vr8D/9SqeHpF2l45UiuAZ7
         bOPBPJFhWJoElZYiFoRlk+MKWcIfLHmyDTCcHGIxzCx9bgP3mLrNgceux0JKP+aCm27L
         WO6G2nHfkJShTtQHglSHtBm4BohVzo7p4P0B1/WGTEaf0cjZfcjINyrpp1FM+2qTYUmC
         XHRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5m1RJ7QYQ8PodX60mljRnorDu+JPGwZK9A8heCnabjo=;
        b=vs/zlxL/rl9OSaOxReXBZtkQp1dNsn8w/nyT/AuADS8AZMP7vKxawcQmgo/W/gRqUb
         iRtnZrJVc4nvf7qEaIAIPhDgsbcNeXDJdxsBDN5GETy4UYJF/jb76kCB3eNhHsWqsNIF
         PkL0y0/Y6fKZbs5SI/fjqWqkoKMRANftUOV3SMEzZlbFqiVCJ2OtiwkrJMih+IsNaxmE
         LgBVLZ/JzoeG1ZE6VKYVCJoM0Ue8EwPaXo/8MwJjlJv8K9frgjmV+/c9/PfKSsBYy/Jy
         a4Yi1XlAL2Kyt5F/KsYOD8+xVvNv9WE549rhZYXM+Eg+TsmuSWFGddw814UaJvcz2uBW
         QHNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tPnjG5g1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13-20020ac85c0d000000b002f1f22a610fsi2049122qti.149.2022.04.22.01.45.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Apr 2022 01:45:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tPnjG5g1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhouo-0001OM-MY
	for alex.bennee@linaro.org; Fri, 22 Apr 2022 04:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhopR-0000db-6c
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 04:39:50 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:42928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhopP-0006WA-AS
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 04:39:48 -0400
Received: by mail-yb1-xb29.google.com with SMTP id p65so13210331ybp.9
 for <qemu-arm@nongnu.org>; Fri, 22 Apr 2022 01:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5m1RJ7QYQ8PodX60mljRnorDu+JPGwZK9A8heCnabjo=;
 b=tPnjG5g13X/tquX0VJgzmzGO4pWMeGy/E//RCQHciSHY/6gqHSxivAa1dK/58p3py3
 0PsZYakOQRfUDz5HHDKpsOmraI9EABJARiyhqCWkCeNPVMXqtaUh9Pb34rC6RO8Nm+/B
 i2cKV8r7x5T3+huei74dh69pzdO4KNe/DShWone5gVhrZANJYvmcUPuCeiSXylqpnHis
 M72KTytwWG8xDWy8aSN9RnSk7sSD3dbPSL0/AfIVaz0LasDrvqqe7K6C3ZbNuq8qWeK4
 fRKc8lOg/jMUIqLJ7VEJAXB44mPu7J+CRQWCNHKYV+iufoFnsSMsXC000JJ5JFAJhKCu
 rThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5m1RJ7QYQ8PodX60mljRnorDu+JPGwZK9A8heCnabjo=;
 b=7Nc5mT+O+B5zrKW1xbmfO06p8y3tJZcx3rLg/QDKIPJ6WRr4b1VNsTZirmRnbxJRUV
 hdRhOUP1RYTChSnfP70XMESa4Dou0QXftug5yk42ybC7GVnoODU583ZqBW8r2bYdrdWY
 zZByiIiBaYDex6aNPEcCOZKsMbu4VmhmqcL0LDYpThVq6cL54jc4iRt+4dKgIOqXox+Q
 3/+eUvaC2y7Ff420CXnC8FglOdTcIdD55oQYcAC/IdNJpPncZjB1PcJnyJWlMEBmV08b
 7vsjBTZcAJdL8jg8Y7ZBakLWx/6FGEw2RGnVzPXZi4+DJmKNV1n08zg6QFSMLG0lqLK+
 XnDg==
X-Gm-Message-State: AOAM531k8dSrDrXULKAfU+DyIQaENC+koT7HzQ7ExrgSCSMlisBwxRhm
 v1LenHeXjTajC5nqEiKrfiUZkoPTdSTRIF4YYvsQHQ==
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr2214419yba.193.1650616786251; Fri, 22
 Apr 2022 01:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-23-peter.maydell@linaro.org>
 <05bad303-e4d7-c776-5105-6b74a559fc38@linaro.org>
In-Reply-To: <05bad303-e4d7-c776-5105-6b74a559fc38@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 09:39:35 +0100
Message-ID: <CAFEAcA__r7FnyuS=wt_zk2b0n6sV191pceZBFWHfMFOrxQDHrw@mail.gmail.com>
Subject: Re: [PATCH 22/41] hw/intc/arm_gicv3: Implement GICv4's new
 redistributor frame
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Yhlv/CNPFxc

On Sat, 9 Apr 2022 at 19:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/8/22 07:15, Peter Maydell wrote:
> > diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> > index 7c75dd6f072..9f1fe09a78e 100644
> > --- a/hw/intc/arm_gicv3_redist.c
> > +++ b/hw/intc/arm_gicv3_redist.c
> > @@ -442,8 +442,8 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
> >        * in the memory map); if so then the GIC has multiple MemoryRegions
> >        * for the redistributors.
> >        */
> > -    cpuidx = region->cpuidx + offset / GICV3_REDIST_SIZE;
> > -    offset %= GICV3_REDIST_SIZE;
> > +    cpuidx = region->cpuidx + offset / gicv3_redist_size(s);
> > +    offset %= gicv3_redist_size(s);
> >
> >       cs = &s->cpu[cpuidx];
> >
> > @@ -501,8 +501,8 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
> >        * in the memory map); if so then the GIC has multiple MemoryRegions
> >        * for the redistributors.
> >        */
> > -    cpuidx = region->cpuidx + offset / GICV3_REDIST_SIZE;
> > -    offset %= GICV3_REDIST_SIZE;
> > +    cpuidx = region->cpuidx + offset / gicv3_redist_size(s);
> > +    offset %= gicv3_redist_size(s);
>
> In these two cases, it would be better to call the function only once.

The compiler is smart enough to only actually call the function once
(and thus to do the / and % with a single div and imul), so I don't
think that explicitly adding a local variable and doing the call-once
by hand is really worthwhile.

thanks
-- PMM
