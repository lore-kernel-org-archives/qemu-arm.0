Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1832745ejy;
        Tue, 20 Sep 2022 07:44:06 -0700 (PDT)
X-Received: by 2002:a17:907:a0c7:b0:77f:a9d2:9be2 with SMTP id hw7-20020a170907a0c700b0077fa9d29be2mr16704777ejc.352.1663685045959;
        Tue, 20 Sep 2022 07:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663685045; cv=none;
        d=google.com; s=arc-20160816;
        b=fPPVrhm0/ttgfTR2e5J6Wl18D1L58VQCsUit6R6RRB5EmGnbwXw9ba1nn/GYMkOawr
         6TOmgehTyUITrm/PdYeC+Jmbe6Wdx4312NF95fd6WC4wsdOo3zN/Ydm3SBo6j+Ouve7E
         RSOfqpMDaTRQbIwatcNtItYcM+FIIT3kEqM2O6hwjsMntp+gdWLYGzBB6qcRH9b8sbur
         NPDka91nH8RZGePdh3W8BZ09j0ndLKlbRXaNTykm/WdqjRDPppVxc1Ek/j891eI0PniN
         08mfGzjAamP/4/Of+qiSmLkE66PYOD+ot3ZDPfIbzFdWcX+BM0HYqXwBjoup/RXByqHe
         D+YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sIGndOLger40GjvWKmega4cCEBRPt+S3y/MvazD3NaU=;
        b=anyake6TOj/Av4O4kcaqdckNFvZxzeTDXjv0qtqFoZLJlfwaPCfShzmfTcTbo34aQ+
         5jQ8J4lKDL/E+1lkIXvfUnI20H8aOp4ulacWmTNI/o6JXLa3Zw+9r2gcq8vxnfLwImEu
         zEUsBbfVNiXnRAO8Q25m6pwo6h2vs+XQ6Z60II7fsqal+sd+kARZfqPqZmcbX+9avslq
         Vu26r9+c/2uqzPtjR3xSS7j89OWVfpE/NKW8Tz2/fps3s2KmbOt1bQtgU1Dy1BNCthKg
         Gl6FA4XyBU2WJjoKhAQl4pLPK8hXx2OLxqNTn00FBGVza9p4b0uayOCOuehV7z3EiPaH
         LQ0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n8UHAuw/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i15-20020a50d74f000000b00451638cea82sor174606edj.36.2022.09.20.07.44.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Sep 2022 07:44:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n8UHAuw/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=sIGndOLger40GjvWKmega4cCEBRPt+S3y/MvazD3NaU=;
        b=n8UHAuw/sorsvy65Mz9bnBc7SQSIwSswUnNRHq+BE2I8IXnTajeWR8/nTgA6jnXf+5
         egAp8lsR1s7AfntAFmj9FQOiwdet0X7mWKZ26REPq3N/YcllbwpUGbk1hvFnCq8+9uEL
         kJ6t7RRZcVi/UYlhbZNY1+bhDMh1faOj0/QP7fzg2ibBm/4bqzCxZvtp8NEVCn33jOCm
         QR6ooCKBs6/4evGGJ3UfLN0qocpiLug25VQyrVlgd9aFnj0HpoWwC6Mn5Q/TY1Qv63DY
         BO8aapAnX3VzoNi7qZsRSe7OK9MPW44jq4mzVZu8NK/z/Qf37jXHLroD2rRfvJy5OQwy
         v2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=sIGndOLger40GjvWKmega4cCEBRPt+S3y/MvazD3NaU=;
        b=hQbbi3ltUZlE6aUSI5h9Qrsx98wpZmqVcM5ZwO8768SPV8xPdYUlWADe3FFucfIn0S
         vUTCEnwSc1VZP5TKP2hs5uSWTCApKwEjDAQwWhGFtQW26sFTOrlhpgW6h1t6oNYcgQuO
         g/xe8TkoSSQM7lQ3NJ+/nqPhVP80JSS/CXF1zV8dTKiZArHS7G6m7lHaYj4nuSkV1my2
         AsQ63lN131DbtFqLg/bkuqMehXjXlhgr+zb2gYKfWQB4jqyAcplSHC9nfT5j2l/7Pt2q
         7aJtV/dKmXOPA8vDVqR31G1YVETqbBjlIZmTNFl7xo07XaP4G5zqHYCNxdyeXqmRZiQN
         YeuA==
X-Gm-Message-State: ACrzQf2RLXbQoT7FSOLnp7trUUFgI3jUWprcOjCFuUVMGFMgd/URhOqv
	KPIqcm+OBLIffX3nTXtg7jx9BOgezN7gr1HIVFK+7QYq
X-Google-Smtp-Source: AMsMyM7p7lfIbQvt6seA1VezTL70wUR6ZC0wD0pTNOvDYw/9GUUfxcoyCOvxuiKF9u9Kzrr0+gJp12HEBFZLeKB30kY=
X-Received: by 2002:a05:6402:11d4:b0:452:a97c:cd36 with SMTP id
 j20-20020a05640211d400b00452a97ccd36mr20779715edw.53.1663685045724; Tue, 20
 Sep 2022 07:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org> <20220822152741.1617527-13-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:43:54 +0100
Message-ID: <CAFEAcA8sihpyZo+YFK-YSScM7fmfhe98f-+4Y7yK4WvfjRrjbg@mail.gmail.com>
Subject: Re: [PATCH v2 12/66] target/arm: Add secure parameter to pmsav8_mpu_lookup
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ytEpRMMZCYAr

On Mon, 22 Aug 2022 at 16:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from pmsav8_mpu_lookup,
> passing the new parameter to the lookup instead.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
