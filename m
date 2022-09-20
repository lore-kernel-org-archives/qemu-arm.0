Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1822621ejy;
        Tue, 20 Sep 2022 07:27:11 -0700 (PDT)
X-Received: by 2002:a17:907:802:b0:781:8017:b2df with SMTP id wv2-20020a170907080200b007818017b2dfmr5577230ejb.606.1663684031739;
        Tue, 20 Sep 2022 07:27:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663684031; cv=none;
        d=google.com; s=arc-20160816;
        b=fAVqu2vGJXSg+8Dg75qcfuSEIAI/svrM1siebs3FCVIFdA/cE5y1AiLFiP/IVXg+Ev
         X3UJZuJuTi/QsAdoZORYseJlegBebs8BXA0wMR0LIstuhzc5jMOFqwGVWW6PV330ourK
         eWbVtXX48puDo2J0lVHhtDMjDpLJ7kwf553GXlLlK3A++v6tQ5RF18zko1SCxUUa8PH2
         8LYjvu+Muhti+B2yq/bLZwPocnYubO6Hg0euTwUGxFQLOOZK4Q9/iaQZUYzhpQCnNWyp
         sPDE/QlzgJKQz159Js/gnpXBaveF068T4mUfR7G+bXjIJl/uPLM7kGr1Dk7QZLchiZag
         XBog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ISB7uH9y69aaUzbJW2F0v+3N0cC/KP9DACeWVIh4/n0=;
        b=fZn79nlGDIhaTVgE9+Fi7c2dERRINTajUMqWdWXP2/cweePuJxb92BihiorC3hf0+6
         iH4UqZxAuR+2mJPPJgYiblMAxqCzmHj8hKfLc+Pl+pBkijdDQv6UhMPw8v9TYBHteGvQ
         W1PBHtO0DAIorQGiCCPjdW5E1wh7jb+1nVD8Ww7mzcFrBmR1MouXynNH8OaRgsOlNYok
         jWvPs1aaYXHP3u5gYhDypnTqGWb8s9OdChNGZg2nrKn1bSDKMKJhsYdhwR3m77Zxo/qf
         je+YmhVSzzezdecXLxjy7YML7wkj3jBAOV1wZ4PoRDtTWvNN2yKy0KPv0wb16AjeDQtH
         qLpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nZFEq0kR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gb8-20020a170907960800b007425c04cb0dsor844644ejc.31.2022.09.20.07.27.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Sep 2022 07:27:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nZFEq0kR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=ISB7uH9y69aaUzbJW2F0v+3N0cC/KP9DACeWVIh4/n0=;
        b=nZFEq0kRQbqqULA+dg2YjZbsCZ3KLxwgJBkzkeTvkk8F5J0r9Q/uSdpJh8Lr/UM9cZ
         rfpi8A6TCDV0u8MnWN9/hw7MDxEzkSnuu/32OW8wmPmd4169WKdU7/bPIGUE1r0g7bBK
         /IlctyWxRcRp2r+daTIP7BT6C3xT9TGbxwiKgrQ4h+RMT738arZRMt3CQxzQ2J0QOKPJ
         osrFnyFFvUET1UdxaNDFnHfiNM+5zFBbhuxbU9vxMlgS3RzQGCjS5iO+jeJY0qocM3Im
         FrmrHUQHt3t/Uw6LWTqt6/PkxggQWnXoine480qixS4gv7g9P3Vc7oQ8bF7GZPNhtQHd
         O5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ISB7uH9y69aaUzbJW2F0v+3N0cC/KP9DACeWVIh4/n0=;
        b=6REZfL2l8uEIGonTu552mz5nx47TipdgIg7xBa4mL2+H6aqanRIYsSVJ5EBIFwVOpp
         WWfCbjHgwRYwJCgpRSC1sCjby/12fC+Kj+a14Dy2eLkxYE+y35zx9bHg6xVc16Zomfy9
         SX0VzrLsaFm9fu4Cz/aKWHnhSGgKYRa3mG5qUa9O8ig0TXVx5QONJUSgDk48L/bOzp7X
         kfVNMLZ2Wkgoskn03BDQaHSkg1M+/8zjv0MmLEJ3NJ2liaue7uPq5Pb3Ov1+0bCbz+yh
         ZtfUS2p+ZbxaO5ShhWyDBmi5rxnuyMaD/jxWUGdXQk3bjBIbYbh/Rgxtu6LGaO1BEMVF
         rNFQ==
X-Gm-Message-State: ACrzQf2yq75fJ+8pXPFvnuGcsWRdgC+tppRu07WUOcNzmMd10rk4QpdM
	gOQIoDUCICw9tTOjnk3rv0ypOi93Z3qkCIiHR7B5O6RGkpF3FQ==
X-Google-Smtp-Source: AMsMyM6fXcfdpYstIVOgn57kai6FiXcXx/Gwoo2yziQNlhN+kBd2X+lFyakvE70+E//63qruVOVau08+VVwyku4gTpI=
X-Received: by 2002:a17:907:86a5:b0:780:156d:e842 with SMTP id
 qa37-20020a17090786a500b00780156de842mr16953915ejc.555.1663684031498; Tue, 20
 Sep 2022 07:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org> <20220822152741.1617527-8-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:26:59 +0100
Message-ID: <CAFEAcA8VrNFDOE7Y==fQ0tP7m=f3KOAb0TD4RCOntN_nmKebZg@mail.gmail.com>
Subject: Re: [PATCH v2 07/66] target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav7
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: cqkAQdBCoFVo

On Mon, 22 Aug 2022 at 16:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 36 +++++++++++++++++-------------------

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
