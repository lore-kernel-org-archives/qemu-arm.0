Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp648178lfg;
        Tue, 17 Aug 2021 09:00:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw40C/lIh4oNVNxfSYq6KboPQwQ/egZ6lKnQsuLI8Fs637nB9TSR06fUjp3lCHqGngM18Ou
X-Received: by 2002:a1f:3f94:: with SMTP id m142mr3467271vka.7.1629216014216;
        Tue, 17 Aug 2021 09:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629216014; cv=none;
        d=google.com; s=arc-20160816;
        b=QmUqFwC+TU3y0PvKNZ73DAiEPDl1sRJw6hw3J/hcpmvEUNZshszjAkv9ZyPjokmeR8
         vit5DVdkSDyvOTNaHVlQtw+4qwFoO/b97XAG8QD2Ms7wBouI1hOT+a95wKH71Lbz0vEU
         1xb+NdomfbHkV2LCmDm/748POEENgERHkCQQegy23uwiPxBeyuPXk33STbk5f1uqcMTN
         owfzrQdzW0DkMtMzXuMD5jTdc33lwXTjxvnNiZtWt6AukWKApIzICGPJXfxLlmajNHuU
         RW7YnFFfr2si3y64kDX8oggNKVEWVDmmfZmpJ+2BzmJMSh6ZiMIv1+83aSxZj/CvkxN8
         ToJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zd0HpYx8oc6AV+sdvyoyC3xuiywtdczlSgu8G+DjCck=;
        b=CWnoOE+yTSsQE/wLYELYQyJ9qssL32SYBirAGGV3MpqHSrvG2xcKpPJNWn+FisxdoJ
         FUchJq3vc3gVtUHSuykR2NaMb26Dd1uy/+C1kHGIAZOzsHVvUYpcocTrpnuQl3U5FqQ6
         YmUc2OJMl6l6lTGEa/qfc5LwW/ZPcQbOC2stV5XGxIOSlpdoqlbc82JfCOZG8NM3PtOc
         FKCh65v5mPWzny2dtFzTNodOHA4wnA2IOa84QFsMihdqH4FSTuJ/0n6FifA3M45O26S3
         dcgO6BIJAGP7Y+P3AlP7KRkUNtaH/VB0L0kBebcTHneKXe0GJ3je4Srpy7qLLY3Ph7Ry
         lK4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OZ2Pteiz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4si1381453vsk.57.2021.08.17.09.00.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 09:00:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OZ2Pteiz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mG1Vd-0004pQ-8m
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 12:00:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG1VM-0004oM-Du
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 11:59:56 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG1VK-0000g0-G0
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 11:59:55 -0400
Received: by mail-ej1-x636.google.com with SMTP id gt38so18449102ejc.13
 for <qemu-arm@nongnu.org>; Tue, 17 Aug 2021 08:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zd0HpYx8oc6AV+sdvyoyC3xuiywtdczlSgu8G+DjCck=;
 b=OZ2PteizhSAHnRtpfBw69QpHay/SJTWvix1PyGNC+YWMxvKb6QlVw421herTR9Blb6
 AWyHcgEFKm0YNQrZVUVwWpLOFy/TxNrmIQOJIfojXQybU/98o2RY2rC83gUEwNm0p8ea
 LkMjk1mPcwLrvVh4pYGGcgesR4alA6Emqd8Ojj9L6ZhYu2kuXPWUllN9wAbmVDm+G7+A
 kgpuhmWuciYRq4s0YCP2rik2o4ZxMeiR1lGtD8Xb53H9mjfsw061QHieFsL3ikw8yRvd
 HTNjlcwBamz7F0lvO7OobndgVHwByklAnI0tspJ6Ow5j9McIQ8end6KKL0zgm/hQObad
 dIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zd0HpYx8oc6AV+sdvyoyC3xuiywtdczlSgu8G+DjCck=;
 b=pzSacDHEhqQ5zmM80dj4TRMuQg9SnCl+QS5vsPr2MLITiYNu0Ot5e9Q4p2leV8cWW3
 yynHAo4Uh5/NElE8X9mcw8NPvE+hmETrOVnbPX8TUpLJgwQB6BJuS4HfyTsErKPmjHoJ
 hssNgGz1K4c/YfQTufcKrEZAX/ai/PHzD8oa6l3gq1TaGEkKRfFMtP5UlkqhnQyMjYpt
 3DkvFgYL2oOyK/YciskXZ39SZIzVAXJesQaomVvq284mSf79l5S9VYlzM5waHinWoGVN
 +gfyERlW6PFMK8cpjFad+hrmEr4hCWnfKa9yAxaXp/XG5odmy7+NHuCn6eXXzupVJi0u
 sv9Q==
X-Gm-Message-State: AOAM530GEpkXTNqwezfun2+GTh2qjCnr3wPJ9x9mwDt6RQRyzmmYMrm0
 cWkTvsQJWsJW4AJypNWQQNP2Z5rF9vGDXfvIv+X7Ig==
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr4670637ejb.382.1629215992805; 
 Tue, 17 Aug 2021 08:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-22-peter.maydell@linaro.org>
 <fabba7f1-1607-8cda-00e5-77f656deef55@greensocs.com>
In-Reply-To: <fabba7f1-1607-8cda-00e5-77f656deef55@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Aug 2021 16:59:07 +0100
Message-ID: <CAFEAcA93OvhA2_e52dZA-Thfkp8APRn9SkOGwfEe0oVkcrh5GA@mail.gmail.com>
Subject: Re: [PATCH for-6.2 21/25] hw/timer/armv7m_systick: Use clock inputs
 instead of system_clock_scale
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Luc Michel <luc@lmichel.fr>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lm6hBeKLWG4u

On Tue, 17 Aug 2021 at 16:55, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
>
>
> On 8/12/21 11:33 AM, Peter Maydell wrote:
> According to
> https://developer.arm.com/documentation/ddi0403/d/System-Level-Architecture/System-Address-Map/The-system-timer--SysTick/SysTick-Calibration-value-Register--SYST-CALIB
> , the field is 24bits wide.
>
> Should we prevent an overflow into the reserved bits and other fields ?
> by doing something like this:
>            val &= SYSCALIB_TENMS;
> with the following #define with the other ones, above.
>     #define SYSCALIB_TENMS ((1U << 24) - 1)
>
> Note, the overflow would happen around ~1.68GHz refclk frequency, it is
> probably a config that will never happen. I'm not sure if we should care
> or do something if this happens because it is probably an error
> somewhere else.

I guess we should do something, yes, though pretty much anything
we do will not really provide the guest with sensible data...
I suppose masking out the higher bits is no worse than anything else.

-- PMM
