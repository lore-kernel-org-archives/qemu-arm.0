Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2681322lfy;
        Thu, 30 Jul 2020 08:47:42 -0700 (PDT)
X-Received: by 2002:a05:6830:1e26:: with SMTP id t6mr2721761otr.342.1596124061893;
        Thu, 30 Jul 2020 08:47:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596124061; cv=none;
        d=google.com; s=arc-20160816;
        b=QaNgmkqIQrLpCp2StMtCP9YrVfYZdOdi5Yf1CzIw0iWnHVJo+c9qXoq24CphU0+7yQ
         OWeyw115gJpWviQkdCtGLnBm2QasbAMqSC9VehXmPmorHEDRMvwKzO6jgYd/W6V5USJF
         BwWUFhIej5gwK3BxeISCAB/KWbbF6HNoxWxoKYiNx16hjgGqkI4CU2nkSEICyWlDhsoW
         ha9H0vT0XBbdTHa8pQJlQ2DnWMe3hFUxjP9ulCOy/t5IU+zR8ikwxZEpIZNUnRw4RToq
         kfqblp09cTjvxP9N8cGkB1wVSF+M4OOPWkGnghoHBnkZxxhGBvzs03Ic3KY5ZnNEnQ3D
         +5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7BTKY0AOu7kkJmSYmdz0BsUTmdAuROH9BExYArF4J/4=;
        b=J0N2exrym31c5vIEwWaaV0V6xtQzWHLfDnwhaqrAfowuzo/M0+FNO8yaH5FHy/ibNk
         sAis6PIdkeOU774wLV5VRe3CPT14DqbI/clZaDLzHxHjDUoNcxcje1+Rs2Dt/c37KX5p
         rA2vozjDCgSH+PB3Fvdsem5BjkEgWSsUqWndUo68joNd1s5u2nySjCJttpgxm38PsfZz
         Jct/ru0cir0/4SX8VZq6Jxa4/AcjHlGc9mxOEX4UhadHh+Rz7YJalDoM2qN33sW/Kjsb
         0NaZdpBwMsbNh1Vyr2CszXB8EsbRasKJ3s+IjcYTF82NSvfqV29MRQPHEOIS3mvEsJR4
         tjGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nkbJACjE;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w4sor3624419otk.124.2020.07.30.08.47.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Jul 2020 08:47:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nkbJACjE;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7BTKY0AOu7kkJmSYmdz0BsUTmdAuROH9BExYArF4J/4=;
        b=nkbJACjEV6jl3bVdssD5VqWitK4ZYtnf2OAcvzrKwiVQz8y9z/cBnawdco0LEtWeAp
         fuOggHzAs8QbNdBNoK5ddpG5OQ9BVa633EllrCNxwaMiJjQAiO8lS06c+bKQu6zaFY3a
         nwk/5Ez/0/wLo52EQCvaD3BrFxXMdBYawa8Buw5PTbbIXX/IkzfUDgbFZlyPD7G6QX+N
         UCc7/B4/N2E+vs1k4zhOTJzwQ+GmysFPdPKkYtXKVRF7InP6EMx64xrtvOHhKQJ7cbad
         CcZqbjeaJxjkusAekKyxumYzTXHuxtbp9u7NYShP94pus/XFhjtEd/jDDoH+8XloPBMY
         1pOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7BTKY0AOu7kkJmSYmdz0BsUTmdAuROH9BExYArF4J/4=;
        b=e6T65joOAPP2okeb9gyaSPqrCLYm+/bsXatafw+IZj8VLn+HMgbxQIiDzeE8N13ftj
         2BK6SycQ1QZc18hBuK4Ke+rWc72d177t5A+PwD64ucQtYjsJFgGULGwE+sK+rTwJ6rfQ
         I1Kj6G4prCgb+AtACb8uiDUR5u0VUf5qeLBuEC5K+aScQEjQ+KWVWauJOAV8j/EI1iDB
         N87iosDqB4W/rqJWZkuxvSjmr4x3PaC5UGDUVOHG6Q3AsgvuNg9PEkh6FvHBKtz3HUVW
         NHL90C7tGwHIh8z554Ox0UK8rKOve/Df0SjIP/bPuWSr+F1fKRQN9e1OnAnWhK3hlFPF
         lWNQ==
X-Gm-Message-State: AOAM533HCgd+4j12GlZBQRgFn2Izxmm6SZ8KaEqhVB9Vzmd0T7wq3xD5
	8uXebsqvH0A1pzJbs3yO8YikDfKK7zdoZqLZhVvBjfnx
X-Google-Smtp-Source: ABdhPJwgxlRXzswcF+FyuB1j4i1ZEdn7pxhjeADXDwCMay1PnLFrOeD8pcQnvru/3a5WYZHlmI1GINWEYQsOngGxSls=
X-Received: by 2002:a9d:39c2:: with SMTP id y60mr2799632otb.91.1596124061434;
 Thu, 30 Jul 2020 08:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
In-Reply-To: <20200723025657.644724-1-bauerman@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jul 2020 16:47:30 +0100
Message-ID: <CAFEAcA-VFaZiR58F-zDo6h_Q-U5gU1O3RDnOcuCnwnuqD_JFSg@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Generalize start-powered-off property from ARM
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: qemu-ppc <qemu-ppc@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	David Gibson <david@gibson.dropbear.id.au>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>, 
	Richard Henderson <rth@twiddle.net>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>, 
	Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Greg Kurz <groug@kaod.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: OkeJ7vCIXRw/

On Thu, 23 Jul 2020 at 03:57, Thiago Jung Bauermann
<bauerman@linux.ibm.com> wrote:
>
> The ARM code has a start-powered-off property in ARMCPU, which is a
> subclass of CPUState. This property causes arm_cpu_reset() to set
> CPUState::halted to 1, signalling that the CPU should start in a halted
> state. Other architectures also have code which aim to achieve the same
> effect, but without using a property.
>
> The ppc/spapr version has a bug where QEMU does a KVM_RUN on the vcpu
> before cs->halted is set to 1, causing the vcpu to run while it's still in
> an unitialized state (more details in patch 3).
>
> Peter Maydell mentioned the ARM start-powered-off property and
> Eduardo Habkost suggested making it generic, so this patch series does
> that, for all cases which I was able to find via grep in the code.

Acked-by: Peter Maydell <peter.maydell@linaro.org>
for the Arm bits if you want to take the bug-fixing parts of
this series in via some other tree. (I think they've all been
reviewed.)

thanks
-- PMM
