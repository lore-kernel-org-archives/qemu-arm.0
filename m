Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp614523lfu;
        Wed, 6 Apr 2022 04:14:48 -0700 (PDT)
X-Received: by 2002:a81:1558:0:b0:2eb:66b7:f1d9 with SMTP id 85-20020a811558000000b002eb66b7f1d9mr6276751ywv.113.1649243688166;
        Wed, 06 Apr 2022 04:14:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649243688; cv=none;
        d=google.com; s=arc-20160816;
        b=WqqKJxhy1oQMuK06ecdZJGBnVg2Bvl0c/QV9/ZFluE/uAa9kChDJ8mIOORK9mczTWh
         dlQOWBwL8uxsLhPxktBnrLEU/Qtjwf5b3x6U6q/vsCk84G4iDOOkkCVQZz87cQdjTpWU
         0fVGc11GiLzsipvAjk1BFPMdKuL5jubV04GZkNbHwFQ15GoecQFYIughsobHpdVzHmsB
         yRnSScNbo9+M5wSqNcK3gj4GatM9scj9YYGrvdhdqkgNIaVcLAIz3vZ2yaVbv9yAW5kb
         2hW5796ZgFrcMrwIjroTAO5/h0HerwpO924kVExIO9mj8nHsARvkf/kXzm1djS4vx65+
         HHGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MkKxjYAV/v0VMd11SMXqG8EhXPeJQ34GzLrs6aLHBhk=;
        b=yF+x5vIPV1qhNL0s2K4333V6DeVC/OTEgVQPy9Rxhn0es1l+BCYFA5tj1gIb780knl
         wxhvy0zivWiqMf72bBBJU9fX8Xktbc8Q4J5espIvo1R5mCQ3VVpCMbN3oeydPiyJB48r
         /haH8/LfenYLxeITSz9PIPbYQ1LZlczHadf611e5FeeK7ArVY7jeBkmhalwSK9uG6Ivv
         A9aHotc0FmNTzQDeMBpxMopBps/kUxge9L+C5VTmOkk44gc3dE6VIHbk0Cr0LOqplZY8
         NHy/BJ9O8QVLAM2ZgEUR0bbJCs/dTUv8Ws35B9I7hDVXiCWTcweb29gGhJWw1WpR5h3Y
         vczg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BnkL/xvi";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h66-20020a813a45000000b002e69315f174sor4799527ywa.69.2022.04.06.04.14.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 06 Apr 2022 04:14:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BnkL/xvi";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MkKxjYAV/v0VMd11SMXqG8EhXPeJQ34GzLrs6aLHBhk=;
        b=BnkL/xviW3/SATQQBN0J4jLUdrTQRMmZsVp7lEWCOmkmWwekK4I3vVJpW5wY+oaW6o
         wMWw7poztVXO8dmLd+4dn47QCBX/MLXDvtQ0FtncjF48Ky/apTe5LetGClF9I8xv8hLd
         39QIq1nCVrCyq+b89tHhY+wy8NDABlDcruy0U3VUH+wy5CC/74PQNoqlWZUGpPI4ktd2
         2syhOC3nTsaeBG0iofZAEy+fKLdo2YsKyo/Wo++rIt2NrTU9fzPbBH0Ng8KlfS5PTmtk
         EZZmtp49FjP3cappOUQR7sHOielNZL7XjaQF+GBy228W5SABlrjalbp+fGs0YWTIyb9y
         NQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MkKxjYAV/v0VMd11SMXqG8EhXPeJQ34GzLrs6aLHBhk=;
        b=LdjUEhMeKh5xgk7H4TZegCFUmKeWqLkg8e2CwlDrONtt99QWwImAw4pCM4oTTsuMbD
         9fBWt2NGN+3m85/6NVRFyBL8A7O0JsSkpSQtVoiz61DBLh6CTwhHMpqxcXz5WHGTpJoU
         OC2mMqJx5/f+ucEjP5F6hM5J7CZlzrTFyKgFMl7Hox63yGWJhr3DrLlwwJ2GMU60JbkI
         6OerTNVxL1rmQHOJXzu+FZ7O/q7o5MWoT5A57a7G7xgH0blJySOSoM+yi04V8q+ylNlR
         KZkLD0svtHJ9OrEukto0wUXZxW6hkHhjFrBXOEjj4cmwaUNo9/MteshPxOfRXXO5bNNn
         FZig==
X-Gm-Message-State: AOAM531i6gnEXvnbjZwqBU1sZTo7cW5BC7TghdSx1QzWL0PUvWPBWudn
	BD6ctKrUZyivSIJHab+fIAYoLykc6shZGeWDETlLbD7M
X-Google-Smtp-Source: ABdhPJytWaKSjrcKoa2mbzwJv7RhwFSgw11lPqUjgtEaNT3OmaJMCRA7mDMdyjLwii6p/gHggvStzLZXxV0l/YkXcmI=
X-Received: by 2002:a81:1592:0:b0:2eb:5472:c681 with SMTP id
 140-20020a811592000000b002eb5472c681mr6491648ywv.10.1649243687745; Wed, 06
 Apr 2022 04:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-33-marcandre.lureau@redhat.com> <CAARzgwzXXKqhvP9CnST3iD_obfqCWn8Z+8WNcs0u-O_UGoM1-w@mail.gmail.com>
 <87o81epk1s.fsf@pond.sub.org>
In-Reply-To: <87o81epk1s.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Apr 2022 12:14:36 +0100
Message-ID: <CAFEAcA9kYweS2zMHjWDuV_y2AxKbgJ5UYNHLK3sASCLVD=yEqg@mail.gmail.com>
Subject: Re: [PATCH 32/32] Remove qemu-common.h include from most units
To: Markus Armbruster <armbru@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, marcandre.lureau@redhat.com, 
	Aarushi Mehta <mehta.aaru20@gmail.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Alexander Bulekov <alxndr@bu.edu>, Alexander Graf <agraf@csgraf.de>, Alexey Kardashevskiy <aik@ozlabs.ru>, 
	Alistair Francis <alistair.francis@wdc.com>, Andrew Jeffery <andrew@aj.id.au>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	BALATON Zoltan <balaton@eik.bme.hu>, Bandan Das <bsd@redhat.com>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Bin Meng <bin.meng@windriver.com>, 
	Cameron Esfahani <dirty@apple.com>, Chris Wulff <crwulff@gmail.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>, 
	Colin Xu <colin.xu@intel.com>, Corey Minyard <minyard@acm.org>, Cornelia Huck <cohuck@redhat.com>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Darren Kenny <darren.kenny@oracle.com>, David Gibson <david@gibson.dropbear.id.au>, 
	David Hildenbrand <david@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
	Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>, 
	Fabien Chouteau <chouteau@adacore.com>, Fam Zheng <fam@euphon.net>, Gerd Hoffmann <kraxel@redhat.com>, 
	Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>, Hanna Reitz <hreitz@redhat.com>, 
	Havard Skinnemoen <hskinnemoen@google.com>, Helge Deller <deller@gmx.de>, 
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Igor Mammedov <imammedo@redhat.com>, 
	Jagannathan Raman <jag.raman@oracle.com>, Jason Wang <jasowang@redhat.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Joel Stanley <joel@jms.id.au>, 
	John G Johnson <john.g.johnson@oracle.com>, John Snow <jsnow@redhat.com>, 
	Julia Suvorova <jusual@redhat.com>, KONRAD Frederic <frederic.konrad@adacore.com>, 
	Kamil Rytarowski <kamil@netbsd.org>, Kevin Wolf <kwolf@redhat.com>, Kyle Evans <kevans@freebsd.org>, 
	Laurent Vivier <Laurent@vivier.eu>, Li Zhijian <lizhijian@fujitsu.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Marcelo Tosatti <mtosatti@redhat.com>, 
	Marek Vasut <marex@denx.de>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Max Filippov <jcmvbkbc@gmail.com>, Michael Rolnik <mrolnik@gmail.com>, 
	Michael Roth <michael.roth@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Qiuhao Li <Qiuhao.Li@outlook.com>, Reinoud Zandijk <reinoud@netbsd.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Roman Bolshakov <r.bolshakov@yadro.com>, 
	Stefan Berger <stefanb@linux.vnet.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefan Weil <sw@weilnetz.de>, Stefano Garzarella <sgarzare@redhat.com>, 
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, Sunil Muthuswamy <sunilmut@microsoft.com>, 
	Taylor Simpson <tsimpson@quicinc.com>, Thomas Huth <huth@tuxfamily.org>, 
	Tyrone Ting <kfting@nuvoton.com>, Warner Losh <imp@bsdimp.com>, 
	Wenchao Wang <wenchao.wang@intel.com>, Yanan Wang <wangyanan55@huawei.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Zhang Chen <chen.zhang@intel.com>, 
	"open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>, "open list:Overall KVM CPUs" <kvm@vger.kernel.org>, 
	"open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, "open list:S390-ccw boot" <qemu-s390x@nongnu.org>, 
	"open list:X86 HAXM CPUs" <haxm-team@intel.com>, "open list:raw" <qemu-block@nongnu.org>, 
	"open list:sPAPR (pseries)" <qemu-ppc@nongnu.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: CH9S+4CEIdTp

On Wed, 6 Apr 2022 at 11:45, Markus Armbruster <armbru@redhat.com> wrote:
>
> First of all: thank you so much for completing the "empty out
> qemu-common.h" job!
>
> This is what's left:
>
>     #ifndef QEMU_COMMON_H
>     #define QEMU_COMMON_H
>
>     /* Copyright string for -version arguments, About dialogs, etc */
>     #define QEMU_COPYRIGHT "Copyright (c) 2003-2022 " \
>         "Fabrice Bellard and the QEMU Project developers"
>
>     /* Bug reporting information for --help arguments, About dialogs, etc */
>     #define QEMU_HELP_BOTTOM \
>         "See <https://qemu.org/contribute/report-a-bug> for how to report bugs.\n" \
>         "More information on the QEMU project at <https://qemu.org>."
>
>     #endif




> Rename the header?  Or replace the macros by variables, and move their
> declarations elsewhere?  Not demands; this series is lovely progress as
> is.

We should put those in a qemu/copyright.h, I think.
Leaving a "qemu-common.h" around is an open invitation to people
throwing more random stuff into it again in future.

As you say, we can totally do this as a later followup.

thanks
-- PMM
