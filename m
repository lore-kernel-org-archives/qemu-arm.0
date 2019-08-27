Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4999415wrs;
        Tue, 27 Aug 2019 02:40:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwlEggEplAiBibLEHxuKv1CX3Ex5Fcog1ZJOg87UkTVNlp4ddQcLVv86BvFlISpYFXFIp+U
X-Received: by 2002:ac8:468f:: with SMTP id g15mr21800557qto.353.1566898826904;
        Tue, 27 Aug 2019 02:40:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566898826; cv=none;
        d=google.com; s=arc-20160816;
        b=CUbSF3QVrzvWeYJLbp0sSXaJch3noUaNcR29jDHKx7DCiZCSWeO/F8Bh+kV88Rwig3
         FLppIcrZAYf7jZpPHmRCYqQ+nM6L7ELPKwpQjXgDbOXRrWitqOA8HbKczvrJjtjmYJKs
         DGFJdXZQvgSv/9qemTO4/kdb0I0fireFWM3mDQT8w8eFpKTAkqmEhao4LLT+kxoEMl7d
         +xiv1xlsDYtHSkeTArpbnWTOHSTO6w2PgCImACNG5BUJ0ckpSz8f1ZSrQzWP50tFLx4g
         DL2kcK5kvFj65KZgUJYRW/3e6DbJtq6FWCg0R5+TTonAcmX82SnHj6Y0g6olULR4h0k0
         v7iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=53esGyujJRuHZyT+DpRlIP9dK5qVt+dzLS4r6AGzimY=;
        b=f4fbp35YLf+rWOHRI5nWkrjiJIlUJDYDuyKMH6+KWdIOiv47VvWoLjAEtjMJIaBKIQ
         k1areuAW/eQBVe2dhPC/liS82BMWPJYJhd2LSRLl5p7sdpYJL6Tx6ZKI+FVgyAMmfSdj
         l27ThQJStUYf2iOoBBu89e/20kVUtHrHvzKcGHK7Wo7JgiNw0jQsGG8w7upzG2CZYp6v
         AIXejRMmSQ7XYIxe/xVzCBDR4LGcZQFFSf3eyCt+OHJcpe9uY1WNLT6SAxtlUGCtppR7
         WRmM3gJSTVrMgO0jgO74gLvOT0wtZhSqhFDwu9XTwGcdlk2SUye0f16BvocXZ7Ui52sX
         GsXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E49CJOPT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p50si10054961qtc.373.2019.08.27.02.40.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 02:40:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E49CJOPT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2Xxh-0002ub-PV
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 05:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50681)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2XxO-0002pe-W2
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 05:40:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2XxN-0005Dm-Vr
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 05:40:06 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43563)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2XxN-0005CJ-PT
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 05:40:05 -0400
Received: by mail-oi1-x243.google.com with SMTP id y8so14423896oih.10
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2019 02:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=53esGyujJRuHZyT+DpRlIP9dK5qVt+dzLS4r6AGzimY=;
 b=E49CJOPT+Sr+e+FwXAssfLIxdPSYIRjmNBIf9H1Dfn53O6OFvPGCXDORLFuumqgNqp
 oIRXmEFqEMwWslupVoK6sdvlBdT4ooB9AwyU3SMzGtbj9xSzx2MxjuoAsIfPE8FItFt2
 CXr59dpaIX/9rxDGiUxnR1BQDXcbqbZhVNx3oUhxqejpkfkh8Sg4M2UY6ZEJ6jkgTpeO
 rLLXAsxeCSN+mMuhC2DMtPyL5oeUcIrRFkBLGTB5k2lbh3XIntsiw7hw98ju6dTBMD63
 4Dp/iMH0d+mjkhT+qh+7/Z5sCTe1KkDO70ExcBVSpDZjIeBiNny5JkFaG1qlJy/XegkS
 suHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=53esGyujJRuHZyT+DpRlIP9dK5qVt+dzLS4r6AGzimY=;
 b=aQ0cMTpaFKuCSx8nY2WK/RtSTehTJszTZtHmcSEYlB8l14PCc8zZvQJeHS9yrN6juh
 K6ogjJELtv0rl3LrPHbpLU6coqD2GEOLD1FW89jtmm9PdExa1H1jdSbabknIj+NRT8hD
 9eMbtzoWFmWVcawDEtQOH2Fd2gdmvqwoxBXW7lYHeDy/xAq8XSCNVqxg0FHOKmXmvHWU
 qsuojjkOj7yl0EyoTBzDHCu0JaN1dtbGFMlTtwFrkzWHeDz7Okx8QMDZeAvcw47Cdib/
 Lao/Of6Q4QTFKfCGUNIyTgi9jsV7FARJTcZtKb/ZybGHD06UUpmvqkSqjUMf3mdgnIfp
 7+HA==
X-Gm-Message-State: APjAAAX6I5GFsVbwvwLh2kVtsGB5stQjNfYv2wA+h385e9mxD1j0YIG/
 wOPd+XAgirzu7mxwkl0lHTHICBRSesqd13phIYYGmQ==
X-Received: by 2002:aca:4b86:: with SMTP id
 y128mr15510966oia.163.1566898804926; 
 Tue, 27 Aug 2019 02:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-69-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-69-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 10:39:54 +0100
Message-ID: <CAFEAcA9dJ_5ZxXwoH3ngRGxzmrkrev1BgjpSz2zBzi23ABGCpg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH v2 68/68] target/arm: Inline gen_bx_im into
 callers
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eXUY6b9K+1AR

On Mon, 19 Aug 2019 at 22:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There are only two remaining uses of gen_bx_im.  In each case, we
> know the destination mode -- not changing in the case of gen_jmp
> or changing in the case of trans_BLX_i.  Use this to simplify the
> surrounding code.
>
> For trans_BLX_i, use gen_jmp for the actual branch.  For gen_jmp,
> use gen_set_pc_im to set up the single-step.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
