Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2705505eja;
        Mon, 4 Mar 2024 08:45:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXBDyVQSLz0yINiPbZFPFB19dj3Vp68cS4QlodHjDeMFcMlteFuEGasEP3iQln6EvMJT0yyayI0ELO23ZmeYacbuiNr5SlK
X-Google-Smtp-Source: AGHT+IE/ThrLZtFWoHTaIHI8RRV1blnViJqlSnrHhOCJ/lAAymNjvEjqXQHe71lfnkUxguWYivkz
X-Received: by 2002:a05:6214:11a5:b0:690:7261:29bf with SMTP id u5-20020a05621411a500b00690726129bfmr3923891qvv.8.1709570728275;
        Mon, 04 Mar 2024 08:45:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709570728; cv=none;
        d=google.com; s=arc-20160816;
        b=CWkd9iYqZDC1ym5nG5SHB3+BTz//hVMgpnq2Km9e+iSvjs/2A4vu9OuAuHGbF5uIpD
         Y/GbS54W151VkKcUjUpNMpbGzxGVB/l35l3fBBtpHptVmLGz4qxYh2xP8KVnWkPurXMb
         PXlCRrSc28MDFxl5ZWp3S1fYoqNFtd2npYXx1i6MedvefDKCAAuiXgdtsB6EfyaLZbJF
         6o2vi0dD/+TgVGhabGWWyfTQiatwEW9JbqR56ekKCEyIJO5ZchIvlVeIz76r2bIFWPTA
         9hOVQaY+5RPUlMRNOYaI3s5HmaUleSzJ+xc3VNadnoZGzcB1PMyruHStXFTJjasteD4g
         dynA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=kRoFfZS6WhZ4JpL4Bamd0JVsZ/xh7vi9fLKC22s7ctA=;
        fh=9ysWp/yGlXQqacARTa2wOVtuWoHCWLAh2zEP+gU8sOM=;
        b=wAynkYsLfDHXdXf6u25j9S0aqgtIXopgSaIlKJI9CEofQS5ln0Eatz9k0hLCmLUXub
         SCpAqmqry4Y8kE3BEy4/oYRyHm/J99zxusUeHJq/eLUCP2G+qE8Je40GOe5VD/nO7nnD
         khEJD0DHYl6EgG6WmCZPhJEjSWmh+PpSJHMF37GQdm+GP6atJpRH9xrxB8OK6IJ4cUYC
         ST/oKIwa/PeTrnaV+knt8WvE4VXtAVIhTx1kUNre5LpnyUISQnUlwMGLZYtYR02SHD4i
         J8embCcHDvZ1/MyoLi+0Z3jZEKDpCoqZxpMuLoJ/fb/Kf5KlBzSf1OnkDZPhTaoTWTzY
         t2jQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sgk4p/U2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if11-20020a0562141c4b00b006903c84591asi9664362qvb.491.2024.03.04.08.45.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 08:45:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sgk4p/U2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhBRD-0001bA-Oz; Mon, 04 Mar 2024 11:45:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rhBRB-0001YK-Gt
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 11:45:13 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rhBR9-0007CH-KX
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 11:45:13 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-563cb3ba9daso5935035a12.3
 for <qemu-arm@nongnu.org>; Mon, 04 Mar 2024 08:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709570710; x=1710175510; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kRoFfZS6WhZ4JpL4Bamd0JVsZ/xh7vi9fLKC22s7ctA=;
 b=sgk4p/U2iicNE8qSbK+7cGj3F+Px166E4JLuoF2o2o7XlOvDsiF6Bf2JaqxpZMXPii
 iF2fML/3DAulLZoZvk2FRiqVX7wcBoMBR8foR4RSBdR2/VTs65/U+z1OmyE/KPIH+HCl
 u2rT7oNx1oq4MTBZq0p3DtUOtw2p5rXNVNW6pGa1WJXz5sYBdmIteg3sCT5mNReQQBEX
 Ow/lVWNT/m+oC/CaoN6GwqpmG56SebHtA7TrFqD3E1qMxYOLSJ2JLJYwRUVzsnMy6iJ1
 htb8T832dCN460WvodgQT6B8DCv5m4xGZAipp0T78eOT8ebW4h0HFv5RDKWaN9Lyxkn0
 R21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709570710; x=1710175510;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kRoFfZS6WhZ4JpL4Bamd0JVsZ/xh7vi9fLKC22s7ctA=;
 b=jnyfsbMe4d/Qjrks23E5IJxj71n/wfL2DTF7FmysMwGhgHdHuqEzNDVT7kt12d7vZv
 Y1fULJFgV3/KTDrHv8aZuUsL6eGHzeDcUV5HW3W2CMydN+tbrOtd6RNevQ9bIgrsscFF
 7nQXToT1vQuNIdQRNJgpSgiUlT3/aM4LfDKibw55f0aREVW9ZL620n5bkN6mw7/TTrc9
 y1BAFuhMt5XYFe+wAe5a8GXLGnfgwrOGzMOGDgUP8SKUxjSAC/E+GARn/nyBSXBZJUJ0
 GDvIG2jI4UGdP54+qxCCwwyB27NsoDelJZV7q2mflo31HwZw6Ul2LMpTydQ5yeclinBd
 NtOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOXp+/a7qaldk2DafOKx5opYoVQLT4Nwmg36tFwRSEvVqN9p8ASEugzLY7XOFmwifbbSN2lDx027QKtb2c3/AZV7Fp
X-Gm-Message-State: AOJu0YxK0SrorWqRWIfRG9U/GUvQJXvr9XhAbr4UTjC9xvKyGcdXHbnI
 +ADrrDElsP4u3/wQqtcXF2reHQvmPCsrJ1rr89SIQfZtp/LpEYpHHEPPIKa9bxvoRsTDSIhHDrf
 lT+U0aH8zqKVhJUmshQLJI3gXnChimKNFBdoYyQ==
X-Received: by 2002:a50:8dc7:0:b0:565:7116:d533 with SMTP id
 s7-20020a508dc7000000b005657116d533mr6199844edh.6.1709570710006; Mon, 04 Mar
 2024 08:45:10 -0800 (PST)
MIME-Version: 1.0
References: <20240303140643.81957-1-arnaud.minier@telecom-paris.fr>
In-Reply-To: <20240303140643.81957-1-arnaud.minier@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Mar 2024 16:44:58 +0000
Message-ID: <CAFEAcA_f2MJ4OxO+qyev+kUHMDoniT9P7seUYzsni-xeac1eTA@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] Add device STM32L4x5 RCC
To: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, qemu-arm@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mx8ouNExdIwU

On Sun, 3 Mar 2024 at 14:07, Arnaud Minier
<arnaud.minier@telecom-paris.fr> wrote:
>
> This patch adds the STM32L4x5 RCC (Reset and Clock Control) device and is=
 part
> of a series implementing the STM32L4x5 with a few peripherals.
>
> Due to the high number of lines, I tried to split the patch into several =
independent commits.
> Each commit compiles on its own but I had to add temporary workarounds in=
 intermediary commits to allow them to compile even if some functions are n=
ot used. However, they have been removed once the functions were used. Tell=
 me if this is ok or if I should remove them.
>
> Also, the tests are not very exhaustive for the moment. I have not found =
a way to test the clocks' frequency from the qtests, which limits severely =
the exhaustiveness of the tests.
>
> Thanks to Philippe Mathieu-Daud=C3=A9 and Luc Michel for guiding me towar=
d the hw/misc/bcm2835_cprman.c implementation and answering my questions ab=
out clock emulation in qemu !



Applied to target-arm.next, thanks.

-- PMM
