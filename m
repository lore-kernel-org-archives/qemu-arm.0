Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp2975554lfi;
        Thu, 5 Mar 2020 06:24:41 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtW5oFIrF/18gs+T9ti/1v88RZRdnudKvmwKaoYdIUK96AkmYuOuTFIpfZSjxlhnoC2GZL3
X-Received: by 2002:a05:620a:138b:: with SMTP id k11mr7096358qki.176.1583418281306;
        Thu, 05 Mar 2020 06:24:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583418281; cv=none;
        d=google.com; s=arc-20160816;
        b=kTuOj5k9oWyhqSvLg3T2Ms9MspX9+93rB3UzoGxzV3RiAoHoPjx1khg/AeTsBm8qT4
         aV826tN7+Yzdp/f+xhGN9Jp5JXu3BJT0S1IIeYWZTOgPgKtgo3AlaR7eenBt8z57L5Yz
         9NqAIYYxsygtzoDeImCn4gwCqrmvs6Tjq4k4d/I5926cXUminc5ycVPpBqzi1Le+OjRv
         XtFlKdE7GAYwVxaQmPI8NIJh8lG6OCE0Ivv34MPVc5VheI7p1rk0jKT7sp+eUa0oGF5Y
         KIkaRuxzChoFpOuv716mosNVxl8LTO0JK3vWBVZmVmjFpd2RFMMJf40PRQD2bUrl19FW
         i8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ankb0BBJk3e+XHds1kX6Vse78CMnD2YPH2pAnI5TDRc=;
        b=oYfxxGHQRr/byaVXM+HfPYSWqB9bwzDbnNEt2p051VTk/vx4wxFTcjTw/KwqRG5Sg8
         KOPXEoNg1u+KvRUzTqJ3k6ffZbSgyp2dEobxqCOA7hv65eOVkqaYQLnzatrSNtaQ6BJz
         GCM3ZT3JDFVxspu+jSW/S3tnJc9gvyYzPnjIXPpGUNEMgD/mUTVSk+I9qWXXDECUBUzB
         8EQdEyNRZkzDigZ2J7PQFWzncbUqfrDv5pRg2ZUaCKBbMKNLi6wpWW3n7r4XxPlWgI6Z
         mMGpewkZxzgxRQBSzarrdJahuv3bu12K6ZbMul3EbTutIRsMTdrD0XsquG13OWrRm8Gk
         f6uQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Es5xVb7t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i19si2681677qvu.115.2020.03.05.06.24.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 06:24:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Es5xVb7t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9rQW-000452-PC
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 09:24:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33446)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9rPE-0002KN-5s
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 09:23:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9rPC-0003qE-6J
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 09:23:19 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:37299)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9rPC-0003pt-1J
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 09:23:18 -0500
Received: by mail-oi1-x244.google.com with SMTP id q65so6105241oif.4
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2020 06:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ankb0BBJk3e+XHds1kX6Vse78CMnD2YPH2pAnI5TDRc=;
 b=Es5xVb7t02KTrWd26gaSQyK/IKc27No/LZdMNlYNYvXqGfM47RqCk093MsxfVAEUwT
 6ZbUx3JeSQElCS0X1LjDOoC3lVGZPeIhjEqC95bBqLDV1HuLL4Pq1nXh2Ftp0oyWBPCz
 vJTc6VFvg2h7mISvwA2yhs3nBYZDX92USui2e6oAKDvNArJ9hHwwLEWA7l1iSlObU6Dm
 YBWZGx6jpDU3qA/PjT6qJlySHMi/Zc5dxIyTsf+vfWMSFBcA6z1xwWzPPOG6Tf8RxFRD
 t1U1gM4p6poTMwkE78oZ39ltt7kGFlMQocTx62n1GfkUQLyILT8QDaQhGvh4SOG6aYT0
 4gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ankb0BBJk3e+XHds1kX6Vse78CMnD2YPH2pAnI5TDRc=;
 b=E9QGtcqJKpCxi2PAmRZtuK7uOiBKHh6dPwx2XWhjAbQuKAdJy/HNwRS3pMEAlTEsI8
 tzSNKU2xobmOoqIZU6AbDn8zV7IDEp+Jm2uWBwhj4jlZJL+7ZaoaBaAVqX2qy1/q434J
 C561yr7ies1EZCM4KAUSXcCpBr57WaWrVLJxyfgdK9eLHVkEwwfOhHudsG6K23rr9RK+
 xu5jz7PmdT6YBJqULLoOXeyZjxeBaekLTujejXUkSgivtkCZoeFsI+zd0JdPIL/joULS
 Irz+KXmWQsa8PoelI5VgT18IWWCQyLa7eTmzaLlgNhXLA37bHEurW0G/zktzrZvJbyro
 jARQ==
X-Gm-Message-State: ANhLgQ2/zj90FDfZylAnFr+rt0T4HhTyDf0AgLZ29FPOM7ctxTVgqW31
 X0w5rJNYj+0Lt92R1yyh3isaQQUSXhU1sP/pB5miag==
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr5600961oic.48.1583418197103; 
 Thu, 05 Mar 2020 06:23:17 -0800 (PST)
MIME-Version: 1.0
References: <20200302175829.2183-1-richard.henderson@linaro.org>
 <20200302175829.2183-3-richard.henderson@linaro.org>
In-Reply-To: <20200302175829.2183-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Mar 2020 14:23:06 +0000
Message-ID: <CAFEAcA9N9zKxg6zvOCG9021e4nRcs_ij_VaGszG0O1Suc4r2fw@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] target/arm: Optimize cpu_mmu_index
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
X-TUID: gX9ZyJodwUPa

On Mon, 2 Mar 2020 at 17:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We now cache the core mmu_idx in env->hflags.  Rather than recompute
> from scratch, extract the field.  All of the uses of cpu_mmu_index
> within target/arm are within helpers, and env->hflags is always stable
> within a translation block from whence helpers are called.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
