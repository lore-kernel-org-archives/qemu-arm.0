Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp191531ejc;
        Sun, 30 Oct 2022 04:18:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6FlAviTGmeXLjnSjYrs0taZugWdznrnVaRnq96e/CzakB4l8WyYATt4rp4AXsVf/1SrHv9
X-Received: by 2002:ac8:59cb:0:b0:39a:dbc7:2424 with SMTP id f11-20020ac859cb000000b0039adbc72424mr6460113qtf.304.1667128685477;
        Sun, 30 Oct 2022 04:18:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667128685; cv=none;
        d=google.com; s=arc-20160816;
        b=TEV/rPsdhTRJ9L817mCqU1cFwUT312AQtTbuJwri7tE8HkTJM5pxZezpLZg/vR5atO
         Q4A4sgM7NzGPGoCx/6VtTd88JIaBAHwl7FJ7fVSm+WLHkpH7KGLULDqsYPxSjCLCVDfJ
         LiFQ7AfK9kHSpkubn1W3vQkXz8s34ziTQImzxK2ziz008p0ugI1hQsx9K9W6//d8FIYq
         nSIG8OFxAGpszDXDuGmmoEPuylbfNXj97gBIFaL/4KUUZ7u5VMRA53nAZW4zJNXd9dhq
         F3NQQPeaadVatErcl8Ja7atsq0YMYz4PofFaLiYW9D9I9VvI4kaWGVsWQb3rc7Sc+liG
         XQIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=mea9bZUQuyEjJ3RlfvCntNcSv2SbCc3AGE3XX2UP6bU=;
        b=yeImMYH91Bn41wgmol/NcTUHG6VPgrrw59KeYnRP6qNDjyxJwMm1KWCelURe5JX7zd
         OgUEAt2InSsjj1Nc2K7YGbmiUEvWXXeCvL6W6vGtM4swh9nRv7y2yblyLm4aYT/HgpF7
         0X6hHopQtVJTG62Hy7OhYqpNuZOkp/r+6Ft58/e4vtpMSGM4fAJXjdcA2iR5HRZiVQdS
         0NBog8juLgTyvmZKea/yZF3m0lA6zT4do/ZJqav+pzKHQBzB7g7aRKUBR8qxgLH2/L1d
         jOGwLUeFnNo7id8w2As/QAyVWLpCv6639KFjB9qhgB7kfwwKhWd9MWc7EycVa72QEtAB
         cvng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V+bMKVr5;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do56-20020a05620a2b3800b006f582368e99si2254941qkb.363.2022.10.30.04.18.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Oct 2022 04:18:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V+bMKVr5;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1op6K2-0001gX-PP; Sun, 30 Oct 2022 07:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1op6K1-0001fQ-LP
 for qemu-arm@nongnu.org; Sun, 30 Oct 2022 07:17:45 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1op6K0-0007mR-4H
 for qemu-arm@nongnu.org; Sun, 30 Oct 2022 07:17:45 -0400
Received: by mail-pl1-x633.google.com with SMTP id j12so8513150plj.5
 for <qemu-arm@nongnu.org>; Sun, 30 Oct 2022 04:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mea9bZUQuyEjJ3RlfvCntNcSv2SbCc3AGE3XX2UP6bU=;
 b=V+bMKVr5sPQFey6ICd2cLMPMLd8TKisnlkMIKE2rlVDCrfLkmgPcSNhQ2/IyQc0ffz
 wr7VdDQd7QHQxWT0uzL4TXMG3IWnoy/prYUtOld86gjnavx6Qcfx71fhmUBXq7hz8aHd
 sM0TE7Cnb6wQiK9nAaGziNZC2T6aaERtXgo1YzmuO/K+rUBe3q4KzePTKDYazFU0k3yS
 +V65pOnw1QIePPfQ191cuhzu7QbCdmoL00GWEnsMXtlh4JaEltb0KGiOXCq98JCyncxo
 AVtaF1UvJQsELoZ1b6EyJ/vznraasP3ecevbTyvxRNdtrd9WjDkofxs01h6hm6E7tD1A
 YIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mea9bZUQuyEjJ3RlfvCntNcSv2SbCc3AGE3XX2UP6bU=;
 b=ZMSVfNekCErFs9IHKkwtZTrrgRbk9ImRb6BtbgfS9V29PKulMgoEP59IWfCFYv0Ghn
 VUjuYu6WIe38yIp5Yy6uE/78FFEg1miPn38yar8zWLe+iwoZT4NAhDMcKEra4ENCOgkz
 6xBAwzBK7qhXK3nkYNRJBAnmb8A3YbcpI6J/LWLn6nzL1bsA3BvsynXf2gyo/KN0g9Yo
 oEeYmisxtzLm5fZmxZrhZS54oeE0HNkOADwBnpAiaPzYLrxOfPzZIHUzZKv4L5xEG5GW
 c0WHE1WMYeZLbRKjiKYUJ4uNQGl5SH5E9W1sRlAeS427LgLpK+a71+TxoWl1mHbXBbYY
 qQ1A==
X-Gm-Message-State: ACrzQf1QlJdJIYJxpwjHbl/M/d3C8oDQfOiKObuUxRUm+ikckf7LaWtC
 R0PXrfFLUON2xCuATZ5m4+5JfH1H9ROHuWsUFp0Acg==
X-Received: by 2002:a17:90a:164f:b0:213:bda6:2873 with SMTP id
 x15-20020a17090a164f00b00213bda62873mr5166821pje.215.1667128662611; Sun, 30
 Oct 2022 04:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221030105944.311940-1-sw@weilnetz.de>
In-Reply-To: <20221030105944.311940-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 30 Oct 2022 11:17:31 +0000
Message-ID: <CAFEAcA_w=9zj3F7YiStjEZwhm8xoNydh0sG_wwNqpyHwzwJt2w@mail.gmail.com>
Subject: Re: [PATCH v2] Fix some typos in documentation and comments
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, virtio-fs@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: aeYOJ6fq1F42

On Sun, 30 Oct 2022 at 10:59, Stefan Weil <sw@weilnetz.de> wrote:
>
> Most of them were found and fixed using codespell.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> v2: Fixes from Peter Maydell's comments
>
> My focus was fixing typos which are relevant for the generated documentation.
>
> codespell finds many more typos in source code, and adding it to the continuous
> integration checks looks more and more like a good idea.

Is it possible to set it up in a way that doesn't report
false positives ?

Anyway, for this patch:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
