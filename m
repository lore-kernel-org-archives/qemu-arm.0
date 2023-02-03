Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1250465ejb;
        Fri, 3 Feb 2023 02:24:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+S9XYEFiDzuG13P2+YP8+vcJRgAOCKnUpd9xt/25t+FuT1MvKFEqhyXwY94fAzm7wUSlZO
X-Received: by 2002:ac8:5c07:0:b0:3b9:bca3:d94d with SMTP id i7-20020ac85c07000000b003b9bca3d94dmr16763869qti.29.1675419880475;
        Fri, 03 Feb 2023 02:24:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675419880; cv=none;
        d=google.com; s=arc-20160816;
        b=fQHxOrw2cwlgQbtF9Rl0loOg3PBqa2cUcHkSKfq61iE5/ZtgfVVvY7dKoL9pO8sJBi
         GIAIS31iOqkkJvnDzG4TOMA0n5maJG+BOlmK0rOTHVI/9WxGyGldA3H+MnLWxRcaRcPK
         g9m6nyoPgzkeCFN6XJ8kSkGQVRW/KjFB0e31tDkrUmvFo01Owznc31pQaiVqZtQKJscr
         sU/+Wt52JjZPTgkUZtQbYFQ4WDrAOIBnJwNcKbC/72hxBWBv8OuCuppg2l/OQrlbsUkm
         mZPPIsQ8WyUiLmVwTatM13j3ouowBgIZ6VBl1AWTkXsxILIUNgCzNcJEQfx6h25wH70N
         0KmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=tv83yX2eplewFaDEN0t5Lcnf6leqr/CQibQNna6eXW0=;
        b=XS+SGO2w3fMDhp66Lm8267xziDvXwTA43EZeuV30/btgMWJ//HIfYtIl1QhulS4jt/
         kODzU9ZFSiMhhgRXlnwuwEcb4EnJSN3LxdTvwGZKzhG8ooPmGGpmvVcvdEbzwL76jnRy
         YoO1QLQpkKr1FDwm1Zo2MfYDqUTJ1PNwciHqNX9is0f2hIo86hkg+kT2LzekfW/84WfX
         xUCUfVnM9Djx6ZbqCjXJKmcH9gSYM6BHNRZ1nQ+CheYrJ3kdYWu6FMKoqiwziPnDxG2/
         JSn8bYKIKHNV+06kidQpzF6/iwMIcy1iwv+DBb9pFZDb675jXFI3ruSkHziNtji/WLDd
         QMbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LTWFovYm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o187-20020a37bec4000000b00708f9a38633si1515644qkf.419.2023.02.03.02.24.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 02:24:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LTWFovYm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNtF9-0007TE-IW; Fri, 03 Feb 2023 05:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNtF0-0007SY-LZ
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 05:24:23 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNtEx-0004lA-SG
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 05:24:22 -0500
Received: by mail-pl1-x62b.google.com with SMTP id m2so4777639plg.4
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 02:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tv83yX2eplewFaDEN0t5Lcnf6leqr/CQibQNna6eXW0=;
 b=LTWFovYmMBVkw8OHyM6hwgMS+WwbVRxGCtv119iFj7xyi0k9NEhddQZakrp1KS8WW6
 EV9JKT7wFuw0doPxGGoNKXR3kUxXNPSHBEGoDMFWvCbn/855sNaycRt34OCLqK53gjA3
 fEjynwx+Y0P6f0KemtH6q30svZsDBtjzMB3SmpyIZgiFg7/PSvIRazuCxGGKubU6/qsE
 pK/HHcvs5HeRx0vhyt2txoS5ZaKA8CeYnSKKpiRdku35S1oEeGQT41XRHbtElR/EIERR
 6yZnz3q8+m4YkcucP9YRUH4kTVND5gXlXUwrnVAUrkNDwop3fMXyHukAHlO9Qpg8UtTH
 gFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tv83yX2eplewFaDEN0t5Lcnf6leqr/CQibQNna6eXW0=;
 b=nt79WllQ1PrhgaPyHXRYyDrQm4q6i5f9gMCu/oWDLK4bGESZr3Kya7sSmzQFGXvx3Y
 2KDLbh+G4ZsnKEwO+j/f5CI7Ku8mTWGLsjyhW9xUKb22VCRnT/OFb00hSAoQwUfBDm1K
 pPXNz+PKYIhKApQh/gAeGwrm3a/65qneZFk1NLqkDkTC9c0/xt0j9PDCDMH0l9DWkceL
 SKRgXL88b9iW+DF/QHV0ZOlz42ZRLItTdVYKhSQzPe2STV2KMpmIQAwZB3NtjqqN+VHr
 41RB8klxZUq48mKviqh8ZUdF/fSJIsbAionVtK8bgi9GsvnN1E3Hka6voBivkwX/C1W6
 oY+g==
X-Gm-Message-State: AO0yUKU78fy5StsdZIys04WLCXVyg2sFIgxc30BnqF3hBdjyfqn6Tl14
 R89JCTIBjpHRvH2c6dqw9CdQ3RGv5nG2FFVOrhGBnA==
X-Received: by 2002:a17:90a:a38d:b0:230:81fc:db1b with SMTP id
 x13-20020a17090aa38d00b0023081fcdb1bmr16200pjp.89.1675419857807; Fri, 03 Feb
 2023 02:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20221223090107.98888-1-agraf@csgraf.de>
 <CAFEAcA8Aim73+og4dr5hD93mTZ8xSWZ-oxMSEY0x6Zs+vTC2pg@mail.gmail.com>
 <d4ce9573-6f8c-1970-a2c5-f798fa8403dd@linaro.org>
In-Reply-To: <d4ce9573-6f8c-1970-a2c5-f798fa8403dd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2023 10:24:06 +0000
Message-ID: <CAFEAcA_nxgdj99=+q_X5mKDaEisbWrC9BgqzcK3uciGWGpjF2Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] hw/arm/virt: Handle HVF in finalize_gic_version()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9Nk2EeThxOTL

On Fri, 3 Feb 2023 at 07:07, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Hi Peter,
>
> On 2/2/23 18:57, Peter Maydell wrote:
> > On Fri, 23 Dec 2022 at 09:01, Alexander Graf <agraf@csgraf.de> wrote:
> >>
> >> The finalize_gic_version() function tries to determine which GIC versi=
on
> >> the current accelerator / host combination supports. During the initia=
l
> >> HVF porting efforts, I didn't realize that I also had to touch this
> >> function. Then Zenghui brought up this function as reply to my HVF GIC=
v3
> >> enablement patch - and boy it is a mess.
> >>
> >> This patch set cleans up all of the GIC finalization so that we can
> >> easily plug HVF in and also hopefully will have a better time extendin=
g
> >> it in the future. As second step, it explicitly adds HVF support and
> >> fails loudly for any unsupported accelerators.

> > Applied to target-arm.next, thanks.
>
> Did you squash the changes mentioned here?
> https://lore.kernel.org/qemu-devel/3278ab81-ccdc-9ccc-e504-dca757db5658@l=
inaro.org/

Yes, I found those when I noticed the patch didn't pass 'make check' :-)

-- PMM
