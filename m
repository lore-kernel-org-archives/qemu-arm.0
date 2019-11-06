Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp954001wri;
        Wed, 6 Nov 2019 08:06:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqywQ919xfGuyqdY3QaGMg3F4/RASF2Tr6yBnVfnC6Tzoc6c4dU9Uz9jxlqvhpzk6q2/sgkB
X-Received: by 2002:a37:a54c:: with SMTP id o73mr2825669qke.164.1573056360708;
        Wed, 06 Nov 2019 08:06:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573056360; cv=none;
        d=google.com; s=arc-20160816;
        b=tzOfI2Pbvru6s4rv70TJuLdzSIVDmxlZqUutLnju9oag2AJmo0vjGHbUYsJfhXX1n7
         7k2PrFE9/kKhqlSlt+FKt2VqJm/w/NX7i8HLza7MPBPF0jxV9fX3FglXUmPhE1g0LWyO
         sPiM/5SE7+aXHRlsSGdwbVz05OjtgxX86ZPbdODwvSD0pQSnrJitsaPL38e5Bay+TC69
         iVCHPbus+UMUrmRyiNvcUIMbzsCj4MrcUqHoUNlS2nvR2pl/+5dVTOm9MdvC/2753oZd
         zJA7M6fuYgCvMv2zfR6WFiSIQvgDVTN0ZdfrYfYOYv14Z7ab7NPXbvNvL2x55DDKBOAW
         csKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=64hrqu/vQ7OGvSnY8/7zVhi3gVactcah6O2vkBSklxU=;
        b=pbR7vATRLkjLxZJsfnrfcjtOXyKOhe+2f1Dqx90VDXWM/xufvYFY2CIsSvDTeOBYIZ
         f8nDmEBITeQDRN+3m0aOot+VhGO+CnEIWdTQxPGF3gI9afnbG9zif6AckiWXhaivGM3i
         vT/rLqGDb/et8hdJ795LR9LXtjbGV9iRk6eSBsQlmRDywdnAfGKy+ByilvkZDU9nQj9B
         pK0X4znczLRCxvhW4zFM0caidmgillvcm6u0fIQnMMY2m5c7kmScGM8KFCCRvqFo7NfI
         hboTd3AZNCVZnZjCh3AMBmQN1Vf7/XELcB/heenPS74lcAlMMXEr9VcBwWv7K/AWxhuz
         +Veg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d7d5Dw9n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n28si15541324qkk.258.2019.11.06.08.06.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2019 08:06:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d7d5Dw9n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iSNol-0001RA-J5
	for alex.bennee@linaro.org; Wed, 06 Nov 2019 11:05:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54133)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iSNoE-0001Ma-72
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 11:05:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iSNoB-0002Ng-Rt
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 11:05:25 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40281)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iSNo9-0002GO-Ox
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 11:05:21 -0500
Received: by mail-oi1-x242.google.com with SMTP id 22so3332713oip.7
 for <qemu-arm@nongnu.org>; Wed, 06 Nov 2019 08:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=64hrqu/vQ7OGvSnY8/7zVhi3gVactcah6O2vkBSklxU=;
 b=d7d5Dw9nF/6TQzt9V1ffLuSjskOslEzvqNlh1RpFiAeB2bkuGo7IggeGunMLB+gfKq
 WXzLJaIgWmVGVl4v0NAO9pDw6MqnDIB9cWsdxF4cIvCD1D2vk1W74+WiSivAZ9UrTwJs
 MCEmvOwWKc3nZZgrKRkekhxpXX9XY+TbLfh0Tpi7+1TtUrxYgXnvC8JuX+8M3b09BUT8
 7dnl7QbjcmjQxw5NhA6h4JfwZf3uv7gFWd8FhQHTeYnaZKFLiOO40x1wqGtsH1VH0yNE
 40cT/+J42y9Fohw2egk+Mn2hiXtOjKjeJMIhZR1yAJEl9p/IvQXA0T3gaASxpMZnMkCJ
 21Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=64hrqu/vQ7OGvSnY8/7zVhi3gVactcah6O2vkBSklxU=;
 b=T4xjRx89eK36sV7UlNAW1GcUAZypa+U2nEH+79iBrIK4Ua3ewvnjPRENte0tz9s7CN
 4x0A6kn4WMV1wsVYG6FfyUQM6RjyfO/B4v4fCi7KdSQRCQPqhj96iUHqXWTpi+Qn19Ps
 uuhC6juB4cgLzhKPQ5S5ZeYzqXf8sOvvIf/gnwUfvn34h+LkI5j/MrKu+kZumh6FMg7F
 CgY+JXmzGNJ8VG8BRp+2GrURESdL3Onnu6vfz3fc2SZcupYMVeCO+Lajje9n1tTJu/eO
 HzRgSyuoP12M4eOeusQ14aqnAmqhenn/Zq9P/JDlG6tWdCTFx4hCkLUZpWlAoV01Ci6Z
 WFNQ==
X-Gm-Message-State: APjAAAWOg+nBCDOQ5WFCC+7uZjvhCn4bsT+lx7sQNdwmpXvES5S/IoNH
 YVsjLlXSmdDPUYMpgIYpI3v1o4+BuR6L9af1Vft/sg==
X-Received: by 2002:aca:3e8a:: with SMTP id l132mr2762720oia.146.1573056319217; 
 Wed, 06 Nov 2019 08:05:19 -0800 (PST)
MIME-Version: 1.0
References: <157298160814.27285.16893877491189017648@37313f22b938>
 <73852c81-87b7-e5f5-4041-d24f078cc7fa@vivier.eu>
In-Reply-To: <73852c81-87b7-e5f5-4041-d24f078cc7fa@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Nov 2019 16:05:08 +0000
Message-ID: <CAFEAcA8SvSGCZsYT1LmN1cP1BjVDPqLP90yW9TCbvVA=kmyqBw@mail.gmail.com>
Subject: Re: [Xen-devel] [PULL v2 0/3] Trivial branch patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iqEGCfNPNbDY

On Tue, 5 Nov 2019 at 20:06, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 05/11/2019 =C3=A0 20:20, no-reply@patchew.org a =C3=A9crit :
> > Patchew URL: https://patchew.org/QEMU/20191105175010.2591-1-laurent@viv=
ier.eu/
> >
> >
> >
> > Hi,
> >
> > This series seems to have some coding style problems. See output below =
for
> > more information:
> >
> > Subject: [Xen-devel] [PULL v2 0/3] Trivial branch patches
> > Type: series
> > Message-id: 20191105175010.2591-1-laurent@vivier.eu
> >
> > =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
> > #!/bin/bash
> > git rev-parse base > /dev/null || exit 0
> > git config --local diff.renamelimit 0
> > git config --local diff.renames True
> > git config --local diff.algorithm histogram
> > ./scripts/checkpatch.pl --mailback base..
> > =3D=3D=3D TEST SCRIPT END =3D=3D=3D
> >
> > Switched to a new branch 'test'
> > 49a55f7 global: Squash 'the the'
> > c0b5513 hw/misc/grlib_ahb_apb_pnp: Fix 8-bit accesses
> > eb43395 hw/misc/grlib_ahb_apb_pnp: Avoid crash when writing to PnP regi=
sters
> >
> > =3D=3D=3D OUTPUT BEGIN =3D=3D=3D
> > 1/3 Checking commit eb43395bf8f1 (hw/misc/grlib_ahb_apb_pnp: Avoid cras=
h when writing to PnP registers)
> > 2/3 Checking commit c0b5513f971a (hw/misc/grlib_ahb_apb_pnp: Fix 8-bit =
accesses)
> > 3/3 Checking commit 49a55f7feb19 (global: Squash 'the the')
> > ERROR: do not use C99 // comments
> > #26: FILE: disas/libvixl/vixl/invalset.h:105:
> > +  // Note that this does not mean the backing storage is empty: it can=
 still
>
> As reported by David Gilbert, this is a false positive as this file is a
> C++ file.

True, but it's also a third-party dependency that we have
taken a copy of. If we care about fixing its typos in comments
we should do that by submitting the fixes upstream. We should
avoid making changes to our local copy of this code because
it just makes it unnecessarily more difficult to do updates to
newer versions.

Could you drop that change, please? (Sorry I didn't notice
it going by when the patch was originally on list.)

thanks
-- PMM
