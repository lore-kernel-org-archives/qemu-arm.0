Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp225864lfb;
        Thu, 22 Apr 2021 03:29:18 -0700 (PDT)
X-Received: by 2002:a17:906:a44b:: with SMTP id cb11mr2764593ejb.518.1619087358790;
        Thu, 22 Apr 2021 03:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619087358; cv=none;
        d=google.com; s=arc-20160816;
        b=pKUQnl4cI6MEUaZz/P62VC8B8Kwd1AiKoItEDyrEB9Bj04LI7OVBj1UrVIEmNERIML
         tp9Vyz2OQJnUdd41kWDzsKJVTe3QRYf2+fc0IIFHe7ggrGrfUUu2XamJfsZ0bxgOOpAM
         q3rvOgnQ+rYibM/QfoVzL/w1dhl8njrBeYAZE3QXCy64dM8V77EMQnCBDNEO+TUF/3i/
         mn6Dfzk8ntNBNgCC2e0LjflfemUPNIs+2rPkmh4XBS/jTp8BUgDelCyT+t4YRirlH4Pw
         IdL7aD/XR3+bROR6PXZUXVx8cru/GpbPYs6PZAZQwGe8E0cDESIKLRFJT/kWjkAiGduz
         0S6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UHxPjnxttbob6OxFrZEVS4alJOCFPczXFHQ62igP+RI=;
        b=x2piskguUGPMY04gaXpUeSbgX9mhCY4SPdES8P95wZ4lcywlvmdQbctEgA6eZIWgp9
         oNHHecaro+0y2dBbRM+jhCmBJxIxoA4rAZ0TrlCLxravVdUs75wUmNZzbnt8aspa6cEd
         I4eRyOneIush5SKL0Yiwpzsjm33zyR9YpdWYmaqfg3L0Xc/cVEtl2BFsB9YOH+LsHRM5
         maROJQyr+kyioaGfJD7aB6V/BjF+/Em3rThT1HenyeChLvId3XBBRkLHelA1rvgg21nf
         1jdg8fxf7ZjZSRhZY15s+dX2jFflCLKc9lqDnMDFj6T4EhaFuomVkaQcMu5VPOoCgJmB
         DrMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SkaLH8d0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h3sor3190084ejd.71.2021.04.22.03.29.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 22 Apr 2021 03:29:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SkaLH8d0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UHxPjnxttbob6OxFrZEVS4alJOCFPczXFHQ62igP+RI=;
        b=SkaLH8d0N3mLQvGr7a0SX5+oV8SjCvZbFzepJYgekCPfAzupljT9J2XOnjgnOKCMTk
         HZ0Msg9cPpLQjgV7BrRajymUtLErpYVnsaPTOGggb93ytVTizcaa2pR+uxMe9qv42dsp
         O/E/v5v782ubmagqNI1qCnKXYFIUUYzFFAmWsHMACkMX9ZgRy7vQLsK1Cxaz9IqvvT2D
         6vAejzKisa+0sWN5yb1qDFteK95gngxYxk4j+fWgavZ13wm5S4K/ofBai42SQ66dzJWV
         X4RK+A3XAFPnBbAW3As0v+qoJe9HywLCufgucHmtLAzMBMZOrgwn/kFDYMgbHNSJpVem
         U6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UHxPjnxttbob6OxFrZEVS4alJOCFPczXFHQ62igP+RI=;
        b=bvWG8Rzeml1xABzP6kVwpgchiHo/7rn5ILjboAN4yhQKhA9B3KDmaiQx3zgO/ftigZ
         V8Z+PFF0rNO7efJ21PuFwXaC1NsPHcZmgS/4K5xPFsUwq1tnfMb3p6oCe3YPy2kQovI2
         AsU9OWd95OwnX09soNN5x8xvzXXZXmL81Juzo4mrnvhzhTOsVGvNrDL4WzK1WmNu0tFc
         uXJD4nWeEhaParWTy8FVzSFovKv+7Qi5jH8641XDkKEN7vHmOcDBidanRSaap4IRzvwG
         41GIjzE5nqLa9ADq1jETAii77fUkPFd8pFPI6JFomrFl2Iny6QBVIDFd9W72szWzk75e
         hstg==
X-Gm-Message-State: AOAM530NxST2cMeFbpdODBPnc9GoOCEiMa2I2yM9f0F9B5gu+gDVtLeR
	9xigj2osV3lbH2u8oX2WCEIef72L0sMKVKLmT0iTFJIs
X-Google-Smtp-Source: ABdhPJyZ+mWndWINDeyUfVpYBZWtrdmN+lXk8txlk+n5SoVcAQaEyP5O1zB79SqKqK9tJjQTGYM+zhc5itDhOcJJef4=
X-Received: by 2002:a50:fb0a:: with SMTP id d10mr3012452edq.146.1619087358385;
 Thu, 22 Apr 2021 03:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210302145818.1161461-1-f4bug@amsat.org> <20210302145818.1161461-2-f4bug@amsat.org>
 <20210421220333.bkxo6zriqe6w3rim@habkost.net> <cccb8e5c-55cb-3f46-1391-ca96ab7c27ce@amsat.org>
In-Reply-To: <cccb8e5c-55cb-3f46-1391-ca96ab7c27ce@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Apr 2021 11:28:23 +0100
Message-ID: <CAFEAcA8_cjzAzoA9BFucR7LzQA7KXnrmufH4kp7aNL9bo_5Q5A@mail.gmail.com>
Subject: Re: [PATCH v3 01/27] target: Set CPUClass::vmsd instead of DeviceClass::vmsd
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, Sarah Harris <S.E.Harris@kent.ac.uk>, 
	Chris Wulff <crwulff@gmail.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Taylor Simpson <tsimpson@quicinc.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, 
	Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>, 
	qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Cornelia Huck <cohuck@redhat.com>, 
	Laurent Vivier <laurent@vivier.eu>, Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: f6QHf8GCmuOb

On Thu, 22 Apr 2021 at 10:55, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> My guess is CPUState is the only device used in user emulation,
> so it would be a way to restrict the vmstate_dummy to CPU and
> not to any DeviceState?
>
> But looking at the introductory commit:
>
> commit b170fce3dd06372f7bfec9a780ebcb1fce6d57e4
> Author: Andreas F=C3=A4rber <afaerber@suse.de>
> Date:   Sun Jan 20 20:23:22 2013 +0100
>
>     cpu: Register VMStateDescription through CPUState
>
>     In comparison to DeviceClass::vmsd, CPU VMState is split in two,
>     "cpu_common" and "cpu", and uses cpu_index as instance_id instead of =
-1.
>     Therefore add a CPU-specific CPUClass::vmsd field.
>
>     Unlike the legacy CPUArchState registration, rather register CPUState=
.
>
> Juan, do you remember?

Oh yes, I remember this. There are two ways to handle migration for
a CPU object:

 (1) like any other device, so it has a dc->vmsd that covers
migration for the whole object. As usual for objects that are a
subclass of a parent that has state, the first entry in the
VMStateDescription field list is VMSTATE_CPU(), which migrates
the cpu_common fields, followed by whatever the CPU's own migration
fields are.
 (2) a backwards-compatible mechanism for CPUs that were
originally migrated using manual "write fields to the migration
stream structures". The on-the-wire migration format
for those is based on the 'env' pointer (which isn't a QOM object),
and the cpu_common part of the migration data is elsewhere.

cpu_exec_realizefn() handles both possibilities:
 * for type 1, dc->vmsd is set and cc->vmsd is not,
   so cpu_exec_realizefn() does nothing, and the standard
   "register dc->vmsd for a device" code does everything needed
 * for type 2, dc->vmsd is NULL and so we register the vmstate_cpu_common
   directly to handle the cpu-common fields, and the cc->vmsd to handle
   the per-CPU stuff

You can't change a CPU from one type to the other without breaking
migration compatibility, which is why some guest architectures
are stuck on the cc->vmsd form. New targets should use dc->vmsd.

thanks
-- PMM
