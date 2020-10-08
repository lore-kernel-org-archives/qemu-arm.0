Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1218358lfq;
        Thu, 8 Oct 2020 03:47:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhI6L/GyqirL/+JJJJgG6WIOXlzSJYXL/mzdXCdjG8QebTh+G5K72I+W/uzyd9uJjQOXIv
X-Received: by 2002:a25:b950:: with SMTP id s16mr9277374ybm.28.1602154029170;
        Thu, 08 Oct 2020 03:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602154029; cv=none;
        d=google.com; s=arc-20160816;
        b=VvQ/AeJvgZaFVC++aDmvhdfTeU9KxmEoMFPzkC6e1PRx3vfieOWflAliqB70L1Wh5H
         wgnUYKQVtH+YO7IsUxbAt53Qk68NxrzAEVgU+dR9WK7w8qbakzD3xghyU8av7aRNV0X+
         SRyYMJ8qf3228BATVBCfHJlAgU2JYDnyUX2MCqxXhMreGRvkZuLNQgek1GHTQa3mb2wF
         camOqJ+dVboCBl76U7QC17rK/rX0J6DeDkeSusuff3EN+JyvzbYv7+zSXZErZgLI/Oln
         qAK0CYzGgJv9KsH82yPM4qhTTOBHPmqetYGArEp6QwWkNJhTe1bHfwzZyiBsqqB0lI4p
         KAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=W93pR4c85urxJqc43xX67bIFtgRTfAcBdk2OKlxXVxo=;
        b=AuJa/sVl/FmJIMFh/5OgnUO155qQ7JPbWbNOvkormjXaN+xMFvBa3kxPbPwb6B2wKV
         q6h0rG6jSn3JS4r6vFE41D44a79eEjq7v19/Ta4hBlJI7+2rNsuh72ukp70n6KjCBGsW
         CsNPC+ybhfZ7N8hLkAKAUMzwb/FuS4G0E1cHdK4owR/XZfD7XkSNz2ONFJYDb+p5o8Yy
         7vZJj5bh2bEJ79eGA7whoON08nS4k04l9FnDqepQ3PAZbiZPhLTMI2TO/4jNn5YgUvJp
         29NQfwfgfxsPXtXv0GtX9dkvs3IATTf6plGjq89RSc7fZfJcD+H7JLKv3tfpmhhrY2S5
         DTNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zCpKtmrG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1si409727ybo.28.2020.10.08.03.47.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 03:47:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zCpKtmrG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQTS0-0004cW-Gg
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 06:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQTRR-0004Mg-P9
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 06:46:34 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:34836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQTRP-0007hD-Vd
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 06:46:33 -0400
Received: by mail-ej1-x644.google.com with SMTP id u21so7434325eja.2
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2020 03:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W93pR4c85urxJqc43xX67bIFtgRTfAcBdk2OKlxXVxo=;
 b=zCpKtmrGMZZPbJpJN1BZk5o3L6fMcuclqaOkFMs8PNPo21tUwFToen+jZwUKPD1obA
 o2ipJDW14hoZJxg+QV7gVXcdLV6Q+nBR7J7F6MtdUcluyIzD3Xrxo+NqXNNR9drAx9lM
 4pUnHhBgjXNZaduqcDc1rUgcchNd7pUY1BRFkytntrSYL0PzpoxZIXWk/cjjuLZy0PxY
 vthQAg5hrLvRMWorcPhcdDsXXuarsmDsAuzqGG28iSXA/ANRi/xr4KL0WIJobi60LHbZ
 2l0SnQI5IOR7w/VNOg/o14t6TkuUCWMdbwntxsSe1ZOt+4Bqx+KwO5bfUoOeVHBb1EPq
 NPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W93pR4c85urxJqc43xX67bIFtgRTfAcBdk2OKlxXVxo=;
 b=GnGB86Rq6JcLSZaRD1UkobcyKgDM2zyLoMXDKExCBkcm5hBUhkHyT1yvvE+8Ku1LVv
 JRwMPoxMsLRHcP1O7E0FkQaT1ujVP+xKhBFp3qH9yAGT612QCulTgepxIcH3u6f4YuBq
 zBS8TOil+Y6eU4rSoCBvPbZcxrksK/bct+MtTk+TFWe1OM59+uf3QrRKMmquJg0CY3fT
 YQPLw7khb0XyeacVHCHhzaQOKfi3tYeK93U7uqFZNKtlADg05JmIVekzvrHwwPA/E37x
 z11xk2ZOQVhLE6Hr9cObRhKWPHnD+p3TvBnD0YYK620Z/H1WA2BybQ5smdnVMEHrWL2e
 pjyQ==
X-Gm-Message-State: AOAM532dpQKCc4cR2eipvtNe9bQ0mE6t16buzxc054YYfTqt62xAt+xI
 T5oMZ3POMmwOAJYcccvDWykagFdEM3q6LSeGzZkqwQ==
X-Received: by 2002:a17:906:1f42:: with SMTP id
 d2mr7944728ejk.407.1602153990555; 
 Thu, 08 Oct 2020 03:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201002080935.1660005-1-f4bug@amsat.org>
In-Reply-To: <20201002080935.1660005-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Oct 2020 11:46:19 +0100
Message-ID: <CAFEAcA8uGrkJg35xiDmZBnqbTDLmA_DfeBypZLkjWTx2dANphA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/fsl-imx25: Fix a typo
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ya10rdip83so

On Fri, 2 Oct 2020 at 09:09, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/arm/fsl-imx25.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/arm/fsl-imx25.h b/include/hw/arm/fsl-imx25.h
> index 971f35dd16..c1603b2ac2 100644
> --- a/include/hw/arm/fsl-imx25.h
> +++ b/include/hw/arm/fsl-imx25.h
> @@ -179,7 +179,7 @@ struct FslIMX25State {
>   * 0xBB00_0000 0xBB00_0FFF 4 Kbytes     NAND flash main area buffer
>   * 0xBB00_1000 0xBB00_11FF 512 B        NAND flash spare area buffer
>   * 0xBB00_1200 0xBB00_1DFF 3 Kbytes     Reserved
> - * 0xBB00_1E00 0xBB00_1FFF 512 B        NAND flash control regisers
> + * 0xBB00_1E00 0xBB00_1FFF 512 B        NAND flash control registers
>   * 0xBB01_2000 0xBFFF_FFFF 96 Mbytes (minus 8 Kbytes) Reserved
>   * 0xC000_0000 0xFFFF_FFFF 1024 Mbytes  Reserved
>   */



Applied to target-arm.next, thanks.

-- PMM
