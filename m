Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp264377lfo;
        Tue, 2 Feb 2021 08:34:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmkRacZP3gmulFTk6jjgjOlowjqlyhD6Nnurf2w6XLJZiQZLPbGdp7r84+LCzhp3xVkSUF
X-Received: by 2002:a25:c542:: with SMTP id v63mr14121052ybe.83.1612283675344;
        Tue, 02 Feb 2021 08:34:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612283675; cv=none;
        d=google.com; s=arc-20160816;
        b=fgATMe5QL/UP6oyr6aN/Y4uEXCMqy35dxb+eNmGt8PRhe3Wd4s5PzDkMBAMPElAiRP
         D/K4QtoWkzOFjDq0WW8gPN+nh+UeLFqlXWsmya+DdSBUtYjwf5KoKlmS5epIl7hbTS9D
         4NqFjb5lFQlw32TEwyeVx8kmErtBuRNO0RyA4cl47lpKi7tj3kqm8omueMifHcyFIRHJ
         3vGtBShXMoVQZekJuGpQcIuxcCDGVcVh7F0HFQxr6bi/meQ9/ckHJY6yqE+whXph/ZWG
         +5eZfgIdsnIA1glUX7SguL4et2JxA7ES4ndSsLft0gRY2xUBQTqA4PyCiqSeLLzMsLHe
         FFlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=/i1b0ULHEmtngJUztz+JovHxBsNAZ1WiZtVCUw7Vp7c=;
        b=AEiVYrKcvvl+nktWRotwZ/rsTW4Bm4/qz4tG+4VHQs37tHCZchGfR3ucfaDWW6PEa9
         hGj4DdV2x6t1kLV4lRcrX3izRlXIqM1M87XfzHKBuNMFAmKypPiZtqQpWLE7QDJary3k
         Zb57yqy9pFYNO3accCDDjAEYrIRpR7fO/R9bya8Zfv2Nrt8AZb/H3ZbqdtfZ+9ZTbMw/
         vQNccGR26XsUFjd2RfTtrQngS70pRFJE/aI8bdNrTGMJAryLoBoMxez9q8lSeD3Uop4E
         GEICG1tfEE1CVTRPojpgoG0iA2f5NFdMguYt/vfScPsdurOUB1TIRr9bOfTF9p7NRz2a
         bj4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=o39brbmk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n65si20373543ybf.455.2021.02.02.08.34.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 08:34:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=o39brbmk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6ydO-0001sp-6m
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 11:34:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6yKM-0002LP-TV
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 11:14:59 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:45773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6yKG-0002nE-A0
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 11:14:52 -0500
Received: by mail-ej1-x62c.google.com with SMTP id b9so11227307ejy.12
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 08:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/i1b0ULHEmtngJUztz+JovHxBsNAZ1WiZtVCUw7Vp7c=;
 b=o39brbmka0rroBOCbdxY5xoYONerfbRFKamSphsg1TJYT4HEj36O2txmPQ7ty3eNTJ
 NRvKQgJsExNbA3uO4VpB0YZ0A6WXpmNHwf240/jYud9LCET52N851QzeQPQMyY2WiHCs
 NbXVlU2TaS7XMRQJqUF0uHe3ioY+Ze+ZLMJyERHZQIZZYKDver+LMg+O+oNc0lPLFsnG
 wmSqMOGB5tx5A+VSa//FNvPkTyr1j0y14tiN3HOzkcaSWBmBI5rHDPSPZUraXEiqGh5J
 mCttFvZco4sk4WIpw9TNqrDiy6zsq7sOdfGWsXAF0Dx+hVLD0oZ+bjAJrbft226X0PKO
 6icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/i1b0ULHEmtngJUztz+JovHxBsNAZ1WiZtVCUw7Vp7c=;
 b=Qyy54WRTIZMPHMEKmcKc5NKsKvRZlkKFXGKhfm8WPZwaE1PJluKMZ8AnJxVaOKsiw/
 IFaHv7oIGqVQQ3p3F6+oBRMxImsSaMC+ZC+qRtQOeR5Sp0ftgwE+VTBK8oA0P/Qfy61y
 o9fkO8g7gaA992QrhEW5pBxo33va+OWZTzljk8zrn93eOph9IrB+LzT8Xcoq50mlWyBa
 oUG/YT35pFdb3CHzDxZ4oDAxihhjtAVbUL/QMpCPdalRGNt5fkaprCa2qYCGchatSEFN
 rIAvIXmkr/DUJwIo7v19rAAZESkVohUtYxHns3lZQnKOll7Sxd9T/LLw1XDnQGGBRAPu
 J73A==
X-Gm-Message-State: AOAM533C+GBQGRg9rof3Czs13t6PB7zRUytJmFoSmfabfkAC5TsasBzB
 E66Ho195v9kd1rVFUpfNkDaU8hMy2iIrUVoSSX/y9A==
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr23365374ejt.56.1612282486549; 
 Tue, 02 Feb 2021 08:14:46 -0800 (PST)
MIME-Version: 1.0
References: <20210131164406.349825-1-f4bug@amsat.org>
 <20210131164406.349825-5-f4bug@amsat.org>
In-Reply-To: <20210131164406.349825-5-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 16:14:35 +0000
Message-ID: <CAFEAcA_A=ishoh7UR_RMEXSsJHJu2ks3KePdeks_QHUi9fPLTg@mail.gmail.com>
Subject: Re: [PATCH 4/5] target/arm/cpu: Update coding style to make
 checkpatch.pl happy
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SNDe7hwPkk6s

On Sun, 31 Jan 2021 at 16:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> We will move this code in the next commit. Clean it up
> first to avoid checkpatch.pl errors.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/arm/cpu.c | 12 ++++++++----

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
