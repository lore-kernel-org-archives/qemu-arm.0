Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3017819lfm;
        Mon, 29 Jun 2020 07:05:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxz0M+3oiTHPzxWXpntrE4V5UX2tIhS3gTpvtn92m8Wg/SvvXOrU6/Fc9ZWTvmkMwOuSCYe
X-Received: by 2002:a25:fc0a:: with SMTP id v10mr24728265ybd.119.1593439548030;
        Mon, 29 Jun 2020 07:05:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593439548; cv=none;
        d=google.com; s=arc-20160816;
        b=E3196Qa+3vZbkErKnefbI8DiA/6HbaToGxlV8ne2y25JWIxe07gXiPE8rJtmCq7byK
         Z9KxcElyZZBnIR4KNUWZVdsUkiDD+3AvHdLRda/g86DzlwqaQy9zttulpOo8oH2sb/IL
         0979OZh5wzW5JggMhpEmEamvEx6K6njWvUeftn++lJYpvs5k6q2Uh1GACwQLSXKj64vU
         X7CgveJcs9agMIAWwOhXincLIApoKj/DF1PKC3FwzLSJSvvUiPF1LRflGauWHCEwAKoH
         B6ndw6sC2zFRCAwqFyV625rdCfoZsBtt3UCtdJOPVIuozP1PkIqd+9X5AIONcgnstd/p
         m/yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=uG8RLxxIhjz1zmgCG4wI9xY1Mj5Yh9ZSuvKZ6nRyB3o=;
        b=P8MgYcTdr8zFSBVl54bGB8xYpBhJjMjamGTR4AMKHq4SvNWIgoMzn3SHRBZrvKMkHv
         FP6uToUMeyJBwMojFNSLg9lwbshfAKa0JvdMWMj1/xsD1JlQhpLWkmiRlJmBsVsNaY3R
         dR1AOgONmvCOkDe/H0GHznchiY3dEajT6rRXvA6TsdoXBJuI1amgjpLKqeZ+cRdrnxCx
         XDICUnGHr/VuARZeI1z5pLnBK0rdUDnymX688f82e97ah6235CUsXp//yjOPgtowbGlb
         Gr9FKPN0jjReJutwoyYDMHKbIqFNDh+q5LZLYG1jlNQaEmhn/0MV4NaaEwLIyWfZq7Yn
         PL8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OWRDRmUx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6si9492944ybi.367.2020.06.29.07.05.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 07:05:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OWRDRmUx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpuPr-0003uT-9n
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 10:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpuPg-0003rs-5I
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 10:05:36 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpuPd-00043p-K3
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 10:05:35 -0400
Received: by mail-ot1-x343.google.com with SMTP id n24so13349815otr.13
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2020 07:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uG8RLxxIhjz1zmgCG4wI9xY1Mj5Yh9ZSuvKZ6nRyB3o=;
 b=OWRDRmUx7QC25ALW3EG4LK9NXsN2qb935pKooKOiJ7DOQEvTwPiX7BIVzlGryoUoy8
 IDDHYX+SYWFf2YsFe46DvjwtWerk5Di/i5IwMMMQzQOPHnLLvoZPXRXQ+hv2rbvDKxri
 CMNC4ZlpchbiEqIBlEdwZpqpi+Bc50P6cNSdttUgCMJrR2OjSrmPQ8oMqfGUy1KiBbLA
 v4PdgzfOjmeWnSIy3abJcsRPNzRsPkSwRn3rnaMcGiG8dxWf/mV474+Scotp1cNanqRf
 rA9K3Pl5BdCRgxsr3B7QMFsXRoXcp64pSNQFl5qSbS2qxlRD3bEg+0n1fui4xTc4RZJ7
 JuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uG8RLxxIhjz1zmgCG4wI9xY1Mj5Yh9ZSuvKZ6nRyB3o=;
 b=CTaNL3jAcDVFSyodqAD0E6i/6TIso+zID5to/4dYkG2tvhNtA6Erpa7JL4bU48TCWg
 3Gxsc+v0lFW3TU5deOPlO8a1OXf5WQOh04dnxl0K3XkcOayQ127hxUQfJWcev9AK6njF
 oJVvVandTALYr5adfHmAoZxAPLQottWZihovpuOyYE4fFUlQBv8dAwMQV/ao77CuTO0A
 cVxHk/1aX2duMF/GpvKOZ8R+42qEJWhgfs/8k7rwi490GCd4cjPb86FwnEa1V2FOn67v
 pFKO7M5Cg3gNG1PKesQxJASPVj+zE7H7nwk8f7NiycsWh8OWnt6ZgSd7V8bcgGZ5xEYW
 D7Zg==
X-Gm-Message-State: AOAM532ES6gAp8Cb/zWuB2cUy7hofaT/4WDKV6dCFOYFADeWwYYsLPrn
 nf+FGsW3QHxivhArW5Xvpvkj0JqjGv2QYCMsfCG06Q==
X-Received: by 2002:a9d:7303:: with SMTP id e3mr7691653otk.221.1593439532478; 
 Mon, 29 Jun 2020 07:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200628142429.17111-1-peter.maydell@linaro.org>
 <20200628142429.17111-10-peter.maydell@linaro.org>
 <bd800c18-4b59-3c88-0a8c-83ba6ab4a2ba@amsat.org>
In-Reply-To: <bd800c18-4b59-3c88-0a8c-83ba6ab4a2ba@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jun 2020 15:05:21 +0100
Message-ID: <CAFEAcA9_LmgCTDcDm5L=aZ9idjDQ6AFCFZnbz2NCEWp7DO89LQ@mail.gmail.com>
Subject: Re: [PATCH 09/17] hw/arm/spitz: Use max111x properties to set initial
 values
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hNGkTbNZ6IQL

On Mon, 29 Jun 2020 at 10:09, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 6/28/20 4:24 PM, Peter Maydell wrote:
> > Use the new max111x qdev properties to set the initial input
> > values rather than calling max111x_set_input(); this means that
> > on system reset the inputs will correctly return to their initial
> > values.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---

> Actually for arrays it would be nice to use:
>
>     DEFINE_PROP_ARRAY("input", MAX111xState, nr_inputs, reset_input,
>                       qdev_prop_uint8, uint8_t),

DEFINE_PROP_ARRAY defines a variable length property array;
what we want for max111x is fixed-length.

thanks
-- PMM
