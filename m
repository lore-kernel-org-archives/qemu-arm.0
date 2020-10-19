Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3988495lfa;
        Mon, 19 Oct 2020 08:53:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAiGEVh1piJpOsaaBZ67QjcKX+/s1oSyeS3NsVhhvq5YBYFivLCT7K3xSzIlk9fIdRPIb8
X-Received: by 2002:a25:c1c1:: with SMTP id r184mr345197ybf.517.1603122819242;
        Mon, 19 Oct 2020 08:53:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603122819; cv=none;
        d=google.com; s=arc-20160816;
        b=0z3rlvJRWlvGcsVjRr+jDaw7rEHsFxL5pXYzycEd48/AYpV63Vgp86mXa1tW0vVEO9
         u3egZoh9UzS/b11KhIyn05qpb82Y4L4+ce5Lf0NHU6XxR03BLLEgOi7T79QaqdS0YLuV
         oqLy6+wB43yrAbmR0V1xaQxmoHbH95KqIBYIi/1JTh2+5u34UlAXRJ0fpLZJjpR2RCPn
         IKW7qAHRbRFyQxfpnXsmEWFXD2ufDQ5Nn2a3ADKQMJ7WO2Oj0wOGjmvqonP7YSaqM5sp
         +EoICN418b8nDJM9uHBSTO4w/gq7IY7Pr6tE/u5AG8gYPVpJL+AWgt1SqPCr0caR7J0q
         fKmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=95O/YztrrfmXurKw31pxwsR5r0M1r8oBwrgqkEDQGh0=;
        b=eFdPvQuLg9xtsAwn05MQpv/+6ZjGCK4FygJiTKq9szQPo49wvxhiO1+bw4OSMsdl57
         9/Mrogzg24/WGD3feg35Ws5FPMmj0+c1OoskRFSHNDYV+DC1qjj0+MfY0cfJpZ8VO+oj
         9hMgKls+wGpiulEVrgQ8dyESHJVURoU7CBzzM+9auBCXLUbO4wkfYYkuJQN9PctPCanR
         g+PGd6C4Y4d6g/UIhIQjTt24qWDeZh6iU4AeFDQCzz/ZSSsMTLoGBjl6B2Ihsx0B/2UZ
         KAONxOVHJutKZhNOxTks5FTonaUkVmSSNo5CTynMrlcSZ3ull3cAVeTjySEfWVBm442b
         7zlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T+sudBLu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c73si308029ybf.305.2020.10.19.08.53.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 08:53:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T+sudBLu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUXTe-0002Pa-LZ
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 11:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUXTK-0002Of-GB
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:53:18 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:36403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUXTI-0008CX-Mn
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:53:18 -0400
Received: by mail-ed1-x543.google.com with SMTP id l16so10807726eds.3
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2020 08:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=95O/YztrrfmXurKw31pxwsR5r0M1r8oBwrgqkEDQGh0=;
 b=T+sudBLus23otzQIWoLnmQQeBQu4IYrcFV8glbKNYE4N8JHo7wTOUQ9N+d4nRNcnYc
 CHvj2ckQ+Rcyru4Fg3OoKEjdF2vOtBtiGGcoE5RqoVQVD61hRSeiy1FWophPwgkVR8mE
 0vjznLlsjL3SY2BfLOqiI+mpJ7wU+HX2dXjtNzdSxjroMwVLGgvTJm3jgIOPw3VpTH7v
 rFDaAd7Of4gUxs2xP5W+TYpyZ5N3lODZLg7pJrL601s0GR7VogkF0HdLhT4BnRnBlbLq
 iGg8iOaA+qpnVV61Q35QJxBCRX/g+vhFPa43KkQPcoZCHG4VlO+FBKtJlkUV6fka+Mho
 lxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=95O/YztrrfmXurKw31pxwsR5r0M1r8oBwrgqkEDQGh0=;
 b=Km/V+cxu816BLOkiZDnv0MQ7t6wIKjW0105YZ9hJvg3Dq2Q+zBIIVuxKEXxtTcgx3t
 8JsPo/FtofpqbBe4ATjDOR2TG/SWXvnZ9DuAW6hX/MX1HNJ80eAo3bZvFy3353ZIC1p/
 ga9qxSQHgxs+tbFu7TAKeLsTPecmZN3bZPOMTo8Djky/bGIU+NqvKSLyBLtjBuQ/Gy4D
 UiKJEB0nGxsdHFY5UJP4/BGFDS/OFMmWRJDO+AvXboqbN6vDYNSWO0xd22TO4ZT6wget
 hEU2PQnGXmOvZ2F3UZpgUkYYA889/eBjwg8f3XB/5AlEd4FyuYmPbcb37E7cXeP1DjGh
 C8bw==
X-Gm-Message-State: AOAM532JY/NKSfXKx6jBodtnWLVVd3ahsGdJZOKqjHS7ph7spf7Dg83T
 yxr+Zf3/+0QPWKQwSAuh3IKHya8+ruSJCEyN5Gi34g==
X-Received: by 2002:a50:c34a:: with SMTP id q10mr511987edb.36.1603122794935;
 Mon, 19 Oct 2020 08:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201019112628.1653550-1-f4bug@amsat.org>
In-Reply-To: <20201019112628.1653550-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Oct 2020 16:53:03 +0100
Message-ID: <CAFEAcA92ah6O3uTESb98GF2F98ASmiQy9UqyNMOOLZPZaX40zg@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/bcm2835_cprman: Make cprman_internals an included
 source file
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Luc Michel <luc@lmichel.fr>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4D2gYgEJY7ug

On Mon, 19 Oct 2020 at 12:26, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> bcm2835_cprman_internals.h is only include by bcm2835_cprman.c
> and contains various static array definitions. Make it an
> included source file (using the .c.inc extension).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> I'm sending this on top of:
> [PATCH v3 00/15] raspi: add the bcm2835 cprman clock manager
> to avoid a respin before soft freeze.
>
> This patch can be queued or squashed on top of patch #08/15:
> "bcm2835_cprman: add a PLL channel skeleton implementation"
>
> Based-on: <20201010135759.437903-1-luc@lmichel.fr>
> ---
>  hw/misc/bcm2835_cprman.c                                        | 2 +-
>  .../misc/bcm2835_cprman_internals.c.inc                         | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename include/hw/misc/bcm2835_cprman_internals.h =3D> hw/misc/bcm2835_c=
prman_internals.c.inc (100%)
>
> diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
> index 7e415a017c9..9d4c0ee6c73 100644
> --- a/hw/misc/bcm2835_cprman.c
> +++ b/hw/misc/bcm2835_cprman.c
> @@ -48,7 +48,7 @@
>  #include "migration/vmstate.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/misc/bcm2835_cprman.h"
> -#include "hw/misc/bcm2835_cprman_internals.h"
> +#include "bcm2835_cprman_internals.c.inc"
>  #include "trace.h"

I guess so, though usually we only use .c.inc files
where we actually need to multiply-include them (eg
with different #defines to control how they expand).
I suppose there's softfloat-specialize.c.inc which
only gets included once.

Applied to target-arm.next (not going to try to
squash it as it would make applying the following
patches in the series a bit awkward).

I am going to move the #include line down so it's
not in with all the includes for the .h files.

thanks
-- PMM
