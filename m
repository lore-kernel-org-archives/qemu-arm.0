Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp460619lfq;
        Tue, 8 Sep 2020 03:04:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJnX38OgOJfYZO++5G4tIdIsuR7v6e3mQLOp+hchQysPBfsVtwj5DUJCXKYEu+6HZSk0NU
X-Received: by 2002:a25:9905:: with SMTP id z5mr18945184ybn.38.1599559493002;
        Tue, 08 Sep 2020 03:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599559492; cv=none;
        d=google.com; s=arc-20160816;
        b=tSLkgGBzRMg8brAt+qlxzesKtbDz8olG/BZssbvNJ2WZpjX2TkIP+v72L7J3CqAHsk
         bWlCes6WwGrJfPFt7cxMCUkVoZ/URpxDKDpA/ylyCmBbzgYPee0F/IEpRkaPn0kzZ7pr
         Cqu2KlRy3YgpOAnESJ0rH4Wa7VFye3gNRAAZbycVq6+Ea9oCQthtI3vYv0hjeddkQo8K
         2Ks7V1Wq3XwqzNE+dUaGmel4js2e9Qnuvh0/aIIxynRW5aiB4CMXrBsNdDfBkYE6W8Fy
         Q7ckAVr1mvoGYL3VFNhgS3oCn2P5pWm9OsSsrfCdCayaeXv+B0fC2VK7H5W4x7Gyx6q5
         CHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=pHwrWC7u2HrkS5TSF535ot5rdvmEgH9XL4Qkine6i2I=;
        b=keBPgBp/6y6vvQxhfcfGNTpcHeLDDxuPtq7ncBheYxzzFB+smHWwnB/M4iyD7z7w1g
         NKV0YlaiT32kudca8bdokLHpZWtst7af9vI+/RcbrZZOePOuOjHMpg5/PFToLSO75zwm
         c7v2lQBwJKTpSGEBC9cU6e/3ZhmiVg8TYNdKBvJELh3m7N/OoX/oyQ2V50zMGaq8tEwx
         1mLWqHrho1DT9n26MyyonSvPUhK03wq71/WSkbXmp2/Aflf6YG077/QvL4iWQJLeptDX
         /Rk7KRmhY0hUctDvc6Yw8zMuC8eLzNOJfzn0vv2aMHS4464c9G7lLk/OjlVUomSGuNIc
         qCLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PNxTyJSW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 126si16662459ybk.309.2020.09.08.03.04.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 03:04:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PNxTyJSW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFaUe-0000xR-B9
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 06:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kFaUV-0000ul-H5
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 06:04:43 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:46332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kFaUT-0005hs-Ck
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 06:04:43 -0400
Received: by mail-ed1-x543.google.com with SMTP id a12so15340809eds.13
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2020 03:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pHwrWC7u2HrkS5TSF535ot5rdvmEgH9XL4Qkine6i2I=;
 b=PNxTyJSWy0rhDv+e+Nd+L3RHW1DJpUR1P6uUeRbTtkO1rrnhD7oHJPk5c10M/j2lyx
 MvEnaqN9eWFcIL16BEFscBDTJIo9GONmUjdAcT9Xt2/WRZrqHfRnECbYMcddK7DdTaYK
 g9KNz+hZwDlmTC30tHDqxOeJjpBUr4g3Iq3bt6qdfmjDsJ+xHS+5aMqIUZ1uYcgRiong
 QcsGnz5Ep9+imcuAxFhyWhLSvo50aQ8YwseN7m/8+fDbCooXyFzUH/fhyZqxjzdLobwn
 yQC08uihh5xGX/973jfEv+0ncNoiE4p/jG0MA/veDMO1Dr/VAu6Ro6GqiHuC4vqsglPC
 VgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pHwrWC7u2HrkS5TSF535ot5rdvmEgH9XL4Qkine6i2I=;
 b=ZYm/x5JyexgtFOsfpSKy4fTWSD3o/fFzVLUUz31YwbyN+OD7ESIv5rZwUj7sD4o2Ew
 WfzpM77nU1wqGnPgZnDU7C0VskHqkVWxBOc71tvCskmveYC9RaoLuygfT92FsT8JFX7p
 T20zrdST6LSoyYP5WJm9wbaTorHRstcB5TAhI4RTRxitkQDH1I3UOL5DawhFV4l9NVZf
 Oyz66QJCDBWiqMyib+lIuzIDAYf/ZAyDxHBsE3DeBlTveMxSdCyzZPI4blErX5xtTFEZ
 Y17plP8biJeEJnVxGWGTcSi9ff9sotmCkjWhlLi1DMVW6Xca+7eekiXzet0NG1peaqmf
 +lug==
X-Gm-Message-State: AOAM532pCwHrfy+QvJa4KYMFv9vWFtWXKRsLXUDBRYvKiYLSiN0QVrPH
 thOF3HQ6qxKrjRnmeHz8tfKdM4vjlUFVchvfNzXsuw==
X-Received: by 2002:a50:8f45:: with SMTP id 63mr26907407edy.52.1599559478516; 
 Tue, 08 Sep 2020 03:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200907163257.46527-1-f4bug@amsat.org>
 <20200907163257.46527-9-f4bug@amsat.org>
 <87h7s8g0v2.fsf@dusky.pond.sub.org>
In-Reply-To: <87h7s8g0v2.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Sep 2020 11:04:26 +0100
Message-ID: <CAFEAcA_Mkh-PM7z4ESyU4AJpDj8f+RVdUSMGeEVUanmvR=6f1w@mail.gmail.com>
Subject: Re: [RFC PATCH v4 8/8] hw/arm/tosa: Make TYPE_TOSA_MISC_GPIO a plain
 QDev
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4MN7EzUj9vb7

On Tue, 8 Sep 2020 at 08:54, Markus Armbruster <armbru@redhat.com> wrote:
>
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>
> > TYPE_TOSA_MISC_GPIO doesn't need to be a SysBus device,
> > make it a plain QDev.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> > RFC because having to pass MachineState and call
> > object_property_add_child() simply makes things more
> > complex... but it seems to cleaner QOM design.
>
> Well, what devices really *need* to be sysbus devices?
>
> The question is trivial for "real" buses, such as PCI, USB, and so
> forth: a device is a FOO device when it plugs into a FOO bus.
>
> Sysbus is quite unlike these "real" buses.  It exists because qdev
> initially *required* qdevs to plug into a qbus, so we made up a qbus for
> the devices that don't plug into any of our "real" buses[1].
>
> I figure all sysbus devices could be coded as bus-less devices today.
> So the answer to "what devices really *need* to be sysbus devices?" is
> "none".

The major thing sysbus being a bus gives you is reset: devices
on buses get reset automatically, but devices not on buses don't.
So in this particular case I'm not in favour of this change --
right now the TOSA_MISC_GPIO device doesn't happen to need a reset,
but having devices floating around in the system which can't have
a reset method is a beartrap for our future selves. It's bad enough
that we have this issue today with CPU objects: I don't want us to
extend that to anything else if we can avoid it.

> I think a more useful question is what devices *should* be coded as
> sysbus devices vs. bus-less devices.
>
> Sysbus is more than just a dummy qbus.  It's a software interface that
> provides useful stuff.  To use it, the device needs to be a
> SysBusDevice.  This leads to a partial answer: if the device profits
> from stuff we provide only to SysBusDevices, it should be one.
>
> Perhaps the useful stuff could be separated from SysBusDevice.  Then
> this partial answer evaporates.

This also is true -- some pretty generic useful stuff like "I can have
MMIO regions" and "I get automatically reset" is implemented in sysbus,
and some (like "I have gpio lines") for DeviceState. I would be happy
to see this cleaned up. For the code we have at the moment I prefer
to treat SysBusDevice as the preferred parent class for devices, ie
don't directly inherit from DeviceState unless you really know what
you're doing.

The reset stuff in particular is desperately in need of a cleanup
but it's a swamp, as usual. Currently we reset along the qbus tree
(which is why non-bus-connected devices don't get their qdev reset
method called, and must fend for themselves via qemu_register_reset()).
These days I feel like "resetting a device should reset all its QOM
children" would be a more natural way to model things (with some sort
of "this device needs to override that default behaviour" for SoCs
with more complicated reset handling) but getting there from here
feels like it would be very painful.

> There is just one instance of TYPE_SYSTEM_BUS[2].  This leads to another
> partial answer: if the device can be part of another device, it should
> not be a SysBusDevice.
>
> Sysbus also enables "dynamic" sysbus devices.  Shoehorning them into
> SysBusDevice may have been a mistake.

I was never much of a fan of dynamic sysbus devices at all :-)

thanks
-- PMM
