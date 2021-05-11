Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3935111lfg;
        Tue, 11 May 2021 05:34:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzc4Ab/a20LQiQj0VKm+Ag5h9bJcFbDIqf52sn/GPalXoLQpyKKv7/A1Ao6f4fIt7QClBB9
X-Received: by 2002:a1f:df07:: with SMTP id w7mr22115603vkg.10.1620736481263;
        Tue, 11 May 2021 05:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620736481; cv=none;
        d=google.com; s=arc-20160816;
        b=TFRa9DhcO2lCU2XjAb+ALgrEo1ldanaiS6QZ/G7ZD+b+Ms6Sz5jU5m15Y6Q+o8zMoZ
         9oVwF0BbBVKb3jzNKHRH/9poLvGugfAPSMtkLvHSunfrCYVV+9THSXHd4gQ+HpLRdewO
         AVMdrqu7C8OQCNCvx84mqFCq/V1jnUXxQDYgqxujr/EyafWHzzSvGsQ/wHuH1WW4nNX+
         ToIYl2qYDNwGm8nY7F6g/oU0IbUI25vBQ5bph6YezwGF2zovSNpbsXZa80ufi7dPfsyE
         gTNyx/EebbWZ8d3CdvH4/Z64Ji4aQhQM90hI7tBMUdu7dhIHTiAbbXP0NRj5eJJON5W2
         ORxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YKjvti2BU6dqPn6gIx5X5eE0OWV1ALIewgegjfNwIKU=;
        b=PPREohkmmjy1a5HuruEM2QBSrq+G5wisGQyrijiTUIIUSghaaPnRr3RwQ8AdUv7rWo
         RehO0N8SdSlYA42rxRuO/LcbMZ4bJjWn41zb6TApqJgQe7XdSWkp24MGpYELWe+BEj7J
         eVvnR3Gz5/0j9kyAZfu4zRwZQtz3T/ZCtBiGttLqh7v2N6kBqPgP+uqfHRCAkjrgAPDH
         gZAfW7dKbDeQ35DtmVyQuXSVlRZ4eKVNRT3NrsDo85+GluGNqQ5Z0vp1bFZjBJM+6wKk
         8xFk+7I4mUcFZFYlenpmSSqf6hUj0qgR/ZEpTg0LugJUqx0cP1wkdfGNjkIJgehUAwVF
         OulA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fH9z4Qfi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y34si7767345uad.38.2021.05.11.05.34.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 05:34:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fH9z4Qfi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgRay-0001NR-IF
	for alex.bennee@linaro.org; Tue, 11 May 2021 08:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgRXQ-0007C6-Cy
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:31:00 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:34399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgRXN-0007Gx-Er
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:30:59 -0400
Received: by mail-ej1-x635.google.com with SMTP id a4so29519068ejk.1
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YKjvti2BU6dqPn6gIx5X5eE0OWV1ALIewgegjfNwIKU=;
 b=fH9z4QfifJqtUh1XXHvyW1oCECRKhwpabV8+i7VRd3KPtd/Z221iWKMbQrCq8Hlx3W
 Ph1OKXuTam1plLcg5GIClC6/4lM3HJUm2JF/ghxY2Z5xPD7s7Iim7rZfEWBCeV9/Acb0
 dRNhtepqQyKcdLIJ1idXIWY8rXBbDtxLQfs3OIIidMKyB0gd+kU+QDBuy2rFuQqEhrhi
 K2nDnrHKat9RQe7B+eNFYsqRYk7YzlHvhu8RpQ18Yj1q0yqXoMfyitfTFK7ljFRCAu9+
 0Tb6visqXaXEmTZ+IAa32F2dpxhTPk8ReNj7ILsSuqEsLWX6SDAjYbprIF/cr/LfatiE
 tKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YKjvti2BU6dqPn6gIx5X5eE0OWV1ALIewgegjfNwIKU=;
 b=cyM5myZ4cNR9yY5XDCVrvrE6Y01PnDZh3pVDi1FvsjRXw3Vm7NmkYoWb4H8HzjB9h2
 g7t5xbtOyWHz0g32mhv8/epdK7TaL6dbYznzqCSD1U5TT2CNe/oHN7lUcBOBJTBgKUiY
 LusjS0jHYEMWlVZi3zWRFv8m5iQyLKUrz5LBpLOO6Vvdz9/HClEM6rxYI0mgfKdM61ZG
 nBGJ1uFPupibdJFfRHT5MmSG3xDVXDCtbVCU2H2lj54QQBy7/qFONvGASp/BrcZQgCMc
 icqb5hYGRic3dEctT1BbKDkhTK+RRDh7+4FuQo8Nr9pgIDgbJ3w14L5cKJ/HzUkTdT/m
 SAmg==
X-Gm-Message-State: AOAM532q7jehUAkEBz+g3SZROf0iXUwcSkIAA0VOOLb6d/LM5HgirAjX
 SFAzJAjQcIJXZoguJ9/aXOVOE/9VYsRsqeYMT41gnw==
X-Received: by 2002:a17:906:364d:: with SMTP id
 r13mr32202819ejb.250.1620736255788; 
 Tue, 11 May 2021 05:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-15-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 13:29:43 +0100
Message-ID: <CAFEAcA85Vh=qhkmnN8+b5TYm9JWDvZyjHDOPGtak-UW07f40aw@mail.gmail.com>
Subject: Re: [PATCH v6 14/82] target/arm: Implement PMULLB and PMULLT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: u1p+Yyuftxx1

On Fri, 30 Apr 2021 at 21:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           | 10 ++++++++++
>  target/arm/helper-sve.h    |  1 +
>  target/arm/sve.decode      |  2 ++
>  target/arm/translate-sve.c | 22 ++++++++++++++++++++++
>  target/arm/vec_helper.c    | 24 ++++++++++++++++++++++++
>  5 files changed, 59 insertions(+)

For consistency it would be nice to have the subject say
"Implement SVE2 PMULLB and PMULLT" to match the other patches
in the series.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
