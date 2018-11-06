Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp783472wrw;
        Tue, 6 Nov 2018 03:55:22 -0800 (PST)
X-Received: by 2002:aca:c0c1:: with SMTP id q184-v6mr15794278oif.353.1541505322174;
        Tue, 06 Nov 2018 03:55:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541505322; cv=none;
        d=google.com; s=arc-20160816;
        b=P1MtAVbguL/qSqQ+6o2FJT8vDq1ucz+vK1slIJloLczTH+A/SLrVHwJxLnDZ7SMiz/
         T3LuBQNSjmKuqrCTMW9pRv6NTQ2buWwvR1dormafsFeCb3MdbNrojWyaYBXCU6Bzsfj6
         PsB1SW+iagFIFHl2wktmuP5rx0GroQhB1QwlChO7QzZY9yn9aHSezj3B2rN0NSgFEAh2
         v5QzYgDOMhelJL29U1ddgTagiyjQF2d/YStD5H1hmhYJI2N5ulPjGQqHewQbatbAt2LQ
         F38Jpisl7gBaQ+RrA57gsN4Vo61qcN2mR+6ovfyvQxbygoWD5v8h16SF+rXfxRMMcOgE
         j/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ZtANzfM1XTsrHXmQQ/hAEbHulL0PAcCxEsUJTGCJqTE=;
        b=mi/zdLGYa4+yooqvmucz298SNEzreRsNPI6elHj+vFdTLDoFFG4i6uxpQ9+CG1AmiM
         PuYaGSTBSGSiOQnqLX7/mt4H0Rfcw0gx1beUD7uskX285OFRnzadoi7HzftF/r3dbo96
         GQjG4WC8RaIs7TFIswZFjpZ6b74R7GxzI6VLhZx7VNXCy07Je0Mkm5RbYlyfa5hrUQwo
         VkWR8EG/HFoyAgRX+o/qrfXuqG3k5kknY1m8ygutMnc9Kg+uKaRvpJnC+Z4KVuErjy9F
         SdJ6qtg03yVTdCUBuUcXB1lljpIpvzyr7O3g/5t/qnWoHQGqaILAf2dAmd/WPM6OswTE
         IoEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KnOttKxC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 77sor292195otj.120.2018.11.06.03.55.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Nov 2018 03:55:22 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KnOttKxC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ZtANzfM1XTsrHXmQQ/hAEbHulL0PAcCxEsUJTGCJqTE=;
        b=KnOttKxCT3PNQCHAi85aKYO+LV15w2Bb4ncwwThWGsDVkPWa3a+lxToD+WrsB5rfPA
         qO9+FvOJ6XhJe9f52oEu0mul7A4ldoHW2h5S0QzWFqw3jfsOUdyPG7RjPNxzPgzqy3ks
         +SSbs+F+VbtmP+aPGsc9TFj7KwjiifwLYw7GE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ZtANzfM1XTsrHXmQQ/hAEbHulL0PAcCxEsUJTGCJqTE=;
        b=P63doRE+j73oKL0Tdc3fgSBuv+xbyHZejNy+oxnRdL8ANFQ26X2CDTh1/+R1fBc5G3
         QqXswqfivEYmSNHTqemcV8zMJ7e/zDYIUFncWtHbYfbGQMAuEPGK2MABji1dkruCtymE
         3hXuhWtKGmLVLdzJuN1UyryMslgyXQ9BGzCbtvF4uhIjPz+bDorBTT3PIXUTanfwxMxF
         Xq9sWBKuy2onDjxPozRpT9sheGplSmFFPI51mHwrv7x94V0Yx+irM18YHlmmtWKCgmwM
         0zBGMzvZHZMAOJe01WLeq9fAB0ckFXph87GqycRPZ81xIoDee5Uv9+O8PvFTxKZMk3y4
         inlA==
X-Gm-Message-State: AGRZ1gJaqz/kfOYGWj7ap4m9FzEq9qgjgizeOm6AN5Ixm4iyAq4338J9
	jS/wDI2SY38LvdB2sPoHkZFroqqzgkr1xdxwo/fP23dyffPCug==
X-Google-Smtp-Source: AJdET5cpqZvJSrvLE3gtK8B0CnRbHVxsTxjlJRk3QLRsH1eLoT5MxKjyfTkyncjSgf2gS/b+8Jf94SgIBaJr9oSy0N0=
X-Received: by 2002:a9d:5617:: with SMTP id e23mr4972987oti.151.1541505321786;
 Tue, 06 Nov 2018 03:55:21 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Tue, 6 Nov 2018 03:55:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Nov 2018 11:55:01 +0000
Message-ID: <CAFEAcA9J__5kPwE7P4SwHYmOp=V0fzoGq5BzBKeStytb6W3=ug@mail.gmail.com>
Subject: aarch32 acquire/release vs mttcg
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: uVJdBCI/RcdB

Looking through code I noticed that in target/arm/translate.c there
is the following comment in the decode for the load-acquire/store-release
instructions:

      /* Since the emulation does not have barriers,
         the acquire/release semantics need no special
         handling */

This is out of date now we have MTTCG, isn't it?
The equivalent code in translate-a64.c has some calls to tcg_gen_mb()
to emit barriers...presumably we need to fix the a32 code to do
the same.

(We haven't noticed this because I think in practice nobody
much is compiling Armv8-specific AArch32 code.)

thanks
-- PMM
