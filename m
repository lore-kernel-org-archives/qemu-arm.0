Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1821456ejy;
        Tue, 20 Sep 2022 07:25:16 -0700 (PDT)
X-Received: by 2002:a17:906:9bf4:b0:76f:73d2:be40 with SMTP id de52-20020a1709069bf400b0076f73d2be40mr16530651ejc.90.1663683915887;
        Tue, 20 Sep 2022 07:25:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663683915; cv=none;
        d=google.com; s=arc-20160816;
        b=abH+/NV6bH48UstHvXKqx4p0Z5YolY5XN3qdXGcgdfkh/RGKm0gOT1fPMKSDiEHIdv
         DtwE7r702g3VsZUA27bIyZXTqpLGp+aKTaCt+x273+b7imSNhtDHsuAQ9miPJuAoiAXC
         LP6r9Wx+4OsWR7bIX51XWPejXHYigW0jH3+phVDVwtGUwaPgbseYuVnadGIMaVcGlQu1
         AV8CpfQiLTDvFNpwtY+eFsh0f9Q8J5+DwBG8rILbuQTjFyqhP4KWjY/OBjFCzobQritR
         wy8NkiQfXpudBfkk1mKwj18aibyarFvpQwgeIqGA0v/o5kzFADcRrDEDAPy9LxuRhp9i
         fRkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M+8L8SzZpemaKFlZyuhLb5GP7MSQidC3VDDSN/Ye0k8=;
        b=qvflcg9Ilh08Wb38GLuXDTnjCuID321MGrm6YFEChDr0pJpVdo8+/FZmh8cfdTNykw
         fh8GKLIVAbUXzqdNXgnPsFXz149nK7Do2rgCBrukDSrDGOl/yDaiVFv2QtFltZ9lntbQ
         YE+EKLOjT48Y0UfmamVnxumFU0mUHh1T0kwEKp6QDYGm3PpqwibsZ1XSqgaHN+iXXzc2
         NHWlxOL2OLCDD3/mivbblfmwiMICfhzpT33PA8q/c535AuAFqJpTP9lX8G7Zqgkr9QBV
         dJn2y1KeWkH0VQqaknHs+V1cAvebXDNHQ5X1NUSdKAgEIuQ5nM5SEmypRQZqSAQd2jaf
         rasQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bJC03HEe;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h7-20020a50c387000000b00452ce21b1d6sor142975edf.40.2022.09.20.07.25.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Sep 2022 07:25:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bJC03HEe;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=M+8L8SzZpemaKFlZyuhLb5GP7MSQidC3VDDSN/Ye0k8=;
        b=bJC03HEeDtp/TJHSfSsCUBf8eDhbNCvJ8UMlO+pVYqWf3B9s13jEjv2doYAE8CvhJM
         0H5k5vjz5660rc6r9KOhAkwgNuZtQQawJNmMfcCjsCwR62zv2W0FpRGG5vq0+dSCAtIU
         2fXn0fVVLH/2xWw7A3ZBdzbZSaUHmCt0dhK275GXRODonhDOG4Q75bHfnI3K+wcSEGbV
         9sMrG2p1NC4zs2gj4Y05ZL6xEFaFVtst6FqWSUd+/viy3rSKBzeheWNdQzVAKeuieoy0
         2QeFN9rq7u1+RdUzSWTRqiQ/1XEiYCHW1j/pCOX7tYjcEAvYTYLtmLpXMdM094WqA+Yy
         GvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=M+8L8SzZpemaKFlZyuhLb5GP7MSQidC3VDDSN/Ye0k8=;
        b=ztk9ANDMUKPio72qRiIEdBFtRYTfJeTHCaXHGLwhYjtqz3dyH7f0YjN/nxu6nOijcE
         nlgQ067pGszmC/1ryfDQruYPyrMR6C456JPTTsJBR8dzGYErf3h87c3PDA8CDXNChigy
         Ap5YLA3DoKFWnANbRGBtsqiN8j5vGK25C1xGstbiK/5qROzcBFl97nLC1kCOI+zK6yBg
         pUGIVhftKL5GsgHDQr1VId4NplaYVmjeXQEz02QmJ8APoluz/nvNjpIWG2dyXgOLw8Vp
         osS1K2QgBvn/JtC0MltYMoz3rFxX4QdYa5s1ZOO0CUhMthLfFJpXKkNxD3EjfWWqBv13
         SnJg==
X-Gm-Message-State: ACrzQf0XXrGjMYRHbDaSPntIz0Pbz3aDTO/sGFpq6zrA+s2CwDBvx9ZR
	UCFpMUO/EbvSEKQvYcKU23kxtL/j9ckfP7C5xtlp8zdZ
X-Google-Smtp-Source: AMsMyM72+7jrejDpYBRlKJT4ifIxfByCvUaQ3MJb90gAUUOeqsefxx/L+gICczIOHMZ0uMW7ysL0Le8tlXE6sn4MXnc=
X-Received: by 2002:a05:6402:2787:b0:451:d655:9269 with SMTP id
 b7-20020a056402278700b00451d6559269mr20380442ede.375.1663683915582; Tue, 20
 Sep 2022 07:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org> <20220822152741.1617527-5-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:25:03 +0100
Message-ID: <CAFEAcA8ViwDaXk-eVYyBtJTT2gw7odLJnxSH3JtBK4Yd1OYmrg@mail.gmail.com>
Subject: Re: [PATCH v2 04/66] target/arm: Use GetPhysAddrResult in get_phys_addr_v6
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: kjUreaMTuzTa

On Mon, 22 Aug 2022 at 16:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 30 ++++++++++++++----------------
>  1 file changed, 14 insertions(+), 16 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
