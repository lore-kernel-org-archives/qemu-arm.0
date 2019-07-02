Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3586425wru;
        Tue, 2 Jul 2019 02:23:18 -0700 (PDT)
X-Received: by 2002:aca:1304:: with SMTP id e4mr2312256oii.149.1562059398009;
        Tue, 02 Jul 2019 02:23:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562059398; cv=none;
        d=google.com; s=arc-20160816;
        b=dXwENCgt/HbbNgD9sKvU9JlTUQbY+RPC/HJaF7PkZnWl5yOJpuwOpLXFg84D3hCAeV
         4ue6Ap9bsbsso33pL7ia+VtfUn3v0do1UpTkw0eDdGZYW+KNwcSMplUv5ifBwuzI/zFq
         02dsolXvVJRgzoZCK836KYABGTBj0f6g0P43aPuaMYSsIzAdvNXXmvBNwuHUl0Nl4uAc
         Wu8K0P9L0waygKneG6UKfl/+GpVXUpx5f5GBFgDWoFaIy8SCx5K4Vmty3l8jVI+KvrRA
         OrfO2gP7qx2huwuK7jpT52xLD2T341IfuiOlEq+tP+HHpAciYTPjyPfSzLohn+XPvhq1
         WoEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HJp8Y3IivklWEU/GlPUXnnihWF/59LLGbSOdRuk95RU=;
        b=f9B36spLKkq2IZvKBOjhE/Gr3v+fiPhrbpdEFukM1qZJ2C78clwzcLUMChqQOLrz6K
         aDQFj7f1+M5D87QJzzrdVm+/1KJL/d9LIGGe/GiBeYM36fKb1Zl0Rl/k0z1470Oaerk4
         YuNorSN9/usta08khRmDdw7hMi7ZPtUGe8o9caUvKkbJ/KKlsphvlpD/DRs+ITD9I67m
         QqRKWlePXA1HJYrs/LbmRgSroXpcG5fwrFxbkmt85JXF3gzKj+Z4DViPsC2PgfU75+WG
         O5SvnEONbiVQ4nlGHXpEYqPQeFKwtGhM2iMuEwyEbWVW9jJB1PVq89KRRL+Zf75Z8oao
         TRtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mxtyvy9h;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b129sor5930762oih.128.2019.07.02.02.23.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Jul 2019 02:23:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mxtyvy9h;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HJp8Y3IivklWEU/GlPUXnnihWF/59LLGbSOdRuk95RU=;
        b=mxtyvy9hWNVCM5XEYgTpaC0Vy3f00l0OihddldLcVAghD2i5PAb6LcVGe0NUMLDgta
         93OdO7gsvg6s9P8OxYO7qEs7tAXCe8u4fX2xTDvwJdVPOBFWbIVxKkvx0Z6ZeA5SKH1k
         X9N62eo/ZuF7jF2Vcei4mrFkem3AW/2ElkbXoA5V28ZuDaO3E8VrvtnoA6+LIUdiSPCg
         NHXYvBD+tqUOdHY5Ll0immQuMX8r6h/f0S1E9b3SouPOuJ4NaN3W7VzjD+ibVx9i3Pau
         PP9SdkGmbTUgcUtqwWtVQu3f4yXTlmZ0Iq1s3n+IoZnOf0QbE3hNlh3u1YtqO2QYN9p2
         SFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HJp8Y3IivklWEU/GlPUXnnihWF/59LLGbSOdRuk95RU=;
        b=XAgsUi1nHAzWhwWNe452W3/VkFfOKFgvHhYpOUEtpVvdPNk5KsndVO4ZbAuB+OB3GF
         cJeqL2GyhaZWsQtZiOe0zSd2WN2A4HPJPBkeU581z4+AzN+h18u9Q8Cb5nkEuACQu3j4
         WyjA0SryeDwS+IgbSRFV+fwf1c2ef9scy6f7MHmL65CMBXnaaOMA8OjfDgEUVXwwpNen
         hUG0SbvfH0/R1/WQjbdqGuNB2awNzZRUPPvhHJUl3Vknu+S9XJmG0ST+vHMJklTGasDG
         BdliXFzlUIXgNpByI3CaZsyLM2ip5e3HgBV6WLsbec+zPd5RYMmeui8e6STJ55m12Czy
         PQqg==
X-Gm-Message-State: APjAAAW/KrmMFpS5+05uVrzy8qFcXBRz61abciMT+igmV9Q8t/eX3z9J
	jKcPLXENSMzgEGUA0IP9Op/h3U6WiWxL/7120nQLKzNV
X-Google-Smtp-Source: APXvYqyTM0fBOGp/708ohExZKyWab+1S+q3+ssOYp+kRD7V9nLB+b/74b3YRAYIZMSbhw9mIpbcv540IPa/K3Y+PW7Y=
X-Received: by 2002:aca:ac48:: with SMTP id v69mr2304932oie.48.1562059397642;
 Tue, 02 Jul 2019 02:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190702001301.4768-1-philmd@redhat.com> <20190702001301.4768-6-philmd@redhat.com>
 <5163b3e4-f68e-dc6b-3fcc-e7927ebc58e7@redhat.com>
In-Reply-To: <5163b3e4-f68e-dc6b-3fcc-e7927ebc58e7@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Jul 2019 10:23:06 +0100
Message-ID: <CAFEAcA_n3BpZuBPFS8y90XaOwzAo-tuKpO24_apz+9yzpxUxHQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] hw/block/pflash_cfi01: Add the DeviceReset() handler
To: John Snow <jsnow@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Laszlo Ersek <lersek@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, 
	qemu-ppc <qemu-ppc@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>, 
	Aleksandar Markovic <amarkovic@wavecomp.com>, Wei Yang <richardw.yang@linux.intel.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Aurelien Jarno <aurelien@aurel32.net>, BALATON Zoltan <balaton@eik.bme.hu>, 
	Markus Armbruster <armbru@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Michael Walle <michael@walle.cc>, 
	Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Alistair Francis <alistair23@gmail.com>, 
	Qemu-block <qemu-block@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, Aleksandar Rikalo <arikalo@wavecomp.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: ZIH/Tt9PVgqh

On Tue, 2 Jul 2019 at 04:16, John Snow <jsnow@redhat.com> wrote:
> Does reset always get called as part of realize, really?
>
> Or are we just trusting that the device is probably going to get reset
> by the guest during bringup?

Reset is not called "as part of realize", but it is guaranteed
to be called after realize and before we try to run the guest,
as long as the device is in the qbus tree. Things are in the
qbus tree if either:
 * they're plugged into something already in the tree (eg
   pci devices, scsi disks)
 * they're a sysbus device (which is automatically plugged into
   the 'main system bus' which is effectively the root of the
   qbus tree)

In this case TYPE_PFLASH_CFI01 is a subclass of TYPE_SYS_BUS_DEVICE,
so it will always be reset as part of system reset.

(the main things which don't get automatically reset are direct
subclasses of TYPE_DEVICE, notably CPU objects.)

thanks
-- PMM
