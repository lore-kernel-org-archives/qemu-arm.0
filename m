Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3247767lft;
        Mon, 4 Jul 2022 06:59:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sBkDRF7qwgKLvgtG6Qxml030iCX/auyxLV/MKwS9ay/21WSdq3hW1pWNBP1eI2KlZUc3eU
X-Received: by 2002:a05:620a:288a:b0:6a6:93aa:8559 with SMTP id j10-20020a05620a288a00b006a693aa8559mr20089758qkp.94.1656943187327;
        Mon, 04 Jul 2022 06:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656943187; cv=none;
        d=google.com; s=arc-20160816;
        b=USi4yachGeduPd0FEFxG6pzALBysNfsi6sXRlu8zvJbnrLL6irU7K0zAZeVvrXuwNT
         mfX54OGeCNkh3FE4c1f3smxEThXPE/+v2bQ7VyWS4fnNhvCtbr4X243wPXadv/HlYmQQ
         sQPum4yUM6Sv8XnHP4UWooK98vtY6qgU3QHMp+2I1yS4Vek/MVAB3uAwY65DcNOoJyAZ
         9HMhuPnCuZrPp747EUiydTu/rB3VdDLMOWzG/ISdm3AUoaWmZD+UeDJFlreNzw0XyH6o
         68GFIWUoYxATMs6sxB2C2BKcMqxRvdrtt9k6ZwyQc01QxjysNhnsLxEe/gh97P4FmBPW
         QzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Cy5PWkJsHsCkS/LVxxodmzOuZhACosp9b7woXLOchZ8=;
        b=TLsYH29hecWJJrq2YC34XXMI/1fivZumr/rOds/vTotwepT1LMiDbI47XXSyZz4QLa
         3Q3d9jhICH5kccjmz2lGbVjlQl9pM07amTPhp/rISyfSzDJs7NRaqVKVrecWp/4mJxex
         Ikms+LkUiKCEnxKLePEAJkA0/HHh0/fADAUU7XutPHlIxoWwY04XLU9n1mw70YBT2o25
         7gv0p9BjOPy80OSe8Oq1syONMKFr32fU+z7bx9N95pjNxe7BlcIroezV50qED5TUskxd
         /tGQMsc6F0ivt82WP1wScGM26V7CDZaKUpFwTWSNaKWBRbZ9sCKhYUcxJuZOj0jMsUDd
         fzDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="u7QA/Exm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12-20020a05622a044c00b00304ec9712b7si19976828qtx.784.2022.07.04.06.59.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:59:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="u7QA/Exm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8Mc6-0002YX-R4
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lzq-0003hY-T5
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:20:20 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:41551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lzp-0002Xg-AE
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:20:14 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31c8bb90d09so28199837b3.8
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cy5PWkJsHsCkS/LVxxodmzOuZhACosp9b7woXLOchZ8=;
 b=u7QA/ExmmX0WkUdDX0bOxUwWNd76SRUjFqUrykiScz/9YmgU4UFYLTMIGwmgBgeICR
 RSmVG2gFEVrwLHrgzBiYb9p/pWIwY8wGB98A3+2ZJ77rzPgUw+m3tKeXH+h39k6Cs1aI
 x4NPKU7SEiAy/eK56i5nsAHVH3ttL43iqxC9E+gu6q9xXhXAvPuTNLFw5BHeOX8z13aD
 TDUx2V/772+yxPgplsWGVsTOQKEJS8FE+8K8ut7zkCzOQyYOKTMffJP4vJAn5+mcOhoD
 nVh0mZWSDaIpMwRFFBNP5512OOg88lF2RKcAecNpi6uxzKYg0ii/ODgw+zx8s2j0mzPG
 DCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cy5PWkJsHsCkS/LVxxodmzOuZhACosp9b7woXLOchZ8=;
 b=Si23UDsWJZB9+r+j25kZ8cZ5psY0SMq+BcrMpURz6g0OrcpHCjiNHrD2Q6RgmsV/M0
 1vBlJcA9+/4fbrOvbIhpjEEw5PZ/5h65pccbkgosJ/UgtpHL2PVFYYE+pn6yuwG3Etob
 S3Kli5joAUEnYW0ljD2sLcrHeZ+n5LXOWA7qXkrJtRpQ7KYLW0/N+JHhJBX34IEY+AlX
 umSSPst94VL8bLw5GB9shcxSbJ635sIhVknLW4eBof6hH7zL8j7xQrXDKiivtC74APSx
 W+40a19jiEqYtvBrBr88W4O7C9vMCTt2RHV7weaAXvOK/h6T0dl9yd7ZMbmG3hiNY8im
 EG0g==
X-Gm-Message-State: AJIora/itEWuAHP/7ZL52lzIQHGcZeuYtpPLjk6I1TbT57k+PdxDFY0t
 xoQ7K/SzzK6v+/HNmnt61cAEznqcNIcpAO2/Tgi3tA==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr33810124ywb.257.1656940811387; Mon, 04
 Jul 2022 06:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-11-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-11-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:20:00 +0100
Message-ID: <CAFEAcA959NvUgEqXHyhmY=VYgURzoHz-e6Tsaz7Bq5rai0mGNg@mail.gmail.com>
Subject: Re: [PATCH 10/40] pl050: don't use legacy ps2_kbd_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Gec13Ocp4tSz

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Instantiate the PS2 keyboard device within PL050KbdState using
> object_initialize_child() in pl050_kbd_init() and realize it in
> pl050_kbd_realize() accordingly.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
