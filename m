Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2485350lfm;
        Tue, 16 Jun 2020 03:26:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3M5mZmswnzieghI+8EsgSJAT0PDVdEamMFKlnN8q1Wuf5sM5n8BU3GVeam/M/FkIpgIDc
X-Received: by 2002:a25:b0f:: with SMTP id 15mr3066506ybl.258.1592303189929;
        Tue, 16 Jun 2020 03:26:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592303189; cv=none;
        d=google.com; s=arc-20160816;
        b=ROI8u9rtlQ0Rwi+Wdewcxvd5v9zVI19FtyS88RnjDoODZEy2vYXupUbFGUS8h4qPZo
         vGP8bM5KrYLDb799hjpGe3taHpLzQIHkEzk/C+Vq/w1J8Q40Ttfxhotl+xIPpDH7I8Xk
         zexyf4WjabYZkaA2gznc5YF5J/3/DfyRLTh8NNonPiKD4YhEe5LEwTLj1XlsVU1hf1ax
         zzW/6ywShei8Oc+Knok4qP2dIEaOPy/zFxOE8AM58LZIOLC2PQ1ssdrehKiDfbxFY8uC
         VFzeV4LejF0xOnDn5ADA4GTA/JxMEXO8LSDqXV4ROtoFrPGcGhGcbiTht1jyKx0/gz3B
         M+zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=TagrXxMco/bVd5aQvDXBMDyoFAwI0Sy4YIAMKuyqlfY=;
        b=MqSrIrgE88iW5bBNRxZ4D60xf2AXIkB9I1g4KRJrmQ4Txb+7mQ+RCkK8KIQSFhxnsc
         uJIXtws5pm/2e5k0rNtNg0wiWPstanmAsQubpzp+7n+Hlf0R2vls9K8Fr5DI3gkXBvI0
         yeQfZ6Ln6wMd395+dBg2d/Dc/QDOmda3tfyFikbgeOB6lrAU6QZtV7m9RWRy9u3ej/LU
         ksbl0TzDQhJoNoYE335K2FbxSThZLrVk2+LaWW0SkF/I7VO1k5wng2orRpkH/0PFg263
         q5z8DJ+1xgS6wPIlooKpre1e+OPYGhVCDbPongWCvsecMPzmd1oh3FB+vnUN7XzWFgqK
         u1Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bEi0rkuU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3si13325002ybl.410.2020.06.16.03.26.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 03:26:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bEi0rkuU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl8nV-0007i3-9A
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 06:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8nK-0007hQ-Td
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 06:26:19 -0400
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:45130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8nJ-0000q6-1n
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 06:26:18 -0400
Received: by mail-oo1-xc42.google.com with SMTP id k7so3977501ooo.12
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 03:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TagrXxMco/bVd5aQvDXBMDyoFAwI0Sy4YIAMKuyqlfY=;
 b=bEi0rkuUhuaCI+t7xE64Wsmq8USacDXNQsZgxl3zB18qbCSPCZliMa8iNeUud6AU5e
 KTGG+LW0USL/EU2xxr/dyMeggD5+5uPzm1ugeK8Pq/IGo52YQYcaJkFMAcV1mh6x3j/1
 7k69lv1TlpRQZDAuMg5TS4E5dAjeoZanQBdSVN/WtyYYrsfB65ruYGeJbY+wW4TthDzn
 H5WgNBPDHGapRtHmCBYHeF1Fea0R/U1KozJa9hLRBq9BLcFl5lmg2BX0lFR1Y17zgVb0
 f7EspWvggErQkbgUVD3hysMB8iH9vJO6IrE+INuREzYG+a6f4/wImsapQ0wfaZDUCJZJ
 nlzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TagrXxMco/bVd5aQvDXBMDyoFAwI0Sy4YIAMKuyqlfY=;
 b=K5OMKs/02EJC5PJNKv69Uph8QYtcHcFUCOxXAcLEe6vzTBRplZUClrnbj39oVM7Lik
 NiRN4bKSSQeniwcBdn6W8ZqA7OtwUs6qZTSaVjV7iturOu2skeCP1D+l+qH29kuVDKwt
 vNDf+CDF5WD13u38xIu/3tCXypDxLuq07C0gUDRcP8uKIpbsHbySTfCDvocMgN8Rec1Y
 gZxB7MZIkek92yqLXEX5v/2nzlPxcq0q+6XraD/Vubt2SsWIrU/+LaWKegIpRMjBrehP
 CeGs7braMOlCh6M6/HFb87UbpsKMHRzIhW+bySrL8dcjI6FyHZFmISl2wyB9OY1G4fB5
 /suw==
X-Gm-Message-State: AOAM531pCc9M7+eWYSGffphs5eBliP/UPu8Fa8n/qeahthnzLPZwo6so
 vDoJ+Wm2Qc5wB+PRm0CbYqscesBmCOfX0fZ0LKP8pw==
X-Received: by 2002:a4a:a20b:: with SMTP id m11mr1813539ool.20.1592303175800; 
 Tue, 16 Jun 2020 03:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200616063157.16389-1-f4bug@amsat.org>
 <20200616063157.16389-7-f4bug@amsat.org>
In-Reply-To: <20200616063157.16389-7-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2020 11:26:04 +0100
Message-ID: <CAFEAcA8HKmMpgZMTuL6PSQNd2gy8h8HSvu6GwvTy8_h93teHjg@mail.gmail.com>
Subject: Re: [PATCH 6/7] hw/arm/mps2: Map the FPGA I/O block
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zbEaotyzVSL0

On Tue, 16 Jun 2020 at 07:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

> @@ -337,6 +339,11 @@ static void mps2_common_init(MachineState *machine)
>
>          sysbus_create_simple("versatile_i2c", i2cbase[i], NULL);
>      }
> +    sysbus_init_child_obj(OBJECT(mms), "fpgaio", &mms->fpgaio,
> +                          sizeof(mms->fpgaio), TYPE_MPS2_FPGAIO);
> +    object_property_set_bool(OBJECT(&mms->fpgaio), true, "realized",
> +                             &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&mms->fpgaio), 0, 0x40028000);

AN385 TRM isn't entirely clear but I suspect that you need to set
the FPGAIO's prescale-clk property because the default of 20MHz
isn't what the AN385 runs at. The FPGAIO model's default is written
to match the AN505, which is 20MHz, but AN385 and AN511 are both
25MHz:
https://developer.arm.com/tools-and-software/development-boards/fpga-protot=
yping-boards/mps2

thanks
-- PMM
