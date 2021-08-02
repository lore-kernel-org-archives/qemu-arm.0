Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp1575050lff;
        Mon, 2 Aug 2021 05:13:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAw49F8TCSlSaZHdvYPHh3FqdM7Z6GAZcOg8JYcAxuzQsVKDeUGI3qDqcdrLso1veiyoXn
X-Received: by 2002:a05:6102:f07:: with SMTP id v7mr9110214vss.27.1627906405093;
        Mon, 02 Aug 2021 05:13:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627906405; cv=none;
        d=google.com; s=arc-20160816;
        b=MtE2Rnvg6eFta8/qbzbaKkI7I9Z/IJtQBLc2YAmjt5AabdZbh4GzrnXiAqlnTC/kpu
         8YI4KjtOAsCzowwZMM/XyEKzrjClPUu5rvMBM5JudwHX76ppeVux2fJh0eUAbwwyuI0h
         wXnhifCgttGi97+vun6zTsj3JkZxoL5d3r2y20XGFqVMPw2yPKpttpGoupwdErYqxJ4e
         pAiatl9CsJE77YYHB0saL6Qc8ho8vn+DUu/Riv+pHppKcGEYZsbMqRoTAORWJRwCXBni
         //y1wZBzs+l6an8XAr9RHXifYT4MlGwkeXe+UMAPf/gwitUQXi34GunK4WNREe4oiiwZ
         Vuwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MJY80RfjH18LW9aAyCX+LpvXazL6yNVxtsKwqkti6uo=;
        b=in5sUZ2YWTdT8qxCVdbiaxaTdWfGrRJ2NnyQbYnNPpdO6rehkcUI8Cclp+Z/1zMLlT
         YOpSUCoZKdds5z48ePSjPO3sBz9OZ14Ph/Y8ecfIjd3VGyQPZcDWykRoQbxu3iYOO76r
         ZqguOYY2OaARjxaptCXS6h1taTxTCM5jKS3F16ZZmZxO9AhQRMDtCJOjBYNyh4qP9d1v
         vLKrxpcGC5Oy0MIJ13L/V59+lI5CMFgbl3i3AsR+ocviGwCmO7x/ksZuU2atHYf/jPpl
         wlEypO7t88t+Fc2VNvdsXD6lAEMnP3YC/L8Py0hD6gpOozI7p2p5nbmZLGyl8ia4RwOY
         J0SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lWE1222F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15si3760534vso.42.2021.08.02.05.13.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Aug 2021 05:13:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lWE1222F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mAWou-0003W5-9V
	for alex.bennee@linaro.org; Mon, 02 Aug 2021 08:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWgU-0003aN-Ux
 for qemu-arm@nongnu.org; Mon, 02 Aug 2021 08:04:43 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWgT-0005Px-6w
 for qemu-arm@nongnu.org; Mon, 02 Aug 2021 08:04:42 -0400
Received: by mail-ej1-x636.google.com with SMTP id x11so29578616ejj.8
 for <qemu-arm@nongnu.org>; Mon, 02 Aug 2021 05:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MJY80RfjH18LW9aAyCX+LpvXazL6yNVxtsKwqkti6uo=;
 b=lWE1222FSgfqNUEoKFvTUIyU2WtkfO7huV75CS4SV0kNdJyGIzXvfPg2r25k+YGHCL
 iTTrnEuZ/syBN13aWjnLUN1TVkcP0L5iIAiCZcKFSMXDfjI05MAWh4HuHAiJKV+U7GXH
 nma2IB+cQdNem5BnO1xSv4aLAI1fx61zHTnAceyonE4nOMLS00oWM/p2vTo3mGHYBsyE
 L9Q7/rvAtzgSz4HhZU12QQL7zoG6+G7MCEz4a0cI5gQRX4TIwtABR5NMlYIP/1MlyOai
 qJPy889Gz0BOFWmrvzBA1oQ8UEBtCZ9JsYoALa4dIoCw9geqSLpJm+IG1q7qn/hZTeYy
 RGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MJY80RfjH18LW9aAyCX+LpvXazL6yNVxtsKwqkti6uo=;
 b=qurh9u75N7Fzu+LMz7oyWe84W1hAzePwrifsf2nt/zgb6KEoog87abNeYrKh85f+ER
 7IdUEBV261BAwycpE6XwZ51SjyU9vq0tnecDj0C2h9vziXUZpng4323s2qTl4lmoYjco
 pWWHC6bheMBSOsKaKBHar+HgznvGTnI8qTQcyt7/kLvIhILzKRogYl35Lj+5thrgisZM
 K94hoTz9zbqY41h6KvZ9snymyUGnF2m4S+TxivH+eHWKFNHMsx3GPHW97+0FyOqmr9lb
 0Q8h5jo4AGIF5Qu17XBgkgMvbKD/gi7f+DlWLs5j+402Lbnrw2a1ovcaaeAEJ4Ai66hp
 4qzQ==
X-Gm-Message-State: AOAM530nk1U455V0nJMlfXe9QWpVjRoTvxTO92Ef19ufSE+XhQmnuowu
 NDrGCg09Yh0rEYg/LTbXGxpv0c73Is4cE3eq7/XQPw==
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr14936352ejy.407.1627905879766; 
 Mon, 02 Aug 2021 05:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210728181728.2012952-1-f4bug@amsat.org>
 <20210728181728.2012952-3-f4bug@amsat.org>
In-Reply-To: <20210728181728.2012952-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 13:03:56 +0100
Message-ID: <CAFEAcA8VSh-juGHeSa2N=d1izyexND24Er1B5YvX_4cR8kcUoQ@mail.gmail.com>
Subject: Re: [PATCH-for-6.1 2/3] hw/sd/sdcard: Fix assertion accessing
 out-of-range addresses with CMD30
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RTsFmXCOs0pp

On Wed, 28 Jul 2021 at 19:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> OSS-Fuzz found sending illegal addresses when querying the write
> protection bits triggers the assertion added in commit 84816fb63e5
> ("hw/sd/sdcard: Assert if accessing an illegal group"):
>
>   qemu-fuzz-i386-target-generic-fuzz-sdhci-v3: ../hw/sd/sd.c:824: uint32_=
t sd_wpbits(SDState *, uint64_t):
>   Assertion `wpnum < sd->wpgrps_size' failed.
>   #3 0x7f62a8b22c91 in __assert_fail
>   #4 0x5569adcec405 in sd_wpbits hw/sd/sd.c:824:9
>   #5 0x5569adce5f6d in sd_normal_command hw/sd/sd.c:1389:38
>   #6 0x5569adce3870 in sd_do_command hw/sd/sd.c:1737:17
>   #7 0x5569adcf1566 in sdbus_do_command hw/sd/core.c:100:16
>   #8 0x5569adcfc192 in sdhci_send_command hw/sd/sdhci.c:337:12
>   #9 0x5569adcfa3a3 in sdhci_write hw/sd/sdhci.c:1186:9
>   #10 0x5569adfb3447 in memory_region_write_accessor softmmu/memory.c:492=
:5
>
> It is legal for the CMD30 to query for out-of-range addresses.
> Such invalid addresses are simply ignored in the response (write
> protection bits set to 0).
>
> Note, we had an off-by-one in the wpgrps_size check since commit
> a1bb27b1e98. Since we have a total of 'wpgrps_size' bits, the latest
> valid group bit is 'wpgrps_size - 1'.

The commit message says "wpgrps_size - 1" is valid...

> @@ -820,8 +820,8 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
>
>      wpnum =3D sd_addr_to_wpnum(addr);
>
> -    for (i =3D 0; i < 32; i++, wpnum++, addr +=3D WPGROUP_SIZE) {
> -        assert(wpnum < sd->wpgrps_size);
> +    for (i =3D 0; i < 32 && wpnum < sd->wpgrps_size - 1;

...but the code change makes the loop terminate when
wpnum =3D=3D wpgrps_size - 1, so we don't execute the loop
body for wpgrps_size -1.

Which is correct ?

> +                i++, wpnum++, addr +=3D WPGROUP_SIZE) {

thanks
-- PMM
