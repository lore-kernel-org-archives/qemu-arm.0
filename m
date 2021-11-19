Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2358395lfk;
        Fri, 19 Nov 2021 06:28:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycB3KDTMAQNmX4TCK8RCcDMJcQS3Qp7x6izmyHo4oe3onJs0KsxCaTmpS9MJMjUJoXQqHN
X-Received: by 2002:a05:620a:22b7:: with SMTP id p23mr18099036qkh.156.1637332132026;
        Fri, 19 Nov 2021 06:28:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637332132; cv=none;
        d=google.com; s=arc-20160816;
        b=kE31dXgmZ6/0OYJ7u9GKJseihmHQAjACEIVtOdUE3lTnooZxxOUvoTQ1I169L6KpdO
         i69KeTefOyHGXXBFfd9cj3SngsKLlvv2vvl5k7r2oUf9c4bUxwIJdw6C64iXBJAwA+LG
         aUUX7Yd+wFzlOy8aDCeUyVZvaVCSQfJBi/0hcwiqgguwX6eIMjQ5JC0G0KuJgSeK0q0Y
         lsSjMKk8L7WWh0mlPgFE19Nuvfygz4CyzDLrSsobyszhFOEp/MQsgAO54wltyXHwmGhI
         jBgUXI1sRuRohPWz0evo1D5YboVk9X6i2AgAwkh04O43IYDhVpZoPRwIwN4qDXGHTTMg
         FgYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=byC8cpAxgItglsPBQ9nKztt4ey2sS8/RAmN2c9VxQEw=;
        b=qUG0mLLcC62m0XAzMyjYEAmAQvuEsCYtvMrOXxnNIrW/kHf9Dgf+WGwMpypU6wuKBu
         QSn0q5erhzcb+qBNhfn30om+hfccr2TJB1/VNxYdr36PvUazfZ49sS5hKz9NIcvD4uLp
         STAVKqtaXph9Km6RSl9EcPH6kI6gjwajstUS1ZG8DOJsTUlFanhoa2dNTEOhXOxus/5F
         aTtXCh4+CFGdAa6AMx9smIHbJC8Faih/c68GGtjhSQpayUqBkODYUgeBHZxI8CCDTELY
         88U8TNbax5i1na+aGD8aepWdcl1P4J0EtxwyYawOLWncjCrDOC+KZz/SN02BpQA/MShI
         LuOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QvzBD6zP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12si5506165qvh.181.2021.11.19.06.28.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Nov 2021 06:28:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QvzBD6zP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mo4sl-0005DW-EE
	for alex.bennee@linaro.org; Fri, 19 Nov 2021 09:28:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mo4sc-0005DN-NA
 for qemu-arm@nongnu.org; Fri, 19 Nov 2021 09:28:42 -0500
Received: from [2a00:1450:4864:20::333] (port=39557
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mo4sa-0005Cu-PY
 for qemu-arm@nongnu.org; Fri, 19 Nov 2021 09:28:42 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso10624750wmr.4
 for <qemu-arm@nongnu.org>; Fri, 19 Nov 2021 06:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=byC8cpAxgItglsPBQ9nKztt4ey2sS8/RAmN2c9VxQEw=;
 b=QvzBD6zPhE9X8eU1vYtYdhx+uB3FuKZdM/VEi/d+ozFk+mrmSPt1y4xVxFA3ZufRwB
 jeZ3XHs6jGAetzZa14QyZ1YvnFwkOLogeDSuosEj2E7ZO3rYCzIZ9dTn0TNEDi8FS4j7
 Pt+rIagW57gZTW6FuuZ9RzVOJJhWDHzAl0OMkNcjKS/790Dph2QsURRY15m4QNx0yaSG
 Y2uwmdffuhacEQyKnz/VTbnvGhtNvIZP4dSWH0YIXwOqzfxWl617H4MZ9nizW4Qldp2y
 oaUbxrPTtVwhyred5rklEtDA/r/z6z7tzvV+RbWysHcRO1fwiLHy06JCAuV6HieKTELb
 7NvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=byC8cpAxgItglsPBQ9nKztt4ey2sS8/RAmN2c9VxQEw=;
 b=ra4dbr7Y15lUbCONwTarJZf7Qr7bRzdfRybHz3JMK7472193bSKCeLhZwyEAtvlitU
 ToVZVGQN+HMue6VyDiqy6aQkFHJeyU2rAQDYrLABartM2zGxWHbK7zNLwp4nRCIUsxBU
 gNvUA+MRy8+dlICIq2PNbe/+l3EtAxeniR51hOjqaGwyFQPdJNXd/zkJXbFUnAOWCLZM
 0v/89QSzO2GIzXkq1o+Ws0eHhUPhSjPJ5xE2G6miHop/rdq5/8ep+FkZa1Y0zpTA3mcy
 /qYJ/JUfqVTA4Wnj5WI1jKMiaD9iN26cm8w5lbre1xHnCCiJe80oDTjITsAook9Os32S
 F+sg==
X-Gm-Message-State: AOAM533wDNjSNyA7Uw1gTJ2o/ZgmA5XILTTKZOvEcDu0Y0DxdMCtkz2n
 Nkv1v+BEa5BP/rYZhT8Tnw4pEFFJ0kApd7icL1ah3bZP7C0=
X-Received: by 2002:a05:600c:3486:: with SMTP id
 a6mr110999wmq.32.1637332119214; 
 Fri, 19 Nov 2021 06:28:39 -0800 (PST)
MIME-Version: 1.0
References: <CAE=NcrYJfjF-pEiX-tY7NfiTbDfXtcxnk5AnBVwc2AX4cpeCrg@mail.gmail.com>
 <CAFEAcA-CKqZPF8A+WsXE7gLgOPPYncteomvMSOcAuLEkB9F-Ew@mail.gmail.com>
 <CAE=NcrbPW4LVihnZksOCJ6NcQQYkwJudbqrp-sUEx663+qyG5w@mail.gmail.com>
 <CAE=NcrYPqu9oa0UZM7VRDtUqQWg93spVOdRLQGs0hdHtqghGVg@mail.gmail.com>
 <CAFEAcA_uzvNuMx9KJa=Z_Dwuonf10ekTDUbNf9bZSVa+hNtHLg@mail.gmail.com>
 <CAE=NcrY8GJZ-Py0n_24JDao0sJLcYoZ1TSK4RMLfkiWyOxPR3A@mail.gmail.com>
 <CAE=NcrZ3jU2K4a7tqhKxOSGpbEf=9-z6P1vhc=ep6JWXB0zxsA@mail.gmail.com>
In-Reply-To: <CAE=NcrZ3jU2K4a7tqhKxOSGpbEf=9-z6P1vhc=ep6JWXB0zxsA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Nov 2021 14:28:28 +0000
Message-ID: <CAFEAcA-pqkZ8DEC3d0yCeNvoeDtQvdf_s3+SpyeDdOkabCOXVA@mail.gmail.com>
Subject: Re: softmmu 'at' instruction support
To: Janne Karhunen <janne.karhunen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +4ioY2tQKWve

On Fri, 19 Nov 2021 at 13:49, Janne Karhunen <janne.karhunen@gmail.com> wrote:
>
> On Fri, Nov 19, 2021 at 12:54 PM Janne Karhunen
> <janne.karhunen@gmail.com> wrote:
>
> > So 'at' reads in regime_ttbr:
> > 10541         return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
> > (gdb) p/x env->cp15.ttbr0_el[regime_el(env, mmu_idx)]
> > $1 = 0x41730000
> >
> > Which is wrong. The runtime reads:
> > 10543         return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
> > (gdb) p/x env->cp15.ttbr1_el[regime_el(env, mmu_idx)]
> > $1 = 0x41731001
> >
> > The determining factor about which one is used is in
> > aa64_va_parameters, and it's the bit 55:
>
> I stand corrected - looks like D5.1 in the arch spec does state that
> the bit 55 makes the selection.
>
> Interesting. Looks like just padding the address linux style with
> 0xffff8 is the key to happiness if you expect answers from ttbr1_el1.

Figure D5-13 is useful here. Essentially TTBR1 is used for
a chunk of the virtual address space starting from the top
(0xFFFF_FFFF_FFFF_FFFF and working downwards based on T1SZ),
and TTBR0 is used for a chunk of the address space starting from
the bottom (0 and working upwards based on T0SZ). There's a gap
in the middle which always gives a translation fault.
This is different from AArch32, where there's no gap, and the
TTBR1 range starts where the TTBR0 one stops.

I think it's better not to think of this as "padding the address",
but instead that valid addresses are always in these ranges.
If you have something whose high bits are not all-0 or all-1
then you should ask yourself how the address got mangled.

Note also that not all ELs have two TTBRs; some have only TTBR0,
in which case you get figure D5-2, with just the starting-from-0
part of the address space being valid.

Big question: I thought we were talking about doing lookups
on virtual address 0 here? That should be using TTBR0, so why
do you expect it to be using TTBR1?

-- PMM
