Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4013984wrm;
        Mon, 7 Oct 2019 09:29:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy8R1cZ4x7YcsARv1tE3lKOUbtr5ZGGMwwNZY0bNqLNP9gWM/u8RmajBrXXjPUNxtqJ5qvF
X-Received: by 2002:a05:6402:1858:: with SMTP id v24mr29690026edy.130.1570465799084;
        Mon, 07 Oct 2019 09:29:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570465799; cv=none;
        d=google.com; s=arc-20160816;
        b=h+vaKJZqdnVkb+ntrqs8NzX/iyT+euKD5t/aiNAGTN/xBOODNSe1odmcQ8Ykj/5Swn
         Tae2jKgOzfE2R1NQZZaNNn9rCEakiP7+q1D/o6V9kMVbkm4KdBJISWcgKHxiNbFUjsXs
         Q6ufG0xEIJwJ+LEumLetE/3Bd1GiskksIwdNheCZFGT9aYYqShtHa6aR6ApIv5DA5CJL
         saUtqzaLcspn1zWrV5Va8MqL5I55nyokbsfZxnIJDX1mBGdw4NR/UeJFV0SBd2vSFjtR
         wFL4qBMLd7s/Zw/5f94mFy3LBGzd/sNuIspF748RixGH0AOovQxH8Y3Jvn90MlpgMwNI
         7TXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=APjVfi5ek3py4tXDArJht53LVorj1fsZu3Ny2nv8cVg=;
        b=b0aaQ/aR9LVf9FSB02vzNhq3Y9ccpq79OgjshJwX/tcAsYrFyFRMQ9KaEylkMaapza
         5xcIkV80uUQi1Hjf2oGYaG3Te7s43Vp+5dMW3LrelxRDPLzIMsTox4Lc/w8z9pAR1oIW
         uI9Lr19SAVw8VDIzgdwfWyhq+aRGlAw3YeQUvUNjxX/mEutxEDigFrdNDTu+l+xj2zWu
         JfziL9WdU6ijYV4maSaKolEOZD4xqYrKi7lSH4deLA57yq9S8gMoiW51OkmufTT2Q0Ls
         +h3rC22Emo7YA8qO0dqoAzVyoGYs0FfQO34QkH5MbGMl67muQyzHyPhSbshNmWEeKfge
         1Ujw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V33LU7IV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9si7392636ejy.106.2019.10.07.09.29.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2019 09:29:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V33LU7IV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHVtV-0003Bb-SU
	for alex.bennee@linaro.org; Mon, 07 Oct 2019 12:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59875)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iHVsc-00036U-U5
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 12:29:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iHVsb-0001SM-Ov
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 12:29:02 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44510)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iHVsb-0001Rp-II
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 12:29:01 -0400
Received: by mail-ot1-x344.google.com with SMTP id 21so11475166otj.11
 for <qemu-devel@nongnu.org>; Mon, 07 Oct 2019 09:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=APjVfi5ek3py4tXDArJht53LVorj1fsZu3Ny2nv8cVg=;
 b=V33LU7IV3vG1CEF9lSS63LdyPc2BOsbDKZy8J5tHVc+/+bIGByvZwH5hRqmGPFuxiA
 OTVXcGjtZQX+qlrJ+ZR1NGbREZi4/Dd6DtyZefvBDWPtm7R7YnDi97me+UHkPwzwzi1W
 zBomjDNx1bHztKgrGlfPFYV7FVhLD2dAPY0DB3EMlbOpwIREeW7iQVOJ+Xd1LRgLMOrr
 QgaddqDRGdXRmiHkkhEmR4726OsUfHNtUKPoTyF6u2fDvjDEQiWtnJIbrirB2Gcaefd7
 +jzQYeMaYCGT83+WyBwrWvTSV7dzFqDEQ7wLZX3RWpzPXKr/5YSMAYfjkiJKQOeJffa9
 RmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=APjVfi5ek3py4tXDArJht53LVorj1fsZu3Ny2nv8cVg=;
 b=BjqZ/Czk/wtkgovcGkAbnObFGCW9+70KciIEf/CXMMBRnjSOnk3FnhUtcZwbt+7bpd
 TWoEkDqakJk1/1jSOQCDdyw85oHrLVS9tg5ymr2GseKvTG/MYCADDShuANKaS+APKWWZ
 6S2EMLQVik4nAo8uRXnOlBQLJnMMhW+e4TIq285rASihwmmcTGQlZhfcb2gYClrxUET8
 E2wTrjnGGwxBUfUlKwN+ph8ccLJnKWVPq016tV7ppnRjgGv9XkOoHNReeKd8pDu/KusP
 z02zSmsK7B9BZp7OZ945ImYRvHgiMobXvjjxGPn5Rtz5Qm7330JNUmxDZWLQMxtFysCG
 7cLQ==
X-Gm-Message-State: APjAAAWY35Y/DjMlWgXjGGpxW+ufjKQ9GvliYGiEZEPPhtve6QJQAPJ2
 YZIw5YW2Ehv7IC3LCvaQhxdtM0GkEYeevA1J6KeZTw==
X-Received: by 2002:a05:6830:1357:: with SMTP id
 r23mr21878846otq.91.1570465740656; 
 Mon, 07 Oct 2019 09:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191005154748.21718-1-f4bug@amsat.org>
 <20191005154748.21718-2-f4bug@amsat.org>
In-Reply-To: <20191005154748.21718-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Oct 2019 17:28:49 +0100
Message-ID: <CAFEAcA8ME5U5=rNLRSvNx7LmanqHhn_KWj6qtgym_=W1M9WDoA@mail.gmail.com>
Subject: Re: [PATCH 1/5] tests/boot_linux_console: Add initrd test for the
 Exynos4210
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBCYXNzZQ==?= <contact@fredericb.info>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Evgeny Voevodin <e.voevodin@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Dmitry Solodkiy <d.solodkiy@samsung.com>, Cleber Rosa <crosa@redhat.com>,
 Maksim Kozlov <m.kozlov@samsung.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HPHlt+scZ438

On Sat, 5 Oct 2019 at 16:47, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> This test boots a Linux kernel on a smdkc210 board and verify
> the serial output is working.
>
> The cpio image used comes from the linux-build-test project:
> https://github.com/groeck/linux-build-test

Thanks for putting this test case together, very helpful.

> +        initrd_url =3D ('https://github.com/groeck/linux-build-test/raw/=
'
> +                      '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
> +                      'arm/rootfs-armv5.cpio.gz')

Do our other acceptance tests download random third-party
(ie "not a well-known distro") binaries for the tests ?
It seems a bit hazardous for reproducability and trustability
reasons...

thanks
-- PMM
