Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4276012wrs;
        Mon, 26 Aug 2019 12:01:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyYw2A0zwxEPBVh3np22NGJ/RsBtA73/ZVCOoTTIw/7xQrfo1iLJPrWPhTJ5Q0+6iyjnXl5
X-Received: by 2002:a05:6402:518:: with SMTP id m24mr19622695edv.169.1566846072272;
        Mon, 26 Aug 2019 12:01:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566846072; cv=none;
        d=google.com; s=arc-20160816;
        b=qASuB8NUEASH0wMMjsudwPIBM354rUlpb80nVR8QQukeo4lsb0vQNLNDSfDD8nP1V7
         nurWOT1da46bYb4gtIQfoU0nrgf9I7if2H8xSE+G2EcfbusOWtEORYw/RrSCbJkH9fUY
         XCQa3QYJX59ccUSCbpiugTLcYIa6OfwZAjuihq2hBgb5ML8heUzP0hysGgrS9XXEx50S
         bVvDIEulx/mBElsNISi1Wu+65QThj0MHLTVPM5rupqaygczT4xVhwbcb+Ls+9NgYxk7i
         SqCaOlZkoRS1TeJGWlTpO8aHZY0/kA/WoIfqysULyBniyYIlZ2bZw4N67XI3eSwRZtXs
         ioww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3WaPNPiU02r3t7FgLNLHpREayidlTfYT242Ian0tIQ0=;
        b=uEMYnYXDQxtSBBveHe9VJ8DPQO0Hqr/Qyeak5yz3KsPs8ZqwoQawrCGS4dasscVc4t
         292sFJD7dFpA61nHl5yZ/eGgTuJniYbDFCLFteJOa1NI+mVJKNozy7hG+tjlAA4dCVFX
         twIV+igSngRNuwAqP64qlfYMDE6225Cup9foDJe90UJFzWXM6FhiVQrdk39ng2Gc2R3j
         zLp5d+eMUzYdXlKQN6ptGZqSLiI10OeeysLhYXNOKuUriadfkyxmHaAHEa6lfhDC19Eh
         dEKXZAumoq9G9zzLXAzxy9U1dxS+50aJIv1TFuNQg2FDMfVvO0wIwlmiyGUwq4cxMwZ6
         6fKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lf8P31pG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2si5896152ejx.363.2019.08.26.12.01.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 12:01:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lf8P31pG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2KEp-0000WV-8N
	for alex.bennee@linaro.org; Mon, 26 Aug 2019 15:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35120)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2KEY-0000WE-OE
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 15:00:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2KEW-0008H4-Np
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 15:00:54 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35919)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2KEV-0008G2-35
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 15:00:52 -0400
Received: by mail-oi1-x244.google.com with SMTP id n1so12965607oic.3
 for <qemu-arm@nongnu.org>; Mon, 26 Aug 2019 12:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3WaPNPiU02r3t7FgLNLHpREayidlTfYT242Ian0tIQ0=;
 b=lf8P31pGOfvXnyk6lOVkAO64EB9cJFwXWl1dKGC7nnyAuYyISSMX7c7fdvQoliVJcF
 ZBCm5Di95kmkGnHiVD1oy7uB7KGr+Ps2F4Z2qwrELk/BfT9X6g2zRESGsChXXCaLsw2w
 3nBPapAxZmglh6V5Dz2lfjxmoDv0KONlGAJnZBqi18ZTlEseJXlkx7bDPgGj9o3mLQSa
 lIpvveRZsLxK1LxwShbRZf8AeFvoRSJM9inyQP93ivg+21d/W1+QlVHsw9CmAeuPEDOn
 SdbpTAXppMjPd51URF/vQBnji1iZdVHj/JDCzz/uU8XhRcBeJO4zv/hRuTt19Ud44oRf
 S8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3WaPNPiU02r3t7FgLNLHpREayidlTfYT242Ian0tIQ0=;
 b=l8QuAVQyN0km+uq4HK6qpuMib3GCCsKMoqHfMl87hIi6vqhZMR6Imve1pdUJriAHUw
 r+00UATMQumRU82YHu39LQ494L29vvLRW1AUTt2Nl3cGHQFRHRmbyx1to1Nz7Su0orXb
 6SOoeGzR0kWz38lsQizGiJF+sFA24gTJOvFQXi9x/QH0HJ2aNNRXnOXJ6jDxAE1AF5wB
 7Z0JIUv3IhEqBv3mFhIPDM1wW7/Kyo9ykEFQRPhlRkdXl0bnEXpr/EUO/f/MtjV0t1Pl
 dPYugaYggoZbl2//sgyQwBC9IP9fwaCwfv08+tful12XsFKwmLfSg8orU8Ymk5SyZS6W
 +oEw==
X-Gm-Message-State: APjAAAVYKrnwod0uzeu/ovW5SkXDM7FX6f8nRxxBoVNMmtuptlz24GAF
 7w8OJ1e+aEH8oNCOHSPvm+hNrFEvigXfwl/1qipD+Q==
X-Received: by 2002:aca:4814:: with SMTP id v20mr13656387oia.98.1566846048363; 
 Mon, 26 Aug 2019 12:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-55-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-55-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Aug 2019 20:00:37 +0100
Message-ID: <CAFEAcA_03nRLRhNY867PLBCkTphPL=6tUCKRNEaPhQd7-6mo-A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH v2 54/68] target/arm: Convert T16 adjust sp
 (immediate)
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
X-TUID: Ut3fBCeUYZpv

On Mon, 19 Aug 2019 at 22:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 15 ++-------------
>  target/arm/t16.decode  |  9 +++++++++
>  2 files changed, 11 insertions(+), 13 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
