Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp3563882lfc;
        Tue, 27 Jul 2021 02:19:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz7/f6PW5h2YatGB8adxiF9UwIb7HyJ8tjk6Sd1gqXgTsToS45BIdW/MxftBQf/UCeKp4D
X-Received: by 2002:a25:255:: with SMTP id 82mr9233580ybc.212.1627377554619;
        Tue, 27 Jul 2021 02:19:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627377554; cv=none;
        d=google.com; s=arc-20160816;
        b=m8Mf/weB4p270oRfOuRAvUQFOKXpqhQJdX7bt1RDsyNh7VAiEzOc9fXYgnf7ERlI0v
         jeOf0wwsz56F1okgTPVjp1gYDJ8/gcAof+JsRTPj+6JfPKlSno5hWofBE3E4Azbao8Xj
         V0vUNckBTAPQ2dPzG298Zgl1ycaAzbjLGsE8v228//oBBCJ7AxC/2dSP+4zXb1WImBrc
         XQZIHx+78kLQBBSfRAwcA9X39qdwiD4XqW7BzBg95+FvsBxFT1rN9lPUfrH7C8qHHhBP
         3HG79X1AxXnlAK+S+/Mw2YIPNNzNYqyAwOjfZp29A0u+Lu8f1H7jonHJzwGz2KwhakfX
         /PAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=peTq3EUlBydrgfKap+VyP4eLWmc3Zuk125IpO8u02Z8=;
        b=QQh3aQIfIRLIlTXf9r9AWiOgeoZpZPByK+Dc6JKKe9viuEKfJ7ROxlfD5XN/a8/++R
         Dds0V03V8w0+Uwvcc6tqXPJkZc96ytfwF543WuQbtJInx2SAu6sw5Yyj3EKvpcSKU2VS
         ga5SEts8YYaJSR4of2d14AX9wWW6/wZkdbNit0z6n5T16Z1mKZgHFz8KOoDv3YGundk7
         jVNTrn8UNQ1MfmQfYkY1KUL9pwKWtDYkHTxu7YyCMJPfrKdtQRUuiTNxrULmu7wqRXg+
         MgV1CJE10PtQXMvkhRP2zsAgInvrVLhtH5c00EyCRTTJzwv8Zg61zBKEbJGpY5wLWmzh
         mvIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=heGxfIdo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7si2197964ybh.469.2021.07.27.02.19.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Jul 2021 02:19:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=heGxfIdo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m8JF3-0005QN-UQ
	for alex.bennee@linaro.org; Tue, 27 Jul 2021 05:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8JEt-0005JT-Kf
 for qemu-arm@nongnu.org; Tue, 27 Jul 2021 05:19:04 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:42691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8JEl-0003DV-0I
 for qemu-arm@nongnu.org; Tue, 27 Jul 2021 05:19:03 -0400
Received: by mail-ed1-x530.google.com with SMTP id p21so7329033edi.9
 for <qemu-arm@nongnu.org>; Tue, 27 Jul 2021 02:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=peTq3EUlBydrgfKap+VyP4eLWmc3Zuk125IpO8u02Z8=;
 b=heGxfIdobrCHXGSDzgigIjFbVNJ0wdSEFxKOe6enu80xQd3CNmFxCVBvAhHApK4+Bx
 G9YFtwADL6YpKsp1kbg0ocVbsDSBipY4kK1u/BN6HO7vvn8pdFZq5BmTjfaZh0+D94JP
 YwC+POSbP4cppsRUd2bSSMvBCCMwEQHEIE0pEMKuPXylfRKNacS/gkYuVcVsdX/F1C4P
 MnOjibvAeDdmqegzT6YzcGibrFD4E2WUPc5mLf3d9e4RufzwgfRnQZMOiYltiAtHVw9n
 9VTk04PmPFzJwa9A08areSkNGVQLKtl56vWu2AqvW5LDHQcU2+J70RQoekzaMvxFiePc
 o31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=peTq3EUlBydrgfKap+VyP4eLWmc3Zuk125IpO8u02Z8=;
 b=OnchNFMQH1Eh6Yr6H1G6bzgsEuS+MVPeE1QzxNldrRchxIo4+Ug9jjX9G6fr9NHC5d
 IdQlaRn1n/LybWVMilo8EBY6uQR2sAXZtP38Dp9iIP4yfBvj0CFf+QinkR6Zs/x97PCm
 8WDgW6rX07kBU+uLF8rNmFhVyFp6fKXGVzVWHM2T5UQrGqviXi+w7TDlVdMmw3+U+ENS
 2k45sIHs5EiYneIW8i2zr0inZ32JTnzw+A+S8zy08zmvEaOd7t4bObBnhWrAtlwCkH/w
 J+AInQX2gWGlEuWJgOxxImUNw8KZE1QTjlrYnSWnx7qZWJAJaEYUR+7vg4mYOxZagyn8
 uuPw==
X-Gm-Message-State: AOAM5304rVX4FOA+E5cJN6qRpFle/FvHV5Q8nE1dAYxCX6qBniO2cmPn
 S2Z69ZrFXDNViVBMrGGKV/yqFKWMXg38Jv7seOSyog==
X-Received: by 2002:aa7:c857:: with SMTP id g23mr26163809edt.100.1627377532630; 
 Tue, 27 Jul 2021 02:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210726150953.1218690-1-f4bug@amsat.org>
In-Reply-To: <20210726150953.1218690-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jul 2021 10:18:10 +0100
Message-ID: <CAFEAcA9M5u-NF9v1MmGctbCh_LMRyhtvLc9yKzuP2SFsgPbViQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/nseries: Display hexadecimal value with '0x' prefix
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tHaNYAfA+mNI

On Mon, 26 Jul 2021 at 16:09, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/nseries.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
> index 906c915df78..af3164c5519 100644
> --- a/hw/arm/nseries.c
> +++ b/hw/arm/nseries.c
> @@ -692,7 +692,7 @@ static uint32_t mipid_txrx(void *opaque, uint32_t cmd=
, int len)
>      default:
>      bad_cmd:
>          qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s: unknown command %02x\n", __func__, s->cmd);
> +                      "%s: unknown command 0x%02x\n", __func__, s->cmd);
>          break;
>      }



Applied to target-arm.next, thanks.

-- PMM
