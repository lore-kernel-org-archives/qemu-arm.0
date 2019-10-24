Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2305129wrq;
        Thu, 24 Oct 2019 05:50:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzB3Btfs+Urgc3YuRr7u5BM82uWITFpLPaPtIy3iEIVOcif3YIEmOMl9DYOIhM19BgYt6Le
X-Received: by 2002:a37:f90e:: with SMTP id l14mr13410288qkj.68.1571921411141;
        Thu, 24 Oct 2019 05:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571921411; cv=none;
        d=google.com; s=arc-20160816;
        b=QKogNdrPzm/moEebJw0p3AJLXWPwc9J1OTFFCpP5gprVi44eBfvjMba9xQMVvV9/S9
         SvfapPMZgi5EbIkBFodxq1GIn0J3DjvPSEvperMEym85rY4a8tb7me8T0lWTqvCvsVrj
         vpF7jCUkYHX1Crv13YBTrosix1Khe6MeHERmqlEu7vTfOa3eEV3nyy2x4eI96PTJswvP
         ZdyH6dpIzvZ7PiEBXshd9XgDPJp5UOsWbHusbnSi06xVACZMvaFt6Vf8Qw9K4ZJNDhJx
         3MjDHWYUZ7JMBed+UNSm10/Gs45tpwrxkidDllgm38WZVzz/rW6XpVgdPMFEZdxGXCeV
         EBzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Yc2rcnVA2Lk9wwG5059ptOPuD0SUyeMds9j2vZiOKLc=;
        b=L1NDAfRtyObtv2+45QsjrbiwqNhtlxU3D23pNK8YXsSCmb7Pr4wMpoEODlmpjK/iy6
         bkDqe9BygL+zKvuq32OZpqgu5P84GuRMFnyo0bn0GRMcJimgxc8L3D79YJwGpoXvJ0/p
         1KFhtq0SD9zjnTh7/jsxwkzbgR7sEg3pdys6R0zJEhdd5qp9C1i5ShUNpcCOxXfWiKMD
         6Yh0O79BoflWycxCQobc7BUxygV5FipRxfZmoI98PoPE3dgRyghv0cYUEAB1jwo1HsxQ
         OMqkyouuOcdAryxMaQwBZBuxFsdC+crsAOOHO5k1PMwtESCrpFD+sbQujIUW5UHsw3Eh
         PF/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=n7LBe6S0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20si1736337qtr.248.2019.10.24.05.50.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2019 05:50:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=n7LBe6S0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNcZ8-0001s8-Cg
	for alex.bennee@linaro.org; Thu, 24 Oct 2019 08:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42130)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iNbfW-0006e8-1C
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 07:52:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iNbfU-0002HE-FY
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 07:52:41 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40975)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iNbfT-0002GM-SK
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 07:52:40 -0400
Received: by mail-ot1-x341.google.com with SMTP id 94so455846oty.8
 for <qemu-arm@nongnu.org>; Thu, 24 Oct 2019 04:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Yc2rcnVA2Lk9wwG5059ptOPuD0SUyeMds9j2vZiOKLc=;
 b=n7LBe6S0xgI9UQr1nzYKxNUZioAcah8IYI0SKUFwbmNKSDtwMSRsRMSaXt3d7gDT1e
 qPwnPp7UQvI92ca6jqsEqsi0avZM2vTvW8pEOdZNC646vSrly5dlyhE1eUZ1vLAC4R9O
 4KdPxuz3PsYoYrZbCfA7TKiBuVD+dV36cI3p+7BaMnH6UjLcbrO+P6lyhzBekLdixsdI
 ACzgaEPeYh2CxtZbaPWWDtxXmWR5Fgtc6TP24Q7PRp+2P7XccSPqP1gl9STVNFz/wxCC
 zknGrHDXdz1gaDR+MKP+H5DEqRK6D5sECNZx8SJABELAsm50d8v0SxoQ4wHTjom2vWiD
 8gTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Yc2rcnVA2Lk9wwG5059ptOPuD0SUyeMds9j2vZiOKLc=;
 b=LLPaCyl626wKCbyxsGTpCN3f+dto/HERtfQOO6W+4QYEsQCsJFS3+mPp+d/z1gcsxD
 M3TtBjFfOIW1O7XzoBedWK1gy3RvvirMQVgDIL6la2BQsJiFm3Z4V+9267HOxkvs9V4e
 LzEif5z4ytsELA/6xE0yX9PRz/1sk3hCOnGbwY/mlKF0gMlcf7Mq/vucpo2QWcgtOpop
 THKLR3b5bjkhO8OlsD9loneKzBl7qshdwiByjGJbKGf37YusuI2CJvPUDvGwJTkOijc5
 +1EOCSW9cJHYXmHF7yagiAmiiEuK0xIbJJMQDz9+LVZOWFh3a7O+Bq8Os4oBGb7LO5E1
 k5Aw==
X-Gm-Message-State: APjAAAXNSdypoov3gdr9f5mZEaqr1G3PFGwIjQmSPKHexw8nXllU6cYe
 3/qBUaesn6ktaH+oLh3M/9GWzaEiw74rV5GdZfTNeA==
X-Received: by 2002:a9d:398a:: with SMTP id y10mr10728093otb.97.1571917958865; 
 Thu, 24 Oct 2019 04:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-22-marcandre.lureau@redhat.com>
 <2d027692-e178-c1c8-8384-ad70ed345f29@redhat.com>
 <CAMxuvay9kroZUo7ZbdhJqKAdp52rMmLGv0LBvktb68B2CKg+Mw@mail.gmail.com>
 <2b9352d7-f4de-bd5c-62c5-cebec79e1c48@redhat.com>
In-Reply-To: <2b9352d7-f4de-bd5c-62c5-cebec79e1c48@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Oct 2019 12:52:28 +0100
Message-ID: <CAFEAcA_A4edo3fQBJux6QBxkCf_r_EdrmYgv5OPidWDdn4aD8g@mail.gmail.com>
Subject: Re: [PATCH v3 21/33] lance: replace PROP_PTR with PROP_LINK
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Paul Burton <pburton@wavecomp.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6UCdu4dNktjx

On Thu, 24 Oct 2019 at 12:48, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> Just wondering, if we had a "bus_address" property to the abstract
> SysBus class (and eventually "bus_name" for later) we could create/map
> sysbus devices from command line?

I don't think this is a good plan -- users shouldn't have to know
about the memory map of their boards. Plus it doesn't deal with
the complications of multiple address spaces, DMA, wiring up
irq lines to an interrupt controller, SoC reset handling,
clocks, power-managment...  Command line -device was designed
for pluggable devices, where in the world of real hardware
the device can be physically plugged and unplugged and there's
a clear interface that can be modelled. You can't add an
extra UART to an embedded board in real hardware either.

The only plausible argument I've seen for command-line
plugging of embedded devices is as a sort of side-effect
of having a configuration language syntax for them for
the purpose of being able to write board models as
data-driven config files rather than in C code. But
that would be a lot of design and engineering work, and
if we want that I think we should approach it forwards,
not arrive at it backwards by adding gradual tweaks like
'address' properties to devices.

thanks
-- PMM
