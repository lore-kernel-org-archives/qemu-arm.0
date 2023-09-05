Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1773675ejb;
        Mon, 4 Sep 2023 22:35:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEf+Z77ESRzen/WsFTjVptzKVLDKFWMXlmoeXS/UQAE9Fp09Szoj5EUlOoOKTujFK3HCTqu
X-Received: by 2002:ac8:4e82:0:b0:412:2dd3:e0f5 with SMTP id 2-20020ac84e82000000b004122dd3e0f5mr16130447qtp.62.1693892119125;
        Mon, 04 Sep 2023 22:35:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693892119; cv=none;
        d=google.com; s=arc-20160816;
        b=gtjvhULghy9yFjL2+nc81uq9i+dt+0pBaZODuKrJwGICcXjCpCsYguJkqRzCv288Cu
         18oHHWjBbwQma1o8PcfXTlz23ZtBSnXRx3hJ6ZbevfcFxuAedAOghjFFDDW+e3y+8hgV
         TaetATdKoJAHChcoCexwyAaKS5UyRpJcTsIjVUGW2pWUoPPyYwUX0bpxMFk4hn3O9VSY
         V8Nh49hd579E+InSNPMfiGeu/cHwv7tY89Z/wDhLxw034NST8QpMYo5WPUOJ1Himy2pB
         hLyzp1jNkh/KtC+iRwLDsHYz3wgkNgnAAE8XzCTfJqKl4j+RPzPwmnFSolQugCsOWhIR
         hBWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=EoOzTzxVyxxew796xN67XoFzfrHrpwW7ajh8aSgKiWc=;
        fh=yhmnn3P2yuzlqcnGb78zm/fqNto6/uh/Ek+vjG/+jHA=;
        b=MtO0YvDZG7loJyFEE/tDlPr4nB0blPKusgcGqj6LpuioW0ynqLSVhtG2E4eLoyCtBC
         SUXLDNQjtpToRUWvfK0fcGCo6GCtDG7d4aq/z7y3gFS1CCVlZVphw1Mm+hflSdDrLBPi
         9MelfGJeK+MgxZnqso2MTjQI/iHyatAUuQYeWbxJZE3EHWBudyCVt2S3kgiGoLVWqDqk
         Rd06lhPtlGtmXOZ83180MTftlA+YFN1tXUksiZJnFKogIgNgA7Dhsmnxu4fotAQNxZsg
         Mp8pWiZdTY7frUZEAJuJlVX+w1VJsMQdyDOoUfv8zuTKrw1Cfo4CkAdQXbG+14dTfTQM
         hDMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mail.uni-paderborn.de header.s=20170601 header.b=cDLkoijw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=uni-paderborn.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r22-20020ac85c96000000b0040fd72b981esi7455731qta.325.2023.09.04.22.35.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 22:35:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mail.uni-paderborn.de header.s=20170601 header.b=cDLkoijw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=uni-paderborn.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdOi0-0002tT-4l; Tue, 05 Sep 2023 01:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1qdOhx-0002so-Ro; Tue, 05 Sep 2023 01:34:37 -0400
Received: from nylar.uni-paderborn.de ([2001:638:502:c003::18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1qdOhu-0007Ha-QE; Tue, 05 Sep 2023 01:34:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EoOzTzxVyxxew796xN67XoFzfrHrpwW7ajh8aSgKiWc=; b=cDLkoijwlGPopx6IJZaq/2jVTD
 McBFf9gUFE/N2XCk573wgMCQUu3WWfXbxcUbJQuBUVtgLsQ7zPfRB4Y5PTLhKRK4gAHcUoC++hKBc
 raluGseioApfVn+Ka4NtC+beG4DV9CnbBV7QrYrUxpH9Djq9i6vjqzJ5nmNMJYtG4yUU=;
Date: Tue, 5 Sep 2023 07:34:18 +0200
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 qemu-block@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 06/22] target/tricore: Clean up local variable shadowing
Message-ID: <cfrlmsxf7lvcib4wvnrlflnfv2mhcydxo5m2co4jwvzxtssr4t@bdepxoopdl2y>
References: <20230904161235.84651-1-philmd@linaro.org>
 <20230904161235.84651-7-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230904161235.84651-7-philmd@linaro.org>
X-IMT-Source: Extern
X-IMT-rspamd-score: 6
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.9.5.52717, AntiVirus-Engine: 6.0.2,
 AntiVirus-Data: 2023.9.5.602000
X-Sophos-SenderHistory: ip=84.184.52.128, fs=17935277, da=181501129, mc=35,
 sc=0, hc=35, sp=0, fso=17935277, re=0, sd=0, hd=0
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::18;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=nylar.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pzeHd0dzw7Dy

On Mon, Sep 04, 2023 at 06:12:18PM +0200, Philippe Mathieu-Daudé wrote:
> Fix:
> 
>   target/tricore/translate.c:5016:18: warning: declaration of ‘temp’ shadows a previous local [-Wshadow=compatible-local]
>    5016 |             TCGv temp = tcg_constant_i32(const9);
>         |                  ^~~~
>   target/tricore/translate.c:4958:10: note: shadowed declaration is here
>    4958 |     TCGv temp;
>         |          ^~~~
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/tricore/translate.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,
Bastian
