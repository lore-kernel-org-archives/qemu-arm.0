Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2864441lff;
        Sun, 12 Jan 2020 01:47:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqyXyuldUpAXYIaRbVw0qyzblZz14wN805eKjgf3HyPnB7pVN67RG88KlXDqy39ZgLH1oP3h
X-Received: by 2002:aca:cf50:: with SMTP id f77mr9125578oig.60.1578822459393;
        Sun, 12 Jan 2020 01:47:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578822459; cv=none;
        d=google.com; s=arc-20160816;
        b=weVsbPPNwIAlpVNqx39aSbEnA21NBTy2tBJ2jcmWRRGijSwkqaHbgGyStq18CDqCFQ
         soQuZcnzQoxbrUeygMnih3Dyrctk808nS0i5OeBLhdlzQkBjTHTKsARGfLL4h5dhQF4S
         pIeqvpR203FiwCfOqnPB02LWPGA+I83yFw0xh6r2s5dXPKnCO1/4l7cAu/I6DsG0yhQt
         8m9/Juo6SteK46gzh9RmOffQMxwnCm931Z32pGSBhjP3KfB3mRIAiv57DgTtp32mfxTP
         6HTORstbWAD3qvsl1ZtIfGROBmmV/j0ZQv5aFhaI2VB8bdbPeVsZtPBGJrJW0qXN8Vn4
         HJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=RDLnJ4qJFqQy+U2F1GzxeKsnp0OT/5UfLwjGUAO8yps=;
        b=DGh9GpqRmiP7Fj6/Usn+pfVqN6efYBGV2ac1a/NuUaUm3+qxouBcf840Ovq+OqzJjC
         smdLmJtoATvoOtt8X95MapJwbEKQ71ahgAQuV780G99nGQ/y7x9xU7DBnrGDOyb+04SM
         +vh1+Ktx9pnJ5zWgoAVVpiPf26pGg7unqmdEdXO2FyZjBO+gweChqP+kSBILP70GaVAi
         OfNm258aktdkFMahYjE7DN8tFlZKA53w7R7wi71OYpkyLdGQF7pQmOu2QvA6RfBUAZ8j
         ufkX+f25PygrVDlCl5z3Sqp+ahldeOnKlsnAPrBypouOEdCLl5GHtzc0JS9+rWJHwxAi
         jHEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mngArEu9;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id j5si4047692oii.114.2020.01.12.01.47.39;
        Sun, 12 Jan 2020 01:47:39 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mngArEu9;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732465AbgALJrf (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Sun, 12 Jan 2020 04:47:35 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43405 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732374AbgALJrf (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sun, 12 Jan 2020 04:47:35 -0500
Received: by mail-lj1-f195.google.com with SMTP id a13so6714878ljm.10
        for <kvm@vger.kernel.org>; Sun, 12 Jan 2020 01:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RDLnJ4qJFqQy+U2F1GzxeKsnp0OT/5UfLwjGUAO8yps=;
        b=mngArEu9hEfT+he2g+EY39i8voXyGMVQyKHnLGrN07fzeQ1oIjuJ/uT0rE67m9W0b5
         1B+ijvVUx/OhDdfb1W5aANqY0iG9CNXuRz5sR70kDZgbkmqHKEvaUX6gG7DOJe7HCqWk
         EPl5PVbwgppO8o6+HhV+afhC2eeefiQdrYMxKIubn0AMyt94q4JklFzFY6iBJLZim+q+
         lxQrbiWgNHaYT0sE8GOwUkn4je2IxgK4CHpN4LnMvnGDDZvsGKRwVruyume7Vt7D2r89
         Tj9Cg4v2YHHE1KOUEZv6+irkvJCrwZwUBUmMEhDodr++MSsyQSgwpySIIGmBs5M8ZBjE
         PtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RDLnJ4qJFqQy+U2F1GzxeKsnp0OT/5UfLwjGUAO8yps=;
        b=ekEJe0kDsnTPJoJ50Wr6oMcdZnvTPeHpKKhUPEhfr3NW5wsyQf5O5m0p8O28pW7abC
         UzIDPfsMzO+jwIdyhUFoGE4qsai7buIZWzh6CQN+yUy9xi94bkZzE9mAhu/SSSGJfV+1
         bodn/bEmXOffo0ybIoqtOlAiSj4nPSVifFhTIp1fiNTGLLbS/mgPtx4zs6IAjrWR4tYj
         pqZxCuqcLVNJ3ccepEn8yWJjmgoIo1xzhK+mm4J66n2rcSI2HRkqBVGXXPz+qxkA50Y4
         Jr9kmhi7SyfAMiO/kyZHGo22rkhcWSfgp0ZjFk+FBxxgzsnCzzLjNAjnoe6cUkUGaQqS
         YkDg==
X-Gm-Message-State: APjAAAVBABEG5Id9B11DoWdq5A6qmEwRf96sF4nQg/1reEQFxc1G0sOd
        qfb7hdj+PyP2x+4Y0fTov5SJ9YkusJ2nYV0LfcY=
X-Received: by 2002:a2e:9a51:: with SMTP id k17mr7529135ljj.206.1578822453192;
 Sun, 12 Jan 2020 01:47:33 -0800 (PST)
MIME-Version: 1.0
References: <20200109152133.23649-1-philmd@redhat.com> <20200109152133.23649-9-philmd@redhat.com>
In-Reply-To: <20200109152133.23649-9-philmd@redhat.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Sun, 12 Jan 2020 17:47:04 +0800
Message-ID: <CAKmqyKMbgEhs8teVezJRYRidC4oQ-Ucq7_PXqcf9nj0taxBPdA@mail.gmail.com>
Subject: Re: [PATCH 08/15] target/arm/monitor: Replace current_machine by qdev_get_machine()
To:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc:     "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        Eduardo Habkost <ehabkost@redhat.com>,
        "open list:Overall" <kvm@vger.kernel.org>,
        Juan Quintela <quintela@redhat.com>,
        "open list:New World" <qemu-ppc@nongnu.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        Alistair Francis <alistair.francis@wdc.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: rZ2FiJ9zOR5Z

On Thu, Jan 9, 2020 at 11:23 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> As we want to remove the global current_machine,
> replace 'current_machine' by MACHINE(qdev_get_machine()).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/arm/monitor.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> index fa054f8a36..bcbf69802d 100644
> --- a/target/arm/monitor.c
> +++ b/target/arm/monitor.c
> @@ -136,7 +136,8 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(=
CpuModelExpansionType type,
>      }
>
>      if (kvm_enabled()) {
> -        const char *cpu_type =3D current_machine->cpu_type;
> +        MachineState *ms =3D MACHINE(qdev_get_machine());
> +        const char *cpu_type =3D ms->cpu_type;
>          int len =3D strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
>          bool supported =3D false;
>
> --
> 2.21.1
>
>
