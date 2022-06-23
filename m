Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2883396lft;
        Thu, 23 Jun 2022 04:49:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uEdW3eQgD/PhA+ZykwcMFamuzJ/e2uCofsNmwUaqYg8P5apdVJdKpt6FHrH2/OEzR2h8BU
X-Received: by 2002:a05:620a:370e:b0:6a7:2471:b3eb with SMTP id de14-20020a05620a370e00b006a72471b3ebmr5633428qkb.631.1655984951801;
        Thu, 23 Jun 2022 04:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655984951; cv=none;
        d=google.com; s=arc-20160816;
        b=bELyzBqjfwWRDR16tA61dcykfJVRv5gR3iw35WR9VnXdkfAXvwNfQqhuUSC4pRdypu
         p5EJ3zRJkDUdYmadk7XLqPLYo9/hlh8Focdq2jaESnIEP/OkEXFyN3+G5kHxP6kQVZ5O
         fmYLbr24ARiGfKI19Daj6O8ZlCAtjmIdjvREluAmMiyi8/3RYctQr2XXC6U9ipF8rdWJ
         n85gfQxv75Ej1M3tcTCR6sdWCUq5nT8Ji7pdPMSIxwQoqlU+YA9bmxNa8G98SBm8t7kz
         /V8HJ3qGPdteDctjGAXVrr1vVNCqZA7p5fG/FlVY3KqQUvd0MfAtXJC2xFSnrP31Ij1+
         4Xlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=b2vozZk82MWrSg5nOJlYytZcI0E9xK26TawTM1Kq6DY=;
        b=JMKVSL7ZAs7oEIo2wCghlmpSBWxVRuAAAC9xuDjewNmXyrNYNGn2Y/ZZT8/huxSZj9
         Apj1TG42YhWw5cRNR2zjXvY2o+XjXZXZowutxw1N5xSVNfnBjbkeIQRNao9KMVFVqElQ
         fLpiVhy0NDUgncBhOw8cW31j72CB2UTy843NAEgRGBw92ReFM46zlcgG33zsCI8U+oO8
         5SFuggAZoEa08mtWvNz7ZyC36EhHRJuTUknvwZJfmqNaGo0pBNJPPTy4zgmfo+/PvcwG
         klQ15qzlsOgTfglR3EXV4tyJbMnFc3+i870/BHDmshgfx7mT+CekXlxvzjab30rsJMsE
         NEUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p801a0ac;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19-20020a05622a101300b00304b6c5dc45si14809438qte.623.2022.06.23.04.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 04:49:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p801a0ac;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4LKg-0004DH-So
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 07:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4LIm-0004BX-Jr
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 07:47:12 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:34508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4LIi-0003l5-16
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 07:47:12 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id i15so30534643ybp.1
 for <qemu-arm@nongnu.org>; Thu, 23 Jun 2022 04:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b2vozZk82MWrSg5nOJlYytZcI0E9xK26TawTM1Kq6DY=;
 b=p801a0acgNSeV/+tXpkGVxjx8eLfGl6Gaek9cdzLMZeduTM/rp+GHPEH0R8VSlYSmM
 i2/6B/wOb8YFDXrxncoI/Q8xafu8Pw8Wk8R8WtZCVZucRDu4tYXnbUg2feKYnB+vCgkV
 O6O4YrPg8zBREUpHPCzrSrtm0ZRNtDTNEB3yJ6bV7B7rLrqJg3/zkJcuLub8CRVEze4A
 RsljfOB0f7VGZEvwY8Bh2lYBB1UqqsfBtoPMkPWfLCswnkvpFU9xN3aUZXiA1gYdUgEm
 YbFCnC+2lZgDiMPAN5irg9UDwa0ie/yCrTW2xdRh0dyfmSPEUoqBmqlgT8mfScrlVxh5
 9OxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b2vozZk82MWrSg5nOJlYytZcI0E9xK26TawTM1Kq6DY=;
 b=0Vg7+2BtsfuQorup0daJtBT+y6+7OoZw1PZ0wXI8xrwAXj8Do3/A/D6mxixQP/JQOp
 sNepj1KeJvIbbcuVo1/0GQqJkG8Vc8ePzyS1jXaDPH785K7xTBkhxngZ4Vmj17Be+FkY
 ifGymwh1wKIdaaQtKx2+sHKlOafvj925baIO64uifwYLSEKU+GUtRdwyo9Iq12yUvs5n
 taJ4hhbTOyxfhRjzdChfrj70tbBYZGcOFQOTjEVgpYeVDt6QSnqzEfTccxQoXSI3rUyo
 /L9e5odE/BIKBStFCbiwhaSbH8S6o97JUAI0mtTOKbwaJpu/vfWrAMzu7GRiN2+aM7ZI
 d8cg==
X-Gm-Message-State: AJIora+3Ue8nGwJXQNoGRT/g0n98Fgig6nYVLcxLGgYzei3XDR1vmNLw
 yPBq3AsTWnP3wivCYvCLprrIqKWkfPYQAwLmdONxrg==
X-Received: by 2002:a25:810a:0:b0:669:9f30:7f1e with SMTP id
 o10-20020a25810a000000b006699f307f1emr5964158ybk.479.1655984826909; Thu, 23
 Jun 2022 04:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-29-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 12:46:56 +0100
Message-ID: <CAFEAcA8y4iiB2jeSHzi437Bvs7CdV6fKtKNV9BDjqLNmVN7dYQ@mail.gmail.com>
Subject: Re: [PATCH v3 28/51] target/arm: Implement SME LDR, STR
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qu3X+YnIcEru

On Mon, 20 Jun 2022 at 19:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We can reuse the SVE functions for LDR and STR, passing in the
> base of the ZA vector and a zero offset.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sme.decode      |  7 +++++++
>  target/arm/translate-sme.c | 23 +++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
