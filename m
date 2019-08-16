Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp712657wrs;
        Fri, 16 Aug 2019 05:02:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz/INOYAnRsWSE8jnYCY1y4TnT314N9WE2FS+SNLmxLdascW2zfRgm/ojIXYudXe5Qko/dk
X-Received: by 2002:a17:906:c802:: with SMTP id cx2mr8750410ejb.114.1565956966918;
        Fri, 16 Aug 2019 05:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565956966; cv=none;
        d=google.com; s=arc-20160816;
        b=YOq8MtMYIBlQpYUrjCxpP2rGaVfaLiyuyK+6ErSECL4yELALYKOkmZg604sskk8joI
         2h/kIAyVeP/ZzAhOpXMrCCcpc5+PuuqYKdFuPNDE8ERlO52laiEJXuygvPLtAjQaKJb3
         n7SNmwShLcwsbfJiEL62rTv1R0byD92AfdBZ1lEC03FzpZiRoskVKX6uDBcyeZ69nsuQ
         uDmNx8O99eeabXYFcpXQ/afHXrTty5dryk/t5NzEKY7gRcTraqLUAQJOVK26NOmZ21Jt
         HJuqhioZvO+B598a/2INNwsZUTAhZ6bIxURbMw0hE+LOELd2sZ1ic9HlQrSZQtdHxvds
         6ISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=mTlvEQlwQxD+m3KCNTaQoPeyNkMz5awwGRbjpwvjjP4=;
        b=u+tCAQ9+edSsNwA5+SrRGfsBNsBKL5DLROwQTO93PFhbcs6M+BjmSSaOsbevpxye9Y
         gj41JxK6mIE/+n53/43+8GI9/2dJBbSNhLv3xOgSG6XgPNB4a8+BNXw8qFL84R4uSmJ0
         CCoGuli9Y4E54xci0WUW1j8pwIAKFEpagfXcyHwBNgE6tpea4r77f+xGLJZvPKIzW5K9
         GyyZHwxNoGBH82ejOE3RTMhqRe5zWzxSruokyj2Ya8fBNps4QaYivbG3LlKb32WAC8rs
         pv84Htq1sLRtwipqWNCypKKgvjNua6aMGI7dQOPv/wsIRcCR5mk1MeeQToNuESXZNspJ
         h2jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=clEWcOMw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cw20si2844458ejb.189.2019.08.16.05.02.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 05:02:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=clEWcOMw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyawP-0002fz-PR
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 08:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53662)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1hyavx-0002f4-2U
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 08:02:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hyavv-0003GD-IW
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 08:02:16 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:44838)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hyavv-0003F8-CT
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 08:02:15 -0400
Received: by mail-oi1-x241.google.com with SMTP id k22so4582806oiw.11
 for <qemu-arm@nongnu.org>; Fri, 16 Aug 2019 05:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mTlvEQlwQxD+m3KCNTaQoPeyNkMz5awwGRbjpwvjjP4=;
 b=clEWcOMwE8ig/swEBxhVv+eYRtLzVRYzOdNAT4xBz1bX72Ll6PNcMUKCk6v0uVvLrx
 gbPx/m8UOIXYiXCZbrLpf9UIGtcyFWe7DpeZw9T7/T8Ukh1ODM3ao3EOPf2kOk0uuVjQ
 bUZeznpOmQhe1FUF+okF/+PPmA8KUpDPhIhiJ7wBKTtPULvEjTz4+xf/Fli6y5ADfXjz
 wAtUkjimkuWh5hiC4Rnby+nHeZvZAls0ZUvR8nPjlmWmUtVuBOh2dpRg3fJCFwuHmrRL
 UX+oNlk9YxiwIXoNhIrGB+3JVYzEm4z+G8k4kxE8nzAserwn7lO+4r8E+ID6L6GcAsSq
 0SZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mTlvEQlwQxD+m3KCNTaQoPeyNkMz5awwGRbjpwvjjP4=;
 b=f9CcqDVpr1ETg6SgX17yLVTQFA6WtHtPBo+yZVqN/aLNKo3rQKYEW8epvbdC/s98AK
 xgQwvqH8v+n4oQFwauTiuWUVEHXo0ITkmaQ7msz2oChHuTeIP0peN6x2ReQEjG0kzgnX
 sydDdCSwfu74yZkbPPw5/XqAcugFOX0MN3G2DzaLR9aeVvZUBOg5ow2ZiHEMxzqVdsT9
 SIP/YgXIbAKCfn1bYpl0K15AKiyjGYUuqhINNjaLU4bnwTBQgwsq1lQjZn6Tcp9ezdy2
 qAf+JdsU793nAcidhhEmnXRYmzPh/sHNt1VkpJdsGXjt7kV7pFTt+881I57YC+fpO850
 Hl9w==
X-Gm-Message-State: APjAAAUrq5lckEyySRGIHqBxigzMIWVMKjZsVuJ6n0G4mRyarMqZiua4
 yPqlYRXUct6wd02ddT0RnbBCa03MK3120Uh92BSHqg==
X-Received: by 2002:aca:6185:: with SMTP id v127mr4861732oib.163.1565956934256; 
 Fri, 16 Aug 2019 05:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <a7d6eede-b152-4c06-8945-9607c663b99c@redhat.com> <1565955445398.83897@bt.com>
In-Reply-To: <1565955445398.83897@bt.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Aug 2019 13:02:03 +0100
Message-ID: <CAFEAcA-nihW1nuMOL-XCR_QxUXSXji=noe4eDNPHxkib4-_a6A@mail.gmail.com>
To: tony.nguyen@bt.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 00/42] Invert Endian bit in
 SPARCv9 MMU TTE
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
Cc: KONRAD Frederic <frederic.konrad@adacore.com>,
 Alberto Garcia <berto@igalia.com>, Qemu-block <qemu-block@nongnu.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Laszlo Ersek <lersek@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>,
 Eduardo Habkost <ehabkost@redhat.com>, Beniamino Galvani <b.galvani@gmail.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, claudio.fontana@suse.com,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 sundeep subbaraya <sundeep.lkml@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Igor Mammedov <imammedo@redhat.com>, Fam Zheng <fam@euphon.net>,
 David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@sifive.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 Magnus Damm <magnus.damm@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Corey Minyard <minyard@acm.org>,
 Stefan Weil <sw@weilnetz.de>, Yuval Shaia <yuval.shaia@oracle.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Stafford Horne <shorne@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, Aurelien Jarno <aurelien@aurel32.net>,
 Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Anthony Green <green@moxielogic.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Rob Herring <robh@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>, andrzej zaborowski <balrogg@gmail.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, Max Reitz <mreitz@redhat.com>,
 Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Jiri Slaby <jslaby@suse.cz>,
 Marek Vasut <marex@denx.de>, Jia Liu <proljc@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Paul Durrant <paul.durrant@citrix.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Thomas Huth <huth@tuxfamily.org>, Jean-Christophe DUBOIS <jcd@tribudubois.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LAJhJ4i38s0L

On Fri, 16 Aug 2019 at 12:37, <tony.nguyen@bt.com> wrote:
>
> Hi Phillippe,
>
> On 8/16/19 7:58 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >On 8/16/19 8:28 AM, tony.nguyen@bt.com wrote:
> >> For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
> >> targets from the set of target/hw/*/device.o.
> >>
> >> If the set of targets are all little or all big endian, re-declare
> >> the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
> >> respectively.
> >
> >If only little endian targets use a device, that doesn't mean the device
> >is designed in little endian...
> >
> >Then if a big endian target plan to use this device, it will require
> >more work and you might have introduced regressions...
> >
> >I'm not sure this is a safe move.
> >
> >> This *naive* deduction may result in genuinely native endian devices
> >> being incorrectly declared as little or big endian, but should not
> >> introduce regressions for current targets.
> >
>
> Roger. Evidently too naive. TBH, most devices I've never heard of...

OTOH it's worth noting that it's quite likely that most of
the implementations of these DEVICE_NATIVE_ENDIAN devices
picked it in an equally naive way, by just copying some other
device's code...

thanks
-- PMM
