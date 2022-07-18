Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1250644lfp;
        Mon, 18 Jul 2022 04:38:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vhPGWIdgtUTHDeRM0snzfFZjYMm64KN2FmqculVWeRKW53DnaYruzMtZZ6tz/r5yaSlAAh
X-Received: by 2002:a05:620a:4507:b0:6af:348b:85fe with SMTP id t7-20020a05620a450700b006af348b85femr17137371qkp.629.1658144323887;
        Mon, 18 Jul 2022 04:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658144323; cv=none;
        d=google.com; s=arc-20160816;
        b=jnQr+McayYBhRgN8fHWdCSTYHgIEhA5diDIlfoddBASHEotexuOVQHj2RemmbRFD19
         WjKPTt+6LA4VCghRMtE+/nfbu7kd6zWNnluvj7vqbrf9dPGdmrFi01jQ7K2/+mrCiQ8p
         D7zHFYJjzhGip0jJVcuxLKUCkB/8si1iHhpwpGNWW4vHvBce8dxE8MzFyOTiNtxYs7NI
         4BEEs35qVOewsrLqNfSDmfxDKWynWmXRjTqYQJRITx62QkuSIa32BDOHe2mkdvRrCE2h
         oh/JOmrGB6xpkrspJN22eZyksawBiRZzWlTOhvcOckQO3sqqRRE3JoBpLB+RfYwHjYo+
         g/fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TCBtcHtX3oYQipZUSu5koaA9OW473QyAlI5Upd1su+Q=;
        b=ZKfcdfNQuzd4mB814EZDq7rV3e+BcS4U73WW9SzUvyPgNFfc2G0wnzjKeOT36mQEWM
         CW1SGT9vi7we0mTo1EM6xGnH+0lL494UTplqKV0QKXUvTfwSKI3qoHbTt99ODEC4f38h
         ijCFTr4jdc+hRVQRy/s2/aMsxScvxcJjbYmiASc2WF4Xaz11tDeY0P+pbw8fPCNeNjxK
         Dnqq7itIFV3/TH9oPnS+mkIeTAsxyJBcZsq2YlTSVI3Ub+p0iWIv6H0AC1S2/CLJ9XJQ
         SzLsdZpAtQnU74Kw8qr8UrsXVbML9AyqYS5i37kMe/JOt8l2ZQsrdV/EjQCZ9zrnkGBD
         ZHFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bKRx5R5E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020a0562140cc400b0047305a703easi6683152qvx.257.2022.07.18.04.38.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 04:38:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bKRx5R5E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDP5H-0005Bn-Dg
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 07:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDP4g-000598-TL
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 07:38:08 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:33628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDP4e-0003JO-St
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 07:38:06 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-31e47ac84daso3174837b3.0
 for <qemu-arm@nongnu.org>; Mon, 18 Jul 2022 04:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TCBtcHtX3oYQipZUSu5koaA9OW473QyAlI5Upd1su+Q=;
 b=bKRx5R5Eza8FjCWPcjrxXCqMBfZ/QUmWmrV/pUtXRA1tAwJKV/7ihiJYAdEA8DrvFu
 TVZYxNqVfVGJSEknbCKK8jzYDKX2HxEkUmAxkskyBvQuc1FM504OfhLkIzngSQKXRj/P
 AQiwSupyoLtt2XAQniGSiBJ94Kqh1DoVSSA5siBO2iiHPrYvILn+Sl9doUZNSYznNt84
 VBU2g6FlLnM5U9dd9MUYd0chGhI54+st3n/HvmWIYujRb3LfZENK1kyvFZwlkDBVbN2L
 UHuyadNpz6npF7ayOAtNX6qtg0T/x1GINqoSGoRY/G4k4M2NT3tA14tbmWBiNge78EV9
 b5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TCBtcHtX3oYQipZUSu5koaA9OW473QyAlI5Upd1su+Q=;
 b=3zzG2hCfMgBKmytc4nPmPO/PCRnXh431v6Nrax3oFtsomCBVXzxJtpahpBOj34kzSj
 NEphycd8086FmQjN4AORKSn9MFBMlngZ8rJUjULod3jUhVKTO63YsjU4B1G+aZ7SBBDh
 ddkfLGii+6S7QBdLSnVx+3jvRh9SG3pR0oDwHGMIeOP3JDSFOOIbVeqVNB86GlmmVEaa
 GRsxWKHA42fgxmkBQr+hAK8dXsTnsU2DjffCOYbaR3vcEnfmkPAQWxXfhI8/UOztz0rh
 yJdz8G92NtmMTCAeH5sVNBXhKVQ2zup7MtEMMPfl/o9TByyXJP4KcLpY0G39IAV8mE/2
 r6jw==
X-Gm-Message-State: AJIora8JJXxhayV5uNwdq6JJpW7+2glUAHG7x6fJRUvdXMXsQcRWVghu
 J35Y5mg8fA2v9PPWV6hzUdL8VcugEfylbsB5HCe+5g==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr29436824ywb.257.1658144282285; Mon, 18
 Jul 2022 04:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-19-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 12:37:51 +0100
Message-ID: <CAFEAcA8zq9muMkU5Ex1256qxZhHHQPGWk6HSQcqde=MiFEsSAw@mail.gmail.com>
Subject: Re: [RISU PATCH v4 18/29] Compute reginfo_size based on the reginfo
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LkFzn1mbrVKW

On Fri, 8 Jul 2022 at 17:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This will allow dumping of SVE frames without having
> to know the SVE vector length beforehand.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
