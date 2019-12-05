Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2481844lff;
        Thu, 5 Dec 2019 10:59:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqzzO4+Hxh9RmebxTDPJO+oC6B72RaYeGWP6/xClQGpm54DbFPEy5U7/Fwnfy7fBGZCBJqEI
X-Received: by 2002:a05:6830:4d9:: with SMTP id s25mr8063822otd.171.1575572342363;
        Thu, 05 Dec 2019 10:59:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575572342; cv=none;
        d=google.com; s=arc-20160816;
        b=puLwkveDaatjv0z/7SJmCwyMaMJ6rajI4n3Qs1HOcEM9MzP4ohsQsTIvqa2iQv3bQU
         LgDeXUCT1LUSRn++yj+yBSCO7XubNMWk8oUXKox4DC2SQGGc8fGRXTihxg82b6cU5wXj
         HpfN9AM6jwCncDZiNk1xZTV126OLBMSvqZ3yssap8AZWkibAFh1UoVWknj/In0mHkgsu
         ZYaMTVz3Xz/lJYdrE0wIxltjRMS5eGQE4tOpkTmsLPCHjiQnJNip2v5j4bVP+Wx4Dy/F
         1XB2CCAjdetUD321ZZqdvgN+OYDPqYeK+J5o3qWi/EYgv6XOIjK+Kh4NaEFN8fnhIUnu
         JWxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AEQI4xHNIqMIIegnskaMD5l3+ExBopVS61N6I2vC0DI=;
        b=F2Fe56eji7Y4TuBOnbmZJ4DD0RkyOLNMGEI8/WhkcQbvxaLLZkdb90EiztqhPoxc7S
         OHRyMNxGr3UxtYwVNDS6gqSl5D6ol634l5scEPcHt9mlclsqWejZ0vcJKHpoH+EAz7GS
         EZ1v5SgbdijWaU/zofkDxMbV0Agq93V2pOTPkYCoR9NBG+2Sg9AhgRl9X1+RRq8Dny7u
         HaS8S9HZq6Wd64ssSnAm/b44tFe4Hku/YUUu1WdB+KJobb10HUZxddwHzyBxaAMvVIUp
         D0S4flEfqlLrhFvB0hi1hTbEzapJYE+IuDJP2/WJT93SwJ9uUZcOPMic5S+K17r8VOlb
         4mdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N32gbZ2V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p124si5444847oib.57.2019.12.05.10.59.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 10:59:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N32gbZ2V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icwL7-000704-5r
	for alex.bennee@linaro.org; Thu, 05 Dec 2019 13:59:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44585)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1icwKl-0006zN-Uq
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 13:58:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1icwKi-0003xo-GU
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 13:58:38 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35063)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1icwKg-0003uf-CK
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 13:58:36 -0500
Received: by mail-oi1-x241.google.com with SMTP id k196so3771930oib.2
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2019 10:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AEQI4xHNIqMIIegnskaMD5l3+ExBopVS61N6I2vC0DI=;
 b=N32gbZ2VEtN1AHvzpjEXiZx4Ufd7FLblT6aZPLL0RX9jZhF+HfkH7WHvz20n5EUjl5
 hcyYU30R+uZIPoq68oSlvUl7U8xqwB1R8WtdWlFybSSvIp+CrIOws8yuPJRAHiucfOKU
 5hYFYJTQw1dmhC8vwi0n6L/gLPua22W5v/ca8cj1FBatZjwitlygXg6RJkOz9QlCyIUk
 lYWHEQATshFkx2oGQFukvjfrxKqobGsm/N8nTOo5d1dRX2nqt4CWW+KwTTz2vxuGov6w
 t2HjmPRFtMjoP9IhTIcdlSFOWNFlFLEdpWJpFBBljkA83BnwSFZ6Offx4MNa5Blz4x48
 wSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AEQI4xHNIqMIIegnskaMD5l3+ExBopVS61N6I2vC0DI=;
 b=gmkWftreNAzpwSifpYJV/+iaNUIY+kdqDhw4BGT469WB6EYsJrgYBk0LUuFzl2vg3f
 wEiJNN2orzqg6dYPyWK0DGUzuhTuoafMcdCvDFRlaX7J8L1fqFkyATfWWRBm+S1K9xnr
 0y1yiuSDJ98rDlIJVk9wpzbbaNtbAj38/TZE1BTNqOkyqJtAE5DlPcr/vTH7UVjHz2xf
 091vf2Q9LdY8IiLWvfaJogAMK4OqsKXP94vli/T6BOR+JJi2RWlmP2Omx3jVtU2wX6eX
 N3F8FNMwMAf0c9R1eqvtxAPeYVsGiNmfXljCLMpmkiZiH54JXDrTUpUw0EoObN53LMgR
 k79A==
X-Gm-Message-State: APjAAAUvcWofG6iySJD/Gwp+NVAB1fEZLsnhPqx8X5+cxSEiIAB1bCJn
 yBw/3kpszs59gyNxEyx4BX1eyNA3/d6lPmirAFsihg==
X-Received: by 2002:aca:f484:: with SMTP id s126mr8226827oih.48.1575572312105; 
 Thu, 05 Dec 2019 10:58:32 -0800 (PST)
MIME-Version: 1.0
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-16-richard.henderson@linaro.org>
In-Reply-To: <20191011134744.2477-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2019 18:58:21 +0000
Message-ID: <CAFEAcA86hhBNLWhAe2UY+0-pS65wpSdPKFPTA9O4m9avjECxaA@mail.gmail.com>
Subject: Re: [PATCH v5 15/22] target/arm: Clean address for DC ZVA
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
X-TUID: zGy4XsYkU9gu

On Fri, 11 Oct 2019 at 14:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This data access was forgotten in the previous patch.
>
> Fixes: 3a471103ac1823ba
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 4e049bb4aa..49817b96ae 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1766,7 +1766,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
>          return;
>      case ARM_CP_DC_ZVA:
>          /* Writes clear the aligned block of memory which rt points into. */
> -        tcg_rt = cpu_reg(s, rt);
> +        tcg_rt = clean_data_tbi(s, cpu_reg(s, rt), false);
>          gen_helper_dc_zva(cpu_env, tcg_rt);
>          return;

...doesn't this mean we don't do a tag check for DC ZVA?
Or is that handled in the helper ? (I guess it has to be,
the DC ZVA will span multiple tag granules).

thanks
-- PMM
