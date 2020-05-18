Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2999645lfb;
        Mon, 18 May 2020 05:42:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjnMv/R+JQ1RazifmMYqWpt2AlvulpV5Yelkj2HowL6tpyJRPQjkY3feeRFhkLJMtVcHPi
X-Received: by 2002:a37:7143:: with SMTP id m64mr16561336qkc.215.1589805762800;
        Mon, 18 May 2020 05:42:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589805762; cv=none;
        d=google.com; s=arc-20160816;
        b=AL9LSqOtI9caXxj4VP1VQAGrd3Jzp/UOmVswHkTuERUf+1PV0x0XGKJlDggOUOH7Yk
         K+Uh1gv6RFIvFp76UHfgKdVe3RHxSB7U+sbevWOAL9hATDSD63BqY5D+FoNeKiEyc50+
         xrC/OMwDLSpdWjWgABGJi8TuXnHQHVcv9BaomurbQaTWUclVe3Ya5GBVhdjOppn7ZDeF
         bTtYPfP4o5POAEkThGabmthPYngpYoSKT1u04Sqah4MRpKxzhlh9VCPYMByG7blS1nVp
         iCWEtKzu+I7QsHvsAvakLrifwC4cJbKlxAyJ2mK9GIvhnXUIOd9j3u6RiO5rEcgK4Jfs
         hgXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=JtBtE3nw27El8VWoeJ7zSYWKXQECO0bpQV+zh5rOwjY=;
        b=gaBLWfSHX9H1aH5JlzIuG6TizrUqH70qdlN3V2VJbu4oyAbWcvW4qUgBAGiDMBbvW0
         DtilqPjOWfIW1wGKs4dIR7hxLC5Wmo5RYDtNLtIiE96wAUfhdyv7JX/V0VYhXFCpVQ4N
         lMeutPPw+62FCYU/opuWAjeaaxLhPYjCfBbWk8OBthy27IUocCGTLJ7dziFj3ow4rqt3
         +KdT96wQF2x8qY9tteXK6e90NYNeLklqsjGtv4qcpfw2uWrr3xcXl2aqSP6LgH7mUOi3
         UxrwoA0c/jE7i5/TzDdCkzzvuFNEKerIjZEn+TxoLaFzuEDwTrpt/g+uIk58+a9V1qDb
         TOhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yILxsa7b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h194si5552649qke.344.2020.05.18.05.42.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 05:42:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yILxsa7b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jaf6Q-0001gY-8e
	for alex.bennee@linaro.org; Mon, 18 May 2020 08:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jaf5z-000103-V9
 for qemu-arm@nongnu.org; Mon, 18 May 2020 08:42:15 -0400
Received: from mail-oo1-xc43.google.com ([2607:f8b0:4864:20::c43]:33659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jaf5y-0004dT-FG
 for qemu-arm@nongnu.org; Mon, 18 May 2020 08:42:15 -0400
Received: by mail-oo1-xc43.google.com with SMTP id q6so1997967oot.0
 for <qemu-arm@nongnu.org>; Mon, 18 May 2020 05:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JtBtE3nw27El8VWoeJ7zSYWKXQECO0bpQV+zh5rOwjY=;
 b=yILxsa7bQrRoII2s2M94XNarz+RsQN8KAYDiK04dWhOlZwqUT63SlnpSz4yyP1cuv6
 qSMKgupJVmuZ+M+N73m1fzPheqmJox512ecMu0bP4X3FWVvuiun2eiJSGgQAIf727+vl
 wl9FrzLd8ShXNe+u5TrCeWtynsgnomEOJDipgB/+g/5yER8QxPGvoSBDBO2T+/mfWHG0
 cvONHEhz2f4ksbdjncr8psNOJni7yCft7KVuQb8K/lMS1ojoMcpPvY1dI2wLeyqXfq1I
 Mi7AHEzSK0+HjQDHAdqujtWZZjcDCY05IFDDJfOytYe+rxltJ79eIHW7+qtZAgyNgO87
 50eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JtBtE3nw27El8VWoeJ7zSYWKXQECO0bpQV+zh5rOwjY=;
 b=sq7FMNFQ8fkDCtLZup+ACmXRKbfRhdFgsdh06SBm33MRKyy9k5QxqG+B4w/N/BvnFt
 FEAscjGtdnvhQRg7c+ZVeJXbKLVxp0fi0s8wp37EXDQrZ77w0NQsRa1enVwkUNTtAn4s
 VAuVOfjP4gaAqVZjCKeuue9xSTg99v7H8EcjiakqKCUD8CNY7tGfxTagtMxSMmKMwxXS
 HHqhHciXhDjRZPvdNsRMxWEBQ9EjCuWbpgGJyOWGejEIuWmcPGwZnCDbc/W1OFSIhkR0
 JXtRD+0WSt6RpD5ppeb5N5Qrder24fCxm6CK/rmF0Zr6mg3PHJxp04V0l9EYlCdvcPJ3
 iHXQ==
X-Gm-Message-State: AOAM532fKzRh4LloUMEVcu72nGuSwseSuehrhKOakGs4Baac7Qk5VGZ8
 6FarAmO9y+nsp2JCSvAPCY6j6ZjuI3GoxEs6o1UKkQ==
X-Received: by 2002:a4a:d136:: with SMTP id n22mr12769091oor.85.1589805733154; 
 Mon, 18 May 2020 05:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200511205246.24621-1-philmd@redhat.com>
In-Reply-To: <20200511205246.24621-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 May 2020 13:42:02 +0100
Message-ID: <CAFEAcA9yKxqYW0fEC87sLPwVACBzbQ2+XS-gNG8-x-VfCeAH=w@mail.gmail.com>
Subject: Re: [PATCH] hw: Use QEMU_IS_ALIGNED() on parallel flash block size
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c43;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <leif@nuviainc.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KKXe7MH53Au/

On Mon, 11 May 2020 at 21:52, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Use the QEMU_IS_ALIGNED() macro to verify the flash block size
> is properly aligned. It is quicker to process when reviewing.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/arm/sbsa-ref.c       | 2 +-
>  hw/arm/virt.c           | 2 +-
>  hw/block/pflash_cfi01.c | 2 +-
>  hw/block/pflash_cfi02.c | 2 +-
>  hw/i386/pc_sysfw.c      | 2 +-
>  hw/riscv/virt.c         | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
