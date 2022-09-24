Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp855081ejy;
        Sat, 24 Sep 2022 02:11:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6mpJ+/cHCDrIT8akeH2XxYIKMP4QkaDdB28HoKkfwsuvwAdhrLkh0YJWTtmuYT4u1F/zgx
X-Received: by 2002:a05:622a:50:b0:35c:ee8c:c643 with SMTP id y16-20020a05622a005000b0035cee8cc643mr10452530qtw.315.1664010680182;
        Sat, 24 Sep 2022 02:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664010680; cv=none;
        d=google.com; s=arc-20160816;
        b=iaG1e0YKsbaB86RwLVsr4ld6YK0hucFrUda/KVy3VWTXBo5qW9BfOCTnC2MX9LvAuv
         3ij8FKEH19WRhwMFloZaZaypFpcqd0EIlvBwjxTiJBXJZo8nLwgoalgHJ5/MO1CFGqls
         TdiR1yDpGVfMWuKKvWL6sbU5AE0m3dj2Bo+E0Kg5lUuLoFRSss2YrYsYjQVb2Do9R/Dp
         VU9Er29P+G8qBFKa9aWZm3tecAhpoiyH2Rc1hGATEvgHZmrP2BFtcvt1+Typ7SZuBZDJ
         i4JHo7kNE+vZQ8kaLiRhv1l69iWQX5VSrzueYeqg1v4mdhJSbwfQUzeGApht6jopwfDS
         M1Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Yq2diIusuO1Sjn6Er52SaSUiU3/pPgt/CwGzIP3Y3zY=;
        b=pI/RU8FdnkjaybZRxjNeeJA/W3S4FWxQmmvm8IwyEhj9vj/S5Lp3vlhb05NeZZFUJf
         xF4qR6i2pVCLZUKypwsCRgH/BeORTMko9VqJiHo+k6t+liomHorsKhUJ6gP3mT8FGhVr
         jLlB0rNQDAc3WvUtOYInIEymll7wkJc13X9OSIWnz3/X9e8yaEMrs3QwoQQxOzSuaXBO
         pAV4zSOXuTK9Inh7yu+s4sIF+KSkwXw4RdNqbU8T1Q3+DP7bHZSqFgG0j2WqYFzyYNiS
         D3w9IXvS2yTq9O2LXrlQCDc5dbyMr9N/EGpLvob+8g2++3VRfDJOYE+mIHi5T1AiDyvi
         bWoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hh+9WHL9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cb21-20020a05622a1f9500b0035d24e527a5si1788961qtb.775.2022.09.24.02.11.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Sep 2022 02:11:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hh+9WHL9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oc1Bv-0008EB-Im
	for alex.bennee@linaro.org; Sat, 24 Sep 2022 05:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oc1BV-0008Dw-2h
 for qemu-arm@nongnu.org; Sat, 24 Sep 2022 05:10:53 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:40896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oc1BS-0005uM-PY
 for qemu-arm@nongnu.org; Sat, 24 Sep 2022 05:10:52 -0400
Received: by mail-ed1-x532.google.com with SMTP id v2so2112593edc.7
 for <qemu-arm@nongnu.org>; Sat, 24 Sep 2022 02:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Yq2diIusuO1Sjn6Er52SaSUiU3/pPgt/CwGzIP3Y3zY=;
 b=hh+9WHL9qZxT/6IynQEUfmi7bDD4oG+vABunBbAUrv542Ok20erkAVZ1PvW6T07RHz
 uAzminIXPiTD48ihJaVTjGFXetDhlX54Jsgr8oVaPdjzAPIf1lbUzZsPvwnpT40Zz2qx
 vs30NsGUP17gVLOHt+JpZYSCUXxm37JWqVCH755DeBtLvEbLeGWU7FCTEWApnXDXcab0
 AKt8vjF7nThr+w8u9Xj9UuoXfOopXfyqonOqZH4fu66uCw2+0qi/89kzVtDOmjMv8/Au
 g37aX03T7Lh7rpItUaGUjjib1Ws9IXYcEqAxH8ajckMBQfJjJeRWin2/VGslE+duoQW4
 yIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Yq2diIusuO1Sjn6Er52SaSUiU3/pPgt/CwGzIP3Y3zY=;
 b=UWKccpif0QruvbrpNZG57sTse31eKZO3ivBfMDVs99WOdZAErJxf6S+I2KtvoHIqdL
 z6Zj2HxBzq9QI+UwNsjFHxRjgqJjk50wMWkYknm2Z66cfDgTzl4IN8Bh3mfx/y+ql+Cl
 PYi1cf40K7AAGJ8rBt1QFm2Iht5T6aHESf9c+tMsq1dDRqyv2w0vFTaoy9LS+0dsXS+G
 ho9PYIbAhsc0Wt30qfXHlUk4cVy1sCDOdTL6n1lY8M75Lavisnuf+pwctQueGLYnyqyz
 1KEU7Qv9hwbHOp2Sjx5mPm3jUIMXbsZePS17jflIfDHFzQF0PhZosy+bJqz7osLFK+iP
 zMTw==
X-Gm-Message-State: ACrzQf257Xg/WDyeuAFyt7S98kq1I7X9tU0jMsCqNZEuvm6lRp9J7Wi6
 ETW7ZL0PL+CzgjVzPVhlHARyBc6AZ0reedWxkXCMJA==
X-Received: by 2002:a05:6402:1d86:b0:457:e84:f0e with SMTP id
 dk6-20020a0564021d8600b004570e840f0emr436343edb.241.1664010646563; Sat, 24
 Sep 2022 02:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220921234646.949273-1-venture@google.com>
 <CAFEAcA8f+JA4WKMwGFNxg7tRxTwL=RzDLgdJLrP8Dw_jB4XoRA@mail.gmail.com>
 <CACGkMEvMtAjGQVzwUgjD20Hb=Za8KmRanmp-FWrUQD8xS+7Pkw@mail.gmail.com>
 <CAO=notwnOKMd=n2qQC=iFX-cofeKP=ZUKX2VNXobMgXO64Y+sw@mail.gmail.com>
In-Reply-To: <CAO=notwnOKMd=n2qQC=iFX-cofeKP=ZUKX2VNXobMgXO64Y+sw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 24 Sep 2022 10:10:35 +0100
Message-ID: <CAFEAcA97oHsQdk2fSq=umiUv8nNue0xCLtboRR2yPt_Gxh_zEg@mail.gmail.com>
Subject: Re: [PATCH] hw/net: npcm7xx_emc: set MAC in register space
To: Patrick Venture <venture@google.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, 
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nAtTBbqg1w7q

On Sat, 24 Sept 2022 at 00:42, Patrick Venture <venture@google.com> wrote:
> On Thu, Sep 22, 2022 at 8:21 PM Jason Wang <jasowang@redhat.com> wrote:
>>
>> On Thu, Sep 22, 2022 at 8:35 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>> > A question to which I don't know the answer: if the guest writes to
>> > the device to change the MAC address, should that persist across
>> > reset, or should reset revert the device to the original MAC address
>> > as specified by the user on the command line or whatever ? At the
>> > moment you have the former behaviour (and end up storing the MAC
>> > address in two places as a result -- it would be neater to either
>> > keep it in only one place, or else have emc->regs[] be the current
>> > programmed MAC address and emc->conf.macaddr the value to reset to).
>> >
>> > I'm not sure we're consistent between device models about that,
>> > eg the e1000 seems to reset to the initial MAC addr, but the
>> > imx_fec keeps the guest-set value over resets. Jason, is there
>> > a recommended "right way" to handle guest-programmable MAC addresses
>> > over device reset ?
>>
>> I think it depends on the NIC.
>>
>> E1000 has a EEPROM interface for providing the MAC address for the
>> ethernet controller before it can be accessed by the driver during
>> reset. For modern Intel NICs like E810, it has similar semantics but
>> using NVM instead of EEPROM. So the current e1000 behaviour seems to
>> be correct (treat the initiali MAC as the one stored in the EEPROM).
>>
>> I guess most NIC should behave the same as having a persistent storage
>> for MAC for the controller during reset, but I'm not sure this is the
>> case for imx_fec.

> So the first time the NIC is realized, it should take the value from
> the command line.  Then later if the guest OS updates it, it should
> always on reset use that provided value?

I think what Jason is suggesting is that that should depend on what
the real hardware does. On a physical board, if the guest sets the
MAC address, and then you power-cycle the hardware, does the MAC
that it set still persist after powercycle ? Does the guest writing
to these MAC registers correspond to writing to an EEPROM ?

thanks
-- PMM
