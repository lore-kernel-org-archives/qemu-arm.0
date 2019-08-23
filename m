Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp505012wrs;
        Fri, 23 Aug 2019 05:25:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw/ifACekijPfDQNMNzT9hDRdF4quuEymakg8wNK8+tUP5z7Di7UEp+2kVk6HWdrDB62Y/n
X-Received: by 2002:a50:9084:: with SMTP id c4mr4117804eda.237.1566563126489;
        Fri, 23 Aug 2019 05:25:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566563126; cv=none;
        d=google.com; s=arc-20160816;
        b=uvURK5mvZbCfd0W7cYq/c8S9a72MbgZlvLyiDZXIpm6UbxDrNEprCZMYC8Aj6AvzlD
         OSDwfanRoxK+iudMFKcVI65gWhAufQs8Ma9dGJrD/BcIRdT14k4mc+HQz0NowV7wuzQu
         u4NhbJsMbAsJ+VAEwhNHoh0Y0wygPxWi2IzD3732LZPzZ+PxlzVOfUM/FuhauEDsXtoq
         o3MCt2w8VkBB0i//oKLqfc8KrSp6UsERNxi0PMJLkv280iks7DXknj+zu3cNdCI4BS5r
         7631FcSZFDeMmU61SMUoOZgM+qN+sjgKo4JPIvrn84WVMJabVaxn0zMWcFGdoY9UvnPg
         QXrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n86ZofvjgI2NDBcghYkDY3qrSwtaARKFLxtVkXzUqfM=;
        b=jzx6nm3yq/rGOccMx0KC/34Hgh2Tm+866zbGm4s5gaJ4ihAAGrVxuOzVt7sQvISprb
         ormRxjPxiX4syKGC4Qrs1odFPnMYBCXvAZbzNyBtNyhetTaYcVeeERQxuy5EneCiRk8M
         0StVENCnH2qPMrv3JZbw6Bo5tc9R6mL2XEHv3Tr2rhfo8VDrXXzvhqONV03qXKD/89nx
         4C2ZS/3v8UxPvwJyDNAOZV9F3LXHc7AK8sPhPVC+qpu0u1q4FGMboTwGwHnSc9cse7Sv
         Q7+Twd5cyHjP2i6th5iuveWMy1Hqnh4IrbjQTSzdKZuLh3jW7RR9tGHystzttvAj9iZh
         NG/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wj6cH2ks;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10si1341328ejb.109.2019.08.23.05.25.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 05:25:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wj6cH2ks;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i18dB-0003MB-5u
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 08:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57450)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i18Yn-0008Iq-W5
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:20:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i18Ym-0002i8-Qs
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:20:53 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45587)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i18Ym-0002hj-MI
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:20:52 -0400
Received: by mail-oi1-x242.google.com with SMTP id v12so6829198oic.12
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 05:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n86ZofvjgI2NDBcghYkDY3qrSwtaARKFLxtVkXzUqfM=;
 b=Wj6cH2ks8YKPuJAfZurdYQGB1q9GDNq7QCUazQLKh0wfQwHLNa3lAx5LSxdbsbW9tA
 CM8FUVX8e4Mqmb1hc1CXRMJwZHwiGENst8/VX9d4Ga+0yMLFAXZoP5ZJqkv0jxGjnWoe
 ZyAir9wqGW0eGS+fN75xGdetcHNQk9+DgOrcFI0bg2mxTz7PoJqJ5Z9D+ES9bmeaqyW4
 cRBbC61OqiWtdUuCrepeQJfRvI6o86gDJ1vzhEqL+WrCwP1e1cKq3J9k07vTe5KGtAqi
 jgj1+OEie3/sDdE5voArqneC27XeEh8n0n2GLILgad/x0NScFkLMX7Vc+yJi7Xt+z8tk
 sdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n86ZofvjgI2NDBcghYkDY3qrSwtaARKFLxtVkXzUqfM=;
 b=SfZMroePMqcXWAOO6EfwXAtGU4zqZ3lMNd9+5t67qFh2X85EeTeeMe3dAEDQuIrJDB
 q5UJD2okje+tEa/WsWXv41UgUJdBSmkp7OIET1OR3JcNPqOj4hjUwLXOrQ3jzWqCQ3r5
 B6nA1csKoPsnNujpuRVoTW+wMpKGs3k619+LCRAvBOak/gfBdPNPrBnCceLXBKjtJG2G
 T47D1Igto+eQ28lKSFjcqV0Bb1utzYZweNztg1ehqBMMPfGnagVaoledld1K2cMUg4w4
 a4zAHJiSzUmusplISlRQL7bd0zvvlzQZRea3pLacQX2ZPCv1evpAzpvPz5NLwvrYaTFS
 kY3Q==
X-Gm-Message-State: APjAAAXBJudLgCQUdZgN5ZOz+WC4g9Iey6BIlOI+BMuNV/zF0C2bxKIV
 uI2tmUkb91rZJtOX437Ee+ytZj42JuKl0Z/F0a1tlQ==
X-Received: by 2002:aca:50cb:: with SMTP id e194mr2758395oib.48.1566562852096; 
 Fri, 23 Aug 2019 05:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-10-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 13:20:41 +0100
Message-ID: <CAFEAcA-2G7yeHh18cmxkOf8mhxFu4C_XUPy5H6hTnvg9Xq4A1w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH v2 09/68] target/arm: Convert Halfword
 multiply and multiply accumulate
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6mT350e3Qfs/

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 218 +++++++++++++++++++++++------------------
>  target/arm/a32.decode  |  20 ++++
>  target/arm/t32.decode  |  29 ++++++
>  3 files changed, 170 insertions(+), 97 deletions(-)
>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
