Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp33941wrd;
        Fri, 17 Aug 2018 03:15:51 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx9Wz+MHQ87aeBPEnpiOm5RDYh8oSLaklFnRQbXrlUVW1t4YVuatpXL4AEqNdP6/O7gVJB9
X-Received: by 2002:a37:c68d:: with SMTP id s13-v6mr31237870qkl.31.1534500950988;
        Fri, 17 Aug 2018 03:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534500950; cv=none;
        d=google.com; s=arc-20160816;
        b=e95eimBkpcrjpUVXxpbJcXabm70HNYrwWKG7nhE+YApZoqHMG8LTzLThXM3onfC5YD
         YQaILagcjJm+ajkblNaQGyV5IRSMtmoTvkbvfUlQTTUbV4XoYjp+1rYWvFsiMG///hsi
         152UEtyZAZo6U45otznwBRpbcPTedVnUxhieYKEx2ebOo4Bg3SNSBs+Ouh411lHy6Vyl
         X1PzeWQoYk5bCp+LGvlV+XoKg+X6YNgXUMgbPgSYm7R+NotYmy0jo3n1bf4zER9meVLk
         YOJ3nD8rsAESNYV8MGie/3tNCL+Sto590A+ylEk6QUMjM4iF0RE6aNeucROHAlZ21lze
         VMFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6xi49sD4vc2Z+Epv868hJoLuAHDAwXsHwh7nC6x6UKI=;
        b=pMzfNlsG7z25TYlg1QPMqR1t0AoN/V88wDX27p15UsOVuH/OkZglAO0PFi6AihcOT3
         7PeCmuP/eAL93Y7+UMsMz/k/yGlcaa874ZXdhIDlMap3ML7Uc+rvMb7Smozd995E1Lr/
         vfI/7kpsUtxCc7au4BKmHYH1hTlY1Ena7t490AEPS8ydy1bCy4icUMgBAUNRr5ulYqWC
         30V+QouuH574oyxgkQhO9B2VEEjQxX0tx2n97Wi9IIEkxH/STTlXWVxwOgpjhcJ/ycR3
         y/7xOP5ARC0Spslhj7UXb7rAlZP5Mv/UeK6SCv2a2ZnCN3SPszBQk+PuhnFdq20ujbFo
         XMOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XXuieYM5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q14-v6si1587996qvo.99.2018.08.17.03.15.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Aug 2018 03:15:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XXuieYM5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqbnK-000846-I6
	for alex.bennee@linaro.org; Fri, 17 Aug 2018 06:15:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqbnB-0007yE-2m
	for qemu-arm@nongnu.org; Fri, 17 Aug 2018 06:15:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqbnA-0002gK-8D
	for qemu-arm@nongnu.org; Fri, 17 Aug 2018 06:15:41 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:46118)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqbnA-0002fd-0o
	for qemu-arm@nongnu.org; Fri, 17 Aug 2018 06:15:40 -0400
Received: by mail-oi0-x242.google.com with SMTP id y207-v6so13090261oie.13
	for <qemu-arm@nongnu.org>; Fri, 17 Aug 2018 03:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6xi49sD4vc2Z+Epv868hJoLuAHDAwXsHwh7nC6x6UKI=;
	b=XXuieYM5oSXLmH/aNH2euYeEGRkwOR+Pc2C/GFCj1CW7mjpt4QGh6IjT/cxt8lCtDq
	44qSeFF6oPOSoF6LBpG46n6hmVoU406Fg5PFLvi0k6QLp9LWAnGQBwKIFU/6krCE07Yv
	O4nz8lFdzcKAH68H4GUWWUkpafviPH+eV5btg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6xi49sD4vc2Z+Epv868hJoLuAHDAwXsHwh7nC6x6UKI=;
	b=SvVaovFr/mlOGLzB0DxLFMqGzk4mGAuz2FpIsKruBp4BTj9nZzRYWmzgXqBJ9JCHL2
	JsYissZs+welqJxKoFljxuQb2jD8zs8G+/o252wKkZBKokPpF08kued8OrNq82t49kdz
	gCmGEBRC8A3MaJChU58vtXT5o667rEFCccOduVlccomvczos/yq52gwr1cHdUIHsYFkg
	yg/7lJlzIqh3seadc0+RDNCcxBJ3R245WW/ZPN9F9gS9wAfv33jEuk0x0r2ypMvQkDd2
	cVwPce7tzdGACW41bmj4TZM/zSl8yQPvmvgUihEw9P8ydfhX4vWZHRLyeGRQ56/OcSHW
	8jNw==
X-Gm-Message-State: AOUpUlFoUim6j1zgdn6E2wNQmsHiEKCdEA9Sy022BX7U3QRolx9JNsoA
	uf7CKKDrj78Q+Ty2cdEmzNu3KoBrPoBQf9rurur2f/bWWDhZ0g==
X-Received: by 2002:aca:506:: with SMTP id 6-v6mr1836881oif.23.1534500939254; 
	Fri, 17 Aug 2018 03:15:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Fri, 17 Aug 2018 03:15:18
	-0700 (PDT)
In-Reply-To: <20180814124254.5229-1-peter.maydell@linaro.org>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Aug 2018 11:15:18 +0100
Message-ID: <CAFEAcA99e2sO8dz3J42+BHO=AJDfx90z1GKGAOreNiWSo3KELw@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH 00/10] target/arm: Some pieces of support for
 32-bit Hyp mode
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Edgar Iglesias <edgari@xilinx.com>, Luc Michel <luc.michel@greensocs.com>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4FwEZjqafD0s

On 14 August 2018 at 13:42, Peter Maydell <peter.maydell@linaro.org> wrote:
> Now we have virtualization support in the GICv2 emulation,
> I thought I'd have a look at how much we were still missing
> for being able to enable EL2 support for AArch32.
> This set of patches fixes some minor missing pieces:
>  * various small bugs in cp15 registers or places where
>    we were missing the 32-bit version of a 64-bit register
>  * a bugfix for MSR/MRS (banked), which were not allowing
>    Hyp mode to access ELR_Hyp
>  * implementation of the ERET instruction for A32/T32
>  * support for taking exceptions to Hyp mode (the largest
>    of these missing bits)
>
> This isn't complete, but I thought I'd push these patches
> out for review. My test setup is that I have another
> couple of patches, one which fixes up hw/arm/boot.c to
> boot AArch32 kernels in Hyp mode if it exists, and one
> which sets ARM_FEATURE_EL2 on our A15 model. With those I
> can get an outer kernel to boot with KVM support and try
> to run an inner guest kernel. The inner kernel boots OK
> but gets random segfaults in its userspace -- I haven't
> tracked down why this is yet...

I've put patches 1, 2, 4, 6, 7, 8, 9:

>   target/arm: Correct typo in HAMAIR1 regdef name
>   target/arm: Add missing .cp = 15 to HMAIR1 and HAMAIR1 regdefs
>   target/arm: Implement RAZ/WI HACTLR2
>   target/arm: Implement AArch32 HVBAR
>   target/arm: Implement AArch32 HCR and HCR2
>   target/arm: Implement AArch32 Hyp FARs
>   target/arm: Implement ESR_EL2/HSR for AArch32 and no-EL2
>   target/arm: Permit accesses to ELR_Hyp from Hyp mode via MSR/MRS
>     (banked)
>   target/arm: Implement AArch32 ERET instruction

into target-arm.next.

Patches 3, 5, 10 had issues in code review and I'll
rework those and send a v2 at some point:

>   target/arm: Implement RAZ/WI HACTLR2
>   target/arm: Implement AArch32 HCR and HCR2
>   target/arm: Implement support for taking exceptions to Hyp mode

thanks
-- PMM
