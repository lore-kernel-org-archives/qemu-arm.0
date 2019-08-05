Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4132251wrv;
        Mon, 5 Aug 2019 08:44:48 -0700 (PDT)
X-Received: by 2002:aca:5346:: with SMTP id h67mr10434600oib.55.1565019888245;
        Mon, 05 Aug 2019 08:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565019888; cv=none;
        d=google.com; s=arc-20160816;
        b=TTwQbBJ+SBoB9Ym3pgUHorz9RX7qEEgvkT0GjDhMq+KCj7kq3KWwF6kYZPGWed6LhH
         0jZggU8hC2b10dAHlmfezUe7iW/7UqrXKnjc04Nn+sIOWVPsdCKhhQJc3oRuD7wRZrQ/
         RW/rqUv4JF/VSgZTXY8IeaO/YFqsnnyPBBcyEuFu76RSZMD8ER3yIQyvuGGnuppX0TUM
         ZaCfAs5ekpvGG6qUkY+8/81vO3Xn7JbiPaENvKrMZz0cudtIvI0VkcWZGwc797fUWbat
         RL87Sk09RhFAqw1Y/VX8+TxFuQqf9ktbye1aLgvjNRy0iGBfnRQ7qG0KnE2K3bW3h9dy
         DmxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Cmpr037zZdqrGbQDYy6TyQP+T3AEBIQBH0/WDKEh4SA=;
        b=mzvoR5B9gOnuW/sjElN2ANOGynMcE3V0PCngjvFRZBDtytOG/rw3n88UEiYlHBlzzC
         h/D8VyJYWp7pCCtDFPkgTUGJcAGUwrZ733zU9hvX2zRZFqbNhlfvG2NL/TbVCdb0gjb5
         siFMo/7FFTrQDptqnNVmCkMpwQmK6J/qraKt86UhskGe9DdxkeiUpRNULKjEzisMm7vP
         i/aqmxmnkQjfNPKPwtaDJgdVBr2JpUrtkdLlxgBEtnJTQwxqepS1VO6nhKdzRiGWGKfm
         s+TPKp4VaJqsyuuzAybt64NVtIGqU4TkOIv9o+yY0IEB9PQqyi4q+pj7tj+ixOpJu6oo
         LnOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WiMCEUiX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d184sor38528547oif.23.2019.08.05.08.44.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2019 08:44:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WiMCEUiX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cmpr037zZdqrGbQDYy6TyQP+T3AEBIQBH0/WDKEh4SA=;
        b=WiMCEUiXn1mDQxUW5y2ECW2h7RIVHFyMesQ53egZ77/f80ZwlHHBN2hLE0XqziD7Z9
         OOgislZIm+OLUDSdDr2LwWzaazDKzbax77C843xCu4Av4+kQXH+lYBhR2vpIb4mfYD8Q
         LaMgNnekuS21xy5hRv9Ok6/KJvJaD1cdvPx7Kf7lDS7ITz5Ua8EB+iusehgGWdGVZSV+
         6R8maZ+E8ZqSU4sxn/OFCK69LlR5ERm+ch/6XBWG+6rRNOAkXwIPvIxYx0KJYtjnBZva
         pY9C1MfgBc+oltIJp2rc0wI+5Mrb8rC4Fs9BMzvVwGxGCKayiGEDQuS2xADoW4i6tdj7
         gbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cmpr037zZdqrGbQDYy6TyQP+T3AEBIQBH0/WDKEh4SA=;
        b=JHC4tjgsFE77fVObsJ2U6W+k2Cpdt/7umPO9xZJMoNcElNkg6Gn1ZwTytFzpjCMhUy
         SPg20Sjt9O6XoMnNIlpq52jr3gb9xO1lQn4zk1KL+7JMliix7lG/5w9G/IWwizBMaOCQ
         a+h7zSgmq2gusvBOGG51nVzpMRt4PUc1pgk7sclBFgelnU3Ah0LCCVjSmVg4cvsC0/qf
         HM2YF4qDkh/9NFWHWk9vLCZS3X91026Y7Ov+dEGeoLl6VrBjp8xC1V8Nx43HdztzVUNK
         OJ05+3d89KiLRoY4bgA8QCedpPmZmvl6N5r4ui3+oy9iyi+j9/DfOnQcEn3U+bEFOJMr
         KM6w==
X-Gm-Message-State: APjAAAX8bifJrkQc7JLoQ5OCD2mDcas/ompkoaB420pfs5SwwWZ8W6Ei
	qy8ee6q1JZP/ou4R6rhuA4O1Hz+NbKqqIYJqYbgl50lwSOA=
X-Google-Smtp-Source: APXvYqzaPguh6H/Zb1GXEA2z7Sn69wZJXA5IJpfXVIEtvYRmhHNlM6mLuZkZTONbUq3Y1zJtf0wsmDbYVpG5ph0lb/Q=
X-Received: by 2002:aca:4bcc:: with SMTP id y195mr10633477oia.146.1565019887841;
 Mon, 05 Aug 2019 08:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org>
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Aug 2019 16:44:37 +0100
Message-ID: <CAFEAcA_JDfN+Njo8J0EhbtECWEW5_LcCVehbxmpY6AX3BLbOsA@mail.gmail.com>
Subject: Re: [PATCH 00/67] target/arm: Convert aa32 base isa to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: nZHIIL/6ygzX

On Fri, 26 Jul 2019 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This unifies the implementation of the actual instructions
> for a32, t32, and t16.  In order to make this happen, we
> need several preliminary cleanups.  Most importantly to how
> we handle the architectural representation of PC.

I'd be happy to take the preliminary-cleanups part (subject
to the various review comments) without waiting for the
rest of the series to get respun.

thanks
-- PMM
