Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp677689lfp;
        Thu, 13 Feb 2020 06:32:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqyAuA614pgyzxQwycEeVssmx5I6HP8qAQVokO+EQIxp9bjj8KuFcrlyDwk7urRFqiqZlnrb
X-Received: by 2002:a05:620a:6c1:: with SMTP id 1mr15672216qky.419.1581604376650;
        Thu, 13 Feb 2020 06:32:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581604376; cv=none;
        d=google.com; s=arc-20160816;
        b=T7pd9L44Kxj0tQnaranHLxSFT+r6zGZciXEP5ZC9eiplTxv4qNg9X0aARMoBK9fHit
         t1Lv8tZC38ZvgKgWE+eA4CdG0Cyi2gUIlfbpQYyFGqXXcPvQJohKuVhAsUxaaOqDClxK
         i5zbjaZYJ5yAAZouVM2xx0ABRTfMJ2ZQP24uxaspol18fQfYLte2qTiKqScH94xNiHOm
         bE9gdCT4Q2VYnCHoPjWQTTYJm+ZlIxrKCTx2OENtCx9Wl64Lica4tURB/FfSPWYT0uZM
         /NR7gsz8D+ZmFjTOPpvT52/pIZKQMNFpHR805prhXpa5giy802ZZH4jfGtdPzUYPdM4X
         9bgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=rpXV9U62+VKnRjsUU3C1pXDZ+Gj0GT24368tKNi93XE=;
        b=ov162TbllFo3Q9+YMDaZ/ttfS18NWNIwyu1LMorJR74VQ9939wHaznopaJ8yWXePli
         1oIyF4YlUxJSpWowUTsRqCTx6OUkFGFs2dFmqrZkj9Bcu7jA2kfuJgGsISfL4Dq/z9/e
         FyLPS2GUVn2PDHUAACv7L0lMwymvlaf3JoNbBi5KVrGhVn1xJHQ1LUm2AfnbqdsXDTLx
         UlzbEUiir/4qhFOXyggHeMuuSSgjdiEjbwIRKK7qurdb0DiNULAFWO5RXRpfO1pcGOIu
         sOI2l4YxfCJCHleU7tq0D7GJyv6idQcNvqUIdbshgaQA1NVQ0IaUjq6Jcb16Jva08b2L
         3gCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LrLI5oS3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8si1008711qvv.57.2020.02.13.06.32.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 06:32:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LrLI5oS3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2FY0-0006Un-2r
	for alex.bennee@linaro.org; Thu, 13 Feb 2020 09:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58266)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2FXZ-0006Rx-5R
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:32:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2FXX-00041G-Th
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:32:28 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46848)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2FXX-0003zP-OA
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:32:27 -0500
Received: by mail-oi1-x242.google.com with SMTP id a22so5908968oid.13
 for <qemu-devel@nongnu.org>; Thu, 13 Feb 2020 06:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rpXV9U62+VKnRjsUU3C1pXDZ+Gj0GT24368tKNi93XE=;
 b=LrLI5oS3jODXKyrFQ0QGgYalnNzDCUyMJYXfa98EAzQeGLsUO042TaNHF6eZgYldvW
 dGCgCeGJerOM4o9MvWG3fC/lmO4NZs/sjfT7L6OI00F64auDnxVXqEOw9i4P7GV0y7Cv
 sb5c4hcWLrhAdxzK/TDQhO5WKslOB3DomMtjQsxl2pKbWbqPMHaK1JIwbN3wdj0BqYL/
 YcfrWxRHIOMXeiDKEU7oU4nkiLBggr4DX7F683qYA4RJsPun5U3yKd0sKteBLz2QFBjC
 DizRMq8OzYzgoEUIJ07yXKKDRCWp5bn3+qUSmyXzukIsBcPPAHd8pT74n76leaCNKhwG
 5Jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rpXV9U62+VKnRjsUU3C1pXDZ+Gj0GT24368tKNi93XE=;
 b=PJmKVm4YdnE9wEpHImY4PeUKDqjoKyBuCEGA5yOtGLbQhBzfCv33bCJ2UIxlCzXyoY
 m5defE8Hufly4aahPMPAaTWdQ820DR+slu+orV2hLv9dNeQ/mh3nL5R1B3zk1llSGaMF
 j23IRNlZEnPaxJmCDr5CCGq0s0e3W/Wz1yzNTxlP9UXUCANpAt/9fsgjSXDQQk7PQ7Fc
 bc75Z4vt8Zun0azle7byhMzDkDhbwTyMnYYxM6QhYcyJw9hiMJJPyYzVHY5NYt8/1VDD
 KRm8WsKmEJWUW5xifVVLEQVkELhukWgXcNU3geYDSY4cv9RtfLC5V53g408ciqyIruSv
 GDGA==
X-Gm-Message-State: APjAAAWjLz8rWjwlGw4F9sZgZDm15HGxyof1yNFjX/7YHz1tjZCQEMRb
 pwE/8iE+8bc47euXF5o61kSn1EgUDVgv4kE9akVZ8g==
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr2983155oic.48.1581604346681; 
 Thu, 13 Feb 2020 06:32:26 -0800 (PST)
MIME-Version: 1.0
References: <20200208165645.15657-1-f4bug@amsat.org>
 <20200208165645.15657-13-f4bug@amsat.org>
 <CAFEAcA8e4NqwKPM6qx=vKm6NOz__=S90trhUuhaSNe_yJ8GeXg@mail.gmail.com>
 <0d72fad3-3eef-66ff-2162-f0c07ba01ff2@redhat.com>
In-Reply-To: <0d72fad3-3eef-66ff-2162-f0c07ba01ff2@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Feb 2020 14:32:15 +0000
Message-ID: <CAFEAcA9x6=Hxqwjacc3ZXUJy1P0xxKt-oqiZf1Fm=f1d8f63xQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/13] hw/arm/raspi: Use a unique
 raspi_machine_class_init() method
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FKkbW5tCC5aR

On Thu, 13 Feb 2020 at 14:16, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> On 2/13/20 2:59 PM, Peter Maydell wrote:
> > The natural way to implement this is to have the .class_data
> > be a pointer to a struct which is in an array and defines
> > relevant per-class stuff, the same way we do in
> > bcm2836_register_types(). That way the struct can indicate
> > both the board revision number and also "is this a legacy
> > board that needs transaction-failures disabled?".
>
> IIUC Igor insists explaining that he doesn't accept anymore a
> ".class_data pointer to a struct which is in an array and defines
> relevant per-class stuff" and we should not use this pattern anymore.

Huh? How else would you do this? I'm kinda dubious about the
pattern this patch series uses of just stuffing a 32-bit board
ID number into the class_data field, to be honest -- I let that
pass partly not to hold up the series but partly because I
expect that we'll need to turn it back into a proper pointer
to a data struct soonish.

thnaks
-- PMM
