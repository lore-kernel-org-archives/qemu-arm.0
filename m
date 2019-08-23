Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp733845wrs;
        Fri, 23 Aug 2019 08:40:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy9Qb4Hh9wW+aehenj/7vsIVNAQdbIVtTPXnXqeskNBnWTboe2+YPkkWrBApsl0/ZnSoz/M
X-Received: by 2002:a17:906:1e8c:: with SMTP id e12mr4878628ejj.135.1566574806629;
        Fri, 23 Aug 2019 08:40:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566574806; cv=none;
        d=google.com; s=arc-20160816;
        b=UDAHOFxycGhxbb/NsaccW91Lv7Qf0bbbV4uO5xQ9AmjSQQtDXOJNs8uNec0CwbExKz
         ScGblSPFPvvwO1BUGW7qAkidgRg0bVhPaZHGRMG5p7geAb15KZeN7m2nV2SGsy2lElSS
         7Q742ffoNkvtG5YCiFey5go19hE3zHU3wwGwcdjTp0LRR8H16tuWD7+4j7rO4OlV1Bfh
         jmjPOio5ExXGBTV/7Fc2Ki72xLaNIVVIJai75M3YYZTsEssY8uIFrdUZnqzz204OJEw0
         kKaSKzc5MdGZHkWB5/bTfJWEnrlNGRAalGsyj94vnT4qAoUXgbCSG9eUxIWpoVcLYDwO
         rY6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ouVqUis1oCi506+X/SpDgRBR7w4wcMn92n2M4p+p5Fs=;
        b=H/aj9zrA5DexcZjycIHA+xoAtN5ns7oQ39iJCPLVBWUjADtZWWDpGeT8VyW7CHLBRQ
         3BjWsg/e4xDclrzW/buHQneGukMHJcmiQC6L7kY+fFK18TAc7j9wQPstB7Q/DfMou6EW
         zRXm6L55xr8BeIYzXkqZ+7NdSzd4ifJD0u0SlgRzYNe/zsbWoB1cqzCVs3Q82+t6Qjt/
         x6zjzzoP2czo3pesUWwCF2291I0g4uhUUgrsI8fdwzthGayLv+14wxNTlS4HuRB4NLBN
         M2zPVXY0Mqs7+OsznEvtfC+H3l89aHIao48Cn7Li1BjEtqa3ZgjujG5EglAI/YV99+ze
         OeFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="sf5/VcY5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si2242790eda.146.2019.08.23.08.40.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 08:40:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="sf5/VcY5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1BfZ-00017e-M1
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 11:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34794)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i1BfO-00015j-QD
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 11:39:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i1BfN-0008Ks-PP
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 11:39:54 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:42139)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i1BfN-0008KM-Ju
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 11:39:53 -0400
Received: by mail-oi1-x242.google.com with SMTP id o6so7295595oic.9
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 08:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ouVqUis1oCi506+X/SpDgRBR7w4wcMn92n2M4p+p5Fs=;
 b=sf5/VcY5CmGrK3bLH5B37PkRpuwapuzK24oQ0xoK6NyAHInpg+lUmIYwK8Pw5QDYrC
 BXmwA7XrFd/NaDDFj3YOAZmzE6+VeMvi7yPt2oYEWexVZAkZkLW6dRQ09vQpOG9vg4GB
 f44wBe3rpc05JEXwCPxrcJ2+RvO6NqDhzVShjR9UqqyxkVQR0M8uffKD1dpTYnZuHJbN
 leCQBXS1EKg/D6CYN2SFiUHQXbN4xF+J7ugHO0Vrmr3zpA5522cKPy7aqrYQrzARBNtB
 vMRsrMXJAUWHuwd5CzFGaG/lFu4ulYVWvT2fKOC5X4UbrlU9AVxfDXF4XTm9osBST5r1
 CSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ouVqUis1oCi506+X/SpDgRBR7w4wcMn92n2M4p+p5Fs=;
 b=d6prVMR2WusYZm5y6ChhXuNaop7OqBuDdAqRDB6wsuDejz9i1eR+FtBGecmFbmTLLE
 jlL9h3hByKs1+CP8jWQkkYN4oQoyHuMtuDHqs0AW4MZkcC2rJZC/ZBmx+LTe04GTX56s
 jjTGKwdmXhRXuN4m/Xjekw5fCeUTB8JaD5MKAyXITFGTUJBiOSPqk2o8KURbzW48wl2B
 fvnycOZbPnZ13HFFpVgzrtorFJlD1JpoTl+W/reyMWvwCENJ1+Nj50eKwEkan7Df/V4g
 noN4h86IXpZ/Xw/I/CippEgDxioPFa1wHwk9HgU2eNRrdKEbxjblN7sPLLWHKEe75lXh
 IbmA==
X-Gm-Message-State: APjAAAVjAIKy9wVzBJYwVwyUNWZdpjQ2iq87ZR7NmclfbSZyEZe39bAo
 MbHny/ZeKML4I0lYXyXYmbkbrwfWz9nL4NNVdfz4DQ==
X-Received: by 2002:aca:4814:: with SMTP id v20mr3707424oia.98.1566574792626; 
 Fri, 23 Aug 2019 08:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-23-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 16:39:41 +0100
Message-ID: <CAFEAcA_ctR2KvXkpw=q4mx1aZRzUJFK44kwWUHHe1XN8qsFBLA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v2 22/68] target/arm: Convert USAD8, USADA8,
 SBFX, UBFX, BFC, BFI, UDF
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
X-TUID: UrYeOQf7pGFS

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 200 +++++++++++++++++++++--------------------
>  target/arm/a32.decode  |  20 +++++
>  target/arm/t32.decode  |  19 ++++
>  3 files changed, 143 insertions(+), 96 deletions(-)


> +static bool op_bfx(DisasContext *s, arg_UBFX *a, bool u)
> +{
> +    TCGv_i32 tmp;
> +    int width = a->widthm1 + 1;
> +    int shift = a->lsb;
> +
> +    if (!ENABLE_ARCH_6T2) {
> +        return false;
> +    }
> +
> +    tmp = load_reg(s, a->rn);
> +    if (shift + width > 32) {
> +        return false;

This UNDEF check should go before we
generate any code with the load_reg().

> +    } else if (width < 32) {
> +        if (u) {
> +            tcg_gen_extract_i32(tmp, tmp, shift, width);
> +        } else {
> +            tcg_gen_sextract_i32(tmp, tmp, shift, width);
> +        }
> +    }
> +    store_reg(s, a->rd, tmp);
> +    return true;
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
