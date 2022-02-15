Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp601233lfl;
        Tue, 15 Feb 2022 13:29:27 -0800 (PST)
X-Received: by 2002:adf:d08d:: with SMTP id y13mr624475wrh.445.1644960567153;
        Tue, 15 Feb 2022 13:29:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644960567; cv=none;
        d=google.com; s=arc-20160816;
        b=mkF4gIYfiThdX7vzBn4ZlncamfaG7PrfXiOAK1xF7fj3BUf8WAY4IQog80qTj8XADl
         awB2Va1ZvRcJUEorXhp75gxtZaoiVxAPKYx2pVOTlyT8+M4wnDsHIBVgZZ3kfCLyCrkj
         MB7XfzmJicJ4zN075P/9woLXqvrrEeVRKakywrMMQdXAGIkMFmxuNNGCZeQNC3P/63ir
         bsuenSmyEqjfxKYtViM3Z2aGPXLZgY9NyhZiA6I02suklgNmhRgG3LoRAlPFi/4ib6am
         oxd/cWtyd5qE2qHII+93bjMYjD5PftVlZ+fKgKnZYa5mmLukW71tB9b9V5hpW4V0VpGD
         9trQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5crpDYqUV82tW1ObwcfWcA/2RxB1IYrTJcHZmbYilH8=;
        b=QBkGlVUndf5p0RZEBX++Q65JS1H2sjBm1EIsyFhSWoA9goXxZ1jd2y5+MKzkrnVCeV
         HDkuRNRV3jrYsXTro14xZ24AP5yLTPtL+dI44/sLzWO33YsvTw5qIrfrbqNxVJtrtiDk
         GCBMvA89ZMfhZlKzmY4mX6OCJeuD7+jo7hRlhR5Rbvs3vCLryTYDGzwUF1zzLW9XfshC
         zrWUzKvZquBXLJUlbbOj86bBVqudt9EwBAwIdhcI6gC0od4mwA1ON76ruDhndt4tbuGn
         RlypZagno7WISACDGyJiL9ZygIKYNCCJx2kR6K7Ga+sxo/7wu2iCWSxm0tCEZT+Tz37O
         aY/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZS6MgzbG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v3sor9374925wrq.60.2022.02.15.13.29.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Feb 2022 13:29:27 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZS6MgzbG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5crpDYqUV82tW1ObwcfWcA/2RxB1IYrTJcHZmbYilH8=;
        b=ZS6MgzbGGCAaVbLN1MvXEKSAHHQKY+sfENM4ZWP0Js2AbxgW0KcWhj73/HjBl+GaGS
         QSz2f6zSLCAmu0lOYjLyRzRV6ZahyNMuMgq9/j0N7g+v1GGvBfpbSrOAgVPHWfiVgpGh
         7O63VDhtgz2AzQdTEdLYpuRJ5PMAWtbaXdjr6PyBHbOfHTNUIUacK5liLeepRDdsYge7
         so2KPBjSoEgqbMYRpYlBaXYW6T38XFpIgR26y9HVWep4vEUHdzHCif0alwhWOv9cBq5f
         xI4S06SNslZ0GTPgpLCGlJuajUJXEZpnJz5UF8ozdjx8LFoCvRR3pQRXjdmHSyXvLLO+
         RvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5crpDYqUV82tW1ObwcfWcA/2RxB1IYrTJcHZmbYilH8=;
        b=nycW4IDxnS0GEl0Gh8DaWiSLUec+ww1Qd1nPMdJMKL244xdneoVJiYlaJtN/H5lhvQ
         Pg1jd22s92UoOIO6/Hf+PO347J3tsu7SLfOsXaF7JmihuVIfqb5nUHD9rUTpVM0xs/Zt
         mhcaFPDh6f3Jl3R+V1Nor+G3KydBhLKH9xkmEV0W4uqxguInFoXU9pyujgGjP9B4gr2u
         8Ehz+WpFMKfV1cyT4Z9y/PncHQPNmZkAU7qPR6PP4NDtOK0wMLZ3U+Xbl2S9l2fnIxCF
         OZQbqRPJkP+cLlvi0wd2p/xS7rQ/PZj3axYj7tL/9RdxT2uIVRPIOkslJXdAMX9FcTbc
         UMbg==
X-Gm-Message-State: AOAM5332wQ/EhjRCc3OJcU5fb4jPA8ml/7qfGOU4Flw0aKzOHTLfvs+Z
	GfnRXCVQ+srabhUw5Z9TLhjbUOpJWQzyKR3W3PJcJ0ua+ttd7A==
X-Google-Smtp-Source: ABdhPJzFYdWkxq1V32WRHnJ3EQnLmroJbilUXbp9PbfMifGYvsGSZEz6WPMyWsmiViPvkTnEzmgx2GJ2QpcVIZHwYEk=
X-Received: by 2002:a5d:4534:0:b0:1e4:9d38:2d4f with SMTP id
 j20-20020a5d4534000000b001e49d382d4fmr2665wra.2.1644960566927; Tue, 15 Feb
 2022 13:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20220210113021.3799514-1-alex.bennee@linaro.org> <20220210113021.3799514-3-alex.bennee@linaro.org>
In-Reply-To: <20220210113021.3799514-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 21:29:15 +0000
Message-ID: <CAFEAcA9yGfnO-BtOCAC+GJbezWtawLG=OFkEg=Vyg_GpxENU5A@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] tests/tcg: port SYS_HEAPINFO to a system test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: sAr1AbZTZXg/

On Thu, 10 Feb 2022 at 11:30, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This allows us to check our new SYS_HEAPINFO implementation generates
> sane values.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
