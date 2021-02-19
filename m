Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8955120lfc;
        Fri, 19 Feb 2021 03:56:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcWOqt71oVgXDRsvzHXyaekVtTFJMsciJD7T88MllkrD9V2yVzNjhdzOdcl2m4AOk0BBtC
X-Received: by 2002:a25:b74c:: with SMTP id e12mr14536290ybm.20.1613735780427;
        Fri, 19 Feb 2021 03:56:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613735780; cv=none;
        d=google.com; s=arc-20160816;
        b=cNC8qV/zOcH3iRs/lZCAjh5N9epEjurCPH/Yaf8The+ANWH/H6Kgm6skrcN8/BuZwY
         CyFj7Xnzhe4uVfpJIBcPgx6yLJka+96A6TZuQ+lul2nDvS6cnKWTRbts0UXG6BI01H04
         V6aXWMX28nzbhgt4A0sa2ybGGLwQ6q08bKzQp2np+bMsw9mr48Kfkw49RIH1+DyCLeNq
         R2Kxqyrd+rvY/ZTQ2PVLJQYrSMGLJOK97FdH4oo0CtOTbDYDd4iTGFalzupoA4GY1nSi
         O4xdbtdIPa7lgLNOjNkuCH4/r0scy/XGAn6+TkyB2G1QsMx51BqZAIFyR00KYTQ3bVVi
         ubwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=RCReoUqVm5VrIgFdBYFHKJpOABQVppR771o1a5NHp3Q=;
        b=vDR0azw4DCWFPOCQLmdonXymPbsjXhbLvuuMbhJDh7T+MO9pCoDZGjJsWZGBQPSnTx
         lm6ZuTziRk2pFW7GAMTy2n3sloADMF7NNbxcnLk+380igUtAOCVK/XbXCRm4ooxzAcKw
         JhHeSKSuBUzj4erfBjoay6iF3YKUuGo0iVAPedZEgnny/LXRfDaJxtkZVzR90UKbiowD
         UrCdMJd7f/mMczfvaOX7LmKlphfBGc58J9sHk5soao77pECAGdSf8fU7LFk0ZWYk65Cc
         JKeWAD94fOqAZqvhNZ4qOFJDzqYWBgOTJu4l4hO2Nvwd5GwnuL1ebr4uEce/CpEE8aND
         H7gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kHxpJna0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17si8198512ybq.190.2021.02.19.03.56.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 03:56:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kHxpJna0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD4OR-0006dj-RT
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 06:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD4OJ-0006dF-99
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 06:56:11 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:43260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD4OH-0007In-05
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 06:56:11 -0500
Received: by mail-ej1-x629.google.com with SMTP id k13so10700395ejs.10
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 03:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RCReoUqVm5VrIgFdBYFHKJpOABQVppR771o1a5NHp3Q=;
 b=kHxpJna0WvF58KRzQ5LVezQqDSSRhYFCs3R6UJBRT/lnCHOijMmxgTr+ixjrGlUkll
 szoQSEibrREs9z3uKY1Cs6Bqmvgmh3wezUHb855L6UUMcWQaGbO3nIX+nuPUMWutzoue
 ldW+OYxruT3+nGWoHMbpZxPnJqt4i0sMnhARPUwsHutuXB/JJrDxUOc4ILfCXOWS2whN
 tX2sD61BzJ3GXUCXE8jaG/3v3H6V/4KSz0qUIMlM6nmjMWWGK2Ytrrn7zaTS0QHNGoSw
 FuGMcs1P/7o2ne313C3mHEfx5Cmuz4Y6GUV95tW3a5/OvYlRvrcSwu0dXYmeR0oCJXmC
 RT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RCReoUqVm5VrIgFdBYFHKJpOABQVppR771o1a5NHp3Q=;
 b=ai359jkIOrDmd6GQj3a50LFtt7rL+7I/0KbEjbdgg0Afc8nU3VTsNEO2aZPRv4tvzE
 fA34lGO13bLHzIIc2Djb9tpsK+H5dzqQBXIvSDiA7VdA9IGxO3ZXeud8seQARYvk0Uiv
 cKV+TCB+Yp6foQ404cMVovvz2GH5ED0Dry/F4RdED27v4SWcHqqWt/vcHON3ynIdvjjK
 QBAnBJxoCnkjG497l7APUvaUBPxxmuD6irMTZQ+n5ppb2dwAm3lCZR9ZaIHAqvA1By9u
 cS4pxQdWtscm/fmhkhKAylZ718IFKGC/gxKBp3LeKTE3Icy3dHOwDkArec9QLo1FcFbi
 ZHzA==
X-Gm-Message-State: AOAM532RyX0gGgubA+N313EiXbCVCAb+9ozEAQFuRnefdQGeLkq46Tqe
 RDnDMbiMwj9XdZQLE1idW5uDVk97820irVsY8BnZpA==
X-Received: by 2002:a17:906:5357:: with SMTP id
 j23mr8276999ejo.407.1613735767468; 
 Fri, 19 Feb 2021 03:56:07 -0800 (PST)
MIME-Version: 1.0
References: <20210219114428.1936109-1-philmd@redhat.com>
In-Reply-To: <20210219114428.1936109-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 11:55:56 +0000
Message-ID: <CAFEAcA_66DuWfrftpaodqBZwBhS-VOD9uH=KwvGYC_VcksVFAA@mail.gmail.com>
Subject: Re: [PATCH 0/7] hw/kvm: Exit gracefully when KVM is not supported
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Radoslaw Biernacki <rad@semihalf.com>, kvm-devel <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j3KRivpUofUg

On Fri, 19 Feb 2021 at 11:44, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> This series aims to improve user experience by providing
> a better error message when the user tries to enable KVM
> on machines not supporting it.

Thanks for having a look at this; fixing the ugly assertion
failure if you try to enable KVM for the raspi boards has
been vaguely on my todo list but never made it up to the top...

> Philippe Mathieu-Daud=C3=A9 (7):
>   accel/kvm: Check MachineClass kvm_type() return value
>   hw/boards: Introduce 'kvm_supported' field to MachineClass
>   hw/arm: Set kvm_supported for KVM-compatible machines
>   hw/mips: Set kvm_supported for KVM-compatible machines
>   hw/ppc: Set kvm_supported for KVM-compatible machines
>   hw/s390x: Set kvm_supported to s390-ccw-virtio machines
>   accel/kvm: Exit gracefully when KVM is not supported

Don't we also need to set kvm_supported for the relevant
machine types in hw/i386 ?

thanks
-- PMM
