Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E10C5516F
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 17:50:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wprMr-0007ra-Dm; Fri, 31 Jul 2026 13:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wprMp-0007op-Vp
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 13:49:56 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wprMo-0008SJ-KV
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 13:49:55 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-664db84f074so1798286d50.0
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 10:49:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785520193; cv=none;
 d=google.com; s=arc-20260327;
 b=rosQaUtIW+kD48bpYJkvlA0FwhTiqrCjoIBUu5tT7xTJoRd+p0CiUSC3a02LIGp4L6
 nVLg2+NftTqr9M9RISnzopYrqMaqpwa2LVHjoDn0HpkyVmicbEdTSa+hZt97cbhu/2Oe
 YlVKRYRKyY4bfcUVsTfFdRHen5i1msRmOTaIWNrpdayOAnszEEl239Uqg/Q+5gL3GrLd
 5vqlADwR1F9PD774hyLyWr9HfrggLASOrpgM49gfi0Vf3HYj3n/2wWLdkeI206G9b+0R
 PxyQR3WVEMsXAsv9+HfcKrpLQX5G5dQFOq+tSZM1RNS2Y/85Q7HvMrgcfgZzhAKsbgXb
 /3hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=KAY7xaZof6hH24L7wXujUquBCBGGch5CCXJK4qBU+K0=;
 fh=Lc8AI0DQShNgLQ61xNtIr38WyFVxjXHDuUsHUvq2jD4=;
 b=Z+EMQUh4LyHKlXtbY8PKrWcky+Fv1t6FUocbOkTl2OFOOjlLiPS7VuIpP4h/ghuHgf
 1plrKwEQanLVAxzng3DXy0lTX3QxaxKJ4UjAgXGXzdeICIhnFVl/vgAU1eOdMgOrUpFV
 RzRorlSEbb4A5CkSryBO92qXg35gZobIOBsP69b+CjTswNTzBjOvn0TCTLaElKIHNmGH
 eNsYPdHJgmwREkVeNtLPcXNs1sXsoAaDP+b6s9sh88mZAhi+a2FkffChBLGdgv5PcpLf
 O4j4bZNJigXHx9dWqrUQ9LCyBJIyENvjcu9/eBTLHM/KOffhnFjhL53k+uKKtbHLISIK
 EKoA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785520193; x=1786124993; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=KAY7xaZof6hH24L7wXujUquBCBGGch5CCXJK4qBU+K0=;
 b=Bth268t3MZOb/4wjHFxMMB3NHlId5ryRQMhWvbuaRqZljbvSuZNa1pr6Cm0lYC6CCa
 wb0f4WnSrH1NLFQbCikPcmCdB//GNfLruzT02tQ2Dnyx6HZ57dgEXj/D+85wusGug+Kj
 lJHph2r9/MLEX53Fdlqcg3rUkYWqrGjss2Ecp9RW8puOh24A0UBgf1yPGCBZpMIYXK0H
 yqgvMF+G8fL/Ts3FowujUF/9gg55/gTZlgdQpXMqMaAU7rTFxcRzG8tGeSi8cVCNi/3I
 6dxgED5i5MnahsT7Xfpc4tus9wFXzun4uwS+P1RrGRhVeaXC5xiPx53P31jspiddwI0j
 xgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785520193; x=1786124993;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=KAY7xaZof6hH24L7wXujUquBCBGGch5CCXJK4qBU+K0=;
 b=g+4efQ3QDkUUbdsk+voYuzVA0IeMQOe8PB6IeJbeKCjb97nceYugHrNlNgGSqI2qBH
 6VzVR5Y1ctzvvzH6CEvcgJeCQ7Uj875oMZBE/g8hB5Pjw6Ymk6JwUDdKB5XtkeIiP4Ur
 QCltcKUe3qvj6uBacZWDmVBRTcTho6QZJ2Tc34i38Bu2fqvAnzTppAi7hoWosSUchycd
 m9NlEuD8+y1uR2pZfezXGtNktlA0Yv6n6GV6wkXwXqH/v5uPdQzntSnGf6/UicsMcBLy
 boT56VKDVgXeCW9SGebwrEYI2XREBukvwT6nBYvDF0rU2XJQFTtbG1aAT8oa+4qJaVDT
 99uA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrR7n/iCvEhji7ZOKNpJJjMA75cxturB4YiQ49P+jfxEb/h1psxV5vQ2tdaYv+4n9JwdZDHxAWDIw==@nongnu.org
X-Gm-Message-State: AOJu0YxP6t57DK5JhjiZDKw2KS9/bz6qpHIlBOVQHt6L86BAwRyY7zcg
 jn0FawII9vwhRo0wpKYQ1xzu7ClT2mTTecJ9elCRO7cMIL0vnGX6GGf0kobxs2q8In/OXiCngtT
 cKHgUPWEQ3eru/re7oyuwjgzivm9wOf8qjUSUYjDtmw==
X-Gm-Gg: AR+sD119zwVBdp7GV7mEOO3Stko/yIpSgWQR7SZL51tmzQpYfa29sbAvallHEPlca40
 v5Mbr3Hr4qyv+cLm/XLEKnbupJBgXW13MGsSAiwtEPr68k2dP9mqY5XUOKPuv1z2xJgJHgAZHXG
 cbKK9Xp7yNGyyQZkJ0/KFmYE9OkLDJevMkGbQ33zFC9kZ5eMUlG2KKkkXeHQKPgx7fyUvPesxTX
 iqZtuxhm51uIS/DPP48xSiaV8BMNHjbMO2MGFRiIb/JvdVDs4jCeJf73gKxlsLuCLDHTLi1L7ae
 4CxOdjzkh/IGw5wolt5vaK/LkY2mNHAZZMEBI2h3/wfx2eA2NeeZ6Ow0/msgr9RIx0oH+nYvsUH
 usB6g0IkI9j5EtfN+6ELpTrSRP47n
X-Received: by 2002:a53:c90c:0:b0:668:9567:db70 with SMTP id
 956f58d0204a3-6694f1db7e0mr869863d50.40.1785520193357; Fri, 31 Jul 2026
 10:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260724031123.76597-1-richard.henderson@linaro.org>
 <20260724031123.76597-7-richard.henderson@linaro.org>
In-Reply-To: <20260724031123.76597-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Jul 2026 18:49:41 +0100
X-Gm-Features: AUfX_mzKTaZ2MfzVyUe4FTJaxNyPXtUP6kSrImfLgw-LBuiOW7ePM4_zc4_gTOQ
Message-ID: <CAFEAcA8KUCzKjQ5+s4-Gtt4N79uyjzsMOWEsdeWAU6_WUmBq9Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] target/arm: Enable FEAT_IDTE3 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 24 Jul 2026 at 04:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

