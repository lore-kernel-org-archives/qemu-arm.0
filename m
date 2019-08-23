Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp516650wrs;
        Fri, 23 Aug 2019 05:36:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy+zXnriTskLD5NCW9YxW/KnM7wE2O+jDtYit4i5TJafw7+xRZFG0Y1anpgpkIO4DxV/mhw
X-Received: by 2002:a05:6214:1c5:: with SMTP id c5mr3517792qvt.97.1566563772275;
        Fri, 23 Aug 2019 05:36:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566563772; cv=none;
        d=google.com; s=arc-20160816;
        b=Wooo5wpBzV69guxkghh/IAUv4H+MP4q86w3V6PhHq75agaEU1dODSFTEK16GDKINMX
         QeqXJaeeopMXZO83ph+oVuVn8n03mjLjjKGka/amqpqPnzXBXSq3aalCfUFAhFV+FN4s
         tD6/AcNGwgvoq2J2O6RuCq1jI5PBk5Ax0LDREr6BiDofyUZd5WU/1zD0higjwq/EVafy
         5x9lOjsXCCTz5qq+PrPwNEGKKkcM5dPIKOBEwUWpdrsUB581kpLuf+3BpYz6/gSZxNLx
         9dQUydfEEEnd49Xu1rhuJpek0QtdT0Px0exiEkx6dEoBpZ6gtqhsNyxv9oe/o/RwsB+z
         +8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o32if9KIl7NyCZWNh4NVIxXwCu4ZcDKquMI9BUjQ/WM=;
        b=UAblGgCkV/5+LTb5PB7/ak0kZM2BXHuwUWQbCGNU50ibWEk6YbzOMAugNwXF49ORC5
         bojQYDlD1ZrHd3QsBJv9GyenNPkjru0F4EmXO458v2yF/0nOVlo5Ib8rPiOlJduvyfmg
         DE6MdlmpzO6FwLRNUJDuV7bpn940ivbckBfCtF2dSfzeT5Qc5bMNmcoRPgpWjczmGqmm
         uex7ICwxHrePbDFNxiPkTXAWl+y67y6vt2NA1ZzGD3wYiEQE2DjnOfg0J346y7qTG8SX
         nHn9f1To+v6q1NRXXPSWqFNEXCQb+SDLIQIC04ZI+qW2PfMvoezSy9xW2D5r4b3SI83n
         yLkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MNhxXKNu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 30si1710795qkr.234.2019.08.23.05.36.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 05:36:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MNhxXKNu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i18na-0003od-TW
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 08:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57703)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i18Zz-0000s1-JI
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:22:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i18Zy-0003lG-KP
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:22:07 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46958)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i18Zy-0003km-Fl
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:22:06 -0400
Received: by mail-ot1-x344.google.com with SMTP id z17so8513265otk.13
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 05:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o32if9KIl7NyCZWNh4NVIxXwCu4ZcDKquMI9BUjQ/WM=;
 b=MNhxXKNu0B1DFMyoivCMUQ8jtZ7YEBIBFjMEoIn1T4voa7emDSco0OHIPI5yWhQo3t
 ZQOTzy9x2/23UpIDHhmByi6HqpUItmOuhyubEz6pZhyhBo7dkRCzzmllnR+OmsTN00VD
 iirIUSl9G2u0neDpzS7DLiHaDT+iRmpaqrGJq0n1O72FuPhaxteqeGJjo7D+sFCqHME+
 g6R6lppba/aaQ9IyS0Bz32eeUNaRja9tSRvo+A7MUcnglgikftrYPBkcyKYP/yF9XMR/
 aGwoYA2x/+0sHSip4MxkqaaapNzyJLIQiCTzZGke2IzOmh4j3jqReRPZO+9R2GqQoaA4
 3COA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o32if9KIl7NyCZWNh4NVIxXwCu4ZcDKquMI9BUjQ/WM=;
 b=BKU6JeOigxHX6txaGZl1R/75Pha/mzhID0viamCNk+FtzmiQpy6NvsMPJdYGvA8B5t
 rZfoqKG21WlC4gnFxQqmbry2JS6mNCjexvK0Wa7IolXTTBcDsfFIHodBsoNM2eeEYw5d
 vPTsCbm2P8NKhWnx3XoAOwFV83DGJt5UGPZavE39T0S2b5y4mxj/0rGmlwOc/J0b1hDs
 3e1DTIbjCtJSchfBw7MT70z1sBfjdGYDp9/Y2DqcdXAl3WqB1bIK6ObIz5Uyw/smB21Z
 +p7lF7alSUlzjuRw/Tmuzz9ZryW0kyFapXJCQRXEq1HTKeZm64K9BKmpR3etBlv8a6va
 Ezhw==
X-Gm-Message-State: APjAAAXdGRDsvEOdu755HLC9G84nzd5eUUNmQxNkOS476OsTgAMLzEPP
 lOOFnzTeBSmGmlVUCsm4t0r3QXeVQKawZPfCfN0+ln1L
X-Received: by 2002:a05:6830:1015:: with SMTP id
 a21mr4059140otp.232.1566562925964; 
 Fri, 23 Aug 2019 05:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-12-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 13:21:55 +0100
Message-ID: <CAFEAcA9ac+uwWQ5ETj+6=UM+E4_18p38ODWzdkFiRJEF3Spx6A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v2 11/68] target/arm: Simplify op_smlawx for
 SMLAW*
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
X-TUID: QK4SoplRmkdy

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> By shifting the 16-bit input left by 16, we can align the desired
> portion of the 48-bit product and use tcg_gen_muls2_i32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
