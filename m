Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp540207lfq;
        Thu, 1 Oct 2020 06:24:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1AAg7UPApB6DX9cuxYUr7PCZO4PcbVC3pZOwrihW6knYw1PEgG6iFIdaXmFNu9XI+HRtw
X-Received: by 2002:ab0:4242:: with SMTP id i60mr4849219uai.67.1601558644426;
        Thu, 01 Oct 2020 06:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601558644; cv=none;
        d=google.com; s=arc-20160816;
        b=uGKr9QpGLek3kBGX4khdekjTk4HS5vnHc/W1ndp3NnF3F7KO8/f3b3X0HVzE6rPa1A
         X80MGIm3YoLJ/SWChySSFGuLaSHBHTxwxMqXs1kJmKMV6G6HpAmHhLKv4TeXNLboqs3a
         x9kqBN9LaEmNWZXPQPrb+GDrTTN7Sm2yx4Ndr/anrWABlItAk0H+G0BPDkzs3AyM34Xr
         VV2Xa/39COMKkoX1S3kcTOhB6YfMNUrzZMUOx8Sg5TAv5vJ6LFjB5wyzKri3EajfaxBa
         6rVU+AwsVG15u1dBbqyieXR0wsO45lIO6SEJJjN90VwKjEMvzla/0nIN4gkMJR3l7JxW
         TRNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=zHI7qboARHi2tlyI9AxH6Bx8et5hE//AielLo6Qqjm4=;
        b=bsOsYGIyE34Jb3EkmW7TTeneZh6w7CpN6kRmmk1NJrYC84jrJrcLZIOPOD3UoP/YkT
         UEdzbwXYjyKBxLW2IdPAyjDleutV/AFZnefL55JDoCFzOuknlSjzUaXfyvx9EoyhItPY
         MMUoN5su9fKBR+wW9gB16dil4I7dOgJA1bo626AFz5OkJjwP1EFZVQMDRJ4Cc6iO3Lgi
         VEN5z2tuVuxM8rI7JWyH3Z9Q/AR0fXoD1TCQnDrp17tLF1eausviUIIzhlL2yVmXONwY
         zV2tYzAIoh+prb/vmsfQQ5HbMdQxER7ntWgv/4tYyO+6OyokbD/tXrVVQW5yJpnHsaTg
         rVNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DSO8DQrU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5si685213vso.42.2020.10.01.06.24.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Oct 2020 06:24:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DSO8DQrU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNyZ1-0005wF-43
	for alex.bennee@linaro.org; Thu, 01 Oct 2020 09:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kNyYU-0005F2-G8
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 09:23:30 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:33666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kNyYS-00083m-Ia
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 09:23:30 -0400
Received: by mail-ed1-x541.google.com with SMTP id g4so5640575edk.0
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2020 06:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zHI7qboARHi2tlyI9AxH6Bx8et5hE//AielLo6Qqjm4=;
 b=DSO8DQrUKUw6pgx+IPySfNOV1U6OT5rS+NMWrdIteLpEYdhlQ1UpWadouU6ElPEhLg
 HG+9MMbv9juU7SXFfLphijUsccAeH5nrRSm/a0oqNzJiZSGZ6Wbcd+5N/Asc5GhDOc9K
 1c2t3LQbLqdY22vahUAkuRyn2twU70W0UojAYTl74y9lnKoTEB3a3RabY1x8l7UU0hAO
 vbnxxtF8ct2qXqirEg12KznxRHRjkdq0E2nOYZ+KYEuZOpoSMzKKNHxjWs0x23mpKajC
 NqosmLURAJicwQBiHSoYVQxphOjYyejZgepyjjjrrsmEBx1CTK8dAUoHHXatQTFSS946
 s4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zHI7qboARHi2tlyI9AxH6Bx8et5hE//AielLo6Qqjm4=;
 b=nJkhkA/RDaRPEZjiVVWSDb5ASf+wxvXUOI2wOd5vHun6FoYzirKJ7FOGXM8YmPyHBt
 kRAr2G4uAwV6jGPpsJCGl7/fosd8G2+veZXr/hQl/abRHsUF0xSDyrEbCsSkIybHAD4R
 SnB1Wk4Rd2OCUagOYt4cUtwn1tlbmkVzy4U2FmPmjJhYtvjWM1zjqUszZpLWIOsOsTB/
 s2eYIStG2C1udKOv6V8uiP57cA9QVhHhkw2CT3Zk7ltkKxqm5nf/V41MnMKjEfUj727m
 QBlxn6MZPDX4MpHJRGNkdPwhVDlwaePGgAydmGHh35YucsxlZ1Rk9h7M8CWGhXyNAajc
 u/QQ==
X-Gm-Message-State: AOAM532vjV3Gh05M+9it8rNZ9DpU6pWagn8o35ZsYWXr5KiFyKpG+brV
 1RWLSEkpgarmFLNkQ/QAfmxZPZPGBVXyeYLGhf8+3Q==
X-Received: by 2002:aa7:dd4b:: with SMTP id o11mr7952006edw.251.1601558607227; 
 Thu, 01 Oct 2020 06:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200921034729.432931-1-f4bug@amsat.org>
In-Reply-To: <20200921034729.432931-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Oct 2020 14:23:16 +0100
Message-ID: <CAFEAcA8HjeRE_ZfHzfZR0rM8m2e1kqPwtbKtb9ukkMTuN6vR_Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm/raspi: Remove
 ignore_memory_transaction_failures on the raspi2
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Luc Michel <luc.michel@greensocs.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vwxzTd6yILSR

On Mon, 21 Sep 2020 at 04:47, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Patch 1 and 3 are review, patch 2 is new and trivial.
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   hw/arm/raspi: Define various blocks base addresses
>   hw/arm/bcm2835: Add more unimplemented peripherals
>   hw/arm/raspi: Remove ignore_memory_transaction_failures on the raspi2
>



Applied to target-arm.next, thanks.

-- PMM
