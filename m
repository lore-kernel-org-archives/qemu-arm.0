Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp415731lfq;
        Thu, 7 Jan 2021 08:08:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrpSohp/SC4nmpBGmN/SwMLdHCYdWQAc8Bo/2gY2u8hRCrAEM2TtwUb1K2gXfsVslNm3nF
X-Received: by 2002:a25:ea09:: with SMTP id p9mr14388733ybd.109.1610035734038;
        Thu, 07 Jan 2021 08:08:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610035734; cv=none;
        d=google.com; s=arc-20160816;
        b=fZUanp6lnCDKGJKnhG6oM+VYbniMe7obXoW8BuUvfSaK/kqjX0SVPw0RVUL7OpuXL5
         MGFHfXLg1K2M2pnvtCNFRvys28nR1Tc54TLtVHRBikGNukoGewDU0vxjsKNTmBPF+WET
         ZOy3X4j9eRbnk7t4nkxw4OKND8Kbo1ogXgrUFsLOXMmEYVaIqO4PBXtY2AaRA89Gmti3
         TUo5/btTz/2wvzkEZrbpYLEQHiSx0Iiv8TMbAw5JUPChUMrX5JIeaEPbOzt89fpS9nlz
         1cBzLc1VHQ2pseFjvRAjDNyKnWGgc/PorT77Urfj4YUU5i+N/TEs/A0jy425x6Gdno4B
         nxqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yjaq8juzB3Pr56RMdEXiqpkDQ0Ly57tB+Sk9DxkiTdc=;
        b=c7dPGxRZKp9eKxsVEsFMN3+6WNkpb7DTEEmEVF3w9v/BtQYjh8xDuLl74r5ndgPRbG
         Dtba8lnHb0BXp3VF31qT7FyQJfaS9+UdhVc7iQBzMLPsB5FUe174xKpgWNkqaofAC7Yr
         k12YiN2KIW+S4oaixewovucfMNTcl8mwHYGQAGeZZpBiXtti/TDMKayAbqQYQ3rfiIym
         eH7ouBSoLCIoSm0nx1l5EQVICaXKjPdLLZbILDBkroHK4h7V7mPEDIX7w8yYNpgIWyz7
         VKUGQns8hgaL9MdTIM7ro1Mv9LY/d6p8hc97JNq2V+cZTkGVAHUpQx/9ubjoVWZ1oEOX
         32NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=woXufm1Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si6431464ybc.31.2021.01.07.08.08.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 08:08:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=woXufm1Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxXqH-0005zS-Ep
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 11:08:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXpy-0005wu-AC
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 11:08:39 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:36258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXpw-0001ff-G1
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 11:08:34 -0500
Received: by mail-ej1-x631.google.com with SMTP id lt17so10452850ejb.3
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 08:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yjaq8juzB3Pr56RMdEXiqpkDQ0Ly57tB+Sk9DxkiTdc=;
 b=woXufm1YcY8K3lRBJMlSVegnqyjNfn5CofacC0marvups08ZKUTMYI/swVbTHmL0Ud
 CfZR9sP90jJcMDh74OFiPiMbRzYNHpHaIV/VSMkbOtd6NYR+o28uGnnOpWR7s+DOHHow
 EsasN5rI8P9PGdiu6+2cRBvNbBXjtQEX2q8ISD5VldTvvpkjV6086H4yR0cbUCua13UI
 2TpL+lqvZT5ZKp+JM5dio7AjhT2Eevkd1y9mUWfQqfQaOoaI5t0JzQNuYv7wqED/9ZUQ
 fShyPOFtoveufXIy1ZZ8lBg8oAQbIWRtjpbz3/ZGFDS6uiZ3fJ6zbnzEiBZHTOt0WmaQ
 V3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yjaq8juzB3Pr56RMdEXiqpkDQ0Ly57tB+Sk9DxkiTdc=;
 b=UfoEWgUzL9gNtjOJQTtO6B8yMuOnOz6oQE4mV/6XW92pLKCMsTeA1DRaorwGVXv9Wj
 1TtEBR3SbgsTwuw/Fo8iBYfJPuVXbyHM2doc0034Tzva2sSvPBbT40cKN25ig9QBbdq5
 +IfwI5lBUL8R/fJeRHqPQOtfiBnxhptMo5LXRQMDeHXJsC9nYmKAN3m6EqHAWRXkA20q
 +RE/Yl5s/6QvGTfxlPFjPlxwr688KsTa2hmaR0ShVpYPd86RIu1UGB/md+SfdQWXZDEg
 6a459840ODpoiPr5A+s9ai2iQgKWDyQ8vNGV8P2cv7gP3BTcwIUx+TilEjeuXfr6mpFt
 rhbg==
X-Gm-Message-State: AOAM5324aJOyu8GAiPXNdmydqzOfUijF001XtQd1r5Wfb6hdeaJbg1Zt
 131zaHPFHBCkm3g469Ab2ksLGiZia2Nl72F7ONniFA==
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr6845576ejf.85.1610035711092; 
 Thu, 07 Jan 2021 08:08:31 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-8-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:08:19 +0000
Message-ID: <CAFEAcA9R7k+2H3ZKFxcdaofEQduYH2qObTyw-yp5b7=CUcCeHA@mail.gmail.com>
Subject: Re: [PATCH v2 07/24] target/arm: Enforce word alignment for LDRD/STRD
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /6pSnpMwH20p

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1905356
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
