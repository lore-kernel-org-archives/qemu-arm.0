Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp597204ocg;
        Fri, 7 Oct 2022 09:35:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6SawWxeG1mW35EaRw2iswRa4UG3oiUwW+3F+s/zQMuRukXYbwMM1ouOq1dmRmjXEjH/SeX
X-Received: by 2002:a05:6214:4101:b0:4af:8641:e9cc with SMTP id kc1-20020a056214410100b004af8641e9ccmr4704364qvb.82.1665160555832;
        Fri, 07 Oct 2022 09:35:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665160555; cv=none;
        d=google.com; s=arc-20160816;
        b=Vr5VIrknpH48W6uJ+/R85KsZTYb5nPo+D7LM29lU80K/G7532XsLxbvExrhWvGyStj
         GhgdBR2pa6OxdktontmUZ/KiEjFaG7pqaweiVdNrHCCIsDu/g3+4hVeEBnyZdMap+WVC
         upLigkW09JT2rMJrvjjiaAtT1t3ItPEOpH/zIsof+EhqtgWGMRzC/8Mf1c4MctjQzoya
         QXrIeFJ0pSaqkys31XVBQ5lFsbmD0pEICL9nBdzBKzMlMb75tFtdv5jL9vp4t0MGcj7H
         DSuk3/ZNOHJbOwH1G6PqHZ0EVMZRLJ60kyioEwXcSnq/MSghh+hoAtVVyc5gGE+ICQur
         H1vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DRR5Vxo77shyz1gpQGn8nfsniOVpFa4god68254hExE=;
        b=douX5qOy7sX+YNWsQjw+HBNr9627WLP+4KgKsc75kVsYl6wu2f6CM2ZcDN3k6ZZPQr
         lIR0fmvnnwsMsiTZhXoLi+CZRg8QRNVR1UrXM+TnzBbOhUKPCbdTUefZbS2mi2tmJlOT
         Y/mx2cxE52kObAaDWfsAug9gSdttokSZ+D/5ruzzjPdEegUmbDqlyAAolde5EnC90R4s
         hqgf9t+WpEycQMo7oAtD4CR+XDTYV1pjrLOBWxEudAPk9VkR71Ks5fUojqi+Ws2Wjk11
         H1PLe6HZwxx7H/xC6kuktI0qquC9twYOlKVt6WGHHYCRYROc8FqJO+17NFrPdCO+4yzr
         5Ciw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eoCGk2E+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20-20020ac84814000000b00342f6181dafsi1273082qtq.397.2022.10.07.09.35.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 09:35:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eoCGk2E+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogqKJ-0000cY-Ck
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 12:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogpwX-0000Ct-JS
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 12:11:21 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:34461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogpwU-00064c-Sh
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 12:11:20 -0400
Received: by mail-pg1-x536.google.com with SMTP id 195so5086405pga.1
 for <qemu-arm@nongnu.org>; Fri, 07 Oct 2022 09:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DRR5Vxo77shyz1gpQGn8nfsniOVpFa4god68254hExE=;
 b=eoCGk2E+VQf57UQL0CKk24OrGRx38F+ASpafJtESTi1vM36ibpW7WPuiZD8fZu/mxl
 iUoP6Tw24koqmGruczWf615zCDrEGd/WoFIUzrT1itps5gUdf2zTmMMF2vU4Xvfp4MAJ
 Plt+Te65ooukQXFBh5PSCSOpx13ZUTLqotYW1QPDGLAFqmYB9DGE+OIQCe9FFYVolUzJ
 2W38qxGp7thBI4x/2W3mcKgFD7BMw/W2C1J/3qz8ghDbTWZqRMC0sxnn7QJSM1d51BDE
 v4xxM3rMvgX3XeWCtTANbxUWxXxo7xvsquyh8RmLkDeK8EYaG7S2GDDdeDrIaDDEZM8w
 03jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DRR5Vxo77shyz1gpQGn8nfsniOVpFa4god68254hExE=;
 b=Y/An3HcmUJjH2yHcWp2hcdsmtnMLGM6c+GYzdtQA6Frw0NwzvOwiCoh51DD85uVRFW
 rrBEwlAcwt77kirHysYexRQanq30WJqsg/Djf7/zYg/Nerr0vrNoj/5/ouFakKK6h8DH
 XfZtKX8aERPlg9r+N/knkeQrrGjnQ0FKcKIxLDHbpnHXhQXO4k7YrR+4S/y74IDBWHkY
 rawfF982AuoS2NjjqzDKsDYT1zTGWylW7z/H0nvsyPdUVrhzJdrFzuMMS7438yGvqlq1
 Nf8DltkC+3CK7xekpFD7VwZzxL9BH2lmsoKwbXZonAi4UYKTR4Y4fdfhqwCDopo4p9wU
 XN/g==
X-Gm-Message-State: ACrzQf0HnGBNY37nnahzikWJjXo0PFBcj7J7bnDryT9gRjyGWe9aLMB2
 /4+H4tPUI7C1yHqhu4++2j69TBpQZfsBWbO0rY1Cxg==
X-Received: by 2002:a05:6a00:181f:b0:562:8e02:ec29 with SMTP id
 y31-20020a056a00181f00b005628e02ec29mr6131359pfa.3.1665159077326; Fri, 07 Oct
 2022 09:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-33-richard.henderson@linaro.org>
 <CAFEAcA94XFJ1d0Trn08cMvxnDCxd+SGwJuG1ZQZaUb9g_FZg_Q@mail.gmail.com>
 <21eab094-34a5-6e02-6bf4-3ac4c70955dd@linaro.org>
In-Reply-To: <21eab094-34a5-6e02-6bf4-3ac4c70955dd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 17:11:05 +0100
Message-ID: <CAFEAcA8Tg2Vmy2B0a_QcF9wYMHsQUY8HhEOXhmhTF6qO_3RGtw@mail.gmail.com>
Subject: Re: [PATCH v3 32/42] target/arm: Extract HA and HD in
 aa64_va_parameters
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: YlvyW2v3wsdT

On Fri, 7 Oct 2022 at 16:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/7/22 02:24, Peter Maydell wrote:
> >> +        .ha = ha,
> >> +        .hd = ha & hd,
> >
> > This is a bitwise operation on two bools, should be && ?
>
> Bitwise works fine, but I can use boolean if you like.
>
> I'd be surprised (and filing a missed optimization bug) if the compiler treated these two
> operations differently in this case (simple bool operands with no side effects).

The different treatment I would expect would be that in the '&'
case it warns you about using a bitwise operation on a boolean :-)

-- PMM
