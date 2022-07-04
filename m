Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3239705lft;
        Mon, 4 Jul 2022 06:45:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sg1BCRvEnPG/fvZvn6nF9ypdXuAaUXdF+OELh+DrZST83oqL3OVrfCOSs/cpXbUzDh0qRb
X-Received: by 2002:a81:188a:0:b0:31c:86ee:2cf5 with SMTP id 132-20020a81188a000000b0031c86ee2cf5mr10253614ywy.471.1656942310048;
        Mon, 04 Jul 2022 06:45:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656942310; cv=none;
        d=google.com; s=arc-20160816;
        b=lMcJTUZHewRm6a9vy+LW4Or9BMrY/8fJnud0XwxIdpVKVo3QRzYfVVUBM3WxIu+89b
         HG8LlpxMqVpyDT/PBIE18aUtMkFQ/ugSZYjVzbln6je1JJmFZ/Edwm62mdCwu/c6EDb9
         JYxQDoSvod3uB7uRAkpEfc8BXGQT1UsUif799EvJsKjltc8pYjTcVEByFPqwqb85WJ7Y
         NGv2VSoSMQ+2K2sYKTU5jm7AgXH6L3tQ/6AOF1cSqIELU4BEcqeQdgpWf0YnHn5cpQrA
         Lyu1WoWDt64Y1zkOTJee3gw3mFirgFfUJC1HLzQts6U7pLhTsWTgTAKPeEEVEN9ByU4o
         OMxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9Q27uk8pvJmbxB78LTaAXQW4xiRQyEv4vKell8PzJto=;
        b=crbbe/tKszsOrw0I0puc8wQjl2z48v0xEV47NjEdcMhWaSxl1h5+aSz9FQ4JCsy+tm
         IFRCVmkFIaZ8oM6fksp0yODyQ9nC4wLISusc/q9wRE3KM6UBybHbF9gs1dhHXZyOBnBS
         TPDDK5XcBLZ9rKE5p2Jkyc2Qrdb5Dk1tc99pb2nxO5ns9biFVDCqFZKwZ9GDu2qfWe6H
         TxkYnzFhRSYAJa8r1PIQRyNeynY9kAP6p1FvJrYxb465Wo1cNpCsxuDzwWYBW+Oobbl6
         sMtchQ1dUkEHytdRnU27E1PtaRX1VhD7xo1DoofYhy++jq/QdE4J7u+80PQetGedqa14
         d07A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CAASx03r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11-20020a810b0b000000b003183b3eafb0si39787420ywl.25.2022.07.04.06.45.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:45:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CAASx03r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MNx-0001Xx-BN
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M1v-0006MV-Qq
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:22:27 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:47101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M1u-00032U-Cc
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:22:23 -0400
Received: by mail-yb1-xb32.google.com with SMTP id l11so16831168ybu.13
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Q27uk8pvJmbxB78LTaAXQW4xiRQyEv4vKell8PzJto=;
 b=CAASx03rZBnkjx6dOnf2jNkT0QjDwmTM+FOIaQKTANGyKt17Bd/bLEEd16fw56BjJ+
 2NhBp+ScJYw4u77P5F/SE/wiM8z5g/t+mfBjfTZ/JgMRHdv95IyZWkIJaDwtVDH+/TeW
 qZoGDewv9zMYmJe3U2qgP3EpweA/Plf3nzvpf5GvGu0F6XIAfSEur184Mt1762YihChN
 TLUcUAykfC+elvy3f3s06Fl0zSAyJsfHl3a9EXc3GLT6uQbx2CJq5U5m+bVk75V92SfB
 H5/gc5DEXNfhQjNrYNDWj6oDHRq0rfXmAEwJsPFEXwHnuINqHgFCHFAqw9mu9Ja9p0Cw
 xxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Q27uk8pvJmbxB78LTaAXQW4xiRQyEv4vKell8PzJto=;
 b=AlngRcumLa2QxGapSjLABjfEfi5hCFtdU7K4g3qMn2C59eh+0+YCt9tXEntGAoHkt+
 o8I7oTcLlexkHF0RCiYypzD3SXsH58d4de+HQGdPVuE9OeDR1edMt6RW2iT2FUdQdxsW
 kCQw4tFobtq0E/riLDZEnWFevcOaXvDZNEEolM2uk5d8dxj9Ak47nr2DsFK1OJfx1+R7
 NXuC6nLrmrma4BGwdR/APk3h2gWsLkwfwZpQavOL5pcxVR9x5hYTGpkbglcU71hRwIOH
 dtJtEEZC4QhpffxnVLEUXGGXX+dcc/elEbuh81/ztIca394t51ei0rdvm7YVjoEUDyN/
 +wYQ==
X-Gm-Message-State: AJIora+BAIvbrcKGhVjaty0VOCud8DkgZmRVOVM03FEtqLIE4sw7WYt3
 S+qMLs6Dm8vwZzhxK3w5Q6hzHurNw5gmhFORSRqThg==
X-Received: by 2002:a05:6902:1183:b0:66e:4860:575d with SMTP id
 m3-20020a056902118300b0066e4860575dmr6165879ybu.479.1656940941305; Mon, 04
 Jul 2022 06:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-15-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-15-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:22:10 +0100
Message-ID: <CAFEAcA-fBs5uXx1SdChkfNEAMT5HabMYA4SspCZ58hAZ2OATvQ@mail.gmail.com>
Subject: Re: [PATCH 14/40] lasips2: remove legacy lasips2_initfn() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: kq38JR4jwtrg

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> There is only one user of the legacy lasips2_initfn() function which is in
> machine_hppa_init(), so inline its functionality into machine_hppa_init() and
> then remove it.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
