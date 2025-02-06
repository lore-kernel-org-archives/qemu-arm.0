Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1628206njb;
        Thu, 6 Feb 2025 07:51:07 -0800 (PST)
X-Received: by 2002:a05:6902:2588:b0:e3c:7c3f:253a with SMTP id 3f1490d57ef6-e5b25c5935dmr5932118276.36.1738857067053;
        Thu, 06 Feb 2025 07:51:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738857067; cv=none;
        d=google.com; s=arc-20240605;
        b=ZVi3BCYo2vb+5ahJ64RXpvxMwR8ME7vACExcYSJcVggRiIeOleHW8outIbhOdHkZ0F
         CZKePU5ku0F4EwjblabPC7M76UGzVg4Ok0wy4JwU4W+P7tpd2aeD+InqlD/X4eGDWMQt
         8nnaHIf/okYiAJEoOQeUvMUftoDrfeyLwLdwOd1pJM7p2unwznPFBlvlDjCF4AaTYsxe
         IuGRKyg2P3ecF9aSrnWUk8yvCgGuY9QclS8E7p/+cJinGOYvp07kBrDse8Sq6S2cXK/N
         vg6ZWE3hL4BNQnoOvfs6uSS7j2GOZ7Wme+LIxrPKzTTGhWgEaCaTNFMLDMFCEaQJ2jpU
         qxIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ASDW0A2tZEwrvkv7i8MRxtiQwCq0H8EN+WLjmcNfDFM=;
        fh=gQjtQK4ozk7tGo9GYeAaWXMEcKCusqNMITJ/TgWJ9sI=;
        b=Icw+Wa1hyfFHDZvR13nByQ3V8M9nF/w51IQx10gj0X/fctk4i0ZMaipFbUdZYdLTyr
         v+KnlYLVOhZ17oZapnp/QSEm8NhGfo5vS6D9czABSs0EpIP975WAKtsAUoFg1+Job1D1
         TsUOmtsFV3ykn00UBnt19xtXQxUZ6NFRguPv8QJBNZoVF2/sNAg2HjU5Tc0TaZN0TmjG
         3m2hizKKdzOqQRIDsE7SVM0KF4f3sO4BChTgvpOrYiY3ZcDGg3chpsnj5ghhEY3+P8p/
         JlfKqIafbcviU0VoYQrt7gZk3/QQQ8tHDp+cFpmlMuBPwxarTNrvWCGDAgxpv24TLSVs
         G0ew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mh+/cVNk";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5b3a440b88sor646744276.13.2025.02.06.07.51.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 Feb 2025 07:51:07 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mh+/cVNk";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738857066; x=1739461866; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASDW0A2tZEwrvkv7i8MRxtiQwCq0H8EN+WLjmcNfDFM=;
        b=mh+/cVNk4+B4mvxhdigEMlwwq412ibp5odhWLmiUpPY4e21YTkBG09CSU8csAHa0pm
         hYb3COcyuyNgYMCc/yoQ+6sNDY0YXnV14SqyXUZ968wcJfXJdyMETs6mYbrCRnT+f+1j
         QTjP2OdtG8T3/SQkfaGRcIUvIgpjgO/qAdfop57YQtSF/qXkToh4T/1p67PyxjshaGZ5
         L5D9giOtlFWx2N5q0WA69ic71ro1/7ij1zo2veLuSMXX9BX7CwLyAzcdCoMRg4xNvVh6
         /92qxTMtZylwCu3+eGHapooDcO9mfeMxp+nQFGaNmK1SrCDVg7rkqNr/paDn+hA/FJBl
         sGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738857066; x=1739461866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ASDW0A2tZEwrvkv7i8MRxtiQwCq0H8EN+WLjmcNfDFM=;
        b=CR4ch7KQEnk/A604SQFRo49d/La9KUtU6xYhooCqHi3mjMDNo7ynGvksfGC4QG5M+6
         UyZ7tjEc8Z5t6Qve1qAe6lzNtO2GRjLS3a9cgw42YOkqJjyOjPwCfLooJ5s0ABunqLB+
         wNTPwOjayLp8RLV9wcp5jYfCKPCgT/kxTM7ZKhvzScBCfFGFefrU+Tc0D2OhtLN1CkrX
         wZgiGARZTqu/HlSNbhUZMmrqbr9XzrvWcBaYpie7i8RGnTuM1Cwkwf9LHs2coGIJiT1H
         MS2FxspuV3T1q4srX8xSg7KJQ8udn8ve/cX/kDfm1jkY7QSkWVxisaAB9EHT6j29f3/K
         xJMQ==
X-Gm-Message-State: AOJu0Yy6CughOlqp+TtoTIn61O+GlHeSLhYDl4nnyT8CrWiReLKX4UcR
	j5jXKbuUb1tcQhcZZ6qJVec01pCIX/Ll15qJSVuH+Lry2vY7R3pL0gQWxe4tIKdfsxnmQkj9d3t
	mPGs5K9N+1X4NIwoIJT2h1dj83XB8gRszbF4in525uac8femOmFI=
X-Gm-Gg: ASbGncurXYYVIUKH9dsafSE1VJXBKrtaj7I4LFMRmU3Wy0u6mPhxK0WRahDEClpOS/s
	9eeDnLnQcl1mOY89itAUVkuYfS76SUUm+7qEu7CiYGmFTHPLYhoKtXhG3zxWdpFKbBuepOeFAUg
	==
X-Google-Smtp-Source: AGHT+IEVply1qiNn7znAT8fQMFvgeU86wRbWjC73n9GgoJ6MafGCxRH+1m00cw4BFE1qriSGZOIZY/VTW8vN2rZ7ZSM=
X-Received: by 2002:a05:6902:2210:b0:e5b:1746:7fa3 with SMTP id
 3f1490d57ef6-e5b25bc6f9amr5963299276.23.1738857066557; Thu, 06 Feb 2025
 07:51:06 -0800 (PST)
MIME-Version: 1.0
References: <20250203144048.2131117-1-alex.bennee@linaro.org> <20250203144048.2131117-5-alex.bennee@linaro.org>
In-Reply-To: <20250203144048.2131117-5-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2025 15:50:55 +0000
X-Gm-Features: AWEUYZmb9iLML0ZpPW3OB0h1I8Pz0Rcl4bMdig2uKDsyMoFyCdpxYC5JLddP9OM
Message-ID: <CAFEAcA-SRrdyeBExuCruVd-CuDdosyQKG98stELvkV-EM9q-Tw@mail.gmail.com>
Subject: Re: [PATCH 04/18] tests/qtest: simplify qtest_process_inbuf
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Hao Wu <wuhaotsh@google.com>, Peter Xu <peterx@redhat.com>, Warner Losh <imp@bsdimp.com>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org, 
	Harsh Prateek Bora <harshpb@linux.ibm.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Kyle Evans <kevans@freebsd.org>, 
	Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>, Bin Meng <bmeng.cn@gmail.com>, 
	qemu-rust@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
	qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>, Tyrone Ting <kfting@nuvoton.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: XHeIuatO8/8k

On Mon, 3 Feb 2025 at 14:41, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Don't both creating a GString to temporarily hold our qtest command.
> Instead do a simpler g_strndup and use autofree to clean up
> afterwards.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
