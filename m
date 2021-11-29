Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3728517lfk;
        Mon, 29 Nov 2021 05:57:01 -0800 (PST)
X-Received: by 2002:adf:ce03:: with SMTP id p3mr33911756wrn.145.1638194221333;
        Mon, 29 Nov 2021 05:57:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638194221; cv=none;
        d=google.com; s=arc-20160816;
        b=i9yjO2BPeq6vVUsadOBtIcGkjeQz9/MDa/lIXKb8Vj1Qbunog6/cX/wcwRYu8BVXxN
         ZLVkUmBzaMWPvPITcYhl8gT1RDqpgmjMIz4KFmz5voVeUVsHlwsaft/pqpBG8HmVptZ3
         KGUV0T2yl4QaDwqeyFiUs+Cle5HUkDkNIRc+/CkU16UlgoBRMUCUrBUEcDtVoTy4ei/b
         iYMJqoOEIhWZIlBBu38antQuVzY3f6I1GnwC/MJed3pGPKD0eJJ3oSiQQOHJNcOnxW4r
         qEYNoCiZjATp+SXpvOnR4tCWYmeX/B1nidLzAhpRl2XPE37+Pk8+By5F/EhTu5t4jM8b
         OrNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3R0nafG5ODL5DRR7ec4ccsXtAd+EwKH++2HjSLBAW6c=;
        b=CKJA6V7tQH6nevd9BaGH7bDxRHv+0+tzqwTjMHKpckjAMp+EZtEvDgFI34EECvkCCZ
         RDMkcLkmsn2Cs8pCGTAGlDWXXvILp7hTMwMXbGQqXCtfQHbic65v5OpXooc3KUWetfGT
         vf5+GNIg8e/jLkyn27EAmXDOpSnziG4onjLioBLgA9AuR9Fy9iWDK8Buw/BQ6ejqnD7U
         0HELMS3kWK97GuC/2mwLMigArAebfFiFEbS7JlWdQo/dc+1UnL3AX4yIF1yYl3u+ceAy
         tDwPHTiU9tB/WOA5/STfYOfbA2/OvhC0uiOdVIr+lXwRWAO9dytCw1DGM7ukDmEtgno5
         Ay4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GMFB725b;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w4sor9454180wru.21.2021.11.29.05.57.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Nov 2021 05:57:01 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GMFB725b;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3R0nafG5ODL5DRR7ec4ccsXtAd+EwKH++2HjSLBAW6c=;
        b=GMFB725bAevOPhKetlFm2nh3z45lZpBl5maAdtNCllhW0IwMnwH4htujoBg+nLE8bL
         N7IcOld4sYTSJDSYtdGjh1aVc+0uLzLG9VJrMWdKnnSdRPUC04TbGnzq3Xl2TWPQb8cn
         CSdsm+Pqt29TdIGYwGKpbIVbJThQgETDSxI/+tXiWnBX2zt6D6c33VWF3eTLsQ3pUqae
         5+q0Ur3KV/X1dIi0y4UEFnO5x3g8qFrSqiu8kYYZm6qY3TlPjiCaDdX17I6DVoqdNJVH
         Ogw0jVnW5cLpmjcbOUiKiBGSLCt/fo4skU1CUBIVm/q4ovwRY5rXipr/pQ1y4trj+I8W
         dffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3R0nafG5ODL5DRR7ec4ccsXtAd+EwKH++2HjSLBAW6c=;
        b=CUyAnkQHLPB9ytHzD2FdAfDlsTwU9YAovgTkMNbigLlQgE3dWO5H2lveqIj9PE8SkY
         MiSClZte+7BAksXigpbqLO9UIE/whC90TeKQUSmY1a7ICAkIsDfUybtX3emTM7REuKDL
         ndZCYG0xWUy7YKub1/tq/0LyhfCbXrwzHIzx8yOuAwD/38DmPERC31x3YVQj+cWONqwF
         3hltvdFGWHN6m89Hy16U0gQ3hoQApMPWtgeGMg8YwYBgVER2KSByjdRKwD0B1bz0K9EM
         TeBSOwfMPfRKI0mBesMDJJcfBlIOjEidO5XR74cneiZA+P5hMflBGWIujcUcMSIUijfa
         fvRA==
X-Gm-Message-State: AOAM530zRBjX8Uhs+Vf2EmLI7X6HhaafS4YYeeUXtK3+kqavcIRZvuQZ
	+FX5phyMKNFxxA93Ojqe4q5xv/IRPtY7+lqGfrYz5OSGWxyRXA==
X-Google-Smtp-Source: ABdhPJxroHcSOfVuJ1pdVOhOp3MoWJl23Uo6hAP2EuzI0Wge9d8V9UkpyZ0B8eWTZigdYdNwHImYwvJwCVs8CzzomNo=
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr32443081wro.484.1638194220994;
 Mon, 29 Nov 2021 05:57:00 -0800 (PST)
MIME-Version: 1.0
References: <20211112170454.3158925-1-alex.bennee@linaro.org>
In-Reply-To: <20211112170454.3158925-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 13:56:50 +0000
Message-ID: <CAFEAcA9iJdkhuPZtm_h66H2L2N+=Ue5UJ3jDnF+cxdVTZpdxsA@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/intc: clean-up error reporting for failed ITS cmd
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: B9beQ8I5SAXN

On Fri, 12 Nov 2021 at 17:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> While trying to debug a GIC ITS failure I saw some guest errors that
> had poor formatting as well as leaving me confused as to what failed.
> As most of the checks aren't possible without a valid dte split that
> check apart and then check the other conditions in steps. This avoids
> us relying on undefined data.
>
> I still get a failure with the current kvm-unit-tests but at least I
> know (partially) why now:
>
>   Exception return from AArch64 EL1 to AArch64 EL1 PC 0x40080588
>   PASS: gicv3: its-trigger: inv/invall: dev2/eventid=3D20 now triggers an=
 LPI
>   ITS: MAPD devid=3D2 size =3D 0x8 itt=3D0x40430000 valid=3D0
>   INT dev_id=3D2 event_id=3D20
>   process_its_cmd: invalid command attributes: invalid dte: 0 for 2 (MEM_=
TX: 0)
>   PASS: gicv3: its-trigger: mapd valid=3Dfalse: no LPI after device unmap
>   SUMMARY: 6 tests, 1 unexpected failures
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Shashi Mallela <shashi.mallela@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> --

Seems reasonable to me; I've put this on my list of things to queue
for 7.0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
